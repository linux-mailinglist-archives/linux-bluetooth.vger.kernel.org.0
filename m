Return-Path: <linux-bluetooth+bounces-19819-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GEfIlCaqGkGwAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19819-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Mar 2026 21:47:12 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03E207B48
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Mar 2026 21:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 159793017031
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Mar 2026 20:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEADA37F01B;
	Wed,  4 Mar 2026 20:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2R2/ygM"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423B724293C
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Mar 2026 20:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772657221; cv=none; b=WOWM0E1hHTLLf7SNYgnZivIQYJuzSfVM50r89K7avmddiy8NG+uGfH1YCs8yr43eHawAkafA8yvIqbvCQQqtySpx8rgojarQau9/1WbneZN34YtSI9WQso1cc8gH4aPwvqryI6Rtf8jX17Jvl/SuidqvcKCV0e601/woNhu7xTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772657221; c=relaxed/simple;
	bh=poHbiBVEvJpzgiTTmn18EV96TO5JHCLyNGu1BcCCmoE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=eDUyOU8Up4I7SBfouiDcU1sFvHyoKP7kcLyxYStBlhn5cwAZYntWG+9+k/VUmFll1xG92APKT8L5e9Y7R63hp2mVsPpvbOnfBldSeDNvoyZdfVg97XPHL41UB1/4ff1QyiDp6Ji6k9DOaseX23ySpluLoKhcjqTW8n382vMf3NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2R2/ygM; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffb61b0babso548587137.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 Mar 2026 12:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772657219; x=1773262019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ThoEdnocq8d466CxVdoUfLXIgCLHy6C6HmKNz0XgJ5w=;
        b=V2R2/ygM7RwnL/X6R64J+hC1ui9meoyoXk3p6GEitaKhyvJraDx4CJCQYz2I1ysOh1
         QD+tOeET3JKGjsQYGFUgsQEostSdX2VCrjKipQ0S17Lpq74nUldk9d50L/s0523KsiCf
         6wCIYJeunD1tfqFeNk2iAdPzOLfYHYu79jVpE5rGj9zRvz3uldEmE/LdRQp0KZ2fnZ3F
         47ZKw0Hw+DqV5o2/tsDgZdewh7dVekm+eljK0qAaQqRXAxrxuXYXvRgRLU/VSI0nM25Z
         fwz8Uqsg5q2XWhp7RTscdNpV6sjOLkE1xoCUIjmr6avAaojpbqITWKoYoDpeT7OqeU0r
         0XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772657219; x=1773262019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThoEdnocq8d466CxVdoUfLXIgCLHy6C6HmKNz0XgJ5w=;
        b=YGukG5RY1E2tvrToFuCKsJt5fltpkKNC9uHKw9diWUzRK+/ScFJ05tSfw5507S7ddO
         DRQfvozEGHFGUxmXbim3h09XqlI1ra0qmTFWs1L8iKJsHjNPmaJvunagEwRU7RPVhvBb
         rL+Ma+X1heypfoYokk8wzNlVLWZWORvKiWtESKiLyVlFX8BjbfUGu3fmc3olsoWQF27v
         r1xFC/+7wCE8HLlZlDPGjjiBS9Gw4UZePtHkPdjfND6PZiOd7MWeVZexw1Kgwr7Xeg/q
         BFK2h6cbp+viqiF6STHJ0sqq7noCbCI+hfw6+oaDCWlopLuKVNvhOawGIOKPnRGwExv6
         YjCw==
X-Gm-Message-State: AOJu0Yw69w5f7P2UY/1n7ptofuNBIoD0AlVMHl77KiQNjyKhkzoQ56uC
	jV3/OVXGVe17d4y6eK9oPi59HlcQEgic/3fBjcdQnawRDWKgh+tXFYPQ/UChTIHP1I8=
X-Gm-Gg: ATEYQzxir9VWamxYPpj5vsF35V0CiBFT3G+mcJVmMr9dpTyMSkKESyzsg5Pgr16dCQo
	M5a2FPEu3VRuqBinOGsVqN4KGWa1FUShyETBDN14arS2UE9//Sr1UpaeeqIYAGfUP/QSIVC/eCX
	wAa/2gxWy5CQ/kkic+axzdUABNfIzkgteMUnnOTw8tezcSrQZkr/E3yfbEKmIwDm4CtyOHlH8mA
	1/+zxrX8UtgvLQstJU8k9rn8A2IIhQF6vC/7skqtoM28TLRI7ClNYMuyDkoFw2gFJSHDNFM3PPi
	x745yJpSLb3I72w4Do+KTODe9B7Eo2G2smhc/vMib5td52GFSYQg8gcU3GHREs/bzRNhlbo4TKc
	GW6rFwY9+nTH7umiPaCTToRURYkAHFPBmCxLEoXbxMq5/1TDdrBKXY8ZjaybH/9P+b6cMW3bSHY
	ADVpYSxNpmtSaYh7yjfUZRJOEN+pGv5ZBUKRw4HiqjzICLi0ontOoKwaOsquDNj+6uh+S8K11Rl
	868GgG33jtlOOGbig==
X-Received: by 2002:a67:fbce:0:b0:5ff:b8d8:b40d with SMTP id ada2fe7eead31-5ffb8d8d44bmr833306137.21.1772657219114;
        Wed, 04 Mar 2026 12:46:59 -0800 (PST)
Received: from lvondent-mobl5 ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e31bb722esm10064883241.11.2026.03.04.12.46.57
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 12:46:58 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v1] monitor: Fix -a/--analyze printing wrong connection type
Date: Wed,  4 Mar 2026 15:46:49 -0500
Message-ID: <20260304204649.309362-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8E03E207B48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-19819-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Action: no action

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

---
 monitor/analyze.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/monitor/analyze.c b/monitor/analyze.c
index 1db1e7898132..6c2ccca840cd 100644
--- a/monitor/analyze.c
+++ b/monitor/analyze.c
@@ -225,13 +225,13 @@ static void conn_destroy(void *data)
 		str = "BR-ACL";
 		break;
 	case BTMON_CONN_LE:
-		str = "BR-SCO";
+		str = "LE-ACL";
 		break;
 	case BTMON_CONN_SCO:
-		str = "BR-ESCO";
+		str = "BR-SCO";
 		break;
 	case BTMON_CONN_ESCO:
-		str = "LE-ACL";
+		str = "BR-ESCO";
 		break;
 	case BTMON_CONN_CIS:
 		str = "LE-CIS";
-- 
2.53.0


