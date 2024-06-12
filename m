Return-Path: <linux-bluetooth+bounces-5274-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D80E904D4F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 12 Jun 2024 09:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D89691F24341
	for <lists+linux-bluetooth@lfdr.de>; Wed, 12 Jun 2024 07:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B19116D30F;
	Wed, 12 Jun 2024 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="I5gXvipR"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7955216C861
	for <linux-bluetooth@vger.kernel.org>; Wed, 12 Jun 2024 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179153; cv=none; b=TerkS+qLOkdXhtey8kBVIiEA9mFyRPRqD+ZNezQT+BtPxla+KsJ6Axm+MM6AVrze1LLN2uDkcOm9R0Pghy18vUdBRYvHG3lIh4rBF+Os6aLMIBqpsvTwf9zqkSJNzdPIWpb+2UulDT1m1f4pxAT6yjvOhHNCtL+nEZvjOCJZk8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179153; c=relaxed/simple;
	bh=vwNJ897gwBvDgypF3Aq9mgPnj8YQo/CTPzx+egzni4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LkUjLnESaeg3GMfGxd+0w2jSpnWNnbPfc/IzbO2mOGQ3N2o4veGhXtc2ObEuf6IN9R/aXBGIe0apzmPYBn1Yx/6+LfA+ZBb9q7IMRIs+kqfc11C8fSW386YFqFTtD5bFnRuhy84cm6P8ZFCKbimK30GbpD7gS1MsYc8SPOBEdzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=I5gXvipR; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5295eb47b48so7686345e87.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 12 Jun 2024 00:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718179149; x=1718783949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J9bGYOos+5ZAvSBq70WnnGsqeYl9M4GtIdifUxXDp6M=;
        b=I5gXvipR80R28yg5gbkUSptWsHbXOtdB2Bceasn9V6GRTzx14TuvcP2yFcsQjpU34s
         rApwinPS8KOsRdnrQyVzMhergOJPYr0sU5Ip85rHekWMgpKl1Zo9xXE5WDNhRU3739pV
         jzBElr9hD7hz8MrcU5OvhAOyjYl/xDXbP21YXId5JEOi3QTpqCc3/mYVL32izVozpSXB
         9LQyynlsXXqrssTII9Y9IUTVOXSsjqzN7mr03uFnQZBFAbFvjWjrmKJqTW7uUpt8tGOJ
         wFHv+ToJCu8YIJlB/Sb7thlvGjd6OX6eFQ4Xgy2HbNrfpwvugNQErl/xi9BqKsP6mdWT
         grZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179149; x=1718783949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9bGYOos+5ZAvSBq70WnnGsqeYl9M4GtIdifUxXDp6M=;
        b=UzUAfQX2DqaOo2oNBZkK82/BJKE69OyP02Ox3j5I684Tq+ZaLiKFrm7B/2yPlg+51Y
         ngYMBWNy93NUfkCglJ6OwUl6FV5Frr9FAK72WfteBjij8HnvK2kZjaQ6WckjeyNsypcz
         QfFDB1ENwmh34Ab3Dd1UZTyOX+o4QR8rHjajks7D1rXOu4xenQAvaiei5thKjnZlVXb0
         b88pZmtA+uofN952eK8gRo33xHjYpRX72d3vxPtqKk9P+y2oDzWTWcmIvbsKqu7ivwaG
         k4Y4h6IP0u8p3DHeIAvXlhFZ97hjZzpfM8dguoaJAcbESOaBhVTuPlnTbyxrWyoBfngR
         rLxA==
X-Forwarded-Encrypted: i=1; AJvYcCViEBtTJfLo6X7FaGRZDqxmqA/4OOS5bgyfZb+H2WdILhBoDfsp6UhZRKNqTxDUZfbWHu/xxdGkQtnlRK6lvYtn2gAossZdxaZYA/A+2hL8
X-Gm-Message-State: AOJu0Yxq4DU80ytl87nDJq8SpTfUyOrr86QZ2yfz2ISao8c08cY8T7pc
	2P4DE6g8KJq/D0geH0Y5SLf1IL5C9wJIx9/DuEdt8XQUrrXLbjNzB2cZKivUQl4=
X-Google-Smtp-Source: AGHT+IHW4NIxUvz4W89OLc8Yhve4W25GsEQm/AZgXDZVaD85P+vCuq8RK+JIPGo75+rm9H3KVgiVuA==
X-Received: by 2002:a05:6512:1243:b0:52b:bf8f:5690 with SMTP id 2adb3069b0e04-52c9a3fd437mr800598e87.52.1718179149308;
        Wed, 12 Jun 2024 00:59:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:8d3:3800:a172:4e8b:453e:2f03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de607sm15312315e9.34.2024.06.12.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 00:59:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-bluetooth@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable tag between the Bluetooth and pwrseq branches for v6.11-rc1
Date: Wed, 12 Jun 2024 09:58:29 +0200
Message-ID: <20240612075829.18241-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Marcel, Luiz,

Please pull the following power sequencing changes into the Bluetooth tree
before applying the hci_qca patches I sent separately.

Link: https://lore.kernel.org/linux-kernel/20240605174713.GA767261@bhelgaas/T/

The following changes since commit 83a7eefedc9b56fe7bfeff13b6c7356688ffa670:

  Linux 6.10-rc3 (2024-06-09 14:19:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pwrseq-initial-for-v6.11

for you to fetch changes up to 2f1630f437dff20d02e4b3f07e836f42869128dd:

  power: pwrseq: add a driver for the PMU module on the QCom WCN chipsets (2024-06-12 09:20:13 +0200)

----------------------------------------------------------------
Initial implementation of the power sequencing subsystem for linux v6.11

----------------------------------------------------------------
Bartosz Golaszewski (2):
      power: sequencing: implement the pwrseq core
      power: pwrseq: add a driver for the PMU module on the QCom WCN chipsets

 MAINTAINERS                                |    8 +
 drivers/power/Kconfig                      |    1 +
 drivers/power/Makefile                     |    1 +
 drivers/power/sequencing/Kconfig           |   29 +
 drivers/power/sequencing/Makefile          |    6 +
 drivers/power/sequencing/core.c            | 1105 ++++++++++++++++++++++++++++
 drivers/power/sequencing/pwrseq-qcom-wcn.c |  336 +++++++++
 include/linux/pwrseq/consumer.h            |   56 ++
 include/linux/pwrseq/provider.h            |   75 ++
 9 files changed, 1617 insertions(+)
 create mode 100644 drivers/power/sequencing/Kconfig
 create mode 100644 drivers/power/sequencing/Makefile
 create mode 100644 drivers/power/sequencing/core.c
 create mode 100644 drivers/power/sequencing/pwrseq-qcom-wcn.c
 create mode 100644 include/linux/pwrseq/consumer.h
 create mode 100644 include/linux/pwrseq/provider.h

