Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD467149229
	for <lists+linux-bluetooth@lfdr.de>; Sat, 25 Jan 2020 00:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729598AbgAXXwv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 24 Jan 2020 18:52:51 -0500
Received: from mga11.intel.com ([192.55.52.93]:53124 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729530AbgAXXwu (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 24 Jan 2020 18:52:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jan 2020 15:52:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,359,1574150400"; 
   d="scan'208";a="230511863"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.251.17.203])
  by orsmga006.jf.intel.com with ESMTP; 24 Jan 2020 15:52:48 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ 4/5] mesh: Apply Replay Protection to all incoming packets
Date:   Fri, 24 Jan 2020 15:52:41 -0800
Message-Id: <20200124235242.21720-5-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200124235242.21720-1-brian.gix@intel.com>
References: <20200124235242.21720-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Replay Protection was only being applied against Application Keys,
but messages with Device Keys are just as vulnerable, and need to be
checked as well.
---
 mesh/model.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/mesh/model.c b/mesh/model.c
index 0018c7cff..92a00496c 100644
--- a/mesh/model.c
+++ b/mesh/model.c
@@ -608,7 +608,7 @@ static bool msg_send(struct mesh_node *node, bool credential, uint16_t src,
 
 	iv_index = mesh_net_get_iv_index(net);
 
-	seq_num = mesh_net_get_seq_num(net);
+	seq_num = mesh_net_next_seq_num(net);
 	if (!mesh_crypto_payload_encrypt(label, msg, out, msg_len, src, dst,
 				key_aid, seq_num, iv_index, szmic, key)) {
 		l_error("Failed to Encrypt Payload");
@@ -949,7 +949,7 @@ bool mesh_model_rx(struct mesh_node *node, bool szmict, uint32_t seq0,
 	struct mesh_net *net = node_get_net(node);
 	uint8_t num_ele;
 	int decrypt_idx, i, ele_idx;
-	uint16_t addr;
+	uint16_t addr, crpl;
 	struct mesh_virtual *decrypt_virt = NULL;
 	bool result = false;
 	bool is_subscription;
@@ -997,14 +997,12 @@ bool mesh_model_rx(struct mesh_node *node, bool szmict, uint32_t seq0,
 
 	/* print_packet("Clr Rx (pre-cache-check)", clear_text, size - 4); */
 
-	if (key_aid != APP_AID_DEV) {
-		uint16_t crpl = node_get_crpl(node);
+	crpl = node_get_crpl(node);
 
-		if (net_msg_in_replay_cache(net, (uint16_t) decrypt_idx, src,
-							crpl, seq, iv_index)) {
-			result = true;
-			goto done;
-		}
+	if (net_msg_in_replay_cache(net, (uint16_t) decrypt_idx, src,
+				crpl, seq, iv_index)) {
+		result = true;
+		goto done;
 	}
 
 	print_packet("Clr Rx", clear_text, size - (szmict ? 8 : 4));
-- 
2.21.1

