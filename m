Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAF57CA9DE
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Oct 2023 15:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbjJPNkN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 16 Oct 2023 09:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233913AbjJPNkB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 16 Oct 2023 09:40:01 -0400
Received: from mail.sig21.net (mail.sig21.net [217.197.84.222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7623310F5
        for <linux-bluetooth@vger.kernel.org>; Mon, 16 Oct 2023 06:39:55 -0700 (PDT)
Received: from localhorst ([127.0.0.1])
         by mail.sig21.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
         (Exim 4.94.2)
        (envelope-from <michael.hunold@eu.panasonic.com>)
         id 1qsN8D-0004FR-6E ; Mon, 16 Oct 2023 14:55:37 +0200
From:   Michael Hunold <michael.hunold@eu.panasonic.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Michael Hunold <michael.hunold@eu.panasonic.com>
Subject: [PATCH 1/1] tools/hciattach: Increase timeout for TI-specific initialization
Date:   Mon, 16 Oct 2023 14:55:26 +0200
Message-Id: <20231016125526.749848-2-michael.hunold@eu.panasonic.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016125526.749848-1-michael.hunold@eu.panasonic.com>
References: <20231016125526.749848-1-michael.hunold@eu.panasonic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,T_SPF_PERMERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The call to hci_send_req() in the function brf_send_command_socket() in
bluez/tools/hciattach_ti.c uses a timeout value of 15 milliseconds which
seems to be too short for newer variants of the CC2564 chipset, for
example the CC2564C revision B.

During initialization of these newer variants the initialization always
stops at a certain point during the processing of the device-specific
init script.

Increasing this value makes everything work again for the CC2564C
revision B.

Signed-off-by: Michael Hunold <michael.hunold@eu.panasonic.com>
---
 tools/hciattach_ti.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hciattach_ti.c b/tools/hciattach_ti.c
index 24efceaa1..918db868b 100644
--- a/tools/hciattach_ti.c
+++ b/tools/hciattach_ti.c
@@ -241,7 +241,7 @@ static int brf_send_command_socket(int fd, struct bts_action_send *send_action)
 	rq.rparam = response;
 	rq.rlen   = sizeof(response);
 
-	if (hci_send_req(fd, &rq, 15) < 0) {
+	if (hci_send_req(fd, &rq, 100) < 0) {
 		perror("Cannot send hci command to socket");
 		return -1;
 	}
-- 
2.34.1

