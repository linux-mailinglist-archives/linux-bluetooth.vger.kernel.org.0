Return-Path: <linux-bluetooth+bounces-5960-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08882928E34
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jul 2024 22:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B46072861C1
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jul 2024 20:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5D117B4F0;
	Fri,  5 Jul 2024 20:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V8oiVvwV"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACE6177998
	for <linux-bluetooth@vger.kernel.org>; Fri,  5 Jul 2024 20:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720211235; cv=none; b=nBWPonSoELF+WACrJ1kuSbkgaH5qEz7QkH+SCc49izEYUY7vJUiRrXtkJgvDsFX9xFzS1bBceFFf4lqwnj0eBwIDPkHWdkiTMrd7H6jOV3bJDt5d/H855Z3TJLjXsCCtkXXogDYTiyzlqiPH/qWEh0WuqnKt85TUzpvQC0ANSsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720211235; c=relaxed/simple;
	bh=vZbYLkT7sc39H69a0omh1DqJUGzm0SozpFlhFopuBE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cq52gpgQl/Y8TN1V8omVh9oMIx+WnTCH1Wm/0pnJ97E7XWJkkbDa/cJanLHTNVtA99yClFfQOA2MGAw1B8Nj7/yvtITecqYx+vk/CUvNdMog+x3WEZgQSLdCT85T24eYkuJ8DTH1gxzXmU8GLIh2IaL7iR7Sk0V5xCLdjS/k/iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V8oiVvwV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-426526d3051so7914295e9.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 05 Jul 2024 13:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720211232; x=1720816032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6poXA8vtF9YhtBJpFyw5H5N1WqhPbFnwYiqesDZxMKA=;
        b=V8oiVvwV30/t7CWztGUBRFu73dfpH86oVEdYC67REBs0dauMW7B+Pz9TRjzKENTaqM
         kapAAx3gKkBgmbuQmnr3n68QqUQsJd791yOFpgusVTs1Jcf7DyZFSJ/obSCsfXxsYaFI
         01cBXKK3paRTNb68IGFz6BvA6J3ftvDt/Bzb6NMV7J8VK7rz2sco+rdvZFKVOoYSaxKZ
         Ddy3DF90g9gp4jMXkB6WninXL9Iu+W8nkCra06vXBXePrSE0nCSTfpMcoahTsl4h+ODB
         /5oFeELBfXpXcWBM7+AoqUWYAHiR/qVKVKtZ1hGQ4J/CHOl0b3ePQ51wjODQ28Uy0Q1m
         mecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720211232; x=1720816032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6poXA8vtF9YhtBJpFyw5H5N1WqhPbFnwYiqesDZxMKA=;
        b=q0dSIL0djWVxZCcXAnFVQ1hFf0B42R4BcDzfSYFs+lAVEWcjVwSWrRV+ig2k3brPPe
         woo3NWYlhvb5lAEUmnxDwQRa3luAkIq6dY1kikahOuRtxF74HEB5XhpLnKqg+KE/ulYt
         HjrRnWg04cDFDFqCd9PQDOpZE9qyyrRhWNqqelPlkZ8TQUArFkdJb6bROBH+Eu2ksdjL
         JpN+JGlUoUDI0bt4oG6fP4VRxFkFH//k2ozCTRBLGWqmWyrUQ110m1PX314kZMmIKiE2
         OYc9C5TPWGM/CZ9lZJtlix0SgW3eGHrWiqizjGmq/5qZq6pRJtGAN4KvRAJtwKFKh87c
         X5fA==
X-Gm-Message-State: AOJu0YwJUl/RuIw/GRZoZAqmPczzHp5hExx0F96QCLe1c14qRQxk/wVh
	TurU4VSzBx/kqW+ddS7e0Q4vl1LG9a/F1eHXnD6hGCSir9h2qqqJEyQquqAuAec=
X-Google-Smtp-Source: AGHT+IEsJGhws+ipXp+0gVAmOwuUyWO7G5ZOakq+4XRgX1PO5fvzeU35nkYtV2nT+c7CWK7eTKK0pQ==
X-Received: by 2002:a05:600c:1790:b0:424:784c:b134 with SMTP id 5b1f17b1804b1-4264a3bc345mr49401935e9.6.1720211232143;
        Fri, 05 Jul 2024 13:27:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c688:2842:8675:211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d5116sm74397625e9.10.2024.07.05.13.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 13:27:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 05 Jul 2024 22:26:38 +0200
