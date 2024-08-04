Return-Path: <linux-bluetooth+bounces-6633-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8103094705D
	for <lists+linux-bluetooth@lfdr.de>; Sun,  4 Aug 2024 21:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC0191C2083B
	for <lists+linux-bluetooth@lfdr.de>; Sun,  4 Aug 2024 19:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C233C502BE;
	Sun,  4 Aug 2024 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=basnieuwenhuizen.nl header.i=@basnieuwenhuizen.nl header.b="Ky90/iMp"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F00EAC6
	for <linux-bluetooth@vger.kernel.org>; Sun,  4 Aug 2024 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722801209; cv=none; b=dIt6oeZorWYQxohQgnxw6OBU4B4SS55pT12plmDb0yT4nk01ewUNEpG+MEsnOcf3vE85ntFqS2jirPsi+qnxrZPAl0+5wpDaLOLDxMmbfZhDwFBdpPcW9C1ud1KeAMbiJFRtvDnBaCGGMZnI0r9tD1Aj/jbRM4h+daGfP5+L95s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722801209; c=relaxed/simple;
	bh=RrkZw3w+86ca38jyCq237PXLErKiGTeH2zhvdTSQaFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b8RJyRyQG6dxu/FIyVQFZad8uVnDxTqJrxIJzOGRXIRf/5TbUCdNkYfESqtbMuRVWgGQV7gnIVbgGSJN4bvLQwm1DnccebA97dOunc/xlFxESg9JHN6e1B5PuDqhyn1Ojqdb1VYoNfOt0rdabB+y8jZe3HQyb+SrrVFFOmxWYik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basnieuwenhuizen.nl; spf=pass smtp.mailfrom=basnieuwenhuizen.nl; dkim=pass (2048-bit key) header.d=basnieuwenhuizen.nl header.i=@basnieuwenhuizen.nl header.b=Ky90/iMp; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=basnieuwenhuizen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=basnieuwenhuizen.nl
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5b1a00750a4so781634a12.2
        for <linux-bluetooth@vger.kernel.org>; Sun, 04 Aug 2024 12:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=basnieuwenhuizen.nl; s=google; t=1722801202; x=1723406002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YS70lPTajddF9LhXq2dYWaaUma7n+2oIYPIMWckw0L4=;
        b=Ky90/iMpCzqtdU4jW10pNIW7oOZsiICAplaExFUgjEabJdj7GOoF1XgU1qisponMBd
         XrKWKyIyf5541QyTUM6SoCoMIIiaPPVwpzE6WniILWwmmbf2L7Sua/WRK2taJRCsQ6UZ
         PluOjCT+fz6SS0yOt3x6fmVAuCdeRMCw02H0ug5UU+edSfMffuYABJi0c2jhlvUrPqSd
         OdjI6MQMlL5NBrzv2bX1ddcCJZDa/RKJxkg/2GZmxuWI52rUgvAuXxNNjGriRk1140aO
         YQl6MzrWLkQGsCy6Ec34BnJLB7eN94d+O8IIOIU5RuFapWRblE9mKKI5fm2YfPhTSiIP
         oZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722801202; x=1723406002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YS70lPTajddF9LhXq2dYWaaUma7n+2oIYPIMWckw0L4=;
        b=Iu3xG4uXgY47PUqOTM9xIIwVvtI236eS+YZNOs8tWUhzYclTV+E2LsOHZCJc/NpqJZ
         TQCixwKady1AnL+9wpKjcP5BzGPgPCpwqwPUxaG+32PMhqjulOqOz96gdXs7q0OkcE4i
         cDRb22Qt/3IylaqijR4+bcnjsxEW8V+WjdJ8IQXxz66AnIv00IdeglxHJlHILDeVE0ZC
         lO5LYvfbZAEoDhT8o9fXmn8zYtC6t2zgjysarIoWws1ctubGsYzesDX0kOsR7bi8HkBz
         KbpKIzJpur8SIMNpDM64SlOKwgAteVFhduxJmKfpHGMiQMTDkUVM9DM24uF5wHrgTtVd
         Pvgw==
X-Gm-Message-State: AOJu0Yx9VKejtfoCqXCVQsUbMou1lpm20mQsyqdK2UfmKPiHfc7/abrk
	5Cp1igAHhxiKyAw2TsilXItQCTuoVFL1zSxCtquTvbOG4SsPyh5mvLVG8kpHmllWm2FMmTLAHmg
	H
X-Google-Smtp-Source: AGHT+IFLkBRIikkQ+4BXEp1PI+G5xsWHUMgGw035mXi0Y7Pw68S15ov75/ci6566mjpQP+G0xPh7ZA==
X-Received: by 2002:a17:906:7950:b0:a7a:9d1e:3b28 with SMTP id a640c23a62f3a-a7dc508df98mr494003266b.5.1722801201290;
        Sun, 04 Aug 2024 12:53:21 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a781:a500:aaa1:59ff:feea:fd4f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d433e8sm361999566b.135.2024.08.04.12.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 12:53:20 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com,
	marcel@holtmann.org,
	Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: [PATCH] Bluetooth: btusb: Add USB HW ID for ASUS Zenbook S 16.
Date: Sun,  4 Aug 2024 21:53:19 +0200
Message-ID: <20240804195319.3499920-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variant UM5605WA,  which uses MT7925 with this device. With
this patch I was able to pair my earbuds. I don't know what
other testing is needed here.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/bluetooth/btusb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 789c492df6fa..b5fdc0f3c341 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -695,6 +695,10 @@ static const struct usb_device_id quirks_table[] = {
 	{ USB_DEVICE(0x13d3, 0x3603), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH |
 						     BTUSB_VALID_LE_STATES },
+	{ USB_DEVICE(0x13d3, 0x3608), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH |
+						     BTUSB_VALID_LE_STATES },
+
 
 	/* Additional Realtek 8723AE Bluetooth devices */
 	{ USB_DEVICE(0x0930, 0x021d), .driver_info = BTUSB_REALTEK },
-- 
2.45.2


