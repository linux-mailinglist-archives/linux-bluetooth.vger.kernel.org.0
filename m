Return-Path: <linux-bluetooth+bounces-5724-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC959238C3
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Jul 2024 10:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B30CB1F22DFA
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Jul 2024 08:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E11C14F9FD;
	Tue,  2 Jul 2024 08:49:11 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D911984D39
	for <linux-bluetooth@vger.kernel.org>; Tue,  2 Jul 2024 08:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719910150; cv=none; b=WityVT/Y3zWEBhTOpJMlplZo4JA7Cv4uHSLwZEWcYxtIF5MoSKyOLsKMQ23vKFCOwAr790YpEeIbrkSDacm3ANGqB99DgRD8787oE50wgjFUDsylGaH2Jg6W0uNoTnadVv0udDHO1i2zqBkpUh2wi3csghOe5a2AvUbGTA9fvC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719910150; c=relaxed/simple;
	bh=nxQmHvj5d+IOf5OrJz12+hosL98o57kQzrHPM1hlJc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=II5PXwjCtx5/Q2XO2qUglhfT4b2cVnl+DW0TJN02533xh0FpQ1Dr674MEarjaRh6v6WCbLx9pWJnl2HkVikPThSYimNpXmU0/goqU7tNXSZZHHFHT84O0aF50Y3qx9vUr78T+SDSlJomrt1xkYXG2S5lqlUTdlrrG9I6fkWF9B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F3A6E0007;
	Tue,  2 Jul 2024 08:49:01 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Cc: Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 2/9] avdtp: Fix manipulating struct as an array
Date: Tue,  2 Jul 2024 10:47:17 +0200
Message-ID: <20240702084900.773620-3-hadess@hadess.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702084900.773620-1-hadess@hadess.net>
References: <20240702084900.773620-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net

Don't manipulate the "req" structs as if they were flat arrays, static
analysis and humans are both equally confused by this kind of usage.

