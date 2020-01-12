Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADF48138701
	for <lists+linux-bluetooth@lfdr.de>; Sun, 12 Jan 2020 17:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733090AbgALQQY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 12 Jan 2020 11:16:24 -0500
Received: from mga09.intel.com ([134.134.136.24]:11950 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733030AbgALQQY (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 12 Jan 2020 11:16:24 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jan 2020 08:16:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,425,1571727600"; 
   d="scan'208";a="240488025"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.255.229.216])
  by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2020 08:16:22 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com,
        michal.lowas-rzechonek@silvair.com
Subject: [PATCH BlueZ v4 0/1] Add Mesh Provisioning Loop-Back mechanism
Date:   Sun, 12 Jan 2020 08:16:07 -0800
Message-Id: <20200112161608.24919-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Version 4 fixes mem leak ID'd by Michał.

Version 3 fixed logic flaw which is supposed to prevent to sessions with
same roll being loop-back to each other, or more than one loop-back
session.

Version 2 centralizes the loop-back mechanism

Cosmetic changes reversed, as they added nothing important to the
functionality.


Brian Gix (1):
  mesh: Implement provisioning loop-back

 mesh/pb-adv.c | 163 ++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 130 insertions(+), 33 deletions(-)

-- 
2.21.1

