Return-Path: <linux-bluetooth+bounces-18732-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHxhKrgJfWnhPwIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18732-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 20:42:48 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8BBBE3F2
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 20:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 194043073FD2
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 19:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279863016E1;
	Fri, 30 Jan 2026 19:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clnVIIsU"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722892FE566
	for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jan 2026 19:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769802006; cv=none; b=NXMjaiw+7hn7BPrl2G1TmeVCdEyXdkzYVS2bDTvOJ8p3hE6eJrL5LFNoJ3BtwA+YLQTSFZTfGYQCTe08LiMKG0OretS2L4YsiA2dY80KnrDSg7TSW/aDF90ZpP1b39kmnHV7RAVLr6mePnFggznHeRkTiw0HbblR04FsC/naLqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769802006; c=relaxed/simple;
	bh=qlWZUrBrgZuFtEt9pb2464Rr4oOwVaAyiP5aLu3v+OU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLgI3SLFErRHTgDrTY8QscMfdGXoNOCAjI8yTPpo7tZzuHJ98HeLPOH1O7SWenrAaEHgVWYctaNWmUmQBOV9zYBUexnCZDMUGHBttkm5Gaj/cUi10F1Dk1JB7chRirkuU/4B19JoPdhXCBlQ6SpK1BccUZ1lpLZ1caIoniFyuyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clnVIIsU; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5664393d409so934948e0c.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jan 2026 11:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769802004; x=1770406804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXdrJ8g2K+RDFxjvauNU0DaAoedEmHuaVAb97N8/dG0=;
        b=clnVIIsUzImIKUwjjMDNl2RzxUQi8lzSOUzI6WVDZ2DyPVodBq53KgK/IviQ6HXjH8
         Q+WvXTtDf7Rasja/eMmOogtX7SmRau2T2YTmkx5fFVqhxzWsaOJOhwhSepAaa3YWyS62
         8cbJLCoesOpzhK+1t1PQ1/taziE6TiUgr4q2+oylLxth7V3F+7g2QCDFUwc/QH3a0TCo
         QeFzsoyt8hdvUSRWbv2Ry5dRi8/JOWVFB5tnFpQEg4uRAaUwSL2jjV6ebLVXwCgB75sI
         AyggxfcC8PNGvGfF0GkQKPGoVmGV3Eor46JE8V5YtSRijduKOcsXnuxYnBmq5KC/1tEu
         RcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769802004; x=1770406804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lXdrJ8g2K+RDFxjvauNU0DaAoedEmHuaVAb97N8/dG0=;
        b=xA2pFI6mckdNw0gSnvseul2pt+A2Qj/vrGJxq31dCJwml0coHLaDKezb7z8nvZheZY
         12AAlQGKlIi/KdharqpbqvciI6bxMwXeDrgVRo/nZfqUsMNMy304h3YqpfFlq/xWm//t
         X61voctQL8xCzihho2ih1RM1bT220Ta2sc/v3OyzSboQryLCpNrO2Ywq79ImyQNmb7DB
         uGbSqoG/CAp5PUFE90TvEPQTI9o60kMOs8pUkteipJaEz40j5OMjPFNci/K1qvU8JuAv
         TLminuVw+Sx/YpaGchOcdN3kDB9ybp9cBGwvG7Ow4XLm18WvCtAwyx1Pam4DEEHgsKlv
         ZLHg==
X-Gm-Message-State: AOJu0YzFAr8xhV2ZpLu9+Wch8NKIr4ixTBnwo8+7wgMbThw65WyXzwUM
	S/SlYBfiIP3bz6SwmJgAc8TaOye+x7/fAUCUJCE4Hy1ozh+v9lztZS0fQBCRGg==
X-Gm-Gg: AZuq6aJetrHEG69OyjGwcugSDRlP7wwBcTrLEGUQteNGMZJCMX7CfobNgFwDc/xBa60
	97AVH/KMsxHvXrNNttwIBI8VDyE0mBMNT9eJGme3GexOowtEMFFiLp5KZ0L/SR+5vxPnKwDckEv
	/jvPA70WWMMtRDpjpsYyiGrCXYU0Y/H+Oqip00Ze9mOTCRp+0JHyULTa8pm+EC64a4goE0VTnx/
	tRs8UcJxlMJKwx1FTdFycKqIgp9HXhpogcGP4g9zqYo3qCbuk0a0ToXAW5hTW3DxfzZeqbSW/uB
	7xHQCI45ssvMuobJ1x28O8fRHGnjXcSbGyW5fAPwF+SP4H3CF6lM6ueVuK07O53n8CVCvAr9YYF
	6YK4/kEMyKeAeUXpBt+ZxjVe5lV51hXVPkzo2B/J6Xizus0Jcq038Yn8sQyQV634ymbZ/LFzgts
	NOifog4bglMUQH7jXYNLgd3c5bzPJYf+aC86UOf9DOxQmmJ3B6Pw6Tcz1VaLdQN90LZ/tGDJPQE
	EnWTQ==
X-Received: by 2002:a05:6122:2a08:b0:55f:c6c9:e4ba with SMTP id 71dfb90a1353d-566a00fd9c1mr1048464e0c.13.1769802004204;
        Fri, 30 Jan 2026 11:40:04 -0800 (PST)
Received: from lvondent-mobl5 ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56685b0360fsm2523603e0c.1.2026.01.30.11.40.03
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 11:40:03 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v2 35/35] doc/org.bluez.Telephony: Add Used by reference and Examples
Date: Fri, 30 Jan 2026 14:39:17 -0500
Message-ID: <20260130193921.1273263-36-luiz.dentz@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-18732-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 2F8BBBE3F2
X-Rspamd-Action: no action

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Add :Used by: field linking to bluetoothctl-telephony and Examples
sections showing corresponding bluetoothctl telephony commands.
---
 doc/org.bluez.Telephony.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/doc/org.bluez.Telephony.rst b/doc/org.bluez.Telephony.rst
index a722e2a38394..4a2159e17bcd 100644
--- a/doc/org.bluez.Telephony.rst
+++ b/doc/org.bluez.Telephony.rst
@@ -17,6 +17,7 @@ Interface
 :Service:	org.bluez
 :Interface:	org.bluez.Telephony1 [experimental]
 :Object path:	[variable prefix]/{hci0,hci1,...}/dev_{BDADDR}/telephony#
+:Used by:	**bluetoothctl-telephony(1)**
 
 Methods
 -------
@@ -54,6 +55,10 @@ Possible Errors:
 :org.bluez.Error.NotSupported:
 :org.bluez.Error.Failed:
 
+Examples:
+
+:bluetoothctl: > telephony.dial <number> [telephony]
+
 void SwapCalls()
 ````````````````
 
@@ -113,6 +118,10 @@ Possible Errors:
 :org.bluez.Error.InvalidState
 :org.bluez.Error.Failed
 
+Examples:
+
+:bluetoothctl: > telephony.hangup-all [telephony]
+
 void HangupActive()
 ```````````````````
 
-- 
2.52.0


