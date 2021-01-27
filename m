Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074A430632F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Jan 2021 19:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236250AbhA0SYT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Jan 2021 13:24:19 -0500
Received: from mga18.intel.com ([134.134.136.126]:18959 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343605AbhA0SYS (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Jan 2021 13:24:18 -0500
IronPort-SDR: JUXnGjP5CMcBPA3vjdjcxZb7aBD/fAKR2lwxC6AffjlnF9K+pHwT8sRzL4/UWowtfBWVQxQcJL
 PlYex3qj6Hvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="167786353"
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; 
   d="scan'208";a="167786353"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2021 10:23:44 -0800
IronPort-SDR: HRPeNhpDHUINapePJo/qudI3Jg3u3PJqJ//a/wiJXRHEcq1DhRnMmj99yCy+mj6e6i8smRlGaL
 0H7P1vjTKn/A==
X-IronPort-AV: E=Sophos;i="5.79,380,1602572400"; 
   d="scan'208";a="430191874"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.212.3.187])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2021 10:23:44 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.dentz@gmail.com, brian.gix@intel.com
Subject: [PATCH BlueZ v2 0/2] Fix 32 bit Compiler Errors
Date:   Wed, 27 Jan 2021 10:23:26 -0800
Message-Id: <20210127182328.1542194-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

In a couple places the sizeof() macro has been assumed to return a
(long unsigned) value, and so the string formater %lu has been used to
print out warnings derived from this assumption. While correct on 64 bit
systems, this is an incorrect assumption on 32 bit systems.

These two changes explicitly cast the sizeof return to long in the
affected cases.

v2: Fix bluez.test.bot warnings



Brian Gix (2):
  advertising: Make data size explicit for formats
  tools/mgmt-tester: Make data size explicit for log

 src/advertising.c   | 2 +-
 tools/mgmt-tester.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.4

