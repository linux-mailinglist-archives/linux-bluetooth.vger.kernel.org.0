Return-Path: <linux-bluetooth+bounces-18793-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBu8D43ZgGnMBwMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18793-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Feb 2026 18:06:21 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA179CF5D7
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Feb 2026 18:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0480303E5D0
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Feb 2026 17:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9819C3816E0;
	Mon,  2 Feb 2026 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="hk2hYxI4"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10AD239086
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Feb 2026 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051823; cv=none; b=U2gAsoHeuLZXgc/TzzVsLvkSNjGl7Aj+GeQCZH2PZL7XZeV4hQ+PmTT2yU7LsRIP1N5c0AJYhbsdxbJH1Yg5/3u9McLJZeX4xzpwEEMgQkGBr6jpjRsz9DRvyA6bSL/vwIMeC2miGQZaV+UXevtdwybU8RQFmf6pHFs83AEN1Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051823; c=relaxed/simple;
	bh=zA2lfKJWVLYoLbk3suZX7Yincq3oL+nBhzYIHaknEHQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=Vyc7JYMASyJ7pAxJEPquY9sTm1VDy0lUqMxQsDxno86q8kLFLT6kp0rc435OURUopOiTCYLZN65p88vOwYd4gOc9fuhK3S/uaaayu6grgCDf8ejEN9Fg0yJUOGXcv8qZ1Mj4gGPfrguQKhPqjBmuG9fP+rrbmpa2MzHUEF6llBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=hk2hYxI4; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-5040f2b.ash1-iad.github.net [10.56.202.49])
	by smtp.github.com (Postfix) with ESMTPA id 1937A92114E
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Feb 2026 09:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770051821;
	bh=UTk+q+jJYVekJgdAjUSaPVLtTHxyBEBg7tYJG2jV0fg=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=hk2hYxI4pOeyepV0y8+YmmUn6xQbLMDWbUs9dPDxf0OJSYuEBSX6KvKkvx2TbX2pw
	 l7mt0HADA1Lydt/44ZRoZoKZWJKe6Ys8ZgVedK0Pklr/PDYrJWMX2nlG6PBksHfov4
	 TNZaS6hwavfaEBXlNBWS4dv4ipkNatu0ndhqMvYQ=
Date: Mon, 02 Feb 2026 09:03:41 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1049069/55d9a7-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18793-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA179CF5D7
X-Rspamd-Action: no action

  Branch: refs/heads/1049069
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

