Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 113F119F57C
	for <lists+linux-bluetooth@lfdr.de>; Mon,  6 Apr 2020 14:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727732AbgDFMEi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 6 Apr 2020 08:04:38 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:36513 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbgDFMEi (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 6 Apr 2020 08:04:38 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 54F5DCECC3;
        Mon,  6 Apr 2020 14:14:11 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] Bluetooth: Always request for user confirmation for Just
 Works (LE SC)
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200404000439.12219-1-sonnysasaka@chromium.org>
Date:   Mon, 6 Apr 2020 14:04:36 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <DB9E4FAE-C54D-4158-ACE3-45B62C85E2CB@holtmann.org>
References: <20200404000439.12219-1-sonnysasaka@chromium.org>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> To improve security, always give the user-space daemon a chance to
> accept or reject a Just Works pairing (LE). The daemon may decide to
> auto-accept based on the user's intent.
> 
> This patch is similar to the previous patch but applies for LE Secure
> Connections (SC).
> 
> Signed-off-by: Sonny Sasaka <sonnysasaka@chromium.org>
> ---
> net/bluetooth/smp.c | 14 +++++++++++++-
> 1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
> index d0b695ee49f6..daf03339dedd 100644
> --- a/net/bluetooth/smp.c
> +++ b/net/bluetooth/smp.c
> @@ -2202,7 +2202,7 @@ static u8 smp_cmd_pairing_random(struct l2cap_conn *conn, struct sk_buff *skb)
> 	if (err)
> 		return SMP_UNSPECIFIED;
> 
> -	if (smp->method == JUST_WORKS || smp->method == REQ_OOB) {
> +	if (smp->method == REQ_OOB) {
> 		if (hcon->out) {
> 			sc_dhkey_check(smp);
> 			SMP_ALLOW_CMD(smp, SMP_CMD_DHKEY_CHECK);
> @@ -2210,6 +2210,18 @@ static u8 smp_cmd_pairing_random(struct l2cap_conn *conn, struct sk_buff *skb)
> 		return 0;
> 	}
> 
> +	/* If Just Works, ask user-space for confirmation. */
> +	if (smp->method == JUST_WORKS) {
> +		err = mgmt_user_confirm_request(hcon->hdev, &hcon->dst,
> +				hcon->type, hcon->dst_type, passkey, 1);
> +		if (err)
> +			return SMP_UNSPECIFIED;
> +
> +		set_bit(SMP_FLAG_WAIT_USER, &smp->flags);
> +
> +		return 0;
> +	}
> +
> 	err = smp_g2(smp->tfm_cmac, pkax, pkbx, na, nb, &passkey);
> 	if (err)
> 		return SMP_UNSPECIFIED;

@@ -2202,7 +2204,7 @@ static u8 smp_cmd_pairing_random(struct l2cap_conn *conn, struct sk_buff *skb)
        if (err)
                return SMP_UNSPECIFIED;
 
-       if (smp->method == JUST_WORKS || smp->method == REQ_OOB) {
+       if (smp->method == REQ_OOB) {
                if (hcon->out) {
                        sc_dhkey_check(smp);
                        SMP_ALLOW_CMD(smp, SMP_CMD_DHKEY_CHECK);
@@ -2214,7 +2216,10 @@ static u8 smp_cmd_pairing_random(struct l2cap_conn *conn, struct sk_buff *skb)
        if (err)
                return SMP_UNSPECIFIED;
 
-       confirm_hint = 0;
+       if (smp->method == JUST_WORKS)
+               confirm_hint = 0;
+       else
+               confirm_hint = 1;
 
 confirm:
        err = mgmt_user_confirm_request(hcon->hdev, &hcon->dst, hcon->type,

Isn’t this what you are actually doing (minus the required comment of course)?

Regards

Marcel

