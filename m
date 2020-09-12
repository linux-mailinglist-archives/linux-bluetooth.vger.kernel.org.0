Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF0426783F
	for <lists+linux-bluetooth@lfdr.de>; Sat, 12 Sep 2020 08:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgILGeg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 12 Sep 2020 02:34:36 -0400
Received: from mga17.intel.com ([192.55.52.151]:11516 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725813AbgILGef (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 12 Sep 2020 02:34:35 -0400
IronPort-SDR: kjgk45xUeqiRtyn5hbZEYcTQxorjxiUrzjRoBpG4tH8rbJfe97spPP9XIYCbWHp0yUD/8jGVuW
 4r1LwVInywyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9741"; a="138912320"
X-IronPort-AV: E=Sophos;i="5.76,419,1592895600"; 
   d="scan'208";a="138912320"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 23:24:18 -0700
IronPort-SDR: ZGEMZkur2SdI5sFqAHjwra4ZuW1ZANyulrMQKFlUgonsmTbCsEo1w6kbqxKqc5pX4O0u67mhF+
 4tb7Oz/wjp0A==
X-IronPort-AV: E=Sophos;i="5.76,419,1592895600"; 
   d="scan'208";a="342519247"
Received: from han1-mobl3.jf.intel.com ([10.255.228.79])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2020 23:24:17 -0700
From:   tedd.an@linux.intel.com
To:     linux-bluetooth@vger.kernel.org
Cc:     Tedd Ho-Jeong An <tedd.an@intel.com>
Subject: [BlueZ 03/17] btio: Add SPDX License Identifier
Date:   Fri, 11 Sep 2020 23:23:43 -0700
Message-Id: <20200912062357.23926-4-tedd.an@linux.intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200912062357.23926-1-tedd.an@linux.intel.com>
References: <20200912062357.23926-1-tedd.an@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch adds SPDX License Identifier.

-------------------------------------
       License            COUNT
-------------------------------------
 GPL-2.0-or-later     :      2

License: GPL-2.0-or-later
   btio/btio.h
   btio/btio.c
---
 btio/btio.c | 1 +
 btio/btio.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/btio/btio.c b/btio/btio.c
index 844d6007f..42874e13c 100644
--- a/btio/btio.c
+++ b/btio/btio.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
diff --git a/btio/btio.h b/btio/btio.h
index 23e0ef72b..e15f52a7c 100644
--- a/btio/btio.h
+++ b/btio/btio.h
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
-- 
2.25.4

