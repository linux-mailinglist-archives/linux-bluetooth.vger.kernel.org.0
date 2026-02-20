Return-Path: <linux-bluetooth+bounces-19220-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBoVF68jmGlNBgMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19220-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 10:04:47 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA857166010
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 10:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99DAF301F4B9
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 09:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE33C31A7F6;
	Fri, 20 Feb 2026 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="DUy2/kHL"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D653115B1
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 09:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771578226; cv=none; b=OB+XCCQpPWE/cgHgbg+iT1SNREuCK9Hfw3WZOBWDGmf4DWrrz2WhUsvyJohI7Rm7cuGYrmPK0bzw/CwvJMclUpHjKer+m/dUEDu6b4XS03Udj3R/oFMhUBtqTD/GnY/O2Dz/DPI7wjD1FmaBzK+PFCLZrXAT/tqN5gJp7/vGh54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771578226; c=relaxed/simple;
	bh=trcXWHQftXl/DjaD8q/PKEPVjHbHiWJmHcJhHP1uC9o=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=d82LJwv4syx4drPj8ZypsBZOE4jFaEMeVw7M+SYVAjnXRhMKcsCFrcqtQqU2wAYX39IAOjfP6tfsyFNsCBR+kkuldhMkOcyRY5RO2TjnmLWNx70UqkLYWJEa2+eXPkAb4nB08KFIhkLdS9+DLgF4V9m4bJDDDd7BPmp6DU7XHP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=DUy2/kHL; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-b8dc33b.va3-iad.github.net [10.48.184.53])
	by smtp.github.com (Postfix) with ESMTPA id 4CA8B3C1258
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 01:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771578224;
	bh=FdaI0cGLrbIB3Xd2APRtnvQbCwP8ck9jn4KLlpEbJVY=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=DUy2/kHLRGxsIX7yUP015MJojhsf3gdUjs1XUrtBHBFPjXjSNtd6SiOmBlev6fILl
	 hRminHpxxbgWeyquzmY6NFSWI7MiuweSkthl2YCpIW+GnhtQI4SFSXnJAP7q8TKWso
	 PdMZ+XfHugljM2AbR3+KIybG+a0oCImTPc6FxxZ8=
Date: Fri, 20 Feb 2026 01:03:44 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1045032/5a2416-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-19220-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA857166010
X-Rspamd-Action: no action

  Branch: refs/heads/1045032
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

