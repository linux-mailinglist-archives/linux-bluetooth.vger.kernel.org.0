Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3724E6E9A
	for <lists+linux-bluetooth@lfdr.de>; Fri, 25 Mar 2022 08:14:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347892AbiCYHPs (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 25 Mar 2022 03:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355247AbiCYHPn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 25 Mar 2022 03:15:43 -0400
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B19B7167
        for <linux-bluetooth@vger.kernel.org>; Fri, 25 Mar 2022 00:14:07 -0700 (PDT)
X-QQ-mid: bizesmtp85t1648192437tbb2lv33
Received: from localhost.localdomain ( [113.57.152.160])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Fri, 25 Mar 2022 15:13:52 +0800 (CST)
X-QQ-SSF: 01400000002000C0D000B00A0000000
X-QQ-FEAT: 0VgNaGdhy9h/vvhmSayiJMvHF4RAw4IxiN7AjmtTUyU0KL19k9bhE4d8qOTWV
        TcsFhAve3u17L7UPZ2bvyw147AXUal+AR8NS6nusEu1LoNTz/BrN34bkM2zbJG74VDCCfwX
        /jIN795tE5pHXLRWoV9L+gZTooQN6tp0HxqkK+uIW6bshTnjaBAfn2MYPE/gJc0qg2bc3LK
        HM8gKv2gbuPJ+FWeRDawpCXKBv5zRDC3jgRCGZT6MOEmtBgcAkz9cFTWhcNUU/NXFX8+AFt
        69cn5VXmSXe1MGvbt3NDl8hfaovXgaWnyRSZlW4QQQF+ZWOUlWf4HDhnC6Gz/Hmr148DRwQ
        TJdvUAh3wtZF7Wd+Z9ZZvfvNRteWw==
X-QQ-GoodBg: 2
From:   xinpeng wang <wangxinpeng@uniontech.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     xinpeng wang <wangxinpeng@uniontech.com>
Subject: [PATCH v2] obexd: Fix can't receive small files sent by windows
Date:   Fri, 25 Mar 2022 15:13:50 +0800
Message-Id: <20220325071350.26668-1-wangxinpeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When obexd receives a file, it parses the filename and other parameters
when processing the packet for the first time, store filename in
obex_session and emit the dbus signal, The signal will be pending first.
then when this file is received, transfer_complete reset obex_session
is called.

When using a computer with Windows 10 installed to send a file to bluez,
obexd will read the data through read_stream; if it is a small file, the
data processed for the first time is marked as final, and transfer_complete
reset obex_session will be called when the data is processed for the first
time. At this point, the dbus signal is still pending, and the dbus method
that requests the file path has not been processed. This will cause the upper
application to not be able to transfer files from the cache directory to the
directory specified by the user.

To solve this problem, emit Filename's dbus signal and force it when
status=active.

Ways to reproduce the problem:
1. Use the computer with windows 10 installed to send a small file to the
computer with ubuntu installed;
2. file size < 10k;
3. After sending, in most cases, the file is located in the ~/.cache/obexd/
directory. Normally, the file should be located in the ~/Download directory.

To fix this, after applying this commit, it also needs to be modified by
the upper-level application. Modified to read Filename from dbus signal if
there is Filename in dbus signal. Otherwise, use the dbus method to request
Filename.

Signed-off-by: xinpeng wang <wangxinpeng@uniontech.com>
---
v2: Add the steps to reproduce the bug in the submission information.

 obexd/src/manager.c | 6 +++++-
 obexd/src/obex.c    | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/obexd/src/manager.c b/obexd/src/manager.c
index 01741fe62..2c180dc44 100644
--- a/obexd/src/manager.c
+++ b/obexd/src/manager.c
@@ -533,8 +533,12 @@ void manager_emit_transfer_property(struct obex_transfer *transfer,
 void manager_emit_transfer_started(struct obex_transfer *transfer)
 {
 	transfer->status = TRANSFER_STATUS_ACTIVE;
+	if (!transfer->path)
+		return;
 
-	manager_emit_transfer_property(transfer, "Status");
+	g_dbus_emit_property_changed_full(connection, transfer->path,
+					TRANSFER_INTERFACE, "Status",
+					G_DBUS_PROPERTY_CHANGED_FLAG_FLUSH);
 }
 
 static void emit_transfer_completed(struct obex_transfer *transfer,
diff --git a/obexd/src/obex.c b/obexd/src/obex.c
index 3a68fd66c..c0d9e160a 100644
--- a/obexd/src/obex.c
+++ b/obexd/src/obex.c
@@ -720,6 +720,7 @@ int obex_put_stream_start(struct obex_session *os, const char *filename)
 		manager_emit_transfer_property(os->service_data, "Size");
 
 	os->path = g_strdup(filename);
+	manager_emit_transfer_property(os->service_data, "Filename");
 
 	return 0;
 }
-- 
2.20.1



