Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0365323BD82
	for <lists+linux-bluetooth@lfdr.de>; Tue,  4 Aug 2020 17:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbgHDPsN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 4 Aug 2020 11:48:13 -0400
Received: from hoster906.com ([192.252.156.27]:33310 "EHLO hoster906.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726276AbgHDPsM (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 4 Aug 2020 11:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=mnmoran.org; h=from:to
        :cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=dkim; bh=JeWBNCglrPXMkIDFXHpQ7uegi
        0IUk9cEgkTv06h0Heg=; b=B+aiKcEs5O6UCKy/8F0az4QUeFallvFYzz511zfvh
        SJeFlSS3lnpT0/LdSMsTlrey7/HoqCH8XLlsfhQ/Iv6uJT2Iqxdo24B7U0UUFW70
        PD3ftlertvlhFFQyx6z23xalBSFGWWmUU9yFMW4HFQKsiYhZFGe3uVTBhOSuw+X8
        HA=
Received: (qmail 29229 invoked by uid 503); 4 Aug 2020 15:48:11 -0000
Received: from unknown (HELO knuckle.Home) (mike@mnmoran.org@162.39.210.203)
  by hoster906.com with ESMTPA; 4 Aug 2020 15:48:11 -0000
From:   "Michael N. Moran" <mike@mnmoran.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com,
        "Michael N. Moran" <mike@mnmoran.org>
Subject: [PATCH v3] Checkpoint Bluetooth Mesh.
Date:   Tue,  4 Aug 2020 11:47:58 -0400
Message-Id: <20200804154758.1086522-1-mike@mnmoran.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 rpi/libdirs.b |  2 ++
 rpi/notes     | 29 -----------------------------
 2 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/rpi/libdirs.b b/rpi/libdirs.b
index bf34b9b..f340ed9 100644
--- a/rpi/libdirs.b
+++ b/rpi/libdirs.b
@@ -1,2 +1,4 @@
+src/oscl/buffer
+src/oscl/platform/posix/oscl/kernel/platform
 +src/mnm/btmesh/libdirs.b
 
diff --git a/rpi/notes b/rpi/notes
index 544184a..e69de29 100644
--- a/rpi/notes
+++ b/rpi/notes
@@ -1,29 +0,0 @@
-[0] HCI_COMMAND_PKT
-[1-2] HCI_CMD_LE_SET_ADV_DATA
-[3]	length Number of significant octets in data
-
-struct bt_hci_cmd_le_set_adv_data {
-[3]    uint8_t  len;
-[4-?]    uint8_t  data[31];
-} __attribute__ ((packed));
-
-HCI_COMMAND_PKT
-
-struct ad_struct {
-    uint8_t len;	sizeof(ad.type)+sizeof(pb_adv_pdu)+pdu_len
-    uint8_t type;
-    uint8_t data[]
-} 
-
-struct pb_adv_pdu {	pbadv*
-    uint32_t link_id;
-    uint8_t trans_num;
-	pdu[]
-	}
-
-//////////
-HCI_CMD_LE_SET_ADV_ENABLE
-struct bt_hci_cmd_le_set_adv_enable {
-    uint8_t  enable;
-}
-
-- 
2.26.2

