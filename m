Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE08D3EB524
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Aug 2021 14:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240202AbhHMMUV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 13 Aug 2021 08:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240175AbhHMMUV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 13 Aug 2021 08:20:21 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2283C061756
        for <linux-bluetooth@vger.kernel.org>; Fri, 13 Aug 2021 05:19:54 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id m4-20020a170902db04b029012d5b1d78d5so5969106plx.15
        for <linux-bluetooth@vger.kernel.org>; Fri, 13 Aug 2021 05:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=PiBtj+MsTnuwJd4EJgx4Ti6LcY37TLBitjCaDjrgtwY=;
        b=BZncDvQkFO0wHxVVsVuRoAHPsWG68XjvhRDIPO5FNYTY2pJGMdeA1M2JcjU2I77BuE
         mdHKNuIFx3eSBz3bIQzdaPlkMnZ5mJgJhFMy6X3V48L8pO17rCZ5egInWl2jOO/ORuVY
         spUbHQsZsya3u0kXfjyQ+ONGoiu5H8Y9iizA5xQDILaJi+V53JcDS4oEmbFooOD5ikCW
         WpD6QV1l6+5pCl4tVEaWEF4ak580/YHFuXNygq6X2gx2iI0V/m2cP4GoPYh16NyfEhXt
         eDKE0j3lg0N/e3PCMXwazQObiXRsY2dTZJ1Tj1spjC2Xrb6fyic4JZ8mi+Hn2BTjDxJT
         orkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=PiBtj+MsTnuwJd4EJgx4Ti6LcY37TLBitjCaDjrgtwY=;
        b=P+cLhzrq97fcdNCGxJTrHfLaIWRnStO++eV7SI+x3djxKq7fFFEyT4XI6b8j/M1Q7g
         V0+rPkwTZiJXExZTCCOAuFCNjDU0/vL7HY1QOVUBQUWtc3Uj86LqsULRvrMDFSCpqjKq
         sS88UFnnj9s8MIjR+lwzLa8zimgQDwOk5DpKFA3SWNGQZ/zOHTXRJOgMvDkD1BJNCjOo
         obQaKbmYKsyLKgafW/oITfS1SjBznTvbrPGVA33RpI4GGw479ctOIHaDo7mT5k0nGw5+
         /yNeakhQfUtfICPZA3x49rn9+vhjSEfoHptxClefWjMrKlfIoNAgJxZaSbmM5oPdvsDL
         ZKyg==
X-Gm-Message-State: AOAM533jLu3+WpCUYThJ60Ypi8m2kwLuJhw+MAZ6PJPbD8xmzzK/cAWB
        cJJfWfvVKamgzl/ZcZBaKPZCczvG/ewcaEt1bdIQRxpHM5/ZvtuIDKjFeJ4i8fu9VA14uz04xub
        mvJf/tD/jbyt97xMtOg70GBrGtPC+tv9M9dAeh+3IN7MLTYkpwoJqIX3oNIku6bBiQ689HwL68w
        9b
X-Google-Smtp-Source: ABdhPJy5a08TQ3i2smtXTW6wf3eFCsq3/vEc+ADXRw3j9fQrCB/lJjg/PdEPAI6VZGMzDXv8JYV9TT63zt4q
X-Received: from apusaka-p920.tpe.corp.google.com ([2401:fa00:1:10:b68c:ff41:db76:21e9])
 (user=apusaka job=sendgmr) by 2002:a17:90b:4504:: with SMTP id
 iu4mr2430509pjb.209.1628857194016; Fri, 13 Aug 2021 05:19:54 -0700 (PDT)
Date:   Fri, 13 Aug 2021 20:17:50 +0800
In-Reply-To: <20210813121848.3686029-1-apusaka@google.com>
Message-Id: <20210813201256.Bluez.5.I598f2d795e09d5ffb1ba6cb16c2baef2ac595e8e@changeid>
Mime-Version: 1.0
References: <20210813121848.3686029-1-apusaka@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [Bluez PATCH 05/62] core: Inclusive language for rfcomm
From:   Archie Pusaka <apusaka@google.com>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

