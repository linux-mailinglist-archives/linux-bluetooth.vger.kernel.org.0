Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33F2610BEF9
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Nov 2019 22:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729488AbfK0Vjt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Nov 2019 16:39:49 -0500
Received: from mga04.intel.com ([192.55.52.120]:15279 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728247AbfK0Vjt (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Nov 2019 16:39:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 13:39:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,251,1571727600"; 
   d="scan'208";a="207008610"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.252.135.67])
  by fmsmga007.fm.intel.com with ESMTP; 27 Nov 2019 13:39:45 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ v2 0/2] mesh: Fix Friendship for multiple local nodes
Date:   Wed, 27 Nov 2019 13:39:37 -0800
Message-Id: <20191127213939.4526-1-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Primary purpose of this patch-set is to get Friendship working again,
and clean-up the logic so that it correctly works accross multiple
Networks and Nodes.  Currently friendship must be enabled by manually
editting the appropriate node.json file, but suppport will eventually be
available with a soon-to-come mesh.conf file.

v2:
Added an additional Debug Output clean-up patch that makes logging of
incoming messages less noisy when multiple local nodes can decrypt the
same incoming messages.

Brian Gix (2):
  mesh: clean-up Recieved Message debug output
  mesh: Friendship clean-up and rewrite

 mesh/crypto.c |   4 +-
 mesh/friend.c | 610 ++++++++------------------------------------------
 mesh/friend.h |   7 +-
 mesh/net.c    | 328 ++++++++++++---------------
 mesh/net.h    |  31 ++-
 mesh/node.c   |   2 +-
 6 files changed, 271 insertions(+), 711 deletions(-)

-- 
2.21.0

