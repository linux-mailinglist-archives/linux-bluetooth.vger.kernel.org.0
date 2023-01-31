Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7BF5682072
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 Jan 2023 01:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbjAaAMt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Jan 2023 19:12:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjAaAMs (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Jan 2023 19:12:48 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F95A1A947
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Jan 2023 16:12:46 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id m11so12704425pji.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Jan 2023 16:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vyzKrEbDB2xWI/28NRdzcFkXOmOLjuNarCX8LU0sVS4=;
        b=LZ/PUJ/PEqEXqNA9UtK4BKyCGHLFJov8CwoJbVkgttfi1HPqI9gHIGET10yHL9ci/h
         dsvENO/1p6T6eINfPpUvZ+euF7/5Pfgurd6t5kLaqTX+V0yy1D4+EeE6By1896wHwTNK
         fmSz1atXt051fBNuZIInxZnoLuHDGfKkRNwaMeyEH54pr3JGLrIflkn234luLaVUm4KU
         +QvYUl1cUT/DiCnntpZA8SywDTcqWPIxd2TMUQ/XTCWkwrJngj1vuromvv6ts9+tFPuJ
         73C9CMdWFAMR96w7pHLVz/WO5sFs5IjYCaaQSmUSZo1lODLboD9B9Yp5Z0MHexMdGBVd
         Z/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyzKrEbDB2xWI/28NRdzcFkXOmOLjuNarCX8LU0sVS4=;
        b=V5lsPU0YcSDOXkXqoa4ibQMVC0CEMIyMBGdOWYxMR5WmU7u9EwUzKZgCV8NQu8frL6
         6HKR1Bp4/MTF5/Me61NPME+k4MQEPcdcatrV/ZX2BuAqngghN4k96QFnZNzt1EkaC3uN
         M4j4BU59asPTKjTyeLOl9K9+Bw8chI4zgePx40bbsv7kZL2jymrjz14h3fGwp4UiM8fQ
         zUEy+wTnhUUGEUyL89jf/BWTg2RfyMfCxZxiZ8P8rK8qAo8Flp1aIY5eEXNrqTgynZwT
         WOAzp77ZgH75rk0tfe5XR9Kzp111WOkzfFK6AQx93RYjse8T5j5tJt6rhdjfcClsABOQ
         6Qhg==
X-Gm-Message-State: AO0yUKVzGEx+JKilaokjrzeVCwrXKTP3dI3BQIH04Y6omg5CXqD5JG0Z
        f/IeKeBF0lCgZelJBHEcnjgx82ZFE4/IPg==
X-Google-Smtp-Source: AK7set//0x3SLjKDLBl+9R9sjKPK+n7b1deUaGfXslJQOPKSJgAj9uYoLJboi3NZc+RocTlWkr+ZSQ==
X-Received: by 2002:a17:902:dacb:b0:196:3bbb:e9e3 with SMTP id q11-20020a170902dacb00b001963bbbe9e3mr23217633plx.28.1675123964986;
        Mon, 30 Jan 2023 16:12:44 -0800 (PST)
Received: from fedora.. (97-126-124-199.tukw.qwest.net. [97.126.124.199])
        by smtp.gmail.com with ESMTPSA id bc7-20020a170902930700b001960283eca8sm8330371plb.94.2023.01.30.16.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 16:12:44 -0800 (PST)
From:   Brian Gix <brian.gix@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Brian Gix <brian.gix@gmail.com>
Subject: [PATCH BlueZ v2] AUTHORS: modify Brian Gix email address
Date:   Mon, 30 Jan 2023 16:12:41 -0800
Message-Id: <20230131001241.95001-1-brian.gix@gmail.com>
X-Mailer: git-send-email 2.39.1
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

---
 AUTHORS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/AUTHORS b/AUTHORS
index 5d2d09688..879f97f99 100644
--- a/AUTHORS
+++ b/AUTHORS
@@ -53,7 +53,7 @@ Daniel Orstadius <daniel.orstadius@gmail.com>
 Anderson Briglia <anderson.briglia@openbossa.org>
 Anderson Lizardo <anderson.lizardo@openbossa.org>
 Bruna Moreira <bruna.moreira@openbossa.org>
-Brian Gix <brian.gix@intel.com>
+Brian Gix <brian.gix@gmail.com>
 Andre Guedes <andre.guedes@openbossa.org>
 Sheldon Demario <sheldon.demario@openbossa.org>
 Lucas De Marchi <lucas.demarchi@profusion.mobi>
-- 
2.39.1

