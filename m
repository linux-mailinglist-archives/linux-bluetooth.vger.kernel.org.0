Return-Path: <linux-bluetooth+bounces-3015-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C08930E2
	for <lists+linux-bluetooth@lfdr.de>; Sun, 31 Mar 2024 11:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A95A31F2139C
	for <lists+linux-bluetooth@lfdr.de>; Sun, 31 Mar 2024 09:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB93148832;
	Sun, 31 Mar 2024 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rJzm9LV/"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3398C147C99
	for <linux-bluetooth@vger.kernel.org>; Sun, 31 Mar 2024 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711874778; cv=none; b=iGGuGp+P1W/nyx6wIZgJJ0k/Kdsqdh+IRDf//W2iWYOpKPeAocaIXC66j+35rHnWD26F+aB4gcQitcknq/fKd1Lw+rPxAiodLKZxbeaTFEA/bqp+SJ0FmTPdYTzcx4rdWsALilo63fPq880qi78ymuV4PZQ7MUK6+Y+o7jVu0S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711874778; c=relaxed/simple;
	bh=uyHTJK9hGj4pUuhGRoNgYjpldlN5umhZQCXC4Cf21m4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCKYpCfaLxcLymfF/JmWX/RQSx5hZM4dgWtZxO1ZZ23CWh0hN7899Y7ze59yrM2i3FlRaK7rlTcFI5ke/82exXJuFcIiuJoUEnwU4dWsy6Mz0CWWafctsfiX9jEaOd7QvkJCvv7hYyXNrDox33/iG4UPAeHqdHs/MG5LCNtychs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rJzm9LV/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-341808b6217so2095474f8f.3
        for <linux-bluetooth@vger.kernel.org>; Sun, 31 Mar 2024 01:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711874773; x=1712479573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xqx8EsOfIsEAxTTB7WrsmLtXzdf/jwAZollbLpRLRYY=;
        b=rJzm9LV/xIU0E/XrWu+U3m741UhKJki/0Zhj3XdCypXwZovcbfSEd7F96UaXNfcD43
         3Z4Hn3HEvo5bMoFkRgk/Vx2HGb6hmn8AzcUnD2jIsQDgY1gPrI75X2ibSFAyaqwPSNOE
         n0UoOxuydypxGa/pWFECqMlBbeWWId8TiT5tLzWmRb1M9A/BZF/CUztC43+xtyX6wBJV
         voO42UJ532bbidNNJv7vwyIS1qNrnYA+d3M7pNSwvLxN02Nkpn4zqUKssxtKLaSagCo/
         TYJUPXglAQs/GkydcX6HPwuA7Bh1OpVEMjFXwGSrMDqH24LcR3qAqzoEqGiyKPqaafWS
         8u/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711874773; x=1712479573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xqx8EsOfIsEAxTTB7WrsmLtXzdf/jwAZollbLpRLRYY=;
        b=J9EPIUofSUlFMGAxybg+4y60xoNpgP3537V7BeQeitG5Ik82go2NKVmJUhmsYTQ0t0
         mtIEw9C4HUghvUk7N+vSRCkCTPGgRcMgmyXsXRj7ylVG/SljajXjAIFMITb0hf+XD9Da
         hyEEZpn3IE8PbSEOJW8UiLmG0Nbcj8HYMF/JaZ2tbsBijMXQfjTkser8CB1CEoxq+FMX
         9DHQKrR4FIqV35abNi0ecRJ1gxwzJvFlu0jFRqpwsZSHs/3LgtNMVNcNHQgJj/il0tCI
         g1nKuJ4QwGRUY2ec4QETnyf3jvP7dsir0BpebBWmi92IaQRhaVho9azvOma4CUK9bya6
         pW/g==
