Return-Path: <linux-bluetooth+bounces-8906-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE149D52A8
	for <lists+linux-bluetooth@lfdr.de>; Thu, 21 Nov 2024 19:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CFE51F224EA
	for <lists+linux-bluetooth@lfdr.de>; Thu, 21 Nov 2024 18:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BD41BE23C;
	Thu, 21 Nov 2024 18:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Np8MAxqd"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775A4139597
	for <linux-bluetooth@vger.kernel.org>; Thu, 21 Nov 2024 18:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732214482; cv=none; b=uwliw+BDDr8E8uovDGoJ0Z7qfDX8QLDHRFIi1J1Y+0P/dXa0txK+nxvyjKm/98uYQEe7H8HuGQyE74b4TGjZ+x9RCPvBzSLpjQ8YXh5rP9h47CC7tvSIoShpMnH49Padszfxxcq7wkuGbNqbaScUuJHQjNhv09YEO8Lv4N/xUsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732214482; c=relaxed/simple;
	bh=gjxRaRTpokhKEeKFFXKxSOZ0uHM8xLWNw6Sxs9mF/HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkSkb2d7dXpDoJiRZFvW/RvSJOIaByjnJ4kK0Rq+/cQfkKRsaoskFMkfZRGJiwWBW7bAtb3AvUlGZWLFSzMO4h/Gb5ODCYNFR3hWpnI7M/1ir5CBzsuEIqrwQbbMCt+jTz7Ck/aj/MTHjeaui+1Ny1ml2apo24Yo3sU2r11WThs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Np8MAxqd; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so14678981fa.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 21 Nov 2024 10:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732214477; x=1732819277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eRsYFXGFqawR9KnhrA/WD6HA6FrPz8pIkhyN0shb5O4=;
        b=Np8MAxqdbbyS0edDlIByBhs6vEaF1iDtL89JumU05zIB5O8crP8wkoYHklVeRqQwxb
         owAHlZzdvZE4seHTYmeIjx1PGAOFMotqe3YoHWeOPWsNwx1FMVAZAR+nfc7SDVETgjLW
         j/bKncyVPVNyT5PqWzx+Nxx2NJ1dZuWQPHFDHJEYYmohsW1rbE29mXjjSdFdMycOOZ7P
         FacP4n+CEq+m7vre5oPRGQaZTMnW2McI9VKt7ga98f1r8AXgAi25ROKaDTqP+l7YqNK1
         miRgwm68I10fABlB+w77ap5pGi+9J5OsvbNlw7psI4kjhkZiJxU72+f7AS0kdwOhegP1
         FZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732214477; x=1732819277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRsYFXGFqawR9KnhrA/WD6HA6FrPz8pIkhyN0shb5O4=;
        b=ll7gVSa1WoOQ4qI3hnCu3QUf7WMv3YS0gMPm9ZQXodQ59WtLUM99XteQe8PONO+P6P
         /mt/aXgk/YnJv8DDRCX35nEYz145bi/+/hciUc9zvLjO8fj+X+wOIUoobuffKlR/s/Ni
         QmuaVVSSanr0TYRjEfeWpvKhiAKfry8JzvYANKffSSwhS91idFW32namNC+lMYHDAzjK
         COZym10uAfSa/4IcT1BqwEr3IwTbCm46PqyIJ0AbAGfGEQvL8YWKAWBwdXUXUzIbJaXM
         llSDzO7BY/7idTzT3GGrMW4mNgKDH/4Q1q5ZdpBCPT13i5qoURpqyBOMhWX8jW8T5Qw0
         XwAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD5eWGsOn+B+IFO3OGaCbyHgTkb+znlnESrq3weG3/QfuoaOn0hyzTh9B/TJ3PkkUHEQLlpXrS92Xj8uvlV1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxzeL4XQlymknJ+qT3XcB/D7Fjx4AmOSS+hkBIgWsDKyZu/ga6
	JTWRmS+NEZ5VhT3pdud6yK9VOfVTm/TwLJzHJALnvPhOkP22WB/pARL7SzepI3w=
