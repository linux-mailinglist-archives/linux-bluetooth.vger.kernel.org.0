Return-Path: <linux-bluetooth+bounces-19192-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE68HThGl2m2wQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19192-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 18:19:52 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8074161183
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 18:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E9C73117FFD
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 17:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB0E34EF0D;
	Thu, 19 Feb 2026 17:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtZGg5yr"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55783502A2
	for <linux-bluetooth@vger.kernel.org>; Thu, 19 Feb 2026 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521244; cv=none; b=KY2CLiU/vphaEIvVgtG7fne9VN2Dvqguec8gJrJ3Gllkd2JKHot/v9wVDw23fDpZ9GxSBJmGCV8zH2yub2jrRlvBDSRgoZbzbHxzpj93I4hgx147CiiJ/ntFT96z31vmOUHntsj0NGthFWH5iwWloU3egGYHJroS7jPSPWxSnWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521244; c=relaxed/simple;
	bh=7nNzz17kSCCmlWDu86ZhyMKFITWZeFxpgwAsgGFQJqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H/fKFUm2D4JCdk6Lu616YNkCdLz8y/7zCXcqHyGcTrys61bNkW0EHsU8OuTKeALNXRYKa+53S5BTRQtpTwn5EpbfZyNTStjK8ADlOZs/CNExibpPvH00iF8Z3QvgWBvu7eLL9LJBPEo5GOpB+3XLEje7O+TeuhgnfqLufQ1r/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtZGg5yr; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a9296b3926so8026155ad.1
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Feb 2026 09:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521242; x=1772126042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1WOyKHAoHX8FrQxrc3Dl9TiChr0cIqUNlYEGeUOx2A=;
        b=TtZGg5yrWFuXu5/GCzdSMMgCHVF7IQTkBxbkcAIG5TOTaC3wLAz5kSZTf4QcrJFM93
         jfZGxzHgjH+bCOk6RSCmUlMmeyVH/kX6GkFCuBlO+x8HeSEhukWwQc6FFB4GCaOXvP/P
         qWuOImVoF45t0oQ/zl1hhADbzfDZyxXfzKyPLfOCsA2AoyKb6kq7akuYA/8EFGdiy28w
         mMQ7DuyXkxqgr1wrt9OMLNqA6gUM4VDNzPUyt/b+I6IaW1grdMOwToSng1pnHMnMLp+2
         YmRKitnk2EWrMwib0SDFYE9IzS3ikUfWcZcmwBXCMPtitR0dNgw8MSGE6aUJoDAFYlOi
         o9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521242; x=1772126042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x1WOyKHAoHX8FrQxrc3Dl9TiChr0cIqUNlYEGeUOx2A=;
        b=D2mEQej/qcvp+/wGAb8vx1wBuZLdy0xZNBBbNXFZZk1ASdClrizd0leb+aeFQtVYfh
         gUF/711oFhV6rHW8xq9ISrXQkYXHKgieN43v1StkvKlpv1QcP4AAdrVPDRG1vrIAKfKT
         vGS8XZwdJB0jCH2SXBu+qKqRCKu+ntHlajJGZUl1StJwTp536yN/KIzdyI7GE3pWwrSK
         Y++sEg0gVGWFtfvonaWNfiYu+E9EFL79OQfNEqhMewZRWKPQpeI+ofIuQeiUqoFiEm7g
         doiKd8Cjt/XhVjjENnvdDFHp++1F7CpZokmAinzgdpusOgCF/nHItFd669RFrbWyfvXx
         Sduw==
X-Forwarded-Encrypted: i=1; AJvYcCWNaG3L++i+vCzXxysh7dGICra8vt9zZ8nzlyn+x5CqgNTj6Ub33lManDWryEbmAVMSAq8WMiFBvNB5Y6Rg+r0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrzAOU8E5QSSWrVlEl5g1wSdMU8KtKUKoVTidMaLj5zUhtpQQk
	QJdbFIdnwI5rIkUj3HtMvgm4QR6TNbRP74WmvmqO2K7r/3Sx+Bic6L5Q
