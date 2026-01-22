Return-Path: <linux-bluetooth+bounces-18338-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKOuCZ1mcml0kAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18338-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 19:04:13 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 784D06BE95
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 19:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A028C30306C4
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 17:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0118F3A7046;
	Thu, 22 Jan 2026 17:00:30 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B5B2EE5FD
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 17:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101226; cv=none; b=gkHpUg6gYlJr8NlmVIJm7KrhF4BnLXx6DeroPkg6zEyZ/Otc6DK4GRDXZm+BVXghyDoqTTtH4ei7K7UfUCAaq6diXcj9kO0Pk4NH1RwWjxX73Di0uFhBzbpX8mLM5xBVFNiaNAgGvcn8BwOgzdNCUwvcGuLHzZ7is0Y8tXNN5Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101226; c=relaxed/simple;
	bh=CrEWvX6/vZW/JINsIuxibAHLN2y3b+hNRm3BGSnnkw0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r/hT4kVXFJ4FoMkQ3ozurKQQF7VMSFAMRFGSEhVGnfjOjirojpH8GrnI1U+mrg1FxLk+471TzazsLzJhW40G/plfH4Ej6DSp0mCdHJc8YWd6Lwp3B0WTrcnu2Ac1FmRjB0btCsGAi8ELKYS4e3rbViZVcRhcEtvS+q2IInPgpTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id C986F444E1
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 17:00:09 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-bluetooth@vger.kernel.org
Subject: [BlueZ 1/2] doc: Add "C" code-block markers for coding-style doc
Date: Thu, 22 Jan 2026 17:58:57 +0100
Message-ID: <20260122170001.122052-2-hadess@hadess.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122170001.122052-1-hadess@hadess.net>
References: <20260122170001.122052-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeijeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeekteetgeettdehieduiedttdetffelleehtdejkeeluedvgfffvdevteetudfhkeenucfkphepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgejfeemtghfvddtmegsrgegfeemrgeijeeimegtvdgufeemjegrheefpdhhvghlohepohhlihhmphhitgdpmhgrihhlfhhrohhmpehhrgguvghssheshhgruggvshhsrdhnvghtpdhqihgupeevleekiefhgeeggefguddpmhhouggvpehsmhhtphhouhhtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-State: clean
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-18338-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[hadess.net];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NEQ_ENVFROM(0.00)[hadess@hadess.net,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.942];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 784D06BE95
X-Rspamd-Action: no action

The file isn't processed by rst2man, so this doesn't add a new
dependency as was the case in 0ea4e4d52c55 ("doc: Remove Pygments
dependency from manpage").
---
 doc/coding-style.rst | 46 ++++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/doc/coding-style.rst b/doc/coding-style.rst
index 585d14fd86d9..91250e867f09 100644
--- a/doc/coding-style.rst
+++ b/doc/coding-style.rst
@@ -30,14 +30,14 @@ not preceded by an expression or variable declaration.
 Example:
 1)
 
-.. code-block::
+.. code-block:: C
 
         a = 1;
         if (b) {  // wrong
 
 2)
 
-.. code-block::
+.. code-block:: C
 
         a = 1
 
@@ -47,14 +47,14 @@ Example:
 
 3)
 
-.. code-block::
+.. code-block:: C
 
         if (a) {
 	        if (b)  // correct
 
 4)
 
-.. code-block::
+.. code-block:: C
 
         b = 2;
 
@@ -67,7 +67,7 @@ Example:
 The only exception to this rule applies when a variable is being checked for
 errors as such:
 
-.. code-block::
+.. code-block:: C
 
         err = stat(filename, &st);
         if (err || !S_ISDIR(st.st_mode))
@@ -80,7 +80,7 @@ If your comment has more than one line, please start it from the second line.
 
 Example:
 
-.. code-block::
+.. code-block:: C
 
         /*
          * first line comment	// correct
@@ -95,7 +95,7 @@ There should be a space before and after each operator.
 
 Example:
 
-.. code-block::
+.. code-block:: C
 
         a + b;  // correct
 
@@ -110,28 +110,28 @@ body.
 Example:
 1)
 
-.. code-block::
+.. code-block:: C
 
         if ((adapter->supported_settings & MGMT_SETTING_SSP) &&
         	!(adapter->current_settings & MGMT_SETTING_SSP)) // wrong
 
 2)
 
-.. code-block::
+.. code-block:: C
 
         if ((adapter->supported_settings & MGMT_SETTING_SSP) &&
 	        			!(adapter->current_settings & MGMT_SETTING_SSP))
 
 3)
 
-.. code-block::
+.. code-block:: C
 
         void btd_adapter_register_pin_cb(struct btd_adapter *adapter,
 	        			 btd_adapter_pin_cb_t cb) // wrong
 
 4)
 
-.. code-block::
+.. code-block:: C
 
         void btd_adapter_register_pin_cb(struct btd_adapter *adapter,
 	        						btd_adapter_pin_cb_t cb)
@@ -147,13 +147,13 @@ There should be a space between new type and variable.
 Example:
 1)
 
-.. code-block::
+.. code-block:: C
 
         a = (int *)b;  // wrong
 
 2)
 
-.. code-block::
+.. code-block:: C
 
         a = (int *) b;  // correct
 
@@ -165,7 +165,7 @@ When declaring a variable, try not to initialize it unless necessary.
 
 Example:
 
-.. code-block::
+.. code-block:: C
 
         int i = 1;  // wrong
 
@@ -200,7 +200,7 @@ prefixed by the ``enum`` type name.
 
 Example:
 
-.. code-block::
+.. code-block:: C
 
         enum animal_type {
         	ANIMAL_TYPE_FOUR_LEGS,
@@ -211,7 +211,7 @@ Example:
 If the enum contents have values (e.g. from specification) the formatting
 should be as follows:
 
-.. code-block::
+.. code-block:: C
 
         enum animal_type {
         	ANIMAL_TYPE_FOUR_LEGS =		4,
@@ -230,7 +230,7 @@ compiler will complain the new added type hasn't been handled.
 
 Example:
 
-.. code-block::
+.. code-block:: C
 
         enum animal_type {
         	ANIMAL_TYPE_FOUR_LEGS =		4,
@@ -278,13 +278,13 @@ parenthesis, too.
 Example:
 1)
 
-.. code-block::
+.. code-block:: C
 
         memset(stuff, 0, sizeof(*stuff));
 
 2)
 
-.. code-block::
+.. code-block:: C
 
         memset(stuff, 0, sizeof *stuff); // Wrong
 
@@ -296,7 +296,7 @@ A function with no parameters must use ``void`` in the parameter list.
 Example:
 1)
 
-.. code-block::
+.. code-block:: C
 
         void foo(void)
         {
@@ -304,7 +304,7 @@ Example:
 
 2)
 
-.. code-block::
+.. code-block:: C
 
         void foo()	// Wrong
         {
@@ -321,7 +321,7 @@ Example:
 
 1)
 
-.. code-block::
+.. code-block:: C
 
         if (device) {  // worse
         	memset(&eir_data, 0, sizeof(eir_data));
@@ -335,7 +335,7 @@ Example:
 
 2)
 
-.. code-block::
+.. code-block:: C
 
         if (!device) {
         	error("Unable to get device object for %s", addr);
-- 
2.52.0


