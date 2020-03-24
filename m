Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 902D6191A51
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Mar 2020 20:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgCXTtz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 24 Mar 2020 15:49:55 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40923 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726764AbgCXTty (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 24 Mar 2020 15:49:54 -0400
Received: by mail-ot1-f65.google.com with SMTP id e19so18295974otj.7
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Mar 2020 12:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=bCkULCzxw3/sGwWgG8WDnEOuqAHjuyKU9vXLvFr2QEg=;
        b=nF7aBq2MQpEjyuYdBbdhcKMcsqRVohyHQLFw6YQoUG7awADuW6Wtq4uAYib6hcNmq7
         Ro8yuJbbj1BqEI38hkGeJuznlGNTL3RIwQxh8S7wYHQJgNMt5S4oJPuZy412bkJedMyL
         DSU1VkPc0bI0AssIFmjFI21CzUaN3aOoHf9CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=bCkULCzxw3/sGwWgG8WDnEOuqAHjuyKU9vXLvFr2QEg=;
        b=lB85e4Df2WtfT99QYBDCfXzVPKjLGV0XkLXvFYluwhcCBbaVzajJord8eKl5/ef/ni
         3GCRRCQPrhUkzhLSzSKkS1E67kfcNshoEVMH28kimSyRJglgOYfL86gAB2iPTRVQgwU3
         uLB+lrKogI+GgJ7xjp96tGGpER51kBQqyqSvnvONxZgZMn8/l8DIlsd5gzjpBO0rQdHL
         5ih/8uqtfIj24THHxVBPN2PFZD96pgOvrz4YpoWe9ckBavTK74cTYSG1W5Rr8fi+gVtv
         YGwNurOEjuhJUROeuAGNbaVazpcm36R4OlNztiOlhk0GwTUFmpIY+bH0jJf3aIliTQ1m
         ZxJg==
X-Gm-Message-State: ANhLgQ2bli+8CC4tac9faatG2IGMzyLoEZCFdJc3a31nVJNuCrEgBayZ
        CP9ESw05o0fyUYe5wwFowZ+Anry845QG9BunRxhCiJtYPjI=
X-Google-Smtp-Source: ADFU+vsnDEdK+7Xg4JPEipFl0enJIOQP30g2FRXGqk3nRHYp4WK+hTIQWNq/aGW+b/TiFQEA2/K1oDvftjw81Vm8NSw=
X-Received: by 2002:a05:6830:1e25:: with SMTP id t5mr22029183otr.70.1585079393625;
 Tue, 24 Mar 2020 12:49:53 -0700 (PDT)
MIME-Version: 1.0
From:   Sonny Sasaka <sonnysasaka@chromium.org>
Date:   Tue, 24 Mar 2020 12:49:42 -0700
Message-ID: <CAOxioNmHcCTkc1MA6Zw8WTPBHCTpE9XZyzfOeuj97EP2NeBw=A@mail.gmail.com>
Subject: [PATCH] autopair: Fix compiler warning
To:     BlueZ <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

With clang, comparing an array with NULL generates a warning because the
value is always non-NULL. With maintainer mode enabled, this becomes a
compilation error.
---
 plugins/autopair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plugins/autopair.c b/plugins/autopair.c
index 043bd9b9d..3089430a8 100644
--- a/plugins/autopair.c
+++ b/plugins/autopair.c
@@ -75,7 +75,7 @@ static ssize_t autopair_pincb(struct btd_adapter *adapter,
         btd_device_get_product (device));

     /* The iCade shouldn't use random PINs like normal keyboards */
-    if (name != NULL && strstr(name, "iCade") != NULL)
+    if (strstr(name, "iCade") != NULL)
         return 0;

     /* This is a class-based pincode guesser. Ignore devices with an
-- 
2.17.1
