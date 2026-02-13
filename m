Return-Path: <linux-bluetooth+bounces-19042-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNwtB2qQj2lGRgEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19042-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 21:58:18 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C35139850
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 21:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F9ED30312ED
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 20:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34364298CC4;
	Fri, 13 Feb 2026 20:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="GegtbYoa"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9801243956
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 20:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771016293; cv=none; b=OPtdHh1YdzBG5dJZVrsuyN1zkfSjxDYGShDcxUQhxUxXKnjkqeEoMsaS6FW/NzLzgDat9PuC8jRHqzMTbgxGbpzpsuKJYehd0DN95uqjxJ51F1XiFyWjne79azueQbs2KO7N7OG9srG7Rvpfb+Am73CX3FboVo5JVJw0j7zo5MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771016293; c=relaxed/simple;
	bh=2dbfJBhvbFwYDrO4bG8QumSKOzfvKk2UyFeW3xrPqoE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=k73VzOo2nDyzarjB+KRpmjhqrSpCPq2iLIWD+oGB4zaka7RUdaO1XezXyoC7OPKihwniEI7Kr/rYNf33QE5tUHAJceexzgScexOMXbDOzo1rhPcgsVs7S6db0yK1FSyxVbWMfTZV/430gN59tKJ+i6E7RRMgyS9TirQIW0OLfNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=GegtbYoa; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-4959980.ash1-iad.github.net [10.56.178.20])
	by smtp.github.com (Postfix) with ESMTPA id C5FF5921419
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 12:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771016291;
	bh=3Dpqr1ggFBYR+BNNGrDka1cfLxlRnlautP/Tq/uw+Kc=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=GegtbYoa//7oL3uwJE5vOFXLwVh522xPw3iJl6R36sjwsoGqvl+PwideW/1orqyga
	 Jcls3ik9mSuu1nhz/yFEA1MjaI4Xbc4gn4FoAljMHWtvqkwL05fXwuGg9h9yb6UTWi
	 xTgAdlvghTfbLJ/YcpVRi/Nlof52ywzKTGOp93s4=
Date: Fri, 13 Feb 2026 12:58:11 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1053680/88e0e2-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19042-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3C35139850
X-Rspamd-Action: no action

  Branch: refs/heads/1053680
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

