Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26A10376238
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 May 2021 10:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhEGIjf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 7 May 2021 04:39:35 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:42388 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbhEGIje (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 7 May 2021 04:39:34 -0400
Received: from smtpclient.apple (p4fefc624.dip0.t-ipconnect.de [79.239.198.36])
        by mail.holtmann.org (Postfix) with ESMTPSA id B0419CECDB;
        Fri,  7 May 2021 10:46:21 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH v6 1/2] Bluetooth: enumerate local supported codec and
 cache details
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210502123442.19483-1-kiran.k@intel.com>
Date:   Fri, 7 May 2021 10:38:30 +0200
Cc:     linux-bluetooth@vger.kernel.org,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <3B5C0B53-7384-41CC-8582-46A458920B99@holtmann.org>
References: <20210502123442.19483-1-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> Move reading of supported local codecs into a separate init function,
> query codecs capabilities and cache the data
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> Signed-off-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
> * change  in v6
>  - fix compiler warning reported for ARCH=arc
> * changes in v5:
>  - fix review comments
>  - move code used to read standard/vendor codecs caps into single function
> * changes in v4
>  - convert  reading of codecs and codecs caps calls from async to sync
> * changes in v3
>  move codec enumeration into a new init function
> * changes in v2
>  add skb length check before accessing data
> 
> include/net/bluetooth/hci.h      |  38 +++++++
> include/net/bluetooth/hci_core.h |  16 +++
> net/bluetooth/hci_core.c         | 168 ++++++++++++++++++++++++++++++-
> 3 files changed, 218 insertions(+), 4 deletions(-)
> 
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index ea4ae551c426..c03afb77071d 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -1306,6 +1306,26 @@ struct hci_rp_read_data_block_size {
> } __packed;
> 
> #define HCI_OP_READ_LOCAL_CODECS	0x100b
> +struct hci_standard_codecs {
> +	__u8	num;
> +	__u8	codec[];
> +} __packed;
> +
> +struct hci_vendor_codec {
> +	__le16	company_id;
> +	__le16	codec_id;
> +} __packed;
> +
> +struct hci_vendor_codecs {
> +	__u8	num;
> +	struct hci_vendor_codec codec[];
> +} __packed;
> +
> +struct hci_rp_read_local_supported_codecs {
> +	__u8	status;
> +	struct hci_standard_codecs std_codecs;
> +	struct hci_vendor_codecs vendor_codecs;
> +} __packed;
> 
> #define HCI_OP_READ_LOCAL_PAIRING_OPTS	0x100c
> struct hci_rp_read_local_pairing_opts {
> @@ -1314,6 +1334,24 @@ struct hci_rp_read_local_pairing_opts {
> 	__u8     max_key_size;
> } __packed;
> 
> +#define HCI_OP_READ_LOCAL_CODEC_CAPS	0x100e
> +struct hci_op_read_local_codec_caps {
> +	__u8	codec_id[5];
> +	__u8	transport;
> +	__u8	direction;
> +} __packed;
> +
> +struct hci_codec_caps {
> +	__u8	len;
> +	__u8	caps[];
> +} __packed;
> +
> +struct hci_rp_read_local_codec_caps {
> +	__u8	status;
> +	__u8	num_caps;
> +	struct hci_codec_caps caps[];
> +} __packed;
> +
> #define HCI_OP_READ_PAGE_SCAN_ACTIVITY	0x0c1b
> struct hci_rp_read_page_scan_activity {
> 	__u8     status;
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
> index 8f5f390363f5..0afb1cc6b058 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -131,6 +131,14 @@ struct bdaddr_list {
> 	u8 bdaddr_type;
> };
> 
> +struct codec_list {
> +	struct list_head list;
> +	u8	transport;
> +	u8	codec_id[5];
> +	u8	num_caps;
> +	struct hci_codec_caps caps[];
> +};
> +
> struct bdaddr_list_with_irk {
> 	struct list_head list;
> 	bdaddr_t bdaddr;
> @@ -534,6 +542,7 @@ struct hci_dev {
> 	struct list_head	pend_le_conns;
> 	struct list_head	pend_le_reports;
> 	struct list_head	blocked_keys;
> +	struct list_head	local_codecs;
> 
> 	struct hci_dev_stats	stat;
> 
> @@ -1848,4 +1857,11 @@ void hci_copy_identity_address(struct hci_dev *hdev, bdaddr_t *bdaddr,
> #define SCO_AIRMODE_CVSD       0x0000
> #define SCO_AIRMODE_TRANSP     0x0003
> 
> +#define LOCAL_CODEC_ACL_MASK	BIT(0)
> +#define LOCAL_CODEC_SCO_MASK	BIT(1)
> +#define LOCAL_CODEC_CIS_MASK	BIT(2)
> +#define LOCAL_CODEC_BIS_MASK	BIT(3)
> +
> +#define TRANSPORT_TYPE_MAX	0x04
> +
> #endif /* __HCI_CORE_H */
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index fd12f1652bdf..d0439f6b2d6a 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -838,10 +838,6 @@ static int hci_init4_req(struct hci_request *req, unsigned long opt)
> 	if (hdev->commands[22] & 0x04)
> 		hci_set_event_mask_page_2(req);
> 
> -	/* Read local codec list if the HCI command is supported */
> -	if (hdev->commands[29] & 0x20)
> -		hci_req_add(req, HCI_OP_READ_LOCAL_CODECS, 0, NULL);
> -
> 	/* Read local pairing options if the HCI command is supported */
> 	if (hdev->commands[41] & 0x08)
> 		hci_req_add(req, HCI_OP_READ_LOCAL_PAIRING_OPTS, 0, NULL);
> @@ -907,6 +903,166 @@ static int hci_init4_req(struct hci_request *req, unsigned long opt)
> 	return 0;
> }
> 
> +static int hci_codec_list_add(struct list_head *list,
> +			      struct hci_rp_read_local_codec_caps *rp,
> +			      __u32 len,
> +			      struct hci_op_read_local_codec_caps *sent)
> +{
> +	struct codec_list *entry;
> +
> +	entry = kzalloc(sizeof(*entry) + len, GFP_KERNEL);
> +	if (!entry)
> +		return -ENOMEM;
> +
> +	memcpy(entry->codec_id, sent->codec_id, 5);
> +	entry->transport = sent->transport;
> +	entry->num_caps = rp->num_caps;
> +	if (rp->num_caps)
> +		memcpy(entry->caps, rp->caps, len);
> +	list_add(&entry->list, list);
> +
> +	return 0;
> +}
> +
> +static void hci_codec_list_clear(struct list_head *codec_list)
> +{
> +	struct codec_list *c, *n;
> +
> +	list_for_each_entry_safe(c, n, codec_list, list) {
> +		list_del(&c->list);
> +		kfree(c);
> +	}
> +}
> +
> +static void hci_read_codec_capabilities(struct hci_dev *hdev, void *codec_id,
> +					__u8 transport, bool is_vendor_codec)
> +{
> +	struct hci_op_read_local_codec_caps caps;
> +	__u8 i;
> +
> +	memset(&caps, 0, sizeof(caps));
> +
> +	if (is_vendor_codec) {
> +		caps.codec_id[0] = 0xFF;
> +		memcpy(&caps.codec_id[1], codec_id, 4);
> +	} else {
> +		memcpy(caps.codec_id, codec_id, 1);
> +	}
> +
> +	caps.direction = 0x00;
> +
> +	for (i = 0; i < TRANSPORT_TYPE_MAX; i++) {
> +		if (transport & BIT(i)) {
> +			struct hci_rp_read_local_codec_caps *rp;
> +			struct sk_buff *skb;
> +
> +			caps.transport = i;
> +			skb = __hci_cmd_sync(hdev, HCI_OP_READ_LOCAL_CODEC_CAPS,
> +					     sizeof(caps), &caps,
> +					     HCI_CMD_TIMEOUT);
> +			if (IS_ERR(skb)) {
> +				bt_dev_err(hdev, "Failed to read codec capabilities (%ld)",
> +					   PTR_ERR(skb));
> +				continue;
> +			}
> +
> +			if (skb->len < sizeof(*rp))
> +				goto error;
> +
> +			rp = (void *)skb->data;
> +
> +			if (rp->status)
> +				goto error;
> +
> +			hci_dev_lock(hdev);
> +			hci_codec_list_add(&hdev->local_codecs, rp, skb->len - 2,
> +					   &caps);
> +			hci_dev_unlock(hdev);
> +error:
> +			kfree_skb(skb);
> +		}
> +	}
> +}
> +
> +static void hci_codec_list_parse(struct hci_dev *hdev, __u8 num_codecs,
> +				 void *codec_list, bool is_vendor_codec)
> +{
> +	__u8 i;
> +
> +	for (i = 0; i < num_codecs; i++) {
> +		if (!is_vendor_codec) {
> +			struct hci_standard_codecs *codecs = codec_list;
> +
> +			hci_read_codec_capabilities(hdev, &codecs->codec[i],
> +						    LOCAL_CODEC_ACL_MASK,
> +						    is_vendor_codec);
> +		} else {
> +			struct hci_vendor_codecs *codecs = codec_list;
> +
> +			hci_read_codec_capabilities(hdev, &codecs->codec[i],
> +						    LOCAL_CODEC_ACL_MASK,
> +						    is_vendor_codec);
> +		}
> +	}
> +}
> +
> +static void hci_read_supported_codecs(struct hci_dev *hdev)
> +{
> +	struct sk_buff *skb;
> +	struct hci_rp_read_local_supported_codecs *rp;
> +	struct hci_standard_codecs *std_codecs;
> +	struct hci_vendor_codecs *vendor_codecs;
> +
> +	skb = __hci_cmd_sync(hdev, HCI_OP_READ_LOCAL_CODECS, 0, NULL,
> +			     HCI_CMD_TIMEOUT);
> +
> +	if (IS_ERR(skb)) {
> +		bt_dev_err(hdev, "Failed to read local supported codecs (%ld)",
> +			   PTR_ERR(skb));
> +		return;
> +	}
> +
> +	if (skb->len < sizeof(*rp))
> +		goto error;
> +
> +	rp = (void *)skb->data;
> +
> +	if (rp->status)
> +		goto error;
> +
> +	skb_pull(skb, sizeof(rp->status));
> +
> +	std_codecs = (void *)skb->data;
> +
> +	if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
> +	    + sizeof(std_codecs->num))
> +		goto error;
> +
> +	hci_codec_list_parse(hdev, std_codecs->num, std_codecs, false);
> +
> +	skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
> +		 + sizeof(std_codecs->num));
> +
> +	vendor_codecs = (void *)skb->data;
> +
> +	if (skb->len <
> +	    flex_array_size(vendor_codecs, codec, vendor_codecs->num)
> +	    + sizeof(vendor_codecs->num))
> +		goto error;
> +
> +	hci_codec_list_parse(hdev, vendor_codecs->num, vendor_codecs, true);
> +
> +error:
> +	kfree_skb(skb);
> +}
> +
> +static void hci_init5_req(struct hci_dev *hdev)
> +{
> +	/* Read local codec list if the HCI command is supported */
> +	if (hdev->commands[29] & 0x20)
> +		hci_read_supported_codecs(hdev);
> +}
> +

Actually keep that command in init4 since it can nicely stay at that level.


> static int __hci_init(struct hci_dev *hdev)
> {
> 	int err;
> @@ -937,6 +1093,8 @@ static int __hci_init(struct hci_dev *hdev)
> 	if (err < 0)
> 		return err;
> 
> +	hci_init5_req(hdev);
> +
> 	/* This function is only called when the controller is actually in
> 	 * configured state. When the controller is marked as unconfigured,
> 	 * this initialization procedure is not run.
> @@ -1835,6 +1993,7 @@ int hci_dev_do_close(struct hci_dev *hdev)
> 	memset(hdev->eir, 0, sizeof(hdev->eir));
> 	memset(hdev->dev_class, 0, sizeof(hdev->dev_class));
> 	bacpy(&hdev->random_addr, BDADDR_ANY);
> +	hci_codec_list_clear(&hdev->local_codecs);
> 
> 	hci_req_sync_unlock(hdev);
> 
> @@ -3818,6 +3977,7 @@ struct hci_dev *hci_alloc_dev(void)
> 	INIT_LIST_HEAD(&hdev->conn_hash.list);
> 	INIT_LIST_HEAD(&hdev->adv_instances);
> 	INIT_LIST_HEAD(&hdev->blocked_keys);
> +	INIT_LIST_HEAD(&hdev->local_codecs);
> 
> 	INIT_WORK(&hdev->rx_work, hci_rx_work);
> 	INIT_WORK(&hdev->cmd_work, hci_cmd_work);

Regards

Marcel

