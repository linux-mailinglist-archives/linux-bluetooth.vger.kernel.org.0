Return-Path: <linux-bluetooth+bounces-10101-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0579AA24B0F
	for <lists+linux-bluetooth@lfdr.de>; Sat,  1 Feb 2025 18:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DE727A31F8
	for <lists+linux-bluetooth@lfdr.de>; Sat,  1 Feb 2025 17:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184501CAA7F;
	Sat,  1 Feb 2025 17:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LFVRABjJ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C811C9B97
	for <linux-bluetooth@vger.kernel.org>; Sat,  1 Feb 2025 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738430955; cv=none; b=aojXXzaQvhWa7V7L6DkZAKY45jyUJwJo24jTisSbfb2MkB8JGoPUP2wYPzRbPAT+F9H4X6zMhgjUKdRxuF6B700uYKDA6fwxAO4GAj/MC870fTnTgMfouKcw2dpWB0okzyyEbjiauoleI30VXxrSPy37tybW9y+ojQkh4MoMhIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738430955; c=relaxed/simple;
	bh=bZIfvsXbEXYqzmKSTUZGNOhLXdwKlob2BoVHyug/+5E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NlnIJH8gwIkwcOueSvOPLN4qNv8C6Do51GrAyK23MkYBuGDCVriLN0kfuyw51saZyOixlRrsNHwcUkxeyGHSQuO6pgMbbm7cVNGliZF61BJElEs/B5c1qLOWLY7DpKL3jO3cxB4SH8g5ea1h5K4QuraiEk3WmKl0QxDfDCh1SWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LFVRABjJ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30227c56b11so31559361fa.3
        for <linux-bluetooth@vger.kernel.org>; Sat, 01 Feb 2025 09:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738430952; x=1739035752; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yiAMibmCHf3AP+cOZ4VRKVm1kSHRKQ96VjG5gP5/ww0=;
        b=LFVRABjJj9Hz+dCeedJWuS88IV8WXa7fiz7zqzxRik0JItEehQajg0FcxvkJIwMW4v
         1QCXOxa0Ctaec+T65RVJjcaBmtbmbnXy620v6o1FWbvfr6PNHmgTkltnQ4gttWwUI9Zb
         5a6RFrpo0O8U6VDVQihIB2ryZn2W7TkwcfrZA17NwbxOW2dqsNFya3IxLlquKVdy4n23
         ZaZS82z+15vq0fb3FZkqBfajyYHZTTqhE/+UHnQvZKKLGl9OF1ig4WriEu1bP4Cgwbqn
         tTwIBeGSOmAkoWkdUgOB3JTmuak6I+h4eDDY6blnHTqfjkluIV9OazaMs7Uf3dzWMtI+
         6m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738430952; x=1739035752;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiAMibmCHf3AP+cOZ4VRKVm1kSHRKQ96VjG5gP5/ww0=;
        b=UhJBCKq6vDMoqR4Jy0CcpT7DzIblvfE6oJWVR9o9RhvOn7MZeJlBWc/HF74MjsHVh0
         dtS4N9VVTvX6jQzLyUGcko5/ZKzlz+3x/v2U+3zd2/SA3Hq+TO9ohb8BEGI8Nx0bxjbT
         Ph1VdEKYqBaXYbRd3aqXhh24LActbWcCdjI2dFIs4UmW74ZznGcSufutii/SEbKbr3p+
         zGnrzgugWfWqrOTsrXYbRLGRF55SC7uuKey+9GBgZpAAd+dRhE1lLQ9pUtklSVef6EBs
         aiwb1Wb4FdqPS7N5XJFYJsOBllLx+S8kPy0P4ZNs5AudEqfqk9Q+h6rmwbjnsoW0fvD9
         YOKQ==
X-Gm-Message-State: AOJu0YyU5cOq46+/HZyYFzHcG/BncBcrLWzPxwNK3SmVDEuM7BX0NL4R
	W9eg+8tcqr2WUFkf/DNopzc30w6zNo3gO40xtSn3woH0hfGM+bRmbdIJQ2KMXOQ=
