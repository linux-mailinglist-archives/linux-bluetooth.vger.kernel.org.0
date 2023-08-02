Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9CE76C0EB
	for <lists+linux-bluetooth@lfdr.de>; Wed,  2 Aug 2023 01:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbjHAXcB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 1 Aug 2023 19:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbjHAXbv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 1 Aug 2023 19:31:51 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A6B269E
        for <linux-bluetooth@vger.kernel.org>; Tue,  1 Aug 2023 16:31:42 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-77ac14ff51bso250543539f.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 01 Aug 2023 16:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690932701; x=1691537501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGdN2bLVyroX7eOEJoTxXxLAwDoSogPhY6dWkJKYs4U=;
        b=gHWbG5QpPM3ecx/0zdjMLFW4bAygZ1dsi40a9sVQPTvpqSXcEEabvMr1gL9+BAU7/t
         qqi8Em3dEt/1H/1daWbcT78/nHhPrhdaTZWE6jQf7assjGjKv2q5EmrTLoweu2UcFKRB
         kdG2Fmiu3GqNnNHoofAu1NhkWjxYZWHXDPZAshCj6ZfO5ZVRXAHyjUYMSieSXZsrNgMS
         mqTQTgmE9n/oYvyQa1mOQK15lD/OzKXFYURMcwia9KOn4szQF+udGV2ujYgde5lRGNra
         t0QzVlVXa54dqMZdY3SZ821kWawDndK/pzQ/YUYzWebmdTBMTAhIN5w4J9107QO+SDtV
         w20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690932701; x=1691537501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGdN2bLVyroX7eOEJoTxXxLAwDoSogPhY6dWkJKYs4U=;
        b=KHCz24R0ttcRlalrqr8tbjsyrM4c3GcEEhXJlSdsAVtsynf5q+bawfCMmlN4ql75lR
         a4vT70x6hS7UG5Fuc0mgohAV3YyQV8kStKeGHSl/4az3w2PNymSO+aSFcTc7AZ6s+rz3
         Jtdj0l+dNzb7OYk9ImwRH7EUx5qEin6aJ1UTfpP7sh1hVwlhrRDXzOk3X93blqdoSOiG
         +Bxxi0zH2CE82r0UR1klbH7ul3qKXF9Iv+hUiZGgyWW5Nw93plBju+D43DTqTRSmP2KJ
         0HGj/fC+fBwL6t3Boij/honRnLRRRQdbBEpjTzsEgsn+sOuDBso7vryRspcSOtz0+6WJ
         2gAw==
X-Gm-Message-State: ABy/qLYkjMyseSKQf98zl3M30DH5RsIKNG5MYwfF0TZbhhxNvq6vBFVy
        5InXYodZj1dy/8MRlryUDP7pt+7oqlg=
X-Google-Smtp-Source: APBJJlGf4cAEH/LO72qRxNcALFvvYTMP5LlMG6NKLe65V4N8tJCNjMsFBRUcv80UUzWvoN3wjlUgAg==
X-Received: by 2002:a5e:dc06:0:b0:787:8cf:7426 with SMTP id b6-20020a5edc06000000b0078708cf7426mr12722732iok.6.1690932701169;
        Tue, 01 Aug 2023 16:31:41 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-236-201-58.hsd1.or.comcast.net. [71.236.201.58])
        by smtp.gmail.com with ESMTPSA id d20-20020a5d9bd4000000b00790af7745b1sm1286269ion.20.2023.08.01.16.31.39
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 16:31:40 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [BlueZ PATCH v3 3/5] monitor: Print channel latency information with -a/--analyze
Date:   Tue,  1 Aug 2023 16:31:33 -0700
Message-ID: <20230801233135.537864-3-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233135.537864-1-luiz.dentz@gmail.com>
References: <20230801233135.537864-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This prints channel latency information and use gnuplot when using
-a/--analyze to plot a graph of channels:

  Found TX L2CAP channel with CID 68
        PSM 25
        22490 packets
        7-50 msec (~11 msec) TX Latency
        850-850 octets TX packet size
        ~569 Kb/s TX transfer speed

  10000 +-+----------------------------------------------------------------+
         +|     ++                                                         |
         +|     || +                                       Packets +-----+ |
         +|   + || |                                                       |
   1000 +-|   | || |+ ++                                                   |
         +|   | || || ||   +                                               |
         +|   | || || ||+ +|                                               |
         +|   | || || ||| || ++ ++                                         |
    100 +-|   | || || ||| || || ||   +                                     |
         +|   | || || ||| || || || ++| +   +                               |
         +|   | || || ||| || || || ||| |   |                               |
         +|   | || || ||| || || || ||| |+ +| +                             |
          |   | || || ||| || || || ||| || || |+ +                          |
     10 +-|   | || || ||| || || || ||| || || || |+                         |
         +|   | || || ||| || || || ||| || || || ||     +                   |
         +|  +| || || ||| || || || ||| || || || ||+ ++ |+ ++ +             |
          |  || || || ||| || || || ||| || || || ||| || || || |             |
      1 +-|  || || || ||| || || || ||| || || || ||| || || || |   +     +   |
         ++----------------------------------------------------------------+
          +      +      +       +      +      +      +       +      +      +
          5      10     15      20     25     30     35      40     45     50
                                    Latency (ms)
