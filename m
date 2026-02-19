Return-Path: <linux-bluetooth+bounces-19182-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJHhGEBFl2lMwQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19182-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 18:15:44 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B1A16108F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 18:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73660308705D
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 17:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4315034DCD2;
	Thu, 19 Feb 2026 17:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhm5+CsQ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E3134DCCC
	for <linux-bluetooth@vger.kernel.org>; Thu, 19 Feb 2026 17:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521204; cv=none; b=K9cLLtWO5cdGGW1L7xfpJ3zQ13EWSiptNxDuT0dSYzPPyrukjiYOoHukSgAKy2AV7UuvkS8i/nSdEFk91F2NAFnC8IrXN5/xKPv0whUkPg65a9dWRCn8myI9pQXwhXnsId9MZAjTgi7OnznOV6tm4E19IDT7OOs+ZjTqs5oXwyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521204; c=relaxed/simple;
	bh=BfuWtJpHFnoUxb8s7xJBVcBtioNVHYkElOeeOAD1d8Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p5ehEwbHY4kJ7YxDXP03BCHFWzKxqOUKbJVmlEhV0p+bNcVTL16mQRmBKd617smXI3zYzrG2saQSrjSr9gTnqQKSg6GMrsNgAVHet/zAF8WoIv+MlBTlTON7yxZrhbwJ+ppQ9YkgSz7hgVO/IuRaFKACeT2nLOWrluU6nnPykuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhm5+CsQ; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-824a9348603so494453b3a.2
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Feb 2026 09:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521199; x=1772125999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGAsWoT0ij2AF8u7lzQ99aTp0zEqYgQwfONKoWXhuNs=;
        b=fhm5+CsQ011ZwA//aWYGTjUA62K/WCYqJGHfvR5IrgA+HqQl1FZ4ODO0vHZbYrTlwV
         2gkScdkOKK8l7mVWYvqh+NTqDbwXtlQmwH2adQiMN+i1wY+9fieH/+JPHS/xOcahjOXL
         AC4w2y3vdDeoaYOhOquVEBH1CLyIVEirjBh00V+6tVt+yFW1ZJZb3zt6xl0QbNbVKNuV
         iIJ8wxqin1PbUtwrHQk0lxPQGd/GLYw0PEdO4EYwk590TNARvescSTIj6iUWkXk5BWQ1
         S/yfU2ESOD1XlF9J07B8e+gdpMg9DbaxevNIC7KFaj3m0HFq+F+Ub65t0oq/gDtKaMe6
         NMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521199; x=1772125999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rGAsWoT0ij2AF8u7lzQ99aTp0zEqYgQwfONKoWXhuNs=;
        b=gsGSbpHjQwiPveiu0SQaRDJSm3qtM1DexW1K8bJnz2MmvP6EcRXZQ9Q8+UP7ftRrdn
         iReOBWzVFdT2FjCCTU8B302d9vWYozJSVe1Bwbv9PuJYVPdznl85iZY3W8tpL38oYpgw
         pdrWBaiq+MKBgbJ/y23GSHaACfWaSNcDmlGvHkozOg+x+ocwhzkfqy6n/ZZXaX9q7N2r
         gMLJh1f1x4kPCFheD9/4FLPRsTzeuhYiV144utxGlHaXOSxDM++FwPqfcTzXBi1XWJAU
         zrO3+NVqhsj1Y/fN7Iu7z0SXAYzTfvpzw5GJmXTNTQtm8IZLWWIu5VxXEOzZ26dtkg1C
         1GDw==
X-Forwarded-Encrypted: i=1; AJvYcCWfrAViOUkzCqgtNPx/Gb8SZxAJIbB3FbYFQCseq8M/GKC+brTPqo1QJWDNpVXVPSS94VxPEBUgT2xQYiwt2m4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJKAYDGG/tLL/FIPYn38SVAUaSJ315cNTw5kdgR6Ld/vAqckyU
	7JgFSkldG/4gnV+2XZiPvVxKqqkh9SjqnRNbIsde4Xl5ZSjOEDEQiRgDhwKXz25xbgY=
