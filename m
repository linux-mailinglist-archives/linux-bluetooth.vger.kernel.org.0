Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D33D74B0AF
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Jul 2023 14:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbjGGMYz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 7 Jul 2023 08:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjGGMYq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 7 Jul 2023 08:24:46 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646C32114
        for <linux-bluetooth@vger.kernel.org>; Fri,  7 Jul 2023 05:24:44 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so2772048e87.2
        for <linux-bluetooth@vger.kernel.org>; Fri, 07 Jul 2023 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688732682; x=1691324682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PmLUFLr1Xhezg3miPk+GUyDLQkfzpSJ2tis49eV5Dio=;
        b=M+DhVrGu7+jREkutvODEZyCffiLqVVVA8q+cV44rUkgxthaFnXlm8qiUxmluu4rUro
         Acoa0TcR/58pnurovSr2spUkgSjF71xWBcrXEEAxMkGfMU3xcFrOFTQ+puZCxW5R8Bt+
         Apnjdu3EAlfweBTtqn4jyW6QdUxTQBL31za7iIIUG0WOA3M/HV60B5rZs7vtJZDTe5Ak
         D1qL9Uzzjh97PdYtT61fEWlOoA0uufgbw4lQAxO3NWb1G2FcV87jW3W27mHw/YrLDC7w
         NXHMOaW06wiRijTmTAEJNfVZZZxWDZ0Glimeyy5OoDtf/PJWGEHiU2tyWNrDxIAOzRLm
         5HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688732682; x=1691324682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmLUFLr1Xhezg3miPk+GUyDLQkfzpSJ2tis49eV5Dio=;
        b=NdTDTIpvZPqnZpcHDzBcF0HV82QlGHL92u+AQlXvPgE6jzwE418WTPa6a94i+TelHc
         1DmA9gX2x3ryU8EvQm6oUlls9gcxuBKkem/zObWep3U8koHibcqiqyse+8f3794izweD
         ph5db3+wEJC06ws7dsyryJRO4y0xLpTBc0b6UKOCM/E+HpOyDY216VLZSvwVJ+J3qSPO
         YoddF+crWEpSvrlP3eWWJ7z6lcr6MLYRw3i9HUkjTxMivvRE/5V/Ib7Xf+qBm2a2pTQk
         peimT6kiVg+6s+s0gwMgR2OOp7lM7Xu98V0DBaeAhPMWO1r6fDmpin3mquqrsDYnVO01
         YgvQ==
X-Gm-Message-State: ABy/qLZyFqxwm4cW/DVlzF4IKuHpGymRHLIU6dJUYGnP8brERayAG8Dw
        xwfJ8SkFrv+ip/qtQvVREuSKvA==
X-Google-Smtp-Source: APBJJlGDrweEBD4P+dQ0E6QyN7dFfERbfV1/hOtK6FAaIyd43a6hM9ItxL6ScmiG6Ld/8jQzF1x1Pg==
X-Received: by 2002:a19:790f:0:b0:4fb:92df:a27b with SMTP id u15-20020a19790f000000b004fb92dfa27bmr3551376lfc.39.1688732682502;
        Fri, 07 Jul 2023 05:24:42 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id f6-20020ac251a6000000b004fba5c20ab1sm662538lfk.167.2023.07.07.05.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 05:24:42 -0700 (PDT)
Message-ID: <f4c05926-dcc2-b9d3-f41c-a65896abda77@linaro.org>
Date:   Fri, 7 Jul 2023 15:24:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v9] Bluetooth: hci_qca: Add support for Qualcomm Bluetooth
 SoC QCA2066
Content-Language: en-GB
To:     Tim Jiang <quic_tjiang@quicinc.com>, marcel@holtmann.org
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_bgodavar@quicinc.com,
        quic_hemantg@quicinc.com, mka@chromium.org, johan@kernel.org
