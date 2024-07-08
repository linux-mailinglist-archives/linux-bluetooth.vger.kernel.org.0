Return-Path: <linux-bluetooth+bounces-5985-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF67929F5B
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Jul 2024 11:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C095B26DFB
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Jul 2024 09:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CD47E772;
	Mon,  8 Jul 2024 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SErDOH9d"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A8878C75
	for <linux-bluetooth@vger.kernel.org>; Mon,  8 Jul 2024 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720431588; cv=none; b=sLcfyUzRkdvRWtWJpDruG4NiaA1NcSTTs6PAY17VojLRthvMd5gMQmyhXLvtxPZoebzZchRtJQ+uVUPHm6JcXJ05xJibsA7LeWo9Ms0HjO6IBKOxd4PDuaIIWB5MWUDlumbCh5VjU79annIjRqqNvI3sa/HnoNa+qhvCLKQ+q7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720431588; c=relaxed/simple;
	bh=6hB3boGnbTQnL6lEU/7bN5fHksatP5uYEjX7EZDxwfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvEF/TUqOa0bbEL5RBev2DX5zbnq2BEy2JXAV6qh5prSJ8hZy/v2INV0FR0ZJPqb8gqGlet56yp1Ja8uxrNSNGTz+BUPPSmAjLyQP1BIvHsT4vQG1Bg4GNEWeV9C5VP48ubWCocQAyLoJw4RI0c+P4AnpFla7xuomSHhu+H9HRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SErDOH9d; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-367a3d1a378so2382381f8f.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 08 Jul 2024 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720431585; x=1721036385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbzSJeNQsSW6BDY22LhQfP18YhdOxJT9Cx9nfUVGoF0=;
        b=SErDOH9dJVo1snJXjQ4awuMor3ZwH588foZC6wCspgnF5jNw1RkegMRF0D6kDMcUPV
         jyrAVX+Zrkd2unJ2YrytJJDqZjPag/rj244eUUOJT6DW27h3TE48PbLV+fWNuRCyiVOj
         ob2Dnphh8T+m5akCySz2I3As+Oq5IkpnSREJZosf8nADE5Nj/3pzWUk4s6Kb/X6Zk/m3
         skJQo3zZWMRQsVGWBRivPaDymZYjE+qmlJFTq/rjJgADvq/xfq8oGc+MEjvUzC7S1bAq
         WhrpbG82xVrzyc2m0J/VBbffaHcNqoO5L8Cl0PNv98MwDT4fZNjUlm0RjaQO5cY9L0Dt
         1+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720431585; x=1721036385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbzSJeNQsSW6BDY22LhQfP18YhdOxJT9Cx9nfUVGoF0=;
        b=ZqiXlXjxYCZ/9qAeXwIbSM6CDOCL4ui28B9AV+KBzCTNmlhn2LOQsJp6+j1VlNI36P
         TWacr42qqQENeRpEKKu8tgU4hbddmZcnOXdvVonatvQWwZqHQVGeLjNHNMn9vzNua0sG
         f5GRJz3MQZUavpYi+OgQOuiJyxKOdj29eoCRkUfmOCdyB1TrI1I2Uf9TN/EwhzzcrWtV
         xbTwWkb6RH41eV8E5wO+zVGnYy5zRnubWz6FixfPOKSFR5e2AbLPCN5oktP/dZldOzNw
         v232QQkxXKVea1yeZ7/ZzlAaH3zXYj9cyXlvsPWcvi+0k7vH6tAo+4qWFfZRccr00tPt
         JslA==
X-Gm-Message-State: AOJu0YyDwsf6/bIuOln5oicWTIHVV6uKUiqe2FzNZCquJGBlrfR0I+GA
	wOO3fx5aOFxpee1BG4Aae7oioIQ5j09Ls9hq5KoVVT8kU0LWJA3e1dVbH/my68g=
X-Google-Smtp-Source: AGHT+IEl5qRkNTOR4GKajTLHbuSJY6ozJEojGR7Z4SW7a5Wkxcjsc3iN6S+tnPTQJhl+YGt6K2OtbQ==
X-Received: by 2002:adf:f54d:0:b0:367:9d4e:8861 with SMTP id ffacd0b85a97d-3679dd71bcbmr9010272f8f.57.1720431585653;
        Mon, 08 Jul 2024 02:39:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a2a3:9ebc:2cb5:a86a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36789fd7a0esm15457779f8f.104.2024.07.08.02.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 02:39:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 08 Jul 2024 11:39:27 +0200
Subject: [PATCH v2 4/6] Bluetooth: hci_qca: make pwrseq calls the default
 if available
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240708-hci_qca_refactor-v2-4-b6e83b3d1ca5@linaro.org>
References: <20240708-hci_qca_refactor-v2-0-b6e83b3d1ca5@linaro.org>
In-Reply-To: <20240708-hci_qca_refactor-v2-0-b6e83b3d1ca5@linaro.org>
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
 bh=YUOv7wdZyiorabeRdWnlp2V5SHpY845uYUMmcejkano=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmi7PZ+RB40ZQyBS0g7HDgQEYZ0qXBtWMNjrW6/
 BwvdXImwQ2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZouz2QAKCRARpy6gFHHX
 cpQJD/9Ngt5Jfe6naIv44FYy15H41iRbjOXcidq3MvaDfyb/X0LWq95WSyWjOIdCtJwLmxfEcDz
 LiXuGwQ7SMBm+JTBH0MXVFwPeKfEHoG1EywmXIaEU54tf8A58j+jJj7s6IrBCOpmV7ewzeNzLPm
 DSAut5BbZqCKq2ptP/FdM8ANKK+ybUrpebilbEt3nfj+tBLTPMOW+4DwmdY7Tpty/2NMjr4O+9I
 oJHbPKjYWhrwpQlsNkkO0Pc3kVUI0OeIUnawbIpmcyKMBbKu3j6o/QnxjpgbV4iLPPYuoOsDppt
 u9En7oeNFDIC8tbNFMdcdxUphEyOJIno+RTzXZCdWxaq6nAqFuqHp8wLV5QBfYllE8zuriBdm7W
 3dbFaRxL6bsiO79QZ4B1PDFjM4UOwyom8dKg9fsA7Ct7PEK1+KawolMlxnSMirM+ziWoZGqsPn6
 8zTEq/r0Y60dhBFp+WepiQnvjVbH3pnY2oQ4gGhFPTpSzrcDLWA6Gpcw3/4/aK0CaseIgBh6JRy
 DgbWmRuvyzTH67hrv0OQ+ocnqqA3Iz0uk19FRnoKOBGiedOsgdM9tJueY59erz7TS8wiaxyENtD
 wq/HP2vKSkuTEyMvdmVPVOocURtsmnLEtytQIE5R4+rKEZRxT+33KxzQGjPET9ggzgPoSOU7Mbs
 qWKNEHqNLKoErtA==
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
index 48e1b67577be..9d9553552ee1 100644
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


