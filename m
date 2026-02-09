Return-Path: <linux-bluetooth+bounces-18904-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PPcNpxQimmmJQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18904-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Feb 2026 22:24:44 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F35114C8F
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Feb 2026 22:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0E913029E60
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Feb 2026 21:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E15A30C60D;
	Mon,  9 Feb 2026 21:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="CF4kjjPL"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E5F253B42
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Feb 2026 21:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770672180; cv=none; b=it9s+FkVGqRXkGaXAg32BYuqTWAFids3df4gc+Qr7J7t4ML6kfi5/lQA1kC7D+zEd0H+FgXalL7u7AZKusJWpQX4QBVWP20ckDeR91fbbnPlWeHTdlZqLPd/NlMWdeqbisWaLl837FyBUf8foqVFaoPvCq68pePJuONy2dZ4GAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770672180; c=relaxed/simple;
	bh=XNDQtnfg/orsvgHnuO35Be5ykb37OFPwSEDjfWqbpWY=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=YfAmMrg7LpxWTcG3YR3QSatOJPU7okUkEi7erCO//QZWF/txnuTU4hFTwWfbkR2hYmLqWW61C4/H1Y/BlLdwDgB6CWrYMf6aaJz9lxCidvEyEIWsBXHA79U1wvol9TbmKoPc70lRES0lf35DUa8kcHFomlLn1fS86sdcvMPuS9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=CF4kjjPL; arc=none smtp.client-ip=192.30.252.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-25761c4.ash1-iad.github.net [10.56.145.43])
	by smtp.github.com (Postfix) with ESMTPA id 72EA0141318
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Feb 2026 13:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770672178;
	bh=SNeJWye1969gu2z7Vy+5N2PpNNGLkcZ/p0McB9q+oa8=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=CF4kjjPLWYtaUozVDjZN3TaOu2aAvgSR5Jzd+Ivm2n1K3JLz9ydPa5R3zuyUL9buo
	 QMHr55iquDqS6AJQLJ3uRwAvms85wNL0rjfScbYZh4bR6fCADTSCeA9YegEzawy17F
	 /vS/lN5DkY4neEpt2qTGoABeQMaa+nkhRy9RUEns=
Date: Mon, 09 Feb 2026 13:22:58 -0800
From: Copilot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/copilot/generate-release-notes/ce6a16-aaefe9@github.com>
Subject: [bluez/bluez] aaefe9: Add release notes summary document
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
	TAGGED_FROM(0.00)[bounces-18904-lists,linux-bluetooth=lfdr.de];
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
X-Rspamd-Queue-Id: 76F35114C8F
X-Rspamd-Action: no action

  Branch: refs/heads/copilot/generate-release-notes
  Home:   https://github.com/bluez/bluez
  Commit: aaefe90892544ec86dc4bb8622ce71b3c6ca3abe
      https://github.com/bluez/bluez/commit/aaefe90892544ec86dc4bb8622ce71b3c6ca3abe
  Author: copilot-swe-agent[bot] <198982749+Copilot@users.noreply.github.com>
  Date:   2026-02-09 (Mon, 09 Feb 2026)

  Changed paths:
    A RELEASE_NOTES_SUMMARY.txt

  Log Message:
  -----------
  Add release notes summary document

Co-authored-by: Vudentz <2156363+Vudentz@users.noreply.github.com>



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

