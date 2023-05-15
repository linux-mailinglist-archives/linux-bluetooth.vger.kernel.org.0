Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 618C9703F54
	for <lists+linux-bluetooth@lfdr.de>; Mon, 15 May 2023 23:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245444AbjEOVGA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 15 May 2023 17:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245437AbjEOVF7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 15 May 2023 17:05:59 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9822F93FC
        for <linux-bluetooth@vger.kernel.org>; Mon, 15 May 2023 14:05:58 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1a516fb6523so124500085ad.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 15 May 2023 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684184757; x=1686776757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8ePO2sjaQnIm9bbBHn0PowqDmPeO6nDpTMp2JxSNYk=;
        b=o29sxTaaz8qJOSWSxCzjeWtgm62Qe1ICWyQTCd8Z4aJF5X08pKumnWKgU9iZYBvp6/
         5q5qXktiMXzGdTgRFRm+iCEFMkmaVatemLdrf7xGYASvtWBt9zeqWeqpmxPjh+yMVJQI
         K5ilbqCA0wOw5Zg3aQDZE1TZUzIX/YWhzpuuR71z/x3hEdzylXy4WlKUU7bPggmsHxyq
         lfP7M7jWeziixs+NI/KH5rPFfR+swCY960O7sMElmPZbEn35UNoDo59KjLlRfodz/1uO
         RRgsrWs0RMMOuF6eK2YmxJHe6rRHNuNDuj6m4wN7yHUDut4pFWJJIIUs+vM5riYnS0F+
         XgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684184757; x=1686776757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8ePO2sjaQnIm9bbBHn0PowqDmPeO6nDpTMp2JxSNYk=;
        b=jhmiWJkAY8Xoc5DsM1MuCKu50ONHlMYAoJAJQ+IJwjD6zf5DvUSUEdsvbYNPBpS3rk
         AaEHWE0jOok2xWESDOFHZPeDf9OA49wbZg/L5fREaMu6tKC1Jb3LH/Mtv7mB3v/yhrFx
         vTZ4AMaT2NPAGFJ3YN2QMtPfKFL8kNZ+CfbmEKp5ui6yAcySWV27D+6OK0T4H2WtUGci
         Xm8EBfM2MEwJEWlmJJM4rMX+FKV0hGToK3I62AWZw8N5CCCzWtdFFje8vNElw950VtcR
         CpjdQwMT4xLjOhdRbsV+nMPTyv3osJ1WFP7qLbbkko8v4LJAkFAu62srlvDvR5M6whL8
         NLMg==
X-Gm-Message-State: AC+VfDziox7LP8xigUWW34wgyyypqMfuTTbX2GIUM5p59UeFwPw7qWum
        /Y5jkR5sx4b7Cb243REOL1W2KYT9w3s=
X-Google-Smtp-Source: ACHHUZ6tD7s1y5T3kLs/H4oAak8aI53MAJVrvCsblSEuu3XsRF8pFnNPtUKnO2RZaC6OyJsboFuMWA==
X-Received: by 2002:a17:902:c20c:b0:1ab:16d5:998 with SMTP id 12-20020a170902c20c00b001ab16d50998mr35325973pll.26.1684184757222;
        Mon, 15 May 2023 14:05:57 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-59-129-171.hsd1.or.comcast.net. [71.59.129.171])
        by smtp.gmail.com with ESMTPSA id jb4-20020a170903258400b001a04ff0e2eesm13990050plb.58.2023.05.15.14.05.55
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 14:05:56 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 7/7] plugin: Treat -ENOTSUP as -ENOSYS
Date:   Mon, 15 May 2023 14:05:45 -0700
Message-Id: <20230515210545.718701-7-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515210545.718701-1-luiz.dentz@gmail.com>
References: <20230515210545.718701-1-luiz.dentz@gmail.com>
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

If plugin .init returns -ENOTSUP treat it as the system doesn't
support the driver since that is the error returned by
btd_profile_register when experimental is disabled.
---
 src/plugin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/plugin.c b/src/plugin.c
index dd7b406c857b..80990f8c3c7e 100644
--- a/src/plugin.c
+++ b/src/plugin.c
@@ -186,7 +186,7 @@ start:
 
 		err = plugin->desc->init();
 		if (err < 0) {
-			if (err == -ENOSYS)
+			if (err == -ENOSYS || err == -ENOTSUP)
 				warn("System does not support %s plugin",
 							plugin->desc->name);
 			else
-- 
2.40.1

