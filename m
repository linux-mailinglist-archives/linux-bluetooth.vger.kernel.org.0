Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCE5C137AE5
	for <lists+linux-bluetooth@lfdr.de>; Sat, 11 Jan 2020 02:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgAKB0E (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Jan 2020 20:26:04 -0500
Received: from mga12.intel.com ([192.55.52.136]:63099 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727992AbgAKB0E (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Jan 2020 20:26:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jan 2020 17:26:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,419,1571727600"; 
   d="scan'208";a="422292608"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.191.206])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jan 2020 17:26:03 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com,
        michal.lowas-rzechonek@silvair.com
Subject: [PATCH BlueZ v2 0/1] Add Mesh Provisioning Loop-Back mechanism
Date:   Fri, 10 Jan 2020 17:25:52 -0800
Message-Id: <20200111012553.28619-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Version 2 centralizes the loop-back mechanism

Cosmetic changes reversed, as they added nothing important to the
functionality.

Brian Gix (1):
  mesh: Implement provisioning loop-back

 mesh/pb-adv.c | 163 ++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 130 insertions(+), 33 deletions(-)

-- 
2.21.1