X-Gm-Gg: ASbGncu+6KIokz5xhZKOCYmZPeVl3unQwopp+o/tvIs61glKHqiuPcnjap+SfYS6x74
	8C2wC/UO5i5+tHy5EXKxFdBgkzgesbhD9GjBc+Di3S564G2CJ4DM8Pgt4vQZWU0VxxwUTPaxZLx
	5nKqi+msGwQX8U35c17RWtMdzsyY8cflC1yyD2KTqcYOiZjaNoui0mo/6vi7UGLA15jGKeNkzw/
	qWPT8OBmqNBoK1dpo9mIMV59OPWJ0q/uvcHH8AuU29RX+MkpwcZNjkhoRCLWFhOJ9ytqg1YUbR/
	Kl+db3aDN1B9jVWSnmWLpxZUha0SzQ==
X-Google-Smtp-Source: AGHT+IE1X5NHiBTRjqLq6KHR/803u6V0ufkNKD2Q0zoWRA6pXhLWjtsydABJrt+wRgxI2RKNGx3Fbw==
X-Received: by 2002:a05:651c:e01:b0:2ff:7b1a:ad4a with SMTP id 38308e7fff4ca-2ff96f4da57mr18256811fa.31.1732214476565;
        Thu, 21 Nov 2024 10:41:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa4d3eb34sm167671fa.27.2024.11.21.10.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 10:41:15 -0800 (PST)
Date: Thu, 21 Nov 2024 20:41:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, quic_zijuhu@quicinc.com, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_mohamull@quicinc.com
Subject: Re: [PATCH v2 4/4] Bluetooth: hci_qca: add qcom,product-variant
 properties
Message-ID: <n6qrnx6ibxxlwgahbbsqs44iqc2brrjv7om5vcmig5rqzqqdgm@zx3tlpvlxpv2>
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
 <20241120095428.1122935-5-quic_chejiang@quicinc.com>
 <l4c2rfhlgvljh5micwjfz5bsdxeogmjt3pda6dqadooujliomk@acqolhks3fmq>
 <73edea3d-58d9-4eb4-9c18-cc247fde190b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73edea3d-58d9-4eb4-9c18-cc247fde190b@quicinc.com>

On Thu, Nov 21, 2024 at 12:40:27PM +0800, Cheng Jiang wrote:
> Hi Dmitry,
> 
> On 11/20/2024 6:57 PM, Dmitry Baryshkov wrote:
> > On Wed, Nov 20, 2024 at 05:54:28PM +0800, Cheng Jiang wrote:
> >> Since different products use the same SoC chip, features cannot
> >> be included in a single patch. Use the qcom,product-variant to
> >> load the appropriate firmware.
> > 
> > I can not understand this: what kind of features are so different that
> > you can not include them into a single firmware image? Please enable all
> > users with all possible features instead of tying them to a product
> > segment. If I'm missing something, please provide additional
> > information.
> We have serveral projects for different cusomters, but may use the same 
> soc chip (different boards). Customer have different requriements. For
> some customer focus on A2DP SINK role, they need a high throughput PKI of
> BTC, then firmware requires more optimizaiton for coexistence when acting
> as SINK role. While other projects only act as A2DP Source, they need the
> optimizaiton for coexistence when acting as SRC role  For basic Bluetooth
> functions, they are included, but we can't included all the feature in a
> signle firmware. 

This description corresponds to the use-case / software description
rather than the hardware differences. DT describes the hardware. Please
don't use DT to segment the users. If your customer needs a different
firmware, they can use distro or BSP-specific ways to implement that
instead of hardcoding this information in the hardware description.
Consider somebody using IoT as a low-power PC.

> For PC projects, the focus is on A2DP SRC and HFP AG roles. Meanwhile,
> for IoT projects, the focus is on A2DP SINK and HFP Client roles.

What does that mean for the users? Does that mean that we can not use
RBn boards as SBC devices? Or will audio quality be lowered on such
devices?

