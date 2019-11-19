Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49224101935
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 Nov 2019 07:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbfKSGQZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 19 Nov 2019 01:16:25 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:53106 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727599AbfKSGQZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 19 Nov 2019 01:16:25 -0500
Received: from marcel-macbook.holtmann.net (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id A925CCECEE;
        Tue, 19 Nov 2019 07:25:30 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v2] bluetooth: bcm: Use HCI_QUIRK_USE_BDADDR_PROPERTY
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191119060221.3297340-1-a.heider@gmail.com>
Date:   Tue, 19 Nov 2019 07:16:23 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, Ondrej Jirman <megous@megous.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Content-Transfer-Encoding: 8BIT
Message-Id: <4DB6C9B7-8454-449C-90B4-4A1B3AD82495@holtmann.org>
References: <20191119060221.3297340-1-a.heider@gmail.com>
To:     Andre Heider <a.heider@gmail.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Andre,

> Some devices ship with the controller default address, like the
> Orange Pi 3 (BCM4345C5).
> 
> Allow the bootloader to set a valid address through the device tree.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>
> ---
> drivers/bluetooth/btbcm.c | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> index 2d2e6d862068..9d16162d01ea 100644
> --- a/drivers/bluetooth/btbcm.c
> +++ b/drivers/bluetooth/btbcm.c
> @@ -439,6 +439,7 @@ int btbcm_finalize(struct hci_dev *hdev)
> 	btbcm_check_bdaddr(hdev);
> 
> 	set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
> +	set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
> 
> 	return 0;
> }

have you actually tested this? I might be mistaken, but the code that I read in hci_dev_do_open() would drop this into unconfigured state since HCI_QURIK_INVALID_BDADDR is still set.

Regards

Marcel

