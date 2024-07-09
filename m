Return-Path: <linux-bluetooth+bounces-6031-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1288692B926
	for <lists+linux-bluetooth@lfdr.de>; Tue,  9 Jul 2024 14:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 330AB1C2344E
	for <lists+linux-bluetooth@lfdr.de>; Tue,  9 Jul 2024 12:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4F6158D83;
	Tue,  9 Jul 2024 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lTyz7OSJ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046DF1586F2
	for <linux-bluetooth@vger.kernel.org>; Tue,  9 Jul 2024 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720527534; cv=none; b=H2FsqA4pmDgRYpH/BvN6E8aThoda1w28l+1IOeVwjIPNIVOOi+Q5sc3TzY0f4IpNjMCy1H6jn4yiVoCwGZf9M+i8nkXjpk9RDQnRUYLisivhRWhXaQQ/RMnGGKORy3Z9aVn+MKxvnzVfXTMZEcISt8kf3zCUlQrcUuaChjvo/tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720527534; c=relaxed/simple;
	bh=Pe0nuXqG3qP9nLPELvk5z3cBGnZDCYSeoDY6GZpeOIU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IlF3LyUfXTbFL0Ae1w2nztNwTTFA0U34ybWV7jDreHK6hFSfg3NRQlSiVQ2t1hqePgFdQaqjuJQoxewWfp+XIHpayNgAxPK8qrHQj0M+Ijnu3IEVNNsTH8izRFkDuecRCs+tzLyxbJshKyI7SYwsRUlpN0HLhVgzjAx1AbnMDq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lTyz7OSJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3678aa359b7so3815019f8f.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 09 Jul 2024 05:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720527531; x=1721132331; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ysEM+hrdKThykp695zr35/1x4O4LVJPY/Rqf0Bmph5g=;
        b=lTyz7OSJyg8ev2XYo9RRC+daZOa96XSQg8GdTdVqzGLfm4T95YEM62wu28NkJS4ZAB
         UJeUc1HQpdW84UhFY9JR2NWozVmizZZ5NET4Gzj+BnUTcypbFhEKMbPr4/svnUJ0LrTH
         /bHKyi16pfknTefc2mKlCtkk5o59v2t4VsZny79tqnYUFzeYkPH8XesPt1j2XQSONuvr
         uMNR4C31VOUfSG6Ldd1ExCoI5SJfdtjyoKoJGKb9ITJ6a2OkcqtAw0l82DC0BQCzUIqS
         Cyt90lVIMEYsfA8A8VyDHH7MtC4WISFppIvylWzVzLpCpJdOBfTESBuB0+weJov/lnv2
         OS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720527531; x=1721132331;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysEM+hrdKThykp695zr35/1x4O4LVJPY/Rqf0Bmph5g=;
        b=bxSysNA/6uvTaiYEkWjau4yrUdomRIJxdRt+naNa4w/XE7Or76h7uzfkXu2/PxBwy0
         qdaaUQ0zcmz7vdAwV83/WgRSg3ZnJscjj6kNyEBUfA2xihISGT6J6Eig0UtgXb2apITG
         orbioIRVHBZXB200o3LapkiLy+cKdzVUg/zuNH+a8b61LrBmEKzS2y0pUo94WN9fGztx
         eMRULX2NL13opeHLAebCl1lDVcJ75g6boYsamG9k4d7nl09SVMyBy9Rcu57rrIXatm2u
         bGREk8H6FsRzyEMX4CEkQpHqaoEpSXCCisJGQg2F+qImeUrMGJlGKig/apnVW+SGiXea
         IoQQ==
X-Gm-Message-State: AOJu0YzDcbu2CbznLcmi5ry5BvAAhUPWPHPoqLwvwa/I+5I+6OzRpbyx
	NmMjxTC2McK44izw/wVOcl/nk8M+w9PZdNOahNaAINriI15dRE/cNlqIqeDin4I=
X-Google-Smtp-Source: AGHT+IHZqA6anEaUxvluLqhHtquDSAPfFVSC6AkG3YhqfqCYXbLaosYjdF2vSTNVQn0Mv12gBK+1iA==
X-Received: by 2002:adf:fc90:0:b0:367:89b0:f584 with SMTP id ffacd0b85a97d-367d2b3bfc9mr1848241f8f.11.1720527531141;
        Tue, 09 Jul 2024 05:18:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c270:70c:8581:7be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa06d3sm2390574f8f.75.2024.07.09.05.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:18:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 0/6] Bluetooth: hci_qca: use the power sequencer for
 wcn7850