References: <20230707113645.10673-1-quic_tjiang@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230707113645.10673-1-quic_tjiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On 07/07/2023 14:36, Tim Jiang wrote:
> This patch adds support for QCA2066 firmware patch and NVM downloading.
> as the RF performance of QCA2066 SOC chip from different foundries may
> vary. Therefore we use different NVM to configure them based on board ID.
> 
> Signed-off-by: Tim Jiang <quic_tjiang@quicinc.com>
> ---
>   drivers/bluetooth/btqca.c   | 76 ++++++++++++++++++++++++++++++++++++-
>   drivers/bluetooth/btqca.h   |  4 ++
>   drivers/bluetooth/hci_qca.c | 41 ++++++++++++++++++--
>   3 files changed, 115 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index e7e58a956d15..834b28706d90 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -205,6 +205,46 @@ static int qca_send_reset(struct hci_dev *hdev)
>   	return 0;
>   }
>   
> +static int qca_read_fw_board_id(struct hci_dev *hdev, u16 *bid)
> +{
> +	u8 cmd;
> +	struct sk_buff *skb;
> +	struct edl_event_hdr *edl;
> +	int err = 0;
> +	u8 bid_len;
> +
> +	cmd = EDL_GET_BID_REQ_CMD;
> +	skb = __hci_cmd_sync_ev(hdev, EDL_PATCH_CMD_OPCODE, EDL_PATCH_CMD_LEN,
> +				&cmd, 0, HCI_INIT_TIMEOUT);
> +	if (IS_ERR(skb)) {
> +		err = PTR_ERR(skb);
> +		bt_dev_err(hdev, "Reading QCA board ID failed (%d)", err);
> +		return err;
> +	}
> +
> +	edl = skb_pull_data(skb, sizeof(*edl));
> +	if (!edl) {
> +		bt_dev_err(hdev, "QCA read board ID with no header");
> +		err = -EILSEQ;
> +		goto out;
> +	}
> +
> +	if (edl->cresp != EDL_CMD_REQ_RES_EVT ||
> +	    edl->rtype != EDL_GET_BID_REQ_CMD) {
> +		bt_dev_err(hdev, "QCA Wrong packet: %d %d", edl->cresp, edl->rtype);
> +		err = -EIO;
> +		goto out;
> +	}
> +
> +	bid_len = edl->data[0];
> +	*bid = (edl->data[1] << 8) + edl->data[2];
> +	bt_dev_dbg(hdev, "%s: bid len = %x, bid = %x", __func__, bid_len, *bid);
> +
> +out:
> +	kfree_skb(skb);
> +	return err;
> +}
> +
>   int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
>   {
>   	struct sk_buff *skb;
> @@ -574,6 +614,29 @@ int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
>   }
>   EXPORT_SYMBOL_GPL(qca_set_bdaddr_rome);
>   
> +static void qca_generate_nvm_name(struct hci_dev *hdev, char *fwname,
> +		   size_t max_size, struct qca_btsoc_version ver, u16 bid)
> +{
> +	u8 rom_ver;
> +	u32 soc_ver;
> +	const char *variant;
> +
> +	soc_ver = get_soc_ver(ver.soc_id, ver.rom_ver);
> +	rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
> +
> +	if ((le32_to_cpu(ver.soc_id) & 0x0000ff00) == QCA_HSP_GF_SOC_ID)  /* hsp gf chip */
> +		variant = "g";
> +	else
> +		variant = "";
> +
> +	if (bid == 0x0)
> +		snprintf(fwname, max_size, "qca/hpnv%02x%s.bin", rom_ver, variant);
> +	else
> +		snprintf(fwname, max_size, "qca/hpnv%02x%s.%x", rom_ver, variant, bid);
> +
> +	bt_dev_dbg(hdev, "%s: nvm name is %s", __func__, fwname);
> +}
> +
>   int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
>   		   const char *firmware_name)
> @@ -582,6 +645,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   	int err;
>   	u8 rom_ver = 0;
>   	u32 soc_ver;
> +	u16 boardid = 0;
>   
>   	bt_dev_dbg(hdev, "QCA setup on UART");
>   
> @@ -604,6 +668,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   	if (qca_is_wcn399x(soc_type)) {
>   		snprintf(config.fwname, sizeof(config.fwname),
>   			 "qca/crbtfw%02x.tlv", rom_ver);
> +	} else if (soc_type == QCA_QCA2066) {
> +		snprintf(config.fwname, sizeof(config.fwname),
> +			 "qca/hpbtfw%02x.tlv", rom_ver);
>   	} else if (soc_type == QCA_QCA6390) {
>   		snprintf(config.fwname, sizeof(config.fwname),
>   			 "qca/htbtfw%02x.tlv", rom_ver);
> @@ -631,6 +698,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   	/* Give the controller some time to get ready to receive the NVM */
>   	msleep(10);
>   
> +	if (soc_type == QCA_QCA2066)
> +		qca_read_fw_board_id(hdev, &boardid);
> +
>   	/* Download NVM configuration */
>   	config.type = TLV_TYPE_NVM;
>   	if (firmware_name)
> @@ -644,8 +714,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>   			snprintf(config.fwname, sizeof(config.fwname),
>   				 "qca/crnv%02x.bin", rom_ver);
>   		}
> -	}
> -	else if (soc_type == QCA_QCA6390)
> +	} else if (soc_type == QCA_QCA2066) {
> +		qca_generate_nvm_name(hdev, config.fwname, sizeof(config.fwname),
> +				ver, boardid);
> +	} else if (soc_type == QCA_QCA6390)
>   		snprintf(config.fwname, sizeof(config.fwname),
>   			 "qca/htnv%02x.bin", rom_ver);
>   	else if (soc_type == QCA_WCN6750)
> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> index b884095bcd9d..234a97a49bb9 100644
> --- a/drivers/bluetooth/btqca.h
> +++ b/drivers/bluetooth/btqca.h
> @@ -13,6 +13,7 @@
>   #define EDL_PATCH_TLV_REQ_CMD		(0x1E)
>   #define EDL_GET_BUILD_INFO_CMD		(0x20)
>   #define EDL_NVM_ACCESS_SET_REQ_CMD	(0x01)
> +#define EDL_GET_BID_REQ_CMD		(0x23)
>   #define EDL_PATCH_CONFIG_CMD		(0x28)
>   #define MAX_SIZE_PER_TLV_SEGMENT	(243)
>   #define QCA_PRE_SHUTDOWN_CMD		(0xFC08)
> @@ -48,6 +49,8 @@
>   
>   #define QCA_FW_BUILD_VER_LEN		255
>   
> +#define QCA_HSP_GF_SOC_ID		0x1200
> +
>   
>   enum qca_baudrate {
>   	QCA_BAUDRATE_115200 	= 0,
> @@ -148,6 +151,7 @@ enum qca_btsoc_type {
>   	QCA_QCA6390,
>   	QCA_WCN6750,
>   	QCA_WCN6855,
> +	QCA_QCA2066,
>   };
>   
>   #if IS_ENABLED(CONFIG_BT_QCA)
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 87a7325c75b1..d90ee1ccfd9c 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1748,6 +1748,7 @@ static int qca_setup(struct hci_uart *hu)
>   	const char *firmware_name = qca_get_firmware_name(hu);
>   	int ret;
>   	struct qca_btsoc_version ver;
> +	const char *soc_name;
>   
>   	ret = qca_check_speeds(hu);
>   	if (ret)
> @@ -1762,10 +1763,35 @@ static int qca_setup(struct hci_uart *hu)
>   	 */
>   	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
>   
> -	bt_dev_info(hdev, "setting up %s",
> -		qca_is_wcn399x(soc_type) ? "wcn399x" :
> -		(soc_type == QCA_WCN6750) ? "wcn6750" :
> -		(soc_type == QCA_WCN6855) ? "wcn6855" : "ROME/QCA6390");
> +	switch (soc_type) {
> +	case QCA_AR3002:
> +		soc_name = "ar300x";
> +		break;
> +	case QCA_ROME:
> +		soc_name = "ROME";
> +		break;
> +	case QCA_WCN3990:
> +	case QCA_WCN3991:
> +	case QCA_WCN3998:
> +		soc_name = "wcn399x";
> +		break;
> +	case QCA_QCA2066:
> +		soc_name = "QCA2066";
> +		break;
> +	case QCA_QCA6390:
> +		soc_name = "QCA6390";
> +		break;
> +	case QCA_WCN6750:
> +		soc_name = "wcn6750";
> +		break;
> +	case QCA_WCN6855:
> +		soc_name = "wcn6855";
> +		break;
> +	default:
> +		soc_name = "unknown soc";
> +		break;
> +	}
> +	bt_dev_info(hdev, "setting up %s", soc_name);

Most of this chunk is definitely irrelevant to QCA2066. Please split it 
to a separate patch and send both of the patches as a series.

>   
>   	qca->memdump_state = QCA_MEMDUMP_IDLE;
>   
> @@ -1913,6 +1939,11 @@ static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
>   	.num_vregs = 0,
>   };
>   
> +static const struct qca_device_data qca_soc_data_qca2066 __maybe_unused = {
> +	.soc_type = QCA_QCA2066,
> +	.num_vregs = 0,
> +};
> +
>   static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
>   	.soc_type = QCA_WCN6750,
>   	.vregs = (struct qca_vreg []) {
> @@ -2403,6 +2434,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
>   	{ .compatible = "qcom,wcn3998-bt", .data = &qca_soc_data_wcn3998},
>   	{ .compatible = "qcom,wcn6750-bt", .data = &qca_soc_data_wcn6750},
>   	{ .compatible = "qcom,wcn6855-bt", .data = &qca_soc_data_wcn6855},
> +	{ .compatible = "qcom,qca2066-bt", .data = &qca_soc_data_qca2066},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);
> @@ -2410,6 +2442,7 @@ MODULE_DEVICE_TABLE(of, qca_bluetooth_of_match);
>   
>   #ifdef CONFIG_ACPI
>   static const struct acpi_device_id qca_bluetooth_acpi_match[] = {
> +	{ "QCOM2066", (kernel_ulong_t)&qca_soc_data_qca2066 },
>   	{ "QCOM6390", (kernel_ulong_t)&qca_soc_data_qca6390 },
>   	{ "DLA16390", (kernel_ulong_t)&qca_soc_data_qca6390 },
>   	{ "DLB16390", (kernel_ulong_t)&qca_soc_data_qca6390 },

-- 
With best wishes
Dmitry

