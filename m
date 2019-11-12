Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 037A2F8519
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Nov 2019 01:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfKLAUA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 11 Nov 2019 19:20:00 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44568 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726928AbfKLAUA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 11 Nov 2019 19:20:00 -0500
Received: by mail-pf1-f193.google.com with SMTP id q26so11942379pfn.11
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Nov 2019 16:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5m2NG6A+YgxDfMfpQtOFvpd6UPNiApr1ET296m72/Jw=;
        b=LmHtHTSLUL2+tujgPcdLdh4oJucSyAFboxlu4pQO4dgCTYOivpUDb3eZljCFo9YCiz
         iTRgV4e8h/ACWzZ/aDa3yjZj7HO2PXQlYaUzp4oKePffml2I6UilI1IysWAwh8LQVBK+
         31as/o7Db8bOeXEV7OuMzb3FcZwiaH3AX5Fic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5m2NG6A+YgxDfMfpQtOFvpd6UPNiApr1ET296m72/Jw=;
        b=fU/FFPuEupgmNIf4JZfkYiVKdidLuOKyclfb/ZuhcXQB8CLEyJ4dY6JoP6+t33OyjB
         IQPRXFvuqta9/g/g8GAhQwCM2Le/F2+yH3fBhO01veUqXSjuDEG9npbnti4SUMeUTI7/
         oamJD9X7aWmeLA/OGyC49nb5heCOHZxPx+gtZTG4DfKvz4kREJtcTBCtH/ECGwYS/s4e
         pyvkOvtguYyfkAg3xyZ2To23OBnpKXFQfrf4lkUjZWfc3hrq4OPMaRnachFGSEkrTT5X
         GSNCLjCpoBsFvyDP/8Vq64jAdNpFyVzP6TE8NkT4oa/EUDjvQGYZIUSsN66MGeunG208
         zRgw==
X-Gm-Message-State: APjAAAXbjEBRiTBo4vbbHe8cePfw+AGPlqximYU5uNU9aMLRRWGA4MkH
        Mk0p2EX8RU7wCONkM1UgDSWrVw==
X-Google-Smtp-Source: APXvYqxRBAafOGGdkjoeoMMLCuVKQsBTyvDmgFCv91eTMAU5wmb/LfQzoz+wYOxDAVLQfYbN4idhyQ==
X-Received: by 2002:a63:77c3:: with SMTP id s186mr9434885pgc.370.1573517999167;
        Mon, 11 Nov 2019 16:19:59 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id h23sm8430898pgg.58.2019.11.11.16.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:19:58 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-bluetooth@vger.kernel.org, dianders@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 0/4] Bluetooth: hci_bcm: Additional changes for BCM4354 support
Date:   Mon, 11 Nov 2019 16:19:45 -0800
Message-Id: <20191112001949.136377-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org


While adding support for the BCM4354, I discovered a few more things
that weren't working as they should have.

First, we disallow serdev from setting the baudrate on BCM4354. Serdev
sets the oper_speed first before calling hu->setup() in
hci_uart_setup(). On the BCM4354, this results in bcm_setup() failing
when the hci reset times out.

Next, we add support for setting the PCM parameters, which consists of
a pair of vendor specific opcodes to set the pcm parameters. The
documentation for these params are available in the brcm_patchram_plus
package (i.e. https://github.com/balena-os/brcm_patchram_plus). This is
necessary for PCM to work properly.

All changes were tested with rk3288-veyron-minnie.dts.


Changes in v3:
- Change disallow baudrate setting to return -EBUSY if called before
  ready. bcm_proto is no longer modified and is back to being const.
- Changed btbcm_set_pcm_params to btbcm_set_pcm_int_params
- Changed brcm,sco-routing to brcm,bt-sco-routing

Changes in v2:
- Use match data to disallow baudrate setting
- Parse pcm parameters by name instead of as a byte string
- Fix prefix for dt-bindings commit

Abhishek Pandit-Subedi (4):
  Bluetooth: hci_bcm: Disallow set_baudrate for BCM4354
  Bluetooth: btbcm: Support pcm configuration
  Bluetooth: hci_bcm: Support pcm params in dts
  dt-bindings: net: broadcom-bluetooth: Add pcm config

 .../bindings/net/broadcom-bluetooth.txt       | 11 +++
 drivers/bluetooth/btbcm.c                     | 18 +++++
 drivers/bluetooth/btbcm.h                     |  8 +++
 drivers/bluetooth/hci_bcm.c                   | 70 ++++++++++++++++++-
 4 files changed, 106 insertions(+), 1 deletion(-)

-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