>  
> > 
> >>
> >> The qcom,product-variant provides product line information, which
> >> the driver uses to load firmware from different directories.
> >>
> >> If it's not defined in dts, the default firmware will be loaded.
> >>
> >> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> >> ---
> >>  drivers/bluetooth/btqca.c   | 142 +++++++++++++++++++++++++++++-------
> >>  drivers/bluetooth/btqca.h   |  11 ++-
> >>  drivers/bluetooth/hci_qca.c |  73 +++++++++---------
> >>  3 files changed, 164 insertions(+), 62 deletions(-)
> >>
> >> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> >> index dfbbac92242a..0845e5a60412 100644
> >> --- a/drivers/bluetooth/btqca.c
> >> +++ b/drivers/bluetooth/btqca.c
> >> @@ -700,8 +700,79 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
> >>  	return 0;
> >>  }
> >>  
> >> -static void qca_generate_hsp_nvm_name(char *fwname, size_t max_size,
> >> -		struct qca_btsoc_version ver, u8 rom_ver, u16 bid)
> >> +
> >> +const char *qca_get_soc_name(enum qca_btsoc_type soc_type)
> >> +{
> >> +	const char *soc_name = "";
> >> +
> >> +	switch (soc_type) {
> >> +	case QCA_QCA2066:
> >> +		soc_name = "QCA2066";
> >> +		break;
> >> +
> >> +	case QCA_QCA6698:
> >> +		soc_name = "QCA6698";
> >> +		break;
> >> +
> >> +	case QCA_WCN3988:
> >> +	case QCA_WCN3990:
> >> +	case QCA_WCN3991:
> >> +	case QCA_WCN3998:
> >> +		soc_name = "WCN399x";
> >> +		break;
> >> +
> >> +	case QCA_WCN6750:
> >> +		soc_name = "WCN6750";
> >> +		break;
> >> +
> >> +	case QCA_WCN6855:
> >> +		soc_name = "WCN6855";
> >> +		break;
> >> +
> >> +	case QCA_WCN7850:
> >> +		soc_name = "WCN7850";
> >> +		break;
> >> +
> >> +	default:
> >> +		soc_name = "ROME/QCA6390";
> >> +	}
> >> +
> >> +	return soc_name;
> >> +}
> >> +EXPORT_SYMBOL_GPL(qca_get_soc_name);
> >> +
> >> +static void qca_get_firmware_path(enum qca_btsoc_type soc_type, char *fw_path,
> >> +		size_t max_size, enum qca_product_type product_type)
> >> +{
> >> +	const char *fw_dir = NULL;
> >> +
> >> +	switch (product_type) {
> >> +	case QCA_MCC:
> >> +		fw_dir = "qca";
> >> +		break;
> >> +	case QCA_CE:
> >> +		fw_dir = "qca/ce";
> >> +		break;
> >> +	case QCA_IOT:
> >> +		fw_dir = "qca/iot";
> >> +		break;
> >> +	case QCA_AUTO:
> >> +		fw_dir = "qca/auto";
> >> +		break;
> >> +	default:
> >> +		fw_dir = "qca";
> >> +		break;
> >> +	}
> >> +
> >> +	if (product_type == QCA_IOT)
> >> +		snprintf(fw_path, max_size, "%s/%s", fw_dir, qca_get_soc_name(soc_type));
> > 
> > Why do you need even more nesting for IoT products? "qca/iot/ROME/QCA6390"
> > also looks strange, but perfectly possible with your patch
> It's intended to separate the firmware from the IoT product and the existing product.


I asked, why do you need additional nesting. Isn't just qca/iot/XXbtfwYY
enough for your usecase?

> > 
> >> +	else
> >> +		snprintf(fw_path, max_size, "%s", fw_dir);
> > 
> > Without the IoT platform you can just include a static string.
> Ack.
> > 
> >> +}
> >> +
> >> +static void qca_generate_hsp_nvm_name(enum qca_btsoc_type soc_type, char *fwname,
> >> +		size_t max_size, const char *fw_path, struct qca_btsoc_version ver, u8 rom_ver,
> >> +		u16 bid)
> >>  {
> >>  	const char *variant;
> >>  
> >> @@ -712,33 +783,36 @@ static void qca_generate_hsp_nvm_name(char *fwname, size_t max_size,
> >>  		variant = "";
> >>  
> >>  	if (bid == 0x0)
> >> -		snprintf(fwname, max_size, "qca/hpnv%02x%s.bin", rom_ver, variant);
> >> +		snprintf(fwname, max_size, "%s/hpnv%02x%s.bin", fw_path, rom_ver, variant);
> >>  	else
> >> -		snprintf(fwname, max_size, "qca/hpnv%02x%s.%x", rom_ver, variant, bid);
> >> +		snprintf(fwname, max_size, "%s/hpnv%02x%s.%x", fw_path, rom_ver, variant, bid);
> >>  }
> >>  
> >> -static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
> >> +static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg, const char *fw_path,
> >>  					    const char *stem, u8 rom_ver, u16 bid)
> >>  {
> >>  	if (bid == 0x0)
> >> -		snprintf(cfg->fwname, sizeof(cfg->fwname), "qca/%snv%02x.bin", stem, rom_ver);
> >> +		snprintf(cfg->fwname, sizeof(cfg->fwname),
> >> +			 "%s/%snv%02x.bin", fw_path, stem, rom_ver);
> >>  	else if (bid & 0xff00)
> >>  		snprintf(cfg->fwname, sizeof(cfg->fwname),
> >> -			 "qca/%snv%02x.b%x", stem, rom_ver, bid);
> >> +			 "%s/%snv%02x.b%x", fw_path, stem, rom_ver, bid);
> >>  	else
> >>  		snprintf(cfg->fwname, sizeof(cfg->fwname),
> >> -			 "qca/%snv%02x.b%02x", stem, rom_ver, bid);
> >> +			 "%s/%snv%02x.b%02x", fw_path, stem, rom_ver, bid);
> >>  }
> >>  
> >>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
> >> -		   const char *firmware_name)
> >> +		   const char *firmware_name, uint32_t product_variant)
> >>  {
> >>  	struct qca_fw_config config = {};
> >>  	int err;
> >>  	u8 rom_ver = 0;
> >>  	u32 soc_ver;
> >>  	u16 boardid = 0;
> >> +	enum qca_product_type product_type;
> >> +	char fw_path[64] = {0};
> > 
> > No need to init it with lame data.
> Ack.
> > 
> >>  
> >>  	bt_dev_dbg(hdev, "QCA setup on UART");
> >>  
> >> @@ -759,6 +833,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  	if (soc_type == QCA_WCN6750)
> >>  		qca_send_patch_config_cmd(hdev);
> >>  
> >> +	/* Get the f/w path based on product variant */
> >> +	product_type = (product_variant >> 16) & 0xff;
> >> +	qca_get_firmware_path(soc_type, fw_path, sizeof(fw_path), product_type);
> >> +
> >>  	/* Download rampatch file */
> >>  	config.type = TLV_TYPE_PATCH;
> >>  	switch (soc_type) {
> >> @@ -766,19 +844,23 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  	case QCA_WCN3991:
> >>  	case QCA_WCN3998:
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >> -			 "qca/crbtfw%02x.tlv", rom_ver);
> >> +			 "%s/crbtfw%02x.tlv", fw_path, rom_ver);
> >>  		break;
> >>  	case QCA_WCN3988:
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >> -			 "qca/apbtfw%02x.tlv", rom_ver);
> >> +			 "%s/apbtfw%02x.tlv", fw_path, rom_ver);
> >>  		break;
> >>  	case QCA_QCA2066:
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >> -			 "qca/hpbtfw%02x.tlv", rom_ver);
> >> +			 "%s/hpbtfw%02x.tlv", fw_path, rom_ver);
> >>  		break;
> >>  	case QCA_QCA6390:
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >> -			 "qca/htbtfw%02x.tlv", rom_ver);
> >> +			 "%s/htbtfw%02x.tlv", fw_path, rom_ver);
> >> +		break;
> >> +	case QCA_QCA6698:
> >> +		snprintf(config.fwname, sizeof(config.fwname),
> >> +			 "%s/hpbtfw%02x.tlv", fw_path, rom_ver);
> >>  		break;
> >>  	case QCA_WCN6750:
> >>  		/* Choose mbn file by default.If mbn file is not found
> >> @@ -786,19 +868,19 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  		 */
> >>  		config.type = ELF_TYPE_PATCH;
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >> -			 "qca/msbtfw%02x.mbn", rom_ver);
> >> +			 "%s/msbtfw%02x.mbn", fw_path, rom_ver);
> >>  		break;
> >>  	case QCA_WCN6855:
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >> -			 "qca/hpbtfw%02x.tlv", rom_ver);
> >> +			 "%s/hpbtfw%02x.tlv", fw_path, rom_ver);
> >>  		break;
> >>  	case QCA_WCN7850:
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >> -			 "qca/hmtbtfw%02x.tlv", rom_ver);
> >> +			 "%s/hmtbtfw%02x.tlv", fw_path, rom_ver);
> >>  		break;
> >>  	default:
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >> -			 "qca/rampatch_%08x.bin", soc_ver);
> >> +			 "%s/rampatch_%08x.bin", fw_path, soc_ver);
> >>  	}
> >>  
> >>  	err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
> >> @@ -810,7 +892,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  	/* Give the controller some time to get ready to receive the NVM */
> >>  	msleep(10);
> >>  
> >> -	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850)
> >> +	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850 ||
> >> +		soc_type == QCA_QCA6698)
> >>  		qca_read_fw_board_id(hdev, &boardid);
> >>  
> >>  	/* Download NVM configuration */
> >> @@ -825,39 +908,40 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  		case QCA_WCN3998:
> >>  			if (le32_to_cpu(ver.soc_id) == QCA_WCN3991_SOC_ID) {
> >>  				snprintf(config.fwname, sizeof(config.fwname),
> >> -					 "qca/crnv%02xu.bin", rom_ver);
> >> +					 "%s/crnv%02xu.bin", fw_path, rom_ver);
> >>  			} else {
> >>  				snprintf(config.fwname, sizeof(config.fwname),
> >> -					 "qca/crnv%02x.bin", rom_ver);
> >> +					 "%s/crnv%02x.bin", fw_path, rom_ver);
> >>  			}
> >>  			break;
> >>  		case QCA_WCN3988:
> >>  			snprintf(config.fwname, sizeof(config.fwname),
> >> -				 "qca/apnv%02x.bin", rom_ver);
> >> +				 "%s/apnv%02x.bin", fw_path, rom_ver);
> >>  			break;
> >>  		case QCA_QCA2066:
> >> -			qca_generate_hsp_nvm_name(config.fwname,
> >> -				sizeof(config.fwname), ver, rom_ver, boardid);
> >> +		case QCA_QCA6698:
> >> +			qca_generate_hsp_nvm_name(soc_type, config.fwname,
> >> +				sizeof(config.fwname), fw_path, ver, rom_ver, boardid);
> >>  			break;
> >>  		case QCA_QCA6390:
> >>  			snprintf(config.fwname, sizeof(config.fwname),
> >> -				 "qca/htnv%02x.bin", rom_ver);
> >> +				 "%s/htnv%02x.bin", fw_path, rom_ver);
> >>  			break;
> >>  		case QCA_WCN6750:
> >>  			snprintf(config.fwname, sizeof(config.fwname),
> >> -				 "qca/msnv%02x.bin", rom_ver);
> >> +				 "%s/msnv%02x.bin", fw_path, rom_ver);
> >>  			break;
> >>  		case QCA_WCN6855:
> >>  			snprintf(config.fwname, sizeof(config.fwname),
> >> -				 "qca/hpnv%02x.bin", rom_ver);
> >> +				 "%s/hpnv%02x.bin", fw_path, rom_ver);
> >>  			break;
> >>  		case QCA_WCN7850:
> >> -			qca_get_nvm_name_generic(&config, "hmt", rom_ver, boardid);
> >> +			qca_get_nvm_name_generic(&config, "hmt", fw_path, rom_ver, boardid);
> >>  			break;
> >>  
> >>  		default:
> >>  			snprintf(config.fwname, sizeof(config.fwname),
> >> -				 "qca/nvm_%08x.bin", soc_ver);
> >> +				 "%s/nvm_%08x.bin", fw_path, soc_ver);
> >>  		}
> >>  	}
> >>  
> >> @@ -871,6 +955,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  	case QCA_WCN3991:
> >>  	case QCA_QCA2066:
> >>  	case QCA_QCA6390:
> >> +	case QCA_QCA6698:
> > 
> > This wasn't mentioned in the commit message. Please separate unrelated
> > changes into separate patches.
> ACK.
> > 
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> @@ -909,6 +994,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		/* get fw build info */
> >>  		err = qca_read_fw_build_info(hdev);
> >>  		if (err < 0)
> >> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> >> index bb5207d7a8c7..baa3f979d017 100644
> >> --- a/drivers/bluetooth/btqca.h
> >> +++ b/drivers/bluetooth/btqca.h
> >> @@ -151,21 +151,30 @@ enum qca_btsoc_type {
> >>  	QCA_WCN3991,
> >>  	QCA_QCA2066,
> >>  	QCA_QCA6390,
> >> +	QCA_QCA6698,
> >>  	QCA_WCN6750,
> >>  	QCA_WCN6855,
> >>  	QCA_WCN7850,
> >>  };
> >>  
> >> +enum qca_product_type {
> >> +	QCA_MCC = 0,
> >> +	QCA_CE,
> >> +	QCA_IOT,
> >> +	QCA_AUTO,
> > 
> > What is MCC? CE?

And the question got ignored. Sad.

> > 
> >> +};
> >> +
> >>  #if IS_ENABLED(CONFIG_BT_QCA)
> >>  
> >>  int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr);
> >>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
> >> -		   const char *firmware_name);
> >> +		   const char *firmware_name, uint32_t product_variant);
> >>  int qca_read_soc_version(struct hci_dev *hdev, struct qca_btsoc_version *ver,
> >>  			 enum qca_btsoc_type);
> >>  int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
> >>  int qca_send_pre_shutdown_cmd(struct hci_dev *hdev);
> >> +const char *qca_get_soc_name(enum qca_btsoc_type soc_type);
> >>  #else
> >>  
> >>  static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
> >> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> >> index 37129e6cb0eb..69fec890eb8c 100644
> >> --- a/drivers/bluetooth/hci_qca.c
> >> +++ b/drivers/bluetooth/hci_qca.c
> >> @@ -227,6 +227,7 @@ struct qca_serdev {
> >>  	struct qca_power *bt_power;
> >>  	u32 init_speed;
> >>  	u32 oper_speed;
> >> +	u32 product_variant;
> >>  	bool bdaddr_property_broken;
> >>  	const char *firmware_name;
> >>  };
> >> @@ -1361,6 +1362,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		usleep_range(1000, 10000);
> >>  		break;
> >>  
> >> @@ -1447,6 +1449,7 @@ static int qca_check_speeds(struct hci_uart *hu)
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		if (!qca_get_speed(hu, QCA_INIT_SPEED) &&
> >>  		    !qca_get_speed(hu, QCA_OPER_SPEED))
> >>  			return -EINVAL;
> >> @@ -1489,6 +1492,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
> >>  		case QCA_WCN6750:
> >>  		case QCA_WCN6855:
> >>  		case QCA_WCN7850:
> >> +		case QCA_QCA6698:
> >>  			hci_uart_set_flow_control(hu, true);
> >>  			break;
> >>  
> >> @@ -1523,6 +1527,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
> >>  		case QCA_WCN6750:
> >>  		case QCA_WCN6855:
> >>  		case QCA_WCN7850:
> >> +		case QCA_QCA6698:
> >>  			hci_uart_set_flow_control(hu, false);
> >>  			break;
> >>  
> >> @@ -1803,6 +1808,7 @@ static int qca_power_on(struct hci_dev *hdev)
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >>  	case QCA_QCA6390:
> >> +	case QCA_QCA6698:
> >>  		ret = qca_regulator_init(hu);
> >>  		break;
> >>  
> >> @@ -1858,7 +1864,6 @@ static int qca_setup(struct hci_uart *hu)
> >>  	int ret;
> >>  	struct qca_btsoc_version ver;
> >>  	struct qca_serdev *qcadev;
> >> -	const char *soc_name;
> >>  
> >>  	ret = qca_check_speeds(hu);
> >>  	if (ret)
> >> @@ -1873,34 +1878,7 @@ static int qca_setup(struct hci_uart *hu)
> >>  	 */
> >>  	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
> >>  
> >> -	switch (soc_type) {
> >> -	case QCA_QCA2066:
> >> -		soc_name = "qca2066";
> >> -		break;
> >> -
> >> -	case QCA_WCN3988:
> >> -	case QCA_WCN3990:
> >> -	case QCA_WCN3991:
> >> -	case QCA_WCN3998:
> >> -		soc_name = "wcn399x";
> >> -		break;
> >> -
> >> -	case QCA_WCN6750:
> >> -		soc_name = "wcn6750";
> >> -		break;
> >> -
> >> -	case QCA_WCN6855:
> >> -		soc_name = "wcn6855";
> >> -		break;
> >> -
> >> -	case QCA_WCN7850:
> >> -		soc_name = "wcn7850";
> >> -		break;
> >> -
> >> -	default:
> >> -		soc_name = "ROME/QCA6390";
> >> -	}
> >> -	bt_dev_info(hdev, "setting up %s", soc_name);
> >> +	bt_dev_info(hdev, "setting up %s", qca_get_soc_name(soc_type));
> >>  
> >>  	qca->memdump_state = QCA_MEMDUMP_IDLE;
> >>  
> >> @@ -1919,6 +1897,7 @@ static int qca_setup(struct hci_uart *hu)
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		qcadev = serdev_device_get_drvdata(hu->serdev);
> >>  		if (qcadev->bdaddr_property_broken)
> >>  			set_bit(HCI_QUIRK_BDADDR_PROPERTY_BROKEN, &hdev->quirks);
> >> @@ -1952,6 +1931,7 @@ static int qca_setup(struct hci_uart *hu)
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		break;
> >>  
> >>  	default:
> >> @@ -1963,7 +1943,7 @@ static int qca_setup(struct hci_uart *hu)
> >>  
> >>  	/* Setup patch / NVM configurations */
> >>  	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, ver,
> >> -			firmware_name);
> >> +			firmware_name, qcadev->product_variant);
> >>  	if (!ret) {
> >>  		clear_bit(QCA_IBS_DISABLED, &qca->flags);
> >>  		qca_debugfs_init(hdev);
> >> @@ -2089,6 +2069,20 @@ static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
> >>  	.num_vregs = 0,
> >>  };
> >>  
> >> +static const struct qca_device_data qca_soc_data_qca6698 __maybe_unused = {
> >> +	.soc_type = QCA_QCA6698,
> >> +	.vregs = (struct qca_vreg []) {
> >> +		{ "vddio", 5000 },
> >> +		{ "vddbtcxmx", 126000 },
> >> +		{ "vddrfacmn", 12500 },
> >> +		{ "vddrfa0p8", 102000 },
> >> +		{ "vddrfa1p7", 302000 },
> >> +		{ "vddrfa1p2", 257000 },
> > 
> > No need to describe regulators, use PMU and powerseq.

And this one...

> > 
> >> +	},
> >> +	.num_vregs = 6,
> >> +	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
> >> +};
> > 
> > Why can't you use the qca_soc_data_wcn6855?

