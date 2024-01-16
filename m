Return-Path: <linux-bluetooth+bounces-1105-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ADF82F021
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 15:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00B7D2847DE
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 14:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D531BF5B;
	Tue, 16 Jan 2024 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZwjJL0D"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086AD1BDE2
	for <linux-bluetooth@vger.kernel.org>; Tue, 16 Jan 2024 14:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84F0DC43399;
	Tue, 16 Jan 2024 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705413639;
	bh=YDtggDbWyd/etpo+RvAJzGr0MRIxghX9+ZHGi2Em1a0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DZwjJL0DVTVH+a3EuPTPP4GRtUkeREeQoRFkNKEMHt3oR7FbJlEQk0jsDBEABfILq
	 8xY36R53AI3ED1vMQ6YYpMqyN9zPkiFEQeL6AzfyMD9hUg7WESbtZTLuhOoymWMf6p
	 SDVxsUKDNLk3JE8edSDjTrHp6C+wiXDxWZs96ju64aP4/7pTHJ8t1oSW/zjRhnlEqG
	 QRsx3nUKd4wDI0GCumc8jzgjVZeJX2U/gGDy6SubLDoeIGjvA7npKp7jawidGRM6ZJ
	 Y5lI6sLziVZjhs2siPoAZYjeVjKgZZza+tVPyME66BXI8QwbBM5rUp38erMaJlOfUF
	 R2RhGwatkHDPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771A4C47DAC;
	Tue, 16 Jan 2024 14:00:39 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Tue, 16 Jan 2024 14:00:29 +0000
Subject: [PATCH BlueZ 04/20] monitor: const annotate misc arrays
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-const-v1-4-17c87978f40b@gmail.com>
References: <20240116-const-v1-0-17c87978f40b@gmail.com>
In-Reply-To: <20240116-const-v1-0-17c87978f40b@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705413636; l=3310;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=sDFz/h5HNC2kVyVsavc6FYhQwHcER0nnd3cc13qPQdk=;
 b=p+E599P8FUnPy1mWk/ocsd4lxhjB07GHNOyenW456WJYuZdwCMm8xAzwmuhjJTh7zyfaPDT8w
 zPuFMJDhn5fDgurnm4qC1eUio9V67HyWPRFrqNM4kOp0co5Uv6KauTA
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.velikov@collabora.com>

---
 monitor/att.c    | 8 ++++----
 monitor/avctp.c  | 2 +-
 monitor/intel.c  | 2 +-
 monitor/l2cap.c  | 2 +-
 monitor/rfcomm.c | 2 +-
 monitor/sdp.c    | 4 ++--
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/monitor/att.c b/monitor/att.c
index d016e58df..ac0d881fd 100644
--- a/monitor/att.c
+++ b/monitor/att.c
@@ -2581,7 +2581,7 @@ static void media_state_notify(const struct l2cap_frame *frame)
 	print_media_state(frame);
 }
 
-struct media_cp_opcode {
+static const struct media_cp_opcode {
 	uint8_t opcode;
 	const char *opcode_str;
 } media_cp_opcode_table[] = {
@@ -2739,7 +2739,7 @@ static void content_control_id_read(const struct l2cap_frame *frame)
 
 static const struct pa_sync_state_decoder {
 	uint8_t code;
-	char *value;
+	const char *value;
 } pa_sync_state_decoders[] = {
 	{ 0x00, "Not synchronized to PA" },
 	{ 0x01, "SyncInfo Request" },
@@ -2750,7 +2750,7 @@ static const struct pa_sync_state_decoder {
 
 static const struct cp_pa_sync_state_decoder {
 	uint8_t code;
-	char *value;
+	const char *value;
 } cp_pa_sync_state_decoders[] = {
 	{ 0x00, "Do not synchronize to PA" },
 	{ 0x01, "Synchronize to PA - PAST available" },
@@ -2759,7 +2759,7 @@ static const struct cp_pa_sync_state_decoder {
 
 static const struct big_enc_decoder {
 	uint8_t code;
-	char *value;
+	const char *value;
 } big_enc_decoders[] = {
 	{ 0x00, "Not encrypted" },
 	{ 0x01, "Broadcast_Code required" },
diff --git a/monitor/avctp.c b/monitor/avctp.c
index fb2628282..c59e93b20 100644
--- a/monitor/avctp.c
+++ b/monitor/avctp.c
@@ -1802,7 +1802,7 @@ response:
 }
 
 
-static struct {
+static const struct {
 	const char *str;
 	bool reserved;
 } features_table[] = {
diff --git a/monitor/intel.c b/monitor/intel.c
index 0191987d4..1b2414290 100644
--- a/monitor/intel.c
+++ b/monitor/intel.c
@@ -1798,7 +1798,7 @@ static const struct vendor_evt vendor_prefix_evt_table[] = {
 	{ }
 };
 
-const uint8_t intel_vendor_prefix[] = {0x87, 0x80};
+static const uint8_t intel_vendor_prefix[] = {0x87, 0x80};
 #define INTEL_VENDOR_PREFIX_SIZE sizeof(intel_vendor_prefix)
 
 /*
diff --git a/monitor/l2cap.c b/monitor/l2cap.c
index 8f3d8e65b..dff183bd0 100644
--- a/monitor/l2cap.c
+++ b/monitor/l2cap.c
@@ -718,7 +718,7 @@ static void print_config_result(uint16_t result)
 	print_field("Result: %s (0x%4.4x)", str, le16_to_cpu(result));
 }
 
-static struct {
+static const struct {
 	uint8_t type;
 	uint8_t len;
 	const char *str;
diff --git a/monitor/rfcomm.c b/monitor/rfcomm.c
index 02300a8b5..a855152c6 100644
--- a/monitor/rfcomm.c
+++ b/monitor/rfcomm.c
@@ -32,7 +32,7 @@
 #include "sdp.h"
 #include "rfcomm.h"
 
-static char *cr_str[] = {
+static const char *cr_str[] = {
 	"RSP",
 	"CMD"
 };
diff --git a/monitor/sdp.c b/monitor/sdp.c
index daf9a9da8..2c69dc83b 100644
--- a/monitor/sdp.c
+++ b/monitor/sdp.c
@@ -167,7 +167,7 @@ static struct {
 	{ }
 };
 
-static struct {
+static const struct {
 	uint8_t index;
 	uint8_t bits;
 	uint8_t size;
@@ -322,7 +322,7 @@ static uint32_t get_bytes(const uint8_t *data, uint32_t size)
 	return 0;
 }
 
-static struct {
+static const struct {
 	uint16_t id;
 	const char *str;
 } attribute_table[] = {

-- 
2.43.0


