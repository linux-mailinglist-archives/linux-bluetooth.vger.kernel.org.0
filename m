Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E731F306A
	for <lists+linux-bluetooth@lfdr.de>; Tue,  9 Jun 2020 02:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387889AbgFIA7B (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 8 Jun 2020 20:59:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:54118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728225AbgFHXIl (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 8 Jun 2020 19:08:41 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56098208C9;
        Mon,  8 Jun 2020 23:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591657721;
        bh=dmbHKk/CvJ8hqCWgAkefYUpXXod9lx3uh0ILF4HJH5s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fnh5MmtozhO9R2twYmFqOSd1ReWHWpOfF6Rv/njvuzu3bR3e3V5S4xG5M7fe6fcwu
         B4qiw/X8zaJ4klWiDvWGMV4tLOD97iV1YFZL68MjQGYdrJTgIJ4sA8q3f640FIiuKx
         Lg0EYmBPRa4wqgidZZ8L4sWnjI1bW5YpDYTnY2VU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-bluetooth@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 114/274] Bluetooth: btbcm: Add 2 missing models to subver tables
Date:   Mon,  8 Jun 2020 19:03:27 -0400
Message-Id: <20200608230607.3361041-114-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit c03ee9af4e07112bd3fc688daca9e654f41eca93 ]

Currently the bcm_uart_subver_ and bcm_usb_subver_table-s lack entries
for the BCM4324B5 and BCM20703A1 chipsets. This makes the code use just
"BCM" as prefix for the filename to pass to request-firmware, making it
harder for users to figure out which firmware they need. This especially
is problematic with the UART attached BCM4324B5 where this leads to the
filename being just "BCM.hcd".

Add the 2 missing devices to subver tables. This has been tested on:

1. A Dell XPS15 9550 where this makes btbcm.c try to load
"BCM20703A1-0a5c-6410.hcd" before it tries to load "BCM-0a5c-6410.hcd".

2. A Thinkpad 8 where this makes btbcm.c try to load
"BCM4324B5.hcd" before it tries to load "BCM.hcd"

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bluetooth/btbcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 1f498f358f60..e1377934507c 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -380,6 +380,7 @@ static const struct bcm_subver_table bcm_uart_subver_table[] = {
 	{ 0x410e, "BCM43341B0"	},	/* 002.001.014 */
 	{ 0x4204, "BCM2076B1"	},	/* 002.002.004 */
 	{ 0x4406, "BCM4324B3"	},	/* 002.004.006 */
+	{ 0x4606, "BCM4324B5"	},	/* 002.006.006 */
 	{ 0x6109, "BCM4335C0"	},	/* 003.001.009 */
 	{ 0x610c, "BCM4354"	},	/* 003.001.012 */
 	{ 0x2122, "BCM4343A0"	},	/* 001.001.034 */
@@ -395,6 +396,7 @@ static const struct bcm_subver_table bcm_uart_subver_table[] = {
 };
 
 static const struct bcm_subver_table bcm_usb_subver_table[] = {
+	{ 0x2105, "BCM20703A1"	},	/* 001.001.005 */
 	{ 0x210b, "BCM43142A0"	},	/* 001.001.011 */
 	{ 0x2112, "BCM4314A0"	},	/* 001.001.018 */
 	{ 0x2118, "BCM20702A0"	},	/* 001.001.024 */
-- 
2.25.1

