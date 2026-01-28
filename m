Return-Path: <linux-bluetooth+bounces-18616-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0K7VBZmHemkE7gEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18616-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 23:03:05 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB0AA9598
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 23:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14AF03045C24
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 22:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7464C342537;
	Wed, 28 Jan 2026 22:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="BidknyHW"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0F133C19C
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 22:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637755; cv=none; b=lVEixd/b0eJjv7MByB3fLKCCCKZhH2nxBDmR97nfai7vH0x6TAbppZTerIaJ1VmwGAzcDLKBB9DxV0w3x9KnJA7F+KbiZ5IajNJ1Fkrh7dvJr9fQ4asxkiuA9wuJJ/PyMrVKpt8WLLKT5GWRUpmdsouqASIQf1MVPQC8wyfVZZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637755; c=relaxed/simple;
	bh=BY/YhDEJV5hUIbH5FwParuVffs2G+wyaa2i86jONrow=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=GkEdIcFU1S+Hz8N6+iSc7QF8tEErT0PdQPPSTLtkVGoOWWI4pAxMg9vQDwDg6mEUdKAsf1PUgWjwBon0xdhsMHFyNrm3d39qFN6VdGMrymQ1z5EMYAZteriPw2mheT1BdLM+V+/vjmiK9VjIUF4EmFCEtioCeR/1UkEWu4WrJA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=BidknyHW; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-e595e05.ash1-iad.github.net [10.56.162.35])
	by smtp.github.com (Postfix) with ESMTPA id AEB4C921345
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 14:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769637753;
	bh=YLgaBhd1n8AW+nlpjHn2gY+bB8VFuBJLC1id6PrTRVU=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=BidknyHWmvLlzfVCzHeqWTXV8Xkdbgz/IbTiv273z0bIFHYnl5BY0iRMT/jFuI0K7
	 mxlxNH7EvhZBHYc2+CKkb3DxWzqulj8lR0YO1BozrN+VVTK7lAFbKer2iip7YwmXo1
	 xUhtfSudTds+Lv4zNhN99zD0h8c8CwCmTQ0uAVYw=
Date: Wed, 28 Jan 2026 14:02:33 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1048215/969859-000000@github.com>
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
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18616-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ABB0AA9598
X-Rspamd-Action: no action

  Branch: refs/heads/1048215
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

