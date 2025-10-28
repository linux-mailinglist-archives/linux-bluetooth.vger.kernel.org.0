Return-Path: <linux-bluetooth+bounces-16122-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64795C157FF
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 Oct 2025 16:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD42246770F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 Oct 2025 15:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7307A342CA7;
	Tue, 28 Oct 2025 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Us9MkLka"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E340133F8BE
	for <linux-bluetooth@vger.kernel.org>; Tue, 28 Oct 2025 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761665538; cv=none; b=HanrOMlTz0Z+fyJy/0D76Ojn3PSUUBt78ZqbMjg3dDFGnsOfpQpHgMMu157cPBfEozqmAI5jZ9OtMtewgd12wtToeUPm2YKk3QGZUwqtRGg0QaMDFjux/c9YR4ydt7e7wZP1XAxDiisCMMQWqYy+71xH71c33u2JiiJrf0voUyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761665538; c=relaxed/simple;
	bh=sV+N0RPRiMfbWoKjuNH5pZdrjO/WsXm5bHHEdW08cRc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oAObjeM6XPAMz6DJgwWZeh4A+ODJmynJUhKdGMyo88luqmidK0bG0O7EBZgSD3WPNY1Lri7XB10xZuYRKCBmw50eSvbdLa52ukMhCo0OH6nlZZYWXVHa0bp+wLlGp8gHxycQYqhAh4A5B7x61Uerok3BeASQG89RoufUzsmpUm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Us9MkLka; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47107a9928cso3668425e9.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 28 Oct 2025 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761665534; x=1762270334; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=06pRGmRIifoDspbC/z3DknyqHPDTF0QmcFMPudut4lE=;
        b=Us9MkLkaFZ0qlKF72BQzNbW9iU9hnWSnkG0kT1AR5Jr6frUqyiGtHN0llGTy5gbos+
         KZf6zR4vwsq+pChjkkISu0EO960oEzL3bMswE8zdaE2ia6uUzalk99mWOrsuFhXzCnId
         vSeCDeFNN6souEJG2nkcvRkpsYdi9yBmg4wAkBPO6wBgYtpn5Q0eQ9lB0GF8V8z9iDCn
         uWKrNl+yMOtSF1gML95Qk4b+meokt6wfM8zAg+5+p7MlfjmkohtkJR6a6HGChQFZA6cu
         tC3VJ+6kaqn7PPL9eMte6l7kJyQyH9M/pAb9nV0xh8OSfy5YqHFT2aGv7N4d0+OKejEw
         qXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761665534; x=1762270334;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06pRGmRIifoDspbC/z3DknyqHPDTF0QmcFMPudut4lE=;
        b=rKS9EezVKibUn5FOhNyHen7wCNA0Adwei7kTFLpgg3+kHjVP1XDDSmF2jTAARt/IMz
         yBBzh+8ahWd4XCSaAHok6r72iy7YDzXerPj0S8G+LalkbYB3xItOihtQLNIi8t1SzleK
         GhjL7tRhQvR1ZzuTF1YL/NbtlA4O7OmoR1xTClG5+vH8n4UnbDOiK6VOVT9HESr3tAAd
         pLigywCmad0G8DE4jMo7wLtttCZFogy98fjhNsRxb6+rzSXMoE8j6HHCfTUDbDVHXSka
         YfYXn6W4ggYvAO+cvXpGgt2hPWlEX9kB3aDfGOUjlaQox3bWqbNGHPANPxFKEQdgAsT5
         oxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo7MamyQ4JUCLjfkkhDArVSR+WuxuNRunZ0AIGg5PbzRrdgZ00JSTBUmDHZYLNBFPp5bLsdbTSQcaBbXe9CTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxck2hpUh3CLIaMQs0li27XiV1Whc6d+ZnYxfjAXRhNj1hqHbKX
	SrBwKSou6MWpWsct35t+YBpW3Ks7UBk7MvwhdEPHWvYW8BTi+dIWdLye5GRD7Y+RPUA=
X-Gm-Gg: ASbGncv8UTvyRH5g+2mTqO6ffl1XyDN3DvOoOE+3ZOCIG4IBJSpiM5n9auPybP+EftR
	LMvUwRAesUpQX3Qhl6RMM3muAx/bBtCxQ2bDQH2OQAsefshGW2lyYV034QiA+RQw+ItEmA0jC+A
	2r3FwtlzyjLeJCQockQ9NUjdIyZoJz/FZLtpY92t2kkEiUo58DBqAzjHMIaJ4+I7thK2PSef8BK
	awQ6U+MRFw3rESyqC5xITGfQG+0TxNFPnotKytORoczZSr9ge5FvMB5sthqQRPMacX+Jjd/syJ/
	wv2iWDEjuW/xN6UNBt8zF9dkdjYLGu/QX9xeY+P9gmVaq2lNC8DnYlzM8XDTJIzKpgXnOjUZCFC
	ZsnpaOgiuzHxqPuzg+zy5+VXeVTcrpMMQd3b+YyQIk3AoKNrP8uvoznGOjUe20j2sec58JbvYmi
	NgrRVbW2Sa5QzzobyJ
