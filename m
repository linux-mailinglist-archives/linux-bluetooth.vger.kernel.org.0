Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210C03A89B4
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Jun 2021 21:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhFOTpx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 15 Jun 2021 15:45:53 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:46747 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbhFOTpw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 15 Jun 2021 15:45:52 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 4E684CECFB;
        Tue, 15 Jun 2021 21:51:47 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v9 10/10] Bluetooth: Add support for msbc coding format
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210608122455.19583-10-kiran.k@intel.com>
Date:   Tue, 15 Jun 2021 21:43:45 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <AA50351C-7DF2-4732-8493-A57616918B11@holtmann.org>
References: <20210608122455.19583-1-kiran.k@intel.com>
 <20210608122455.19583-10-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> In Enhanced_Setup_Synchronous_Command, add support for msbc
> coding format
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
> ---
> include/net/bluetooth/bluetooth.h |  1 +
> net/bluetooth/hci_conn.c          | 27 ++++++++++++++++++++++++++-
> 2 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
> index af2809121571..056699224da7 100644
> --- a/include/net/bluetooth/bluetooth.h
> +++ b/include/net/bluetooth/bluetooth.h
> @@ -175,6 +175,7 @@ struct bt_codecs {
> 
> #define CODING_FORMAT_CVSD		0x02
> #define CODING_FORMAT_TRANSPARENT	0x03
> +#define CODING_FORMAT_MSBC		0x05
> 
> __printf(1, 2)
> void bt_info(const char *fmt, ...);
> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> index 9569b21adb88..73c134459361 100644
> --- a/net/bluetooth/hci_conn.c
> +++ b/net/bluetooth/hci_conn.c
> @@ -328,6 +328,32 @@ bool hci_enhanced_setup_sync(struct hci_conn *conn, __u16 handle)
> 	cp.rx_bandwidth   = cpu_to_le32(0x00001f40);
> 
> 	switch (conn->codec.id) {
> +	case CODING_FORMAT_MSBC:
> +		if (!find_next_esco_param(conn, esco_param_msbc,
> +					  ARRAY_SIZE(esco_param_msbc)))
> +			return false;
> +
> +		param = &esco_param_msbc[conn->attempt - 1];
> +		cp.tx_coding_format.id = 0x05;
> +		cp.rx_coding_format.id = 0x05;
> +		cp.tx_codec_frame_size = __cpu_to_le16(60);
> +		cp.rx_codec_frame_size = __cpu_to_le16(60);
> +		cp.in_bandwidth = __cpu_to_le32(32000);
> +		cp.out_bandwidth = __cpu_to_le32(32000);
> +		cp.in_coding_format.id = 0x04;
> +		cp.out_coding_format.id = 0x04;
> +		cp.in_coded_data_size = __cpu_to_le16(16);
> +		cp.out_coded_data_size = __cpu_to_le16(16);
> +		cp.in_pcm_data_format = 2;
> +		cp.out_pcm_data_format = 2;
> +		cp.in_pcm_sample_payload_msb_pos = 0;
> +		cp.out_pcm_sample_payload_msb_pos = 0;
> +		cp.in_data_path = conn->codec.data_path;
> +		cp.out_data_path = conn->codec.data_path;
> +		cp.in_trasnport_unit_size = 1;
> +		cp.out_trasnport_unit_size = 1;

so s/trasnport/transport/

Please spellcheck your structs.

> +		break;
> +
> 	case CODING_FORMAT_TRANSPARENT:
> 		if (!find_next_esco_param(conn, esco_param_msbc,
> 					  ARRAY_SIZE(esco_param_msbc)))
> @@ -383,7 +409,6 @@ bool hci_enhanced_setup_sync(struct hci_conn *conn, __u16 handle)
> 		cp.in_trasnport_unit_size = 16;
> 		cp.out_trasnport_unit_size = 16;
> 		break;
> -

We can not have these random hunks in patches. You need to review your final set before sending it out.

Regards

Marcel

