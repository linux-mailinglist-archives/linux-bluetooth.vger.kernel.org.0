Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9A2712831C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Dec 2019 21:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbfLTUN4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 Dec 2019 15:13:56 -0500
Received: from mga17.intel.com ([192.55.52.151]:31469 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727473AbfLTUN4 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 Dec 2019 15:13:56 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Dec 2019 12:13:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,337,1571727600"; 
   d="scan'208";a="228707551"
Received: from bgi1-mobl2.amr.corp.intel.com ([10.255.86.196])
  by orsmga002.jf.intel.com with ESMTP; 20 Dec 2019 12:13:55 -0800
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     brian.gix@intel.com, inga.stotland@intel.com
Subject: [PATCH BlueZ 1/2] mesh: Deliver newly composed SNBs to local nodes
Date:   Fri, 20 Dec 2019 12:13:39 -0800
Message-Id: <20191220201340.8039-2-brian.gix@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191220201340.8039-1-brian.gix@intel.com>
References: <20191220201340.8039-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 mesh/net-keys.c |  3 +++
 mesh/net.c      | 13 +++++++++++++
 mesh/net.h      |  1 +
 3 files changed, 17 insertions(+)

diff --git a/mesh/net-keys.c b/mesh/net-keys.c
index 65f0808dd..6f1758fe3 100644
--- a/mesh/net-keys.c
+++ b/mesh/net-keys.c
@@ -480,6 +480,9 @@ bool net_key_beacon_refresh(uint32_t id, uint32_t iv_index, bool kr, bool ivu)
 	l_debug("Setting SNB: IVI: %8.8x, IVU: %d, KR: %d", iv_index, ivu, kr);
 	print_packet("Set SNB Beacon to", beacon, sizeof(beacon));
 
+	/* Propagate changes to all local nodes */
+	net_local_beacon(id, beacon);
+
 	/* Send one new SNB soon, after all nodes have seen it */
 	l_getrandom(&rand_ms, sizeof(rand_ms));
 	rand_ms %= 1000;
diff --git a/mesh/net.c b/mesh/net.c
index 0485086bc..5aeeab188 100644
--- a/mesh/net.c
+++ b/mesh/net.c
@@ -2739,6 +2739,19 @@ static void beacon_recv(void *user_data, struct mesh_io_recv_info *info,
 		net_key_beacon_seen(beacon_data.key_id);
 }
 
+void net_local_beacon(uint32_t key_id, uint8_t *beacon)
+{
+	struct net_beacon_data beacon_data = {
+		.key_id = key_id,
+		.ivu = !!(beacon[2] & 0x02),
+		.kr = !!(beacon[2] & 0x01),
+		.ivi = l_get_be32(beacon + 11),
+	};
+
+	/* Deliver locally generated beacons to all nodes */
+	l_queue_foreach(nets, process_beacon, &beacon_data);
+}
+
 bool mesh_net_set_beacon_mode(struct mesh_net *net, bool enable)
 {
 	if (!net)
diff --git a/mesh/net.h b/mesh/net.h
index 07b87830d..023b61e71 100644
--- a/mesh/net.h
+++ b/mesh/net.h
@@ -280,6 +280,7 @@ uint16_t mesh_net_get_address(struct mesh_net *net);
 bool mesh_net_register_unicast(struct mesh_net *net,
 					uint16_t unicast, uint8_t num_ele);
 uint8_t mesh_net_get_num_ele(struct mesh_net *net);
+void net_local_beacon(uint32_t key_id, uint8_t *beacon);
 bool mesh_net_set_beacon_mode(struct mesh_net *net, bool enable);
 bool mesh_net_set_proxy_mode(struct mesh_net *net, bool enable);
 bool mesh_net_set_relay_mode(struct mesh_net *net, bool enable, uint8_t cnt,
-- 
2.21.0

