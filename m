Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87A2A13B248
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Jan 2020 19:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgANSnM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 Jan 2020 13:43:12 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:55611 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgANSnM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 Jan 2020 13:43:12 -0500
Received: from marcel-macpro.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 399CCCECE2;
        Tue, 14 Jan 2020 19:52:28 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v2] Bluetooth: Store periodic advertiser list size
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1578592599-9605-1-git-send-email-ankit.p.navik@intel.com>
Date:   Tue, 14 Jan 2020 19:43:10 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <DDF139B1-2CF2-430B-8546-185AF0608DF4@holtmann.org>
References: <1578592599-9605-1-git-send-email-ankit.p.navik@intel.com>
To:     Ankit Navik <ankit.p.navik@intel.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Ankit,

> When controller supports the Read LE Periodic Advertiser List Size feature,
> the total number of list size are read and now stored.
> 
> Signed-off-by: Ankit Navik <ankit.p.navik@intel.com>
> ---
> include/net/bluetooth/hci.h      |  6 ++++++
> include/net/bluetooth/hci_core.h |  2 ++
> net/bluetooth/hci_core.c         |  8 ++++++++
> net/bluetooth/hci_debugfs.c      | 19 +++++++++++++++++++
> net/bluetooth/hci_event.c        | 18 ++++++++++++++++++
> 5 files changed, 53 insertions(+)
> 
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index eccb6b2..3ef4bae 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -1718,6 +1718,12 @@ struct hci_cp_le_set_adv_set_rand_addr {
> 	bdaddr_t  bdaddr;
> } __packed;
> 
> +#define HCI_OP_LE_READ_PERIODIC_ADV_LIST_SIZE	0x204a
> +struct hci_rp_le_read_periodic_adv_list_size {
> +	__u8 status;
> +	__u8 size;
> +} __packed;
> +

if patches depend on each other, please send them in a series. This makes it easier for me to test them.

