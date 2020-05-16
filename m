Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0428D1D641E
	for <lists+linux-bluetooth@lfdr.de>; Sat, 16 May 2020 23:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgEPVJV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 16 May 2020 17:09:21 -0400
Received: from mx-out2.startmail.com ([145.131.90.155]:57929 "EHLO
        mx-out2.startmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbgEPVJU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 16 May 2020 17:09:20 -0400
X-Greylist: delayed 388 seconds by postgrey-1.27 at vger.kernel.org; Sat, 16 May 2020 17:09:20 EDT
From:   Haakon Drews <haadr@negentropy.io>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
        s=2017-11; t=1589662970;
        bh=UG9YLbAiC/eMzQBmXUK8ge+/fgsn2Uc6Tt2DGU5AsDA=;
        h=From:To:Cc:Subject:Date:From;
        b=r886ArosCZPLx3mgQ5/78c5ctZ0W0qhdLzEOhjY5siXOQpyfQV0kYvNPsZ1T+TuTE
         xzoTC7IrflB9/SgWN2CUhDFNJktg8vpKqIN3Ot21aKNDxUXcQlOtmM3prWhcrTX9jT
         SyJuBtuBrTpjU24S+YZX9h+/8C3NlV+5B7VlEij/OQ4iroobT8crU8hyvUVzKn88Qa
         t6mp/VoEccTd0naImtlkwvL/+OWOfTXwcmnQZOsuz4/h2ObakZTdHFEfG0dSVwf2fi
         1X94PH/6ut8Z4FFCWmz/tCGX6qfVyFdhUpnjxJnGoC8x0T5vg+lfmBec+bEY/li7ns
         oHRUnazdRjxXw==
To:     linux-bluetooth@vger.kernel.org
Cc:     Haakon Drews <haadr@negentropy.io>
Subject: [PATCH] Set vendor, product and version for all HoG instances
Date:   Sat, 16 May 2020 23:02:38 +0200
Message-Id: <20200516210238.3184629-1-haadr@negentropy.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Set the the correct vendor and product ids for all UHID/HoG
devices when they are unknown at HoG creation time.

Before this change, when connecting a BT device with multiple HoG
services for the first time, only the first HoG instance's vendor,
product and version fields would be set by the DIS callback. This meant
that all HoG instances except the first would be left with unset values
and their UHID devices would then be created with '0000:0000' as their
vendor:product ids.

Signed-off-by: Haakon Drews <haadr@negentropy.io>
---
 profiles/input/hog-lib.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/profiles/input/hog-lib.c b/profiles/input/hog-lib.c
index 8fb0283ca..a544e062c 100644
--- a/profiles/input/hog-lib.c
+++ b/profiles/input/hog-lib.c
@@ -1387,10 +1387,19 @@ static void dis_notify(uint8_t source, uint16_t vendor, uint16_t product,
 					uint16_t version, void *user_data)
 {
 	struct bt_hog *hog = user_data;
+	GSList *l;
 
 	hog->vendor = vendor;
 	hog->product = product;
 	hog->version = version;
+
+	for (l = hog->instances; l; l = l->next) {
+		struct bt_hog *instance = l->data;
+
+		instance->vendor = vendor;
+		instance->product = product;
+		instance->version = version;
+	}
 }
 
 struct bt_hog *bt_hog_new(int fd, const char *name, uint16_t vendor,
-- 
2.26.2

