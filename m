Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3D4452DE29
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 May 2022 22:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbiESUQN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 19 May 2022 16:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231567AbiESUPx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 19 May 2022 16:15:53 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D91C617F
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 May 2022 13:15:48 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id x143so6018234pfc.11
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 May 2022 13:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cceYVJX1UQXeFotD1td6P06oyvXPXpq1bSVgFwTMX20=;
        b=FoX/m6CuvTOk0eaeG/5T8mWCFlV2zjucA1ejMCrZS/t9J1DGM+V4S2buO+AQjc02sd
         CIx2XkMCC4UbD0obd9OTmxPVLVosE7BEWIzdYALqoEvtI8TevnMIES3uofBcmRIB5NG7
         Ru3rIQERY5MqL2azTHFfl8xnvBDbzbR8bG0djx/QJgHRY26vS/Pqg9FdmdXvwa3q6UQl
         Ez5pRNZovlazKLd7GOCXngLYbEkDX0EKnAGyjjOT3xGp9TpNiyYF7ZBjRpgICiRee5CD
         Yd1wJolayNGLlYMmSawI0bKmEs/9Ed+FOgmUgsv5Ds1gJk/B0LOOYJZsqHQXNjnpeNu1
         an+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cceYVJX1UQXeFotD1td6P06oyvXPXpq1bSVgFwTMX20=;
        b=uYCJ45x2n8v/J5FagcPOdeHgo94KsVN7JOwo8hjof+nSYfNuRhS1+ZIZjTFEIZmdbs
         HZziNlnXbYu24Ouf+j0Bc6liEdEnYCYGqw3ziCePNX3AuNmRGHmHmT0SW0B1FK6Keh1I
         RZvENyYKqp6QOcH63vv5LKQGML6N83qaqqwNP82vH6JuipeMwDXMZm2NOO0s9hSNoq9u
         YtfljUA2pCuFlZARa5LX0NRxoghbwD1zX1gHTNJ+jKfHLyTLlDU7Rd/4hwgXVqMwTWm3
         cBJtJUyfgPwHGYXA7xWu/eO3eGQHrG7zTOGnVR4AKflMKOiPL1jck+BZ2FHO9Ce5QBKO
         Ka/g==
X-Gm-Message-State: AOAM531WUeNTrM+iVzmYRgLtZkD5wQqRvenWviMmRw00IHeQUEwO6OWK
        Psc2sqmM71l0pctfM4wSbvSY/ThQYSM=
X-Google-Smtp-Source: ABdhPJyXqtDUSiTqUnDGQO9cAr9GghHIeCz8l3cZh5aS4yzmr1cO2VG8BwBR5/OKmkNHJjPpjiJMdw==
X-Received: by 2002:a63:63c7:0:b0:3f5:faf8:c45e with SMTP id x190-20020a6363c7000000b003f5faf8c45emr5528359pgb.234.1652991347106;
        Thu, 19 May 2022 13:15:47 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id y143-20020a626495000000b0050dc76281c7sm71621pfb.161.2022.05.19.13.15.46
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 13:15:46 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2] Bluetooth: MGMT: Fix uses of bitmap_from_u64
Date:   Thu, 19 May 2022 13:15:45 -0700
Message-Id: <20220519201545.2422259-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

bitmap_from_u64 expects at least 8 bytes to be declared since it doesn't
take any parameter regarding the number of bits causing the following
warnings:

In file included from include/linux/cpumask.h:12,
                 from include/linux/mm_types_task.h:14,
                 from include/linux/mm_types.h:5,
                 from include/linux/buildid.h:5,
                 from include/linux/module.h:14,
                 from net/bluetooth/mgmt.c:27:
In function 'bitmap_copy',
    inlined from 'bitmap_copy_clear_tail' at include/linux/bitmap.h:270:2,
    inlined from 'bitmap_from_u64' at include/linux/bitmap.h:622:2,
    inlined from 'set_device_flags' at net/bluetooth/mgmt.c:4534:4:
include/linux/bitmap.h:261:9: warning: 'memcpy' forming offset [4, 7] is
out of the bounds [0, 4] of object 'flags' with type
'long unsigned int[1]' [-Warray-bounds]
  261 |         memcpy(dst, src, len);
      |         ^~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/kasan-checks.h:5,
                 from include/asm-generic/rwonce.h:26,
                 from ./arch/arm/include/generated/asm/rwonce.h:1,
                 from include/linux/compiler.h:248,
                 from include/linux/build_bug.h:5,
                 from include/linux/container_of.h:5,
                 from include/linux/list.h:5,
                 from include/linux/module.h:12,
                 from net/bluetooth/mgmt.c:27:
net/bluetooth/mgmt.c: In function 'set_device_flags':
net/bluetooth/mgmt.c:4532:40: note: 'flags' declared here
 4532 |                         DECLARE_BITMAP(flags, __HCI_CONN_NUM_FLAGS);
      |                                        ^~~~~
include/linux/types.h:11:23: note: in definition of macro 'DECLARE_BITMAP'
   11 |         unsigned long name[BITS_TO_LONGS(bits)]
      |                       ^~~~

In order to fix the above this initializes a variable using
DECLARE_BITMAP with the current_flags and then uses bitmap_subset to
check if the flags being set are a subset of hdev->conn_flags that way
all the checks are performed using bitmap APIs and conversion to u32
only happen when really needed.

