Return-Path: <linux-bluetooth+bounces-19076-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAfjLIRDk2kP3AEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19076-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Feb 2026 17:19:16 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D46146046
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Feb 2026 17:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D93930398A3
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Feb 2026 16:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD2931A051;
	Mon, 16 Feb 2026 16:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="TUP9EMfH"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809AA32A3C0
	for <linux-bluetooth@vger.kernel.org>; Mon, 16 Feb 2026 16:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258641; cv=pass; b=mTXWypwqwYuXHBXRsby3CodrCXaWA052/7dxqrRNv3kMwpE/4tORExYN4+Dhch7cXXKABCQHDFHCl40a8id8mXdN/M5gnF0YEOF14uL/FI2SBtWVJQy/rkButw3Byme4REjXeKiXDxGEIkfDXr0yZpsTaGN37yQ+0lB6cnK/X2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258641; c=relaxed/simple;
	bh=gWDKc1dIVD2xxYVEjDyyzJyYFgU16ZtX9tSTkM+kfuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YdVgjzjWIcxlGzUAF2m6LXHiPZvr73TELIny6QgAw4/iMzRzZqEnuTjb06NtR60+POikKam78TSdOWOVBjFxH8Cx54YjNhjSwR6mflgJFjcL8sKjBECESEi2wZ/l1d8uPB3m+n8TPyB7eanKn/gW6p59BOb/CAaIf3kkZmSZWG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=TUP9EMfH; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from monolith.lan (unknown [IPv6:2a02:ed04:3581:3::d001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fF7Fz4DxVzyQR;
	Mon, 16 Feb 2026 18:17:11 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1771258631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nLMev9lTec7lORC6cAYFkQG78q671/NmTn1J5HePy40=;
	b=TUP9EMfH9O/34zeiS2nPYpS49TCK5s/0Nnv2slHsve0IJ4G4A63Gxew6DvBUK7LwBrvnSo
	2A5OqeL9Y3OnSNN7DhcVRRy2SVx1/IIVzecoUGS4vEr90bxgkUsOHnKBXCGy/LxFXgCrgk
	o0dTxm4RlWGUeGGDXCv7cZB/tVAOzoY=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1771258631;
	b=xzs11c4g5E6L+FopHR5lMA8419q/YJ9CbhZxxRABeY8T/37gz6JjYhzGe5oVGPihgEGRhA
	/FMcWF9v7VlXqGSaFnAkWk+RFokIF8jXkitmiIeriI2VFH5UFO/6Eeb978O3Rqz1QEMj69
	g2cpHdNDjB69/k1WNxAel37wvCkCNf8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1771258631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nLMev9lTec7lORC6cAYFkQG78q671/NmTn1J5HePy40=;
	b=Z/XdmLy2d96IyVAfFmWgHyTTa55PZCjEjSxEzSBi4lN2Lse1FqZlW7riC2N2zmfJjF1j1h
	q/XkJfd0I7sK107u2MODXWFunStK7TybhTTV1pWiBp92639/j9jD242RpfXDYKVPqoRfqI
	QCXEDmehHsouF6oLkpdWz0l0KLsWhwQ=
From: Pauli Virtanen <pav@iki.fi>
To: linux-bluetooth@vger.kernel.org
Cc: Pauli Virtanen <pav@iki.fi>
Subject: [PATCH BlueZ v2] a2dp: connect source profile after sink
Date: Mon, 16 Feb 2026 18:17:08 +0200
Message-ID: <ba0e71b91a24557f088b015a349c6ccee6260ec2.1771258477.git.pav@iki.fi>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[iki.fi];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19076-lists,linux-bluetooth=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pav@iki.fi,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[iki.fi:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 16D46146046
X-Rspamd-Action: no action

Since cdcd845f87ee the order in which profiles with the same priority
are connected is the same order as btd_profile_register() is called,
instead of being the opposite order.  When initiating connections, we
want to prefer a2dp-sink profile over a2dp-source, as connecting both at
the same time does not work currently.

Add .after_services to specify the order.

Fixes: https://github.com/bluez/bluez/issues/1898
---
 profiles/audio/a2dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/profiles/audio/a2dp.c b/profiles/audio/a2dp.c
index 7a37003a2..c7e0fc75c 100644
--- a/profiles/audio/a2dp.c
+++ b/profiles/audio/a2dp.c
@@ -3769,6 +3769,9 @@ static struct btd_profile a2dp_source_profile = {
 
 	.adapter_probe	= a2dp_sink_server_probe,
 	.adapter_remove	= a2dp_sink_server_remove,
+
+	/* Connect source after sink, to prefer sink when conflicting */
+	.after_services = BTD_PROFILE_UUID_CB(NULL, A2DP_SINK_UUID),
 };
 
 static struct btd_profile a2dp_sink_profile = {
-- 
2.53.0


