Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2923BF8FA
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Sep 2019 20:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfIZSOz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 26 Sep 2019 14:14:55 -0400
Received: from mga03.intel.com ([134.134.136.65]:23148 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbfIZSOy (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 26 Sep 2019 14:14:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Sep 2019 11:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,552,1559545200"; 
   d="scan'208";a="196460992"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.251.25.152])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Sep 2019 11:14:53 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com,
        michal.lowas-rzechonek@silvair.com
Subject: [PATCH BlueZ v3 0/3] mesh: Fix Remote/Local dev key usage
Date:   Thu, 26 Sep 2019 11:14:41 -0700
Message-Id: <20190926181444.4916-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

V3:  By popular demand, the name "remote" is now used for both DevKeySend()
and DevKeyMessageReceived().

In DevKeySend(), setting remote == true means that the Key Ring *must* be
used to encrypt the outgoing message, and a failure will be returned if
the requested destination address does not include a device key in the
local key ring. For remote == false requests, the request will be rejected
if the destination is an element on the local node.

In DevKeyMessageReceived(), the remote boolean will be set == true if it
required the key ring to decrypot the message.  If remote == false, this
means that the local nodes Device Key successfully decrypted the message,
and the message may be used to change or query privileged states.


Brian Gix (3):
  mesh: Add local/remote bools to DevKey transactions
  mesh: Use explicit Local vs Remote Device key usage
  mesh: Fix Key Ring permissions for local nodes

 doc/mesh-api.txt | 17 ++++++++++++++---
 mesh/manager.c   |  5 -----
 mesh/model.c     | 11 +++++++----
 mesh/node.c      | 40 +++++++++++++++-------------------------
 4 files changed, 36 insertions(+), 37 deletions(-)

-- 
2.21.0

