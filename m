Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C83FBAADA1
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Sep 2019 23:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388578AbfIEVMB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Sep 2019 17:12:01 -0400
Received: from mga01.intel.com ([192.55.52.88]:29739 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387591AbfIEVMB (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Sep 2019 17:12:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Sep 2019 14:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,471,1559545200"; 
   d="scan'208";a="182945335"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.254.24.188])
  by fmsmga008.fm.intel.com with ESMTP; 05 Sep 2019 14:12:00 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ v2 0/2] mesh: Streamline Key Refresh finalization
Date:   Thu,  5 Sep 2019 14:11:47 -0700
Message-Id: <20190905211149.26255-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

All App key refresh finalization will happen when the bound Net Key is
finalized.

Version 2: Style guide corrections, and stricter adherence to rules as
specified in mesh-api.txt

Brian Gix (2):
  doc: Remove uneeded dbus API for App Key Refresh
  mesh: Automate AppKey update on KR phase 2-->3-->0

 doc/mesh-api.txt | 19 --------------
 mesh/keyring.c   | 66 ++++++++++++++++++++++++++++++++++++++++++++++++
 mesh/keyring.h   |  1 +
 mesh/manager.c   | 43 +++++++++----------------------
 4 files changed, 79 insertions(+), 50 deletions(-)

-- 
2.21.0

