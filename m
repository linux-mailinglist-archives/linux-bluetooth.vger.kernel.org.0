Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 963FE132D10
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Jan 2020 18:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgAGRbw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Jan 2020 12:31:52 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33044 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbgAGRbv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Jan 2020 12:31:51 -0500
Received: by mail-pf1-f193.google.com with SMTP id z16so219880pfk.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 Jan 2020 09:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6tbx6y0alCppo4JulU8ZX+Wq5gWxVblT3if0J5vpiqg=;
        b=L72FmqY7y9JcE1Hl8aVOS075lkg2C/pQlQl3XVkV9+o4hG12UWm6Z+RNU4UaowMX7l
         AzJI7/sOkWRixckpCz3sLqVPZ9Lmn0VMJOukcWmnoz0mlT/zeKG8T+7vtUMCBlLNLNmD
         C7TYuadNxUKRk5Jyrl5xgt4f5z004pCSe3P5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6tbx6y0alCppo4JulU8ZX+Wq5gWxVblT3if0J5vpiqg=;
        b=SWkHzdOLfUYKlAbyhs1DsT9vkWvkCJs/iTjItOOL02ip6GHp2rzgyaRgme+fumFc//
         UHLk5Smgo/BMu72Zu1m4b36NH+EeErMLVh4iVObG+OIYJNa/UPHQtsoYVTlVsCN7l64z
         qdiL/CBfKB7sYfbDlkR/wr2pF2Flo1S0nCJQjQV6xzISTgmWgk9onkLp1d6F6rX4CNIl
         3n/7+jZIApQ8TYx//Lu8ezUVt8+w1JW7AGXedVOwCdPjlnxoqgnZExobUK7ZxeeP3r01
         2hab+rrrH5LlYhdRxerfHaEYQnSKGdzcTlalwaFxjym7xKHroldgQeM2onnZnMpwRxZu
         4qBA==
X-Gm-Message-State: APjAAAWpK56oduHEc5baN+KZXJnpKJVipncPAUjPDOXrk0dog87AzvxC
        JndH8tKlGW/MWLM3uNKBx8cMIA==
X-Google-Smtp-Source: APXvYqxuZTRMvr2E0NVTDg27lnwD7H9kx+RE+QwcVmHID/+AUrQOH+CqDmCL6ILFL3+vIgX9QTQ34Q==
X-Received: by 2002:a63:8041:: with SMTP id j62mr551347pgd.41.1578418311104;
        Tue, 07 Jan 2020 09:31:51 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 80sm126769pfw.123.2020.01.07.09.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 09:31:50 -0800 (PST)
Date:   Tue, 7 Jan 2020 09:31:49 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Add qca_power_on() API to support
 both wcn399x and Rome power up
Message-ID: <20200107173149.GD89495@google.com>
References: <20200107052601.32216-1-rjliao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200107052601.32216-1-rjliao@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Rocky,

On Tue, Jan 07, 2020 at 01:26:01PM +0800, Rocky Liao wrote:
> This patch adds a unified API qca_power_on() to support both wcn399x and
> Rome power on. For wcn399x it calls the qca_wcn3990_init() to init the
> regulators, and for Rome it pulls up the bt_en GPIO to power up the btsoc.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 9392cc7f9908..f6555bd1adbc 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1532,6 +1532,27 @@ static int qca_wcn3990_init(struct hci_uart *hu)
>  	return 0;
>  }
>  
> +static int qca_power_on(struct hci_dev *hdev)
> +{
> +	struct hci_uart *hu = hci_get_drvdata(hdev);
> +	enum qca_btsoc_type soc_type = qca_soc_type(hu);
> +	struct qca_serdev *qcadev;
> +	int ret = 0;

another option would be to return directly from the if/else branches,
but either way is fine.

> +
> +	if (qca_is_wcn399x(soc_type)) {
> +		ret = qca_wcn3990_init(hu);
> +	} else {
> +		if (hu->serdev) {
> +			qcadev = serdev_device_get_drvdata(hu->serdev);
> +			gpiod_set_value_cansleep(qcadev->bt_en, 1);
> +			/* Controller needs time to bootup. */
> +			msleep(150);
> +		}
> +	}
> +
> +	return ret;
> +}
> +

I expected qca_power_on() would be called from qca_open(), but as is
this would only work for ROME, and not WCN399x, which only enables
the regulators in qca_open(), qca_wcn3990_init() is called from
qca_setup(). Is there a particular reason for this assymmetry between
the ROME and WCN399x initialization (i.e. one is fully powered up after
open(), the other not)?