Subject: [PATCH 4/6] Bluetooth: hci_qca: make pwrseq calls the default if
 available
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-hci_qca_refactor-v1-4-e2442121c13e@linaro.org>
References: <20240705-hci_qca_refactor-v1-0-e2442121c13e@linaro.org>
In-Reply-To: <20240705-hci_qca_refactor-v1-0-e2442121c13e@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2211;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZpmEwvey3NWw9NR2sGz0nekucDSBfXs9XCKX9XuYIUw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmiFcZuYqZq1MSlsn+OQ/IpMG7OxTxDwudgIdL5
 sNr/Qr50K2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZohXGQAKCRARpy6gFHHX
 cu9cD/0c1tzgFobG3RdRL0G+fTJSG222aEjj11NL97yelwleF2EU+h5oDzZZWeU9wzEef/+BLwN
 6pi2ix/fGuvfkfilTAXIXcskJ/OvMmfHPSxP/8C9PzHb6bvC7Axv3TSSMOWwvO0AVYmD6ebK7KI
 Gk9FPWnXh7bzpUShQMwqSj8V0FGSZ9TRAsoqcUOHcm2VZqgwPT2oFiMg5qSsi63GhdxHw7YjhGw
 dpy96QnxtHkktk7KXXmaT8u8GTF1pkXRhvaE2P0w1j3I8NwFkSfK9Daog4NDLenRmZwW5DfbW1e
 QKqxoRQv20ojGLdeFiAOjUKeg0LwF5ag8GoUQZor6IrPm5Jx/twF3F5wdZMJGxFYG+UPLBvBwxK
 UPFqRHJWRf9DpKMVUz4+rdoM2Wgbf+O3JydGrMsY1+kv5e6rExHXZ2WyV6/lKwVGlKwX9L/w9Xh
 acP8mZ6ArgCgSPW/NTQ34eRk6GDcQ5Edr/cA7gsgGaTIC/tdRtXgFqdOKOf+XFgmjaBHh3sXm5L
 4w5dWEtbz0HUu5UaRRdoLTmPNGybKd/83ZrD81YcllG7HmwSEuxoKQSfhmaMUDhhpr+UTJCIuiB
 nJjWhr7TbITnO4gO+UaQyWrtW9la0imSC7xMvLQ5zO1Az7KVgwjRloYFyFCWKCQUFCbUD10mxh6
 Ffy/+Z2sUsuqVSw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If the device has a power sequencing handle, use it first. Otherwise
fall back to whatever code already exists.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index c4546f6b6a19..f2dd37d01189 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1718,6 +1718,7 @@ static int qca_regulator_init(struct hci_uart *hu)
 	 * off the voltage regulator.
 	 */
 	qcadev = serdev_device_get_drvdata(hu->serdev);
+
 	if (!qcadev->bt_power->vregs_on) {
 		serdev_device_close(hu->serdev);
 		ret = qca_regulator_enable(qcadev);
@@ -1800,18 +1801,8 @@ static int qca_power_on(struct hci_dev *hdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		ret = qca_regulator_init(hu);
-		break;
-
 	case QCA_QCA6390:
-		qcadev = serdev_device_get_drvdata(hu->serdev);
-		ret = pwrseq_power_on(qcadev->bt_power->pwrseq);
-		if (ret)
-			return ret;
-
-		ret = qca_port_reopen(hu);
-		if (ret)
-			return ret;
+		ret = qca_regulator_init(hu);
 		break;
 
 	default:
@@ -2149,6 +2140,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
 	unsigned long flags;
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 	bool sw_ctrl_state;
+	struct qca_power *power;
 
 	/* From this point we go into power off state. But serial port is
 	 * still open, stop queueing the IBS data and flush all the buffered
@@ -2166,6 +2158,13 @@ static void qca_power_shutdown(struct hci_uart *hu)
 		return;
 
 	qcadev = serdev_device_get_drvdata(hu->serdev);
+	power = qcadev->bt_power;
+
+	if (power->pwrseq) {
+		pwrseq_power_off(power->pwrseq);
+		set_bit(QCA_BT_OFF, &qca->flags);
+		return;
+        }
 
 	switch (soc_type) {
 	case QCA_WCN3988:
@@ -2227,6 +2226,9 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
 	struct qca_power *power = qcadev->bt_power;
 	int ret;
 
+	if (power->pwrseq)
+		return pwrseq_power_on(power->pwrseq);
+
 	/* Already enabled */
 	if (power->vregs_on)
 		return 0;

-- 
2.43.0


