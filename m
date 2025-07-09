Return-Path: <linux-bluetooth+bounces-13815-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B55EAFE8BA
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Jul 2025 14:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EE29560881
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Jul 2025 12:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005142DA74C;
	Wed,  9 Jul 2025 12:21:07 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B5A2D9EF5
	for <linux-bluetooth@vger.kernel.org>; Wed,  9 Jul 2025 12:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752063666; cv=none; b=HDEo4HsjogM10qptsXiRjTst3sh8Ci1+h3Rf5gChsMmp/tzOfqAQ2jePa1rd5g6JwQImBqU5ue88btQliV3tDlSY18DM+RmgGiXeEEFQgnpmWXfNNFxDK+HarFEumWK0dWaoDBdnsZGHBlK2wRemuUKCBzXgm5rRXEmPH5NM/TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752063666; c=relaxed/simple;
	bh=bSNF6hogunwFlHSjt2CBokZBUTG0rvEYVsVtOuGgD5Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tmrvWHLghjjop2C+OZ3AWHaD8g6zsT5gLp+1iPBC3G0z5uAJXEvqr8RiuGAbL2UQx7k60nSBO/cirYsZoP967WVA6iioqFGuSueOXwUJwYgMPBQrBEJL7JhasjUgyKz2/mWLHZy6qZhKkX2rdgz38KPxe5B9ENppMk4GsM0hUpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from inp1wst013.omp.ru (81.22.207.138) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 9 Jul
 2025 15:20:54 +0300
From: Ismagil Iskakov <i.iskakov@omp.ru>
To: <linux-bluetooth@vger.kernel.org>
CC: Ismagil Iskakov <i.iskakov@omp.ru>
Subject: [PATCH BlueZ v3 3/4] src/shared: add nullity checks
Date: Wed, 9 Jul 2025 15:18:51 +0300
Message-ID: <20250709121852.2811885-4-i.iskakov@omp.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709121852.2811885-1-i.iskakov@omp.ru>
References: <20250709121852.2811885-1-i.iskakov@omp.ru>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 07/09/2025 12:13:06
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 19
X-KSE-AntiSpam-Info: Lua profiles 194672 [Jul 09 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: i.iskakov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 63 0.3.63
 9cc2b4b18bf16653fda093d2c494e542ac094a39
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 81.22.207.138 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;81.22.207.138:7.1.2;omp.ru:7.1.1;127.0.0.199:7.1.2;inp1wst013.omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 81.22.207.138
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 19
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/09/2025 12:15:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 7/9/2025 11:17:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Check util_iov_pull_mem where iov len is not verified
beforehand. Check vcp_get_vcs for NULL.
These changes are based on other usages where those
checks exist.
---
 src/shared/bap.c | 23 +++++++++++++++++++++++
 src/shared/vcp.c |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/src/shared/bap.c b/src/shared/bap.c
index ba6f75ff2..37f70ae55 100644
--- a/src/shared/bap.c
+++ b/src/shared/bap.c
@@ -7568,6 +7568,11 @@ bool bt_bap_parse_base(uint8_t sid, struct iovec *iov,
 
 		codec = util_iov_pull_mem(iov, sizeof(*codec));
 
+		if (!codec) {
+			ret = false;
+			goto done;
+		}
+
 		util_debug(func, NULL, "Codec: ID %d CID 0x%2.2x VID 0x%2.2x",
 				codec->id, codec->cid, codec->vid);
 
@@ -7579,6 +7584,12 @@ bool bt_bap_parse_base(uint8_t sid, struct iovec *iov,
 		}
 
 		l2_cc.iov_base = util_iov_pull_mem(iov, l2_cc_len);
+
+		if (!l2_cc.iov_base) {
+			ret = false;
+			goto done;
+		}
+
 		l2_cc.iov_len = l2_cc_len;
 
 		/* Print Codec Specific Configuration */
@@ -7593,6 +7604,12 @@ bool bt_bap_parse_base(uint8_t sid, struct iovec *iov,
 		}
 
 		meta.iov_base = util_iov_pull_mem(iov, meta_len);
+
+		if (!meta.iov_base) {
+			ret = false;
+			goto done;
+		}
+
 		meta.iov_len = meta_len;
 
 		/* Print Metadata */
@@ -7623,6 +7640,12 @@ bool bt_bap_parse_base(uint8_t sid, struct iovec *iov,
 
 			l3_cc.iov_base = util_iov_pull_mem(iov,
 							l3_cc_len);
+
+			if (!l3_cc.iov_base) {
+				ret = false;
+				goto done;
+			}
+			
 			l3_cc.iov_len = l3_cc_len;
 
 			/* Print Codec Specific Configuration */
diff --git a/src/shared/vcp.c b/src/shared/vcp.c
index e614ff61f..be002ad4c 100644
--- a/src/shared/vcp.c
+++ b/src/shared/vcp.c
@@ -2934,6 +2934,9 @@ static void foreach_vcs_service(struct gatt_db_attribute *attr,
 	struct bt_vcp *vcp = user_data;
 	struct bt_vcs *vcs = vcp_get_vcs(vcp);
 
+	if (!vcs)
+		return;
+
 	vcs->service = attr;
 
 	gatt_db_service_set_claimed(attr, true);
-- 
2.34.1


