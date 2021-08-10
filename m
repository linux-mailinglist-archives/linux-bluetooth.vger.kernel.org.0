Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD7FD3D65EE
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jul 2021 19:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232031AbhGZRAK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 26 Jul 2021 13:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbhGZQ76 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 26 Jul 2021 12:59:58 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFB6C061757
        for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jul 2021 10:40:26 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id s19so16130316ybc.6
        for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jul 2021 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tfs+u91aMae9jZZtgelNi8fmrZwTVrePIBNc7fVPT6M=;
        b=Dzi8+leyUpfv8pxn8urnmL06C7kkY3KOBCzmR/HU7KcdqEjKXzBMLMxyvESQ4+t16D
         cAaP0vn33XYmvvG5c4gTilHfKYRfddFJhXIs5wndK2VkA7cMBAoApLIrhCyZdlP4XNtq
         z05E/rAbBv+GCv7PuxvNbmIigzjZ+sdLNaj5vMN15CdDMUqshIunjws0Lzi5x+1gKhtV
         6PYIu26Z+vL4uGo6XXuOSYLtXMXvyIMNG28eGvCjlMeicSZEF6l8Mx8NAXFLVa/V8oLc
         PqGRCBFxSRSNO6KpMAtD8yhxKNJsphJbY7Xyvq+7cexZt7LASdARYKDLwJz9WBtkn98h
         qidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tfs+u91aMae9jZZtgelNi8fmrZwTVrePIBNc7fVPT6M=;
        b=A0Mev4s1+HjFZ3kjy61qfQIvHCNC5zNO3W4ALUFe11CobD3Nx5KeQ9D0iIGm1tDBs8
         JX7Exrl1P/N3GVJavz7mEDw7w8NLtCi3CQrIC3UADocoUkaUF+2RRvCzWPZZFZrRiDSi
         ylm5u36HU/K6BsVq+Tpbj9Vysd4fvQr9vvouvWzv/P7E8wKbgYkMCDVFdRabJnQMmvs2
         gjhR47wKrRHr49UwJFiD7BWG6r7Pbc8hFn5kYOSMQ7XrWqH0TqSjtbxTittcr41/NiK5
         FIP0G3yhkwJuC70DvObJxoiO1NlgU8pAjwReYuwl8FBl87au5l8oSpoOEmUxDSxTp43x
         6r2w==
X-Gm-Message-State: AOAM531g2bBt7JV5osfSXFxt62oeXpQ3kV2QWyNoMB5FN1rdWCHHuNsE
        FLQgnA+N4aYwEmwhJxCdtShHLJOTyn77A0zo5qY=
X-Google-Smtp-Source: ABdhPJxM8PaPjpacyvE1Mdg3kCgZA7kZ9A1nXeZxOHFwvXTTuWOL2CvG7UQbqVZtjdpAKavihvG78xEuU4PSm4w95ck=
X-Received: by 2002:a25:7647:: with SMTP id r68mr26584162ybc.432.1627321225583;
 Mon, 26 Jul 2021 10:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210724140331.3465-1-penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20210724140331.3465-1-penguin-kernel@I-love.SAKURA.ne.jp>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Mon, 26 Jul 2021 10:40:14 -0700
Message-ID: <CABBYNZLw-1xofLwsNYEcb7auN6KorPTLh3ZOWFR4V6n4knOT-g@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: use helper function for monitor's open/close notifications
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Tetsuo,

