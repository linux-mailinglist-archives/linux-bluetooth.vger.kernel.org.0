Return-Path: <linux-bluetooth+bounces-5067-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F85C8D7C2E
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Jun 2024 09:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B606285044
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Jun 2024 07:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D403C064;
	Mon,  3 Jun 2024 07:09:19 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C3D3AC0C;
	Mon,  3 Jun 2024 07:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717398559; cv=none; b=dOmfvvEaZZ6aFZdyOgC/Zdcm2SkL4i6g+Ny7GxTZ10RfTofje3Rwsc7EkU0CUDa6nlRTJQwvzUl29CdCm08Qf+57ANKpeTX4g8DitE7+GBVE98bdFHfTmNi/Jb75oCS+7K5ZiJ6Nf9IUNHphBqyn6FyngRA8lbhepbMi241r8T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717398559; c=relaxed/simple;
	bh=TSAOtr8sheTBhZFjKCBZYmQPbrwbVxDGpOMc1B0GEyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpblOdP1jyfSMoXJe4G/9T8S6NQKL3Yt7ZeoO8D5yStYT6537i8WTUWYcm8cCvE7kdJ9zWJqfsqbUcJ2EB3h3Z0zi71tjgmpXvYyV1KtMijH1O7mqyGUEP92zXBA/jchRAisx/NPwBwcEeU8anf72p9g1M8K8vyuV65RuBTB/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.224] (ip5f5aee76.dynamic.kabel-deutschland.de [95.90.238.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 11CD661E5FE01;
	Mon,  3 Jun 2024 09:08:59 +0200 (CEST)
Message-ID: <1793d793-2282-43a4-a65d-abfcb590f5cc@molgen.mpg.de>
Date: Mon, 3 Jun 2024 09:08:58 +0200
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] Bluetooth: btnxpuart: Add handling for
 boot-signature timeout errors
To: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 amitkumar.karwar@nxp.com, rohit.fule@nxp.com, sherry.sun@nxp.com,
 ziniu.wang_1@nxp.com, haibo.chen@nxp.com, LnxRevLi@nxp.com
References: <20240603063753.134272-1-neeraj.sanjaykale@nxp.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240603063753.134272-1-neeraj.sanjaykale@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Neeraj,


Am 03.06.24 um 08:37 schrieb Neeraj Sanjay Kale:
> This handles the timeout errors seen in the bootloader signatures during
> FW download.

Please add the error to the commit message.

> When the bootloader does not receive a response packet from the host
> within a specific time, it adds an error code to the bootloader
> signature while requesting for the FW chunk from the same offset.
> 
> The host is expected to clear this error code with a NAK, and reply to
> only those bootloader signatures which have error code 0.
> 
> This error handling is valid for data_req bootloader signatures for V3
> and future bootloader versions.
> 
> Signed-off-by: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>

Add a Fixes: tag?

> ---
>   drivers/bluetooth/btnxpuart.c | 46 ++++++++++++++++++++++++++++++++---
>   1 file changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
> index 0b93c2ff29e4..2018513fb961 100644
> --- a/drivers/bluetooth/btnxpuart.c
> +++ b/drivers/bluetooth/btnxpuart.c
> @@ -187,6 +187,10 @@ struct btnxpuart_dev {
>   #define NXP_NAK_V3		0x7b
>   #define NXP_CRC_ERROR_V3	0x7c
>   
> +#define NXP_ACK_RX_TIMEOUT	0x0002
> +#define NXP_HDR_RX_TIMEOUT	0x0003
> +#define NXP_DATA_RX_TIMEOUT	0x0004
> +

Please mention the datasheet name, revision and section in the commit 
message for review.

>   #define HDR_LEN			16
>   
>   #define NXP_RECV_CHIP_VER_V1 \
> @@ -277,6 +281,12 @@ struct nxp_bootloader_cmd {
>   	__be32 crc;
>   } __packed;
>   
> +struct nxp_v3_rx_timeout_nak {
> +	u8 nak;
> +	__le32 offset;
> +	u8 crc;
> +} __packed;
> +
>   static u8 crc8_table[CRC8_TABLE_SIZE];
>   
>   /* Default configurations */
> @@ -899,6 +909,32 @@ static int nxp_recv_chip_ver_v3(struct hci_dev *hdev, struct sk_buff *skb)
>   	return 0;
>   }
>   
> +static void nxp_handle_fw_dnld_error(struct hci_dev *hdev, struct v3_data_req *req)

I would not use abbreviations, and use download.

> +{
> +	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
> +	__u32 offset = __le32_to_cpu(req->offset);
> +	__u16 err = __le16_to_cpu(req->error);
> +	struct nxp_v3_rx_timeout_nak nak_tx_buf;
> +
> +	switch (err) {
> +	case NXP_ACK_RX_TIMEOUT:
> +	case NXP_HDR_RX_TIMEOUT:
> +	case NXP_DATA_RX_TIMEOUT:
> +		nak_tx_buf.nak = NXP_NAK_V3;
> +		nak_tx_buf.offset = __cpu_to_le32(offset);
> +		nak_tx_buf.crc = crc8(crc8_table, (u8 *)&nak_tx_buf,

Can the cast be avoided and written differently?

> +				      sizeof(nak_tx_buf) - 1, 0xff);
> +		serdev_device_write_buf(nxpdev->serdev, (u8 *)&nak_tx_buf,
> +					sizeof(nak_tx_buf));
> +		break;
> +	default:
> +		bt_dev_dbg(hdev, "Unknown bootloader error: %d", err);
> +		break;
> +
> +	}
> +
> +}
> +
>   static int nxp_recv_fw_req_v3(struct hci_dev *hdev, struct sk_buff *skb)
>   {
>   	struct btnxpuart_dev *nxpdev = hci_get_drvdata(hdev);
> @@ -913,7 +949,12 @@ static int nxp_recv_fw_req_v3(struct hci_dev *hdev, struct sk_buff *skb)
>   	if (!req || !nxpdev->fw)
>   		goto free_skb;
>   
> -	nxp_send_ack(NXP_ACK_V3, hdev);
> +	if (!req->error) {
> +		nxp_send_ack(NXP_ACK_V3, hdev);
> +	} else {
> +		nxp_handle_fw_dnld_error(hdev, req);
> +		goto free_skb;
> +	}
>   
>   	len = __le16_to_cpu(req->len);
>   
> @@ -940,9 +981,6 @@ static int nxp_recv_fw_req_v3(struct hci_dev *hdev, struct sk_buff *skb)
>   		wake_up_interruptible(&nxpdev->fw_dnld_done_wait_q);
>   		goto free_skb;
>   	}
> -	if (req->error)
> -		bt_dev_dbg(hdev, "FW Download received err 0x%02x from chip",
> -			   req->error);
>   
>   	offset = __le32_to_cpu(req->offset);
>   	if (offset < nxpdev->fw_v3_offset_correction) {


Kind regards,

Paul

