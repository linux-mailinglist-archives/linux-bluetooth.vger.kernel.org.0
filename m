Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97765BEBF2
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Sep 2019 08:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390140AbfIZGZe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 26 Sep 2019 02:25:34 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:46067 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728905AbfIZGZe (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 26 Sep 2019 02:25:34 -0400
Received: from marcel-macpro.fritz.box (p4FEFC197.dip0.t-ipconnect.de [79.239.193.151])
        by mail.holtmann.org (Postfix) with ESMTPSA id DC368CECD9;
        Thu, 26 Sep 2019 08:34:25 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] Bluetooth: btusb: print FW version after FW download
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1569405826-4555-1-git-send-email-amit.k.bag@intel.com>
Date:   Thu, 26 Sep 2019 08:25:32 +0200
Cc:     linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com,
        chethan.tumkur.narayan@intel.com
Content-Transfer-Encoding: 8BIT
Message-Id: <EB27BBF5-DB98-4C67-904B-6EA11C800008@holtmann.org>
References: <1569405826-4555-1-git-send-email-amit.k.bag@intel.com>
To:     Amit K Bag <amit.k.bag@intel.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Amit,

> After FW download there is no print to confirm the current
> FW version. Add print to check FW version incase of FW download.
> 
> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> ---
> drivers/bluetooth/btusb.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index a9c35ebb30f8..f6c033b5042c 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2432,6 +2432,14 @@ static int btusb_setup_intel_new(struct hci_dev *hdev)
> 	 */
> 	btintel_set_event_mask(hdev, false);
> 
> +	/* Read the Intel version information after loading the FW  */
> +	err = btintel_read_version(hdev, &ver);
> +	if (err)
> +		return err;
> +
> +	btintel_version_info(hdev, &ver);
> +	bt_dev_info(hdev, "Setup complete");
> +

I rather not add an extra Setup complete since that is rather noisy. We can add the extra version information if that adds value.

Regards

Marcel

