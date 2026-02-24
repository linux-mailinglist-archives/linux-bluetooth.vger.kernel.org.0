Return-Path: <linux-bluetooth+bounces-19348-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKmLOPLAnWnzRgQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19348-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Feb 2026 16:17:06 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D2E188E56
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Feb 2026 16:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D73F7304995F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Feb 2026 15:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D9B1A2C0B;
	Tue, 24 Feb 2026 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dc5oIbDT"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037753A0B18
	for <linux-bluetooth@vger.kernel.org>; Tue, 24 Feb 2026 15:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771946185; cv=none; b=b8UkcQzdJmc+EQuOAX4H4CNYFOBao+LYZVebcPoPj8NiZbVKUXJLczpYE6eCgrzW3XLsZIS+bXHjesO8OQhf4EuNeycVH5xJ9JmyS13nd8tx1HgYPO2ZmUFH5wgcyCQ0EOkB/p31NZ0jNB+XYKCldWnaERnSJzIS76Z4MwlmE+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771946185; c=relaxed/simple;
	bh=lNyG0W9p+DPIt1HyQbjLgyu5+qJtQQQdUiQZk54AJFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fF1xY7kA6wQR5u8gv2j+rFvi2YysAweO1c1Si9SuOmsNA/rkIlvAhH71MmTSHZ2cfMs/smyZsikEBzBzDToETk/6Bdt/X2MqxgtJlMmoK3amLry3LwExTJVBEL5v1WBIjs9weY2lsZmQwxIRf9qMpBqhC5xAfI8LArZhFB+Ru4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dc5oIbDT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771946184; x=1803482184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lNyG0W9p+DPIt1HyQbjLgyu5+qJtQQQdUiQZk54AJFA=;
  b=Dc5oIbDTvY+q64ptL1Iy6dg1lMj9KjOTYKQkzSxabD+6QKCpTG5Omh0b
   aY6lo2f4uuaAR/NEiPs+qjgq1Z3d5mLNofA1jaW6o6wF/DJT2l9L4IV9G
   vsbgmdcyMhvEkXGtZuLdeSqoi0ioDqoskEwNHglwiefqU1s0N++mU117z
   6UvTuzzSOUOCqwJJY0qWDAfHScDXLWQ99lEbv7shR155xvq3xzq3kVxfs
   bpkvj0uJ7TcFhjddXVbatHkOtXmYyteJumDQQv4SWTKEvz99X6+TWO/W6
   m5DmJy87B1rBDKswFXnBx+uD/EocUa0ltr8aksttgYAzTPushmowfQh8t
   Q==;
X-CSE-ConnectionGUID: pUKOfbj7Rxe7UmwAnC+Ntw==
X-CSE-MsgGUID: eqIeWldyTDCuPs+x6ttzUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72874702"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72874702"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 07:16:23 -0800
X-CSE-ConnectionGUID: 6eTtFnt/TKK7v67T8toIvA==
X-CSE-MsgGUID: IEw7slfeS1qUtiX5x6KXww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="253676511"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orviesa001.jf.intel.com with ESMTP; 24 Feb 2026 07:16:22 -0800
From: Kiran K <kiran.k@intel.com>
To: linux-bluetooth@vger.kernel.org
Cc: ravishankar.srivatsa@intel.com,
	chandrashekar.devegowda@intel.com,
	chethan.tumkur.narayan@intel.com,
	Kiran K <kiran.k@intel.com>
Subject: [PATCH v2 6/9] Bluetooth: btintel: Add support for Scorpious Peak2F support
Date: Tue, 24 Feb 2026 21:04:45 +0530
Message-ID: <20260224153449.193551-6-kiran.k@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224153449.193551-1-kiran.k@intel.com>
References: <20260224153449.193551-1-kiran.k@intel.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19348-lists,linux-bluetooth=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[kiran.k@intel.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 72D2E188E56
X-Rspamd-Action: no action

Add support for Intel Bluetooth Scorpious Peak2F core.

Signed-off-by: Kiran K <kiran.k@intel.com>
---
 drivers/bluetooth/btintel.c      | 3 +++
 drivers/bluetooth/btintel_pcie.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index b3cbb61065d1..b6dd3ab830c7 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -498,6 +498,7 @@ int btintel_version_info_tlv(struct hci_dev *hdev,
 	case 0x1e:	/* BlazarI (Bzr) */
 	case 0x1f:      /* Scorpious Peak */
 	case 0x20:	/* Scorpious Peak2 */
+	case 0x21:	/* Scorpious Peak2 F */
 	case 0x22:	/* BlazarIW (BzrIW) */
 		break;
 	default:
@@ -3325,6 +3326,7 @@ void btintel_set_msft_opcode(struct hci_dev *hdev, u8 hw_variant)
 	case 0x1e:
 	case 0x1f:
 	case 0x20:
+	case 0x21:
 	case 0x22:
 		hci_set_msft_opcode(hdev, 0xFC1E);
 		break;
@@ -3667,6 +3669,7 @@ static int btintel_setup_combined(struct hci_dev *hdev)
 	case 0x1e:
 	case 0x1f:
 	case 0x20:
+	case 0x21:
 	case 0x22:
 		/* Display version information of TLV type */
 		btintel_version_info_tlv(hdev, &ver_tlv);
diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index bf71817b1cc6..d0cabf4df7c0 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -2107,6 +2107,7 @@ static int btintel_pcie_setup_internal(struct hci_dev *hdev)
 	case 0x1e:	/* BzrI */
 	case 0x1f:	/* ScP  */
 	case 0x20:	/* ScP2 */
+	case 0x21:	/* ScP2 F */
 	case 0x22:	/* BzrIW */
 		/* Display version information of TLV type */
 		btintel_version_info_tlv(hdev, &ver_tlv);
-- 
2.43.0


