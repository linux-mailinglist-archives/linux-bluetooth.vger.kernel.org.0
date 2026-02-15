Return-Path: <linux-bluetooth+bounces-19067-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id W961Fh/CkWlkmAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19067-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sun, 15 Feb 2026 13:54:55 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C63D13EB17
	for <lists+linux-bluetooth@lfdr.de>; Sun, 15 Feb 2026 13:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47AEB301053E
	for <lists+linux-bluetooth@lfdr.de>; Sun, 15 Feb 2026 12:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0D22BFC73;
	Sun, 15 Feb 2026 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="e7wmxSZ/";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="bmPdFwdq"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AD125F994
	for <linux-bluetooth@vger.kernel.org>; Sun, 15 Feb 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771160090; cv=pass; b=h+LUI2yGzP+xdcRzA/BU3G9U32awz6HIXllUo7cbvgYjjEnrZo4YclsrjMCqOuEvGThZ6uh+0u1S7tQWG40y7lPNgVNOmtOa7ocUm3o//Zq80Fmuv2Byn4KgrkPRPNoFdG2gsQeLHiPo4ZJA7RKRedwQJp3PGHjBC2sCBunTefY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771160090; c=relaxed/simple;
	bh=ZKHYs9jBU+32lxM/kgv/rMo/hRyYwpnT5wJTmuYXH3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NDm9ObvwZBDSpaRqctnbLcZkSsdfQWOxlANwdRGksWUpMPdhcYVLz/+FvMq7izf5U+K1UJ2PE5Nw7fHaMkKyY5HGIdjXHjjV7q5Nt/vtx5z7dy5kblUSPwUVuxyQqK8h4gGJ5fvIekYhziOxHwEw5FYGCjwAseh3VMKAhI1s7aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=e7wmxSZ/; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=bmPdFwdq; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4fDQpm5489z49PxF
	for <linux-bluetooth@vger.kernel.org>; Sun, 15 Feb 2026 14:54:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1771160080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VipQ+N9bp0yCuzBywcS+ALkhbTZTdLBpHURqsVj7cFc=;
	b=e7wmxSZ/KYyS9uutAIBK3/XlOgG8BecQwwMtUPqX41e15ltqRv8WUlY43LKiY3l7vSCNEG
	6yUbBZntN52RGOo1ekjhL20qGYO5jRzSi9ieFY7U7KJhqJL7txHL1Mi2OLNK+n85Rjep/b
	caOh5UVbCFbf5ZEQ0zjEPlt8yAxdRW7ZjbzQwk7mAP5R9XwzBvUGwXj+l/L2D1SZirifJ6
	64v92eOjMEjrE9SWalvwn3g7gpATuvbuQy2mzqGX0fRwY1bEXUIpvhe5fsyg7Vj7X81+wL
	Vile3f3JHkypRbf3qJtegTM/FJNnC0F0WLTZrIveSXqKKP2/3rwzV4ElHjcEGQ==
Received: from monolith.lan (unknown [IPv6:2a02:ed04:3581:3::d001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fDQpc3JFfzyQC;
	Sun, 15 Feb 2026 14:54:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1771160072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VipQ+N9bp0yCuzBywcS+ALkhbTZTdLBpHURqsVj7cFc=;
	b=bmPdFwdqPzmN1ELyhp73fEDuOsUPDcsrVio1CA3LUyaRCy6/F/cuaXOD3j4ltQNCYMhAJh
	OdJWSxgfOol4/XKtvywy04KVkCDn7zE5XIJqO/lR5Ssuse94DV2XZ+/Y1ZGT0n9RIPP1Ca
	fbO9sgzPKbC8pJ8rC0NwlsxgR361Fi8=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1771160072;
	b=uGmnKVAQJw2tbAbOeOqeMgXKwU7hGYtdojIo/3chNDzd11yRYv1UeMBL/FU6IqHE7SIFCg
	AhNeu4e2vLp6l77XUihyBpZUtbEuKjopzsbF/JOsUjFUqtFotvYmFEjCtNkJBAfOkx3Mz2
	bqKxgdWzFUzo/DwuiFi9OveghMcNVuw=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1771160072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VipQ+N9bp0yCuzBywcS+ALkhbTZTdLBpHURqsVj7cFc=;
	b=Gml1J8MGUpjnVHjabr64RHi96Anbsidp78PKOXH+tvS2FOVJWLNVzEjDChuS1TkOAwh9Ye
	Aohz0VZG1hvyVcnReZavghze0EFfhBwmHGjFLSMrGuiPaFFx17vL5ncHtFQU7Ku6v2agll
	ldkktADvGKEx5XDguj1RQL/tNiWB3U8=
From: Pauli Virtanen <pav@iki.fi>
To: linux-bluetooth@vger.kernel.org
Cc: Pauli Virtanen <pav@iki.fi>
Subject: [PATCH BlueZ] a2dp: start connecting sink profile before source
Date: Sun, 15 Feb 2026 14:54:28 +0200
Message-ID: <0b3d55690ff2f0ed72271f2760ace8f76a81fb43.1771160059.git.pav@iki.fi>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=lahtoruutu,iki.fi:s=meesny];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-19067-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iki.fi];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[iki.fi:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pav@iki.fi,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C63D13EB17
X-Rspamd-Action: no action

Since cdcd845f87ee the order in which profiles with the same priority are
connected is the same order as btd_profile_register() is called, instead
of being the opposite order.

When initiating connections, we want to prefer a2dp-sink profile over
a2dp-source, as connecting both at the same time does not work
currently.

So swap the order of registration, to restore the previous behavior.

Fixes: https://github.com/bluez/bluez/issues/1898
---
 profiles/audio/a2dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/profiles/audio/a2dp.c b/profiles/audio/a2dp.c
index 7a37003a2..7216ed017 100644
--- a/profiles/audio/a2dp.c
+++ b/profiles/audio/a2dp.c
@@ -3796,8 +3796,8 @@ static struct btd_adapter_driver media_driver = {
 static int a2dp_init(void)
 {
 	btd_register_adapter_driver(&media_driver);
-	btd_profile_register(&a2dp_source_profile);
 	btd_profile_register(&a2dp_sink_profile);
+	btd_profile_register(&a2dp_source_profile);
 
 	return 0;
 }
-- 
2.53.0


