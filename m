Return-Path: <linux-bluetooth+bounces-18903-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ8ZEpRQimmmJQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18903-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Feb 2026 22:24:36 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99754114C79
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Feb 2026 22:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 069973024941
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Feb 2026 21:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B56130E836;
	Mon,  9 Feb 2026 21:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="HBt6RTNf"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-26.smtp.github.com (out-26.smtp.github.com [192.30.252.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE0C30B539
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Feb 2026 21:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770672153; cv=none; b=F/Jows4UCuSzqcRz9naoY84GZaGGtG2pB9Aambt5gf2hdjvupw3vVMjU6dIdQ6QmlqBGgfSGftQB9wKpTVt4cBpexRK7UfxvF6I993VbBvsT0l86KWwSZJw7Ee2tiMJEreuP42KYCF3PkzV2Ko8ErsVvpNFyzBb1EXtgnXXEyls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770672153; c=relaxed/simple;
	bh=WyJyid9SEzh+u24/yGUaHmmOB/sQc73eG2krv6PVlmM=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=RZ4eu+FyIZ8I8/N95mnITDmk2I/+e4c3YgUC96uyOH0XyGTfrZ2ClhGcchSi8XEax1yvZPvMqN6uj6cl9O2IH5nF3KcRd/8XJU/j8JtuYwJyA2RnGCgtOMRrQQ3EmndIEr0rjYi3x4Y5rhN+P4+xYZUPSBwHCv6aS2BI9OWoUIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=HBt6RTNf; arc=none smtp.client-ip=192.30.252.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-2c2be67.ash1-iad.github.net [10.56.145.39])
	by smtp.github.com (Postfix) with ESMTPA id 5EC73601324
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Feb 2026 13:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770672151;
	bh=qEtD+l+PJXQ1aJy1mh6f22jw88pVl0xuVe6nDlQMvgY=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=HBt6RTNfDLVK8JJpO6WW8ESgR+t+eZ9nZ6/6ywD2zXh+kGX6lN280a4TfFKCCwNTo
	 Ae98jWl8FkAv4RwWngVNbAbSei+OqpNCY6UNHyae5DeT5chkAipZcXR7siaHgWKlzd
	 7T0MFF/K9Oj3hJslHE4KRlP/gEVpWeVCBOa79pNQ=
Date: Mon, 09 Feb 2026 13:22:31 -0800
From: Copilot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/copilot/generate-release-notes/761c22-ce6a16@github.com>
Subject: [bluez/bluez] ce6a16: Add comprehensive release notes for PRs closed
 Nov...
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18903-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,release_notes.md:url]
X-Rspamd-Queue-Id: 99754114C79
X-Rspamd-Action: no action

  Branch: refs/heads/copilot/generate-release-notes
  Home:   https://github.com/bluez/bluez
  Commit: ce6a16739989941784252b668a15ecd565dc37c1
      https://github.com/bluez/bluez/commit/ce6a16739989941784252b668a15ecd565dc37c1
  Author: copilot-swe-agent[bot] <198982749+Copilot@users.noreply.github.com>
  Date:   2026-02-09 (Mon, 09 Feb 2026)

  Changed paths:
    A RELEASE_NOTES.md

  Log Message:
  -----------
  Add comprehensive release notes for PRs closed Nov 21, 2025 - Jan 8, 2026

Co-authored-by: Vudentz <2156363+Vudentz@users.noreply.github.com>



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

