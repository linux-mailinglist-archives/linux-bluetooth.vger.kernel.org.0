Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8716C13CB8B
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Jan 2020 19:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729078AbgAOSCR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Jan 2020 13:02:17 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43435 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728927AbgAOSCR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Jan 2020 13:02:17 -0500
Received: by mail-pf1-f195.google.com with SMTP id x6so8858970pfo.10
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Jan 2020 10:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a8LsyuIcXiV6GxZuQ/qDUpNfxej2Q4xX/Ea2X8PrBBA=;
        b=N6MrOUcetHlWNiGjyh1yM3nRrf/N9ML4S25qtKj3wqpHhbDwS0jMWAw4uhMgDVuhB5
         Rlw3GvcQ6y4WaFuzA5vtxCSDCUrDZXgr2XasGJSHXusRLbydOxUC61aboxuN67p4dlh9
         m29dfH5Iy9NIZQzCZkSAotRc1UUzOe2fgeFAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a8LsyuIcXiV6GxZuQ/qDUpNfxej2Q4xX/Ea2X8PrBBA=;
        b=VyRSn1eHdJS0PnTdb9YVCC6i+QYvsFTE1kS/G9C6Po6/YnIxf51oaLIdi3ua3UOypA
         LmFuGi3TKNlJN1mPPYf0XG1NuCi29oGdK4Sd/rvguJg4gFsAjWGGil4U+HpllHZHjiJc
         iRGDgvtGbxIHo6GWCLMrRYvTxlq5xhu3Wp1ha6jqhqVuBozbQnBg7tO7kH0OTxEeuD9V
         ua8x9BbnH4IwskXnDjm5ol0Xz/wQBkzeCssx5wHZLg2b7mV3+tbSFFmdS1nVjfdyZyOD
         JgNypMPq+GVLdqDCWwV7oAeDJJG1kJHwwHKo7l7fnIwiU/wEzVRG+CQQ+e4tQ279M8cl
         9hvA==
X-Gm-Message-State: APjAAAWcAQ9l5DJfeDGGOIvZOO7QIQ5DRvjqgDzq+KIX4epNd/M6tPcu
        exGR7c6clniBsusbtYJ4HCQWEQ==
X-Google-Smtp-Source: APXvYqwxAlWV4lOiHqPYrRKLBE8Ht/oZ3dQOxLRzOY43DWBuxGLDaqBFGzli8uH1Ex5ck+6CwT22yg==
X-Received: by 2002:a63:3f82:: with SMTP id m124mr34595127pga.431.1579111336473;
        Wed, 15 Jan 2020 10:02:16 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id b24sm22297554pfo.55.2020.01.15.10.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 10:02:15 -0800 (PST)
Date:   Wed, 15 Jan 2020 10:02:14 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        hemantg@codeaurora.org
Subject: Re: [PATCH v4 3/3] Bluetooth: hci_qca: Enable power off/on support
 during hci down/up for QCA Rome
Message-ID: <20200115180214.GO89495@google.com>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20200115085552.11483-1-rjliao@codeaurora.org>
 <20200115085552.11483-3-rjliao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200115085552.11483-3-rjliao@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, Jan 15, 2020 at 04:55:52PM +0800, Rocky Liao wrote:
> This patch registers hdev->shutdown() callback and also sets
> HCI_QUIRK_NON_PERSISTENT_SETUP for QCA Rome. It will power-off the BT chip
> during hci down and power-on/initialize the chip again during hci up. As
> wcn399x already enabled this, this patch also removed the callback register
> and QUIRK setting in qca_setup() for wcn399x and uniformly do this in the
> probe() routine.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> 
> Changes in v2: None
> Changes in v3: 
>   -moved the quirk and callback register to probe()
> Changes in v4:
>   -rebased the patch with latest code
>   -moved the quirk and callback register to probe() for wcn399x
>   -updated commit message
> 
>  drivers/bluetooth/hci_qca.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 1139142e8eed..3c6c6bd20177 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1569,12 +1569,7 @@ static int qca_setup(struct hci_uart *hu)
>  		return ret;
>  
>  	if (qca_is_wcn399x(soc_type)) {
> -		/* Enable NON_PERSISTENT_SETUP QUIRK to ensure to execute
> -		 * setup for every hci up.
> -		 */
> -		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
>  		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);

I guess this should also move to _probe() eventually, but it's not really
the scope of this patch.

> -		hu->hdev->shutdown = qca_power_off;
>  
>  		ret = qca_read_soc_version(hdev, &soc_ver, soc_type);
>  		if (ret)
> @@ -1813,6 +1808,7 @@ static int qca_init_regulators(struct qca_power *qca,
>  static int qca_serdev_probe(struct serdev_device *serdev)
>  {
>  	struct qca_serdev *qcadev;
> +	struct hci_dev *hdev;
>  	const struct qca_vreg_data *data;
>  	int err;
>  
> @@ -1881,7 +1877,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  			clk_disable_unprepare(qcadev->susclk);
>  	}
>  
> -out:	return err;
> +out:
> +	if (!err) {
> +		hdev = qcadev->serdev_hu.hdev;
> +		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
> +		hdev->shutdown = qca_power_off;
> +	}
> +	return err;

Since there is no unwinding in case of an error I would suggest to
change the jumps to the 'out' label further above to 'return err;'
and change the above lines to:

	hdev = qcadev->serdev_hu.hdev;
	set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
	hdev->shutdown = qca_power_off;

	return 0;

This will also require to return directly when hci_uart_register_device()
fails.