Error: ARRAY_VS_SINGLETON (CWE-119): [#def26] [important]
bluez-5.76/profiles/audio/avdtp.c:1675:2: address_of: Taking address with "&start->first_seid" yields a singleton pointer.
bluez-5.76/profiles/audio/avdtp.c:1675:2: assign: Assigning: "seid" = "&start->first_seid".
bluez-5.76/profiles/audio/avdtp.c:1679:25: ptr_arith: Using "seid" as an array.  This might corrupt or misinterpret adjacent memory locations.
1677|           int i;
1678|
1679|->         for (i = 0; i < count; i++, seid++) {
1680|                   if (seid->seid == id) {
1681|                           req->collided = TRUE;

Error: ARRAY_VS_SINGLETON (CWE-119): [#def27] [important]
bluez-5.76/profiles/audio/avdtp.c:1690:2: address_of: Taking address with "&suspend->first_seid" yields a singleton pointer.
bluez-5.76/profiles/audio/avdtp.c:1690:2: assign: Assigning: "seid" = "&suspend->first_seid".
bluez-5.76/profiles/audio/avdtp.c:1694:25: ptr_arith: Using "seid" as an array.  This might corrupt or misinterpret adjacent memory locations.
1692|		int i;
1693|
1694|->		for (i = 0; i < count; i++, seid++) {
1695|			if (seid->seid == id) {
1696|				req->collided = TRUE;

Error: ARRAY_VS_SINGLETON (CWE-119): [#def28] [important]
bluez-5.76/profiles/audio/avdtp.c:1799:2: address_of: Taking address with "&req->first_seid" yields a singleton pointer.
bluez-5.76/profiles/audio/avdtp.c:1799:2: assign: Assigning: "seid" = "&req->first_seid".
bluez-5.76/profiles/audio/avdtp.c:1801:30: ptr_arith: Using "seid" as an array.  This might corrupt or misinterpret adjacent memory locations.
1799|		seid = &req->first_seid;
1800|
1801|->		for (i = 0; i < seid_count; i++, seid++) {
1802|			failed_seid = seid->seid;
1803|

Error: ARRAY_VS_SINGLETON (CWE-119): [#def29] [important]
bluez-5.76/profiles/audio/avdtp.c:1912:2: address_of: Taking address with "&req->first_seid" yields a singleton pointer.
bluez-5.76/profiles/audio/avdtp.c:1912:2: assign: Assigning: "seid" = "&req->first_seid".
bluez-5.76/profiles/audio/avdtp.c:1914:30: ptr_arith: Using "seid" as an array.  This might corrupt or misinterpret adjacent memory locations.
1912|		seid = &req->first_seid;
1913|
1914|->	for (i = 0; i < seid_count; i++, seid++) {
1915|			failed_seid = seid->seid;
1916|
---
 profiles/audio/avdtp.c | 45 +++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
index 3667e08400dd..45d1b120b760 100644
--- a/profiles/audio/avdtp.c
+++ b/profiles/audio/avdtp.c
@@ -184,13 +184,17 @@ struct getcap_resp {
 } __attribute__ ((packed));
 
 struct start_req {
-	struct seid first_seid;
-	struct seid other_seids[0];
+	union {
+		struct seid required[1];
+		struct seid seids[0];
+	};
 } __attribute__ ((packed));
 
 struct suspend_req {
-	struct seid first_seid;
-	struct seid other_seids[0];
+	union {
+		struct seid required[1];
+		struct seid seids[0];
+	};
 } __attribute__ ((packed));
 
 struct seid_rej {
@@ -1672,12 +1676,12 @@ static void check_seid_collision(struct pending_req *req, uint8_t id)
 static void check_start_collision(struct pending_req *req, uint8_t id)
 {
 	struct start_req *start = req->data;
-	struct seid *seid = &start->first_seid;
 	int count = 1 + req->data_size - sizeof(struct start_req);
 	int i;
 
-	for (i = 0; i < count; i++, seid++) {
-		if (seid->seid == id) {
+	for (i = 0; i < count; i++) {
+		struct seid seid = start->seids[i];
+		if (seid.seid == id) {
 			req->collided = TRUE;
 			return;
 		}
@@ -1687,12 +1691,12 @@ static void check_start_collision(struct pending_req *req, uint8_t id)
 static void check_suspend_collision(struct pending_req *req, uint8_t id)
 {
 	struct suspend_req *suspend = req->data;
-	struct seid *seid = &suspend->first_seid;
 	int count = 1 + req->data_size - sizeof(struct suspend_req);
 	int i;
 
-	for (i = 0; i < count; i++, seid++) {
-		if (seid->seid == id) {
+	for (i = 0; i < count; i++) {
+		struct seid seid = suspend->seids[i];
+		if (seid.seid == id) {
 			req->collided = TRUE;
 			return;
 		}
@@ -1785,7 +1789,6 @@ static gboolean avdtp_start_cmd(struct avdtp *session, uint8_t transaction,
 	struct avdtp_local_sep *sep;
 	struct avdtp_stream *stream;
 	struct stream_rej rej;
-	struct seid *seid;
 	uint8_t err, failed_seid;
 	int seid_count, i;
 
@@ -1796,12 +1799,12 @@ static gboolean avdtp_start_cmd(struct avdtp *session, uint8_t transaction,
 
 	seid_count = 1 + size - sizeof(struct start_req);
 
-	seid = &req->first_seid;
+	for (i = 0; i < seid_count; i++) {
+		struct seid seid = req->seids[i];
 
-	for (i = 0; i < seid_count; i++, seid++) {
-		failed_seid = seid->seid;
+		failed_seid = seid.seid;
 
-		sep = find_local_sep_by_seid(session, seid->seid);
+		sep = find_local_sep_by_seid(session, seid.seid);
 		if (!sep || !sep->stream) {
 			err = AVDTP_BAD_ACP_SEID;
 			goto failed;
@@ -1898,7 +1901,6 @@ static gboolean avdtp_suspend_cmd(struct avdtp *session, uint8_t transaction,
 	struct avdtp_local_sep *sep;
 	struct avdtp_stream *stream;
 	struct stream_rej rej;
-	struct seid *seid;
 	uint8_t err, failed_seid;
 	int seid_count, i;
 
@@ -1909,12 +1911,11 @@ static gboolean avdtp_suspend_cmd(struct avdtp *session, uint8_t transaction,
 
 	seid_count = 1 + size - sizeof(struct suspend_req);
 
-	seid = &req->first_seid;
+	for (i = 0; i < seid_count; i++) {
+		struct seid seid = req->seids[i];
+		failed_seid = seid.seid;
 
-	for (i = 0; i < seid_count; i++, seid++) {
-		failed_seid = seid->seid;
-
-		sep = find_local_sep_by_seid(session, seid->seid);
+		sep = find_local_sep_by_seid(session, seid.seid);
 		if (!sep || !sep->stream) {
 			err = AVDTP_BAD_ACP_SEID;
 			goto failed;
@@ -3663,7 +3664,7 @@ int avdtp_start(struct avdtp *session, struct avdtp_stream *stream)
 	}
 
 	memset(&req, 0, sizeof(req));
-	req.first_seid.seid = stream->rseid;
+	req.required->seid = stream->rseid;
 
 	ret = send_request(session, FALSE, stream, AVDTP_START,
 							&req, sizeof(req));
-- 
2.45.2