And this one...

> > 
> >> +
> >>  static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
> >>  	.soc_type = QCA_WCN6750,
> >>  	.vregs = (struct qca_vreg []) {
> >> @@ -2165,7 +2159,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
> >>  		pwrseq_power_off(power->pwrseq);
> >>  		set_bit(QCA_BT_OFF, &qca->flags);
> >>  		return;
> >> -        }
> >> +	}
> > 
> > Completely unrelated, cleanups go to a separate patch.
> Ack.
> > 
> >>  
> >>  	switch (soc_type) {
> >>  	case QCA_WCN3988:
> >> @@ -2179,6 +2173,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
> >>  
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >> +	case QCA_QCA6698:
> >>  		gpiod_set_value_cansleep(qcadev->bt_en, 0);
> >>  		msleep(100);
> >>  		qca_regulator_disable(qcadev);
> >> @@ -2313,6 +2308,12 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> >>  					 &qcadev->firmware_name);
> >>  	device_property_read_u32(&serdev->dev, "max-speed",
> >>  				 &qcadev->oper_speed);
> >> +	device_property_read_u32(&serdev->dev, "qcom,product-variant",
> >> +				 &qcadev->product_variant);
> >> +
> >> +	if (qcadev->product_variant != 0)
> >> +		BT_INFO("QC Product Variant: 0x%08x", qcadev->product_variant);
> > 
> > Don't spam users with useless hex numbers. Printing the sensible string
> > should be fine though.
> > 
> >> +
> >>  	if (!qcadev->oper_speed)
> >>  		BT_DBG("UART will pick default operating speed");
> >>  
> >> @@ -2333,6 +2334,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >>  	case QCA_QCA6390:
> >> +	case QCA_QCA6698:
> >>  		qcadev->bt_power = devm_kzalloc(&serdev->dev,
> >>  						sizeof(struct qca_power),
> >>  						GFP_KERNEL);
> >> @@ -2346,6 +2348,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> >>  	switch (qcadev->btsoc_type) {
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		if (!device_property_present(&serdev->dev, "enable-gpios")) {
> >>  			/*
> >>  			 * Backward compatibility with old DT sources. If the
> >> @@ -2380,7 +2383,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> >>  					       GPIOD_OUT_LOW);
> >>  		if (IS_ERR(qcadev->bt_en) &&
> >>  		    (data->soc_type == QCA_WCN6750 ||
> >> -		     data->soc_type == QCA_WCN6855)) {
> >> +		     data->soc_type == QCA_WCN6855 ||
> >> +		     data->soc_type == QCA_QCA6698)) {
> >>  			dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
> >>  			return PTR_ERR(qcadev->bt_en);
> >>  		}
> >> @@ -2393,7 +2397,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> >>  		if (IS_ERR(qcadev->sw_ctrl) &&
> >>  		    (data->soc_type == QCA_WCN6750 ||
> >>  		     data->soc_type == QCA_WCN6855 ||
> >> -		     data->soc_type == QCA_WCN7850)) {
> >> +		     data->soc_type == QCA_WCN7850 ||
> >> +		     data->soc_type == QCA_QCA6698)) {
> >>  			dev_err(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
> >>  			return PTR_ERR(qcadev->sw_ctrl);
> >>  		}
> >> @@ -2475,6 +2480,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		if (power->vregs_on)
> >>  			qca_power_shutdown(&qcadev->serdev_hu);
> >>  		break;
> >> @@ -2669,6 +2675,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
> >>  	{ .compatible = "qcom,qca2066-bt", .data = &qca_soc_data_qca2066},
> >>  	{ .compatible = "qcom,qca6174-bt" },
> >>  	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
> >> +	{ .compatible = "qcom,qca6698-bt", .data = &qca_soc_data_qca6698},
> >>  	{ .compatible = "qcom,qca9377-bt" },
> >>  	{ .compatible = "qcom,wcn3988-bt", .data = &qca_soc_data_wcn3988},
> >>  	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
> >> -- 
> >> 2.25.1
> >>
> > 
> 

-- 
With best wishes
Dmitry

