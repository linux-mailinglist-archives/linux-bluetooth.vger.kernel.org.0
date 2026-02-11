Return-Path: <linux-bluetooth+bounces-18940-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIKFMOEtjGl8iwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18940-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 08:21:05 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9AB121D70
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 08:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C552C3036055
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 07:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380EC2FF66C;
	Wed, 11 Feb 2026 07:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="jbra1JFv"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2D81E9B35
	for <linux-bluetooth@vger.kernel.org>; Wed, 11 Feb 2026 07:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770794461; cv=none; b=bt7f7P24YTUdIQHrGxRv00KWRYhff+blObrYLNaSQd+clxuBMxnA8vAi2R00ugRgZHdUSux0csrVwqrXPfX1OnlxUiiPwT/ZHjuMr1KMUH/LkJV5e+yoSEloUD94z3WP/FnkgdIBWRabwVUUxKfc6UuRc7fbvjA0+P7vgw2u04E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770794461; c=relaxed/simple;
	bh=gSpYfZqqFoCAJyKDDLD67T6rR8J44/S9QYR/YFrJ0Xo=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=Pa15fWbxkASOyomvxGqyRwwg/FKxYAEw+e9Pfz9bffXhuwYhLJIKb6T40DEBRZl07vuxThP6+hJcPtD0fBc1o4vxUomV0gNR8yTq6kV13Yr3M4lmFBkaGYJfYI/9Et7x0mgTiK3DfauFwJfYiXIoHefHCSSDT1PizMEmG3cwpWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=jbra1JFv; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-deebeef.ash1-iad.github.net [10.56.157.36])
	by smtp.github.com (Postfix) with ESMTPA id 019F39211A7
	for <linux-bluetooth@vger.kernel.org>; Tue, 10 Feb 2026 23:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770794460;
	bh=Sm/ttga79SUd6L8uJQYUSdSNJYXAdExAe99r8Gln/PM=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=jbra1JFvn+GXONG0/y3XEaFlT+jeUddgo0nSi+nOIGKvZbxIrnKKO7r7YoZQZ6LVN
	 j2pMXHiQ5lVYNXfhNaUYXxxbk4YTug2Q2DYIDyZQ9Jymxkw0Qga/ZAoal0gvfHoBIq
	 zyE8+VEyaJ9aDuPlGXkhU8UtVW+hCvYJGCVv+OOk=
Date: Tue, 10 Feb 2026 23:20:59 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1041012/8a4a6a-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18940-lists,linux-bluetooth=lfdr.de];
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
X-Rspamd-Queue-Id: 4B9AB121D70
X-Rspamd-Action: no action

  Branch: refs/heads/1041012
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

