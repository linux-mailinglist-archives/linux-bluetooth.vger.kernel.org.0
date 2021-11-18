Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E13C4553D8
	for <lists+linux-bluetooth@lfdr.de>; Thu, 18 Nov 2021 05:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243001AbhKREmv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 17 Nov 2021 23:42:51 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:44515 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242993AbhKREmr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 17 Nov 2021 23:42:47 -0500
Received: from smtpclient.apple (p4fefc15c.dip0.t-ipconnect.de [79.239.193.92])
        by mail.holtmann.org (Postfix) with ESMTPSA id 2A7F2CED01;
        Thu, 18 Nov 2021 05:39:46 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH] Bluetooth: btusb: Add support for queuing during polling
 interval
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20211108230210.931731-1-luiz.dentz@gmail.com>
Date:   Thu, 18 Nov 2021 05:39:45 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <949D7592-D56E-486D-BD59-F10D346C92DD@holtmann.org>
References: <20211108230210.931731-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This makes btusb to queue ACL and events during a polling interval
> by using of a delayed work, with the interval working as a time window
> where frames received from different endpoints are considered to be
> arrived at same time and then attempt to resolve potential conflics by
> processing the events ahead of ACL packets.
> 
> It worth noting though that priorizing events over ACL data may result
> in inverting the order compared to how they appeared over the air, for
> instance there may be packets received before a disconnect event that
> will be discarded and unencrypted packets received before encryption
> change which would considered encrypted, because of these potential
> changes on the order the support for queuing during the polling
> interval is not enabled by default so platforms have the following
> means to enable it:
> 
> At runtime with use of module option:
> 
>    enable_poll_sync

is this still needed?

> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> drivers/bluetooth/btusb.c | 89 +++++++++++++++++++++++++++++++++------
> 1 file changed, 77 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 46d892bbde62..29aa0f346ace 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -31,7 +31,7 @@
> static bool disable_scofix;
> static bool force_scofix;
> static bool enable_autosuspend = IS_ENABLED(CONFIG_BT_HCIBTUSB_AUTOSUSPEND);
> -
> +static bool enable_poll_sync;
> static bool reset = true;
> 
> static struct usb_driver btusb_driver;
> @@ -550,8 +550,12 @@ struct btusb_data {
> 
> 	unsigned long flags;
> 
> -	struct work_struct work;
> -	struct work_struct waker;
> +	int intr_interval;
> +	struct work_struct  work;
> +	struct work_struct  waker;
> +	struct delayed_work rx_work;
> +
> +	struct sk_buff_head acl_q;
> 
> 	struct usb_anchor deferred;
> 	struct usb_anchor tx_anchor;
> @@ -588,8 +592,8 @@ struct btusb_data {
> 	int isoc_altsetting;
> 	int suspend_count;
> 
> -	int (*recv_event)(struct hci_dev *hdev, struct sk_buff *skb);
> 	int (*recv_acl)(struct hci_dev *hdev, struct sk_buff *skb);
> +	int (*recv_event)(struct btusb_data *data, struct sk_buff *skb);

This change is a bit unfortunate since I really wanted to allow recv_event = hci_recv_frame assignment.

> 	int (*recv_bulk)(struct btusb_data *data, void *buffer, int count);
> 
> 	int (*setup_on_usb)(struct hci_dev *hdev);
> @@ -761,7 +765,7 @@ static int btusb_recv_intr(struct btusb_data *data, void *buffer, int count)
> 
> 		if (!hci_skb_expect(skb)) {
> 			/* Complete frame */
> -			data->recv_event(data->hdev, skb);
> +			data->recv_event(data, skb);
> 			skb = NULL;
> 		}
> 	}
> @@ -772,6 +776,18 @@ static int btusb_recv_intr(struct btusb_data *data, void *buffer, int count)
> 	return err;
> }
> 
> +static int btusb_recv_acl(struct btusb_data *data, struct sk_buff *skb)
> +{
> +	if (!enable_poll_sync)
> +		return data->recv_acl(data->hdev, skb);
> +
> +	skb_queue_tail(&data->acl_q, skb);
> +
> +	schedule_delayed_work(&data->rx_work, data->intr_interval);
> +
> +	return 0;
> +}
> +

