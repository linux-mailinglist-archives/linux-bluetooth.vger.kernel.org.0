Return-Path: <linux-bluetooth+bounces-2532-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E024F87C293
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Mar 2024 19:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D07C1F21D1F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Mar 2024 18:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B991777637;
	Thu, 14 Mar 2024 18:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="WQT3m0ss"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A2276F1A
	for <linux-bluetooth@vger.kernel.org>; Thu, 14 Mar 2024 18:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710440499; cv=pass; b=J6MuEtEr9Z3oOMFz09908YRyUk7wmgtWWMXo5jxqdB4jwOhxdQMnq8DNVqxJ0A3cM8SbB8IM9uxc/7joxycCv8r8kuV6vYk66JPv3Svj4MDuMxaryF6GTxIm7y0+zw6Anav1HyQoaJlTbjBug9p/IjXTUhZFVmc3AlPEA4jONy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710440499; c=relaxed/simple;
	bh=HPBHqUvTIk8ZkfujlIF1JNSb67Sjs238Y8dzpCkUqvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eiBKU4dwgc/K38ps5IL44zJUNzacXSizw4B+IweOCNUZxu+a+Ihc+F0LQbZ5ngK+3fWazA1HkhowJOPrxH4nNbQWgZcsG96zBo2HgDO7ebkOuf9XQI/AHswVL5IVgefaKkmSNhEw+XoEkTSViVs8ZNTzIFcZQEtusD/IguFSXhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=WQT3m0ss; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from monolith.lan (unknown [193.138.7.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TwbLJ15KHz49PwQ;
	Thu, 14 Mar 2024 20:21:28 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1710440488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PuYtDCBuNW6LF6P42ZRMelLjm1b3B+qDfqrXHnj+Rzc=;
	b=WQT3m0ssBqeYl/9BwOMkOTAZBc873ADTORug8u7JWsVRtQXBX5vh7dZfY8l1Cx5RFL756G
	NwO2J5Edw3BmUBfVnDGEn6wq9FGvBjaz9wupGAoRO0kRP0S4jxxavNegRuSbv2vidlSfmk
	ewhzBmhLpDZ0Wg1dO0mjUx/YHIbFJFPmurgah5PuIZtjx2ahnh3pP59Ax0VvuAhcznIaJu
	WtrWfxuMZlm3/lxmM4IavfAo3cK0OgC4B8fXfw5LHxykjhtphfNhmjLMHTR+rjuw7JQvb+
	rPlpLmKO2BIiA5jfGl48lYd3AH+5iG886PzNy9Ot9PY4fmbENSNzF2tVtEOKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1710440488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PuYtDCBuNW6LF6P42ZRMelLjm1b3B+qDfqrXHnj+Rzc=;
	b=RHNx0lBPhhzIqMzkP4rDmyRloVfaeuCOnRQpFKnHuNg4OWRtkAom/kJVL1iJ1TIkQqpC2h
	O3nNHvynmdLAyudiRPRJdUKk/OfohhCYLJGEYls0KvHQV4JTu9xZSHIU2BwYHBdr/3t0gJ
	S9qhuqAfl09bnuokxhzNtY49xhDCMLZRhLzhQNLQC2bg9AnvMyQfyZH1o91x3U/qttXoZv
	FC4nWRZpUia6vZfUXx05vf2JrT4tUxO+AA6cO9QY21RvIi0gK+QGO1Ltb23SnRvP18vp5H
	vXI0JJ3MyaXiLa+d7e4zYJe+PhKQOmqk1F+OxML1eit1IZM1puNhbGbbjSSw5Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1710440488; a=rsa-sha256;
	cv=none;
	b=APlR9vpfdXzVgzxg/0mrSsuIJLmDr5WcvUVUG7Drorxb1OYIfEm/J0sRHAvoGl4kye6Zja
	66wpdmTYes7saUUipn9z2BhexIOnJKhlHYlLIOCbkngdsPB2arXOGZ1tNWNb2vjrk8/CUq
	+XD1wBW6J2wZsRvvA00iULBiZQRHriAFf/hdpqWbLN3F7W2BUoH+fEFmiZs+diCB1EMiwH
	oDkTDe35kNA3UsLUKEnhBLcuiB40OMxXrHjpgvTWQQNjzMWt1Jz03gmHzNqXfmI1S+CMmQ
	XrNkEGDEsX++NllVBhznARuPmitvz5QcbItVdxBLVw8iH/m9KfUbMoIolAzYuw==
From: Pauli Virtanen <pav@iki.fi>
To: linux-bluetooth@vger.kernel.org
Cc: Pauli Virtanen <pav@iki.fi>
Subject: [PATCH BlueZ v2 2/9] iso-tester: Add tests for TX timestamping
Date: Thu, 14 Mar 2024 20:21:11 +0200
Message-ID: <a397066c68670140ba77337b95eb562a87fcba5c.1710440408.git.pav@iki.fi>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710440408.git.pav@iki.fi>
References: <cover.1710440408.git.pav@iki.fi>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add TX timestamping test utilities in new tester-utils.h, so that they
can be shared between testers.

Add tests:

ISO Send - TX Timestamping
ISO Send - TX Sched Timestamping
ISO Send - TX Msg Timestamping
---
 tools/iso-tester.c   | 169 ++++++++++++++++++++++++++++++++++++++++---
 tools/tester-utils.h | 163 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 322 insertions(+), 10 deletions(-)
 create mode 100644 tools/tester-utils.h

diff --git a/tools/iso-tester.c b/tools/iso-tester.c
index 1864b9e9d..08f8d0286 100644
--- a/tools/iso-tester.c
+++ b/tools/iso-tester.c
@@ -18,6 +18,9 @@
 #include <poll.h>
 #include <stdbool.h>
 
+#include <linux/errqueue.h>
+#include <linux/net_tstamp.h>
+
 #include <glib.h>
 
 #include "lib/bluetooth.h"
@@ -34,6 +37,8 @@
 #include "src/shared/util.h"
 #include "src/shared/queue.h"
 
+#include "tester-utils.h"
+
 #define QOS_IO(_interval, _latency, _sdu, _phy, _rtn) \
 { \
 	.interval = _interval, \
@@ -462,11 +467,12 @@ struct test_data {
 	uint16_t handle;
 	uint16_t acl_handle;
 	struct queue *io_queue;
-	unsigned int io_id[2];
+	unsigned int io_id[3];
 	uint8_t client_num;
 	int step;
 	bool reconnect;
 	bool suspending;
+	struct tx_tstamp_data tx_ts;
 };
 
 struct iso_client_data {
@@ -487,6 +493,10 @@ struct iso_client_data {
 	size_t base_len;
 	bool listen_bind;
 	bool pa_bind;
+	uint32_t so_timestamping;
+	bool msg_timestamping;
+	unsigned int send_extra;
+	unsigned int send_extra_pre_ts;
 };
 
 static void mgmt_debug(const char *str, void *user_data)
@@ -675,15 +685,14 @@ static void io_free(void *data)
 static void test_data_free(void *test_data)
 {
 	struct test_data *data = test_data;
+	unsigned int i;
 
 	if (data->io_queue)
 		queue_destroy(data->io_queue, io_free);
 
-	if (data->io_id[0] > 0)
-		g_source_remove(data->io_id[0]);
-
-	if (data->io_id[1] > 0)
-		g_source_remove(data->io_id[1]);
+	for (i = 0; i < ARRAY_SIZE(data->io_id); ++i)
+		if (data->io_id[i] > 0)
+			g_source_remove(data->io_id[i]);
 
 	free(data);
 }
@@ -985,6 +994,38 @@ static const struct iso_client_data connect_16_2_1_send = {
 	.send = &send_16_2_1,
 };
 
+static const struct iso_client_data connect_send_tx_timestamping = {
+	.qos = QOS_16_2_1,
+	.expect_err = 0,
+	.send = &send_16_2_1,
+	.so_timestamping = (SOF_TIMESTAMPING_SOFTWARE |
+					SOF_TIMESTAMPING_OPT_ID |
+					SOF_TIMESTAMPING_TX_SOFTWARE),
+	.send_extra = 1,
+	.send_extra_pre_ts = 2,
+};
+
+static const struct iso_client_data connect_send_tx_sched_timestamping = {
+	.qos = QOS_16_2_1,
+	.expect_err = 0,
+	.send = &send_16_2_1,
+	.so_timestamping = (SOF_TIMESTAMPING_SOFTWARE |
+					SOF_TIMESTAMPING_TX_SOFTWARE |
+					SOF_TIMESTAMPING_OPT_TSONLY |
+					SOF_TIMESTAMPING_TX_SCHED),
+	.send_extra = 1,
+};
+
+static const struct iso_client_data connect_send_tx_msg_timestamping = {
+	.qos = QOS_16_2_1,
+	.expect_err = 0,
+	.send = &send_16_2_1,
+	.so_timestamping = (SOF_TIMESTAMPING_SOFTWARE |
+					SOF_TIMESTAMPING_TX_SOFTWARE),
+	.send_extra = 1,
+	.msg_timestamping = true,
+};
+
 static const struct iso_client_data listen_16_2_1_recv = {
 	.qos = QOS_16_2_1,
 	.expect_err = 0,
@@ -1408,14 +1449,17 @@ static void bthost_recv_data(const void *buf, uint16_t len, void *user_data)
 	struct test_data *data = user_data;
 	const struct iso_client_data *isodata = data->test_data;
 
+	--data->step;
+
 	tester_print("Client received %u bytes of data", len);
 
 	if (isodata->send && (isodata->send->iov_len != len ||
 			memcmp(isodata->send->iov_base, buf, len))) {
 		if (!isodata->recv->iov_base)
 			tester_test_failed();
-	} else
+	} else if (!data->step) {
 		tester_test_passed();
+	}
 }
 
 static void bthost_iso_disconnected(void *user_data)
@@ -2056,17 +2100,95 @@ static void iso_recv(struct test_data *data, GIOChannel *io)
 	data->io_id[0] = g_io_add_watch(io, G_IO_IN, iso_recv_data, data);
 }
 
-static void iso_send(struct test_data *data, GIOChannel *io)
+static gboolean iso_recv_errqueue(GIOChannel *io, GIOCondition cond,
+							gpointer user_data)
 {
+	struct test_data *data = user_data;
 	const struct iso_client_data *isodata = data->test_data;
-	ssize_t ret;
+	int sk = g_io_channel_unix_get_fd(io);
+	int err;
+
+	data->step--;
+
+	err = tx_tstamp_recv(&data->tx_ts, sk, isodata->send->iov_len);
+	if (err > 0)
+		return TRUE;
+	else if (!err && !data->step)
+		tester_test_passed();
+	else
+		tester_test_failed();
+
+	data->io_id[2] = 0;
+	return FALSE;
+}
+
+static void iso_tx_timestamping(struct test_data *data, GIOChannel *io)
+{
+	const struct iso_client_data *isodata = data->test_data;
+	struct so_timestamping so = {
+		.flags = isodata->so_timestamping,
+	};
 	int sk;
+	int err;
+	unsigned int count;
+
+	if (!(isodata->so_timestamping & SOF_TIMESTAMPING_TX_RECORD_MASK))
+		return;
+
+	tester_print("Enabling TX timestamping");
+
+	tx_tstamp_init(&data->tx_ts, isodata->so_timestamping);
+
+	for (count = 0; count < isodata->send_extra + 1; ++count)
+		data->step += tx_tstamp_expect(&data->tx_ts);
 
 	sk = g_io_channel_unix_get_fd(io);
 
+	data->io_id[2] = g_io_add_watch(io, G_IO_ERR, iso_recv_errqueue, data);
+
+	if (isodata->msg_timestamping)
+		so.flags &= ~SOF_TIMESTAMPING_TX_RECORD_MASK;
+
+	err = setsockopt(sk, SOL_SOCKET, SO_TIMESTAMPING, &so, sizeof(so));
+	if (err < 0) {
+		tester_warn("setsockopt SO_TIMESTAMPING: %s (%d)",
+						strerror(errno), errno);
+		tester_test_failed();
+		return;
+	}
+}
+
+static void iso_send_data(struct test_data *data, GIOChannel *io)
+{
+	const struct iso_client_data *isodata = data->test_data;
+	char control[CMSG_SPACE(sizeof(uint32_t))];
+	struct msghdr msg = {
+		.msg_iov = (struct iovec *)isodata->send,
+		.msg_iovlen = 1,
+	};
+	struct cmsghdr *cmsg;
+	ssize_t ret;
+	int sk;
+
 	tester_print("Writing %zu bytes of data", isodata->send->iov_len);
 
-	ret = writev(sk, isodata->send, 1);
+	sk = g_io_channel_unix_get_fd(io);
+
+	if (isodata->msg_timestamping) {
+		memset(control, 0, sizeof(control));
+		msg.msg_control = control;
+		msg.msg_controllen = sizeof(control);
+
+		cmsg = CMSG_FIRSTHDR(&msg);
+		cmsg->cmsg_level = SOL_SOCKET;
+		cmsg->cmsg_type = SO_TIMESTAMPING;
+		cmsg->cmsg_len = CMSG_LEN(sizeof(uint32_t));
+
+		*((uint32_t *)CMSG_DATA(cmsg)) = (isodata->so_timestamping &
+					SOF_TIMESTAMPING_TX_RECORD_MASK);
+	}
+
+	ret = sendmsg(sk, &msg, 0);
 	if (ret < 0 || isodata->send->iov_len != (size_t) ret) {
 		tester_warn("Failed to write %zu bytes: %s (%d)",
 				isodata->send->iov_len, strerror(errno), errno);
@@ -2074,6 +2196,22 @@ static void iso_send(struct test_data *data, GIOChannel *io)
 		return;
 	}
 
+	data->step++;
+}
+
+static void iso_send(struct test_data *data, GIOChannel *io)
+{
+	const struct iso_client_data *isodata = data->test_data;
+	unsigned int count;
+
+	for (count = 0; count < isodata->send_extra_pre_ts; ++count)
+		iso_send_data(data, io);
+
+	iso_tx_timestamping(data, io);
+
+	for (count = 0; count < isodata->send_extra + 1; ++count)
+		iso_send_data(data, io);
+
 	if (isodata->bcast) {
 		tester_test_passed();
 		return;
@@ -3172,6 +3310,17 @@ int main(int argc, char *argv[])
 	test_iso("ISO Send - Success", &connect_16_2_1_send, setup_powered,
 							test_connect);
 
+	test_iso("ISO Send - TX Timestamping", &connect_send_tx_timestamping,
+						setup_powered, test_connect);
+
+	test_iso("ISO Send - TX Sched Timestamping",
+			&connect_send_tx_sched_timestamping, setup_powered,
+			test_connect);
+
+	test_iso("ISO Send - TX Msg Timestamping",
+			&connect_send_tx_msg_timestamping, setup_powered,
+			test_connect);
+
 	test_iso("ISO Receive - Success", &listen_16_2_1_recv, setup_powered,
 							test_listen);
 
diff --git a/tools/tester-utils.h b/tools/tester-utils.h
new file mode 100644
index 000000000..617de842e
--- /dev/null
+++ b/tools/tester-utils.h
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: LGPL-2.1-or-later
+/*
+ *
+ *  BlueZ - Bluetooth protocol stack for Linux
+ *
+ *  Copyright (C) 2022  Intel Corporation.
+ *
+ */
+
+#include <stdbool.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <time.h>
+#include <sys/socket.h>
+#include <linux/errqueue.h>
+#include <linux/net_tstamp.h>
+
+#include <glib.h>
+
+#define SEC_NSEC(_t)  ((_t) * 1000000000LL)
+#define TS_NSEC(_ts)  (SEC_NSEC((_ts)->tv_sec) + (_ts)->tv_nsec)
+
+struct tx_tstamp_data {
+	struct {
+		uint32_t id;
+		uint32_t type;
+	} expect[16];
+	unsigned int pos;
+	unsigned int count;
+	unsigned int sent;
+	uint32_t so_timestamping;
+};
+
+static inline void tx_tstamp_init(struct tx_tstamp_data *data,
+				uint32_t so_timestamping)
+{
+	memset(data, 0, sizeof(*data));
+	memset(data->expect, 0xff, sizeof(data->expect));
+
+	data->so_timestamping = so_timestamping;
+}
+
+static inline int tx_tstamp_expect(struct tx_tstamp_data *data)
+{
+	unsigned int pos = data->count;
+	int steps;
+
+	if (data->so_timestamping & SOF_TIMESTAMPING_TX_SCHED) {
+		g_assert(pos < ARRAY_SIZE(data->expect));
+		data->expect[pos].type = SCM_TSTAMP_SCHED;
+		data->expect[pos].id = data->sent;
+		pos++;
+	}
+
+	if (data->so_timestamping & SOF_TIMESTAMPING_TX_SOFTWARE) {
+		g_assert(pos < ARRAY_SIZE(data->expect));
+		data->expect[pos].type = SCM_TSTAMP_SND;
+		data->expect[pos].id = data->sent;
+		pos++;
+	}
+
+	data->sent++;
+
+	steps = pos - data->count;
+	data->count = pos;
+	return steps;
+}
+
+static inline int tx_tstamp_recv(struct tx_tstamp_data *data, int sk, int len)
+{
+	unsigned char control[512];
+	ssize_t ret;
+	char buf[1024];
+	struct msghdr msg;
+	struct iovec iov;
+	struct cmsghdr *cmsg;
+	struct scm_timestamping *tss = NULL;
+	struct sock_extended_err *serr = NULL;
+	struct timespec now;
+
+	iov.iov_base = buf;
+	iov.iov_len = sizeof(buf);
+
+	memset(&msg, 0, sizeof(msg));
+	msg.msg_iov = &iov;
+	msg.msg_iovlen = 1;
+	msg.msg_control = control;
+	msg.msg_controllen = sizeof(control);
+
+	ret = recvmsg(sk, &msg, MSG_ERRQUEUE);
+	if (ret < 0) {
+		tester_warn("Failed to read from errqueue: %s (%d)",
+							strerror(errno), errno);
+		return -EINVAL;
+	}
+
+	if (data->so_timestamping & SOF_TIMESTAMPING_OPT_TSONLY) {
+		if (ret != 0) {
+			tester_warn("Packet copied back to errqueue");
+			return -EINVAL;
+		}
+	} else if (len > ret) {
+		tester_warn("Packet not copied back to errqueue: %zd", ret);
+		return -EINVAL;
+	}
+
+	for (cmsg = CMSG_FIRSTHDR(&msg); cmsg != NULL;
+					cmsg = CMSG_NXTHDR(&msg, cmsg)) {
+		if (cmsg->cmsg_level == SOL_SOCKET &&
+					cmsg->cmsg_type == SCM_TIMESTAMPING) {
+			tss = (void *)CMSG_DATA(cmsg);
+		} else if (cmsg->cmsg_level == SOL_BLUETOOTH &&
+					cmsg->cmsg_type == BT_SCM_ERROR) {
+			serr = (void *)CMSG_DATA(cmsg);
+		}
+	}
+
+	if (!tss) {
+		tester_warn("SCM_TIMESTAMPING not found");
+		return -EINVAL;
+	}
+
+	if (!serr) {
+		tester_warn("BT_SCM_ERROR not found");
+		return -EINVAL;
+	}
+
+	if (serr->ee_errno != ENOMSG ||
+				serr->ee_origin != SO_EE_ORIGIN_TIMESTAMPING) {
+		tester_warn("BT_SCM_ERROR wrong for timestamping");
+		return -EINVAL;
+	}
+
+	clock_gettime(CLOCK_REALTIME, &now);
+
+	if (TS_NSEC(&now) < TS_NSEC(tss->ts) ||
+			TS_NSEC(&now) > TS_NSEC(tss->ts) + SEC_NSEC(10)) {
+		tester_warn("nonsense in timestamp");
+		return -EINVAL;
+	}
+
+	if (data->pos >= data->count) {
+		tester_warn("Too many timestamps");
+		return -EINVAL;
+	}
+
+	if ((data->so_timestamping & SOF_TIMESTAMPING_OPT_ID) &&
+				serr->ee_data != data->expect[data->pos].id) {
+		tester_warn("Bad timestamp id %u", serr->ee_data);
+		return -EINVAL;
+	}
+
+	if (serr->ee_info != data->expect[data->pos].type) {
+		tester_warn("Bad timestamp type %u", serr->ee_info);
+		return -EINVAL;
+	}
+
+	tester_print("Got valid TX timestamp %u", data->pos);
+
+	++data->pos;
+
+	return data->count - data->pos;
+}
-- 
2.44.0