Fixes: a9a347655d22 ("Bluetooth: MGMT: Add conditions for setting HCI_CONN_FLAG_REMOTE_WAKEUP")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/mgmt.c | 45 +++++++++++++++++++-------------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 74937a834648..cd1b300b9be7 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -4476,9 +4476,16 @@ static int get_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
 
 static void device_flags_changed(struct sock *sk, struct hci_dev *hdev,
 				 bdaddr_t *bdaddr, u8 bdaddr_type,
-				 u32 supported_flags, u32 current_flags)
+				 unsigned long *flags)
 {
 	struct mgmt_ev_device_flags_changed ev;
+	u32 supported_flags, current_flags = 0;
+
+	bitmap_to_arr32(&supported_flags, hdev->conn_flags,
+			__HCI_CONN_NUM_FLAGS);
+
+	if (flags)
+		bitmap_to_arr32(&current_flags, flags, __HCI_CONN_NUM_FLAGS);
 
 	bacpy(&ev.addr.bdaddr, bdaddr);
 	ev.addr.type = bdaddr_type;
@@ -4495,19 +4502,15 @@ static int set_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
 	struct bdaddr_list_with_flags *br_params;
 	struct hci_conn_params *params;
 	u8 status = MGMT_STATUS_INVALID_PARAMS;
-	u32 supported_flags;
 	u32 current_flags = __le32_to_cpu(cp->current_flags);
+	DECLARE_BITMAP(flags, __HCI_CONN_NUM_FLAGS) = { current_flags };
 
 	bt_dev_dbg(hdev, "Set device flags %pMR (type 0x%x) = 0x%x",
-		   &cp->addr.bdaddr, cp->addr.type,
-		   __le32_to_cpu(current_flags));
+		   &cp->addr.bdaddr, cp->addr.type, current_flags);
 
-	bitmap_to_arr32(&supported_flags, hdev->conn_flags,
-			__HCI_CONN_NUM_FLAGS);
-
-	if ((supported_flags | current_flags) != supported_flags) {
-		bt_dev_warn(hdev, "Bad flag given (0x%x) vs supported (0x%0x)",
-			    current_flags, supported_flags);
+	if (bitmap_subset(hdev->conn_flags, flags, __HCI_CONN_NUM_FLAGS)) {
+		bt_dev_warn(hdev, "Bad flag given (0x%lx) vs supported (0x%lx)",
+			    *hdev->conn_flags, *flags);
 		goto done;
 	}
 
@@ -4519,7 +4522,8 @@ static int set_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
 							      cp->addr.type);
 
 		if (br_params) {
-			bitmap_from_u64(br_params->flags, current_flags);
+			bitmap_copy(br_params->flags, flags,
+				    __HCI_CONN_NUM_FLAGS);
 			status = MGMT_STATUS_SUCCESS;
 		} else {
 			bt_dev_warn(hdev, "No such BR/EDR device %pMR (0x%x)",
@@ -4529,10 +4533,6 @@ static int set_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
 		params = hci_conn_params_lookup(hdev, &cp->addr.bdaddr,
 						le_addr_type(cp->addr.type));
 		if (params) {
-			DECLARE_BITMAP(flags, __HCI_CONN_NUM_FLAGS);
-
-			bitmap_from_u64(flags, current_flags);
-
 			/* Devices using RPAs can only be programmed in the
 			 * acceptlist LL Privacy has been enable otherwise they
 			 * cannot mark HCI_CONN_FLAG_REMOTE_WAKEUP.
@@ -4546,7 +4546,7 @@ static int set_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
 				goto unlock;
 			}
 
-			bitmap_from_u64(params->flags, current_flags);
+			bitmap_copy(params->flags, flags, __HCI_CONN_NUM_FLAGS);
 			status = MGMT_STATUS_SUCCESS;
 
 			/* Update passive scan if HCI_CONN_FLAG_DEVICE_PRIVACY
@@ -4568,7 +4568,7 @@ static int set_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
 done:
 	if (status == MGMT_STATUS_SUCCESS)
 		device_flags_changed(sk, hdev, &cp->addr.bdaddr, cp->addr.type,
-				     supported_flags, current_flags);
+				     flags);
 
 	return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_SET_DEVICE_FLAGS, status,
 				 &cp->addr, sizeof(cp->addr));
@@ -7079,10 +7079,8 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 {
 	struct mgmt_cp_add_device *cp = data;
 	u8 auto_conn, addr_type;
-	struct hci_conn_params *params;
+	struct hci_conn_params *params = NULL;
 	int err;
-	u32 current_flags = 0;
-	u32 supported_flags;
 
 	bt_dev_dbg(hdev, "sock %p", sk);
 
@@ -7153,9 +7151,6 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 	} else {
 		params = hci_conn_params_lookup(hdev, &cp->addr.bdaddr,
 						addr_type);
-		if (params)
-			bitmap_to_arr32(&current_flags, params->flags,
-					__HCI_CONN_NUM_FLAGS);
 	}
 
 	err = hci_cmd_sync_queue(hdev, add_device_sync, NULL, NULL);
@@ -7164,10 +7159,8 @@ static int add_device(struct sock *sk, struct hci_dev *hdev,
 
 added:
 	device_added(sk, hdev, &cp->addr.bdaddr, cp->addr.type, cp->action);
-	bitmap_to_arr32(&supported_flags, hdev->conn_flags,
-			__HCI_CONN_NUM_FLAGS);
 	device_flags_changed(NULL, hdev, &cp->addr.bdaddr, cp->addr.type,
-			     supported_flags, current_flags);
+			     params ? params->flags : NULL);
 
 	err = mgmt_cmd_complete(sk, hdev->id, MGMT_OP_ADD_DEVICE,
 				MGMT_STATUS_SUCCESS, &cp->addr,
-- 
2.35.1

