Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6611D3F9A
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 May 2020 23:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgENVH0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 14 May 2020 17:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727122AbgENVH0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 14 May 2020 17:07:26 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A60C061A0E
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 May 2020 14:07:26 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t16so29129plo.7
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 May 2020 14:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NykzObPbt09vQkb419M6Erv1hx3UgyLf17JiOqHvK80=;
        b=kXSrc44WFSLsjXyR3bgvdMCGXo3k3C3Oij9xGZlXBwp42VEUZCNCMZLCnI9OGne/vC
         mr0ZoWsu3K9OxnagSQTufjXCYNBsmgnKknQ/+TAAJ4umAqRSc9biOadFDWGedTwyxZNl
         u25qF/rQIzI3UjGyszM1Ldeb8Z0rLmX5nVR8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NykzObPbt09vQkb419M6Erv1hx3UgyLf17JiOqHvK80=;
        b=kp1qoyvRzVop2Y0fcUQgihp1xl0Qy1JKUbXWycQixadtYUu0TeWbiR+KUMp+kE518W
         fPdba01sIKfBl+wudmZ6T1inWvMjvPpMy2EmU5NWDktJ6k9nPkwTPFXbY/Df8Ejn2w/u
         ttd1GWz1b3ouh6RAedR3rE3xFVz0sXZTbjRNvQMW9Sj3nURUetYnhiAXo62kR94b6WIl
         UC151aN2Q4+4UgAofK2w8vJ3IkVb0f0/Oxaa8MfTzUSJCLe8pa1oQoszZBsa+euCEijX
         f0SmiYImvp4yhKJCHjeSgl6WdbuL/x7A8UYmyZMawNig9XbCjjuj4Gn/USwvRsYcOPqs
         vKUA==
X-Gm-Message-State: AOAM531YW6cbJFFO5dyZMITxpGEQUiOVkLrKVytd8rxLoLx8iAj1fJ1h
        BvjNd90MZqzpcH3rW6mWNezy9Vbo0OI=
X-Google-Smtp-Source: ABdhPJwQKxTyIK1X8Xl6+Pi/MwcWTTTthijbO2mFHfEyCX0DhQONIsHerCdGZtFoUmB1727GR2qgVw==
X-Received: by 2002:a17:902:bd81:: with SMTP id q1mr501366pls.46.1589490445695;
        Thu, 14 May 2020 14:07:25 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w192sm104707pff.126.2020.05.14.14.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 14:07:25 -0700 (PDT)
Date:   Thu, 14 May 2020 14:07:24 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc:     linux-bluetooth@vger.kernel.org, bgodavar@codeaurora.org,
        alainm@chromium.org, marcel@holtmann.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Bluetooth: hci_qca: Enable WBS support for wcn3991
Message-ID: <20200514210724.GQ4525@google.com>
References: <20200514131338.v2.1.I68404fc395a3dbc57c8a89ca02490013e8003a87@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200514131338.v2.1.I68404fc395a3dbc57c8a89ca02490013e8003a87@changeid>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Abhishek,

On Thu, May 14, 2020 at 01:14:04PM -0700, Abhishek Pandit-Subedi wrote:
> WCN3991 supports transparent WBS (host encoded mSBC). Add a flag to the
> device match data to show WBS is supported.
> 
> This requires the matching firmware for WCN3991 in linux-firmware:
>         1a8b0dc00f77 (qca: Enable transparent WBS for WCN3991)
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> 
> Changes in v2:
> - Rename struct to qca_capabilities and fix enum naming
> 
>  drivers/bluetooth/hci_qca.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index b3fd07a6f8127..96799644f0933 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -75,6 +75,9 @@ enum qca_flags {
>  	QCA_HW_ERROR_EVENT
>  };
>  
> +enum qca_capabilities {
> +	QCA_CAP_WIDEBAND_SPEECH_SUPPORTED = BIT(0),

nit: the '_SUPPORTED' suffix seems somewhat redundant, given that this
is a capability (as 'CAP' indicates). Up to you if you want to keep it.

> +};
>  
>  /* HCI_IBS transmit side sleep protocol states */
>  enum tx_ibs_states {
> @@ -187,10 +190,11 @@ struct qca_vreg {
>  	unsigned int load_uA;
>  };
>  
> -struct qca_vreg_data {
> +struct qca_device_data {
>  	enum qca_btsoc_type soc_type;
>  	struct qca_vreg *vregs;
>  	size_t num_vregs;
> +	uint32_t capabilities;
>  };
>  
>  /*
> @@ -1691,7 +1695,7 @@ static const struct hci_uart_proto qca_proto = {
>  	.dequeue	= qca_dequeue,
>  };
>  
> -static const struct qca_vreg_data qca_soc_data_wcn3990 = {
> +static const struct qca_device_data qca_soc_data_wcn3990 = {
>  	.soc_type = QCA_WCN3990,
>  	.vregs = (struct qca_vreg []) {
>  		{ "vddio", 15000  },
> @@ -1702,7 +1706,7 @@ static const struct qca_vreg_data qca_soc_data_wcn3990 = {
>  	.num_vregs = 4,
>  };
>  
> -static const struct qca_vreg_data qca_soc_data_wcn3991 = {
> +static const struct qca_device_data qca_soc_data_wcn3991 = {
>  	.soc_type = QCA_WCN3991,
>  	.vregs = (struct qca_vreg []) {
>  		{ "vddio", 15000  },
> @@ -1711,9 +1715,10 @@ static const struct qca_vreg_data qca_soc_data_wcn3991 = {
>  		{ "vddch0", 450000 },
>  	},
>  	.num_vregs = 4,
> +	.capabilities = QCA_CAP_WIDEBAND_SPEECH_SUPPORTED,
>  };
>  
> -static const struct qca_vreg_data qca_soc_data_wcn3998 = {
> +static const struct qca_device_data qca_soc_data_wcn3998 = {
>  	.soc_type = QCA_WCN3998,
>  	.vregs = (struct qca_vreg []) {
>  		{ "vddio", 10000  },
> @@ -1724,7 +1729,7 @@ static const struct qca_vreg_data qca_soc_data_wcn3998 = {
>  	.num_vregs = 4,
>  };
>  
> -static const struct qca_vreg_data qca_soc_data_qca6390 = {
> +static const struct qca_device_data qca_soc_data_qca6390 = {
>  	.soc_type = QCA_QCA6390,
>  	.num_vregs = 0,
>  };
> @@ -1860,7 +1865,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  {
>  	struct qca_serdev *qcadev;
>  	struct hci_dev *hdev;
> -	const struct qca_vreg_data *data;
> +	const struct qca_device_data *data;
>  	int err;
>  	bool power_ctrl_enabled = true;
>  
> @@ -1948,6 +1953,12 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  		hdev->shutdown = qca_power_off;
>  	}
>  
> +	/* Wideband speech support must be set per driver since it can't be
> +	 * queried via hci.
> +	 */
> +	if (data && (data->capabilities & QCA_CAP_WIDEBAND_SPEECH_SUPPORTED))
> +		set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
> +
>  	return 0;
>  }

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
