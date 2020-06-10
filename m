Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1A11F5036
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jun 2020 10:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgFJIZL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Jun 2020 04:25:11 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:55679 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbgFJIZL (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Jun 2020 04:25:11 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 58EFACECE0;
        Wed, 10 Jun 2020 10:34:59 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] sco:Add support for BT_PKT_STATUS CMSG data
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200603145121.124842-1-alainm@chromium.org>
Date:   Wed, 10 Jun 2020 10:25:09 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <DCF83E8F-62CC-49F8-B660-0AFEDBED5F02@holtmann.org>
References: <20200603145121.124842-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This change adds support for reporting the BT_PKT_STATUS to the socket
> CMSG data to allow the implementation of a packet loss correction on
> erronous data received on the SCO socket.
> 
> The patch was partially developed by Marcel Holtmann and validated by
> Hsin-yu Chao
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> 
> ---
> 
> include/net/bluetooth/bluetooth.h |  8 +++++++
> include/net/bluetooth/sco.h       |  3 +++
> net/bluetooth/af_bluetooth.c      |  3 +++
> net/bluetooth/hci_core.c          |  1 +
> net/bluetooth/sco.c               | 35 +++++++++++++++++++++++++++++++
> 5 files changed, 50 insertions(+)

I already had this patch in my tree for testing, but then realized that I gave you a bad example on how to handle this.

So we should not use the same constants for CMSG and socket options. Fundamentally the socket semantics use SO_foo for enabling an aux data transmission and they use SCM_bar for the CMSG portion.

