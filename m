Return-Path: <linux-bluetooth+bounces-18729-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEypG60JfWnhPwIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18729-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 20:42:37 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A6BE3EB
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 20:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76A5A306FA58
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 19:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C582FDC5C;
	Fri, 30 Jan 2026 19:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeRW2QEO"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74080301026
	for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jan 2026 19:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769802003; cv=none; b=gzkbSMdxqd0+uj0Q9kYJAUkC874BNL+C5XgHJef5kJRaoSn8WqMRmkLZ7cr9bT1DoPRidZweJDRK0Fx3OZeJiiza+1Jlhfm+W/JAV19FTQ5Y6g73KPDzz+bk1tu37MThmteYjeeoPy/d7BnthMHRtr29i/ZpasFq4lwb7GOYTEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769802003; c=relaxed/simple;
	bh=ZP4lfF3xVXIT4JhNTEyZaUXGDB21k6VynfyRRlENG6c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gf+92/4VgcIfI7kG2HHQNj/slXX6JOHId9110hyub39t2jx960c5mM9w7w50Z3J6RVdYpKuXSYjXV2/3n15HbElfvDJs5FryeiztPAUgqfnhoYjH4UpnAvODsnzUyIG3GpcQldNMcUm+SjbWsMtUDT59nkCmIv2oJ1mGYEgpuGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeRW2QEO; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56636dc53a6so745554e0c.2
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jan 2026 11:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769802001; x=1770406801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1X6ZKu8gGvR1thpN1oiwwNU7wCuD/YDsdwo4tA3p6I=;
        b=LeRW2QEOvQI9qt5YtcLq4aVyGxMxfXiEcdaTBZmKLmddW3YL2/EgLGrfBiMcqwqmyB
         wquvpd4jlbzBUmS+DFGeYrmyCS+mWupCZYPwOtTM+YYAJ0tJnEayfIDwoAZxXRa5uEcq
         gbimKp+vC0KP2e7DCT5dmM00EAhqoTnbl2gzs7GLT47rpoRVZy9h+/bOMPz1xJukcLSF
         XJcx+ecb/XothUMA8yHoMXnQHePdc+0NWErkngaURsW0TSo+kxRkJYRqHol8Nb1PGtVq
         XeyINQVO1T+5LxtsvnShY/OdEdSCfEM37Y3VtdhqdBARgt1XHNJFi7289yxDLL5iGyZq
         Jc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769802001; x=1770406801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q1X6ZKu8gGvR1thpN1oiwwNU7wCuD/YDsdwo4tA3p6I=;
        b=tQ1HhFrerMLwdzsWvaVOtoFUhRSqrM4yO7JATCUUU1wEnNCaKhlEP6bv90DM5BAhfs
         jKihgM19afsrqW4ujug1C32OJ5+zXxLuW8GjQOJ9OM7CPoQqsuuZRrdsPDAk8184+RUN
         5F9MaP7NhO83/3He545dA8DKEWlO3LDi7xucRLGB7NhBgDJ+TFFEB5l4caIoK1eJEB5K
         j5vfB24yO8Nb/ro8OdGFK9amuzLh7P9h/nQfC4E5C15c+yIYrGfVjXlK4in8SLVUQehh
         +3UGwMkVDBoX/XyZvT5vlukYGfmef0pL3F6HstDiT98hpOQYeyZAiHKQIMuSS6X/xR6m
         eY+g==
X-Gm-Message-State: AOJu0YwcJmrTvKONpDgYOEYp7n2db+vet3AghMB7rAKib9+BSkQs259F
	swbvpLaSz8rgT5rWf3PjiSKKvT+0W7VBEc3XOFOUBj8WHKKeKMo6M03tGS4Dlg==
X-Gm-Gg: AZuq6aKJ5AQF05XcnBzyQVgkcFZkdv+aZgCtgAjeCfTe05NgYpd1x0eVhS6gLuqlD/p
	jB8tUC7kcMvltPNDpoHCNl1ijwStO4nYsBFE6Xc+TZvmHy0LXgEaVu15zX1vAs+8Q6IA7a9/J9C
	G2zfUqhZuDejDxP+SyMZpZwSHrwqQQrhgQZswe/FdybWQJweFpPbYtmjKn0oV3dZkn8pLzvS7Kz
	JydMl9NN3kUL/+utPmXuGZDx18N9dohdi7z+ReplFHhD1nrAp1Ri/UdkupIgs8jPRE0BR6tKz4R
	7ge59+sYY+tzgy3yMUur0tqn4bvnKijkTK7EraD9n9QNp1k92NAfih/zMplacdxyNiuhpXKzrbd
	9kXgEC+QXrGNew8NM9WvgJ+RbIMqirbim6bUTUZ9Uu4b47WfN461N0z1QuR8EtKGSpfyJprV1cD
	OUHCycgYMtrJzqyTk9LDxTBMWU2gQF4nfADSOVndYI0QUDHZm+keCdVZ6MJ0aBjhnJdeaZMJ2dt
	AS3ow==
X-Received: by 2002:a05:6122:8296:b0:566:357b:ef25 with SMTP id 71dfb90a1353d-566a012cdadmr964674e0c.15.1769802001392;
        Fri, 30 Jan 2026 11:40:01 -0800 (PST)
Received: from lvondent-mobl5 ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56685b0360fsm2523603e0c.1.2026.01.30.11.40.00
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 11:40:00 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v2 32/35] doc/org.bluez.MediaEndpoint: Add Used by reference
Date: Fri, 30 Jan 2026 14:39:14 -0500
Message-ID: <20260130193921.1273263-33-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130193921.1273263-1-luiz.dentz@gmail.com>
References: <20260130193921.1273263-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-18729-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D4A6BE3EB
X-Rspamd-Action: no action

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Add :Used by: field linking to bluetoothctl-endpoint for this callback
interface implemented by media endpoint clients.
---
 doc/org.bluez.MediaEndpoint.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/doc/org.bluez.MediaEndpoint.rst b/doc/org.bluez.MediaEndpoint.rst
index 8202b2fdfec2..ee9bac20bc30 100644
--- a/doc/org.bluez.MediaEndpoint.rst
+++ b/doc/org.bluez.MediaEndpoint.rst
@@ -19,6 +19,7 @@ Interface
 :Interface:	org.bluez.MediaEndpoint1
 :Object path:	freely definable (Server role)
 		[variable prefix]/{hci0,hci1,...}/dev_{BDADDR}/sep# (Client role)
+:Used by:	**bluetoothctl-endpoint(1)**
 
 Methods
 -------
-- 
2.52.0