X-Forwarded-Encrypted: i=1; AJvYcCWzoxiqVD9uH2hJhbhBbPYvuFFnzD1rljre1ETno+p4aIXFJRxJUL4J/Ip/08ckOynn5pQjlMW+d5+aKnUcgW72aLbsat9jEf1EjgDI/OEc
X-Gm-Message-State: AOJu0YysI6//W2AXisCYs9+wQZ9cWJiGYwMBTVGbvsMVtcIN/mPwhxoR
	MZl7his3ime4VIDNkFf/3Yr4QhN1NPC0G82E8gPqNC4op93KQrxrxGExBRGGzWs=
X-Google-Smtp-Source: AGHT+IFek3qzgbs7V761yvMbVzXmLG/9C3zAsZw/31BGdAd97C/MQ/TvoSMIOusJu9yQQnnC5pkHjw==
X-Received: by 2002:a05:6000:4014:b0:33e:5fb4:49d1 with SMTP id cp20-20020a056000401400b0033e5fb449d1mr6156006wrb.44.1711874773612;
        Sun, 31 Mar 2024 01:46:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k17-20020adff5d1000000b00341b7388dafsm8436003wrp.77.2024.03.31.01.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Mar 2024 01:46:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 31 Mar 2024 10:44:10 +0200
Subject: [PATCH v2 23/25] scsi: virtio: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-module-owner-virtio-v2-23-98f04bfaf46a@linaro.org>
References: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
In-Reply-To: <20240331-module-owner-virtio-v2-0-98f04bfaf46a@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Richard Weinberger <richard@nod.at>, 
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
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Alexander Graf <graf@amazon.com>, 
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
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=738;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uyHTJK9hGj4pUuhGRoNgYjpldlN5umhZQCXC4Cf21m4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCSJkyB5jVftWfHE6Y4WAM9qzx5c9F5f36NaXf
 HDiLHSFtbSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgkiZAAKCRDBN2bmhouD
 17E1D/970uhi6aEAor+qvSHFSwwBAIJPIudirpecSG58uZQ/z3MqIYltLYSOACKb10uijVFD58+
 xViZKnO6uh4f+Scn1y4VoB1/wB7kd4gQiTLtXkEUsX2CBxLZIxfM36EpUpmaB9x5mLST1Nnf8vx
 2q1ivSLC2iO81+g9NTGaqG5/4hm/krk7IycxyRZKMTbANGN29VIzgRLESpCC5nlr3u4klPWJC76
 VDKWnuvE+/NuIQg5FjVC7xPBBtPsQmC/adjVD0fqPRvSVcssbIBQ00wGlBtyUNwQHBtwxXJ7WfD
 0hzpaUVK8B+NrTzlAhFLCQm/cBuQ17psr/l71CNhX371mfd3i/KQLsD/LcmOg8dauxl6qiwg8EW
 qQnwJKIzj0dDl29fLhdw/iGVPcY2kvTFzSbq8Pq6r+UhpzzUm2BF7NtPH1e3YBVWgqDF7VpdqqJ
 T9CVzYKDp1RUwO9GRK7EQkyXRTS9I7HS2Jc2ZzECeh9nsgIXXMCiqzetYxe4zxDrE/lyjtgIOR3
 pzL6XA11CY5Kk3+MQeSAgPJmSlOyWlTs7Wr5TJfR/iLdaPwmazgHkK9vQLKXXZ/CFvEHoIGqNAm
 Aa/ek5+YsjAxFpiN6ZkIUqwtcnmASjZiWWmA8VQ2WNEHXNdEJmbZMPEKw5duK8bIkb7CHicrfWT
 kBJS4txpYhAnWuw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

virtio core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/scsi/virtio_scsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
index 617eb892f4ad..89ca26945721 100644
--- a/drivers/scsi/virtio_scsi.c
+++ b/drivers/scsi/virtio_scsi.c
@@ -1052,7 +1052,6 @@ static struct virtio_driver virtio_scsi_driver = {
 	.feature_table = features,
 	.feature_table_size = ARRAY_SIZE(features),
 	.driver.name = KBUILD_MODNAME,
-	.driver.owner = THIS_MODULE,
 	.id_table = id_table,
 	.probe = virtscsi_probe,
 #ifdef CONFIG_PM_SLEEP

-- 
2.34.1


