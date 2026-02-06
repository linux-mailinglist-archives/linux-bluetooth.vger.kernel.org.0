Return-Path: <linux-bluetooth+bounces-18839-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AzrLSQ7hmnzLAQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18839-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Feb 2026 20:04:04 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5147510266C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Feb 2026 20:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AA013019C91
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Feb 2026 19:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5872ECE9B;
	Fri,  6 Feb 2026 19:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kp9Kmxgv"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4123E426D23
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Feb 2026 19:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770404636; cv=none; b=G9I0BOPdDMpg95KBYwoi0L8RAFtgMDy9ZAPowlnKkiexSliV0+SqIhPNsjkaw7Mh59cPUdge9qbcruo9BToA6pPLd53DO77OsVdRNgRloQfkY0vzyjWR+hqakIbjlJBeYWEcx81BKwHjZE+qkV3g41tAfbyL47dzucv3LdJ/0DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770404636; c=relaxed/simple;
	bh=XZcVkRCCPuxrTxs/Xqw1VWtXjOu1NLKlGJ6tF5tUGtk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=U8irzE51PomUYs49dSRkgNJFVOpfrZV1ogvvWGNoUxAoFvtW1x02anPJJVVR6FZtVOJnp6xFESEP8aGpN5oeRkSSEWNhMIJ41hUccBjMQw+PJBVNPMCHT4V6Tm4cnqUjnSFv2aOIsNMpZFV8wWCVPoBa84txrAVNlR+JAQYovmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kp9Kmxgv; arc=none smtp.client-ip=209.85.217.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f68.google.com with SMTP id ada2fe7eead31-5ef5c04151dso756141137.3
        for <linux-bluetooth@vger.kernel.org>; Fri, 06 Feb 2026 11:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770404635; x=1771009435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J49kQVFNlC/qtcR+D+BRudQxMkmHaXFGv0dIlKEOV0c=;
        b=kp9KmxgvmED9G/B+jP7WEYlg9No64uzV6fooHcIzsdAWzNZNICWrVXf6pSxPp8KSdw
         bgvnFyovgO0tRavpwcy1r8Pgj1DD4QwCHbfoo8ktBjXOfxvQaxKcFJ0UOaXr1qaXmQSq
         cpy3J5S/6vn4ortfL+dzC1ynKRVGmFvGi/HvHEUMnLDoMufK2es/PfkwUcGmWqEeFicl
         BQfaMnHbHCm5mfG1WsHpCfZg62WG2Jk+xNZ8h2cQNER1NjJV5HxODupJf5RZy3wyE2Tc
         3ZRv8Zx3VRL8PfDUQaMclspHuQONoU4IMIuHvD6+DeIrUbOxGNExWBhRlI6osZb4NUN5
         Dw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770404635; x=1771009435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J49kQVFNlC/qtcR+D+BRudQxMkmHaXFGv0dIlKEOV0c=;
        b=sA9DOX2nvyCyAghimLMR1HpRPDs3s45WTRvAdcs81S5ESJvgYsTQJiX0q+bx4pqunW
         313erjwaAfnoVLenV3i4q2tQii74b1BgvD8c2a0uoH0LITeKdJ66B5oT+x6DsxWl1hsF
         5XeM8+eGyjlV6/abGcHAxN4Mrc1Ri9xm/Ts0Z7znfPGGq0SytRLgtRDd3PrP5yRE1etF
         95xyBGv3CjGXTEJs3rBB9m8I9+CrRkEZn7E9MC0FuG/wJqyQjkNqBbBbJk2cuxQjtR8x
         DQeXr1BNgdZ1ItQeafR62+esadg57qfP5Ke45+2ZxO55ShNwKuUybVi1dWGOsbsbY82T
         n7lw==
X-Gm-Message-State: AOJu0Yz2Rz9lKBHwwFU0Ezl0XtHYaBKfMn36SFEH9DKoqzXjbzOkwtPi
	HnTiJgLvetCjIQb/rKC1DEHCfqcKlwl6NksfBxMmrHcFBjzgRkl+40IHh6KLYPwh6O4=
X-Gm-Gg: AZuq6aKj1w8yACNeR1vV7m//36J4xblSn8sOdq07dFUEYFDG5gJXs/uctSCBdgpaGby
	1KV/pGmK7e3DxSJo+geSUog/fTSruNWlKeumZAiAXys8Pu0OB/Qsg7rXonx2STqT9KsKrEu8s4V
	n7UDfIrxw4GmBy6fTljG0nvvi9sXPsfxDTzyM4BV2zPaKWFZQSzXF66dtbJ3d/jlROfXmorI95B
	u6Kg9tr/mtyvE4aYcAVK7iMOvOqX4sSGpInNSizCm9mss5H+ZoiUYOT4ift/50M/jWFeowqVyQO
	9xq8AeWK+GjKT6gzXjWZysQYavqi876Sjk3XXgmrv2gFz7WvysMzpqaJmv1vEry6P75OQHcuN3c
	o7qzwq0h39X00owyqEvEOlbm4Uarhg/50diTaFm6EivyO/I/h3+5T3ImWGU852ErO6pBEugIU9l
	L9tbA2fTx0HGxifQpwTvBbTFvgjVVeYxc/Q/0z8PoOeQI1nDa1rzpCBjq0C7v7lcEPe1BMx1cr2
	1B/Qw==
X-Received: by 2002:a05:6102:c8b:b0:5f5:4121:9b10 with SMTP id ada2fe7eead31-5fae8ca9ebamr862676137.44.1770404635029;
        Fri, 06 Feb 2026 11:03:55 -0800 (PST)
Received: from lvondent-mobl5 ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5fae904a33csm1070176137.12.2026.02.06.11.03.53
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 11:03:54 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v1] l2test: Fix not being able to use -X ext-flowctl
Date: Fri,  6 Feb 2026 14:03:45 -0500
Message-ID: <20260206190345.329635-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.52.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-18839-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 5147510266C
X-Rspamd-Action: no action

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

-X ext-flowctl requires using setsockopt(BT_MODE, BT_MODE_EXT_FLOWCTL)
but instead the code was attempting to use L2CAP_OPTIONS to read the
current l2cap_options which is not support when the address type if
not BDADDR_BREDR.

Fixes: https://github.com/bluez/bluez/issues/1869
---
 tools/l2test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/l2test.c b/tools/l2test.c
index 5825314b9834..7eecf1364492 100644
--- a/tools/l2test.c
+++ b/tools/l2test.c
@@ -289,7 +289,7 @@ static int getopts(int sk, struct l2cap_options *opts, bool connected)
 
 	memset(opts, 0, sizeof(*opts));
 
-	if (bdaddr_type == BDADDR_BREDR || rfcmode) {
+	if (bdaddr_type == BDADDR_BREDR) {
 		optlen = sizeof(*opts);
 		return getsockopt(sk, SOL_L2CAP, L2CAP_OPTIONS, opts, &optlen);
 	}
-- 
2.52.0


