Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A97FF3133B3
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Feb 2021 14:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhBHNuv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 8 Feb 2021 08:50:51 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:34854 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbhBHNuq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 8 Feb 2021 08:50:46 -0500
Received: from marcel-macbook.holtmann.net (p4ff9f5d2.dip0.t-ipconnect.de [79.249.245.210])
        by mail.holtmann.org (Postfix) with ESMTPSA id 91B33CED06;
        Mon,  8 Feb 2021 14:57:32 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH 1/1] Bluetooth: Fix Just-Works re-pairing
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210206141423.13593-2-matias.karhumaa@gmail.com>
Date:   Mon, 8 Feb 2021 14:50:03 +0100
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <1F3AE31B-17F0-4FEA-AC75-472DC7C8E1B0@holtmann.org>
References: <20210206141423.13593-1-matias.karhumaa@gmail.com>
 <20210206141423.13593-2-matias.karhumaa@gmail.com>
To:     Matias Karhumaa <matias.karhumaa@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Matias,

> Fix Just-Works pairing responder role in case where LTK already exists.
> Currently when trying to initiate re-pairing from another device
> against Linux using Just-Works, pairing fails due to DHKey check failure
> on Linux side. This happens because mackey calculation is skipped
> totally if LTK already exists due to logic flaw in
> smp_cmd_pairing_random() function.
> 
> With this fix mackey is calculated right before requesting confirmation
> for Just-Works pairing from userspace which in turn fixes the DHKey
> calculation.
> 
> Fixes: eed467b517e8 ("Bluetooth: fix passkey uninitialized when used")
> Signed-off-by: Matias Karhumaa <matias.karhumaa@gmail.com>
> ---
> net/bluetooth/smp.c | 37 +++++++++----------------------------
> 1 file changed, 9 insertions(+), 28 deletions(-)
> 
> diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
> index b0c1ee110eff..c3ea50fcac6d 100644
> --- a/net/bluetooth/smp.c
> +++ b/net/bluetooth/smp.c
> @@ -2122,7 +2122,7 @@ static u8 smp_cmd_pairing_random(struct l2cap_conn *conn, struct sk_buff *skb)
> 	struct smp_chan *smp = chan->data;
> 	struct hci_conn *hcon = conn->hcon;
> 	u8 *pkax, *pkbx, *na, *nb, confirm_hint;
> -	u32 passkey;
> +	u32 passkey = 0;
> 	int err;
> 
> 	BT_DBG("conn %p", conn);
> @@ -2174,24 +2174,6 @@ static u8 smp_cmd_pairing_random(struct l2cap_conn *conn, struct sk_buff *skb)
> 		smp_send_cmd(conn, SMP_CMD_PAIRING_RANDOM, sizeof(smp->prnd),
> 			     smp->prnd);
> 		SMP_ALLOW_CMD(smp, SMP_CMD_DHKEY_CHECK);
> -
> -		/* Only Just-Works pairing requires extra checks */
> -		if (smp->method != JUST_WORKS)
> -			goto mackey_and_ltk;
> -
> -		/* If there already exists long term key in local host, leave
> -		 * the decision to user space since the remote device could
> -		 * be legitimate or malicious.
> -		 */
> -		if (hci_find_ltk(hcon->hdev, &hcon->dst, hcon->dst_type,
> -				 hcon->role)) {
> -			/* Set passkey to 0. The value can be any number since
> -			 * it'll be ignored anyway.
> -			 */
> -			passkey = 0;
> -			confirm_hint = 1;
> -			goto confirm;
> -		}
> 	}

I have a concern if we just remove such a comment. I think the commit message needs a bit more explanatory and this needs a few more reviews.

Regards

Marcel

