Return-Path: <linux-bluetooth+bounces-18928-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFjDLmR8i2n6UgAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18928-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 19:43:48 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A1E11E60B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 19:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60258303AA8F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 18:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF12135A93D;
	Tue, 10 Feb 2026 18:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Kfe+eI+d"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E202FC004
	for <linux-bluetooth@vger.kernel.org>; Tue, 10 Feb 2026 18:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749025; cv=none; b=KxAV12l5sGUmypaDB/CfcwvCgkkEJs1eBLmX9MwKriItyKDOceZcH2vSn+CoxygZCbZOq5ojNLVUqL0JPeFIFXTiH9qb5Yi3Jj0hX0EAjVOYxGpTv63oQwErr4ZHS0sBOpHxQ0LC5EsiofjDsIabLurJgP14qvDkaDsJsAJTcmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749025; c=relaxed/simple;
	bh=KBANAjLC0saxurdnNW7t1ohTLIASmWy2iojQOvC0GXc=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=iNfvZIQjSzwTyAoojbiKxMQUX9wkoSk+pMuC0eH7VDH9dQeAUos2l1faXtvthoc5ZnaA36jyKTHtIBCprRqev5mLs9Ssy7Mv3ZdjWpAapjS0CYriReI6eTC/4v3HHFLBlw9Slx+IzXoAL4ESKEtq4wYNlL/OlL82mtZgxS4Nijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Kfe+eI+d; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-2d2dc45.ash1-iad.github.net [10.56.207.82])
	by smtp.github.com (Postfix) with ESMTPA id 8DE59939045
	for <linux-bluetooth@vger.kernel.org>; Tue, 10 Feb 2026 10:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770748815;
	bh=FgK2YwWvajoCgm24RzJFq7j0Vkh8PugCXqeU61O5YIk=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Kfe+eI+dKmEEM9gIyC12DQA+ikOCKmig28UO3V+vEj2hiwzKHpj9J4v0qByAxYUqx
	 4LWtcpQlancuiiINw4tLJFUP9KXzhDBGwDqFOhXkNoenU7bz9JT2QRydk+16oV07LH
	 qR47rTedTmmQJGWFi+eU98tFRIyJRGX0lzg8e/m4=
Date: Tue, 10 Feb 2026 10:40:15 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1052631/e2bb5a-000000@github.com>
Subject: [bluez/bluez]
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : SPF not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18928-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 44A1E11E60B
X-Rspamd-Action: no action

  Branch: refs/heads/1052631
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

