Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 217AF67A3D3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Jan 2023 21:26:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbjAXU0q (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 24 Jan 2023 15:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233898AbjAXU0e (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 24 Jan 2023 15:26:34 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5364F86C
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Jan 2023 12:26:25 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id m11so4446605pji.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Jan 2023 12:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPnHCmRMLf6IgFM07niQU0RihdYqnsg77B8pitYt8tE=;
        b=c1RjNYOsHSu/Y7jnv1qN6QjQjZeKuEsNZqyjLpIGSimOLTJfpvzsOsCpUSzb5j9jtX
         Nq0vFwoDFU/IFjzHDCJ0f3YvcPoXrs5MgtbjAULnhB63pu7DsDW6QI9gtxipJFFmakrq
         TmIaGn0IFcEN2G7v7g5jiKBqqtzJv0Qub6E6ekVRzi/2lr10FSH43stjuJdiZZA9UtLQ
         KjdipLQcQrF5sBbUfOFi2f3snl3RCvwSqZsCzohyTh+5r7SIBX2vjDoA286wzBvMdw2I
         8MMzLpe2iFSTALRoR0t+MILERpvkvdV2PmueQ9XrcRgC0e7jI5cJH7bJ5e4oZROaI/xF
         4K7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPnHCmRMLf6IgFM07niQU0RihdYqnsg77B8pitYt8tE=;
        b=LMHAUIjyvrqSfY1e1UeSL9kvNGyfsZNwdYsgUyc7ucZURbXnKASzq9Pwy7fUunT3q+
         flsfs0UKMT3UK9l51/dOnVngdP1HRDe8m/ZoKBNY8BO0C9LtJCJJWoX9JjVyCMbyOh45
         9Kf02f6FuEazcrsH1tqaIjnVOaaKqC7olKfMlCATi3peYxaE2+4I15N87tEL97+b4uG9
         RUAk8AVbP9iz40Rqfk9ST73R2KGU+HJ3+p9p+qJ+fBa7ev1/e2pHTZDK/B+6E1ZTyQnt
         QJ2QC3sFJW2LIbyzbrKIvg+rV0kRFyYXcbvpLHlPR0nP7yq2uGZvQkJxTrCzFsKU4jYa
         /VTw==
X-Gm-Message-State: AFqh2kpETEVrMQ8Bc/PixW+r2sAsN+nJ8M6dP8Uu/+RvQ8u+AWx9RquP
        E1R6V06+h48fTZmkp5kJRDN4kjZEoEjxLQ==
X-Google-Smtp-Source: AMrXdXttz3CSMPp+fkrKkIY7DC8r+6h4GsfdVn0THfPE/60YVfJzwRYnefjKt9cJYbSo0gQQcs7Zsg==
X-Received: by 2002:a17:903:230f:b0:195:f06f:84fc with SMTP id d15-20020a170903230f00b00195f06f84fcmr18797821plh.40.1674591984164;
        Tue, 24 Jan 2023 12:26:24 -0800 (PST)
Received: from fedora.. (97-126-124-199.tukw.qwest.net. [97.126.124.199])
        by smtp.gmail.com with ESMTPSA id ju21-20020a170903429500b0019600b78487sm2108099plb.33.2023.01.24.12.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 12:26:23 -0800 (PST)
From:   Brian Gix <brian.gix@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Brian Gix <brian.gix@intel.com>
Subject: [PATCH BlueZ v4 04/13] mesh: Rename parameter list per crypto usage
Date:   Tue, 24 Jan 2023 12:26:07 -0800
Message-Id: <20230124202616.310544-5-brian.gix@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230124202616.310544-1-brian.gix@gmail.com>
References: <20230124202616.310544-1-brian.gix@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Brian Gix <brian.gix@intel.com>

The derived key generated by the "nkpk" salt and network master key is
used to create Private Beacons as of Mesh Profile Specification v1.1
---
 mesh/crypto.c | 4 ++--
 mesh/crypto.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/mesh/crypto.c b/mesh/crypto.c
index 668d16877..3754cb012 100644
--- a/mesh/crypto.c
+++ b/mesh/crypto.c
@@ -251,9 +251,9 @@ bool mesh_crypto_nkbk(const uint8_t n[16], uint8_t beacon_key[16])
 	return crypto_128(n, "nkbk", beacon_key);
 }
 
-bool mesh_crypto_nkpk(const uint8_t n[16], uint8_t proxy_key[16])
+bool mesh_crypto_nkpk(const uint8_t n[16], uint8_t private_key[16])
 {
-	return crypto_128(n, "nkpk", proxy_key);
+	return crypto_128(n, "nkpk", private_key);
 }
 
 bool mesh_crypto_k3(const uint8_t n[16], uint8_t out64[8])
diff --git a/mesh/crypto.h b/mesh/crypto.h
index c31abbbbd..55789886e 100644
--- a/mesh/crypto.h
+++ b/mesh/crypto.h
@@ -26,7 +26,7 @@ bool mesh_aes_ecb_one(const uint8_t key[16],
 			const uint8_t plaintext[16], uint8_t encrypted[16]);
 bool mesh_crypto_nkik(const uint8_t network_key[16], uint8_t identity_key[16]);
 bool mesh_crypto_nkbk(const uint8_t network_key[16], uint8_t beacon_key[16]);
-bool mesh_crypto_nkpk(const uint8_t network_key[16], uint8_t proxy_key[16]);
+bool mesh_crypto_nkpk(const uint8_t network_key[16], uint8_t private_key[16]);
 bool mesh_crypto_identity(const uint8_t net_key[16], uint16_t addr,
 							uint8_t id[16]);
 bool mesh_crypto_beacon_cmac(const uint8_t encryption_key[16],
-- 
2.39.1

