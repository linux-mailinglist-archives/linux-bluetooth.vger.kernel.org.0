Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9579165798
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 Feb 2020 07:26:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgBTG0w convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 20 Feb 2020 01:26:52 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:58568 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbgBTG0w (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 20 Feb 2020 01:26:52 -0500
Received: from marcel-macpro.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 89BE2CECDB;
        Thu, 20 Feb 2020 07:36:15 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH] Bluetooth: Fix crash when using new BT_PHY option
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200220010328.10132-1-luiz.dentz@gmail.com>
Date:   Thu, 20 Feb 2020 07:26:50 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <A50805F7-FFAC-4B0A-B918-E1EA24B115F0@holtmann.org>
References: <20200220010328.10132-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This fixes the invalid check for connected socket which causes the
> following trace due to sco_pi(sk)->conn being NULL:
> 
> RIP: 0010:sco_sock_getsockopt+0x2ff/0x800 net/bluetooth/sco.c:966
> 
> L2CAP has also been fixed since it has the same problem.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/l2cap_sock.c | 2 +-
> net/bluetooth/sco.c        | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
> index 9fb47b2b13c9..305710446e66 100644
> --- a/net/bluetooth/l2cap_sock.c
> +++ b/net/bluetooth/l2cap_sock.c
> @@ -605,7 +605,7 @@ static int l2cap_sock_getsockopt(struct socket *sock, int level, int optname,
> 		break;
> 
> 	case BT_PHY:
> -		if (sk->sk_state == BT_CONNECTED) {
> +		if (sk->sk_state != BT_CONNECTED) {
> 			err = -ENOTCONN;
> 			break;
> 		}
> diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
> index 29ab3e12fb46..c8c3d38cdc7b 100644
> --- a/net/bluetooth/sco.c
> +++ b/net/bluetooth/sco.c
> @@ -958,7 +958,7 @@ static int sco_sock_getsockopt(struct socket *sock, int level, int optname,
> 		break;
> 
> 	case BT_PHY:
> -		if (sk->sk_state == BT_CONNECTED) {
> +		if (sk->sk_state != BT_CONNECTED) {
> 			err = -ENOTCONN;
> 			break;
> 		}

is there something wrong with your mailer? I have this patch 3 times and already applied one of them to bluetooth-next. Is the one incorrect?

Regards

Marcel

