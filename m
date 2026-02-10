Return-Path: <linux-bluetooth+bounces-18916-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNpMAscIi2kdPQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18916-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 11:30:31 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 657C7119A97
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 11:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4270B3049736
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 10:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF6335E551;
	Tue, 10 Feb 2026 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="jAMfAubo"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FF035C1AC
	for <linux-bluetooth@vger.kernel.org>; Tue, 10 Feb 2026 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770719398; cv=none; b=NJHbbe4TuOQlh+NHrCpf5n3fQLl+8I38mWCxJ8+gt5Iwq1qqfA9BbMwa0myhJ1hN0XZQ6tGlIEsnxufpktImtxYew8zFJ3Foxm2AM4rlfpSDVnbED5sp9Kky0J5d8U8yqm5qkXgBHkrwcaPX/I4yrwVQIQg/Z5L6tCSo+j4txZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770719398; c=relaxed/simple;
	bh=iLxGioLLHwSvqS6u3mxyB4GQN8p69h+wnke3zPYLRKs=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=Sr0TPngUbWWg9FJZhCfeLo/RWLd5p0qtpdzoew1Y/mBUM6JoT7ahAjqXnvUrZDdxi20yHUxMmkBj2Ew+XESx2jrWmuI6z3LP7eQRoghkePsZ9sqIyUwPeRBKNFvWLkK8GJtyIm+RJe47Igy8UhdTd84afWv1Efv0O5LKPwQ5jvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=jAMfAubo; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-e7ca5b0.va3-iad.github.net [10.48.210.59])
	by smtp.github.com (Postfix) with ESMTPA id 3F2783C1279
	for <linux-bluetooth@vger.kernel.org>; Tue, 10 Feb 2026 02:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770719397;
	bh=H1crPKrGtvGNg9n50QdIqjlpWQekvIAQUj4slAaJrb8=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=jAMfAuboaMqp/YePmK8PgFxPmkOI5RZOanQ25gSDSPJ9iINoaYTGiFbnNUyhgy3gO
	 eMwYpHQ9DKhL8CP4Lnq2r0yqCJmhB67wFTZTxObbvx8n6Ie5J0tRU/MZVetnWYY4kW
	 YZXpIstndPe6Zpk98VSTjAdIITsotsKdZ50i5nJ0=
Date: Tue, 10 Feb 2026 02:29:57 -0800
From: hadess <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1052631/000000-e2bb5a@github.com>
Subject: [bluez/bluez] e2bb5a: emulator: Fix compilation on big endian systems
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-18916-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 657C7119A97
X-Rspamd-Action: no action

  Branch: refs/heads/1052631
  Home:   https://github.com/bluez/bluez
  Commit: e2bb5a9cd38cae80490fbd12cd3861ed8180f3a7
      https://github.com/bluez/bluez/commit/e2bb5a9cd38cae80490fbd12cd386=
1ed8180f3a7
  Author: Bastien Nocera <hadess@hadess.net>
  Date:   2026-02-10 (Tue, 10 Feb 2026)

  Changed paths:
    M emulator/bthost.c

  Log Message:
  -----------
  emulator: Fix compilation on big endian systems

This fixes the build on big endian systems like s390x:

Remove the "static" so the array doesn't need to be initialised
with constants.

emulator/bthost.c: In function =E2=80=98bthost_setup_sco=E2=80=99:
./src/shared/util.h:43:26: error: initializer element is not constant
   43 | #define cpu_to_le32(val) bswap_32(val)
      |                          ^~~~~~~~
etc.

Fixes: 85888a8357ea ("bthost: add bthost_setup_sco() and accept
incoming eSCO")



To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

