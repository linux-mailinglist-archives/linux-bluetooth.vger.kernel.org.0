Return-Path: <linux-bluetooth+bounces-18564-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMjBL+8GeWlrugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18564-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:41:51 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 510BF9945C
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49C9D307D4F3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C13332863E;
	Tue, 27 Jan 2026 18:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="keUc8war"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-27.smtp.github.com (out-27.smtp.github.com [192.30.252.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A346233149
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539261; cv=none; b=IykV4qMx27UBbkWFjhlog6X80sG3Bh1J45jlqVc9ZW/3Ynxj6F0cN9qRsuNOJHNenkM44F/7t7doaTDuFXJJcNwwp2GWGQAxM4LMIY70Fmycvn8ant3KnhcmF0LuoGDkZYkMPzVrZE5nSFIhn1nJpgbIjkf3FK4XZ4qXlr0lXNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539261; c=relaxed/simple;
	bh=CNEtYXQGxx5I19r3X1ltKWfMk+5UqAaFZCF+BGEIgCE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=Sf8Rw9PaJFuAbGv0yjYyrcpN7Dn39Bg88CSAW38gZKeKwq6cvHTnTlaXjejP6UBWyw+g9+M6GrK5/2+qHpObYpuE9y4BdkhSfxbl3BryqMSvf3K0j065zvSNVxsUAJnVDd2NGmKer5wNDJxbPNWbxD/e6JnPzBOF0ioWImoPaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=keUc8war; arc=none smtp.client-ip=192.30.252.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-76b2495.ash1-iad.github.net [10.56.185.40])
	by smtp.github.com (Postfix) with ESMTPA id C82CB60003D
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769539259;
	bh=SrfYwVxX0GNz2EhGaHd96wW23nFq8GEN0P3jgPkrPxA=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=keUc8warMpF8tCCm8749LpHtGiYR9ew+ziQioxizZcFQW8anc/+B9hnYxbw38ml1T
	 Bh0voYFcHJ0TbCapAbhrtVKAlZJS4Xr4BSwS3UW6Vq3Drr3fAFda2V57LRVBaGHTAI
	 LUekbKe+J4gpcqo+qIlT9e5Yna817qUafFtAH0RM=
Date: Tue, 27 Jan 2026 10:40:59 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047698/96c51c-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-18564-lists,linux-bluetooth=lfdr.de];
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
X-Rspamd-Queue-Id: 510BF9945C
X-Rspamd-Action: no action

  Branch: refs/heads/1047698
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

