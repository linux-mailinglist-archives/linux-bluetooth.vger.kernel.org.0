Return-Path: <linux-bluetooth+bounces-19131-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMmXAvDClGlWHgIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19131-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 20:35:12 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9E914FAC2
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 20:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CDF330209F8
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 19:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096FE36F431;
	Tue, 17 Feb 2026 19:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="TyUROy9C"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64AA2620DE
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356908; cv=none; b=F7+wz9S6benGYteF/+/PEloOg69Nk24XLgSeOihl21whyulXXMHXrbkkihwUz8G40iIpPKauctmzyfOh742g6kFyWz7QgSyvgmXBCmbTxhUiI+Gp+pIRIDx+dol9MisU4szCtyjfUUPm5PnY5Dgrk4mpMjBB6cAo92L7QtETQ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356908; c=relaxed/simple;
	bh=WFOo5mdHmKi5PNrrRCRbu43xmbciDTUX/ZwebCeuylY=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=CeuMzoSjbwwmMyh57yJMS/AqEZQ4eDuLNh9mSLBZxmcLYmZfAvH/og3pypiQp+U0RlDTJEzJ978N+ZTqO8/jFzNh/tRif2uEt7wQueirIuABnFLJOLXNAs1ut8vzsMX+22hPGlxB5qGn75xsW2viFlO4tZ0mNkovWSQ3MWePUqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=TyUROy9C; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-cb7a443.ac4-iad.github.net [10.52.141.21])
	by smtp.github.com (Postfix) with ESMTPA id CB150640C62
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 11:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771356906;
	bh=T4IYVuUKB9eVBgSbeehySB1SFdiaOgu/4kr1Hh+yVpQ=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=TyUROy9Cwe4C4aGaYyYNz1y8DvoPxot2a3HakRmkhr6bnt26Z/2RmeVjbQ22AoLau
	 H9yWbUy29FxE2v4Ktb7/SCk9FhlBtYiB4wzKJwedGfpHQAI6q//JLqHgopYb7aEK+h
	 uJQQNLgFttQLP/iQCyKZN9KLyMLA5545ZMr5K+9Q=
Date: Tue, 17 Feb 2026 11:35:06 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1054909/1bad1c-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-19131-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C9E914FAC2
X-Rspamd-Action: no action

  Branch: refs/heads/1054909
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

