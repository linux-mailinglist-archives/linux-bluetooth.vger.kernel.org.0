Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0151F56DF
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jun 2020 16:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgFJOg5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Jun 2020 10:36:57 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:32974 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgFJOg5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Jun 2020 10:36:57 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id A5C66CECE6;
        Wed, 10 Jun 2020 16:46:44 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v1 3/3] bluetooth: implement read/set default system
 parameters mgmt
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200609140351.153833-4-alainm@chromium.org>
Date:   Wed, 10 Jun 2020 16:36:54 +0200
Cc:     linux-bluetooth@vger.kernel.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <4CD6CBD8-0EC4-47F1-8B05-5AC8BB78B97A@holtmann.org>
References: <20200609140351.153833-1-alainm@chromium.org>
 <20200609140351.153833-4-alainm@chromium.org>
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
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> net/bluetooth/mgmt.c | 429 +++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 429 insertions(+)

I have the feeling that we want to create a net/bluetooth/mgmt_config.c to move all the configuration parameters parsing and handling into a separate. I have the feeling that otherwise mgmt.c will grow quickly.

> 
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 9e8a3cccc6ca..98a4193c8e66 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -111,6 +111,8 @@ static const u16 mgmt_commands[] = {
> 	MGMT_OP_READ_SECURITY_INFO,
> 	MGMT_OP_READ_EXP_FEATURES_INFO,
> 	MGMT_OP_SET_EXP_FEATURE,
> +	MGMT_OP_READ_DEFAULT_SYSTEM_PARAMETERS,
> +	MGMT_OP_SET_DEFAULT_SYSTEM_PARAMETERS,
> };

Please also add the OP_READ_ command to mgmt_untrusted_commands array.

> static const u16 mgmt_events[] = {
> @@ -3849,6 +3851,431 @@ static int set_exp_feature(struct sock *sk, struct hci_dev *hdev,
> 			       MGMT_STATUS_NOT_SUPPORTED);
> }
> 
> +static int read_default_system_parameters(struct sock *sk, struct hci_dev *hdev,
> +					  void *data, u16 data_len)
> +{
> +	struct {
> +		struct mgmt_system_parameter_tlv entry;
> +		union {
> +			/* This is a simplification for now since all values
> +			 * are 16 bits.  In the future, this code may need
> +			 * refactoring to account for variable length values
> +			 * and properly calculate the required buffer size.
> +			 */
> +			u16 value;
> +		};
> +	} __packed params[] = {
> +		/* Please see mgmt-api.txt for documentation of these values */
> +		{
> +			{ 0x0000, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->def_page_scan_type) }
> +		},
> +		{
> +			{ 0x0001, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->def_page_scan_int) }
> +		},
> +		{
> +			{ 0x0002, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->def_page_scan_window) }
> +		},
> +		{
> +			{ 0x0003, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->def_inq_scan_type) }
> +		},
> +		{
> +			{ 0x0004, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->def_inq_scan_int) }
> +		},
> +		{
> +			{ 0x0005, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->def_inq_scan_window) }
> +		},
> +		{
> +			{ 0x0006, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->def_br_lsto) }
> +		},
> +		{
> +			{ 0x0007, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->def_page_timeout) }
> +		},
> +		{
> +			{ 0x0008, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->sniff_min_interval) }
> +		},
> +		{
> +			{ 0x0009, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->sniff_max_interval) }
> +		},
> +		{
> +			{ 0x000a, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_adv_min_interval) }
> +		},
> +		{
> +			{ 0x000b, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_adv_max_interval) }
> +		},
> +		{
> +			{ 0x000c, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->def_multi_adv_rotation_duration) }
> +		},
> +		{
> +			{ 0x000d, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_scan_interval) }
> +		},
> +		{
> +			{ 0x000e, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_scan_window) }
> +		},
> +		{
> +			{ 0x000f, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_scan_int_suspend) }
> +		},
> +		{
> +			{ 0x0010, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_scan_window_suspend) }
> +		},
> +		{
> +			{ 0x0011, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_scan_int_discovery) }
> +		},
> +		{
> +			{ 0x0012, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_scan_window_discovery) }
> +		},
> +		{
> +			{ 0x0013, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_scan_int_adv_monitor) }
> +		},
> +		{
> +			{ 0x0014, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_scan_window_adv_monitor) }
> +		},
> +		{
> +			{ 0x0015, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_scan_int_connect) }
> +		},
> +		{
> +			{ 0x0016, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_scan_window_connect) }
> +		},
> +		{
> +			{ 0x0017, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_conn_min_interval) }
> +		},
> +		{
> +			{ 0x0018, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_conn_max_interval) }
> +		},
> +		{
> +			{ 0x0019, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_conn_latency) }
> +		},
> +		{
> +			{ 0x001a, sizeof(__u16) },
> +			{ cpu_to_le16(hdev->le_supv_timeout) }
> +		},

This is creative and I like it. However I would take it one step further. Define a macro similar USB_DEVICE etc. so you get a simpler table.

	{ HDEV_PARAM(0x0018, le_conn_max_interval) },
	{ HDEV_PARAM(0x0019, le_conn_latency) },
	{ }


