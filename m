Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E21E6F0ED2
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Apr 2023 01:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344408AbjD0XOQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 Apr 2023 19:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344407AbjD0XOP (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 Apr 2023 19:14:15 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF51644A0
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 Apr 2023 16:14:09 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1a68f2345c5so71048335ad.2
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 Apr 2023 16:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682637248; x=1685229248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Zf1jMK3UJ9SfKs4kbWstHqgU/7a87nWIjklSePkN28=;
        b=OnNo1Q6YWVxmFrmHu28/csR4ckusSUBOsDEQaptHZ9juM5tmM4z7m+sco6tvYD121W
         Oq2xQe+y9VsKcYlg6M2laEq/EBmjaklRegJdWOe5rd5GpH6etPLfbxUBOpxqggqUHSVS
         niGPwfYd7Z232ztFE960DWFEhJd6bWfE2joeXSvX2WXT2+pQkUiNhsHkR4SJF4ayq0zA
         DFM+6ejxA7+JCxUdn0ax7RcDK8mBuBDEqbfvFFxGwx73m65Bi9wid72DVngnf32Qop7u
         Y/yfaUvL2SaFwixhLs5BzN+F1D6ajPW4DPmrcUGYXVlLc/BsVAo+1+EfBITFEXTXSa69
         LR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682637248; x=1685229248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Zf1jMK3UJ9SfKs4kbWstHqgU/7a87nWIjklSePkN28=;
        b=ACjoFemux/MWkZIDNfzP7XwPzShXI3vCmBuChIOJYJtWAzCPQQKdpDjJ5EKAUVAjMf
         AcJZMyvtzCxv4t3G6UhXVZwuN+PpQSN5c5dhoaoYkNr0oheLlFH8I1x8XpvnqzrhOiQw
         GL6GesVvsOgTv0tK0dgwDHpRZGTK6U/ptW4iKe8Wf2tRmOxYpdTAMfGzjihr0mcrZbgr
         WgJwcDPFaAQ81EH/mOvWMtp6vXzpWHwxdNnjlB7oGPckn4iTwtDakDWcdgOBQnqMXfi5
         bW6MxpzGYNjbCwremzQdIA6/UGYVQ9xnseOMnj5v4Y9tHBXzRIWAsNm272TQB1HMt/CA
         zjOA==
X-Gm-Message-State: AC+VfDzMHPOqtPoEwAKq038YdOHsI8IB3hUgmV4tTNolYjIkyN60rJNl
        yFL7Inl/PT7lAIptZN/nF1B5d/eI1zs=
X-Google-Smtp-Source: ACHHUZ4RyrmEV6/tTOn/9w7q1tTb7S7Xu3hEyPhTBG4jdD43cczMHM7OA3MwsiropFBgpTrfxrLPng==
X-Received: by 2002:a17:902:b10b:b0:1a6:983d:a1ec with SMTP id q11-20020a170902b10b00b001a6983da1ecmr2857099plr.26.1682637248370;
        Thu, 27 Apr 2023 16:14:08 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-59-129-171.hsd1.or.comcast.net. [71.59.129.171])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902aa4500b001a24cded097sm12112369plr.236.2023.04.27.16.14.05
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 16:14:06 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [BlueZ PATCH v3 8/9] shared/util: Fix runtime error
Date:   Thu, 27 Apr 2023 16:13:51 -0700
Message-Id: <20230427231352.576337-8-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427231352.576337-1-luiz.dentz@gmail.com>
References: <20230427231352.576337-1-luiz.dentz@gmail.com>
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

This fixes the following errors:

src/shared/util.c:271:2: runtime error: null pointer passed as argument
2, which is declared to never be null
---
 src/shared/util.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/shared/util.c b/src/shared/util.c
index d31daacc4b93..9a4a8d77abce 100644
--- a/src/shared/util.c
+++ b/src/shared/util.c
@@ -268,7 +268,8 @@ void *util_iov_push_mem(struct iovec *iov, size_t len, const void *data)
 	if (!p)
 		return NULL;
 
-	memcpy(p, data, len);
+	if (data)
+		memcpy(p, data, len);
 
 	return p;
 }
-- 
2.40.0

