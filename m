Return-Path: <linux-bluetooth+bounces-429-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2891F808401
	for <lists+linux-bluetooth@lfdr.de>; Thu,  7 Dec 2023 10:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C83181F227AC
	for <lists+linux-bluetooth@lfdr.de>; Thu,  7 Dec 2023 09:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA3633CFB;
	Thu,  7 Dec 2023 09:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NUWxowhs"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2563610EC
	for <linux-bluetooth@vger.kernel.org>; Thu,  7 Dec 2023 01:12:15 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b397793aaso3875995e9.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 07 Dec 2023 01:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701940333; x=1702545133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abIGam56kSZ3DhSDuEO3BjQb5HXWW5MMfEQ3kw2b1bA=;
        b=NUWxowhsMgLiuMreM/JfPoF26hF9hNWz1eKHez7UJrpbNzRFYPqmxs9o8vI9dOaO/7
         lU7aSIjQH8z5bUabkqqE6rHOYOouLQiRtdFjEKgknz9Nef+2RimeEwBKf6nSyT6bbRPa
         66gKuDlvx/ozQncRf1OFY8NmHY3cINfSv8C/LqClbTc2c5NGsk2nuLrQKSMnkvWSSmcK
         PRaw1ufVLFi+qhoJQwRpmAz/4Tc0G1oQJV7fdwGitT9fm7XMqJczogIrdEXZArWPnWNR
         nvGZCex9xmgU66Oxnu52SbB60nlC9FfRoRWRDousEuYcC0QL309Icmj8/iIOvL0uS4IA
         LZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940333; x=1702545133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abIGam56kSZ3DhSDuEO3BjQb5HXWW5MMfEQ3kw2b1bA=;
        b=HJjPOeWsvREZ2uFZ20OoNWVbU0KF2E9WqXIRQF2paizEdFC06r6RNoaCFTfFfwau1M
         SmSJdH9IIVB4rgJszQwKi2M3wnYafuzepikD1SREzxgi27rqQrRD3tGS3ED1d2ccRpdl
         gMdPGXPCHQA0KR+hElUt7jaD30ZyvJz8E3CRw1VqOGjHYqK4gTwwzIUJYzPVc7Zo94HZ
         dxrkvKslqMpBSYREAegEP/xMvD2OWNqAb5OAPSEuWALjxxEyE17JOKVlTqCxgCzp90GF
         qk0YHgJ7EX1AWShtVGkjzyJpTMWWwhDfYtFerBlP5g8JwHS6zNSvPBl9dBtgZycpl+3F
         uwbw==
X-Gm-Message-State: AOJu0YzYROEwxONd0sqJoi5Br2TmHFJ65aiULRCQzi6lCcICf8+uPaA3
	MuYlTfp/8obBK/Swh9CnfZ3S4w==
X-Google-Smtp-Source: AGHT+IFPy6rDPC84jLuaSGV9bgwyFSV/vFR4KlGp8lebRYr+5pOBmJ32Bs+S3ip1jKFNvcx/lCuWyQ==
X-Received: by 2002:a7b:ca4c:0:b0:40c:2c2d:78da with SMTP id m12-20020a7bca4c000000b0040c2c2d78damr154975wml.170.1701940333379;
        Thu, 07 Dec 2023 01:12:13 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:de32:8b0f:dc9a:4dce])
        by smtp.gmail.com with ESMTPSA id y3-20020adff6c3000000b0033334c3acb6sm896009wrp.98.2023.12.07.01.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 01:12:12 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 3/3] Bluetooth: qca: run the power-on/off sequence for QCA6390 too
Date: Thu,  7 Dec 2023 10:12:02 +0100
Message-Id: <20231207091202.19231-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231207091202.19231-1-brgl@bgdev.pl>
References: <20231207091202.19231-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The Bluetooth module on QCA6390 needs to be powered-on by enabling the
relevant regulators and driving the enable GPIO high. We can reuse the
power sequence for the WNC models if we add the list of required
regulators to the OF match data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 35f74f209d1f..b27be08a1f6f 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1788,6 +1788,7 @@ static int qca_power_on(struct hci_dev *hdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6390:
 		ret = qca_regulator_init(hu);
 		break;
 
@@ -2044,7 +2045,15 @@ static const struct qca_device_data qca_soc_data_qca2066 __maybe_unused = {
 
 static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
 	.soc_type = QCA_QCA6390,
-	.num_vregs = 0,
+	.vregs = (struct qca_vreg []) {
+		{ "vddio", 20000 },
+		{ "vddaon", 100000 },
+		{ "vddpmu", 1250000 },
+		{ "vddrfa0p9", 200000 },
+		{ "vddrfa1p3", 400000 },
+		{ "vddrfa1p9", 400000 },
+	},
+	.num_vregs = 6,
 };
 
 static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
@@ -2129,6 +2138,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
 
 	case QCA_WCN6750:
 	case QCA_WCN6855:
+	case QCA_QCA6390:
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 		msleep(100);
 		qca_regulator_disable(qcadev);
@@ -2276,6 +2286,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6390:
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
 						sizeof(struct qca_power),
 						GFP_KERNEL);
@@ -2386,6 +2397,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6390:
 		if (power->vregs_on) {
 			qca_power_shutdown(&qcadev->serdev_hu);
 			break;
-- 
2.40.1


