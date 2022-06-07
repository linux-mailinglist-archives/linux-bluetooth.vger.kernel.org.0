Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEEE537647
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 May 2022 10:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbiE3IMe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 May 2022 04:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233180AbiE3IMa (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 May 2022 04:12:30 -0400
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9A34536E3E
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 May 2022 01:12:29 -0700 (PDT)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-CWPOlZH8MOauUSWExRM0Zw-1; Mon, 30 May 2022 04:12:23 -0400
X-MC-Unique: CWPOlZH8MOauUSWExRM0Zw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8A2B29ABA2A;
        Mon, 30 May 2022 08:12:22 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.64.242.130])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5752B1415100;
        Mon, 30 May 2022 08:12:19 +0000 (UTC)
From:   Gopal Tiwari <gopalkrishna.tiwari@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.dentz@gmail.com, gtiwari@redhat.com
Subject: [Bluez 02/13] Fixing memory leakage in appkey.c
Date:   Mon, 30 May 2022 13:41:58 +0530
Message-Id: <20220530081209.560465-3-gopalkrishna.tiwari@gmail.com>
In-Reply-To: <20220530081209.560465-1-gopalkrishna.tiwari@gmail.com>
References: <20220530081209.560465-1-gopalkrishna.tiwari@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Gopal Tiwari <gtiwari@redhat.com>

While performing the static analysis using the coverity tool found following memroy leak reports

bluez-5.64/mesh/appkey.c:143: leaked_storage: Variable "key" going out of scope leaks the storage it points to.

Error: RESOURCE_LEAK (CWE-772):
bluez-5.64/mesh/appkey.c:146: leaked_storage: Variable "key" going out of scope leaks the storage it points to.

Fixing them.

Signed-off-by: Gopal Tiwari <gtiwari@redhat.com>
---
 mesh/appkey.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mesh/appkey.c b/mesh/appkey.c
index 5088a1812..52fed8c31 100644
--- a/mesh/appkey.c
+++ b/mesh/appkey.c
@@ -139,11 +139,15 @@ bool appkey_key_init(struct mesh_net *net, uint16_t net_idx, uint16_t app_idx,
 	key->net_idx = net_idx;
 	key->app_idx = app_idx;
 
-	if (key_value && !set_key(key, app_idx, key_value, false))
+	if (key_value && !set_key(key, app_idx, key_value, false)) {
+		appkey_key_free(key);
 		return false;
+	}
 
-	if (new_key_value && !set_key(key, app_idx, new_key_value, true))
+	if (new_key_value && !set_key(key, app_idx, new_key_value, true)) {
+		appkey_key_free(key);
 		return false;
+	}
 
 	l_queue_push_tail(app_keys, key);
 
-- 
2.26.2

