Return-Path: <linux-bluetooth+bounces-15782-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA6EBCABC2
	for <lists+linux-bluetooth@lfdr.de>; Thu, 09 Oct 2025 21:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDCF03B805C
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Oct 2025 19:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BEA25F96B;
	Thu,  9 Oct 2025 19:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GwzCgpf6"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57F225A359
	for <linux-bluetooth@vger.kernel.org>; Thu,  9 Oct 2025 19:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760039937; cv=none; b=sC8dVyauhOJb3HTJcVQDLmdkLYTw9UwZ9+s1Vg6o0O9Ja5/5OVkvM3FP+xZwEPImyAmBl/yw5yUCVKww91ABueSidLx/SNMAjjg547IcTWza6ncjlXt/kOgCbzvF9l+89EZ2yh8TefJrCqYxluRVaHG4Q3ZPFxGKWjEulMij+MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760039937; c=relaxed/simple;
	bh=fEZrdtwITvYqUAnXtge1pbZKqLjyGH1AUnzMvGl66O8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AwAUKQQSGhOGp8mU/nYyYX8VXpkKAzX+S9mBGS5KQEWuorQYIdcHYL6gkPf14E7vpA9EdHyZBTgEE4gP1AcTsXVD6tajhekqW7vQB52yCZqctyJvcCrtr0XZAnD3bjk3heZcPe7Kv5vSwD9MErAa5NYd9TguN47t21hvdv8jtBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GwzCgpf6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760039928;
	bh=fEZrdtwITvYqUAnXtge1pbZKqLjyGH1AUnzMvGl66O8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GwzCgpf6JihZNcN4DueFoIhrq+eofUJnDBbjWtce5GaQecqOSvOmv7AHksqzYbeK5
	 UuTrF9id7bUELpMFatb6gxXQOxPzuQO920jGG3OmDia/URt1kppDYZkHJ/ehT/xxcS
	 1bp84e17jJGYtoMGikFFHmrSJyWUP5aYR+Pv8Y+N6ATvUQIU1Ue0CJ4BlfyrRc5lBX
	 btdvGJC/m2EA3B4S+hiCzh1pjVHRRsFabo22mWdcbyfWphJaIXKIdJVDTvEMJyE1NS
	 iinLn4xSuamAsrf6sL+U4wysRh80M1ZVSDmoEozdjy/hXGJe4AOn73ifsDdEIumeyv
	 qx7aV2AVHukOw==
Received: from fdanis-ThinkPad-X1.. (2a02-8428-af44-1001-aB6e-1eE8-0e0E-15d0.rev.sfr.net [IPv6:2a02:8428:af44:1001:ab6e:1ee8:e0e:15d0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: fdanis)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6D6E717E12DA
	for <linux-bluetooth@vger.kernel.org>; Thu,  9 Oct 2025 21:58:48 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v2 2/6] unit/test-hfp: Add dial tests for HF
Date: Thu,  9 Oct 2025 21:58:38 +0200
Message-ID: <20251009195842.776231-2-frederic.danis@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009195842.776231-1-frederic.danis@collabora.com>
References: <20251009195842.776231-1-frederic.danis@collabora.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This add the following tests:
- /HFP/HF/OCL/BV-01-C
  Initiate a call placed to the last number
- /HFP/HF/OCL/BV-02-C
  Handling ERROR response to a call placed to last number
- /HFP/HF/OCM/BV-01-C
  Initiate a request to place a call with a memory location
- /HFP/HF/OCM/BV-02-C
  Handling ERROR response to a call placed to an empty memory location
- /HFP/HF/OCN/BV-01-C
  HF places a call with a phone number
---
 unit/test-hfp.c | 166 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/unit/test-hfp.c b/unit/test-hfp.c
index 190604ba2..8afb15fa3 100644
--- a/unit/test-hfp.c
+++ b/unit/test-hfp.c
@@ -739,13 +739,62 @@ static void hf_cmd_complete(enum hfp_result res, enum hfp_error cme_err,
 	g_assert_cmpint(res, ==, HFP_RESULT_OK);
 }
 