X-Gm-Gg: AZuq6aICwjLkT69ixsgiR74UvLPSypEw/1YCbaGom8TasctyG5vp1opimPK4suOjfmb
	6kIYSEmJZ11xqGSVXYIr0VQjA+i3aHmPvEwDonsha74/WPeVP3ZnMbcd7ITi7bJalMHF87xy8/9
	Xf4S+qIjM1fxJRMj0y0yK9sxlkwkKhD8/Gz8epsH12w1MnaDV8K1G0KwyX6oTVvaenbV55zKMjk
	RgdncgrV7TKqQVO7mnR9qw61KPKKJof0XzYXpOja76K1T07mIhzAKzUFGNOJ5cWLIa890D8G6Na
	DeE7ZeFRWLj1gYK5hkVMxFNyyjtod2EcRm35X0TRVbLwzpxCcyabB8Y1PINcYt7WVqEvATpreiM
	tazVScOZrET2do7g/lvpE4Qg/q59JobcmWDvoCJpdVBE1aJefecYTIvIWUArh8dwz/4mUsaWdUs
	hpHfEwudrKyNsd+SjKBs6Xife+IkagyQYKtBRBcJ4PXPitUQTKoSJAPSpCfQzF
X-Received: by 2002:a05:6a20:d81a:b0:366:14af:9bb4 with SMTP id adf61e73a8af0-3946c96fef3mr21545093637.62.1771521199469;
        Thu, 19 Feb 2026 09:13:19 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:13:19 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	Julia.Lawall@inria.fr,
	akpm@linux-foundation.org,
	anna-maria@linutronix.de,
	arnd@arndb.de,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	maz@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	sboyd@kernel.org,
	viresh.kumar@linaro.org,
	zouyipeng@huawei.com,
	aha310510@gmail.com,
	linux-staging@lists.linux.dev,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH 5.10.y 01/15] Documentation: Remove bogus claim about del_timer_sync()
Date: Fri, 20 Feb 2026 02:12:56 +0900
Message-Id: <20260219171310.118170-2-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219171310.118170-1-aha310510@gmail.com>
References: <20260219171310.118170-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,linutronix.de,inria.fr,linux-foundation.org,arndb.de,vger.kernel.org,roeck-us.net,gmail.com,holtmann.org,kernel.org,infradead.org,goodmis.org,linaro.org,huawei.com,lists.linux.dev,intel.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-19182-lists,linux-bluetooth=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1B1A16108F
X-Rspamd-Action: no action

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit b0b0aa5d858d4d2fe39a5e4486e0550e858108f6 ]

del_timer_sync() does not return the number of times it tried to delete the
timer which rearms itself. It's clearly documented:

 The function returns whether it has deactivated a pending timer or not.

This part of the documentation is from 2003 where del_timer_sync() really
returned the number of deletion attempts for unknown reasons. The code
was rewritten in 2005, but the documentation was not updated.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/r/20221123201624.452282769@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 Documentation/kernel-hacking/locking.rst                    | 3 +--
 Documentation/translations/it_IT/kernel-hacking/locking.rst | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index 6805ae6e86e6..b26e4a3a9b7e 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -1006,8 +1006,7 @@ Another common problem is deleting timers which restart themselves (by
 calling add_timer() at the end of their timer function).
 Because this is a fairly common case which is prone to races, you should
 use del_timer_sync() (``include/linux/timer.h``) to
-handle this case. It returns the number of times the timer had to be
-deleted before we finally stopped it from adding itself back in.
+handle this case.
 
 Locking Speed
 =============
diff --git a/Documentation/translations/it_IT/kernel-hacking/locking.rst b/Documentation/translations/it_IT/kernel-hacking/locking.rst
index 51af37f2d621..eddfba806e13 100644
--- a/Documentation/translations/it_IT/kernel-hacking/locking.rst
+++ b/Documentation/translations/it_IT/kernel-hacking/locking.rst
@@ -1027,9 +1027,7 @@ Un altro problema è l'eliminazione dei temporizzatori che si riavviano
 da soli (chiamando add_timer() alla fine della loro esecuzione).
 Dato che questo è un problema abbastanza comune con una propensione
 alle corse critiche, dovreste usare del_timer_sync()
-(``include/linux/timer.h``) per gestire questo caso. Questa ritorna il
-numero di volte che il temporizzatore è stato interrotto prima che
-fosse in grado di fermarlo senza che si riavviasse.
+(``include/linux/timer.h``) per gestire questo caso.
 
 Velocità della sincronizzazione
 ===============================
--

