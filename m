Return-Path: <linux-bluetooth+bounces-2833-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D475688E5CE
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Mar 2024 15:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03B6D1C2C837
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Mar 2024 14:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7ED31C525C;
	Wed, 27 Mar 2024 12:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="maTUXGR2"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383FA1C522B
	for <linux-bluetooth@vger.kernel.org>; Wed, 27 Mar 2024 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543600; cv=none; b=f4GTtKzWcmW9198rXiPyrErPubPxmlsTnbTjYECYtNqM3xjtCc2Wyc/nmhu1yIrPJoLs/OoqHP596cpyrLfWzW5o9eN1ygltDQHtjapbjGoHZ7tuTkpiFvu/AnQzvm8gkH3HI0ILW8tYgz7LydTIlDExHUHrPLwg3uljCei0LUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543600; c=relaxed/simple;
	bh=W2uPMLn9aZC2/DrVKXkgCHw9/uktQxsAyBYFIcytKDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXGQOU2iN906+IksjEJ2Eck2PXv+RDsj1sieaU65NWmfNTQa+njeEeXsxm4K5t4mq4FGcvj28kPPoTvOpaPTBGYglCFCH8h7jEgyLoRHZLdOsyvk6iXMJfJjmT5MQSVqnhtuZRDq4iqB4DMjfag6/YXV09BORQJbm7ynjUvbg0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=maTUXGR2; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-513d212f818so7565294e87.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Mar 2024 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711543595; x=1712148395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McYmWpIHqnRHuHUKxnmbeBHOdqPaGbBUFgcAd0kJzvU=;
        b=maTUXGR2itrA7IdgrAm63090xvfcEMkBLVRggfMFz5aNoS2YPOTHiNS/rF0Z4tkfja
         DM9VBSAyu61YiV9RubFADkjlj9w7qUBj2YkeB3d72kBv9Wl5u8XVudcHiv146sZmMuvz
         EnFNJwIeMgUYPVU9fexPQH6eAdfedXUpLRq4eVJEG8gxPPFOI4jcH0lhRUp7VYNhsuDy
         EuodkloVYL4UPrx00KQHff5on6bSFOrlBUOtPl5wLJteSFrwpwfDPhUiLgueaYMsbkBf
         930wi3CIU+jBivCV5OS2iOBBbyvievSKot55rqRkV/IQnUfyfp8A0s7IhCk31CloUHpV
         HNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711543595; x=1712148395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McYmWpIHqnRHuHUKxnmbeBHOdqPaGbBUFgcAd0kJzvU=;
        b=FbpkQVNKbYWZ+AcEs5JoGxoH4qDB78c+P1sf4tDF6wOetjbnvZwfr44K1A/Y72bPB+
         nqax42W5stSrlKzb/+AIwbzmzVjM875wMKbaN4P5/Zg3BvUL5KsaxUphJGc3JqxyU0U2
         aSwMyq0z1YY37isV36A8KJ0uP56IqdF2rGjie+4ypq2NyhL5fErZmlBC+myLbY3AO5vH
         qxwb7fEhUH5m1eVUQX5DqQhWRpA6Qpeg+c777OAX21hf+DrOLPT+RTvlBG0egR5Vyvir
         DoMGjaG3GfYKnoMo7KJ9SW5NsTKbyAGCeEjSmSN6V9oRJMTK74YJ+q0DIUMleuKJCyBU
         thrw==
X-Forwarded-Encrypted: i=1; AJvYcCUWgQ0oC/mw5l/CpZ7ZsQmq+s2ljWPsZ6WSQjdIFULBZWNKrTE6nZzcjROtLYW1fTUDa6AKCQ836WX3FEMXyObMpoNR26LxkQIjMQH+d0P9
X-Gm-Message-State: AOJu0YyRMuzd6MnfrkqoeCbxmHQABjqvQ46c65c0q03op99jwgGkPWwc
	QXzyihpuYBoqOhb1rLTVUjRStdG0Zjv79qLJdqR7pYj00VyFJnZLIhfh/q1tN00=
X-Google-Smtp-Source: AGHT+IHh6rqFh581bZcQYBRywOYCRmWZwQeyq1mV0qRFBN/2g2Xt2bwkSDnVtTf/8goPKjdNKzBlNg==
X-Received: by 2002:a05:6512:613:b0:513:c658:799b with SMTP id b19-20020a056512061300b00513c658799bmr1766554lfe.55.1711543595380;
        Wed, 27 Mar 2024 05:46:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id gx16-20020a170906f1d000b00a4707ec7c34sm5379175ejb.166.2024.03.27.05.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 05:46:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 13:41:11 +0100
Subject: [PATCH 18/22] nvdimm: virtio_pmem: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-virtio-v1-18-0feffab77d99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=768;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=W2uPMLn9aZC2/DrVKXkgCHw9/uktQxsAyBYFIcytKDI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBBPpSVn6rxVJDZQj8B+8I+NhZbQA6sHLNZh6o
 gaig58YQCiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgQT6QAKCRDBN2bmhouD
 16IXD/wMe3wrEOFRyQ1As6FVIhIxHfNiU4EbPISAAb/XWzfqomyrReiTCWLclRbdalbAuQ1rW0D
 klwPUTS03qKbji2eSzPJTBEDw9REoZ5/oLueiWNfexxci7Fh+A/jvUZqh+uLCes4gL//yxJPVCX
 nhR9oQCt3KEvZgc0/lm73Bdw5ZEEbI+IOYwunjBEg+q9YBYl+zCQpsmn/f4h6rj/6SMs01l7Tv2
 V7Uzy4K6wWxtZpgqiH5QJXZGjIut9coUOv02Q38vYoPph9aS0ukNOnCTL0D1Lof5BNNajHY005t
 nkgndhV4iGXC+Drokj00ocBVJzO8JAWltMee62xUt4QmaVCMpoqf3wnzLMuDLOUgkgvSkfE6pzm
 pXAN4kL9A4HmrZHUI5a6QM1uTC+MZ4SleUgLn/6wOrBDOR49383tLtfEVSzgbIqmRO8bPyQmYZr
 FgwgxlDCMx1v41Awx8l79hBj4GKfUlq1vb2TIlm+8oFD+A+nG0S67SjIaDiwmCuS1y0Kd5cxxus
 Osa7Ne3T/pwXFTo+kyaO00o7ZMMbmm4bEE8txq29HnJpyERvE1tPmQVmozj6AM6a66RSPTYla+G
 xHoslSrNVR+YphBl/AY+jLFV9dwGxFZoLSQm/TXlcAHxHFvNNBGrCZgKV6V3+GSW6ZqanjqpZkc
 jqdvJ7rL2ENHOaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/nvdimm/virtio_pmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c
index 4ceced5cefcf..c9b97aeabf85 100644
--- a/drivers/nvdimm/virtio_pmem.c
+++ b/drivers/nvdimm/virtio_pmem.c
@@ -151,7 +151,6 @@ static struct virtio_driver virtio_pmem_driver = {
 	.feature_table		= features,
 	.feature_table_size	= ARRAY_SIZE(features),
 	.driver.name		= KBUILD_MODNAME,
-	.driver.owner		= THIS_MODULE,
 	.id_table		= id_table,
 	.validate		= virtio_pmem_validate,
 	.probe			= virtio_pmem_probe,

-- 
2.34.1