Date: Tue, 09 Jul 2024 14:18:31 +0200
Message-Id: <20240709-hci_qca_refactor-v3-0-5f48ca001fed@linaro.org>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcqjWYC/23N3QqCQBAF4FeRvW5j/0ztqveIkHUddSBc242lE
 N+9UQiKujwzZ76ZWYSAENkxm1mAhBH9SEHvMuYGO/bAsaXMlFBGFMLwwWF9c7YO0Fl394GLohB
 QVVp2jWF0NtEGHxt5vlAeMFLtuX1Icp2+sfwXS5ILDsoYJZV0UsPpiqMNfu9Dz1YtqU+h/CMoE
 poDlLrRrXQ2/xKWZXkBGCbsA/MAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Pe0nuXqG3qP9nLPELvk5z3cBGnZDCYSeoDY6GZpeOIU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmjSqgThn1FoQ2q1tql7cHOyBujUj6JtZWCp+i6
 xYbJR5eBPWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZo0qoAAKCRARpy6gFHHX
 chhAD/9xRk3Cmaivt1EJtu/W+mojaURn8DrdNpKpDqfOH2VUr2ykQ19WjySd1r/gC1NHxr6Nj2Y
 EnvUG3oP8bZ1yycrJ9XAZAM6dZO8L6+W16idVDVNPczf3s97yjEyylp4WTDwy0RuqfQKxD08xDH
 RKxrmzvOWd3pGWHbMmkrA+mvYQgxMoBXxTevQifWaP/MMyR2BcOGHO26msrbF4CO7i9N/EfDONH
 VM16aIhq0G2SpAXAdmJRTAlKGognvkSesaOHoEhgQhvAs45J/hYPjoryW8K9B7MBQwH9+xCBMwy
 IL9jIe7Rx2OILaGi0xsIqE6xFVM8RBwOtybIww1irIVDG9nMlEKCpie06L46gJsT65YOCzkOV1x
 ldVbjPIkU/DMOgsHdhbvezXoQIbDUeQH1gIQKJ2Ph3BTm/lGp7jQpKdBln8wMs9HgmV3cy8JAAe
 DNTeS4WLxHHKB0HSKwuXCiW0NuzJ+RnVei5IjhEe/52pJyrivJOfpRAwTq6sc4jxhPXAbWzJAiE
 shZSmhcblYNYG/gkRCp+/NVLrIQrGaJe96YZFGE2ivqU7S6haSrhNtpW2LlAx8JpNrH0W9J3IBD
 kYhXURpuImkJVbRRCq5czJPrhst3nDOWP2Dvvrpg/hDEbETINOK49IonQTK0ndBu81Fo/MTNXFK
 70VS4vDxmhe1zbQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

The following series extend the usage of the power sequencing subsystem
in the hci_qca driver.

The end goal is to convert the entire driver to be exclusively pwrseq-based
and simplify it in the process. However due to a large number of users we
need to be careful and consider every case separately.

Right now the only model that fully uses the power sequencer is QCA6390 on
the RB5 board. The next steps are enabling pwrseq for Bluetooth on sm8650
and the X13s laptop. To that end we need to make wcn7850 and wcn6855 aware
of the power sequencing but also keep backward compatibility with older
device trees.

This series contains changes to mainline DT bindings for wcn7850, some
refactoring of the hci_qca driver, making pwrseq the default for the two
models mentioned above and finally modifies the device-tree for sm8650-qrd
to correctly represent the way the Bluetooth module is powered.

I made the last patch part of this series as it has a run-time dependency
on previous changes in it and bluetooth support on the board will break
without them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v3:
- Add a missing break in a switch case
- Link to v2: https://lore.kernel.org/r/20240708-hci_qca_refactor-v2-0-b6e83b3d1ca5@linaro.org

Changes in v2:
- Fix a switch issue reported by the test bot
- Link to v1: https://lore.kernel.org/r/20240705-hci_qca_refactor-v1-0-e2442121c13e@linaro.org

---
Bartosz Golaszewski (6):
      dt-bindings: bluetooth: qualcomm: describe the inputs from PMU for wcn7850
      Bluetooth: hci_qca: schedule a devm action for disabling the clock
      Bluetooth: hci_qca: unduplicate calls to hci_uart_register_device()
      Bluetooth: hci_qca: make pwrseq calls the default if available
      Bluetooth: hci_qca: use the power sequencer for wcn7850 and wcn6855
      arm64: dts: qcom: sm8650-qrd: use the PMU to power up bluetooth

 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 18 +++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            | 28 +++----
 drivers/bluetooth/hci_qca.c                        | 87 +++++++++++++---------
 3 files changed, 72 insertions(+), 61 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240704-hci_qca_refactor-0770e9931fb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