+static void hf_cmd_error(enum hfp_result res, enum hfp_error cme_err,
+							void *user_data)
+{
+	g_assert_cmpint(res, ==, HFP_RESULT_ERROR);
+}
+
 static void hf_session_ready_cb(enum hfp_result res, enum hfp_error cme_err,
 							void *user_data)
 {
 	struct context *context = user_data;
+	const char *test_name = context->data->test_name;
 
 	g_assert_cmpint(res, ==, HFP_RESULT_OK);
 	context->session.completed = true;
+
+	if (g_str_equal(test_name, "/HFP/HF/OCL/BV-01-C")) {
+		bool ret;
+
+		if (tester_use_debug())
+			tester_debug("calling last dialed number");
+		ret = hfp_hf_dial(context->hfp_hf, "", hf_cmd_complete,
+							context);
+		g_assert(ret);
+	} else if (g_str_equal(test_name, "/HFP/HF/OCL/BV-02-C")) {
+		bool ret;
+
+		if (tester_use_debug())
+			tester_debug("calling last dialed number");
+		ret = hfp_hf_dial(context->hfp_hf, "", hf_cmd_error,
+							context);
+		g_assert(ret);
+	} else if (g_str_equal(test_name, "/HFP/HF/OCM/BV-01-C")) {
+		bool ret;
+
+		if (tester_use_debug())
+			tester_debug("calling memory 1");
+		ret = hfp_hf_dial(context->hfp_hf, ">1", hf_cmd_complete,
+							context);
+		g_assert(ret);
+	} else if (g_str_equal(test_name, "/HFP/HF/OCM/BV-02-C")) {
+		bool ret;
+
+		if (tester_use_debug())
+			tester_debug("calling memory 1");
+		ret = hfp_hf_dial(context->hfp_hf, ">1", hf_cmd_error,
+							context);
+		g_assert(ret);
+	} else if (g_str_equal(test_name, "/HFP/HF/OCN/BV-01-C")) {
+		bool ret;
+
+		if (tester_use_debug())
+			tester_debug("calling number");
+		ret = hfp_hf_dial(context->hfp_hf, "1234567", hf_cmd_complete,
+							context);
+		g_assert(ret);
+	}
 }
 
 static void hf_update_indicator(enum hfp_indicator indicator, uint32_t val,
@@ -836,6 +885,27 @@ static void hf_call_added(uint id, enum hfp_call_status status,
 		g_str_equal(test_name, "/HFP/HF/TCA/BV-02-C")) {
 		g_assert_cmpint(id, ==, 1);
 		g_assert_cmpint(status, ==, CALL_STATUS_INCOMING);
+	} else if (g_str_equal(test_name, "/HFP/HF/OCL/BV-01-C")) {
+		const char *number;
+
+		g_assert_cmpint(id, ==, 1);
+		g_assert_cmpint(status, ==, CALL_STATUS_DIALING);
+		number = hfp_hf_call_get_number(context->hfp_hf, id);
+		g_assert_null(number);
+	} else if (g_str_equal(test_name, "/HFP/HF/OCM/BV-01-C")) {
+		const char *number;
+
+		g_assert_cmpint(id, ==, 1);
+		g_assert_cmpint(status, ==, CALL_STATUS_DIALING);
+		number = hfp_hf_call_get_number(context->hfp_hf, id);
+		g_assert_cmpstr(number, ==, ">1");
+	} else if (g_str_equal(test_name, "/HFP/HF/OCN/BV-01-C")) {
+		const char *number;
+
+		g_assert_cmpint(id, ==, 1);
+		g_assert_cmpint(status, ==, CALL_STATUS_DIALING);
+		number = hfp_hf_call_get_number(context->hfp_hf, id);
+		g_assert_cmpstr(number, ==, "1234567");
 	} else if (g_str_equal(test_name, "/HFP/HF/TCA/BV-04-C")) {
 		bool ret;
 
@@ -917,6 +987,39 @@ static void hf_call_status_updated(uint id, enum hfp_call_status status,
 		if (tester_use_debug())
 			tester_debug("Error: unexpected update");
 		tester_test_failed();
+	} else if (g_str_equal(test_name, "/HFP/HF/OCL/BV-01-C")) {
+		const char *number;
+
+		g_assert_cmpint(id, ==, 1);
+		if (context->session.step == 0)
+			g_assert_cmpint(status, ==, CALL_STATUS_ALERTING);
+		else
+			g_assert_cmpint(status, ==, CALL_STATUS_ACTIVE);
+		number = hfp_hf_call_get_number(context->hfp_hf, id);
+		g_assert_null(number);
+		context->session.step++;
+	} else if (g_str_equal(test_name, "/HFP/HF/OCM/BV-01-C")) {
+		const char *number;
+
+		g_assert_cmpint(id, ==, 1);
+		if (context->session.step == 0)
+			g_assert_cmpint(status, ==, CALL_STATUS_ALERTING);
+		else
+			g_assert_cmpint(status, ==, CALL_STATUS_ACTIVE);
+		number = hfp_hf_call_get_number(context->hfp_hf, id);
+		g_assert_cmpstr(number, ==, ">1");
+		context->session.step++;
+	} else if (g_str_equal(test_name, "/HFP/HF/OCN/BV-01-C")) {
+		const char *number;
+
+		g_assert_cmpint(id, ==, 1);
+		if (context->session.step == 0)
+			g_assert_cmpint(status, ==, CALL_STATUS_ALERTING);
+		else
+			g_assert_cmpint(status, ==, CALL_STATUS_ACTIVE);
+		number = hfp_hf_call_get_number(context->hfp_hf, id);
+		g_assert_cmpstr(number, ==, "1234567");
+		context->session.step++;
 	} else if (g_str_equal(test_name, "/HFP/HF/TCA/BV-01-C")) {
 		const char *number;
 		bool ret;
@@ -1231,6 +1334,69 @@ int main(int argc, char *argv[])
 				'3', ',', '0', '\r', '\n'),
 			data_end());
 
+	/* Initiate a call placed to the last number - HF */
+	define_hf_test("/HFP/HF/OCL/BV-01-C", test_hf_session,
+			NULL, test_hf_session_done,
+			MINIMAL_SLC_SESSION('1', '0', '0', '0'),
+			raw_pdu('\r', '\n', 'O', 'K', '\r', '\n'),
+			frg_pdu('\r', '\n', '+', 'C', 'I', 'E', 'V', ':', ' ',
+				'3', ',', '2', '\r', '\n'),
+			frg_pdu('\r', '\n', '+', 'C', 'I', 'E', 'V', ':', ' ',
+				'3', ',', '3', '\r', '\n'),
+			frg_pdu('\r', '\n', '+', 'C', 'I', 'E', 'V', ':', ' ',
+				'2', ',', '1', '\r', '\n'),
+			frg_pdu('\r', '\n', '+', 'C', 'I', 'E', 'V', ':', ' ',
+				'3', ',', '0', '\r', '\n'),
+			data_end());
+
+	/* Handling ERROR response to a call placed to last number - HF */
+	define_hf_test("/HFP/HF/OCL/BV-02-C", test_hf_session,
+			NULL, test_hf_session_done,
+			MINIMAL_SLC_SESSION('1', '0', '0', '0'),
+			raw_pdu('\r', '\n', 'E', 'R', 'R', 'O', 'R'),
+			frg_pdu('\r', '\n'),
+			data_end());
+
+	/* Initiate a request to place a call with a memory location - HF */
+	define_hf_test("/HFP/HF/OCM/BV-01-C", test_hf_session,
+			NULL, test_hf_session_done,
+			MINIMAL_SLC_SESSION('1', '0', '0', '0'),
+			raw_pdu('\r', '\n', 'O', 'K', '\r', '\n'),
+			frg_pdu('\r', '\n', '+', 'C', 'I', 'E', 'V', ':', ' ',
+				'3', ',', '2', '\r', '\n'),
+			frg_pdu('\r', '\n', '+', 'C', 'I', 'E', 'V', ':', ' ',
+				'3', ',', '3', '\r', '\n'),
+			frg_pdu('\r', '\n', '+', 'C', 'I', 'E', 'V', ':', ' ',
+				'2', ',', '1', '\r', '\n'),
+			frg_pdu('\r', '\n', '+', 'C', 'I', 'E', 'V', ':', ' ',
+				'3', ',', '0', '\r', '\n'),
+			data_end());
+
+	/* Handling ERROR response to a call placed to an empty memory
+	 * location - HF
+	 */
+	define_hf_test("/HFP/HF/OCM/BV-02-C", test_hf_session,
+			NULL, test_hf_session_done,
+			MINIMAL_SLC_SESSION('1', '0', '0', '0'),
+			raw_pdu('\r', '\n', 'E', 'R', 'R', 'O', 'R'),
+			frg_pdu('\r', '\n'),
+			data_end());
+
+	/* HF places a call with a phone number - HF */
+	define_hf_test("/HFP/HF/OCN/BV-01-C", test_hf_session,
+			NULL, test_hf_session_done,
+			MINIMAL_SLC_SESSION('1', '0', '0', '0'),
+			raw_pdu('\r', '\n', 'O', 'K', '\r', '\n'),
+			frg_pdu('\r', '\n', '+', 'C', 'I', 'E', 'V', ':', ' ',
+				'3', ',', '2', '\r', '\n'),
+			frg_pdu('\r', '\n', '+', 'C', 'I', 'E', 'V', ':', ' ',
+				'3', ',', '3', '\r', '\n'),
+			frg_pdu('\r', '\n', '+', 'C', 'I', 'E', 'V', ':', ' ',
+				'2', ',', '1', '\r', '\n'),
+			frg_pdu('\r', '\n', '+', 'C', 'I', 'E', 'V', ':', ' ',
+				'3', ',', '0', '\r', '\n'),
+			data_end());
+
 	/* Transfer Signal Strength Indication - HF */
 	define_hf_test("/HFP/HF/PSI/BV-01-C", test_hf_session,
 			NULL, test_hf_session_done,
-- 
2.43.0


