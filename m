Return-Path: <linux-bluetooth+bounces-18675-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH+mB8nre2ntJQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18675-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 00:22:49 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAF2B5A5E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 00:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C1813033230
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 23:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EC22FE575;
	Thu, 29 Jan 2026 23:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leuFvzxu"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB4137647B
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 23:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769728941; cv=none; b=iiXBo8AS/vMDGaQRHi/Uq6V6OZDYLWLc04pGrzv+xHN60FfqhYxqKGAffmtOFA9xhyPtNt9L1koHyOAGVkvjkwUgm+qkJlQAxAgm3/OWj3SvC6Nqs/L1fryWssrBmHknzRYS/aKXssv1gtpRliWNUycdj4aMF45+GJsbW+9Txi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769728941; c=relaxed/simple;
	bh=odTZW0xuqthGQaZazXaNwATKc5o2lqUQ98edVSbX+Sc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8bPxkceKEMbMmRCLG3kryJ0bMW0pSVmdD4vYEQ/NqxHTvNVNrwuB5OWmpwaEWN1eCKxMzoxp6J1KQta8M4Q9J70sS2iFvoJvZFJCs++U7FuBSF1+XUBz5KSwQUXwiny/RqkNrceOSsM+jxHWPdeM7it+1wrKJ45iSWIQ5HAfzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leuFvzxu; arc=none smtp.client-ip=209.85.217.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f68.google.com with SMTP id ada2fe7eead31-5efa6d5dbf5so505144137.1
        for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 15:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769728939; x=1770333739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MllALOn03gcOUhnSv13C0TZEKaJiJi6/qYvTpXoGjBM=;
        b=leuFvzxui4NHQwE5/ADjJ+07qLN1qP2laSrfhQAu5Ir3bG78wmiWi1PjOCnUCTVzvi
         QwXBJ2UII4N4N+8Ic9SvkS546m+9qHwy3DKPnOr+FfeltlsLFNGc/x+xeN3jX6PLRWlK
         VKpp8ANZqDdRFuun7RUGSMUbSjhzEjSQ0MEoHyl3Kio1vi47tWFzfrsReTF6iHBfe0SU
         60cJXI0nvkJh9qGpLSv+pHLMGc/qSDkcLE+JeGhnfRdkV/4XlZeNJqujdsY4ftezxKw7
         wPAGq71BHtd3sIOqcgUgyrBfWb/4DMsgolbzBFFW4rJ9l0OeTK5BkORNe6EBVkmMGSbh
         UZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769728939; x=1770333739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MllALOn03gcOUhnSv13C0TZEKaJiJi6/qYvTpXoGjBM=;
        b=sDbPDqdipOZoeIEdZ4KHfOAudQtWzOxVdkfZ48M7OWBPMYcjJ9I0yWBFxwd5P0/+60
         fyQYPJ5iAXV/ol9JwiIkRtoQvjabsHKsFAIQz2aMyJJEt459UlTU8NR738mHGs1EayB/
         X8e/ymKHSuX7eioRdSLxwcVsubtAhLqLOBti9jNoPI07wcBS37wOacUEoUeuXU+RcIWp
         IyT6btvRoeLGmUkXIIRia1uxDtPaq7D14Vd7SjVAdCxGHHwJ03nBm4mAFJgq57Hz+WyM
         HQhbF/uKbl5EetZF11N9p18nzWzK+vlqOwKZx2STObfmpFt5mJmkum+gLP6DYuCSigf3
         Oh9Q==
X-Gm-Message-State: AOJu0Ywlcu6YouuVkjfslKWzAF+EtllSYiESjK9b2+v3e3oDLbVraAnv
	OtAdfJ9gPX6YoRkIIamZULyNPOj89UVkXu0SNzo0u7wNeTWfPg2cyYVUocXEjSOgqfw=
