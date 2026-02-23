Return-Path: <linux-bluetooth+bounces-19283-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GV7AIJenGkUFQQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19283-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 15:04:50 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A06AE177B42
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 15:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97DC830DB7DE
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 13:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D5726E6F2;
	Mon, 23 Feb 2026 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Av+1nGQQ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF0026A1B9
	for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771855184; cv=none; b=CWhYhy1NM8OzUq/Lnz0nW8K29AFz0JpHdmdE2zS9cuolnqDeoCPdGJcSABLrRQexMrCLHY1RQY2Fo2fRgFUTZhsX5yOFAdCNJZcfFe21VChZG8iOH5xWbcU5oP2wtVl5sZQuoE4Xj5wJfhPCVMJDTjMIQCSPmfW5qgMaaqNJ+CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771855184; c=relaxed/simple;
	bh=3+b7ajZqmsTPnP8MzInVU5aVhuvZwqjqvPknknA952Y=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=oc27LW2W2CxQmeiGJB5N6c/cSX1TPnFAeyxExEFjRWy7e/GfGmqnePYvKa2kbEV6rC010E48cgN0/8ocLoDl5bcIrddIRvrtB9KFb5tVkLqa5BX5t/uW+kvC9DYiN93BrfVJkpztAVL1Cy4L+wAhPiof1KHyQS6hXmH5F/RJXxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Av+1nGQQ; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-2da8f89.ac4-iad.github.net [10.52.200.117])
	by smtp.github.com (Postfix) with ESMTPA id DB2424012B4
	for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 05:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771855182;
	bh=zkj5JN2o7H6scS7YpKKvjBr/WSDZ3VNU2Shxb9wX4rg=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Av+1nGQQqRU6H3l0X2zvfgnDn250Ol5oO1CjMTQN/X406eLoG/S9GC3pdfoZbuDNp
	 gBihvw453HvXZvO+7sAX1OxdvVbObrAkJiY0z381zanPltpWO9rbNw0ALzpPTOJh0u
	 ektqiUrpa3Rd1ayL5ljBAAWlRswHQuR+TXQ6wh54=
Date: Mon, 23 Feb 2026 05:59:42 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1055952/d954f7-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-19283-lists,linux-bluetooth=lfdr.de];
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
X-Rspamd-Queue-Id: A06AE177B42
X-Rspamd-Action: no action

  Branch: refs/heads/1055952
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

