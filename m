Return-Path: <linux-bluetooth+bounces-18650-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM7xF4uDe2mvFAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18650-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 16:58:03 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE782B1BA3
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 16:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CA733034337
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 15:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C5533554F;
	Thu, 29 Jan 2026 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="UixhG/o7"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-27.smtp.github.com (out-27.smtp.github.com [192.30.252.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0379337BAB
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 15:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702245; cv=none; b=GGCvdLxpPJxtvZn1xP8qBTljBjhHEYNnAfqi61m/sxrWBuCaXelN1DnwQ8FzGr2Wpp+Z6AL7mBudEqEjDVCXTAUgcGlrtYkkv6Am8mEpxrOvcj8XOqwau4tcGDPdB+ZZpQQqF75vFQwoDyp2LtaaUaqCva9C//dCSkaKFY9fq9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702245; c=relaxed/simple;
	bh=sYxFq6CR1qcUrczJ3fj1/wLVn2Vq12RBPPtXgLaRK9Q=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=aJEQ8suZ9QPJj9DIZXE1XRJgQxFKRYa6XJ0QYLPal9EjfKluEYh3v9evzMt5cO3bmI2QGsommEo0aULaKO+GFBmVEB2WHT9L99zFxdCw7MTSFLwKIvEOkPKNIejGeRvNwZjeG+CtGEmQ2/90GZj5MsRMG3ai8JlvijQf5y+EYsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=UixhG/o7; arc=none smtp.client-ip=192.30.252.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-1789f09.ash1-iad.github.net [10.56.131.46])
	by smtp.github.com (Postfix) with ESMTPA id 0AD776003B6
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 07:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769702243;
	bh=l3+h0P5pvKCYJlIUIdWzvvk1j0Cm78EZL1Tk/tjCKj8=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=UixhG/o7CYwAKCVQ+0WPXeeoiWzvbcP02EtCHgpFlQ7HA+piGR2KezzPXDox0uei6
	 YKW+/tXUxmuNf5eSnY4ECTW5G5xMpMMrlRztExNY9sBSw5s2g+BQMONhFhKYjtJPHg
	 WF3cBqTWwr30xdqQ9hWrK480+wNHNyF8dtIfS5t8=
Date: Thu, 29 Jan 2026 07:57:23 -0800
From: Arun Raghavan <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1048593/000000-58b07f@github.com>
Subject: [bluez/bluez] 58b07f: media: Fix G.722 @ 16 kHz codec ID value
 reported ...
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18650-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE782B1BA3
X-Rspamd-Action: no action

  Branch: refs/heads/1048593
  Home:   https://github.com/bluez/bluez
  Commit: 58b07fe0e09ca613bcbd3295daab8ebf277768a4
      https://github.com/bluez/bluez/commit/58b07fe0e09ca613bcbd3295daab8ebf277768a4
  Author: Arun Raghavan <arun@arunraghavan.net>
  Date:   2026-01-29 (Thu, 29 Jan 2026)

  Changed paths:
    M profiles/audio/media.c

  Log Message:
  -----------
  media: Fix G.722 @ 16 kHz codec ID value reported by transport

The G.722 @ 16 kHz codec ID is 0x01, not 0x02. The 0x02 value comes from
the ASHA ReadOnlyProperties GATT characteristic which is a bitmask with
bits corresponding to codec IDs - setting bit 1 gives bitmask value 0x02.

Reviewed-by: Arun Raghavan <arun@arunraghavan.net>



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

