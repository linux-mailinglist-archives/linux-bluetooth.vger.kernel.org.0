Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDB8912831E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Dec 2019 21:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbfLTUOE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 Dec 2019 15:14:04 -0500
Received: from mga14.intel.com ([192.55.52.115]:13957 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727473AbfLTUOE (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 Dec 2019 15:14:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Dec 2019 12:14:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,337,1571727600"; 
   d="scan'208";a="228707582"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.255.86.196])
  by orsmga002.jf.intel.com with ESMTP; 20 Dec 2019 12:14:03 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ 2/2] mesh: Recognize SNBs in SecondsSinceLastHeard
Date:   Fri, 20 Dec 2019 12:13:40 -0800
Message-Id: <20191220201340.8039-3-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191220201340.8039-1-brian.gix@intel.com>
References: <20191220201340.8039-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Timestamp is taken on each OTA beacon reception, and considered in the
SecondsSinceLastHeard property.

---
 mesh/net-keys.c | 16 +++++++++++++---
 mesh/net-keys.h |  1 +
 mesh/net.c      | 15 +++++++++++++++
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/mesh/net-keys.c b/mesh/net-keys.c
index 6f1758fe3..683a924c4 100644
--- a/mesh/net-keys.c
+++ b/mesh/net-keys.c
@@ -410,7 +410,6 @@ static void snb_timeout(struct l_timeout *timeout, void *user_data)
 	}
 
 	interval = key->snb.observe_period / 2;
-	key->snb.ts = get_timestamp_secs();
 	key->snb.half_period = !key->snb.half_period;
 
 	if (key->beacon_enables)
@@ -425,8 +424,20 @@ void net_key_beacon_seen(uint32_t id)
 {
 	struct net_key *key = l_queue_find(keys, match_id, L_UINT_TO_PTR(id));
 
-	if (key)
+	if (key) {
 		key->snb.observed++;
+		key->snb.ts = get_timestamp_secs();
+	}
+}
+
+uint32_t net_key_beacon_last_seen(uint32_t id)
+{
+	struct net_key *key = l_queue_find(keys, match_id, L_UINT_TO_PTR(id));
+
+	if (key)
+		return key->snb.ts;
+
+	return 0;
 }
 
 void net_key_beacon_enable(uint32_t id)
@@ -451,7 +462,6 @@ void net_key_beacon_enable(uint32_t id)
 	rand_ms++;
 
 	/* Enable Periodic Beaconing on this key */
-	key->snb.ts = get_timestamp_secs();
 	key->snb.observe_period = BEACON_INTERVAL_MIN * 2;
 	key->snb.expected = 2;
 	key->snb.observed = 0;
diff --git a/mesh/net-keys.h b/mesh/net-keys.h
index 3c2c4d0da..9385e2c51 100644
--- a/mesh/net-keys.h
+++ b/mesh/net-keys.h
@@ -39,3 +39,4 @@ void net_key_beacon_seen(uint32_t id);
 void net_key_beacon_enable(uint32_t id);
 bool net_key_beacon_refresh(uint32_t id, uint32_t iv_index, bool kr, bool ivu);
 void net_key_beacon_disable(uint32_t id);
+uint32_t net_key_beacon_last_seen(uint32_t id);
diff --git a/mesh/net.c b/mesh/net.c
index 5aeeab188..23565c11d 100644
--- a/mesh/net.c
+++ b/mesh/net.c
@@ -3662,7 +3662,22 @@ void mesh_net_set_prov(struct mesh_net *net, struct mesh_prov *prov)
 	net->prov = prov;
 }
 
+static void refresh_instant(void *a, void *b)
+{
+	struct mesh_subnet *subnet = a;
+	struct mesh_net *net = b;
+	uint32_t instant = net_key_beacon_last_seen(subnet->net_key_tx);
+
+	if (net->instant < instant)
+		net->instant = instant;
+}
+
 uint32_t mesh_net_get_instant(struct mesh_net *net)
 {
+	if (!net)
+		return 0;
+
+	l_queue_foreach(net->subnets, refresh_instant, net);
+
 	return net->instant;
 }
-- 
2.21.0

