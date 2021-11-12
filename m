Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F1E44EF07
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 Nov 2021 23:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233965AbhKLWId (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 12 Nov 2021 17:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbhKLWIc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 12 Nov 2021 17:08:32 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E591EC061767
        for <linux-bluetooth@vger.kernel.org>; Fri, 12 Nov 2021 14:05:40 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id o4so9543644pfp.13
        for <linux-bluetooth@vger.kernel.org>; Fri, 12 Nov 2021 14:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U6kAdLhmfYld83c91CXYILisuMoYEZw6m/w+cw9egfw=;
        b=imRncGTtpg73mxJdbjh4G9Bm5YLcsZxo7Cdko+38HVmH2G0t6P+zGIN2y3oagsNWtT
         2yPS/1lnhBequ9G9dMdAXSEDNKMaPWGrE0bKFQWnbNAK0t1UsgbN6Q9yKiQy4g7evTAj
         38yFfhO3o/9TSOVvF7o4KaXl+FTbYOmpGm0xOZjfwwbgDyRjtKHIBh4H5WOZoU7JDUgd
         4nkbOcf2umUAuQX+PvssWIsEM4YkrVXaMsHjsYmGb/xPVQL+raOVnoERQ2WB5T349adP
         A1enlkLUJjB/LP4GrCPlN3Bu2v/gSC7oFZnMFkn5IbEYGhJE+Eil2zE2wJBjfT8ZTWX+
         q4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U6kAdLhmfYld83c91CXYILisuMoYEZw6m/w+cw9egfw=;
        b=Fck0SlnKN5swp9cq0GfnESfH/ebau33tlJ58TI8zp17XG8LsvgiMvg5s9UPUTVh0Ge
         1tmLAbwMPEUjXYggbva31rLbOIKKpcJfV0cvuIQ2SpOjEudeTg+j8GXg++fq2gaLkfBk
         04hy+io5A1K48WjkKTW3x2rNHwnUN+XY4ufVhFxV1Q7BY854aajyLC79hpmeJq+2XZcA
         yRaTQmqTmaQv9H4vBTK+36zsNQM+vKHw4RcwB4yi2XX7lmmuOPUGFM9y6AVdUYq/3R+2
         6LfJFW2bAlN8CBzv3IbfQ7A2t5rsuqT/QNbgZWsv/VCwnNk0YMq569OcTbpGTuWirC0S
         Sl1g==
X-Gm-Message-State: AOAM533lnU9VxPmd82X8/pFIimC5K2PjV5uHO8F/lgeLiVQVrxY/AsLd
        E83QG6i1FuAGQMFETBO40gWN8yssvqE=
X-Google-Smtp-Source: ABdhPJxCmbfUZvL7PxnlKXL/r73U//kqcCUuKD33jS3/hXP9ZZPO20xQ6tPjHcJgY1jHsThvOpNdKw==
X-Received: by 2002:a63:9902:: with SMTP id d2mr11991574pge.104.1636754739902;
        Fri, 12 Nov 2021 14:05:39 -0800 (PST)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id b22sm5618088pge.2.2021.11.12.14.05.39
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:05:39 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 1/2] sdpd: Fix leaking buffers stored in cstates cache
Date:   Fri, 12 Nov 2021 14:05:37 -0800
Message-Id: <20211112220538.310085-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

These buffer shall only be keep in cache for as long as they are
needed so this would cleanup any client cstates in the following
conditions:

 - There is no cstate on the response
 - No continuation can be found for cstate
 - Different request opcode
 - Respond with an error
 - Client disconnect

Fixes: https://github.com/bluez/bluez/security/advisories/GHSA-3fqg-r8j5-f5xq
---
 src/sdpd-request.c | 170 ++++++++++++++++++++++++++++++++-------------
 src/sdpd-server.c  |  20 +++---
 src/sdpd.h         |   3 +
 unit/test-sdp.c    |   2 +-
 4 files changed, 135 insertions(+), 60 deletions(-)

