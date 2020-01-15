Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5E0713BD2D
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Jan 2020 11:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729575AbgAOKMr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Jan 2020 05:12:47 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41817 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729602AbgAOKMr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Jan 2020 05:12:47 -0500
Received: by mail-wr1-f67.google.com with SMTP id c9so15137196wrw.8
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Jan 2020 02:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=TphKRKgrx6UOwY938/z3zkU7XoFubfFhJvJRyw+ELVA=;
        b=rF8UEv4+aHXN5U+ib7xcboRlT+K7H1VEqquEq+m7pEpwSQMFWwyN7guzslCrJoBYLW
         b10OFL9WAPXXzizMArolKJSTLMvixZKpY52I7fDJeykkuO8Dbgki9oDi/vmP6GCjUZtB
         xAXe20p9DG1M0X6Oo+c9IuhxHXQbgTq8Don5pILBFCXzx4gViqvNJ4XjJIzU39GpcF5N
         QKksBAP5PAhksnj6Lx65spoPDoEBaph9dLDVYRbkwhGUqkkYVjP6+TnMhf/bNHby0aJA
         9cO0GNII3uAE/jeHtsQoUeDtSVto0vEbEXh0MTbtkTHHPbRRCw/A9llmThD+IyBlYfOd
         dfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TphKRKgrx6UOwY938/z3zkU7XoFubfFhJvJRyw+ELVA=;
        b=DCvgOYGobOgW22sFOd9AqbVZKHV29v6G+tAx5fsmNHsp9lgb80Eve1RsbjVj140Kmm
         cljaVilhxgJRua4hgbdtnnk7r+oU4YPoSMI43n21GEMRdl8dUP2iaX531aLzaB0+yabg
         izqZwVPEaOSs+i4bKRTFpQse+ZenHwyhfTXZQl3al/0kKxFLlP6OOfATihLT3/BoHGNW
         PN+U3qTOCdF2IK814+ZgbCL79G/k5Tx24XNLvcpyjw95h794R4hRORfEz+Uwo6V1I23L
         M3ZGWx9XNo1aF7zseRL9E5inDRRihc6XRhT+I1DyxpcN5OZgOHCSSJYO6T8y0IPGb8VU
         GWCw==
X-Gm-Message-State: APjAAAX1ISc0ZngowiZ2KSIi4vXe8ygKwbiVURtLmOaEJz5XOKVs/3jk
        XhHQTHoiK3CzbeQX4AW0mcZFNQ==
X-Google-Smtp-Source: APXvYqyiJAvF67CsgbnfTuZzZ394kjvs04rbDKyhZy7BpSwsCoiFjVC73kNMLzdKqGiznx/yeOH5YA==
X-Received: by 2002:adf:ed83:: with SMTP id c3mr29669763wro.51.1579083165363;
        Wed, 15 Jan 2020 02:12:45 -0800 (PST)
Received: from glaroque-ThinkPad-T480.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g7sm23828223wrq.21.2020.01.15.02.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 02:12:44 -0800 (PST)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org
Cc:     johan@kernel.org, nsaenzjulienne@suse.de,
        linux-kernel@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH v7 0/2] add support of interrupt for host wakeup from devicetree in BCM HCI driver
Date:   Wed, 15 Jan 2020 11:12:41 +0100
Message-Id: <20200115101243.17094-1-glaroque@baylibre.com>
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

change sinve v6:
- depracate host-wakeup-gpios 

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

 .../devicetree/bindings/net/broadcom-bluetooth.txt         | 7 +++++--
 drivers/bluetooth/hci_bcm.c                                | 3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.17.1

