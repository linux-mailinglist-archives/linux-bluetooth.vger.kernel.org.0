Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5595032AE46
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Mar 2021 03:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448668AbhCBW5W convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 2 Mar 2021 17:57:22 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:50946 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245276AbhCBOBI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 2 Mar 2021 09:01:08 -0500
Received: from marcel-macbook.holtmann.net (p4ff9fb90.dip0.t-ipconnect.de [79.249.251.144])
        by mail.holtmann.org (Postfix) with ESMTPSA id 49B82CECE6;
        Tue,  2 Mar 2021 15:04:30 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH 2/2] Bluetooth: Remove unneeded commands for suspend
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210301120602.2.Ifcac8bd85b5339135af8e08370bacecc518b1c35@changeid>
Date:   Tue, 2 Mar 2021 14:56:56 +0100
Cc:     CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Bluetooth Kernel Mailing List 
        <linux-bluetooth@vger.kernel.org>,
        Archie Pusaka <apusaka@chromium.org>,
        Alain Michaud <alainm@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <6DF11F94-D3DE-4DB1-8AC7-98419859115F@holtmann.org>
References: <20210301200605.106607-1-abhishekpandit@chromium.org>
 <20210301120602.2.Ifcac8bd85b5339135af8e08370bacecc518b1c35@changeid>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Abhishek,

