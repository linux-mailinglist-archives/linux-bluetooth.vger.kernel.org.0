Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC9E107230
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Nov 2019 13:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbfKVMbq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 Nov 2019 07:31:46 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35410 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKVMbp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 Nov 2019 07:31:45 -0500
Received: by mail-wm1-f68.google.com with SMTP id 8so7437473wmo.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 22 Nov 2019 04:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=74TcVE6ZbO9rpndGFGivGUBQOOHnZAK2bsgpITsC8jc=;
        b=c2QB6ez+ijA24X1279dpVO0ZIxh3iGyx27sXlE+KBoo98/7ifKIZPkSK0bD4aU3Qji
         /KbDi63LgCD96z8qu410TJqpLcJ48dceNRapxS/EELciY5LdNn3wMNXg6Wyv/Gwe+oos
         sHhfXMMeXhMMnBnCNvKOsa12YPovFM/i2xsQ71adyie1no758zhN7c+bhD6EuZxANaAW
         V0uM4U2qYXawxnl73SbTodx37zl+A4rYipSbmeRMZXdhHjTzIrx26iJRaPQTfHo4iaUD
         rKBEVI4KXidbVlVavyYBI3WH/l45x346OnOtayW31cnX2vycDb86ydS/CLfT0tAk1CCb
         C+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=74TcVE6ZbO9rpndGFGivGUBQOOHnZAK2bsgpITsC8jc=;
        b=A6cl6qcgpHg1w+fzWs25hwxfaCtPu0LJkRKymroZ3CdnKLZtRHW0v6uJFrox5+F3OV
         NpMtsNiMUZWagyTBFvlT+1TGxBmk8eIZQ1HpsQF5r1mjBa6WlVDnhDy1UhhbIukwcVEv
         wxiUo4FjpMr1kPP6AE9imHYlvSFJyhhwYTBYOB/3wmKpbWul7SuGS/XwlhO3FeaMzuNV
         OVV9swK/0+hqFy2nwy8AqlJj13zLGR9+vWBG5pu1/8jeAhZBMpOykIqu/vO77X8C7ppH
         Lylxv/2hOihbSs1IhflGgJO+ow39KplQZ1T+jYHSl3UPY07bN4IcwlBHBaPFt1StEWqv
         ri1w==
X-Gm-Message-State: APjAAAXSTzQH5lUM3jMB1nQQtrihC8U25C2FUzurxudpW/vGLe0E6DXT
        LtUeEYOPX67zU7DEfqFIc8Y=
X-Google-Smtp-Source: APXvYqzCkXsCVgY2gF3Avv4b3lFOTuRhGR/F7fYzaDe4mYIu4kW4xtts92Jq+Z2FZorncuW8lYeCig==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr16740440wmc.130.1574425903804;
        Fri, 22 Nov 2019 04:31:43 -0800 (PST)
Received: from mamamia.internal (a89-183-130-53.net-htp.de. [89.183.130.53])
        by smtp.gmail.com with ESMTPSA id w11sm8249397wra.83.2019.11.22.04.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 04:31:43 -0800 (PST)
From:   Andre Heider <a.heider@gmail.com>
To:     Johan Hedberg <johan.hedberg@gmail.com>
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Ondrej Jirman <megous@megous.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v4] bluetooth: bcm: Use the BDADDR_PROPERTY quirk
Date:   Fri, 22 Nov 2019 13:31:42 +0100
Message-Id: <20191122123142.2152298-1-a.heider@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Some devices ship with the controller default address, like the
Orange Pi 3 (BCM4345C5).

Allow the bootloader to set a valid address through the device tree.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 drivers/bluetooth/btbcm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 2d2e6d862068..c5c12ba880d9 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -440,6 +440,11 @@ int btbcm_finalize(struct hci_dev *hdev)
 
 	set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
 
+	/* Some devices ship with the controller default address.
+	 * Allow the bootloader to set a valid address through the device tree.
+	 */
+	set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(btbcm_finalize);
-- 
2.24.0

