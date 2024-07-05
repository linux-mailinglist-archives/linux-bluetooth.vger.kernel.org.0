Return-Path: <linux-bluetooth+bounces-5959-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32152928E2F
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jul 2024 22:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B28261F2398F
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jul 2024 20:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0813617995A;
	Fri,  5 Jul 2024 20:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jyBAdPJ8"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F66176AD0
	for <linux-bluetooth@vger.kernel.org>; Fri,  5 Jul 2024 20:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720211234; cv=none; b=kpH5Dytn7Dtw0jadmekmDkJ8t0ydG02ExrgcvnLuAoals5dGRFz8kOVbv7fIaDM3feZEboB4UEBPm7OG80foMnXIpYbed5gisvEA6ZsRYvsoTs4RXNEyOrxgsrd4alcB3TZIxd8SNDTki0bw7cybwPv74CzASg2SPRmll8sDZsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720211234; c=relaxed/simple;
	bh=3JJpQ+oo3xGyTKVTn2HDGtuueCXPZ8B1Bep/el2fYlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8NEKmrYauvWJV/fe9sGkyxBm1ujzD5hlrHG1VixhJkd5AMactDSP3D1DFRGyF6H6vR7bXY6yGB/q6AyC/O43D/tyRnILzlX9BYTSE/GEOVR8wdKJIVvW6Ap+iit1LxI5Qu1HvnUYXNbFZzYhu37yT3lseXkKIoQltS9C5Onu5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jyBAdPJ8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42648961d7aso13807395e9.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 05 Jul 2024 13:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720211231; x=1720816031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ek4Qbx2Gvl17zeQGl5E0Vo1b4PWxuZXdNVZczTqRXn4=;
        b=jyBAdPJ8emeD3SMosM+kmFgRdBvnPO/Mmu5Y/9HZ4vVFwCn/paTULOJDt1Eg6Im+J5
         Xcn27poi/Xj4rcv6YPT19mPUxFsChDY52VydsfIv4povwyCdcPh48zQ5cYgIcday827O
         whiIZLKKYsRJSO73nJgzRQuNZqMvLT07th5YSgtvHB/vTLjSUnnOeftA/YrhwTLwi7Cw
         IBkl32h5DSVXXRyxm1gyuMsjb0+2kxS9XsuTlA+j443sXb8j6yTen++i4SHRJhXmNXUI
         peEV79O2T8qId0BEag/p+kDO0mtWJbR3yZ9eDhYyANNG8XR6mExulElXxaWaqtBQEOy7
         Jk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720211231; x=1720816031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ek4Qbx2Gvl17zeQGl5E0Vo1b4PWxuZXdNVZczTqRXn4=;
        b=D6iMWy/iDrWnyfW+vbEYKAsIW3MuyEbOY6+TY76yHjknHSRfnp6gZAT+qM64osdVCN
         t3PlmUWJtCqFU/dLHTRGX4N/eLeeUXZHiHPnkwm33mNqrPKtiCCRdWr4cyAEfVwSxQLG
         yPg7GF5pz17BJIGVgoKGCe9rHj6uCK3Jo4F3HEVVw6SpdjViEFg8LizjMAlmSTwRHXc8
         uggTi0r4jx5woi/PprwBoujimeXBjL4v9OorgqYTfkx7cMu33Mo+hWIAN208+jtL7GLP
         uMuKfr33I6btfbgdzGU9R9wvJh06VfxX5v1i8sij0EVLt6KTnQPUcttrjrjRHVlS/O8g
         etfA==
X-Gm-Message-State: AOJu0YznWPYswkzZs3Mz1KAaB84flbUHmJxtRNpWdPt5BWBmi6d2D75I
	PTXuSliR8KkyeyyNBnyRs15sGk/u7YpeV+fakN3hpaeTrdppTsf4W8IbiWkqQ9E=
