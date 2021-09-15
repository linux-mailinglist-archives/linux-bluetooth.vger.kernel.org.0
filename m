Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F5C40CC94
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Sep 2021 20:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbhIOSc7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Sep 2021 14:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhIOSc6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Sep 2021 14:32:58 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B871C061574
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Sep 2021 11:31:39 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id g184so3578513pgc.6
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Sep 2021 11:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AakUyIouEa2A19NyFf2YgLxre/KvVpfpai7uIXPumLU=;
        b=GkUuw3VB3Gv5BHkZ7ogzYQwSuan8d5lToGxx92OVYNPdz8stB8/9RPGA9uau3DCha9
         RvGxtu5ZAfKOuLEzd094OJzlmOk5j88+OCnaMFDKBEl/cZj1WQv1l1VVVxgpheoY1Ci+
         GGrU+6tBp+fLpT2njscENPttYa7yU3+Dje2dQ0VfvmOWXJtLHyyRIEQ37bzCc5Sqx2dC
         bUhLNBPdr1fNid8N5LbsixA0o904Zvv8La3p2yP64P7MdoCHm1rmNaZ+8QzsYoyA8WMn
         awJhIWU71jiE1+JS6iQoY2kmgo2+Nqnzp6zZF9ihiaIVDCfe9IoYckfKagpU17XRGACl
         eJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AakUyIouEa2A19NyFf2YgLxre/KvVpfpai7uIXPumLU=;
        b=UaH0yTuGkzEsS862KJoFoKmUNuerxCoJarexm06zK2BcT98pIw4yKqNM1lz3ROxYtE
         wbsPYsI0GTtEIWoLkXPVx0I99hZdYlflzSxj6F+RhVYirOGc1/541kRhSn3FqTJGNW3S
         1F06z163eWRGf2ZNpo+727cVviNfm474H+QqZyE7dOhE9cfbYPvGhBrAJSloljzDv/id
         SQc5PdGHSl2Y+K4jwXn/26hbARF4xfrE7uahIwfQ2oRTjBwkJ0mhFhWTj8Sq6TcIzMtJ
         /TQsPeK5xWUMkz4zx30mdI5pNkassf9+nKkEdoZWNYLXVeYLs63voRYpQY8GzL/m3/kg
         /LfQ==
X-Gm-Message-State: AOAM532v4dxbpldIX/S9HPtN8BtkxoOUyaME4gFslO/Um78e4qMh9XOV
        PCI6LplbEuC3/WaohQg4y5+rwR9s2VQ=
X-Google-Smtp-Source: ABdhPJwZtGVAMA0B04eMbxVKZXhKLUVjtb1pK5ZhF2rq/yrvyCwIq68IQEZ3EJpmWXSrMBs7GE0zBw==
X-Received: by 2002:a05:6a00:c81:b029:30e:21bf:4c15 with SMTP id a1-20020a056a000c81b029030e21bf4c15mr857647pfv.70.1631730698760;
        Wed, 15 Sep 2021 11:31:38 -0700 (PDT)
Received: from han1-NUC8i7BEH.hsd1.or.comcast.net ([2601:1c0:6a01:d830:daed:9e32:fa47:fad2])
        by smtp.gmail.com with ESMTPSA id y13sm578681pfb.115.2021.09.15.11.31.37
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 11:31:38 -0700 (PDT)
From:   Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [DNM PATCH v2] Build: Test patch - Do Not Merge
Date:   Wed, 15 Sep 2021 11:31:36 -0700
Message-Id: <20210915183136.384103-1-hj.tedd.an@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

Do Not Merge this path.
This is a test patch to trigger the CI test.
---
 README | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/README b/README
index 3dc226ff1..1d3eb20eb 100644
--- a/README
+++ b/README
@@ -1,3 +1,5 @@
+
+
 BlueZ - Bluetooth protocol stack for Linux
 ******************************************
 
-- 
2.25.1

