Return-Path: <linux-bluetooth+bounces-5875-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C611927409
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Jul 2024 12:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 387422883FB
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Jul 2024 10:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64701AB908;
	Thu,  4 Jul 2024 10:26:27 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5DF1ABCB6
	for <linux-bluetooth@vger.kernel.org>; Thu,  4 Jul 2024 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720088787; cv=none; b=KGsgA7JPi5CjITHlPTNN8IlAKJ5l0PzzDryAP/XI58nSJ35GQZTcpEUs2PZvxwCWB0Wh0yWVFXo+6sTMpCoIUT8Ibd9GZUVB24teVVZs4OqgNWz4e7i6y4/bKorSL+UZUA8Jsi5bqfTeiyVM8d0yxR8aQxqxbmbTrOwWMWCK8TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720088787; c=relaxed/simple;
	bh=fRriLEuynZ4IQ9BNM3Bvu0fzJ1hoSPesVZtSGdTcsFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VW6RexPbvFpKCXHuWDqXlKIF5cqD4d3bBkbmDQ45H7O83x+s/oeexon3Ag7rP4iHnag+mf5kHYgJH3Zx9ZmPPDC71CATJsIYMM3cdJz1qXd9jXRx+py0eJDQLJtUW918jv3es2cMmQAn9zFlcWeG79SnNfM0wLKHl2F+8bJ4AJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3CCE240002;
	Thu,  4 Jul 2024 10:26:22 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Cc: Bastien Nocera <hadess@hadess.net>
Subject: [BlueZ 12/12] unit/ringbuf: Fix ineffective guard due to signedness
Date: Thu,  4 Jul 2024 12:24:43 +0200
Message-ID: <20240704102617.1132337-13-hadess@hadess.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704102617.1132337-1-hadess@hadess.net>
References: <20240704102617.1132337-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net

"len - end > 0" can never be false because "end" is unsigned, so the
whole left handside of the expression is unsigned, so always positive.

Error: INTEGER_OVERFLOW (CWE-190): [#def22] [important]
bluez-5.76/src/shared/ringbuf.c:240:2: ineffective_check: The check "len - end > 0UL", which appears to be a guard against integer overflow, is not a useful guard because it is either always true, or never true. This taints "len".
bluez-5.76/src/shared/ringbuf.c:242:3: overflow: The expression "len - end" might be negative, but is used in a context that treats it as unsigned.
bluez-5.76/src/shared/ringbuf.c:242:3: overflow_sink: "len - end", which might be negative, is passed to "memcpy(ringbuf->buffer, str + end, len - end)". [Note: The source code implementation of the function has been overridden by a builtin model.]
240|	if (len - end > 0) {
241|		/* Put the remainder of string at the beginning */
242|->		memcpy(ringbuf->buffer, str + end, len - end);
243|
244|		if (ringbuf->in_tracing)
---
 src/shared/ringbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/shared/ringbuf.c b/src/shared/ringbuf.c
index 3dc7ed71b2b2..1b7adbb4f513 100644
--- a/src/shared/ringbuf.c
+++ b/src/shared/ringbuf.c
@@ -237,7 +237,7 @@ int ringbuf_vprintf(struct ringbuf *ringbuf, const char *format, va_list ap)
 		ringbuf->in_tracing(ringbuf->buffer + offset, end,
 							ringbuf->in_data);
 
-	if (len - end > 0) {
+	if ((size_t) len > end) {
 		/* Put the remainder of string at the beginning */
 		memcpy(ringbuf->buffer, str + end, len - end);
 
-- 
2.45.2


