Return-Path: <linux-bluetooth+bounces-19515-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBA8H3Ctomln4wQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19515-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 Feb 2026 09:55:12 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F65A1C186F
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 Feb 2026 09:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF6BF30EA5E2
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 Feb 2026 08:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E5D3E9F83;
	Sat, 28 Feb 2026 08:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A82DCDk/"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035B9350295
	for <linux-bluetooth@vger.kernel.org>; Sat, 28 Feb 2026 08:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772268859; cv=none; b=GcyXlT9AT3u5gpqPukgpzfsT/LZkFNj0zIxkaSyMNvwD/wPIEBBUsT/gQFSg3wZUQz2XBgIRsJMlsWadH56qHDQMrxoVeLQni9//ClijDi1qQ8hWpmqyGAgojnE8d2awt+D7nNJkTOSj4Sq+h+pta4dqL9CWIt/z4y9lsZ2znJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772268859; c=relaxed/simple;
	bh=7fYfhOiNkahL5AU+qPNzZkzZMCwRiCSfs0oXStuwqSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k6I+6NmCpCN9zV0LIQd5b0D2hnUKy7adfvsnhJ71dTfrv9YeMKdibzUOLMInsrVFkPeEdGTgPrQec7rKghPdK2Nba1wZMSRK1r6lOE4c1YsmFjaoedYxzLHGBgRvfAQa6Vnfg0Misziv8OIm9dKE1TVh+lT93vAXMvhtJdL3bjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A82DCDk/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772268859; x=1803804859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7fYfhOiNkahL5AU+qPNzZkzZMCwRiCSfs0oXStuwqSY=;
  b=A82DCDk/DnrKmuYwALSv7GXMKbhyJKdCcqvTQPiA4uKem26RNHFxjzWq
   wrT+yjlr0yY2LwQq5T670RnZMgD94ufKHPLYXPG20qJ25vqX+7ur4lvpJ
   E/STfMV8ISG7J3BWLzkCAHRbURxO81RMX9TsYD7cbcmrYU+GdtvKueBcq
   76HnurAuxFfPRSRT+rL2810uo9fFMAo5I4Uu7BvTouqD1jM2fafZt1Ejp
   SpwKUc7WasGhn8WWw2SRcI++uK3Aa1gR6K5+kSZOtFSJ+18l5F1OqHx/G
   gYhxyGShFeu4+lFFQ2716gZ8woNeSjamLLfO4S404d23tPMqZCQ17WjuP
   w==;
X-CSE-ConnectionGUID: 7VJl7FwNScuYQYAhKuf2wg==
X-CSE-MsgGUID: IWupWKjXQBO8ZiS41Cg/VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77189248"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="77189248"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 00:54:18 -0800
X-CSE-ConnectionGUID: NAjwMYBNRwSH2tahA+jsJA==
X-CSE-MsgGUID: Jrdyr53BQbqM5bcR9pCl9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="221630166"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orviesa004.jf.intel.com with ESMTP; 28 Feb 2026 00:54:16 -0800
From: Kiran K <kiran.k@intel.com>
To: linux-bluetooth@vger.kernel.org
Cc: ravishankar.srivatsa@intel.com,
	chandrashekar.devegowda@intel.com,
	chethan.tumkur.narayan@intel.com,
	Kiran K <kiran.k@intel.com>
Subject: [PATCH v3 9/9] Bluetooth: btintel_pcie: Add device id of Scorpious2, Nova Lake-PCD-S
Date: Sat, 28 Feb 2026 14:42:39 +0530
Message-ID: <20260228091239.230284-9-kiran.k@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228091239.230284-1-kiran.k@intel.com>
References: <20260228091239.230284-1-kiran.k@intel.com>
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
	TAGGED_FROM(0.00)[bounces-19515-lists,linux-bluetooth=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F65A1C186F
X-Rspamd-Action: no action

sudo lspci -v -k -d 8086:6e74
	80:14.7 Bluetooth: Intel Corporation Device 6e74 (rev 10)
        Subsystem: Intel Corporation Device 0011
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at 200002a8000 (64-bit, non-prefetchable) [size=16K]
        Capabilities: [c8] Power Management version 3
        Capabilities: [d0] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [40] Express Root Complex Integrated Endpoint, MSI 00
        Capabilities: [80] MSI-X: Enable+ Count=32 Masked-
        Capabilities: [100] Latency Tolerance Reporting
        Kernel driver in use: btintel_pcie
        Kernel modules: btintel_pcie

Signed-off-by: Kiran K <kiran.k@intel.com>
---
 drivers/bluetooth/btintel_pcie.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index 7aef219770e5..943e5704f5e4 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -49,6 +49,8 @@ static const struct pci_device_id btintel_pcie_table[] = {
 	{ BTINTEL_PCI_DEVICE(0xE476, PCI_ANY_ID) },
 	 /* Scorpious2, Nova Lake-PCD-H */
 	{ BTINTEL_PCI_DEVICE(0xD346, PCI_ANY_ID) },
+	 /* Scorpious2, Nova Lake-PCD-S */
+	{ BTINTEL_PCI_DEVICE(0x6E74, PCI_ANY_ID) },
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, btintel_pcie_table);
-- 
2.43.0