diff --git a/src/sdpd-request.c b/src/sdpd-request.c
index 033d1e5bf..c8f5a2c72 100644
--- a/src/sdpd-request.c
+++ b/src/sdpd-request.c
@@ -42,48 +42,78 @@ typedef struct {
 
 #define MIN(x, y) ((x) < (y)) ? (x): (y)
 
-typedef struct _sdp_cstate_list sdp_cstate_list_t;
+typedef struct sdp_cont_info sdp_cont_info_t;
 
-struct _sdp_cstate_list {
-	sdp_cstate_list_t *next;
+struct sdp_cont_info {
+	int sock;
+	uint8_t opcode;
 	uint32_t timestamp;
 	sdp_buf_t buf;
 };
 
-static sdp_cstate_list_t *cstates;
+static sdp_list_t *cstates;
 
-/* FIXME: should probably remove it when it's found */
-static sdp_buf_t *sdp_get_cached_rsp(sdp_cont_state_t *cstate)
+static int cstate_match(const void *data, const void *user_data)
 {
-	sdp_cstate_list_t *p;
+	const sdp_cont_info_t *cinfo = data;
+	const sdp_cont_state_t *cstate = user_data;
 
-	for (p = cstates; p; p = p->next) {
-		/* Check timestamp */
-		if (p->timestamp != cstate->timestamp)
-			continue;
+	/* Check timestamp */
+	return cinfo->timestamp - cstate->timestamp;
+}
+
+static void sdp_cont_info_free(sdp_cont_info_t *cinfo)
+{
+	if (!cinfo)
+		return;
+
+	cstates = sdp_list_remove(cstates, cinfo);
+	free(cinfo->buf.data);
+	free(cinfo);
+}
+
+static sdp_cont_info_t *sdp_get_cont_info(sdp_req_t *req,
+						sdp_cont_state_t *cstate)
+{
+	sdp_list_t *list;
+
+	list = sdp_list_find(cstates, cstate, cstate_match);
+	if (list) {
+		sdp_cont_info_t *cinfo = list->data;
 
-		/* Check if requesting more than available */
-		if (cstate->cStateValue.maxBytesSent < p->buf.data_size)
-			return &p->buf;
+		if (cinfo->opcode == req->opcode)
+			return cinfo;
+
+		/* Cleanup continuation if the opcode doesn't match since its
+		 * response buffer shall only be valid for the original requests
+		 */
+		sdp_cont_info_free(cinfo);
+		return NULL;
 	}
 
-	return 0;
+	/* Cleanup cstates if no continuation info could be found */
+	sdp_cstate_cleanup(req->sock);
+
+	return NULL;
 }
 
-static uint32_t sdp_cstate_alloc_buf(sdp_buf_t *buf)
+static uint32_t sdp_cstate_alloc_buf(sdp_req_t *req, sdp_buf_t *buf)
 {
-	sdp_cstate_list_t *cstate = malloc(sizeof(sdp_cstate_list_t));
+	sdp_cont_info_t *cinfo = malloc(sizeof(sdp_cont_info_t));
 	uint8_t *data = malloc(buf->data_size);
 
 	memcpy(data, buf->data, buf->data_size);
-	memset((char *)cstate, 0, sizeof(sdp_cstate_list_t));
-	cstate->buf.data = data;
-	cstate->buf.data_size = buf->data_size;
-	cstate->buf.buf_size = buf->data_size;
-	cstate->timestamp = sdp_get_time();
-	cstate->next = cstates;
-	cstates = cstate;
-	return cstate->timestamp;
+	memset(cinfo, 0, sizeof(sdp_cont_info_t));
+	cinfo->buf.data = data;
+	cinfo->buf.data_size = buf->data_size;
+	cinfo->buf.buf_size = buf->data_size;
+	cinfo->timestamp = sdp_get_time();
+	cinfo->sock = req->sock;
+	cinfo->opcode = req->opcode;
+
+	cstates = sdp_list_append(cstates, cinfo);
+
+	return cinfo->timestamp;
 }
 
 /* Additional values for checking datatype (not in spec) */
@@ -274,14 +304,16 @@ static int sdp_set_cstate_pdu(sdp_buf_t *buf, sdp_cont_state_t *cstate)
 	return length;
 }
 
-static int sdp_cstate_get(uint8_t *buffer, size_t len,
-						sdp_cont_state_t **cstate)
+static int sdp_cstate_get(sdp_req_t *req, uint8_t *buffer, size_t len,
+			sdp_cont_state_t **cstate, sdp_cont_info_t **cinfo)
 {
 	uint8_t cStateSize = *buffer;
 
 	SDPDBG("Continuation State size : %d", cStateSize);
 
 	if (cStateSize == 0) {
+		/* Cleanup cstates if request doesn't contain a cstate */
+		sdp_cstate_cleanup(req->sock);
 		*cstate = NULL;
 		return 0;
 	}
@@ -306,6 +338,8 @@ static int sdp_cstate_get(uint8_t *buffer, size_t len,
 	SDPDBG("Cstate TS : 0x%x", (*cstate)->timestamp);
 	SDPDBG("Bytes sent : %d", (*cstate)->cStateValue.maxBytesSent);
 
+	*cinfo = sdp_get_cont_info(req, *cstate);
+
 	return 0;
 }
 
@@ -360,6 +394,7 @@ static int service_search_req(sdp_req_t *req, sdp_buf_t *buf)
 	uint16_t expected, actual, rsp_count = 0;
 	uint8_t dtd;
 	sdp_cont_state_t *cstate = NULL;
+	sdp_cont_info_t *cinfo = NULL;
 	uint8_t *pCacheBuffer = NULL;
 	int handleSize = 0;
 	uint32_t cStateId = 0;
@@ -399,9 +434,9 @@ static int service_search_req(sdp_req_t *req, sdp_buf_t *buf)
 
 	/*
 	 * Check if continuation state exists, if yes attempt
-	 * to get rsp remainder from cache, else send error
+	 * to get rsp remainder from continuation info, else send error
 	 */
-	if (sdp_cstate_get(pdata, data_left, &cstate) < 0) {
+	if (sdp_cstate_get(req, pdata, data_left, &cstate, &cinfo) < 0) {
 		status = SDP_INVALID_SYNTAX;
 		goto done;
 	}
@@ -451,7 +486,7 @@ static int service_search_req(sdp_req_t *req, sdp_buf_t *buf)
 
 		if (rsp_count > actual) {
 			/* cache the rsp and generate a continuation state */
-			cStateId = sdp_cstate_alloc_buf(buf);
+			cStateId = sdp_cstate_alloc_buf(req, buf);
 			/*
 			 * subtract handleSize since we now send only
 			 * a subset of handles
@@ -459,6 +494,7 @@ static int service_search_req(sdp_req_t *req, sdp_buf_t *buf)
 			buf->data_size -= handleSize;
 		} else {
 			/* NULL continuation state */
+			sdp_cont_info_free(cinfo);
 			sdp_set_cstate_pdu(buf, NULL);
 		}
 	}
@@ -468,13 +504,15 @@ static int service_search_req(sdp_req_t *req, sdp_buf_t *buf)
 		short lastIndex = 0;
 
 		if (cstate) {
-			/*
-			 * Get the previous sdp_cont_state_t and obtain
-			 * the cached rsp
-			 */
-			sdp_buf_t *pCache = sdp_get_cached_rsp(cstate);
-			if (pCache) {
-				pCacheBuffer = pCache->data;
+			if (cinfo) {
+				/* Check if requesting more than available */
+				if (cstate->cStateValue.maxBytesSent >=
+						cinfo->buf.data_size) {
+					status = SDP_INVALID_CSTATE;
+					goto done;
+				}
+
+				pCacheBuffer = cinfo->buf.data;
 				/* get the rsp_count from the cached buffer */
 				rsp_count = get_be16(pCacheBuffer);
 
@@ -518,6 +556,7 @@ static int service_search_req(sdp_req_t *req, sdp_buf_t *buf)
 		if (i == rsp_count) {
 			/* set "null" continuationState */
 			sdp_set_cstate_pdu(buf, NULL);
+			sdp_cont_info_free(cinfo);
 		} else {
 			/*
 			 * there's more: set lastIndexSent to
@@ -540,6 +579,7 @@ static int service_search_req(sdp_req_t *req, sdp_buf_t *buf)
 
 done:
 	free(cstate);
+
 	if (pattern)
 		sdp_list_free(pattern, free);
 
@@ -619,15 +659,21 @@ static int extract_attrs(sdp_record_t *rec, sdp_list_t *seq, sdp_buf_t *buf)
 }
 
 /* Build cstate response */
-static int sdp_cstate_rsp(sdp_cont_state_t *cstate, sdp_buf_t *buf,
-							uint16_t max)
+static int sdp_cstate_rsp(sdp_cont_info_t *cinfo, sdp_cont_state_t *cstate,
+					sdp_buf_t *buf, uint16_t max)
 {
-	/* continuation State exists -> get from cache */
-	sdp_buf_t *cache = sdp_get_cached_rsp(cstate);
+	sdp_buf_t *cache;
 	uint16_t sent;
 
-	if (!cache)
+	if (!cinfo)
+		return 0;
+
+	if (cstate->cStateValue.maxBytesSent >= cinfo->buf.data_size) {
+		sdp_cont_info_free(cinfo);
 		return 0;
+	}
+
+	cache = &cinfo->buf;
 
 	sent = MIN(max, cache->data_size - cstate->cStateValue.maxBytesSent);
 	memcpy(buf->data, cache->data + cstate->cStateValue.maxBytesSent, sent);
@@ -637,8 +683,10 @@ static int sdp_cstate_rsp(sdp_cont_state_t *cstate, sdp_buf_t *buf,
 	SDPDBG("Response size : %d sending now : %d bytes sent so far : %d",
 		cache->data_size, sent, cstate->cStateValue.maxBytesSent);
 
-	if (cstate->cStateValue.maxBytesSent == cache->data_size)
+	if (cstate->cStateValue.maxBytesSent == cache->data_size) {
+		sdp_cont_info_free(cinfo);
 		return sdp_set_cstate_pdu(buf, NULL);
+	}
 
 	return sdp_set_cstate_pdu(buf, cstate);
 }
@@ -652,6 +700,7 @@ static int sdp_cstate_rsp(sdp_cont_state_t *cstate, sdp_buf_t *buf,
 static int service_attr_req(sdp_req_t *req, sdp_buf_t *buf)
 {
 	sdp_cont_state_t *cstate = NULL;
+	sdp_cont_info_t *cinfo = NULL;
 	short cstate_size = 0;
 	sdp_list_t *seq = NULL;
 	uint8_t dtd = 0;
@@ -708,7 +757,7 @@ static int service_attr_req(sdp_req_t *req, sdp_buf_t *buf)
 	 * if continuation state exists, attempt
 	 * to get rsp remainder from cache, else send error
 	 */
-	if (sdp_cstate_get(pdata, data_left, &cstate) < 0) {
+	if (sdp_cstate_get(req, pdata, data_left, &cstate, &cinfo) < 0) {
 		status = SDP_INVALID_SYNTAX;
 		goto done;
 	}
@@ -737,7 +786,7 @@ static int service_attr_req(sdp_req_t *req, sdp_buf_t *buf)
 	buf->buf_size -= sizeof(uint16_t);
 
 	if (cstate) {
-		cstate_size = sdp_cstate_rsp(cstate, buf, max_rsp_size);
+		cstate_size = sdp_cstate_rsp(cinfo, cstate, buf, max_rsp_size);
 		if (!cstate_size) {
 			status = SDP_INVALID_CSTATE;
 			error("NULL cache buffer and non-NULL continuation state");
@@ -749,7 +798,7 @@ static int service_attr_req(sdp_req_t *req, sdp_buf_t *buf)
 			sdp_cont_state_t newState;
 
 			memset((char *)&newState, 0, sizeof(sdp_cont_state_t));
-			newState.timestamp = sdp_cstate_alloc_buf(buf);
+			newState.timestamp = sdp_cstate_alloc_buf(req, buf);
 			/*
 			 * Reset the buffer size to the maximum expected and
 			 * set the sdp_cont_state_t
@@ -793,6 +842,7 @@ static int service_search_attr_req(sdp_req_t *req, sdp_buf_t *buf)
 	int scanned, rsp_count = 0;
 	sdp_list_t *pattern = NULL, *seq = NULL, *svcList;
 	sdp_cont_state_t *cstate = NULL;
+	sdp_cont_info_t *cinfo = NULL;
 	short cstate_size = 0;
 	uint8_t dtd = 0;
 	sdp_buf_t tmpbuf;
@@ -852,7 +902,7 @@ static int service_search_attr_req(sdp_req_t *req, sdp_buf_t *buf)
 	 * if continuation state exists attempt
 	 * to get rsp remainder from cache, else send error
 	 */
-	if (sdp_cstate_get(pdata, data_left, &cstate) < 0) {
+	if (sdp_cstate_get(req, pdata, data_left, &cstate, &cinfo) < 0) {
 		status = SDP_INVALID_SYNTAX;
 		goto done;
 	}
@@ -906,7 +956,7 @@ static int service_search_attr_req(sdp_req_t *req, sdp_buf_t *buf)
 			sdp_cont_state_t newState;
 
 			memset((char *)&newState, 0, sizeof(sdp_cont_state_t));
-			newState.timestamp = sdp_cstate_alloc_buf(buf);
+			newState.timestamp = sdp_cstate_alloc_buf(req, buf);
 			/*
 			 * Reset the buffer size to the maximum expected and
 			 * set the sdp_cont_state_t
@@ -917,7 +967,7 @@ static int service_search_attr_req(sdp_req_t *req, sdp_buf_t *buf)
 		} else
 			cstate_size = sdp_set_cstate_pdu(buf, NULL);
 	} else {
-		cstate_size = sdp_cstate_rsp(cstate, buf, max);
+		cstate_size = sdp_cstate_rsp(cinfo, cstate, buf, max);
 		if (!cstate_size) {
 			status = SDP_INVALID_CSTATE;
 			SDPDBG("Non-null continuation state, but null cache buffer");
@@ -974,6 +1024,9 @@ static void process_request(sdp_req_t *req)
 		status = SDP_INVALID_PDU_SIZE;
 		goto send_rsp;
 	}
+
+	req->opcode = reqhdr->pdu_id;
+
 	switch (reqhdr->pdu_id) {
 	case SDP_SVC_SEARCH_REQ:
 		SDPDBG("Got a svc srch req");
@@ -1020,6 +1073,8 @@ static void process_request(sdp_req_t *req)
 
 send_rsp:
 	if (status) {
+		/* Cleanup cstates on error */
+		sdp_cstate_cleanup(req->sock);
 		rsphdr->pdu_id = SDP_ERROR_RSP;
 		put_be16(status, rsp.data);
 		rsp.data_size = sizeof(uint16_t);
@@ -1108,3 +1163,20 @@ void handle_request(int sk, uint8_t *data, int len)
 
 	process_request(&req);
 }
+
+void sdp_cstate_cleanup(int sock)
+{
+	sdp_list_t *list;
+
+	/* Remove any cinfo for the client */
+	for (list = cstates; list;) {
+		sdp_cont_info_t *cinfo = list->data;
+
+		list = list->next;
+
+		if (cinfo->sock != sock)
+			continue;
+
+		sdp_cont_info_free(cinfo);
+	}
+}
diff --git a/src/sdpd-server.c b/src/sdpd-server.c
index 9f4b51dac..748cbeb61 100644
--- a/src/sdpd-server.c
+++ b/src/sdpd-server.c
@@ -146,16 +146,12 @@ static gboolean io_session_event(GIOChannel *chan, GIOCondition cond, gpointer d
 
 	sk = g_io_channel_unix_get_fd(chan);
 
-	if (cond & (G_IO_HUP | G_IO_ERR)) {
-		sdp_svcdb_collect_all(sk);
-		return FALSE;
-	}
+	if (cond & (G_IO_HUP | G_IO_ERR))
+		goto cleanup;
 
 	len = recv(sk, &hdr, sizeof(sdp_pdu_hdr_t), MSG_PEEK);
-	if (len < 0 || (unsigned int) len < sizeof(sdp_pdu_hdr_t)) {
-		sdp_svcdb_collect_all(sk);
-		return FALSE;
-	}
+	if (len < 0 || (unsigned int) len < sizeof(sdp_pdu_hdr_t))
+		goto cleanup;
 
 	size = sizeof(sdp_pdu_hdr_t) + ntohs(hdr.plen);
 	buf = malloc(size);
@@ -168,14 +164,18 @@ static gboolean io_session_event(GIOChannel *chan, GIOCondition cond, gpointer d
 	 * inside handle_request() in order to produce ErrorResponse.
 	 */
 	if (len <= 0) {
-		sdp_svcdb_collect_all(sk);
 		free(buf);
-		return FALSE;
+		goto cleanup;
 	}
 
 	handle_request(sk, buf, len);
 
 	return TRUE;
+
+cleanup:
+	sdp_svcdb_collect_all(sk);
+	sdp_cstate_cleanup(sk);
+	return FALSE;
 }
 
 static gboolean io_accept_event(GIOChannel *chan, GIOCondition cond, gpointer data)
diff --git a/src/sdpd.h b/src/sdpd.h
index 9488535d3..d4b8f2f5b 100644
--- a/src/sdpd.h
+++ b/src/sdpd.h
@@ -27,8 +27,11 @@ typedef struct request {
 	int      flags;
 	uint8_t  *buf;
 	int      len;
+	uint8_t  opcode;
 } sdp_req_t;
 
+void sdp_cstate_cleanup(int sock);
+
 void handle_internal_request(int sk, int mtu, void *data, int len);
 void handle_request(int sk, uint8_t *data, int len);
 
diff --git a/unit/test-sdp.c b/unit/test-sdp.c
index d3a885f19..8f95fcb71 100644
--- a/unit/test-sdp.c
+++ b/unit/test-sdp.c
@@ -235,7 +235,7 @@ static gboolean client_handler(GIOChannel *channel, GIOCondition cond,
 	tester_monitor('>', 0x0000, 0x0001, buf, len);
 
 	g_assert(len > 0);
-	g_assert((size_t) len == rsp_pdu->raw_size + rsp_pdu->cont_len);
+	g_assert_cmpuint(len, ==, rsp_pdu->raw_size + rsp_pdu->cont_len);
 
 	g_assert(memcmp(buf, rsp_pdu->raw_data,	rsp_pdu->raw_size) == 0);
 
-- 
2.33.1

