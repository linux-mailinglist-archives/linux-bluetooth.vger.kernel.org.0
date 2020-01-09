Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F237B135FE9
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Jan 2020 18:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731992AbgAIR55 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Jan 2020 12:57:57 -0500
Received: from mga05.intel.com ([192.55.52.43]:28630 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728653AbgAIR55 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Jan 2020 12:57:57 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 09:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; 
   d="scan'208";a="216380560"
Received: from ingas-nuc1.sea.intel.com ([10.254.104.252])
  by orsmga008.jf.intel.com with ESMTP; 09 Jan 2020 09:57:56 -0800
From:   Inga Stotland <inga.stotland@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, Inga Stotland <inga.stotland@intel.com>
Subject: [PATCH BlueZ] mesh: Correctly generate NetKey list
Date:   Thu,  9 Jan 2020 09:57:15 -0800
Message-Id: <20200109175715.22925-1-inga.stotland@intel.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When responding with NetKey List Status, packed NetKey indices into
3 octets per pair. If number of NetKeys is odd, append the last key
index as a 2-octet value.
---
 mesh/net.c | 36 ++++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/mesh/net.c b/mesh/net.c
index 0a4d2e72c..90ebdf496 100644
--- a/mesh/net.c
+++ b/mesh/net.c
@@ -1065,26 +1065,46 @@ bool mesh_net_get_key(struct mesh_net *net, bool new_key, uint16_t idx,
 bool mesh_net_key_list_get(struct mesh_net *net, uint8_t *buf, uint16_t *size)
 {
 	const struct l_queue_entry *entry;
-	uint16_t n, buf_size;
+	uint16_t num_keys, req_size, buf_size;
+	struct mesh_subnet *subnet;
 
 	if (!net || !buf || !size)
 		return false;
 
 	buf_size = *size;
-	if (buf_size < l_queue_length(net->subnets) * 2)
+
+	num_keys = l_queue_length(net->subnets);
+	req_size = (num_keys >> 1) * 3 + (num_keys % 2) * 2;
+
+	if (buf_size < req_size)
 		return false;
 
-	n = 0;
-	entry = l_queue_get_entries(net->subnets);
+	*size = req_size;
+
+	/* Pack NetKey indices in 3 octets */
+	for (entry = l_queue_get_entries(net->subnets); num_keys > 1;) {
+		uint32_t idx_pair;
 
-	for (; entry; entry = entry->next) {
-		struct mesh_subnet *subnet = entry->data;
+		subnet = entry->data;
+		idx_pair = subnet->idx;
+		idx_pair <<= 12;
+
+		subnet = entry->next->data;
+		idx_pair += subnet->idx;
+
+		l_put_le32(idx_pair, buf);
+		buf += 3;
+
+		num_keys -= 2;
+		entry = entry->next->next;
+	}
 
+	/* If odd number of NetKeys, fill in the end of the buffer */
+	if (num_keys % 2) {
+		subnet = entry->data;
 		l_put_le16(subnet->idx, buf);
-		n += 2;
 	}
 
-	*size = n;
 	return true;
 }
 
-- 
2.21.1

