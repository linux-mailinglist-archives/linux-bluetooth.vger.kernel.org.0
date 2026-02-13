Return-Path: <linux-bluetooth+bounces-19029-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCUFFmB7j2mWRAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19029-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 20:28:32 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB6A139344
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 20:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9CCF130028EF
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 19:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852AB28CF5D;
	Fri, 13 Feb 2026 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="DZJ04hai"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1700D28C2DD
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 19:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771010907; cv=none; b=VGzrOi2xYzJ93aZ7yUb+uCVrv3GkVz2QL7ANIBGPRnH6z4kksTT4YkMsPwQc6fPYvuXkFuQcsLFW2dKliNmQMorWjRbruHYz9v+DV1DAK7IUETGTUv7Zx3uD1Lfogrjd0jmTFXBdUEIcqpdS8ifgu1ArkWifQv+CDVJqLZwx624=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771010907; c=relaxed/simple;
	bh=vZVqLaKMiM+/76XhITa9anA+wGvFeBDppLOMEWACCoA=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=WXEw5qvNC9pk+OsYGoMgwd+Rx/gPigvc0yFHqpFUOJMq+Ze/wDbjZwtCi19LyBI/EwlyigyeUz2L+kEp12G52sTRC3vrCKBh5rxEH7GwpyKr0znVnlljUmvWZN6u/3fb1XWo6bbDNjf20j7sYngQzqA5kqayCvwGR1K+6Ycq5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=DZJ04hai; arc=none smtp.client-ip=192.30.252.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-4cad3e9.ash1-iad.github.net [10.56.224.15])
	by smtp.github.com (Postfix) with ESMTPA id 3AE24141170
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 11:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771010905;
	bh=jtwZeazZcGp3AC9s3phKxRE/PD2ZTQkvla6edoezYDU=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=DZJ04haiE2lPTOPW5WUceByydZkx7I/prmubN006lE2mnR+ORUrwO/RMYDjSsSj1M
	 jB8lPE4+Kh65V7uZkda2bMpz/6YmoUJ7YxpzTaXxwstf6oI+00axujoSr8v5iZoIsd
	 OB86DlInB1s2iIUowcQeMXoc9ls6g/LyvSEb64tE=
Date: Fri, 13 Feb 2026 11:28:25 -0800
From: Copilot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/copilot/fix-dualshock4-random-inputs/235fdd-066e59@github.com>
Subject: [bluez/bluez] 066e59: input: Handle HIDP_TRANS_DATC continuation
 frames ...
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19029-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6FB6A139344
X-Rspamd-Action: no action

  Branch: refs/heads/copilot/fix-dualshock4-random-inputs
  Home:   https://github.com/bluez/bluez
  Commit: 066e592c13198d1a090ce4605bee3d3a09610287
      https://github.com/bluez/bluez/commit/066e592c13198d1a090ce4605bee3d3a09610287
  Author: copilot-swe-agent[bot] <198982749+Copilot@users.noreply.github.com>
  Date:   2026-02-13 (Fri, 13 Feb 2026)

  Changed paths:
    M profiles/input/device.c

  Log Message:
  -----------
  input: Handle HIDP_TRANS_DATC continuation frames gracefully

Previously, hidp_recv_intr_data() would reject any frame that wasn't
HIDP_TRANS_DATA | HIDP_DATA_RTYPE_INPUT (0xa1). This caused issues with
devices like the Dualshock 4 controller that may send HIDP_TRANS_DATC
(0xb0) continuation frames, leading to "Unexpected continuation frame"
errors and random input behavior.

This change:
- Extracts the transaction type using HIDP_HEADER_TRANS_MASK
- Handles HIDP_TRANS_DATA frames as before (send directly)
- Logs and gracefully ignores HIDP_TRANS_DATC frames
- Prevents connection/synchronization issues

Fixes random inputs upon connection for Dualshock 4 and potentially
other HID devices that use continuation frames.

Co-authored-by: Vudentz <2156363+Vudentz@users.noreply.github.com>



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

