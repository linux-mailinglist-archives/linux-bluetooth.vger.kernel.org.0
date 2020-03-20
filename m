Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0A0218C521
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Mar 2020 03:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgCTCCC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 19 Mar 2020 22:02:02 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:43782 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgCTCCC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 19 Mar 2020 22:02:02 -0400
Received: by mail-pl1-f194.google.com with SMTP id f8so1848896plt.10
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Mar 2020 19:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WeyRq0Bbk2RSmZHgEPCvdWM5jbjVDDe5W4E9CInHi0c=;
        b=nI5ulvVv/nvxRZe2zSkfLXLUG8f5/8rBe9na7G3cgR5oFJNs4hueir+3tAw/CQezO4
         TJiS593SCUNa0EEGx9K4JeiGyWzQUK4fw+GYXvdwrhjll63fSCq/PZMbdQHm8BEvgC+S
         wlh+lRcRcu+o+BH2PA/8+NVCdi2a3SrGugkz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WeyRq0Bbk2RSmZHgEPCvdWM5jbjVDDe5W4E9CInHi0c=;
        b=Wg6S5pS5NFHOurJpMSeroYVsjOjXQlqa9YCx84cs6q678nuz3VSHacoQWedIPiBJq/
         X09QCz+NgyqLCFMDkLhp+F4Q10tiUOB2rpsEG5wKrdnTXSOXu05nRbFc08PgRkhrovMz
         QaTEAmblS2Tw2xeRjBiZtnZ+daWICwKeh9mwuDwXk7y7J+XMxIRKLwbo6cXicpjChnC3
         HONTcufzC088GiCMGBcJ3ffjErZEZnixObtxMaFWbWRf/J7i2t5WkkgI9iw0o6yBFYRY
         yFnc+tgLyTDQBa3uEmYs18in7vDwN1/jo1Pleu0hq2h6HqrjBgF+++8PYYr48jd4H3vS
         348Q==
X-Gm-Message-State: ANhLgQ0QXURqUyVoqsyI0i2pIKT3tKY2itI34MAh/USP8iSJk6iGTyiS
        zb9aSi9ZOsjOqrWvIM2du2wLQw==
X-Google-Smtp-Source: ADFU+vtuipaonYkXPOtPWNXbbTxyKTJprONJWA7md1SSm0Equk8vCQ2nX8F/bQllzMXTgTP1I7bGng==
X-Received: by 2002:a17:90a:e98e:: with SMTP id v14mr6815170pjy.114.1584669721211;
        Thu, 19 Mar 2020 19:02:01 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id y13sm3475705pfp.88.2020.03.19.19.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 19:02:00 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     marcel@holtmann.org, linux-bluetooth@vger.kernel.org,
        ulf.hansson@linaro.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org, mka@chromium.org,
        dianders@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] Bluetooth: btmrvl: Reset SDIO card on hang
Date:   Thu, 19 Mar 2020 19:01:52 -0700
Message-Id: <20200320020153.98280-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org


Hi Marcel,

This patch adds an error recovery mechanism to the btmrvl driver. We
have been using it on ChromeOS on kernel v4.19 and it has been on the
stable channel release of ChromeOS for a few months now.

A side effect of this change is that other functions on the same card
will be affected by the reset. The necessary patches to support this
reset have already been added to the mwifiex driver by Ulf:

11239229 New          [v3,1/3] mwifiex: Re-work support for SDIO HW reset
11239233 New          [v3,2/3] mmc: core: Drop check for mmc_card_is_removable() in mmc_rescan()
11239237 New          [v3,3/3] mmc: core: Re-work HW reset for SDIO cards

You can see more information at crbug.com/1004473

Thanks
Abhishek



Matthias Kaehlcke (1):
  Bluetooth: btmrvl: Detect hangs and force a reset of the SDIO card

 drivers/bluetooth/btmrvl_sdio.c | 24 ++++++++++++++++++++++++
 drivers/bluetooth/btmrvl_sdio.h |  1 +
 2 files changed, 25 insertions(+)

-- 
2.25.1.696.g5e7596f4ac-goog