X-Gm-Gg: AZuq6aIKFJYKI8XIeuusu8zo8jI2ydGWebw6etQ7uugY14+TUGs/itHAMNYHxbPSsqW
	QlOAWTpakI/DXlvfSPrf6j//AOCDf2H7f+PrtF2fbZyempe2OxhACQDWmYmuxrtIAcxEmDssZ46
	B4XOijgzlYPSn3hvDvbHSe8l3rQVTQXsDmnOjKYZ08lP7MHhJ4MMN0acrKLxugbgO6kRubld4+9
	NNqLrySJDhcDewl6LQ9Y6iCnAW607AcH5gDbGkh9ORI+cIvoim7VwMzeQvT/8lfzwBlWO7nQQpD
	R6IrG1hIy5Zjs4sInJ4HqWmP7g5+ZUz/So5Hv++bbsOHk4mm25ImOm8j5E1bmxhBxcT6w883Rim
	HJX5rZ9VdQiDW0NtT/gaDfJIidu86LNiVRYkkuOGUtomCxROys6eSLw+EwWhhvIfw2C0otJjoZj
	or5aoGp8/XnqvK7W3ZNRbnqLAMJCMtDwOemj2scrFB9NzqZIBWNw==
X-Received: by 2002:a17:903:32cd:b0:2a0:34ee:3725 with SMTP id d9443c01a7336-2ad50e9cad9mr58949655ad.14.1771521242253;
        Thu, 19 Feb 2026 09:14:02 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:14:01 -0800 (PST)
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
Subject: [PATCH 5.10.y 11/15] timers: Add shutdown mechanism to the internal functions
Date: Fri, 20 Feb 2026 02:13:06 +0900
Message-Id: <20260219171310.118170-12-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219171310.118170-1-aha310510@gmail.com>
References: <20260219171310.118170-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,linutronix.de,inria.fr,linux-foundation.org,arndb.de,vger.kernel.org,roeck-us.net,gmail.com,holtmann.org,kernel.org,infradead.org,goodmis.org,linaro.org,huawei.com,lists.linux.dev,intel.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-19192-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goodmis.org:email,linutronix.de:email,intel.com:email,roeck-us.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C8074161183
X-Rspamd-Action: no action

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit 0cc04e80458a822300b93f82ed861a513edde194 ]

Tearing down timers which have circular dependencies to other
functionality, e.g. workqueues, where the timer can schedule work and work
can arm timers, is not trivial.

In those cases it is desired to shutdown the timer in a way which prevents
rearming of the timer. The mechanism to do so is to set timer->function to
NULL and use this as an indicator for the timer arming functions to ignore
the (re)arm request.

Add a shutdown argument to the relevant internal functions which makes the
actual deactivation code set timer->function to NULL which in turn prevents
rearming of the timer.

Co-developed-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/all/20220407161745.7d6754b3@gandalf.local.home
Link: https://lore.kernel.org/all/20221110064101.429013735@goodmis.org
Link: https://lore.kernel.org/r/20221123201625.253883224@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 kernel/time/timer.c | 62 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 54 insertions(+), 8 deletions(-)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 0b76a2ab42e3..b46614e14da1 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1300,12 +1300,19 @@ EXPORT_SYMBOL_GPL(add_timer_on);
 /**
  * __timer_delete - Internal function: Deactivate a timer
  * @timer:	The timer to be deactivated
+ * @shutdown:	If true, this indicates that the timer is about to be
+ *		shutdown permanently.
+ *
+ * If @shutdown is true then @timer->function is set to NULL under the
+ * timer base lock which prevents further rearming of the time. In that
+ * case any attempt to rearm @timer after this function returns will be
+ * silently ignored.
  *
  * Return:
  * * %0 - The timer was not pending
  * * %1 - The timer was pending and deactivated
  */
