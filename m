Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18B21F7DB9
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 Jun 2020 21:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgFLTmL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 12 Jun 2020 15:42:11 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:50867 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLTmL (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 12 Jun 2020 15:42:11 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1B55BCED0A;
        Fri, 12 Jun 2020 21:52:00 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] bluetooth: Fix op_code size entry from the previous patch
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200612193358.203186-1-alainm@chromium.org>
Date:   Fri, 12 Jun 2020 21:42:09 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <FCDEE47E-B787-4B64-A57B-00EB213AE0CD@holtmann.org>
References: <20200612193358.203186-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> The previous applied patch introduced an error that was not present in
> the submitted patch here: https://patchwork.kernel.org/patch/11599123/
> 
> In particular MGMT_SET_DEF_SYSTEM_CONFIG_SIZE was introduced but
> MGMT_SET_DEF_SYSTEM_CONFIG was used.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> net/bluetooth/mgmt.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 2e0f976e7e04..99fbfd467d04 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -7303,7 +7303,7 @@ static const struct hci_mgmt_handler mgmt_handlers[] = {
> 						HCI_MGMT_HDEV_OPTIONAL },
> 	{ read_def_system_config,  MGMT_READ_DEF_SYSTEM_CONFIG_SIZE,
> 						HCI_MGMT_UNTRUSTED },
> -	{ set_def_system_config,   MGMT_SET_DEF_SYSTEM_CONFIG,
> +	{ set_def_system_config,   MGMT_SET_DEF_SYSTEM_CONFIG_SIZE,
> 						HCI_MGMT_VAR_LEN },

This was me being stupid. I had this fixed up in my tree, but forgot to amend the commit. I force pushed a correct commit to bluetooth-next now.

Regards

Marcel

