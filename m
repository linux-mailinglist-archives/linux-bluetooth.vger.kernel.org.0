Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB50D1F78DB
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 Jun 2020 15:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgFLNqg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 12 Jun 2020 09:46:36 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58138 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgFLNqf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 12 Jun 2020 09:46:35 -0400
Received: from marcel-macbook.fritz.box (ip-109-41-64-170.web.vodafone.de [109.41.64.170])
        by mail.holtmann.org (Postfix) with ESMTPSA id D6931CED03;
        Fri, 12 Jun 2020 15:56:23 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 3/3] bluetooth: implement read/set default system
 parameters mgmt
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200611020157.70230-4-alainm@chromium.org>
Date:   Fri, 12 Jun 2020 15:46:32 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        kernel test robot <lkp@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <CE5B40FA-93DD-4E17-8C0D-54AB09BFC283@holtmann.org>
References: <20200611020157.70230-1-alainm@chromium.org>
 <20200611020157.70230-4-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This patch implements the read default system parameters and the set
> default system parameters mgmt commands.
> 
> Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> Changes in v3:
> -Fixing sparse errors
> 
> Changes in v2: None
> 
> include/net/bluetooth/mgmt.h |   2 +-
> net/bluetooth/Makefile       |   2 +-
> net/bluetooth/mgmt.c         |   6 +
> net/bluetooth/mgmt_config.c  | 253 +++++++++++++++++++++++++++++++++++
> net/bluetooth/mgmt_config.h  |  11 ++
> 5 files changed, 272 insertions(+), 2 deletions(-)
> create mode 100644 net/bluetooth/mgmt_config.c
> create mode 100644 net/bluetooth/mgmt_config.h
> 
> diff --git a/include/net/bluetooth/mgmt.h b/include/net/bluetooth/mgmt.h
> index 09452d2ea6d3..39e849744f28 100644
> --- a/include/net/bluetooth/mgmt.h
> +++ b/include/net/bluetooth/mgmt.h
> @@ -705,7 +705,7 @@ struct mgmt_rp_set_exp_feature {
> #define MGMT_OP_READ_DEF_SYSTEM_CONFIG	0x004b
> 
> struct mgmt_tlv {
> -	__u16 type;
> +	__le16 type;
> 	__u8  length;
> 	__u8  value[];
> } __packed;

I fixed this cleanly in the first patch.

> diff --git a/net/bluetooth/Makefile b/net/bluetooth/Makefile
> index 41dd541a44a5..1c645fba8c49 100644
> --- a/net/bluetooth/Makefile
> +++ b/net/bluetooth/Makefile
> @@ -14,7 +14,7 @@ bluetooth_6lowpan-y := 6lowpan.o
> 
> bluetooth-y := af_bluetooth.o hci_core.o hci_conn.o hci_event.o mgmt.o \
> 	hci_sock.o hci_sysfs.o l2cap_core.o l2cap_sock.o smp.o lib.o \
> -	ecdh_helper.o hci_request.o mgmt_util.o
> +	ecdh_helper.o hci_request.o mgmt_util.o mgmt_config.o
> 
> bluetooth-$(CONFIG_BT_BREDR) += sco.o
> bluetooth-$(CONFIG_BT_HS) += a2mp.o amp.o
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 9e8a3cccc6ca..69cd4f756a0d 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -36,6 +36,7 @@
> #include "hci_request.h"
> #include "smp.h"
> #include "mgmt_util.h"
> +#include "mgmt_config.h"
> 
> #define MGMT_VERSION	1
> #define MGMT_REVISION	17
> @@ -111,6 +112,8 @@ static const u16 mgmt_commands[] = {
> 	MGMT_OP_READ_SECURITY_INFO,
> 	MGMT_OP_READ_EXP_FEATURES_INFO,
> 	MGMT_OP_SET_EXP_FEATURE,
> +	MGMT_OP_READ_DEF_SYSTEM_CONFIG,
> +	MGMT_OP_SET_DEF_SYSTEM_CONFIG,
> };
> 
> static const u16 mgmt_events[] = {
> @@ -162,6 +165,7 @@ static const u16 mgmt_untrusted_commands[] = {
> 	MGMT_OP_READ_EXT_INFO,
> 	MGMT_OP_READ_SECURITY_INFO,
> 	MGMT_OP_READ_EXP_FEATURES_INFO,
> +	MGMT_OP_READ_DEF_SYSTEM_CONFIG,
> };
> 
> static const u16 mgmt_untrusted_events[] = {
> @@ -7297,6 +7301,8 @@ static const struct hci_mgmt_handler mgmt_handlers[] = {
> 	{ set_exp_feature,         MGMT_SET_EXP_FEATURE_SIZE,
> 						HCI_MGMT_VAR_LEN |
> 						HCI_MGMT_HDEV_OPTIONAL },
> +	{ read_def_system_config, 0, HCI_MGMT_UNTRUSTED },
> +	{ set_def_system_config, 0, HCI_MGMT_VAR_LEN },
> };

I also added _SIZE constants for you.

> 
> void mgmt_index_added(struct hci_dev *hdev)
> diff --git a/net/bluetooth/mgmt_config.c b/net/bluetooth/mgmt_config.c
> new file mode 100644
> index 000000000000..f6dfbe93542c
> --- /dev/null
> +++ b/net/bluetooth/mgmt_config.c
> @@ -0,0 +1,253 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2020 Google Corporation
> + */
> +
> +#include <net/bluetooth/bluetooth.h>
> +#include <net/bluetooth/hci_core.h>
> +#include <net/bluetooth/mgmt.h>
> +
> +#include "mgmt_util.h"
> +#include "mgmt_config.h"
> +
> +#define HDEV_PARAM_U16(_param_code_, _param_name_) \
> +{ \
> +	{ cpu_to_le16(_param_code_), sizeof(__u16) }, \
> +	{ cpu_to_le16(hdev->_param_name_) } \
> +}
> +
> +int read_def_system_config(struct sock *sk, struct hci_dev *hdev, void *data,
> +			   u16 data_len)
> +{
> +	struct {
> +		struct mgmt_tlv entry;
> +		union {
> +			/* This is a simplification for now since all values
> +			 * are 16 bits.  In the future, this code may need
> +			 * refactoring to account for variable length values
> +			 * and properly calculate the required buffer size.
> +			 */
> +			__le16 value;
> +		};
> +	} __packed params[] = {
> +		/* Please see mgmt-api.txt for documentation of these values */
> +		HDEV_PARAM_U16(0x0000, def_page_scan_type),
> +		HDEV_PARAM_U16(0x0001, def_page_scan_int),
> +		HDEV_PARAM_U16(0x0002, def_page_scan_window),
> +		HDEV_PARAM_U16(0x0003, def_inq_scan_type),
> +		HDEV_PARAM_U16(0x0004, def_inq_scan_int),
> +		HDEV_PARAM_U16(0x0005, def_inq_scan_window),
> +		HDEV_PARAM_U16(0x0006, def_br_lsto),
> +		HDEV_PARAM_U16(0x0007, def_page_timeout),
> +		HDEV_PARAM_U16(0x0008, sniff_min_interval),
> +		HDEV_PARAM_U16(0x0009, sniff_max_interval),
> +		HDEV_PARAM_U16(0x000a, le_adv_min_interval),
> +		HDEV_PARAM_U16(0x000b, le_adv_max_interval),
> +		HDEV_PARAM_U16(0x000c, def_multi_adv_rotation_duration),
> +		HDEV_PARAM_U16(0x000d, le_scan_interval),
> +		HDEV_PARAM_U16(0x000e, le_scan_window),
> +		HDEV_PARAM_U16(0x000f, le_scan_int_suspend),
> +		HDEV_PARAM_U16(0x0010, le_scan_window_suspend),
> +		HDEV_PARAM_U16(0x0011, le_scan_int_discovery),
> +		HDEV_PARAM_U16(0x0012, le_scan_window_discovery),
> +		HDEV_PARAM_U16(0x0013, le_scan_int_adv_monitor),
> +		HDEV_PARAM_U16(0x0014, le_scan_window_adv_monitor),
> +		HDEV_PARAM_U16(0x0015, le_scan_int_connect),
> +		HDEV_PARAM_U16(0x0016, le_scan_window_connect),
> +		HDEV_PARAM_U16(0x0017, le_conn_min_interval),
> +		HDEV_PARAM_U16(0x0018, le_conn_max_interval),
> +		HDEV_PARAM_U16(0x0019, le_conn_latency),
> +		HDEV_PARAM_U16(0x001a, le_supv_timeout),
> +	};
> +	struct mgmt_rp_read_def_system_config *rp = (void *)params;
> +
> +	bt_dev_dbg(hdev, "sock %p", sk);
> +
> +	return mgmt_cmd_complete(sk, hdev->id,
> +				 MGMT_OP_READ_DEF_SYSTEM_CONFIG,
> +				 0, rp, sizeof(params));
> +}
> +
> +#define TO_TLV(x)		((struct mgmt_tlv *)(x))
> +#define TLV_GET_LE16(tlv)	le16_to_cpu(*((__le16 *)(TO_TLV(tlv)->value)))
> +
> +int set_def_system_config(struct sock *sk, struct hci_dev *hdev, void *data,
> +			  u16 data_len)
> +{
> +	u16 buffer_left = data_len;
> +	u8 *buffer = data;
> +
> +	if (buffer_left < sizeof(struct mgmt_tlv)) {
> +		return mgmt_cmd_status(sk, hdev->id,
> +				       MGMT_OP_SET_DEF_SYSTEM_CONFIG,
> +				       MGMT_STATUS_INVALID_PARAMS);
> +	}
> +
> +	/* First pass to validate the tlv */
> +	while (buffer_left >= sizeof(struct mgmt_tlv)) {
> +		const u8 len = TO_TLV(buffer)->length;
> +		const u16 exp_len = sizeof(struct mgmt_tlv) +
> +				    len;
> +		const u16 type = le16_to_cpu(TO_TLV(buffer)->type);
> +
> +		if (buffer_left < exp_len) {
> +			bt_dev_warn(hdev, "invalid len left %d, exp >= %d",
> +				    buffer_left, exp_len);
> +
> +			return mgmt_cmd_status(sk, hdev->id,
> +					MGMT_OP_SET_DEF_SYSTEM_CONFIG,
> +					MGMT_STATUS_INVALID_PARAMS);
> +		}
> +
> +		/* Please see mgmt-api.txt for documentation of these values */
> +		switch (type) {
> +		case 0x0000:
> +		case 0x0001:
> +		case 0x0002:
> +		case 0x0003:
> +		case 0x0004:
> +		case 0x0005:
> +		case 0x0006:
> +		case 0x0007:
> +		case 0x0008:
> +		case 0x0009:
> +		case 0x000a:
> +		case 0x000b:
> +		case 0x000c:
> +		case 0x000d:
> +		case 0x000e:
> +		case 0x000f:
> +		case 0x0010:
> +		case 0x0011:
> +		case 0x0012:
> +		case 0x0013:
> +		case 0x0014:
> +		case 0x0015:
> +		case 0x0016:
> +		case 0x0017:
> +		case 0x0018:
> +		case 0x0019:
> +		case 0x001a:
> +			if (len != sizeof(u16)) {
> +				bt_dev_warn(hdev, "invalid length %d, exp %zu for type %d",
> +					    len, sizeof(u16), type);
> +
> +				return mgmt_cmd_status(sk, hdev->id,
> +					MGMT_OP_SET_DEF_SYSTEM_CONFIG,
> +					MGMT_STATUS_INVALID_PARAMS);
> +			}
> +			break;
> +		default:
> +			bt_dev_warn(hdev, "unsupported parameter %u", type);
> +			break;
> +		}
> +
> +		buffer_left -= exp_len;
> +		buffer += exp_len;
> +	}
> +
> +	buffer_left = data_len;
> +	buffer = data;
> +	while (buffer_left >= sizeof(struct mgmt_tlv)) {
> +		const u8 len = TO_TLV(buffer)->length;
> +		const u16 exp_len = sizeof(struct mgmt_tlv) +
> +				    len;
> +		const u16 type = le16_to_cpu(TO_TLV(buffer)->type);
> +
> +		switch (type) {
> +		case 0x0000:
> +			hdev->def_page_scan_type = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x0001:
> +			hdev->def_page_scan_int = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x0002:
> +			hdev->def_page_scan_window = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x0003:
> +			hdev->def_inq_scan_type = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x0004:
> +			hdev->def_inq_scan_int = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x0005:
> +			hdev->def_inq_scan_window = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x0006:
> +			hdev->def_br_lsto = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x0007:
> +			hdev->def_page_timeout = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x0008:
> +			hdev->sniff_min_interval = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x0009:
> +			hdev->sniff_max_interval = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x000a:
> +			hdev->le_adv_min_interval = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x000b:
> +			hdev->le_adv_max_interval = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x000c:
> +			hdev->def_multi_adv_rotation_duration =
> +							   TLV_GET_LE16(buffer);
> +			break;
> +		case 0x000d:
> +			hdev->le_scan_interval = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x000e:
> +			hdev->le_scan_window = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x000f:
> +			hdev->le_scan_int_suspend = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x0010:
> +			hdev->le_scan_window_suspend = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x0011:
> +			hdev->le_scan_int_discovery = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x00012:
> +			hdev->le_scan_window_discovery = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x00013:
> +			hdev->le_scan_int_adv_monitor = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x00014:
> +			hdev->le_scan_window_adv_monitor = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x00015:
> +			hdev->le_scan_int_connect = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x00016:
> +			hdev->le_scan_window_connect = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x00017:
> +			hdev->le_conn_min_interval = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x00018:
> +			hdev->le_conn_max_interval = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x00019:
> +			hdev->le_conn_latency = TLV_GET_LE16(buffer);
> +			break;
> +		case 0x0001a:
> +			hdev->le_supv_timeout = TLV_GET_LE16(buffer);
> +			break;
> +		default:
> +			bt_dev_warn(hdev, "unsupported parameter %u", type);
> +			break;
> +		}
> +
> +		buffer_left -= exp_len;
> +		buffer += exp_len;
> +	}
> +
> +	return mgmt_cmd_status(sk, hdev->id,
> +			       MGMT_OP_SET_DEF_SYSTEM_CONFIG,
> +			       MGMT_STATUS_SUCCESS);
> +}
> diff --git a/net/bluetooth/mgmt_config.h b/net/bluetooth/mgmt_config.h
> new file mode 100644
> index 000000000000..51da6e63b1a0
> --- /dev/null
> +++ b/net/bluetooth/mgmt_config.h
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2020 Google Corporation
> + */
> +
> +int read_def_system_config(struct sock *sk, struct hci_dev *hdev, void *data,
> +			   u16 data_len);
> +
> +int set_def_system_config(struct sock *sk, struct hci_dev *hdev, void *data,
> +			  u16 data_len);

Other than that, patch has been applied to bluetooth-next tree.

Regards

Marcel

