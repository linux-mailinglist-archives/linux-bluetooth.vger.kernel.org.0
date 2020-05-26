Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB36E1D3681
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 May 2020 18:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgENQav (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 14 May 2020 12:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgENQau (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 14 May 2020 12:30:50 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E92C061A0C
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 May 2020 09:30:50 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ms17so12672120pjb.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 14 May 2020 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NZQc8uXoIuHdBfx3/ho5SqJ2T1qFdUpk12Ew1zdXSig=;
        b=fJqBY/5FYNxLDv9s+k1bD5kgHfZb4x4QdhSQDjvTPRce5F0WExj6Yk8EKnqN5ujCqJ
         tYDyne4MPTY5jWebIQOLSn4f3t+eJX2+MsRSvEAzyIPPIhVwKdUf51O+c0IKkjwj16EV
         CtEG6JwwC0NoImpoajwzZB99GDA5wBo3Sfvzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NZQc8uXoIuHdBfx3/ho5SqJ2T1qFdUpk12Ew1zdXSig=;
        b=d4s326/eA4+Hasu93t3qK4T6+U79QtSgr09cC2OmcUfumSXXoGbMwWPF4MQboVARAj
         mteJvW07tcmp0MHeNlvFtq4GUcEt3g+ZqlqfMzAvktMsMn5Ga6nv9lDsd4nLSPAtGWDb
         qA9ib35eS8UM/Tf8AqUxmJmIkTMlqGobiZu5coXdfzct4Pubn0F0wB4RNEGPPDciJlmD
         HrH7xm20uWvTdxsqQxeLhyo2PUvMR4x74DFmkqFTTticZ9FI3NWWCBBAuYZuJJPqXS3+
         sPGXexy4Or5t/DCPxRVY49N9d7iTt08QVUo/Rr8heoYjGiz7ggCcPZ7BsSiRs44n5z3J
         j22Q==
X-Gm-Message-State: AOAM533ULpw9Nv01NtQYtcgQ0tUHkg/Ik/+5Ar4dJ8yraT9W7rmzxbWk
        ld9vogvTt1krpIYI/KLOv6o67w==
X-Google-Smtp-Source: ABdhPJwO1LU11eYIyY6fK3UdsEdl9NAr0oC6KDbrIPekP8Jj3YE72XYnPb9U++gPLJcDiY+EjAWgtQ==
X-Received: by 2002:a17:902:7d85:: with SMTP id a5mr4964543plm.106.1589473850143;
        Thu, 14 May 2020 09:30:50 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id w11sm2634015pfq.100.2020.05.14.09.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 09:30:49 -0700 (PDT)
Date:   Thu, 14 May 2020 09:30:48 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc:     linux-bluetooth@vger.kernel.org, bgodavar@codeaurora.org,
        alainm@chromium.org, marcel@holtmann.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_qca: Enable WBS support for wcn3991
Message-ID: <20200514163048.GO4525@google.com>
References: <20200513204111.1.I68404fc395a3dbc57c8a89ca02490013e8003a87@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200513204111.1.I68404fc395a3dbc57c8a89ca02490013e8003a87@changeid>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Abhishek,

On Wed, May 13, 2020 at 08:41:25PM -0700, Abhishek Pandit-Subedi wrote:
> WCN3991 supports transparent WBS (host encoded mSBC). Add a flag to the
> device match data to show WBS is supported.

In general this looks good to me, a few nits inside.

> This requires the matching firmware for WCN3991 in linux-firmware:
>         1a8b0dc00f77 (qca: Enable transparent WBS for WCN3991)
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> 
>  drivers/bluetooth/hci_qca.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index b3fd07a6f8127..305976c4dcf42 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -75,6 +75,9 @@ enum qca_flags {
>  	QCA_HW_ERROR_EVENT
>  };
>  
> +enum qca_driver_flags {
> +	QCA_DRV_WIDEBAND_SPEECH_SUPPORTED = 0x1,

s/0x1/BIT(0)/

> +};

The 'driver'/'DRV' midfix is a bit misleading. WBS support is a device
capability, it's not something the driver supports or doesn't. Maybe
name it 'qca_capabilities' or similar.

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
> +	uint32_t flags;

capabilities?
