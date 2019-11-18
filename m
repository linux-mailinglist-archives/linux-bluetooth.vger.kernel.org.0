Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 035F0100878
	for <lists+linux-bluetooth@lfdr.de>; Mon, 18 Nov 2019 16:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfKRPl4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 18 Nov 2019 10:41:56 -0500
Received: from mail-lf1-f41.google.com ([209.85.167.41]:44398 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfKRPl4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 18 Nov 2019 10:41:56 -0500
Received: by mail-lf1-f41.google.com with SMTP id n186so1763065lfd.11
        for <linux-bluetooth@vger.kernel.org>; Mon, 18 Nov 2019 07:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hyz+ETcHVIro3mFxDeCBZmeOv+C7pE8KDCbHv5jqQA0=;
        b=j9AFOQWT5jXgn8ssZMTBR2CPkZj6VIBgSpkLMf1v3dwumeZNJM46ZIh8aapLaZLY/j
         +QH9n0vNqqAQxYk47LBPYrpFP/OhXPrwLXeefExRUbtM3f0lnJdG81qYbNNKGFogizHl
         u4aM0YQjXGsiyQrQAGjHoV8/pxAMJKySpt+WeZuhloACRcH0ejruhuent1ia0rWYsKFb
         nz2hV+MrQGt2WE58Zn3fj1VPDtnmlFcnCMiGYx/CphCX43g6xJolDnMav7UHF0ALEjDB
         gu1t3h+PKxHAEbTi3FUSLaOeizqIjic2uzz9RJkJCWKQzh5C0X0KoI0eN0WkHeeWRop6
         CWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hyz+ETcHVIro3mFxDeCBZmeOv+C7pE8KDCbHv5jqQA0=;
        b=AHgWfQf+gcdoLW17mWJ4bYiJ8BhCW6WVikodLLIfKgeTdTOrdMq+Ck7EZXEStg47JQ
         v6+nYheumRdjRWkSh6C1nr8AywUIiNwl6Pu1TdzSKckkgEL/1f7XUBNZ8N6DFed7R5SN
         aDEWAHL7jsW823whXetbwN4m5xV7gC17xnawtMTWxYd9o+UeQgvTGA3wWCfG4r1+5VkA
         WoCo3C8zDFYnKeJEtW/iqQxCjHTgRtXziYSCY6DH3t9cg00kGnqUx91lV9Zbc30b7yWz
         1kXtrqFlir0AOyjdVer6/c+AAkcS1TPfy4+5o4ULzYVOdnJMy0Og/0lMp/aZWSJhv9cB
         FbYQ==
X-Gm-Message-State: APjAAAW7Udn4beOMBkk2E9Pf3HOW/Z9K/HJ/DeEl9quURGtNekIo7uie
        Rx6NpAu9jmerVAsgNoT1bfgwLzaDFibEQA==
X-Google-Smtp-Source: APXvYqxk87smgapsbA7B9OohjFJJhKFC97chzGlRXrOd5XtLTcnBpP5d7C793d4rPZgSxHmex9a0mw==
X-Received: by 2002:a19:7b18:: with SMTP id w24mr54549lfc.48.1574091713553;
        Mon, 18 Nov 2019 07:41:53 -0800 (PST)
Received: from mlowasrzechonek2133.silvair.lan ([217.153.94.18])
        by smtp.gmail.com with ESMTPSA id u4sm8584108ljj.87.2019.11.18.07.41.52
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 07:41:52 -0800 (PST)
From:   =?UTF-8?q?Micha=C5=82=20Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 0/2] Include destination address in MessageReceived API
Date:   Mon, 18 Nov 2019 16:41:45 +0100
Message-Id: <20191118154147.3589-1-michal.lowas-rzechonek@silvair.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patchset changes the MessageReceived API, replacing 'subscription'
flag with destination address of received messages.

The application receives destination address as a D-Bus variant,
containing either as a regular 16bit address (unicast/group) or a
16-octet virtual label.

See previous discussion https://marc.info/?t=156719067300001&r=1&w=2 for
rationale.

Michał Lowas-Rzechonek (2):
  mesh: Provide destination address in MessageReceived API
  mesh: Inform application about model subscriptions

 doc/mesh-api.txt |  32 +++++++++++---
 mesh/model.c     | 107 ++++++++++++++++++++++++++++++++++++++++++++---
 test/test-mesh   |   4 +-
 3 files changed, 131 insertions(+), 12 deletions(-)

-- 
2.19.1

