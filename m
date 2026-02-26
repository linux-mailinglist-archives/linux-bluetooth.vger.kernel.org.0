Return-Path: <linux-bluetooth+bounces-19453-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPBVBDmroGlGlgQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19453-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Feb 2026 21:21:13 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 662861AF03E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Feb 2026 21:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2495730091DB
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Feb 2026 20:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44A04657FB;
	Thu, 26 Feb 2026 20:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="FcOin9G2"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E26428828
	for <linux-bluetooth@vger.kernel.org>; Thu, 26 Feb 2026 20:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772137268; cv=none; b=XavORkMC7Z8H9qRYuPvom6curke//YY3lm4IB4eAbvUgEV6/2xCuEeo2ThqIMNysc8+GrHu1puC3Q1M6DXH/Wo2O4Fo1dRb8cUjkBYKY/ahvJCW5UlwRjfr6GoWSCD7Xh3wv6CyKrgBuy9LHC7XCVUhe1/IiLo0OvwVctu6b2Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772137268; c=relaxed/simple;
	bh=xRtJt0f6m38Flqut26v7rEJ8KqHDNYvNr4siFaACC/E=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=iTT4ubynnIhYQax/lsMqod2d9JPNL2tBIrx1mCr4WszGQlUkJz+aMy1YPI1RBZy92m1gf0E/cGWI0uZa0EvzSc+i5TobF3b1KsIbJU5t3+PQfQnT064zo3FRVOD5F5Ccz0BWDD0ab9Kz7hlJM2OPmvXGZwdlFcCd7a8oYgJe5ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=FcOin9G2; arc=none smtp.client-ip=192.30.252.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-ed29395.ash1-iad.github.net [10.56.183.32])
	by smtp.github.com (Postfix) with ESMTPA id 666D01404F8
	for <linux-bluetooth@vger.kernel.org>; Thu, 26 Feb 2026 12:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772137266;
	bh=ajOyNvKMcrbEhPukPrlI36Qx1/jIVZKe+Qtg/7ZOYCQ=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=FcOin9G2JLytVXfZJKGW1wkQq0XWbKHmYQ72d1iXTIVpik4Xk1p0q/Duu/Zv0JGtF
	 DaECZ1VddjcT6faUAgCK8jLSXS2/HTbRi8RkkUYzlmc6erDZP+pLqhU7wb+aEi/tX3
	 PBnopEI6vaYggMvuv+8KmtOKJVopxUTKdj40lvIo=
Date: Thu, 26 Feb 2026 12:21:06 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1056469/928fa9-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19453-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 662861AF03E
X-Rspamd-Action: no action

  Branch: refs/heads/1056469
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

