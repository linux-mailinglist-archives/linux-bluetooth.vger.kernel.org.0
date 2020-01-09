Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72DC3135742
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Jan 2020 11:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730406AbgAIKnC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Jan 2020 05:43:02 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39181 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729452AbgAIKnB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Jan 2020 05:43:01 -0500
Received: by mail-wm1-f68.google.com with SMTP id 20so2251065wmj.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 09 Jan 2020 02:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=1+dHq18C0bFPHtybcse9Vo/A581Ece5LU7fp8OU7MIA=;
        b=cKqRG0EnXT/JJJfM09cUs5fipYn6nyM82sI5CTyQH86aHScCx1yQBYPyLFKjjcKU3C
         FgWGO5HtBUpH/vNHAhStjCPGFeHHzmooHb7nw//gXz2eU+e5zlV7Zck1sOpcbd4olg0Y
         JTHVLTfDigFQtS2VTFg7IuOaTdaOCywrcTe2CTCPb8p3z9q8R/ji9pOhJ0T1MnWWVf0W
         DZ5yFn7f4VMNOuYkVAt3ZKLWbI1dlU3I3uqNOAFF6MVsX+FkMbuIGbUmn/7Oug3uW/3H
         ko3Nvbm2U0klMibnOX8f1boK+KXFiZkki3AhapyQuQdD8OUkAIJMeRNStziOrZJyTUq7
         ZRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1+dHq18C0bFPHtybcse9Vo/A581Ece5LU7fp8OU7MIA=;
        b=aov4veyGJ2/+c4QRsNUl15thfhya+KBbk2CwHNMSWOYhSl1RBCRApLdD+/DnUBwCTU
         rJ8lni2om8BKqRyz3HuUu8jP9U08Xuw/tOeBY4pAOSXdlT6G3i/NxSE1DKmWeYF/feIh
         Y9yXiyKm+DxRCJK8NBXCbF6+JpUS/ZY0oZshLPEkNjePFhJO+FxJIo8GGQzJOX3mYVVS
         QT3oEeFbxuhX1i9RWPd7Cpa/k+YawwQ318YFP1ip5EP2TOU8xGzfcgtvCf2y/y7NhDP5
         7j6rzsEBKvOO065FtrHy/pDC18sCzfgU6P3E32RbMFffL9Wj8iAS75Fe8DynnuJbGYH/
         OdxA==
X-Gm-Message-State: APjAAAXx+YhNBoNmTnD6LxFH6i6Qr5xQIQoqTASCuHZxtGZJFUWQYnCP
        FTK5CeBX4Hs+08LLnQWqrGmndw==
X-Google-Smtp-Source: APXvYqx3mnWFPevVQy8vni2p9aUcio3Y6O/BSZXI7da7LcAZZVbXmt0IU4pY0bgojjO7SfvOboMA4A==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr4068172wmj.96.1578566579791;
        Thu, 09 Jan 2020 02:42:59 -0800 (PST)
Received: from glaroque-ThinkPad-T480.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q68sm2587167wme.14.2020.01.09.02.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 02:42:59 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org
Cc:     johan@kernel.org, nsaenzjulienne@suse.de,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH v6 0/2] add support of interrupt for host wakeup from devicetree in BCM HCI driver
Date:   Thu,  9 Jan 2020 11:42:55 +0100
Message-Id: <20200109104257.6942-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

add interrupts and interrupt-names properties to set host wakeup IRQ.
actually driver find this IRQ from host-wakeup-gpios propety
but some platforms are not supported gpiod_to_irq function.
so to have possibility to use interrupt mode we need to add interrupts
field in devicetree and support it in driver.

change sinve v5:
- add tags

change sinve v4 [1]:
- add patch to update Documentation
- use of_irq_get_byname to be more clear and move call in bcm_of_probe
- update commit message

change since v3:
- move on of_irq instead of platform_get_irq

change since v2:
- fix commit message

change since v1:
- rebase patch

[1] https://lore.kernel.org/linux-bluetooth/20191213105521.4290-1-glaroque@baylibre.com/

Guillaume La Roque (2):
  dt-bindings: net: bluetooth: add interrupts properties
  bluetooth: hci_bcm: enable IRQ capability from devicetree

 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 4 +++-
 drivers/bluetooth/hci_bcm.c                                  | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.17.1