"central" is preferred, as reflected in the BT core spec 5.3.
---

 btio/btio.c    | 10 +++++-----
 lib/rfcomm.h   |  2 +-
 tools/rctest.c |  4 ++--
 tools/rfcomm.c |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/btio/btio.c b/btio/btio.c
index 9c4601e6f8..ce958bdd09 100644
--- a/btio/btio.c
+++ b/btio/btio.c
@@ -394,13 +394,13 @@ static int rfcomm_set_master(int sock, int master)
 		return -errno;
 
 	if (master) {
-		if (flags & RFCOMM_LM_MASTER)
+		if (flags & RFCOMM_LM_CENTRAL)
 			return 0;
-		flags |= RFCOMM_LM_MASTER;
+		flags |= RFCOMM_LM_CENTRAL;
 	} else {
-		if (!(flags & RFCOMM_LM_MASTER))
+		if (!(flags & RFCOMM_LM_CENTRAL))
 			return 0;
-		flags &= ~RFCOMM_LM_MASTER;
+		flags &= ~RFCOMM_LM_CENTRAL;
 	}
 
 	if (setsockopt(sock, SOL_RFCOMM, RFCOMM_LM, &flags, sizeof(flags)) < 0)
@@ -1345,7 +1345,7 @@ static gboolean rfcomm_get(int sock, GError **err, BtIOOption opt1,
 				return FALSE;
 			}
 			*(va_arg(args, gboolean *)) =
-				(flags & RFCOMM_LM_MASTER) ? TRUE : FALSE;
+				(flags & RFCOMM_LM_CENTRAL) ? TRUE : FALSE;
 			break;
 		case BT_IO_OPT_HANDLE:
 			if (rfcomm_get_info(sock, &handle, dev_class) < 0) {
diff --git a/lib/rfcomm.h b/lib/rfcomm.h
index 0347ddc367..ab1df888c2 100644
--- a/lib/rfcomm.h
+++ b/lib/rfcomm.h
@@ -38,7 +38,7 @@ struct rfcomm_conninfo {
 };
 
 #define RFCOMM_LM	0x03
-#define RFCOMM_LM_MASTER	0x0001
+#define RFCOMM_LM_CENTRAL	0x0001
 #define RFCOMM_LM_AUTH		0x0002
 #define RFCOMM_LM_ENCRYPT	0x0004
 #define RFCOMM_LM_TRUSTED	0x0008
diff --git a/tools/rctest.c b/tools/rctest.c
index 7d688691c4..034ae167b2 100644
--- a/tools/rctest.c
+++ b/tools/rctest.c
@@ -203,7 +203,7 @@ static int do_connect(const char *svr)
 	/* Set link mode */
 	opt = 0;
 	if (master)
-		opt |= RFCOMM_LM_MASTER;
+		opt |= RFCOMM_LM_CENTRAL;
 	if (auth)
 		opt |= RFCOMM_LM_AUTH;
 	if (encr)
@@ -294,7 +294,7 @@ static void do_listen(void (*handler)(int sk))
 	/* Set link mode */
 	opt = 0;
 	if (master)
-		opt |= RFCOMM_LM_MASTER;
+		opt |= RFCOMM_LM_CENTRAL;
 	if (auth)
 		opt |= RFCOMM_LM_AUTH;
 	if (encr)
diff --git a/tools/rfcomm.c b/tools/rfcomm.c
index 8e1db8ebaa..7ad7ca5ad6 100644
--- a/tools/rfcomm.c
+++ b/tools/rfcomm.c
@@ -435,7 +435,7 @@ static void cmd_listen(int ctl, int dev, bdaddr_t *bdaddr, int argc, char **argv
 
 	lm = 0;
 	if (master)
-		lm |= RFCOMM_LM_MASTER;
+		lm |= RFCOMM_LM_CENTRAL;
 	if (auth)
 		lm |= RFCOMM_LM_AUTH;
 	if (encryption)
-- 
2.33.0.rc1.237.g0d66db33f3-goog