> +	};
> +	struct mgmt_rp_read_default_system_parameters *rp = (void *)params;
> +
> +	bt_dev_dbg(hdev, "sock %p", sk);
> +
> +	return mgmt_cmd_complete(sk, hdev->id,
> +				 MGMT_OP_READ_DEFAULT_SYSTEM_PARAMETERS,
> +				 0, rp, sizeof(params));

Please introduce HCI_MGMT_SYSTEM_CONFIG_EVENTS and send them out as described in mgmt-api.txt

> +}
> +
> +#define TO_TLV(x) ((struct mgmt_system_parameter_tlv *)(x))
> +#define TLV_VALUE_CAST(tlv, type) (*((type *)(TO_TLV(tlv)->value)))
> +
> +static int set_default_system_parameters(struct sock *sk, struct hci_dev *hdev,
> +					 void *data, u16 data_len)
> +{
> +	u16 buffer_left = data_len;
> +	u8 *buffer = data;
> +
> +	if (buffer_left < sizeof(struct mgmt_system_parameter_tlv)) {
> +		return mgmt_cmd_status(sk, hdev->id,
> +				       MGMT_OP_SET_DEFAULT_SYSTEM_PARAMETERS,
> +				       MGMT_STATUS_INVALID_PARAMS);
> +	}
> +
> +	/* First pass to validate the tlv */
> +	while (buffer_left >= sizeof(struct mgmt_system_parameter_tlv)) {
> +		const u8 len = TO_TLV(buffer)->length;
> +		const u16 exp_len = sizeof(struct mgmt_system_parameter_tlv) +
> +				    len;
> +		const u16 type = le16_to_cpu(TO_TLV(buffer)->type);
> +
> +		if (buffer_left < exp_len) {
> +			bt_dev_warn(hdev, "invalid len left %d, exp >= %d",
> +				    buffer_left, exp_len);
> +
> +			return mgmt_cmd_status(sk, hdev->id,
> +					MGMT_OP_SET_DEFAULT_SYSTEM_PARAMETERS,
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
> +					MGMT_OP_SET_DEFAULT_SYSTEM_PARAMETERS,
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
> +	while (buffer_left >= sizeof(struct mgmt_system_parameter_tlv)) {
> +		const u8 len = TO_TLV(buffer)->length;
> +		const u16 exp_len = sizeof(struct mgmt_system_parameter_tlv) +
> +				    len;
> +		const u16 type = le16_to_cpu(TO_TLV(buffer)->type);
> +
> +		switch (type) {
> +		case 0x0000:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->def_page_scan_type = le16_to_cpu(val);

I would really turn this into a single macro that also does the byte_swapping and more importantly also the unaligned access. Mainly because I highly doubt the TLV_VALUE_CAST will actually work on ARM platforms. So I am thinking something along the lines of this:

		hdev->def_page_scan_type = TLV_GET_LE16(buffer);

> +			break;
> +		}
> +		case 0x0001:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->def_page_scan_int = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x0002:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->def_page_scan_window = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x0003:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->def_inq_scan_type = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x0004:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->def_inq_scan_int = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x0005:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->def_inq_scan_window = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x0006:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->def_br_lsto = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x0007:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->def_page_timeout = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x0008:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->sniff_min_interval = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x0009:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->sniff_max_interval = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x000a:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_adv_min_interval = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x000b:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_adv_max_interval = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x000c:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->def_multi_adv_rotation_duration =
> +							       le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x000d:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_scan_interval = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x000e:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_scan_window = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x000f:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_scan_int_suspend = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x0010:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_scan_window_suspend = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x0011:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_scan_int_discovery = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x00012:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_scan_window_discovery = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x00013:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_scan_int_adv_monitor = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x00014:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_scan_window_adv_monitor = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x00015:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_scan_int_connect = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x00016:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_scan_window_connect = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x00017:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_conn_min_interval = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x00018:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_conn_max_interval = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x00019:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_conn_latency = le16_to_cpu(val);
> +			break;
> +		}
> +		case 0x0001a:
> +		{
> +			const u16 val = TLV_VALUE_CAST(buffer, u16);
> +
> +			hdev->le_supv_timeout = le16_to_cpu(val);
> +			break;
> +		}
> +		default:
> +			bt_dev_warn(hdev, "unsupported parameter %u",
> +				    buffer[0]);
> +			break;
> +		}
> +
> +		buffer_left -= exp_len;
> +		buffer += exp_len;
> +	}
> +
> +	return mgmt_cmd_status(sk, hdev->id,
> +			       MGMT_OP_SET_DEFAULT_SYSTEM_PARAMETERS,
> +			       MGMT_STATUS_SUCCESS);
> +}
> +
> static void read_local_oob_data_complete(struct hci_dev *hdev, u8 status,
> 				         u16 opcode, struct sk_buff *skb)
> {
> @@ -7297,6 +7724,8 @@ static const struct hci_mgmt_handler mgmt_handlers[] = {
> 	{ set_exp_feature,         MGMT_SET_EXP_FEATURE_SIZE,
> 						HCI_MGMT_VAR_LEN |
> 						HCI_MGMT_HDEV_OPTIONAL },
> +	{ read_default_system_parameters, 0, HCI_MGMT_UNTRUSTED },
> +	{ set_default_system_parameters, 0, HCI_MGMT_VAR_LEN },
> };
> 
> void mgmt_index_added(struct hci_dev *hdev)

Regards

Marcel

