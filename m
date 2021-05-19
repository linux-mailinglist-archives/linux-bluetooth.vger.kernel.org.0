Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0CD38963E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 May 2021 21:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbhESTK7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 19 May 2021 15:10:59 -0400
Received: from mga06.intel.com ([134.134.136.31]:6662 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231899AbhESTK6 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 19 May 2021 15:10:58 -0400
IronPort-SDR: bawwuEJVITwEx6g1XEN/kmEf3FtmmOy4fS2hBtFJzhaDhdS2rNBqp/PijiAhVW9yRjY0N5Qhe9
 WCgDKkOSuPiQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="262284397"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="262284397"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 12:09:36 -0700
IronPort-SDR: 3bEVjwGlCb3D6tqnc1iV6yUCBek6tsCzu8Eh5F8W/E8Ir/yyCsfYPJBHXo+gzu2bQmMUTC0tI8
 kZo25q7bg7BQ==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="439855259"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.212.229.7])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 12:09:36 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com
Subject: [PATCH BlueZ v3 1/6] mesh: Fix delivery of PB-ACK to acceptors
Date:   Wed, 19 May 2021 12:09:20 -0700
Message-Id: <20210519190925.1723012-2-brian.gix@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210519190925.1723012-1-brian.gix@intel.com>
References: <20210519190925.1723012-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Remove unneeded initialization that prevented the Acceptor roll of ever
recognizing a valid PB-ACK.
---
 mesh/pb-adv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mesh/pb-adv.c b/mesh/pb-adv.c
index c74dae79f..83f922aa8 100644
--- a/mesh/pb-adv.c
+++ b/mesh/pb-adv.c
@@ -358,7 +358,6 @@ static void pb_adv_packet(void *user_data, const uint8_t *pkt, uint16_t len)
 		first = !session->link_id;
 		session->link_id = link_id;
 		session->last_peer_trans_num = 0xFF;
-		session->local_acked = 0xFF;
 		session->peer_trans_num = 0x00;
 		session->local_trans_num = 0x7F;
 		session->opened = true;
-- 
2.25.4