> 
> diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
> index 3fa7b1e3c5d9..85e6c5754448 100644
> --- a/include/net/bluetooth/bluetooth.h
> +++ b/include/net/bluetooth/bluetooth.h
> @@ -147,6 +147,8 @@ struct bt_voice {
> #define BT_MODE_LE_FLOWCTL	0x03
> #define BT_MODE_EXT_FLOWCTL	0x04
> 
> +#define BT_PKT_STATUS          16
> +
> __printf(1, 2)
> void bt_info(const char *fmt, ...);
> __printf(1, 2)
> @@ -275,6 +277,7 @@ struct bt_sock {
> 	struct sock *parent;
> 	unsigned long flags;
> 	void (*skb_msg_name)(struct sk_buff *, void *, int *);
> +	void (*skb_put_cmsg)(struct sk_buff *, struct msghdr *, struct sock *);
> };
> 
> enum {
> @@ -324,6 +327,10 @@ struct l2cap_ctrl {
> 	struct l2cap_chan *chan;
> };
> 
> +struct sco_ctrl {
> +	u8	pkt_status;
> +};
> +
> struct hci_dev;
> 
> typedef void (*hci_req_complete_t)(struct hci_dev *hdev, u8 status, u16 opcode);
> @@ -350,6 +357,7 @@ struct bt_skb_cb {
> 	u8 incoming:1;
> 	union {
> 		struct l2cap_ctrl l2cap;
> +		struct sco_ctrl sco;
> 		struct hci_ctrl hci;
> 	};
> };
> diff --git a/include/net/bluetooth/sco.h b/include/net/bluetooth/sco.h
> index f40ddb4264fc..7f0d7bdc53f6 100644
> --- a/include/net/bluetooth/sco.h
> +++ b/include/net/bluetooth/sco.h
> @@ -46,4 +46,7 @@ struct sco_conninfo {
> 	__u8  dev_class[3];
> };
> 
> +/* CMSG flags */
> +#define SCO_CMSG_PKT_STATUS	0x0001
> +
> #endif /* __SCO_H */
> diff --git a/net/bluetooth/af_bluetooth.c b/net/bluetooth/af_bluetooth.c
> index 3fd124927d4d..d0abea8d08cc 100644
> --- a/net/bluetooth/af_bluetooth.c
> +++ b/net/bluetooth/af_bluetooth.c
> @@ -286,6 +286,9 @@ int bt_sock_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
> 		if (msg->msg_name && bt_sk(sk)->skb_msg_name)
> 			bt_sk(sk)->skb_msg_name(skb, msg->msg_name,
> 						&msg->msg_namelen);
> +
> +		if (bt_sk(sk)->skb_put_cmsg)
> +			bt_sk(sk)->skb_put_cmsg(skb, msg, sk);
> 	}
> 
> 	skb_free_datagram(sk, skb);
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 51d399273276..7b5e46198d99 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -4549,6 +4549,7 @@ static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
> 
> 	if (conn) {
> 		/* Send to upper protocol */
> +		bt_cb(skb)->sco.pkt_status = flags & 0x03;
> 		sco_recv_scodata(conn, skb);
> 		return;
> 	} else {
> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> index c8c3d38cdc7b..f6b54853e547 100644
> --- a/net/bluetooth/sco.c
> +++ b/net/bluetooth/sco.c
> @@ -66,6 +66,7 @@ struct sco_pinfo {
> 	bdaddr_t	dst;
> 	__u32		flags;
> 	__u16		setting;
> +	__u32           cmsg_mask;
> 	struct sco_conn	*conn;
> };
> 
> @@ -449,6 +450,15 @@ static void sco_sock_close(struct sock *sk)
> 	sco_sock_kill(sk);
> }
> 
> +static void sco_skb_put_cmsg(struct sk_buff *skb, struct msghdr *msg,
> +			     struct sock *sk)
> +{
> +	if (sco_pi(sk)->cmsg_mask & SCO_CMSG_PKT_STATUS)
> +		put_cmsg(msg, SOL_BLUETOOTH, BT_PKT_STATUS,

This needs an extra BT_SCM_PKT_STATUS constant.

> +			 sizeof(bt_cb(skb)->sco.pkt_status),
> +			 &bt_cb(skb)->sco.pkt_status);
> +}
> +
> static void sco_sock_init(struct sock *sk, struct sock *parent)
> {
> 	BT_DBG("sk %p", sk);
> @@ -457,6 +467,8 @@ static void sco_sock_init(struct sock *sk, struct sock *parent)
> 		sk->sk_type = parent->sk_type;
> 		bt_sk(sk)->flags = bt_sk(parent)->flags;
> 		security_sk_clone(parent, sk);
> +	} else {
> +		bt_sk(sk)->skb_put_cmsg = sco_skb_put_cmsg;
> 	}
> }
> 
> @@ -846,6 +858,18 @@ static int sco_sock_setsockopt(struct socket *sock, int level, int optname,
> 		sco_pi(sk)->setting = voice.setting;
> 		break;
> 
> +	case BT_PKT_STATUS:
> +		if (get_user(opt, (u32 __user *)optval)) {
> +			err = -EFAULT;
> +			break;
> +		}
> +
> +		if (opt)
> +			sco_pi(sk)->cmsg_mask |= SCO_CMSG_PKT_STATUS;
> +		else
> +			sco_pi(sk)->cmsg_mask &= ~SCO_CMSG_PKT_STATUS;
> +		break;
> +
> 	default:
> 		err = -ENOPROTOOPT;
> 		break;
> @@ -923,6 +947,7 @@ static int sco_sock_getsockopt(struct socket *sock, int level, int optname,
> 	int len, err = 0;
> 	struct bt_voice voice;
> 	u32 phys;
> +	u32 pkt_status;

Lets follow the example of SO_TIMESTAMP and use int here and convert it to a bool meaning. Since the BT_PKT_STATUS really is just suppose to enable / disable sending the packet status.

> 
> 	BT_DBG("sk %p", sk);
> 
> @@ -969,6 +994,16 @@ static int sco_sock_getsockopt(struct socket *sock, int level, int optname,
> 			err = -EFAULT;
> 		break;
> 
> +	case BT_PKT_STATUS:
> +		if (sco_pi(sk)->cmsg_mask & SCO_CMSG_PKT_STATUS)
> +			pkt_status = 1;
> +		else
> +			pkt_status = 0;
> +
> +		if (put_user(pkt_status, (u32 __user *)optval))
> +			err = -EFAULT;
> +		break;
> +
> 	default:
> 		err = -ENOPROTOOPT;
> 		break;

Regards

Marcel