X-Google-Smtp-Source: AGHT+IFrg9DRIHULVIyH1hCiF8TSXKC2iWRZWcbSi5KPaPVXlXlOFP2zwMp64pZpDq9d2F7Ank8eyA==
X-Received: by 2002:a05:600c:54e6:b0:426:5cdf:266c with SMTP id 5b1f17b1804b1-4265cdf28d7mr7174305e9.7.1720211231157;
        Fri, 05 Jul 2024 13:27:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c688:2842:8675:211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d5116sm74397625e9.10.2024.07.05.13.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 13:27:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 05 Jul 2024 22:26:37 +0200
Subject: [PATCH 3/6] Bluetooth: hci_qca: unduplicate calls to
 hci_uart_register_device()
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-hci_qca_refactor-v1-3-e2442121c13e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SiXd2qnQF7139UYHDKSEmoyHNzAxnCurvumJqhFNm/g=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmiFcZM99X+s1yRAHziWgjQ+T9Z7+lxTuiH8TFI
 Y9DUUb3PoeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZohXGQAKCRARpy6gFHHX
 cpZOEACjEByW+4Ok5NsnJdvArQDiDIsxDAQ0+VtTkRxFb9wk0QrNkjpf01aFZBGeZbIAWQ5EB3I
 l+Z3roz4oHtWiolhFEvpYiNJKkuqzJhTM3lm47sUXJmu/7POleEewFpM7/Rm7oskz682tJdYIBK
 sgMzq3Rj6WRFlx4I2FQUNn/eQwHT+0mFEym0vsrZ/HSMteOrZdokU9O7a39gLmhTHjvMFHXFY/s
 HLHnVLlG8krBU2jfLTHb3auKwFIYRn2wwwP8QlRjEa2R8wE9C1Bg/Gv85WG3C2SNv6qn8j/3Df4
 zqiuTc/J4ZfU9kMXq7AfJpuHv6K4ZZH8T2cIqhKGEuR9M+R8Ll0Es0XjWDa2mhuX6I9uvz+0P+f
 MAyIHJ5SutrMgrkWzNL+wfNGOciSuKHg/xiQoj6RqZxNzfhF+5ZWR/keG14QdoQlwPfQadtlR+c
 C9dF09LU5lmz8+hzDKjMOPvfKxQVQk80EhSxLe3mGk10XDK0UUJidsxbQWYxujR5JBMdXbCJA6M
 g+5na7izEDt+wg6JTGlZx4EXBnwQemzXvOq8ryvp5Aq3qQXV4HR9TZ4aZfgf0Ak/o6P8c2TUAMr
 ooccqP48SzYBUTapimUfG/FqpmqzMgoYKNK83Jzp/lKh/4cgxczgZbrnF9omxn4PT/5fswrDroW
 0VDrtijwsbJWGHw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that all three branches of the switch end up doing the same thing,
we can move the call to hci_uart_register_device() past it and unify the
error message.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 895ce8e11da8..c4546f6b6a19 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2396,12 +2396,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			dev_err(&serdev->dev, "failed to acquire clk\n");
 			return PTR_ERR(qcadev->susclk);
 		}
-
-		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
-		if (err) {
-			BT_ERR("wcn3990 serdev registration failed");
-			return err;
-		}
 		break;
 
 	case QCA_QCA6390:
@@ -2409,12 +2403,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 							   "bluetooth");
 		if (IS_ERR(qcadev->bt_power->pwrseq))
 			return PTR_ERR(qcadev->bt_power->pwrseq);
-
-		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
-		if (err) {
-			BT_ERR("qca6390 serdev registration failed");
-			return err;
-		}
 		break;
 
 	default:
@@ -2447,11 +2435,12 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		if (err)
 			return err;
 
-		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
-		if (err) {
-			BT_ERR("Rome serdev registration failed");
-			return err;
-		}
+	}
+	
+	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
+	if (err) {
+		BT_ERR("serdev registration failed");
+		return err;
 	}
 
 	hdev = qcadev->serdev_hu.hdev;

-- 
2.43.0


