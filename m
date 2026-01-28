Return-Path: <linux-bluetooth+bounces-18604-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO9XKrczeml+4gEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18604-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 17:05:11 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D6A509E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 17:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBBCB30195B5
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 16:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EC5273D76;
	Wed, 28 Jan 2026 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="lhtnTBj+"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06B930BBA5
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769616016; cv=none; b=hHWZLetyBKXCgZsUHNtGvkyuUzbZxdER0bb4hniufrUFvG5K7Yf+5Dx6gXsz7TZat4DOU0EXwJaJjsr23idpxT2BpIv0r1SI57lcgF2ZuetxEcGxA3bfrHnQ0Ivr4Hoh98qj7FaGqkv1KNcMuc/oXfw7eqX3Rw3wD5IV1031Jq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769616016; c=relaxed/simple;
	bh=uVVUFyqksOMHKRTTAMVXKnuwR/5m0lKD1egE7WsW0jQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=Z5UxaSCRapidKUDu6lmmHj4AHtishSwyQ51r0DfdpL8hMQGVTcyxJIzQrx8kb7zke0JV6ma9XDKADbwNRHUTk4IlUbErZzqIAaP0SRQdz2zVUl6t77cypJBT1/1rtwQDM8Ck8TpAEsSbovOiOc1eSK/NazrNSLKvUO8mI/lcusU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=lhtnTBj+; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-d4e2d4e.ac4-iad.github.net [10.52.223.72])
	by smtp.github.com (Postfix) with ESMTPA id C491F40136A
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 08:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769616013;
	bh=lF1F/GyIycipwv0vEOJBQkakcZzyuzfCAFR1EP2QLcM=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=lhtnTBj+HvMOJmtrn/F80EKsjDtC2z1SLUaf2uzQhe6CYmacHqrvgzIFkFJCFbFfg
	 pO7ibKUJYgJoKZg72HG8HWZpZb3x3lDhFNXyDedJB64/C33u8hi+HtokciAfdIPgQI
	 0D9OPQXnjG2g0/KNnsOff4eyzxI84ugHQH1cAKHE=
Date: Wed, 28 Jan 2026 08:00:13 -0800
From: Magdalena Trivina <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1048150/000000-d8aa72@github.com>
Subject: [bluez/bluez] d8aa72: tools/sdptool: report error when local SDP
 server ...
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
	TAGGED_FROM(0.00)[bounces-18604-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 419D6A509E
X-Rspamd-Action: no action

  Branch: refs/heads/1048150
  Home:   https://github.com/bluez/bluez
  Commit: d8aa72c79fa742245eedd92ac39191aa414486be
      https://github.com/bluez/bluez/commit/d8aa72c79fa742245eedd92ac39191aa414486be
  Author: Magdalena Trivina <trivin2024@gmail.com>
  Date:   2026-01-28 (Wed, 28 Jan 2026)

  Changed paths:
    M tools/sdptool.c

  Log Message:
  -----------
  tools/sdptool: report error when local SDP server is not found

Currently, the sdptool add, setattr and setseq commands do not
report any error when the local SDP server is unavailable.

Add an explicit error message so users can distinguish between
successful execution and failure due to a missing local server.

Signed-off-by: Magdalena Trivina Sihotang <trivin2024@gmail.com>



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