X-Gm-Gg: ASbGncsk9hwh+ww72WMKC0dfwOzqfnibJEs4c/7LQgUclfzL9yLmwSTH3MBB6tY2u2L
	6tWjDsAgej9C4DkB71BTMXvbcAdI53AuIYKifsnoM5fjMdAz0zhNHp43eWvAXvN9ucEltEOV/vQ
	+XohxAqCc75NBgpFun52DF5Lr/KuAXiKAXnoDACAJYfgZcAF60Fc8CVqWD1NWpvOcZ6k6tVgzXi
	Gx9PS5GM7JVBskOPnl0/sbmcizGJt6LJtBhp45g0qFDj+lAJtTP/QjACE2/2SiUWLrJI9BwVyGF
	AXce8kkfH4PRuKc5AhPd7RY=
X-Google-Smtp-Source: AGHT+IHRHYSwVZnX9QQjEgdiq1EsFJNiZyKN0lsG/LCyM7xf+RanpO6j8YDb7KQGBcnEcXBWmWC0MA==
X-Received: by 2002:a2e:a54a:0:b0:302:3c78:4e17 with SMTP id 38308e7fff4ca-3079694b76bmr44979531fa.29.1738430951586;
        Sat, 01 Feb 2025 09:29:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3099ec4sm8852161fa.48.2025.02.01.09.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:29:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/6] Bluetooth: qca: add Qualcomm WCN3950 BT/WiFi chip
 support
Date: Sat, 01 Feb 2025 19:29:06 +0200
Message-Id: <20250201-rb1-bt-v2-0-fd44011749bb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAONZnmcC/2XMQQrCMBCF4auUWTuSpFUbV95DukiTsR2QRiYlK
 CV3N3br8n88vg0SCVOCa7OBUObEcalhDg342S0TIYfaYJQ5KaM0yqhxXNGTv7hWd9bqAPX8Enr
 we4fuQ+2Z0xrls7tZ/9Y/ImtU6Ki3Z99Z04b+9uTFSTxGmWAopXwBZSXt5p0AAAA=
X-Change-ID: 20250201-rb1-bt-cec7a314991d
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1539;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bZIfvsXbEXYqzmKSTUZGNOhLXdwKlob2BoVHyug/+5E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnlnkrtNc3K2dMel8dFcEtGQARsWe03fuuJFDI
 LZO0JMC2kyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ55Z5AAKCRCLPIo+Aiko
 1bF5CACtNlWRDxOavbwPfvhT5xdLXGi0R1bx6mJShDUAIa+47UlS9kUdRSrkO+7KTG1lbj3jnbc
 ztizE9tzen0br4qzGorx1b2mZPH2wJpqyxI4VV/1Vj+McT7kX1kMBnh3TCqZoJMEiY9qe9iLCfX
 VadINvjcXk53cI1W4WNVRozzt72N1SLyvg3ZqGh4MGG1qdLPrXVtC+f3mrdFwWYZEZTH86mY4pS
 /8800AyStr+se9HA9pAwO77RKrTWx2rHYo07NbQqb+WvZ0hOVCAcXcT0eg5BDuZO9/T0QNV0q+W
 ZEhWL+NMIrGc5ok+a/7xdEWjLKGLdRX88JQAa5Asx+FB97P9
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Qualcomm Robotics RB1 platform uses a new member of the WCN39xx family
of BT/WiFi chips. Add support for this member of the family and enable
it to be used on the RB1 board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Corrected QUP interconnects (Konrad)
- Added /delete-property/ interrupts and an empty line before status
  (Konrad)
- Enabled downloading of different NVMs as required for v1.3 of the chip.
- Link to v1: https://lore.kernel.org/r/20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org

---
Dmitry Baryshkov (6):
      dt-bindings: net: bluetooth: qualcomm: document WCN3950
      Bluetooth: qca: simplify WCN399x NVM loading
      Bluetooth: qca: add WCN3950 support
      arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
      arm64: dts: qcom: qcm2290: add UART3 device
      arm64: dts: qcom: qrb2210-rb1: add Bluetooth support

 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  2 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 31 +++++---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 82 ++++++++++++++++++++++
 drivers/bluetooth/btqca.c                          | 27 +++++--
 drivers/bluetooth/btqca.h                          |  4 ++
 drivers/bluetooth/hci_qca.c                        | 25 +++++++
 6 files changed, 156 insertions(+), 15 deletions(-)
---
base-commit: a1d1e1f2fae5fcb5f2e43b81afa9596c606e683d
change-id: 20250201-rb1-bt-cec7a314991d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


