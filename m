Return-Path: <linux-bluetooth+bounces-2830-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8185288E5A4
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Mar 2024 15:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A302A1C2CFDD
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Mar 2024 14:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E6D1BDBAA;
	Wed, 27 Mar 2024 12:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rJieFn0h"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A64150999
	for <linux-bluetooth@vger.kernel.org>; Wed, 27 Mar 2024 12:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543582; cv=none; b=eKRiaCH59LdBanYzX5eLRfVNgbZOlOIVjz8j7hv+Mao9+as0qlUSFwtTlEzX9D6B5R5nLsP0IHzFRyoqGpfEV9FMLycKMpf7++Y3Y6Egqv/vx548S/RPXjRfKCakq4V6xucXB3A729SM6kqcgdsnsim6Mh23RYsdNVmzLBleEvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543582; c=relaxed/simple;
	bh=JcKhWFch83brhdG0VtzetHVJQ40R24YKIvpYHZtTLn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWT3NQLvE9Xpufhp5beWffpqKuXf7+87AU5vC2l0BcTeRgDi5TnHPgqK4StsWaZv9lOKCJ93K6sOIKAllmG5RKnmkOuPhVlsPP/x2q5kICzA16KLNbEwRZUbdXIMw0xSloZhBWCI6sNkP5qdfb6zPTSI5A+9TwbtksuOMZD8E6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rJieFn0h; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56c08d1e900so4399950a12.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Mar 2024 05:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543578; x=1712148378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTHQAQAXVP2yHTVyN3Qf81PY6hYlRsflmkOJj4KRX5A=;
        b=rJieFn0hbgjOUFXBDnMtc3gi7yiRt0nTBUY8RN8ULF0Sl23bgfuPf+C9JQuODFfijb
         jb5MykVChsIQheuU1/1aaAxUbZWcJVvancIWT7QI3DPj9NZdE182X2iSoBtw1FBirO19
         kNrWeoi/X30Nm10iDJO+VQM/3dOuqY7+FRF8fcAc2+UgwCD0IKi64AChmmBCWUgUVfG/
         ImSKiokzIZ7yIutnTQjUWRMRrt2QhGrP6KGDBYNLumek4H/M3UYvYDzHiO73WPRV2nF7
         GQ4pU4kdO7+3uTFQPCfm28IZrTkpyeZVPkCYkTL8/JPv4p8bJ1Gxuz2eo9050g7VpGMl
         a29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543578; x=1712148378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTHQAQAXVP2yHTVyN3Qf81PY6hYlRsflmkOJj4KRX5A=;
        b=Uy669igPdgGyca8/q+jpKyopvl1fhiCQTXE1G0L68RGYz42ccYrZe+REN5WHSC704s
         4PR+zvY9nKfX8bTH9IITRNjcFBX2poywxWGk9Tgq4TwtMsWVJZCy+bKeCfJ9pxCykNh7
         C6mfPy1L6r/WFCQLYvWhFLsOMQN/b0i5GkRL/Rs0vjtV9nn1Gxs7MLoxi+cRGWbP6lkz
         Gz+Fl5Lz8xrZT0OY+rYHCZunTFUHZGBgEwwyVq0cFcgcMNUtuUn4SS064V5tg189DKTd
         /bpLZ6YzzODH5xa2mA3dSGqGRzYOtMKvScRT7VUr56xogU9va6LExucwkxb+75wuxEzp
         oQag==
X-Forwarded-Encrypted: i=1; AJvYcCWHzD1arnnX+ckhp1dgm0Y8FZgxnoQJdds5P+PK1BR7cGpA0wa1Ui295SQa/ozDBzj4dfUAQi3reSrOeSn9UIJFL3fPlkKPNLeGHFpJzwQG
X-Gm-Message-State: AOJu0YzYzDaoeVFEhCPruOYHA6VDxOP6uX4PK86rI7TRhdZWZKqAkeUM
	2T6SKqS593cqRywm0JcOViW1ZGaPMoVcImoCP9R/BrbgosqYo2ueObLjn0la8XE=
X-Google-Smtp-Source: AGHT+IFX9TzVkfreMFnggYGMLSIMwa6TdcWtnATIFoctKTDk56r9dBF2wj2yYQDj0kzNPmIK0zouXA==
X-Received: by 2002:a17:906:4542:b0:a4d:ff5f:98ad with SMTP id s2-20020a170906454200b00a4dff5f98admr1560710ejq.37.1711543578195;
        Wed, 27 Mar 2024 05:46:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:46:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:08 +0100
Subject: [PATCH 15/22] net: 9p: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-15-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=719;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JcKhWFch83brhdG0VtzetHVJQ40R24YKIvpYHZtTLn8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPn2yRXyBXkq6ACxK8eFxLTG7R9tVOB7uD/Y
 7v9Elz1TnyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT5wAKCRDBN2bmhouD
 15k2D/9hVir7j0TqughjehMP7EZCDouF1HvdZ3+c7KMqYHSlkKGrnvjzwyfCDv3RlZhh+e4FdHm
 X+s2MAMJ3/85Ly02t4joZHI5QfXytoQo4wwpxxtkpRJN5HiVm/rzZcXsccHZKIRcYWz1PH1N/38
 fm3Bxvy+ZnHsCGiSHZsM4PqLa6T9KeFlpqp++ZsNra60QDqFbPqgVbY7+kqLkwM0/AUsGpG5KH+
 fANSzGGe28ClqfxLt1Vu4U8CSlWj7o3ElcC/D1XBCweTqRPcA+2iLe7qUDmhal7tLZX6ScveM68
 DfAmPWnA9tNLgNUIX4SkzIHy5muQ2Carr3j/RrrZpNNVOt5Rb7NUnfq4S2bZNQmiGMtu/X7CDDx
 YJi/1RGHGSqYKlxD5AR9Ez4RoFG35FAuZUI8gO/AbAvW4cJ75x77zX3gQSCjiiqhn9mLgzwLmDE
 1oKNZb8RoXjYMGAXa4ZRkn76LzMcWV5/Bt2t+04gDUOR8V1oiQqStsdHKtr1HJO9N86cbbk05le
 RrseGA2RFkzWlx0/Wu+TgsVFtHEwAqu5ZP8LQMSd/i+S9ZdwaO77JXqExIP7SpKvQP8EPSlg574
 lkdW0kb9S1N7OPFwSIwHgZjvg2eSitp5mVOTWd2Cs0lm+avAC5JESLW0CvDV6P34723ld4sdEDl
 LSIrKL+jjHKKMPg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 net/9p/trans_virtio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/9p/trans_virtio.c b/net/9p/trans_virtio.c
index e305071eb7b8..0b8086f58ad5 100644
--- a/net/9p/trans_virtio.c
+++ b/net/9p/trans_virtio.c
@@ -781,7 +781,6 @@ static struct virtio_driver p9_virtio_drv = {
 	.feature_table  = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name    = KBUILD_MODNAME,
-	.driver.owner	= THIS_MODULE,
 	.id_table	= id_table,
 	.probe		= p9_virtio_probe,
 	.remove		= p9_virtio_remove,

-- 
2.34.1