-static int __timer_delete(struct timer_list *timer)
+static int __timer_delete(struct timer_list *timer, bool shutdown)
 {
 	struct timer_base *base;
 	unsigned long flags;
@@ -1313,9 +1320,22 @@ static int __timer_delete(struct timer_list *timer)
 
 	debug_assert_init(timer);
 
-	if (timer_pending(timer)) {
+	/*
+	 * If @shutdown is set then the lock has to be taken whether the
+	 * timer is pending or not to protect against a concurrent rearm
+	 * which might hit between the lockless pending check and the lock
+	 * aquisition. By taking the lock it is ensured that such a newly
+	 * enqueued timer is dequeued and cannot end up with
+	 * timer->function == NULL in the expiry code.
+	 *
+	 * If timer->function is currently executed, then this makes sure
+	 * that the callback cannot requeue the timer.
+	 */
+	if (timer_pending(timer) || shutdown) {
 		base = lock_timer_base(timer, &flags);
 		ret = detach_if_pending(timer, base, true);
+		if (shutdown)
+			timer->function = NULL;
 		raw_spin_unlock_irqrestore(&base->lock, flags);
 	}
 
@@ -1338,20 +1358,31 @@ static int __timer_delete(struct timer_list *timer)
  */
 int timer_delete(struct timer_list *timer)
 {
-	return __timer_delete(timer);
+	return __timer_delete(timer, false);
 }
 EXPORT_SYMBOL(timer_delete);
 
 /**
  * __try_to_del_timer_sync - Internal function: Try to deactivate a timer
  * @timer:	Timer to deactivate
+ * @shutdown:	If true, this indicates that the timer is about to be
+ *		shutdown permanently.
+ *
+ * If @shutdown is true then @timer->function is set to NULL under the
+ * timer base lock which prevents further rearming of the timer. Any
+ * attempt to rearm @timer after this function returns will be silently
+ * ignored.
+ *
+ * This function cannot guarantee that the timer cannot be rearmed
+ * right after dropping the base lock if @shutdown is false. That
+ * needs to be prevented by the calling code if necessary.
  *
  * Return:
  * * %0  - The timer was not pending
  * * %1  - The timer was pending and deactivated
  * * %-1 - The timer callback function is running on a different CPU
  */
-static int __try_to_del_timer_sync(struct timer_list *timer)
+static int __try_to_del_timer_sync(struct timer_list *timer, bool shutdown)
 {
 	struct timer_base *base;
 	unsigned long flags;
@@ -1363,6 +1394,8 @@ static int __try_to_del_timer_sync(struct timer_list *timer)
 
 	if (base->running_timer != timer)
 		ret = detach_if_pending(timer, base, true);
+	if (shutdown)
+		timer->function = NULL;
 
 	raw_spin_unlock_irqrestore(&base->lock, flags);
 
@@ -1387,7 +1420,7 @@ static int __try_to_del_timer_sync(struct timer_list *timer)
  */
 int try_to_del_timer_sync(struct timer_list *timer)
 {
-	return __try_to_del_timer_sync(timer);
+	return __try_to_del_timer_sync(timer, false);
 }
 EXPORT_SYMBOL(try_to_del_timer_sync);
 
@@ -1468,12 +1501,25 @@ static inline void del_timer_wait_running(struct timer_list *timer) { }
  * __timer_delete_sync - Internal function: Deactivate a timer and wait
  *			 for the handler to finish.
  * @timer:	The timer to be deactivated
+ * @shutdown:	If true, @timer->function will be set to NULL under the
+ *		timer base lock which prevents rearming of @timer
+ *
+ * If @shutdown is not set the timer can be rearmed later. If the timer can
+ * be rearmed concurrently, i.e. after dropping the base lock then the
+ * return value is meaningless.
+ *
+ * If @shutdown is set then @timer->function is set to NULL under timer
+ * base lock which prevents rearming of the timer. Any attempt to rearm
+ * a shutdown timer is silently ignored.
+ *
+ * If the timer should be reused after shutdown it has to be initialized
+ * again.
  *
  * Return:
  * * %0	- The timer was not pending
  * * %1	- The timer was pending and deactivated
  */
-static int __timer_delete_sync(struct timer_list *timer)
+static int __timer_delete_sync(struct timer_list *timer, bool shutdown)
 {
 	int ret;
 
@@ -1503,7 +1549,7 @@ static int __timer_delete_sync(struct timer_list *timer)
 		lockdep_assert_preemption_enabled();
 
 	do {
-		ret = __try_to_del_timer_sync(timer);
+		ret = __try_to_del_timer_sync(timer, shutdown);
 
 		if (unlikely(ret < 0)) {
 			del_timer_wait_running(timer);
@@ -1555,7 +1601,7 @@ static int __timer_delete_sync(struct timer_list *timer)
  */
 int timer_delete_sync(struct timer_list *timer)
 {
-	return __timer_delete_sync(timer);
+	return __timer_delete_sync(timer, false);
 }
 EXPORT_SYMBOL(timer_delete_sync);
 
--

