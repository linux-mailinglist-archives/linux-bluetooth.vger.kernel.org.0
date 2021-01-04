Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B388F2E9E42
	for <lists+linux-bluetooth@lfdr.de>; Mon,  4 Jan 2021 20:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbhADTlG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 4 Jan 2021 14:41:06 -0500
Received: from mga14.intel.com ([192.55.52.115]:51322 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725830AbhADTlF (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 4 Jan 2021 14:41:05 -0500
IronPort-SDR: 0AjvDR92zj+vHAnyk1OrEucduz7l+Z0FyrQOYgoi90YxbJ0wxTvbiAlVIntljqR27T7cJPmEVL
 e/+ymFyY57Sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="176217994"
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="176217994"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 11:40:25 -0800
IronPort-SDR: vEy8InF5SYU0LFaVswKbS4XJ27m60miyDLAVLAlVz1FQjimNM+mTm4cg25QrJgOuuCoFH95H1o
 Wv1UFTvtzXSg==
X-IronPort-AV: E=Sophos;i="5.78,474,1599548400"; 
   d="scan'208";a="496509165"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.212.83.131])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 11:40:24 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.dentz@gmail.com, Brian Gix <brian.gix@intel.com>
Subject: [PATCH BlueZ v2] cfg: Add check for newly used function in ELL
Date:   Mon,  4 Jan 2021 11:40:13 -0800
Message-Id: <20210104194013.580654-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

ELL has a new dependency on rawmemchr() which needs to be accounted for
at configure time.
---
 configure.ac | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure.ac b/configure.ac
index d6347c098..6f4096c88 100644
--- a/configure.ac
+++ b/configure.ac
@@ -49,6 +49,8 @@ AC_ARG_ENABLE(threads, AC_HELP_STRING([--enable-threads],
 
 AC_CHECK_FUNCS(explicit_bzero)
 
+AC_CHECK_FUNCS(rawmemchr)
+
 AC_CHECK_FUNC(signalfd, dummy=yes,
 			AC_MSG_ERROR(signalfd support is required))
 
-- 
2.25.4