Starting to think about this, I really have a problem with these massive if-one-or-another checks in the main receive path. The idea was really that only hardware that needs special handling assigns different callbacks.

This means if we really want to support this, then we need to have independent recv_acl and recv_event callbacks depending on sync_poll behavior is enabled or not.

We also need to bind switching the behavior to controllers that are powered down. Otherwise this really becomes a mess. Checking a module parameter variable on every receiving packet is not a good idea.

> static int btusb_recv_bulk(struct btusb_data *data, void *buffer, int count)
> {
> 	struct sk_buff *skb;
> @@ -819,7 +835,7 @@ static int btusb_recv_bulk(struct btusb_data *data, void *buffer, int count)
> 
> 		if (!hci_skb_expect(skb)) {
> 			/* Complete frame */
> -			data->recv_acl(data->hdev, skb);
> +			btusb_recv_acl(data, skb);
> 			skb = NULL;
> 		}
> 	}
> @@ -971,6 +987,19 @@ static int btusb_submit_intr_urb(struct hci_dev *hdev, gfp_t mem_flags)
> 		usb_unanchor_urb(urb);
> 	}
> 
> +	/* The units are frames (milliseconds) for full and low speed devices,
> +	 * and microframes (1/8 millisecond) for highspeed and SuperSpeed
> +	 * devices.
> +	 */
> +	switch (urb->dev->speed) {
> +	case USB_SPEED_SUPER_PLUS:
> +	case USB_SPEED_SUPER:	/* units are 125us */
> +		data->intr_interval = usecs_to_jiffies(urb->interval * 125);
> +		break;
> +	default:
> +		data->intr_interval = msecs_to_jiffies(urb->interval);
> +	}
> +
> 	usb_free_urb(urb);
> 
> 	return err;
> @@ -1430,9 +1459,12 @@ static int btusb_close(struct hci_dev *hdev)
> 
> 	BT_DBG("%s", hdev->name);
> 
> +	cancel_delayed_work(&data->rx_work);
> 	cancel_work_sync(&data->work);
> 	cancel_work_sync(&data->waker);
> 
> +	skb_queue_purge(&data->acl_q);
> +
> 	clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
> 	clear_bit(BTUSB_BULK_RUNNING, &data->flags);
> 	clear_bit(BTUSB_INTR_RUNNING, &data->flags);
> @@ -1464,6 +1496,10 @@ static int btusb_flush(struct hci_dev *hdev)
> 
> 	BT_DBG("%s", hdev->name);
> 
> +	cancel_delayed_work(&data->rx_work);
> +
> +	skb_queue_purge(&data->acl_q);
> +
> 	usb_kill_anchored_urbs(&data->tx_anchor);
> 	btusb_free_frags(data);
> 
> @@ -1827,6 +1863,17 @@ static void btusb_waker(struct work_struct *work)
> 	usb_autopm_put_interface(data->intf);
> }
> 
> +static void btusb_rx_work(struct work_struct *work)
> +{
> +	struct btusb_data *data = container_of(work, struct btusb_data,
> +					       rx_work.work);
> +	struct sk_buff *skb;
> +
> +	/* Dequeue ACL data received during the interval */
> +	while ((skb = skb_dequeue(&data->acl_q)))
> +		data->recv_acl(data->hdev, skb);
> +}
> +
> static int btusb_setup_bcm92035(struct hci_dev *hdev)
> {
> 	struct sk_buff *skb;
> @@ -2028,9 +2075,9 @@ static int btusb_recv_bulk_intel(struct btusb_data *data, void *buffer,
> 	return btusb_recv_bulk(data, buffer, count);
> }
> 
> -static int btusb_recv_event_intel(struct hci_dev *hdev, struct sk_buff *skb)
> +static int btusb_recv_event_intel(struct btusb_data *data, struct sk_buff *skb)
> {
> -	if (btintel_test_flag(hdev, INTEL_BOOTLOADER)) {
> +	if (btintel_test_flag(data->hdev, INTEL_BOOTLOADER)) {
> 		struct hci_event_hdr *hdr = (void *)skb->data;
> 
> 		if (skb->len > HCI_EVENT_HDR_SIZE && hdr->evt == 0xff &&
> @@ -2044,7 +2091,7 @@ static int btusb_recv_event_intel(struct hci_dev *hdev, struct sk_buff *skb)
> 				 * the device sends a vendor specific event
> 				 * indicating that the bootup completed.
> 				 */
> -				btintel_bootup(hdev, ptr, len);
> +				btintel_bootup(data->hdev, ptr, len);
> 				break;
> 			case 0x06:
> 				/* When the firmware loading completes the
> @@ -2052,13 +2099,14 @@ static int btusb_recv_event_intel(struct hci_dev *hdev, struct sk_buff *skb)
> 				 * indicating the result of the firmware
> 				 * loading.
> 				 */
> -				btintel_secure_send_result(hdev, ptr, len);
> +				btintel_secure_send_result(data->hdev, ptr,
> +							   len);
> 				break;
> 			}
> 		}
> 	}
> 
> -	return hci_recv_frame(hdev, skb);
> +	return hci_recv_frame(data->hdev, skb);
> }
> 
> static int btusb_send_frame_intel(struct hci_dev *hdev, struct sk_buff *skb)
> @@ -3372,6 +3420,16 @@ static int btusb_shutdown_qca(struct hci_dev *hdev)
> 	return 0;
> }
> 
> +static int btusb_recv_evt(struct btusb_data *data, struct sk_buff *skb)
> +{
> +	if (enable_poll_sync) {
> +		/* Trigger dequeue immediatelly if an event is received */
> +		schedule_delayed_work(&data->rx_work, 0);
> +	}
> +
> +	return hci_recv_frame(data->hdev, skb);
> +}
> +
> static int btusb_probe(struct usb_interface *intf,
> 		       const struct usb_device_id *id)
> {
> @@ -3455,6 +3513,10 @@ static int btusb_probe(struct usb_interface *intf,
> 
> 	INIT_WORK(&data->work, btusb_work);
> 	INIT_WORK(&data->waker, btusb_waker);
> +	INIT_DELAYED_WORK(&data->rx_work, btusb_rx_work);
> +
> +	skb_queue_head_init(&data->acl_q);
> +
> 	init_usb_anchor(&data->deferred);
> 	init_usb_anchor(&data->tx_anchor);
> 	spin_lock_init(&data->txlock);
> @@ -3468,7 +3530,7 @@ static int btusb_probe(struct usb_interface *intf,
> 
> 	priv_size = 0;
> 
> -	data->recv_event = hci_recv_frame;
> +	data->recv_event = btusb_recv_evt;
> 	data->recv_bulk = btusb_recv_bulk;
> 
> 	if (id->driver_info & BTUSB_INTEL_COMBINED) {
> @@ -3942,6 +4004,9 @@ MODULE_PARM_DESC(force_scofix, "Force fixup of wrong SCO buffers size");
> module_param(enable_autosuspend, bool, 0644);
> MODULE_PARM_DESC(enable_autosuspend, "Enable USB autosuspend by default");
> 
> +module_param(enable_poll_sync, bool, 0644);
> +MODULE_PARM_DESC(enable_poll_sync, "Enable URB polling interval synchronization");
> +
> module_param(reset, bool, 0644);
> MODULE_PARM_DESC(reset, "Send HCI reset command on initialization");

Regards

Marcel

