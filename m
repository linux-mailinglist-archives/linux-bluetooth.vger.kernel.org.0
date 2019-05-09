Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7EC189E1
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 May 2019 14:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfEIMhw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 May 2019 08:37:52 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:41467 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbfEIMhw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 May 2019 08:37:52 -0400
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9927E10000A;
        Thu,  9 May 2019 12:37:50 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 6/8] android/avrcp-lib: Fix unaligned struct access
Date:   Thu,  9 May 2019 14:37:44 +0200
Message-Id: <20190509123746.8396-6-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509123746.8396-1-hadess@hadess.net>
References: <20190509123746.8396-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

android/avrcp-lib.c: In function ‘get_element_attributes’:
android/avrcp-lib.c:967:24: error: taking address of packed member of ‘struct get_element_attributes_req’ may result in an unaligned pointer value [-Werror=address-of-packed-member]
  967 |  if (!parse_attributes(* (&req->attrs), params_len - sizeof(*req),
      |                        ^~~~~~~~~~~~~~~
---
 android/avrcp-lib.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/android/avrcp-lib.c b/android/avrcp-lib.c
index 2c874952c..21d01955d 100644
--- a/android/avrcp-lib.c
+++ b/android/avrcp-lib.c
@@ -927,14 +927,15 @@ static ssize_t get_play_status(struct avrcp *session, uint8_t transaction,
 							player->user_data);
 }
 
-static bool parse_attributes(uint32_t *params, uint16_t params_len,
-					uint8_t number, uint32_t *attrs)
+static bool parse_attributes(struct get_element_attributes_req *req,
+					uint16_t params_len, uint8_t number,
+					uint32_t *attrs)
 {
 	int i;
 
 	for (i = 0; i < number && params_len >= sizeof(*attrs); i++,
 					params_len -= sizeof(*attrs)) {
-		attrs[i] = be32_to_cpu(params[i]);
+		attrs[i] = be32_to_cpu(req->attrs[i]);
 
 		if (attrs[i] == AVRCP_MEDIA_ATTRIBUTE_ILLEGAL ||
 				attrs[i] > AVRCP_MEDIA_ATTRIBUTE_LAST)
@@ -964,7 +965,7 @@ static ssize_t get_element_attributes(struct avrcp *session,
 	if (!params || params_len < sizeof(*req))
 		return -EINVAL;
 
-	if (!parse_attributes(req->attrs, params_len - sizeof(*req),
+	if (!parse_attributes(req, params_len - sizeof(*req),
 							req->number, attrs))
 		return -EINVAL;
 
-- 
2.21.0

