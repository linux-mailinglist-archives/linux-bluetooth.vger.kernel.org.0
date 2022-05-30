Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A95537653
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 May 2022 10:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbiE3INE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 May 2022 04:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233367AbiE3INA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 May 2022 04:13:00 -0400
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1BF3764705
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 May 2022 01:12:54 -0700 (PDT)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-GIYGgpYFMjSzz1YaLsDptg-1; Mon, 30 May 2022 04:12:48 -0400
X-MC-Unique: GIYGgpYFMjSzz1YaLsDptg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CD3129AB45B;
        Mon, 30 May 2022 08:12:48 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.64.242.130])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D32D31410F36;
        Mon, 30 May 2022 08:12:45 +0000 (UTC)
From:   Gopal Tiwari <gopalkrishna.tiwari@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.dentz@gmail.com, gtiwari@redhat.com
Subject: [Bluez 10/13] Fixing use after free in src/device.c
Date:   Mon, 30 May 2022 13:42:06 +0530
Message-Id: <20220530081209.560465-11-gopalkrishna.tiwari@gmail.com>
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

Following traces reported by covirty tool

Error: USE_AFTER_FREE (CWE-416):
bluez-5.64/src/device.c:2962: path: Condition "!dbus_message_get_args(msg, NULL, 0 /* (int)0 */)", taking false branch.
bluez-5.64/src/device.c:2965: path: Condition "device->bonding", taking false branch.
bluez-5.64/src/device.c:2968: path: Condition "device->bredr_state.bonded", taking true branch.
bluez-5.64/src/device.c:2969: path: Falling through to end of if statement.
bluez-5.64/src/device.c:2977: path: Condition "state->bonded", taking false branch.
bluez-5.64/src/device.c:2983: path: Condition "agent", taking true branch.
bluez-5.64/src/device.c:2984: path: Falling through to end of if statement.
bluez-5.64/src/device.c:2990: path: Condition "agent", taking true branch.
bluez-5.64/src/device.c:3005: path: Condition "bdaddr_type != 0", taking true branch.
bluez-5.64/src/device.c:3006: path: Condition "!state->connected", taking true branch.
bluez-5.64/src/device.c:3006: path: Condition "btd_le_connect_before_pairing()", taking true branch.
bluez-5.64/src/device.c:3007: freed_arg: "device_connect_le" frees "device->bonding".
bluez-5.64/src/device.c:3007: path: Falling through to end of if statement.
bluez-5.64/src/device.c:3012: path: Falling through to end of if statement.
bluez-5.64/src/device.c:3017: path: Condition "err < 0", taking true branch.
bluez-5.64/src/device.c:3018: double_free: Calling "bonding_request_free" frees pointer "device->bonding" which has already been freed.

Signed-off-by: Gopal Tiwari <gtiwari@redhat.com>
---
 src/device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/device.c b/src/device.c
index 8dc12d026..a0e5d40db 100644
--- a/src/device.c
+++ b/src/device.c
@@ -2942,6 +2942,7 @@ static void bonding_request_free(struct bonding_req *bonding)
 		bonding->device->bonding = NULL;
 
 	g_free(bonding);
+	bonding = NULL;
 }
 
 static DBusMessage *pair_device(DBusConnection *conn, DBusMessage *msg,
-- 
2.26.2