X-Gm-Gg: AZuq6aKJ7zfQbtzTcJQnY3CW7OvOTfNJ0wFaz4Hj/6wA99Z6msWFrqZBEzmjv0ES7Lw
	5LlJ0WQCVz5Ljrr1BTIu44y/Zp8NxIdjLNZ2pCIBpzPtrb8RGepKeJgKGwAEoVAdJWxXQsKT/5v
	Xl3S7hcuCD9LNT8SJK5w6nzj0jj8Ajhjm0HBB3jpjH+2ETM9Ejlm3pLDHYkGsRSkTOjURV/OktO
	FerGzvXtXgJXbCcRJghmXdPj6JDSnBuK0ljFOLaFyBDUVKR92Kv0EA4FUEBsNN9Vp31wsG6lf/j
	VGrLAjZAfwxmPtOjzLxafXF2WATCCmpiwh3smlkJS8E6BXqcWXJbPpbE3ijbczICzg416E9uh5R
	p5Pmch5RjQHjzr9U8qKPilX2/kSm+E47YsaZhzhQD/3652a5lZHyaRciXdrSbCgDYgt2M0pflst
	YgzgcQ3o5sAL91QsVkCVcDR3NLQclYVy/TMZNfWEreEdlqhFkEVvIIBzGhh2lnR2wU+JPxwhY1g
	bRapw==
X-Received: by 2002:a05:6102:3f0e:b0:5f5:6dc0:e50f with SMTP id ada2fe7eead31-5f8e25fa9dfmr393358137.21.1769728938915;
        Thu, 29 Jan 2026 15:22:18 -0800 (PST)
Received: from lvondent-mobl5 ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948724cb7casm1535890241.9.2026.01.29.15.22.17
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 15:22:18 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v1 06/15] doc/bluetoothctl-bredr: Document arguments and add examples
Date: Thu, 29 Jan 2026 18:21:45 -0500
Message-ID: <20260129232201.1049568-6-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129232201.1049568-1-luiz.dentz@gmail.com>
References: <20260129232201.1049568-1-luiz.dentz@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-18675-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8CAF2B5A5E
X-Rspamd-Action: no action

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Add parameter documentation for show, connect and disconnect commands
explaining device address and object path parameters for BR/EDR
operations. Documents optional vs required device parameters.
---
 doc/bluetoothctl-bredr.rst | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/doc/bluetoothctl-bredr.rst b/doc/bluetoothctl-bredr.rst
index 3ec702a59ff3..0bfa012c57f3 100644
--- a/doc/bluetoothctl-bredr.rst
+++ b/doc/bluetoothctl-bredr.rst
@@ -27,6 +27,8 @@ list
 List available bredr devices.
 
 :Usage: **> list**
+:Example Display all BR/EDR (Classic Bluetooth) devices that have been discovered:
+	| **> list**
 
 show
 ----
@@ -34,6 +36,11 @@ show
 Show bredr bearer information on a device.
 
 :Usage: **> show [dev]**
+:[dev]: Bluetooth device address or object path (optional, uses current device if omitted)
+:Example Show BR/EDR bearer information for currently selected device:
+	| **> show**
+:Example Show BR/EDR bearer info for device with specified address:
+	| **> show 00:11:22:33:44:55**
 
 connect
 -------
@@ -45,8 +52,10 @@ This command initiates a bredr connection to a remote device.
 By default, it establishes the bredr connection and then connects all profiles
 that marked as auto-connectable.
 
-:Usage: > connect <dev>
-:Example: > connect 1C:48:F9:9D:81:5C
+:Usage: **> connect <dev>**
+:<dev>: Bluetooth device address to connect to
+:Example Connect to BR/EDR device:
+	| **> connect 00:11:22:33:44:55**
 
 disconnect
 ----------
@@ -56,8 +65,10 @@ Disconnect device over bredr.
 By default this command disconnects all profiles associated with the bredr
 connection, and then terminates the bredr link.
 
-:Usage: > disconnect <dev>
-:Example: > disconnect 1C:48:F9:9D:81:5C
+:Usage: **> disconnect <dev>**
+:<dev>: Bluetooth device address to disconnect from
+:Example Disconnect from BR/EDR device:
+	| **> disconnect 00:11:22:33:44:55**
 
 RESOURCES
 =========
-- 
2.52.0


