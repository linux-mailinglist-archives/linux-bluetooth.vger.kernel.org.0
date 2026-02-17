Return-Path: <linux-bluetooth+bounces-19132-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEMhKvPClGlWHgIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19132-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 20:35:15 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B614FACA
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 20:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B035F3035D7B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 19:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F1E377561;
	Tue, 17 Feb 2026 19:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="h6nHqFdh"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-27.smtp.github.com (out-27.smtp.github.com [192.30.252.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A729339866
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 19:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356909; cv=none; b=ETwjZ7r4hPj5AKRaxeKZnBYcgI/zXyQp+qWVbJPS9t3xeDUFqWl6iUC9jowoRQI5on3ei6Zo1iUfxWM6dQbw+wfBXI9e5yfyV6bqE6ElaU3rXxy6wi7PPNuL02xdi1qglpup2itd2GwuRyiH+qGBqNWQHRelzr87F6szC16EImU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356909; c=relaxed/simple;
	bh=/TCWAKAvBgYHSLhtkH3EqiLn5pqYd2Vc0fms73FpvG0=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=ZJDIBJbZNCUNEyKXnmkwGKFrzxGRRgZ9bCwyyMjwlt5WXFmRzoBEVI2ZrUv+RZNNpxfUVYnF/K/VNj3kHBGRlLBscUg8yiY5GcFhvRT7cUnsnZFl/wH279ZPvdpOZRrpu8F2r48P+ai5qW1RLJH+IRe/fsyek8EdBHfz9oEa+Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=h6nHqFdh; arc=none smtp.client-ip=192.30.252.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-fc37bb1.ash1-iad.github.net [10.56.147.23])
	by smtp.github.com (Postfix) with ESMTPA id 9A4DC60133F
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 11:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771356907;
	bh=m+gmGvALvlDkA0mkrU5pRStQf+F+QD/23akqwByMsl8=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=h6nHqFdhz/FJjLVhHgHJyAY4IxDrtDsrXNGi8uKeUcBOTavRHSunOo7PiCc1kbs68
	 wEfg6+aFt1De/eef8j5d+LYE1bD0PmOttp8CX5nbclU40hQGTEVt96z1ZNWxtDBjbQ
	 /m/c1R4xcG9MXeDkQc3M4tYxQrVUUXOER0P+xLxQ=
Date: Tue, 17 Feb 2026 11:35:07 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1051861/5b1c5b-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19132-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 372B614FACA
X-Rspamd-Action: no action

  Branch: refs/heads/1051861
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

