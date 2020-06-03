Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E257A1ED59B
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Jun 2020 19:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgFCR7z convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Jun 2020 13:59:55 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:33392 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgFCR7x (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Jun 2020 13:59:53 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 68831CED2E;
        Wed,  3 Jun 2020 20:09:39 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v1 2/7] Bluetooth: Add handler of
 MGMT_OP_READ_ADV_MONITOR_FEATURES
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200528165324.v1.2.I7f3372c74a6569cd3445b77a67a0b0fcfdd8a333@changeid>
Date:   Wed, 3 Jun 2020 19:59:50 +0200
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Alain Michaud <alainm@chromium.org>,
        Manish Mandlik <mmandlik@chromium.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Yoni Shavit <yshavit@chromium.org>,
        Michael Sun <michaelfsun@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <1359027D-E531-4022-89DD-DB19B3C7F499@holtmann.org>
References: <20200528165324.v1.1.I636f906bf8122855dfd2ba636352bbdcb50c35ed@changeid>
 <20200528165324.v1.2.I7f3372c74a6569cd3445b77a67a0b0fcfdd8a333@changeid>
To:     Miao-chen Chou <mcchou@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Miao-chen,

> This adds the request handler of MGMT_OP_READ_ADV_MONITOR_FEATURES
> command. Since the controller-based monitoring is not yet in place, this
> report only the supported features but not the enabled features.
> 
> The following test was performed.
> - Issuing btmgmt advmon-features.
> 
> Signed-off-by: Miao-chen Chou <mcchou@chromium.org>
> ---
> 
> include/net/bluetooth/hci_core.h | 24 +++++++++++++++++
> net/bluetooth/hci_core.c         | 10 ++++++-
> net/bluetooth/mgmt.c             | 46 ++++++++++++++++++++++++++++++++
> net/bluetooth/msft.c             |  7 +++++
> net/bluetooth/msft.h             |  9 +++++++
> 5 files changed, 95 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
> index cdd4f1db8670e..431fe0265dcfb 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -25,6 +25,7 @@
> #ifndef __HCI_CORE_H
> #define __HCI_CORE_H
> 
> +#include <linux/idr.h>
> #include <linux/leds.h>
> #include <linux/rculist.h>
> 
> @@ -220,6 +221,24 @@ struct adv_info {
> #define HCI_MAX_ADV_INSTANCES		5
> #define HCI_DEFAULT_ADV_DURATION	2
> 
> +struct adv_pattern {
> +	struct list_head list;
> +	__u8 ad_type;
> +	__u8 offset;
> +	__u8 length;
> +	__u8 value[HCI_MAX_AD_LENGTH];
> +};
> +
> +struct adv_monitor {
> +	struct list_head patterns;
> +	bool		active;
> +	__u16		handle;
> +};
> +
> +#define HCI_MIN_ADV_MONITOR_HANDLE		1
> +#define HCI_MAX_ADV_MONITOR_NUM_HANDLES	32
> +#define HCI_MAX_ADV_MONITOR_NUM_PATTERNS	16
> +
> #define HCI_MAX_SHORT_NAME_LENGTH	10
> 
> /* Min encryption key size to match with SMP */
> @@ -477,6 +496,9 @@ struct hci_dev {
> 	__u16			adv_instance_timeout;
> 	struct delayed_work	adv_instance_expire;
> 
> +	struct idr		adv_monitors_idr;
> +	unsigned int		adv_monitors_cnt;
> +
> 	__u8			irk[16];
> 	__u32			rpa_timeout;
> 	struct delayed_work	rpa_expired;
> @@ -1217,6 +1239,8 @@ int hci_add_adv_instance(struct hci_dev *hdev, u8 instance, u32 flags,
> int hci_remove_adv_instance(struct hci_dev *hdev, u8 instance);
> void hci_adv_instances_set_rpa_expired(struct hci_dev *hdev, bool rpa_expired);
> 
> +void hci_adv_monitors_clear(struct hci_dev *hdev);
> +
> void hci_event_packet(struct hci_dev *hdev, struct sk_buff *skb);
> 
> void hci_init_sysfs(struct hci_dev *hdev);
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index dbe2d79f233fb..23bfe4f1d1e9d 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -26,7 +26,6 @@
> /* Bluetooth HCI core. */
> 
> #include <linux/export.h>
> -#include <linux/idr.h>
> #include <linux/rfkill.h>
> #include <linux/debugfs.h>
> #include <linux/crypto.h>
> @@ -2996,6 +2995,12 @@ int hci_add_adv_instance(struct hci_dev *hdev, u8 instance, u32 flags,
> 	return 0;
> }
> 
> +/* This function requires the caller holds hdev->lock */
> +void hci_adv_monitors_clear(struct hci_dev *hdev)
> +{
> +	idr_destroy(&hdev->adv_monitors_idr);
> +}
> +
> struct bdaddr_list *hci_bdaddr_list_lookup(struct list_head *bdaddr_list,
> 					 bdaddr_t *bdaddr, u8 type)
> {
> @@ -3574,6 +3579,8 @@ int hci_register_dev(struct hci_dev *hdev)
> 
> 	queue_work(hdev->req_workqueue, &hdev->power_on);
> 
> +	idr_init(&hdev->adv_monitors_idr);
> +
> 	return id;
> 
> err_wqueue:
> @@ -3644,6 +3651,7 @@ void hci_unregister_dev(struct hci_dev *hdev)
> 	hci_smp_irks_clear(hdev);
> 	hci_remote_oob_data_clear(hdev);
> 	hci_adv_instances_clear(hdev);
> +	hci_adv_monitors_clear(hdev);
> 	hci_bdaddr_list_clear(&hdev->le_white_list);
> 	hci_bdaddr_list_clear(&hdev->le_resolv_list);
> 	hci_conn_params_clear_all(hdev);
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 9e8a3cccc6ca3..8d8275ee9718b 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -36,6 +36,7 @@
> #include "hci_request.h"
> #include "smp.h"
> #include "mgmt_util.h"
> +#include "msft.h"
> 
> #define MGMT_VERSION	1
> #define MGMT_REVISION	17
> @@ -111,6 +112,7 @@ static const u16 mgmt_commands[] = {
> 	MGMT_OP_READ_SECURITY_INFO,
> 	MGMT_OP_READ_EXP_FEATURES_INFO,
> 	MGMT_OP_SET_EXP_FEATURE,
> +	MGMT_OP_READ_ADV_MONITOR_FEATURES,
> };
> 
> static const u16 mgmt_events[] = {
> @@ -3849,6 +3851,49 @@ static int set_exp_feature(struct sock *sk, struct hci_dev *hdev,
> 			       MGMT_STATUS_NOT_SUPPORTED);
> }
> 
> +static int read_adv_monitor_features(struct sock *sk, struct hci_dev *hdev,
> +				     void *data, u16 len)
> +{
> +	struct adv_monitor *monitor = NULL;
> +	struct mgmt_rp_read_adv_monitor_features *rp = NULL;
> +	int handle;
> +	size_t rp_size = 0;
> +	__u32 supported = 0;
> +	__u16 num_handles = 0;
> +	__u16 handles[HCI_MAX_ADV_MONITOR_NUM_HANDLES];
> +
> +	BT_DBG("request for %s", hdev->name);
> +
> +	hci_dev_lock(hdev);
> +
> +	if (msft_get_features(hdev) & MSFT_FEATURE_MASK_LE_ADV_MONITOR)
> +		supported |= MGMT_ADV_MONITOR_FEATURE_MASK_OR_PATTERNS;
> +
> +	idr_for_each_entry(&hdev->adv_monitors_idr, monitor, handle)
> +		handles[num_handles++] = monitor->handle;

I would put { } here to make it readable.

> +
> +	hci_dev_unlock(hdev);
> +
> +	rp_size = sizeof(*rp) + (num_handles * sizeof(u16));
> +	rp = kmalloc(rp_size, GFP_KERNEL);
> +	if (!rp)
> +		return -ENOMEM;
> +
> +	// Once controller-based monitoring is in place, the enabled_features
> +	// should reflect the use.

Please use /* */ comment style here.

> +	rp->supported_features = supported;
> +	rp->enabled_features = 0;
> +	rp->max_num_handles = HCI_MAX_ADV_MONITOR_NUM_HANDLES;
> +	rp->max_num_patterns = HCI_MAX_ADV_MONITOR_NUM_PATTERNS;

These are little-endian.

> +	rp->num_handles = num_handles;
> +	if (num_handles)
> +		memcpy(&rp->handles, &handles, (num_handles * sizeof(u16)));
> +
> +	return mgmt_cmd_complete(sk, hdev->id,
> +				 MGMT_OP_READ_ADV_MONITOR_FEATURES,
> +				 MGMT_STATUS_SUCCESS, rp, rp_size);
> +}
> +
> static void read_local_oob_data_complete(struct hci_dev *hdev, u8 status,
> 				         u16 opcode, struct sk_buff *skb)
> {
> @@ -7297,6 +7342,7 @@ static const struct hci_mgmt_handler mgmt_handlers[] = {
> 	{ set_exp_feature,         MGMT_SET_EXP_FEATURE_SIZE,
> 						HCI_MGMT_VAR_LEN |
> 						HCI_MGMT_HDEV_OPTIONAL },
> +	{ read_adv_monitor_features, MGMT_READ_ADV_MONITOR_FEATURES_SIZE },
> };
> 
> void mgmt_index_added(struct hci_dev *hdev)
> diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
> index d6c4e6b5ae777..8579bfeb28364 100644
> --- a/net/bluetooth/msft.c
> +++ b/net/bluetooth/msft.c
> @@ -139,3 +139,10 @@ void msft_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb)
> 
> 	bt_dev_dbg(hdev, "MSFT vendor event %u", event);
> }
> +
> +__u64 msft_get_features(struct hci_dev *hdev)
> +{
> +	struct msft_data *msft = hdev->msft_data;
> +
> +	return  msft ? msft->features : 0;
> +}
> diff --git a/net/bluetooth/msft.h b/net/bluetooth/msft.h
> index 5aa9130e1f8ab..e9c478e890b8b 100644
> --- a/net/bluetooth/msft.h
> +++ b/net/bluetooth/msft.h
> @@ -3,16 +3,25 @@
>  * Copyright (C) 2020 Google Corporation
>  */
> 
> +#define MSFT_FEATURE_MASK_BREDR_RSSI_MONITOR		BIT(0)
> +#define MSFT_FEATURE_MASK_LE_CONN_RSSI_MONITOR		BIT(1)
> +#define MSFT_FEATURE_MASK_LE_ADV_RSSI_MONITOR		BIT(2)
> +#define MSFT_FEATURE_MASK_LE_ADV_MONITOR		BIT(3)
> +#define MSFT_FEATURE_MASK_CURVE_VALIDITY		BIT(4)
> +#define MSFT_FEATURE_MASK_CONCURRENT_ADV_MONITOR	BIT(5)
> +
> #if IS_ENABLED(CONFIG_BT_MSFTEXT)
> 
> void msft_do_open(struct hci_dev *hdev);
> void msft_do_close(struct hci_dev *hdev);
> void msft_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb);
> +__u64 msft_get_features(struct hci_dev *hdev);
> 
> #else
> 
> static inline void msft_do_open(struct hci_dev *hdev) {}
> static inline void msft_do_close(struct hci_dev *hdev) {}
> static inline void msft_vendor_evt(struct hci_dev *hdev, struct sk_buff *skb) {}
> +static inline __u64 msft_get_features(struct hci_dev *hdev) { return 0; }

Regards

Marcel