> #define HCI_OP_LE_READ_TX_POWER		0x204b
> struct hci_rp_le_read_tx_power {
> 	__u8 status;
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
> index f3d389d..5e847c6 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -239,6 +239,7 @@ struct hci_dev {
> 	__u8		le_features[8];
> 	__u8		le_white_list_size;
> 	__u8		le_resolv_list_size;
> +	__u8		le_periodic_adv_list_size;
> 	__u8		le_num_of_adv_sets;
> 	__u8		le_states[8];
> 	__u8		commands[64];
> @@ -394,6 +395,7 @@ struct hci_dev {
> 	struct list_head	remote_oob_data;
> 	struct list_head	le_white_list;
> 	struct list_head	le_resolv_list;
> +	struct list_head	le_periodic_adv_list;
> 	struct list_head	le_conn_params;
> 	struct list_head	pend_le_conns;
> 	struct list_head	pend_le_reports;
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 9e19d5a..9f9262d 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -757,6 +757,12 @@ static int hci_init3_req(struct hci_request *req, unsigned long opt)
> 			hci_req_add(req, HCI_OP_LE_CLEAR_RESOLV_LIST, 0, NULL);
> 		}
> 
> +		if (hdev->commands[44]& 0x40) {
> +			/* Read LE periodic Advertiser List */
> +			hci_req_add(req, HCI_OP_LE_READ_PERIODIC_ADV_LIST_SIZE,
> +				    0, NULL);
> +		}
> +
> 		if (hdev->le_features[0] & HCI_LE_DATA_LEN_EXT) {
> 			/* Read LE Maximum Data Length */
> 			hci_req_add(req, HCI_OP_LE_READ_MAX_DATA_LEN, 0, NULL);
> @@ -3239,6 +3245,7 @@ struct hci_dev *hci_alloc_dev(void)
> 	INIT_LIST_HEAD(&hdev->remote_oob_data);
> 	INIT_LIST_HEAD(&hdev->le_white_list);
> 	INIT_LIST_HEAD(&hdev->le_resolv_list);
> +	INIT_LIST_HEAD(&hdev->le_periodic_adv_list);
> 	INIT_LIST_HEAD(&hdev->le_conn_params);
> 	INIT_LIST_HEAD(&hdev->pend_le_conns);
> 	INIT_LIST_HEAD(&hdev->pend_le_reports);
> @@ -3441,6 +3448,7 @@ void hci_unregister_dev(struct hci_dev *hdev)
> 	hci_adv_instances_clear(hdev);
> 	hci_bdaddr_list_clear(&hdev->le_white_list);
> 	hci_bdaddr_list_clear(&hdev->le_resolv_list);
> +	hci_bdaddr_list_clear(&hdev->le_periodic_adv_list);
> 	hci_conn_params_clear_all(hdev);
> 	hci_discovery_filter_clear(hdev);
> 	hci_dev_unlock(hdev);
> diff --git a/net/bluetooth/hci_debugfs.c b/net/bluetooth/hci_debugfs.c
> index 402e2cc..062fd25 100644
> --- a/net/bluetooth/hci_debugfs.c
> +++ b/net/bluetooth/hci_debugfs.c
> @@ -740,6 +740,21 @@ static int resolv_list_show(struct seq_file *f, void *ptr)
> 
> DEFINE_SHOW_ATTRIBUTE(resolv_list);
> 
> +static int periodic_adv_list_show(struct seq_file *f, void *ptr)
> +{
> +	struct hci_dev *hdev = f->private;
> +	struct bdaddr_list *b;
> +
> +	hci_dev_lock(hdev);
> +	list_for_each_entry(b, &hdev->le_periodic_adv_list, list)
> +		seq_printf(f, "%pMR (type %u)\n", &b->bdaddr, b->bdaddr_type);
> +	hci_dev_unlock(hdev);
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(periodic_adv_list);
> +
> static int identity_resolving_keys_show(struct seq_file *f, void *ptr)
> {
> 	struct hci_dev *hdev = f->private;
> @@ -1034,6 +1049,10 @@ void hci_debugfs_create_le(struct hci_dev *hdev)
> 			  &hdev->le_resolv_list_size);
> 	debugfs_create_file("resolv_list", 0444, hdev->debugfs, hdev,
> 			    &resolv_list_fops);
> +	debugfs_create_u8("periodic_adv_list_size", 0444, hdev->debugfs,
> +			  &hdev->le_periodic_adv_list_size);
> +	debugfs_create_file("periodic_adv_list", 0444, hdev->debugfs, hdev,
> +			    &periodic_adv_list_fops);
> 	debugfs_create_file("identity_resolving_keys", 0400, hdev->debugfs,
> 			    hdev, &identity_resolving_keys_fops);
> 	debugfs_create_file("long_term_keys", 0400, hdev->debugfs, hdev,
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 3646f77..082a088 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -222,6 +222,7 @@ static void hci_cc_reset(struct hci_dev *hdev, struct sk_buff *skb)
> 
> 	hci_bdaddr_list_clear(&hdev->le_white_list);
> 	hci_bdaddr_list_clear(&hdev->le_resolv_list);
> +	hci_bdaddr_list_clear(&hdev->le_periodic_adv_list);
> }
> 
> static void hci_cc_read_stored_link_key(struct hci_dev *hdev,
> @@ -1720,6 +1721,19 @@ static void hci_cc_read_rssi(struct hci_dev *hdev, struct sk_buff *skb)
> 	hci_dev_unlock(hdev);
> }
> 
> +static void hci_cc_le_read_periodic_adv_list_size(struct hci_dev *hdev,
> +					   struct sk_buff *skb)
> +{
> +	struct hci_rp_le_read_periodic_adv_list_size *rp = (void *) skb->data;
> +
> +	BT_DBG("%s status 0x%2.2x size %u", hdev->name, rp->status, rp->size);
> +
> +	if (rp->status)
> +		return;
> +
> +	hdev->le_periodic_adv_list_size = rp->size;
> +}
> +
> static void hci_cc_read_tx_power(struct hci_dev *hdev, struct sk_buff *skb)
> {
> 	struct hci_cp_read_tx_power *sent;
> @@ -3427,6 +3441,10 @@ static void hci_cmd_complete_evt(struct hci_dev *hdev, struct sk_buff *skb,
> 		hci_cc_le_read_max_data_len(hdev, skb);
> 		break;
> 
> +	case HCI_OP_LE_READ_PERIODIC_ADV_LIST_SIZE:
> +		hci_cc_le_read_periodic_adv_list_size(hdev, skb);
> +		break;
> +
> 	case HCI_OP_LE_READ_TX_POWER:
> 		hci_cc_le_read_tx_power(hdev, skb);
> 		break;

This patch does two things. Please focus on just doing one at a time or do both things correctly. Right now this patch is not complete.

Regards

Marcel

