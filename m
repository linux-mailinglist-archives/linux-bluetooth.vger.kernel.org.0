Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0ADD538C27
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 May 2022 09:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244585AbiEaHmP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 31 May 2022 03:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244574AbiEaHmC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 31 May 2022 03:42:02 -0400
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B22431583F
        for <linux-bluetooth@vger.kernel.org>; Tue, 31 May 2022 00:41:45 -0700 (PDT)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-UNdZwoqWMdi7UZXAgr4LGg-1; Tue, 31 May 2022 03:41:43 -0400
X-MC-Unique: UNdZwoqWMdi7UZXAgr4LGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B8993810D44;
        Tue, 31 May 2022 07:41:43 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.64.242.153])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 446961410DDB;
        Tue, 31 May 2022 07:41:40 +0000 (UTC)
From:   Gopal Tiwari <gopalkrishna.tiwari@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.dentz@gmail.com, gtiwari@redhat.com
Subject: [Bluez V2 06/13] Fixing leaked_handle in create-image.c
Date:   Tue, 31 May 2022 13:11:10 +0530
Message-Id: <20220531074117.610321-7-gopalkrishna.tiwari@gmail.com>
In-Reply-To: <20220531074117.610321-1-gopalkrishna.tiwari@gmail.com>
References: <20220531074117.610321-1-gopalkrishna.tiwari@gmail.com>
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

While performing static tool analysis using coverity found following 
reports for resouse leak

bluez-5.64/tools/create-image.c:124: leaked_storage: Variable "map" 
going out of scope leaks the storage it points to.

Signed-off-by: Gopal Tiwari <gtiwari@redhat.com>
---
 tools/create-image.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/create-image.c b/tools/create-image.c
index aba940da7..90cd87315 100644
--- a/tools/create-image.c
+++ b/tools/create-image.c
@@ -97,12 +97,13 @@ static void write_block(FILE *fp, const char *pathname, unsigned int ino,
 
 	map = mmap(NULL, st.st_size, PROT_READ, MAP_SHARED, fd, 0);
 	if (!map || map == MAP_FAILED) {
-		close(fd);
-		fd = -1;
 		map = NULL;
 		st.st_size = 0;
         }
 
+	close(fd);
+	fd = -1;
+
 done:
 	fprintf(fp, HDR_FMT, HDR_MAGIC, ino, mode, 0, 0, 1, 0,
 		(uintmax_t) st.st_size, 0, 0, 0, 0, namelen + 1, 0, name);
@@ -117,9 +118,7 @@ done:
 		pad = 3 - ((st.st_size + 3) % 4);
 		for (i = 0; i < pad; i++)
 			fputc(0, fp);
-
 		munmap(map, st.st_size);
-		close(fd);
 	}
 }
 
-- 
2.26.2