X-Google-Smtp-Source: AGHT+IFC/knCrS1MSMyWjbiwnFk3ENEjAV/41GYP1gVz78YLA4iv1x/876lfCb0IFhTee24/KFvX0w==
X-Received: by 2002:a05:600c:3b8d:b0:475:dff8:9705 with SMTP id 5b1f17b1804b1-47717e41a4fmr19179015e9.3.1761665534185;
        Tue, 28 Oct 2025 08:32:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d9e80sm20844417f8f.28.2025.10.28.08.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:32:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/12] Bluetooth: dt-bindings: qualcomm: Split binding
Date: Tue, 28 Oct 2025 16:31:49 +0100
Message-Id: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOXhAGkC/x3MQQqFIBAA0KvErBtQyeh3lWhROtVAX0stgujuS
 cu3eTdECkwR2uKGQCdH9i5DlgWYZXAzIdtsUEJpKVSDNuHIzrKbI+7G/3FcD0repwV/w1RJLXR
 tpIEcbIEmvr6865/nBcvl/hVsAAAA
X-Change-ID: 20251028-dt-bindings-qcom-bluetooth-9af415056c1c
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=sV+N0RPRiMfbWoKjuNH5pZdrjO/WsXm5bHHEdW08cRc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpAOHq4q3lAqU9KtZJwk5Jfo7smW+gqK/BhAU8A
 zoNCFGaN2yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQDh6gAKCRDBN2bmhouD
 19koD/9xA7HfOvoOLauAK/avGELQ9y2oyo6M6LWrtbI7rQLGuD2S6VrUgNWO5GM5PSimEg+31hV
 Otr0oUZLGqOc+8F19m+utjoICLdfYyHilNwtVxit074y9fP2BjCvIr1im+CDLufiTi9+PaM6QlO
 ImC8+eKjTx/PJBwr8hKBf8oi9o3JW9Sm3bKafiz5VjrpVtNb/EvgHAB0PepWxW8s3snQd6uNYzW
 Z7j2F6L2AW/Idl0c/BcDhdrGDwrAkUThPE0K2V9Kg3tbKRhrOXkTuNPVlm9088SOmYRm8MV/XoT
 Th54Cq2YlT/bDo8v6izF3GulHPQyE6x7cYU78NGG5CbJ+lqS5g5SRCFYmZ4M5mI1U9i0kpDHetV
 7cxu9CrFSkQzOF6OW0m3gE6cqKgU0VtCnpfkSpxpkHxo2bIFe02RlRROPV5CZVU1WmeUcVXkK8e
 J6220tSI/8ZaN+1aysONm2AqZitJtpWVHBTkqssbQvim6tyy6loWPV7F2Hbt1815iAc4Bb7RUNm
 pDQgNeO6dw91yzWRc7mUk7v5w5oO+NiNwzu7BLtyh0/Q04lJAS2oSUqkxim5JY2IflfCIFGAVrv
 Cy5SRA4xXxYB/hG9LkZSR+Nyqeu1jBglobAVen0oFycdSPA4PTSH1iSLmDNNFXQT3GTslfUARZy
 3YI0dqQnE4HFfDQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split qcom,qca6390-bt to separate
bindings, so device schema will be easier to read/maintain and list only
relevant properties.

What's more it messes up old (pre-PMU) and new (post-PMU) description in
one place adding to the total mess.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (12):
      Bluetooth: MAINTAINERS: Orphan Qualcomm hci_qca
      dt-bindings: bluetooth: qcom,qca2066-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,qca9377-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,qca6390-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,wcn3950-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,wcn3990-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,wcn6750-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,wcn6750-bt: Deprecate old supplies
      dt-bindings: bluetooth: qcom,wcn6855-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,wcn6855-bt: Deprecate old supplies
      dt-bindings: bluetooth: qcom,wcn7850-bt: Split to separate schema
      dt-bindings: bluetooth: qcom,wcn7850-bt: Deprecate old supplies

 .../net/bluetooth/qcom,bluetooth-common.yaml       |  25 ++
 .../bindings/net/bluetooth/qcom,qca2066-bt.yaml    |  49 ++++
 .../bindings/net/bluetooth/qcom,qca6390-bt.yaml    |  64 +++++
 .../bindings/net/bluetooth/qcom,qca9377-bt.yaml    |  58 +++++
 .../bindings/net/bluetooth/qcom,wcn3950-bt.yaml    |  67 ++++++
 .../bindings/net/bluetooth/qcom,wcn3990-bt.yaml    |  66 ++++++
 .../bindings/net/bluetooth/qcom,wcn6750-bt.yaml    |  93 ++++++++
 .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    |  98 ++++++++
 .../bindings/net/bluetooth/qcom,wcn7850-bt.yaml    |  93 ++++++++
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 259 ---------------------
 MAINTAINERS                                        |   3 +-
 11 files changed, 615 insertions(+), 260 deletions(-)
---
base-commit: d2aaae19c5e17d310b1962dd252d12c7782a54fe
change-id: 20251028-dt-bindings-qcom-bluetooth-9af415056c1c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


