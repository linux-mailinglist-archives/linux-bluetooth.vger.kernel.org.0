Return-Path: <linux-bluetooth+bounces-2824-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA4488E553
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Mar 2024 15:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE0C71C2C8D4
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Mar 2024 14:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC3914A62F;
	Wed, 27 Mar 2024 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B07o5P9r"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B0814AD3D
	for <linux-bluetooth@vger.kernel.org>; Wed, 27 Mar 2024 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543506; cv=none; b=X2W8jq0hbtWmNyhr1Gb1khktI9URm28g71FnYrLkW5HYy55ozddO6DWjZ505JN9g39rXs1Y3ok3zGNBLGFi1VZtJ6hqsK50Io2mVB49yeVDRg0A+K/nYAG2Ocy5ZETJbk44nCRd+MAdwOuRDQJVdVJYWv/KZisgRU/m+wSY3pSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543506; c=relaxed/simple;
	bh=//Clpegv8bBxUlHlrbVbhwLuVMMJ/bk7DPF0aGjgRRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XRoYnKMklxHXhqH0BmF268JfRSMcwXROiXs9EMcWbvR1Vk1im+Tv19y6EmGASkD0uvXKmVGhdko9zan5KNIt9dTxpwve1UujxC2LFNhlSHGRtAlPCdnHN3jQPijB2WU/tFOLsPCHpdnwFI4KMSVVUiXLy0StOgIMPtcE8aCuMSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B07o5P9r; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a46ba938de0so890751266b.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Mar 2024 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543502; x=1712148302; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0hmLEhtDW+HCSY30P31S1H131D4FuLuLKkbSxHVWro=;
        b=B07o5P9rOb7FZbSCdgNjGMrnsuLx7L1xCV+iiHaV2D1HcrB6EaNmEOcQ/Ie3XqIQpa
         mxxlT+d10BFGyVszlEz853n8gjG1+C611fnjQQIokfN1lbDy0V1xb/7jYehHkZVcnnV/
         YXDdYEAOKsq9RdmWKdLVLbnXUh3jQTI3S+XU3ic2W9nuN0wqhJfvdfhWtz21vJn/qFoM
         kGh70ROZ/HaMft3dXmDweSW2GaksupQ1ZfFzt/+dLQ+KpmZ/h7EpnWJ4lsX/jIKnOcE/
         +qxynsfFbMmIf3vEzZiaGD5JLSSFqCz+5uYk0ZzuoX3UzipGbHLxrLUgJ66GoMPfaYQl
         ePtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543502; x=1712148302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0hmLEhtDW+HCSY30P31S1H131D4FuLuLKkbSxHVWro=;
        b=DQE+2+PfC4oauk1JBWN2o/mvF+yHCIfpu3YUXHbDNmSEs3SDRZoxmSd0GCMkRx9UPS
         hB5hbR1Wna+wHuzjMumD0ClUBGED6NeD+czNQadAPtKEUPKyLzConbKrCpZ0Le5cd4qn
         AnxEqEKI/MPb0JDVVELSiKUX6GVPbhhWAzlLJVuk78567BI1kcVCPOJKrmNVCjO2pADj
         l+hdvO0xXG9L9tkZGGc9+RufM4DbF1v6cYuQQmThIN47XDpfeU1EUXSSZrLbrc03JFa8
         i1EHVLjoV1+MZTYQvwEJzkhy4vOwVB33HtdDQfDTNWD/+n5e5PTpesk6fZXwymQgmnZQ
         Y+jg==
X-Forwarded-Encrypted: i=1; AJvYcCUjuSjzbOx/Ohua03QRJly9ZEQrEI+dQcMjhh2OIMmY83OdabW/g9VblgiUrbAoPIp9wlqvBnr22AaTNhXLXdIRLPWhMgl9/4wbUXTdlF1F
X-Gm-Message-State: AOJu0YxgYNsqAOs0HuMaj5r8BHre5JF3gCgrxLWkr23dLnqtpSqcnrrv
	KoHDd+k3OcrFSdDoBDPsHatFLXVLuTD/pkZaCo6GLgPlo0WaWIlRQl2sW9DTxLM=
X-Google-Smtp-Source: AGHT+IEn6vRTkmoHQ1wiFr8qmjh3PJ0Q6up00xiHporN+nJtNCU2vs+jLj3PzJepGOiy+pfR8eLRwA==
X-Received: by 2002:a17:907:9729:b0:a47:38c0:fb4e with SMTP id jg41-20020a170907972900b00a4738c0fb4emr4546499ejc.19.1711543501964;
        Wed, 27 Mar 2024 05:45:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:45:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:02 +0100
Subject: [PATCH 09/22] gpio: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-9-0feffab77d99@linaro.org>
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
In-Reply-To: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Jens Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Amit Shah <amit@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gonglei <arei.gonglei@huawei.com>, "David S. Miller" <davem@davemloft.net>, 
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, 
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, 
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: virtualization@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 iommu@lists.linux.dev, netdev@vger.kernel.org, v9fs@lists.linux.dev, 
 kvm@vger.kernel.org, linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=678;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=//Clpegv8bBxUlHlrbVbhwLuVMMJ/bk7DPF0aGjgRRI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPhAflQ1FGJhDAzbOegIOtyn0DiKBCT3tO0B
 s7IjiqYlSaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT4QAKCRDBN2bmhouD
 1wlSD/43RfNzYMYcTE6YGm6f/+zF4ZOeA7+AFzoz25hWACnn09ZJUKsqo8b4OOQmqYEITbWY9+h
 XPRwnPPXeNlc4DgWGOJbLmvCBCUuBSqKMyqIVUHeiKQYkKcodvybd1f5lbAL+Uom9vSnbje9Plv
 wIiwg36QHAiGjrP6FCrbFTARU+u3TVSo9UrmxbOR/Cs2zcsROAS787ue6dERDMHRhTICDHzchGs
 8lirSnX2eLweIUdLVeflXwAHFaVpdj5k9bUmCEJ9y8Dy0+5TaOREm3IIC+BMGqKTPwXr2xpX3Dd
 iUxBWyxquOdJ4D2K/0LVhYSSC+VtEt5ZZuC3ZoWa4HTxJM5tAElcgWaOQps1lNfT5UbRtK8uoQi
 iqAyMFhheEhnye6diL6L4H3hulkrYJw6LN27JtLkTStHd3lYU+1MW7TqZMKXQcujQNGhdzO9d+m
 3of1UO+mt5KeIH2CAx/mgbR5MLfW609xLhuHPWn3i/GzYYdKJxXMrj25rctSRtBvtmGHD8iF6o7
 CMdorn7Yl1SzBIoYcHUmygb3XOTnW7Zn+L9RB2k2epy90G6CsuIsaV5Plxhgk41/NsTCYyh6gWq
 GCkiLrJ9HW5biRhItd0RUt02PbEl7Tg1O0q20/cwbVq4IAyTVScxVYfx4ilMNlem9KQg/2l7ayl
 fFGCYquCVzZZykw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/gpio/gpio-virtio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index fcc5e8c08973..9fae8e396c58 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -653,7 +653,6 @@ static struct virtio_driver virtio_gpio_driver = {
 	.remove			= virtio_gpio_remove,
 	.driver			= {
 		.name		= KBUILD_MODNAME,
-		.owner		= THIS_MODULE,
 	},
 };
 module_virtio_driver(virtio_gpio_driver);

-- 
2.34.1


