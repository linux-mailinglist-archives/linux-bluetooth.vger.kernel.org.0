Return-Path: <linux-bluetooth+bounces-2969-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F668922A4
	for <lists+linux-bluetooth@lfdr.de>; Fri, 29 Mar 2024 18:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F7561F26E4F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 29 Mar 2024 17:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C881413AA59;
	Fri, 29 Mar 2024 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XwgcDncr"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D13713792C
	for <linux-bluetooth@vger.kernel.org>; Fri, 29 Mar 2024 17:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711733096; cv=none; b=pyzKiplQXlr6su0moq5+fEH6WrS0wMyIrmPjNeZD5sQ+z1gm8T4di3MI8O7K5UCrO+0j9WTn6OBZl6tarZk8DMGFDFqJnRnWwgCjZMw4l59wSn9hAYj1Tw2KjlPZW/vU+kECrKmQo407qqiPeOBDYDhzHqNqoGPA6qD7laIlP4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711733096; c=relaxed/simple;
	bh=noXTH8RgGL7KawLoBkrEaQ5WJXIVuj5AlJL341+SDU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m/C55Ev4P32qLuDCjjP7BFtJCOQMjHEUs03xmqs+08X6JbuuTGfFPyKT197iaenYfTsFhhNzXC/zhyklGgFKt6tjPLb6qMoAaJ8HShAU/sz8ucWPL2Cw0GfZQhmYSiSMVaRYVjxzF4g9kX9ufLQSZakjHj3olkKWL/tk91UbZoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XwgcDncr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41551526477so3671435e9.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 Mar 2024 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711733092; x=1712337892; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcL5hqCrDYbrBJKg6yubNMlPGipEeaEcniEcZ5X/ejM=;
        b=XwgcDncruftu25HUXq5u5VLVyiYuEgGIL50c837+kLRT7Bna8CcGecnC6bge9PO1uj
         zZRoVmADYuGodWsZzH6/7IcjXQZy2M1u3ZZBF4u8htCivbPzjgQtZS1w7TcOnqMKXotv
         qC4RfaP1Je5nuIDX3YIVtpI7crML6RZf11+SEjNbMIRuwPe0F181wxZ3HxhGRfmeVfbU
         1+EYd99VmvTFDkpitaKnN82vqOwR6hi50x6MDkNS3rZ/5xDvY4cKqKVdPaGS+y2CjeXR
         ouvneJBAHKqp6FNymvv5+UINuUp7rsNx95j/uBY+B+GA1Ac85Uk0D8+5LDQXTZzO6x3L
         mq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711733092; x=1712337892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcL5hqCrDYbrBJKg6yubNMlPGipEeaEcniEcZ5X/ejM=;
        b=aL3MzRINjCYzdLa95KPJWAHYUMMb5CTbDU9X9pIYUiQzgDqnimQjnNvvbDxl55Lxlw
         22V6V407/INNwQ6JYru1gOR0GfEGT2ifVOiNpUbknr2K3LRXETPsnS1Onj1wwjzp0yT3
         rkugi3EQgZEtV/SHHFZu49Esjv2I/kEsZn1QPo27f9WaorcZRg6KhEe9HL62tFjMApqn
         j88yCfAEJvQDyFMJro4Ij9xaMjBGtny9FOlqHiSPDDuwnSTpOQ4G3SzX/NClxdMcpKwR
         ZlNkgDQfonEhwEIZJ7QxJATmHODZng6Z4bPLFuczDNTfkXrifuK+4IY7Lo2w4eVNN+G7
         UytQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbt1aZ3UuG8lV/sFUkV3SH0Ogcc0wO7j0RUTYaDBD87gq9TDYPjQaottQLaOVEfFdhD6OA7fN9lWG8l7rwDaxwafZYI04XNYoamO+NOhFa
X-Gm-Message-State: AOJu0Yzy5WU0QKrTFkpy29EijNlKUEZsSj1GrezpHeLLliEeMJ+QLdCy
	fEejZW93UoNfN1JhAdYH1D+5cazd+dJ+2cvKCYZE3omJop0YiFlNk0AudLQEgcQ=
X-Google-Smtp-Source: AGHT+IHndS8nu/3l0eb+ocEil75C5QdKWIieUdDFgHlm/5IXoaqNdJplBaNZAa8mBAfYg5ACllbteQ==
X-Received: by 2002:a05:600c:1989:b0:414:93df:bef1 with SMTP id t9-20020a05600c198900b0041493dfbef1mr1962459wmq.39.1711733092656;
        Fri, 29 Mar 2024 10:24:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004149543c82fsm8491069wmo.39.2024.03.29.10.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:24:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 29 Mar 2024 18:24:33 +0100
Subject: [PATCH 3/7] bluetooth: btmtksdio: drop driver owner initialization
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-module-owner-sdio-v1-3-e4010b11ccaa@linaro.org>
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
In-Reply-To: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=688;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=noXTH8RgGL7KawLoBkrEaQ5WJXIVuj5AlJL341+SDU8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBvlZscrGsmgUvjqJCgIZjHOxIlihzoLBO9BSY
 fg3/UkGg5eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgb5WQAKCRDBN2bmhouD
 10WFD/44MFDZMNzymsgjUnQ3eQYk9ZYGtWq0RvUzVCTg3RJAeC5QMaYgGOPTdILnysbGdc5pw1Y
 8btwMyBPcLE0+s0b2snLnak9o3VA/IQeBEo1wDMxi6SUv+Spu3/w+KT9HGF/5z1M1+7MeGKwFEx
 aegcGkBu2NQ9W5RUGN1mN09SJA6PZWzNR2bhc2K5zyA5gCF85RV6wBVAEkfyp2dFdlDxer42il/
 eHnLXd7fslojOU151TEO4etUgSfgbnqT966M0IFu2V5y8n5Gep05sxzB7lUOqGctZlHQWT4DutR
 7G/TUMAyKFz8cq1YdMmylWizy5bxD/cWMndC78oTGKNv9geLyTz8+zN4BigpeWd2CNAF1Z9OQk2
 rcahEfMMs/lR19mqhB/vi87YmOv9DSxXp4MJ8jlft2e6JOcnfCQbEuMKw+N4Kn8GjTipxbHuj9v
 VCZ1adA4/dSIRgnnqChOhoeMMNy/e6c3hf+sYVstG8c5vjTvVISk+yC26FmrnA0yBTj9HcycA4I
 zBhHz0yp3PRxoI1KM7w4XFdpK6Q1fzxFe1PFhEg5zyZ6z8dOBPLKB3q65szRxbVauRRHJmAB5HS
 7YfCAGceDF7Q5RxbQT4890fa7t2cKuJGnnZ/X+hpW4xQXb+B9D04hmee0d+LsdlE9/1XcXZBGDW
 /rAI8sr/cdlqF3g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in sdio_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/bluetooth/btmtksdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index ff4868c83cd8..8ded9ef8089a 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1519,7 +1519,6 @@ static struct sdio_driver btmtksdio_driver = {
 	.remove		= btmtksdio_remove,
 	.id_table	= btmtksdio_table,
 	.drv = {
-		.owner = THIS_MODULE,
 		.pm = BTMTKSDIO_PM_OPS,
 	}
 };

-- 
2.34.1


