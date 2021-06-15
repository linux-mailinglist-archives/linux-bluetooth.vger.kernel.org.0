Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA0C3A89AA
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Jun 2021 21:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhFOTj6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 15 Jun 2021 15:39:58 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58166 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbhFOTj5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 15 Jun 2021 15:39:57 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 0BA90CECFB;
        Tue, 15 Jun 2021 21:45:53 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v9 06/10] Bluetooth: Add a callback function to set data
 path
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210608122455.19583-6-kiran.k@intel.com>
Date:   Tue, 15 Jun 2021 21:37:52 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <E0405CB1-6273-4DD3-B603-DC497BAFBE6D@holtmann.org>
References: <20210608122455.19583-1-kiran.k@intel.com>
 <20210608122455.19583-6-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> In HFP offload usecase, Intel controllers require offload use
> case id (NBS or WBS) to be set before opening SCO connection. Define
> a new callback which gets called on setsockopt SCO socket. User space
> audio module is expected to set codec via setsockopt(sk, BT_CODEC, ....)
> before opening SCO connection.
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
> ---
> include/net/bluetooth/hci_core.h | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
> index 641477396da3..ad0024891447 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -618,6 +618,8 @@ struct hci_dev {
> 	void (*cmd_timeout)(struct hci_dev *hdev);
> 	bool (*prevent_wake)(struct hci_dev *hdev);
> 	int (*get_data_path)(struct hci_dev *hdev);
> +	int (*set_data_path)(struct hci_dev *hdev, __u8 type,
> +			     struct bt_codec *codec);
> };
> 

same as the other one, this needs to also provide the user of hdev->set_data_path.

Regards

Marcel