> During suspend, there are a few scan enable and set event filter
> commands that don't need to be sent unless there are actual BR/EDR
> devices capable of waking the system. Check the HCI_PSCAN bit before
> writing scan enable and use a new dev flag, HCI_EVENT_FILTER_CONFIGURED
> to control whether to clear the event filter.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Reviewed-by: Archie Pusaka <apusaka@chromium.org>
> Reviewed-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> include/net/bluetooth/hci.h |  1 +
> net/bluetooth/hci_event.c   | 31 ++++++++++++++++++++++++++
> net/bluetooth/hci_request.c | 44 +++++++++++++++++++++++--------------
> 3 files changed, 59 insertions(+), 17 deletions(-)
> 
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index ba2f439bc04d34..ea4ae551c42687 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -320,6 +320,7 @@ enum {
> 	HCI_BREDR_ENABLED,
> 	HCI_LE_SCAN_INTERRUPTED,
> 	HCI_WIDEBAND_SPEECH_ENABLED,
> +	HCI_EVENT_FILTER_CONFIGURED,
> 
> 	HCI_DUT_MODE,
> 	HCI_VENDOR_DIAG,
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 67668be3461e93..17847e672b98cf 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -395,6 +395,33 @@ static void hci_cc_write_scan_enable(struct hci_dev *hdev, struct sk_buff *skb)
> 	hci_dev_unlock(hdev);
> }
> 
> +static void hci_cc_set_event_filter(struct hci_dev *hdev, struct sk_buff *skb)
> +{
> +	__u8 status = *((__u8 *)skb->data);
> +	struct hci_cp_set_event_filter *cp;
> +	void *sent;
> +
> +	BT_DBG("%s status 0x%2.2x", hdev->name, status);
> +
> +	sent = hci_sent_cmd_data(hdev, HCI_OP_SET_EVENT_FLT);
> +	if (!sent)
> +		return;
> +
> +	cp = (struct hci_cp_set_event_filter *)sent;
> +
> +	hci_dev_lock(hdev);
> +
> +	if (status)
> +		goto done;

So I have no idea why this is inside the hdev_lock scope. Just leave the function right before sent assignment if you don’t care about handling the failure.

> +
> +	if (cp->flt_type == HCI_FLT_CLEAR_ALL)
> +		hci_dev_clear_flag(hdev, HCI_EVENT_FILTER_CONFIGURED);
> +	else
> +		hci_dev_set_flag(hdev, HCI_EVENT_FILTER_CONFIGURED);
> +done:
> +	hci_dev_unlock(hdev);
> +}
> +
> static void hci_cc_read_class_of_dev(struct hci_dev *hdev, struct sk_buff *skb)
> {
> 	struct hci_rp_read_class_of_dev *rp = (void *) skb->data;
> @@ -3328,6 +3355,10 @@ static void hci_cmd_complete_evt(struct hci_dev *hdev, struct sk_buff *skb,
> 		hci_cc_write_scan_enable(hdev, skb);
> 		break;
> 
> +	case HCI_OP_SET_EVENT_FLT:
> +		hci_cc_set_event_filter(hdev, skb);
> +		break;
> +
> 	case HCI_OP_READ_CLASS_OF_DEV:
> 		hci_cc_read_class_of_dev(hdev, skb);
> 		break;
> diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
> index e55976db4403e7..75a42178c82d9b 100644
> --- a/net/bluetooth/hci_request.c
> +++ b/net/bluetooth/hci_request.c
> @@ -1131,14 +1131,14 @@ static void hci_req_clear_event_filter(struct hci_request *req)
> {
> 	struct hci_cp_set_event_filter f;
> 
> -	memset(&f, 0, sizeof(f));
> -	f.flt_type = HCI_FLT_CLEAR_ALL;
> -	hci_req_add(req, HCI_OP_SET_EVENT_FLT, 1, &f);
> +	if (!hci_dev_test_flag(req->hdev, HCI_BREDR_ENABLED))
> +		return;
> 
> -	/* Update page scan state (since we may have modified it when setting
> -	 * the event filter).
> -	 */
> -	__hci_req_update_scan(req);
> +	if (hci_dev_test_flag(req->hdev, HCI_EVENT_FILTER_CONFIGURED)) {
> +		memset(&f, 0, sizeof(f));
> +		f.flt_type = HCI_FLT_CLEAR_ALL;
> +		hci_req_add(req, HCI_OP_SET_EVENT_FLT, 1, &f);
> +	}
> }
> 
> static void hci_req_set_event_filter(struct hci_request *req)
> @@ -1147,6 +1147,10 @@ static void hci_req_set_event_filter(struct hci_request *req)
> 	struct hci_cp_set_event_filter f;
> 	struct hci_dev *hdev = req->hdev;
> 	u8 scan = SCAN_DISABLED;
> +	bool scanning = test_bit(HCI_PSCAN, &hdev->flags);
> +
> +	if (!hci_dev_test_flag(hdev, HCI_BREDR_ENABLED))
> +		return;
> 
> 	/* Always clear event filter when starting */
> 	hci_req_clear_event_filter(req);
> @@ -1167,12 +1171,13 @@ static void hci_req_set_event_filter(struct hci_request *req)
> 		scan = SCAN_PAGE;
> 	}
> 
> -	if (scan)
> +	if (scan && !scanning) {
> 		set_bit(SUSPEND_SCAN_ENABLE, hdev->suspend_tasks);
> -	else
> +		hci_req_add(req, HCI_OP_WRITE_SCAN_ENABLE, 1, &scan);
> +	} else if (!scan && scanning) {
> 		set_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks);
> -
> -	hci_req_add(req, HCI_OP_WRITE_SCAN_ENABLE, 1, &scan);
> +		hci_req_add(req, HCI_OP_WRITE_SCAN_ENABLE, 1, &scan);
> +	}
> }
> 
> static void cancel_adv_timeout(struct hci_dev *hdev)
> @@ -1315,9 +1320,14 @@ void hci_req_prepare_suspend(struct hci_dev *hdev, enum suspended_state next)
> 
> 		hdev->advertising_paused = true;
> 		hdev->advertising_old_state = old_state;
> -		/* Disable page scan */
> -		page_scan = SCAN_DISABLED;
> -		hci_req_add(&req, HCI_OP_WRITE_SCAN_ENABLE, 1, &page_scan);
> +
> +		/* Disable page scan if enabled */
> +		if (test_bit(HCI_PSCAN, &hdev->flags)) {
> +			page_scan = SCAN_DISABLED;
> +			hci_req_add(&req, HCI_OP_WRITE_SCAN_ENABLE, 1,
> +				    &page_scan);
> +			set_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks);
> +		}
> 
> 		/* Disable LE passive scan if enabled */
> 		if (hci_dev_test_flag(hdev, HCI_LE_SCAN)) {
> @@ -1328,9 +1338,6 @@ void hci_req_prepare_suspend(struct hci_dev *hdev, enum suspended_state next)
> 		/* Disable advertisement filters */
> 		hci_req_add_set_adv_filter_enable(&req, false);
> 
> -		/* Mark task needing completion */
> -		set_bit(SUSPEND_SCAN_DISABLE, hdev->suspend_tasks);
> -
> 		/* Prevent disconnects from causing scanning to be re-enabled */
> 		hdev->scanning_paused = true;
> 
> @@ -1364,7 +1371,10 @@ void hci_req_prepare_suspend(struct hci_dev *hdev, enum suspended_state next)
> 		hdev->suspended = false;
> 		hdev->scanning_paused = false;
> 
> +		/* Clear any event filters and restore scan state */
> 		hci_req_clear_event_filter(&req);
> +		__hci_req_update_scan(&req);
> +
> 		/* Reset passive/background scanning to normal */
> 		__hci_update_background_scan(&req);
> 		/* Enable all of the advertisement filters */

Rest looks good.

Regards

Marcel