---
 monitor/analyze.c | 169 +++++++++++++++++++++++++++++-----------------
 1 file changed, 107 insertions(+), 62 deletions(-)

diff --git a/monitor/analyze.c b/monitor/analyze.c
index a016e26e31ac..89b0382825dc 100644
--- a/monitor/analyze.c
+++ b/monitor/analyze.c
@@ -78,6 +78,11 @@ struct hci_conn {
 	struct queue *chan_list;
 };
 
+struct hci_conn_tx {
+	struct timeval tv;
+	struct l2cap_chan *chan;
+};
+
 struct plot {
 	long long x_msec;
 	size_t y_count;
@@ -88,61 +93,15 @@ struct l2cap_chan {
 	uint16_t psm;
 	bool out;
 	unsigned long num;
+	size_t tx_bytes;
+	struct packet_latency tx_l;
+	struct queue *plot;
+	uint16_t tx_pkt_min;
+	uint16_t tx_pkt_max;
 };
 
 static struct queue *dev_list;
 
-static void chan_destroy(void *data)
-{
-	struct l2cap_chan *chan = data;
-
-	printf("    Found %s L2CAP channel with CID %u\n",
-					chan->out ? "TX" : "RX", chan->cid);
-	if (chan->psm)
-		printf("      PSM %u\n", chan->psm);
-	printf("      %lu packets\n", chan->num);
-
-	free(chan);
-}
-
-static struct l2cap_chan *chan_alloc(struct hci_conn *conn, uint16_t cid,
-								bool out)
-{
-	struct l2cap_chan *chan;
-
-	chan = new0(struct l2cap_chan, 1);
-
-	chan->cid = cid;
-	chan->out = out;
-
-	return chan;
-}
-
-static bool chan_match_cid(const void *a, const void *b)
-{
-	const struct l2cap_chan *chan = a;
-	uint32_t val = PTR_TO_UINT(b);
-	uint16_t cid = val & 0xffff;
-	bool out = val & 0x10000;
-
-	return chan->cid == cid && chan->out == out;
-}
-
-static struct l2cap_chan *chan_lookup(struct hci_conn *conn, uint16_t cid,
-								bool out)
-{
-	struct l2cap_chan *chan;
-	uint32_t val = cid | (out ? 0x10000 : 0);
-
-	chan = queue_find(conn->chan_list, chan_match_cid, UINT_TO_PTR(val));
-	if (!chan) {
-		chan = chan_alloc(conn, cid, out);
-		queue_push_tail(conn->chan_list, chan);
-	}
-
-	return chan;
-}
-
 static void tmp_write(void *data, void *user_data)
 {
 	struct plot *plot = data;
@@ -184,6 +143,74 @@ done:
 	unlink(filename);
 }
 
+static void chan_destroy(void *data)
+{
+	struct l2cap_chan *chan = data;
+
+	printf("  Found %s L2CAP channel with CID %u\n",
+					chan->out ? "TX" : "RX", chan->cid);
+	if (chan->psm)
+		print_field("PSM %u", chan->psm);
+
+	print_field("%lu packets", chan->num);
+
+	if (!queue_isempty(chan->plot)) {
+		print_field("%lld-%lld msec (~%lld msec) TX Latency",
+			TV_MSEC(chan->tx_l.min), TV_MSEC(chan->tx_l.max),
+			TV_MSEC(chan->tx_l.med));
+		print_field("%u-%u octets TX packet size",
+				chan->tx_pkt_min, chan->tx_pkt_max);
+	}
+
+	if (TV_MSEC(chan->tx_l.total))
+		print_field("~%lld Kb/s TX transfer speed",
+				chan->tx_bytes * 8 / TV_MSEC(chan->tx_l.total));
+
+	if (chan->num > 1)
+		plot_draw(chan->plot);
+
+	free(chan);
+}
+
+static struct l2cap_chan *chan_alloc(struct hci_conn *conn, uint16_t cid,
+								bool out)
+{
+	struct l2cap_chan *chan;
+
+	chan = new0(struct l2cap_chan, 1);
+
+	chan->cid = cid;
+	chan->out = out;
+	chan->plot = queue_new();
+
+	return chan;
+}
+
+static bool chan_match_cid(const void *a, const void *b)
+{
+	const struct l2cap_chan *chan = a;
+	uint32_t val = PTR_TO_UINT(b);
+	uint16_t cid = val & 0xffff;
+	bool out = val & 0x10000;
+
+	return chan->cid == cid && chan->out == out;
+}
+
+static struct l2cap_chan *chan_lookup(struct hci_conn *conn, uint16_t cid,
+								bool out)
+{
+	struct l2cap_chan *chan;
+	uint32_t val = cid | (out ? 0x10000 : 0);
+
+	chan = queue_find(conn->chan_list, chan_match_cid, UINT_TO_PTR(val));
+	if (!chan) {
+		chan = chan_alloc(conn, cid, out);
+		queue_push_tail(conn->chan_list, chan);
+	}
+
+	return chan;
+}
+
 static void conn_destroy(void *data)
 {
 	struct hci_conn *conn = data;
@@ -506,9 +533,11 @@ static void plot_add(struct queue *queue, struct timeval *latency,
 {
 	struct plot *plot;
 
-	plot = queue_find(queue, match_plot_latency, latency);
+	/* Use LRU ordering */
+	plot = queue_remove_if(queue, match_plot_latency, latency);
 	if (plot) {
 		plot->y_count += count;
+		queue_push_head(queue, plot);
 		return;
 	}
 
@@ -533,7 +562,7 @@ static void evt_num_completed_packets(struct hci_dev *dev, struct timeval *tv,
 		uint16_t count = get_le16(data + 2);
 		struct hci_conn *conn;
 		struct timeval res;
-		struct timeval *last_tx;
+		struct hci_conn_tx *last_tx;
 		int j;
 
 		data += 4;
@@ -548,11 +577,17 @@ static void evt_num_completed_packets(struct hci_dev *dev, struct timeval *tv,
 		for (j = 0; j < count; j++) {
 			last_tx = queue_pop_head(conn->tx_queue);
 			if (last_tx) {
-				timersub(tv, last_tx, &res);
+				struct l2cap_chan *chan = last_tx->chan;
+
+				timersub(tv, &last_tx->tv, &res);
 
 				packet_latency_add(&conn->tx_l, &res);
+				plot_add(conn->plot, &res, 1);
 
-				plot_add(conn->plot, &res, count);
+				if (chan) {
+					packet_latency_add(&chan->tx_l, &res);
+					plot_add(chan->plot, &res, 1);
+				}
 
 				free(last_tx);
 			}
@@ -601,14 +636,15 @@ static void event_pkt(struct timeval *tv, uint16_t index,
 }
 
 static void conn_pkt_tx(struct hci_conn *conn, struct timeval *tv,
-					uint16_t size)
+				uint16_t size, struct l2cap_chan *chan)
 {
-	struct timeval *last_tx;
+	struct hci_conn_tx *last_tx;
 
 	conn->tx_num++;
 
-	last_tx = new0(struct timeval, 1);
+	last_tx = new0(struct hci_conn_tx, 1);
 	memcpy(last_tx, tv, sizeof(*tv));
+	last_tx->chan = chan;
 	queue_push_tail(conn->tx_queue, last_tx);
 	conn->tx_bytes += size;
 
@@ -616,6 +652,15 @@ static void conn_pkt_tx(struct hci_conn *conn, struct timeval *tv,
 		conn->tx_pkt_min = size;
 	if (!conn->tx_pkt_max || size > conn->tx_pkt_max)
 		conn->tx_pkt_max = size;
+
+	if (chan) {
+		chan->tx_bytes += size;
+
+		if (!chan->tx_pkt_min || size < chan->tx_pkt_min)
+			chan->tx_pkt_min = size;
+		if (!chan->tx_pkt_max || size > chan->tx_pkt_max)
+			chan->tx_pkt_max = size;
+	}
 }
 
 static void acl_pkt(struct timeval *tv, uint16_t index, bool out,
@@ -624,7 +669,7 @@ static void acl_pkt(struct timeval *tv, uint16_t index, bool out,
 	const struct bt_hci_acl_hdr *hdr = data;
 	struct hci_dev *dev;
 	struct hci_conn *conn;
-	struct l2cap_chan *chan;
+	struct l2cap_chan *chan = NULL;
 	uint16_t cid;
 
 	data += sizeof(*hdr);
@@ -655,7 +700,7 @@ static void acl_pkt(struct timeval *tv, uint16_t index, bool out,
 	}
 
 	if (out) {
-		conn_pkt_tx(conn, tv, size);
+		conn_pkt_tx(conn, tv, size, chan);
 	} else {
 		conn->rx_num++;
 	}
@@ -681,7 +726,7 @@ static void sco_pkt(struct timeval *tv, uint16_t index, bool out,
 		return;
 
 	if (out) {
-		conn_pkt_tx(conn, tv, size - sizeof(*hdr));
+		conn_pkt_tx(conn, tv, size - sizeof(*hdr), NULL);
 	} else {
 		conn->rx_num++;
 	}
@@ -768,7 +813,7 @@ static void iso_pkt(struct timeval *tv, uint16_t index, bool out,
 		return;
 
 	if (out) {
-		conn_pkt_tx(conn, tv, size - sizeof(*hdr));
+		conn_pkt_tx(conn, tv, size - sizeof(*hdr), NULL);
 	} else {
 		conn->rx_num++;
 	}
-- 
2.41.0

