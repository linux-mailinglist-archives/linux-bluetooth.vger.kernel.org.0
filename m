Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 406E64EF8F4
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Apr 2022 19:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350018AbiDARb2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 Apr 2022 13:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243872AbiDARbZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 Apr 2022 13:31:25 -0400
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 35EA61AAA4E
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 Apr 2022 10:29:31 -0700 (PDT)
Received: from smtpclient.apple (p4ff9fa3c.dip0.t-ipconnect.de [79.249.250.60])
        by mail.holtmann.org (Postfix) with ESMTPSA id A33B6CED02;
        Fri,  1 Apr 2022 19:29:30 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v3 2/3] Bluetooth: Print broken quirks
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220330182552.2613523-2-luiz.dentz@gmail.com>
Date:   Fri, 1 Apr 2022 19:29:30 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <6AFB6D57-1342-445D-A9CC-C761DB356E16@holtmann.org>
References: <20220330182552.2613523-1-luiz.dentz@gmail.com>
 <20220330182552.2613523-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This prints warnings for controllers setting broken quirks to increase
> their visibility and warn about broken controllers firmware that
> probably needs updates to behave properly.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_sync.c | 53 +++++++++++++++++++++++++++++++++++++---
> 1 file changed, 49 insertions(+), 4 deletions(-)
> 
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 8f4c5698913d..e97880d7bdb2 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -3825,6 +3825,54 @@ static int hci_init_sync(struct hci_dev *hdev)
> 	return 0;
> }
> 
> +#define HCI_QUIRK_BROKEN(_quirk, _desc) { HCI_QUIRK_BROKEN_##_quirk, _desc }
> +
> +static const struct {
> +	unsigned long quirk;
> +	const char *desc;
> +} hci_broken_table[] = {
> +	HCI_QUIRK_BROKEN(LOCAL_COMMANDS,
> +			 "HCI Read Local Supported Commands not supported"),
> +	HCI_QUIRK_BROKEN(STORED_LINK_KEY,
> +			 "HCI Delete Stored Link Key command is advertised, "
> +			 "but not supported."),
> +	HCI_QUIRK_BROKEN(ERR_DATA_REPORTING,
> +			 "HCI Read Default Erroneous Data Reporting command is "
> +			 "advertised, but not supported."),
> +	HCI_QUIRK_BROKEN(READ_TRANSMIT_POWER,
> +			 "HCI Read Transmit Power Level command is advertised, "
> +			 "but not supported."),
> +	HCI_QUIRK_BROKEN(FILTER_CLEAR_ALL,
> +			 "HCI Set Event Filter command not supported."),
> +	HCI_QUIRK_BROKEN(ENHANCED_SETUP_SYNC_CONN,
> +			 "HCI Enhanced Setup Synchronous Connection command is "
> +			 "advertised, but not supported.")
> +};
> +
> +static int hci_dev_setup_sync(struct hci_dev *hdev)
> +{
> +	size_t i;
> +
> +	bt_dev_dbg(hdev, "");
> +
> +	hci_sock_dev_event(hdev, HCI_DEV_SETUP);
> +
> +	if (hdev->setup) {
> +		int ret;
> +
> +		ret = hdev->setup(hdev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(hci_broken_table); i++) {
> +		if (test_bit(hci_broken_table[i].quirk, &hdev->quirks))
> +			bt_dev_warn(hdev, "%s", hci_broken_table[i].desc);
> +	}
> +
> +	return 0;
> +}
> +
> int hci_dev_open_sync(struct hci_dev *hdev)
> {
> 	int ret = 0;
> @@ -3887,10 +3935,7 @@ int hci_dev_open_sync(struct hci_dev *hdev)
> 	    test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
> 		bool invalid_bdaddr;
> 
> -		hci_sock_dev_event(hdev, HCI_DEV_SETUP);
> -
> -		if (hdev->setup)
> -			ret = hdev->setup(hdev);
> +		ret = hci_dev_setup_sync(hdev);

just put the code here instead of creating another helper function.

Regards

Marcel