On Sat, Jul 24, 2021 at 7:03 AM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> hci_sock.c has many
> hci_send_to_channel(HCI_CHANNEL_MONITOR, skb, HCI_SOCK_TRUSTED, NULL);
> calls. Use helper functions and replace skb with sk.
>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
>  net/bluetooth/hci_sock.c | 96 ++++++++++++++++------------------------
>  1 file changed, 37 insertions(+), 59 deletions(-)
>
> diff --git a/net/bluetooth/hci_sock.c b/net/bluetooth/hci_sock.c
> index 786a06a232fd..fc2336855dab 100644
> --- a/net/bluetooth/hci_sock.c
> +++ b/net/bluetooth/hci_sock.c
> @@ -295,6 +295,11 @@ void hci_send_to_channel(unsigned short channel, struct sk_buff *skb,
>         read_unlock(&hci_sk_list.lock);
>  }
>
> +static void __hci_send_to_monitor(struct sk_buff *skb)
> +{

We can probably have the checks of NULL skb added directly here and
perhaps kfree_skb as well since it seems it is always a copy that is
sent here, the hci_send_to_monitor don't have __ prefix so I wonder
why you have chosen to use it?

> +       hci_send_to_channel(HCI_CHANNEL_MONITOR, skb, HCI_SOCK_TRUSTED, NULL);
> +}
> +
>  /* Send frame to monitor socket */
>  void hci_send_to_monitor(struct hci_dev *hdev, struct sk_buff *skb)
>  {
> @@ -350,8 +355,7 @@ void hci_send_to_monitor(struct hci_dev *hdev, struct sk_buff *skb)
>         hdr->index = cpu_to_le16(hdev->id);
>         hdr->len = cpu_to_le16(skb->len);
>
> -       hci_send_to_channel(HCI_CHANNEL_MONITOR, skb_copy,
> -                           HCI_SOCK_TRUSTED, NULL);
> +       __hci_send_to_monitor(skb_copy);
>         kfree_skb(skb_copy);
>  }
>
> @@ -545,6 +549,16 @@ static struct sk_buff *create_monitor_ctrl_open(struct sock *sk)
>         return skb;
>  }
>
> +static void hci_monitor_ctrl_open(struct sock *sk)
> +{
> +       struct sk_buff *skb = create_monitor_ctrl_open(sk);
> +
> +       if (skb) {
> +               __hci_send_to_monitor(skb);
> +               kfree_skb(skb);
> +       }
> +}
> +
>  static struct sk_buff *create_monitor_ctrl_close(struct sock *sk)
>  {
>         struct hci_mon_hdr *hdr;
> @@ -583,6 +597,16 @@ static struct sk_buff *create_monitor_ctrl_close(struct sock *sk)
>         return skb;
>  }
>
> +static void hci_monitor_ctrl_close(struct sock *sk)
> +{
> +       struct sk_buff *skb = create_monitor_ctrl_close(sk);
> +
> +       if (skb) {
> +               __hci_send_to_monitor(skb);
> +               kfree_skb(skb);
> +       }
> +}
> +
>  static struct sk_buff *create_monitor_ctrl_command(struct sock *sk, u16 index,
>                                                    u16 opcode, u16 len,
>                                                    const void *buf)
> @@ -741,8 +765,7 @@ void hci_sock_dev_event(struct hci_dev *hdev, int event)
>                 /* Send event to monitor */
>                 skb = create_monitor_event(hdev, event);
>                 if (skb) {
> -                       hci_send_to_channel(HCI_CHANNEL_MONITOR, skb,
> -                                           HCI_SOCK_TRUSTED, NULL);
> +                       __hci_send_to_monitor(skb);
>                         kfree_skb(skb);
>                 }
>         }
> @@ -859,7 +882,6 @@ static int hci_sock_release(struct socket *sock)
>  {
>         struct sock *sk = sock->sk;
>         struct hci_dev *hdev;
> -       struct sk_buff *skb;
>
>         BT_DBG("sock %p sk %p", sock, sk);
>
> @@ -876,12 +898,7 @@ static int hci_sock_release(struct socket *sock)
>         case HCI_CHANNEL_USER:
>         case HCI_CHANNEL_CONTROL:
>                 /* Send event to monitor */
> -               skb = create_monitor_ctrl_close(sk);
> -               if (skb) {
> -                       hci_send_to_channel(HCI_CHANNEL_MONITOR, skb,
> -                                           HCI_SOCK_TRUSTED, NULL);
> -                       kfree_skb(skb);
> -               }
> +               hci_monitor_ctrl_close(sk);
>
>                 hci_sock_free_cookie(sk);
>                 break;
> @@ -1021,18 +1038,11 @@ static int hci_sock_ioctl(struct socket *sock, unsigned int cmd,
>          * of a given socket.
>          */
>         if (hci_sock_gen_cookie(sk)) {
> -               struct sk_buff *skb;
> -
>                 if (capable(CAP_NET_ADMIN))
>                         hci_sock_set_flag(sk, HCI_SOCK_TRUSTED);
>
>                 /* Send event to monitor */
> -               skb = create_monitor_ctrl_open(sk);
> -               if (skb) {
> -                       hci_send_to_channel(HCI_CHANNEL_MONITOR, skb,
> -                                           HCI_SOCK_TRUSTED, NULL);
> -                       kfree_skb(skb);
> -               }
> +               hci_monitor_ctrl_open(sk);
>         }
>
>         release_sock(sk);
> @@ -1114,7 +1124,6 @@ static int hci_sock_bind(struct socket *sock, struct sockaddr *addr,
>         struct sockaddr_hci haddr;
>         struct sock *sk = sock->sk;
>         struct hci_dev *hdev = NULL;
> -       struct sk_buff *skb;
>         int len, err = 0;
>
>         BT_DBG("sock %p sk %p", sock, sk);
> @@ -1162,12 +1171,7 @@ static int hci_sock_bind(struct socket *sock, struct sockaddr *addr,
>                          * notification. Send a close notification first to
>                          * allow the state transition to bounded.
>                          */
> -                       skb = create_monitor_ctrl_close(sk);
> -                       if (skb) {
> -                               hci_send_to_channel(HCI_CHANNEL_MONITOR, skb,
> -                                                   HCI_SOCK_TRUSTED, NULL);
> -                               kfree_skb(skb);
> -                       }
> +                       hci_monitor_ctrl_close(sk);
>                 }
>
>                 if (capable(CAP_NET_ADMIN))
> @@ -1176,12 +1180,7 @@ static int hci_sock_bind(struct socket *sock, struct sockaddr *addr,
>                 hci_pi(sk)->hdev = hdev;
>
>                 /* Send event to monitor */
> -               skb = create_monitor_ctrl_open(sk);
> -               if (skb) {
> -                       hci_send_to_channel(HCI_CHANNEL_MONITOR, skb,
> -                                           HCI_SOCK_TRUSTED, NULL);
> -                       kfree_skb(skb);
> -               }
> +               hci_monitor_ctrl_open(sk);
>                 break;
>
>         case HCI_CHANNEL_USER:
> @@ -1251,12 +1250,7 @@ static int hci_sock_bind(struct socket *sock, struct sockaddr *addr,
>                          * a user channel socket. For a clean transition, send
>                          * the close notification first.
>                          */
> -                       skb = create_monitor_ctrl_close(sk);
> -                       if (skb) {
> -                               hci_send_to_channel(HCI_CHANNEL_MONITOR, skb,
> -                                                   HCI_SOCK_TRUSTED, NULL);
> -                               kfree_skb(skb);
> -                       }
> +                       hci_monitor_ctrl_close(sk);
>                 }
>
>                 /* The user channel is restricted to CAP_NET_ADMIN
> @@ -1267,12 +1261,7 @@ static int hci_sock_bind(struct socket *sock, struct sockaddr *addr,
>                 hci_pi(sk)->hdev = hdev;
>
>                 /* Send event to monitor */
> -               skb = create_monitor_ctrl_open(sk);
> -               if (skb) {
> -                       hci_send_to_channel(HCI_CHANNEL_MONITOR, skb,
> -                                           HCI_SOCK_TRUSTED, NULL);
> -                       kfree_skb(skb);
> -               }
> +               hci_monitor_ctrl_open(sk);
>
>                 atomic_inc(&hdev->promisc);
>                 break;
> @@ -1359,21 +1348,11 @@ static int hci_sock_bind(struct socket *sock, struct sockaddr *addr,
>                                  * allow for a clean transition, send the
>                                  * close notification first.
>                                  */
> -                               skb = create_monitor_ctrl_close(sk);
> -                               if (skb) {
> -                                       hci_send_to_channel(HCI_CHANNEL_MONITOR, skb,
> -                                                           HCI_SOCK_TRUSTED, NULL);
> -                                       kfree_skb(skb);
> -                               }
> +                               hci_monitor_ctrl_close(sk);
>                         }
>
>                         /* Send event to monitor */
> -                       skb = create_monitor_ctrl_open(sk);
> -                       if (skb) {
> -                               hci_send_to_channel(HCI_CHANNEL_MONITOR, skb,
> -                                                   HCI_SOCK_TRUSTED, NULL);
> -                               kfree_skb(skb);
> -                       }
> +                       hci_monitor_ctrl_open(sk);
>
>                         hci_sock_set_flag(sk, HCI_MGMT_INDEX_EVENTS);
>                         hci_sock_set_flag(sk, HCI_MGMT_UNCONF_INDEX_EVENTS);
> @@ -1559,8 +1538,7 @@ static int hci_mgmt_cmd(struct hci_mgmt_chan *chan, struct sock *sk,
>                 skb = create_monitor_ctrl_command(sk, index, opcode, len,
>                                                   buf + sizeof(*hdr));
>                 if (skb) {
> -                       hci_send_to_channel(HCI_CHANNEL_MONITOR, skb,
> -                                           HCI_SOCK_TRUSTED, NULL);
> +                       __hci_send_to_monitor(skb);
>                         kfree_skb(skb);
>                 }
>         }
> @@ -1715,7 +1693,7 @@ static int hci_logging_frame(struct sock *sk, struct msghdr *msg, int len)
>
>         hdr->opcode = cpu_to_le16(HCI_MON_USER_LOGGING);
>
> -       hci_send_to_channel(HCI_CHANNEL_MONITOR, skb, HCI_SOCK_TRUSTED, NULL);
> +       __hci_send_to_monitor(skb);
>         err = len;
>
>         if (hdev)
> --
> 2.18.4
>


-- 
Luiz Augusto von Dentz
