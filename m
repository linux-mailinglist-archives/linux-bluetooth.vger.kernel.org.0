Return-Path: <linux-bluetooth+bounces-397-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C411D805199
	for <lists+linux-bluetooth@lfdr.de>; Tue,  5 Dec 2023 12:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00C6E1C20E8D
	for <lists+linux-bluetooth@lfdr.de>; Tue,  5 Dec 2023 11:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BA255C23;
	Tue,  5 Dec 2023 11:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AriwKoZq"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED41A124
	for <linux-bluetooth@vger.kernel.org>; Tue,  5 Dec 2023 03:09:14 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40b538d5c4eso50984915e9.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 05 Dec 2023 03:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701774553; x=1702379353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYTGnhkqGwWYczwtIdABCmZR2C7e/8FCJmHj5tNfaFU=;
        b=AriwKoZqI3g2eUZ7tfm3UnQesl5Af+lwFZ6KCntpq7857sQoOFEc4F1UzlGt2i0R44
         EWW+Uu3JGELbY9dLnpe/ebQ2FlmWVZhfXp3YXv/vL3rZJnvEVJUeAjgcoX4daDeUgBCp
         Bzcl2MMkgbLGlZOXG49vMR2geRlwsomPptj66AuTOlMWDvMMeaRV6JIGW4N5njCezdw4
         RYBVjexYeumMlApt3UnNSKkbAIxSVG3cUA0AGVmSg/kiX12ooKvG9jVMYdTINhHsHWXB
         T1Es8vluHM6+Y/xtN/x+ggq9rLAKz5fDW+zNQyYuQur7RN7NCeEy2awvJNy+F1SkNGu0
         ibgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701774553; x=1702379353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYTGnhkqGwWYczwtIdABCmZR2C7e/8FCJmHj5tNfaFU=;
        b=g7PIehK1vPntH2QfOpZFFVWlvpUMbDipojMlc9nfO9Jgo+yXVj/5dLMkp9wJLAVUXK
         UzdaB4/2Fi2Y07DMUxA0wEWCmo1yYNAIMVIbjW2K7i1O9/sBHSo0yeq9dp/vjDU6Mh3U
         lCuDXCdyYhAzms12vyd5MK8z7fee5bwiPrUJkiLDOenhoProG8rV+XAfC/YooLfkVwF9
         MMNNLkEl0mTxkI32QGT1HFcBwYqFt86VyY1q5eIHUTEjRHdZJZa/IOj/hEIKLf/n6AUN
         eYekrMuX1iKLglUmGzIhK7nCfWeFasDPyNUm4lqLiavT2IOWNZNDM6VgpYnIViEd4X42
         VJRA==
X-Gm-Message-State: AOJu0Yy4jS87VSgiRlbFcQcAv6OMH2r53/mViTpicQ43z9VO8m0U7HoF
	Fbik4tUDhHS5O8DGhQsXyOeTEA==
X-Google-Smtp-Source: AGHT+IFuuXyyJdBBfJwb4MoIOZkXw4s5AF/QSxcpiM9U0ZGQathPtLg2/v3mEvMGLTwB2kEKnfcAxQ==
X-Received: by 2002:a05:600c:3ba3:b0:40b:5e21:cc23 with SMTP id n35-20020a05600c3ba300b0040b5e21cc23mr347905wms.78.1701774553286;
        Tue, 05 Dec 2023 03:09:13 -0800 (PST)
Received: from brgl-build.home ([2a01:cb1d:334:ac00:2efb:ffdf:fa22:d5ee])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c4fd200b0040b45282f88sm21798166wmq.36.2023.12.05.03.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 03:09:12 -0800 (PST)
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
Subject: [PATCH 2/2] Bluetooth: qca: run the power-on/off sequence for QCA6390 too
Date: Tue,  5 Dec 2023 12:09:03 +0100
Message-Id: <20231205110903.68898-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231205110903.68898-1-brgl@bgdev.pl>
References: <20231205110903.68898-1-brgl@bgdev.pl>
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
power sequence for the WNC models.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7f25931a946e..351ba904c8c2 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1788,6 +1788,7 @@ static int qca_power_on(struct hci_dev *hdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6390:
 		ret = qca_regulator_init(hu);
 		break;
 
@@ -2137,6 +2138,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
 
 	case QCA_WCN6750:
 	case QCA_WCN6855:
+	case QCA_QCA6390:
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 		msleep(100);
 		qca_regulator_disable(qcadev);
@@ -2284,6 +2286,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6390:
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
 						sizeof(struct qca_power),
 						GFP_KERNEL);
@@ -2394,6 +2397,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6390:
 		if (power->vregs_on) {
 			qca_power_shutdown(&qcadev->serdev_hu);
 			break;
-- 
2.40.1


