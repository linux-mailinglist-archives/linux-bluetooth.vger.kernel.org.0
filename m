Return-Path: <linux-bluetooth+bounces-18397-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPyAFueFd2m9hgEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18397-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 16:19:03 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC728A06A
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 16:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42B4D300A276
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 15:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7383233B6EC;
	Mon, 26 Jan 2026 15:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="N/8TTywy"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21A723AB8D
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 15:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440630; cv=none; b=ND1kHPxpy1wGDt2+zCYu3XoruRcpO4iTAUUZLjx2XXkDoo1KU9eWa9PLS1a9Ly+IWWjH3cStBe8PnCR4FP64i04bvI9RCiVN0JRVlnSxXnlWRvYl9hwmN8PAF+XiRLpRafdxsmgajY/ROaedQrYb+8buE3L3H3eNUHbbvco4Ohk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440630; c=relaxed/simple;
	bh=+25JQMxEiXCUFkmlfKMCUBkotbycyeXwaHiNBsTSc8w=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=TcJLPCSZUQKp4/kkKoSHF4lO7j+SwWN2LhvIADAggx1L8KuMOS//qn2akEQrpUo4PoZDIDRaInfIobeqCd+pyHjVotYZ9Uame9WDD5LhpLBGeU2/a5vrBF0nCtyTgZraBX7vv9Gw2mtGRA2XNKaryMNPRmi7g/qrAj54kHzbiwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=N/8TTywy; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-4b22668.ac4-iad.github.net [10.52.145.55])
	by smtp.github.com (Postfix) with ESMTPA id 16B2B401253
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 07:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769440628;
	bh=y61TsLCTrEtRA+ZQXFeGAPfJt18M8CyuD7um95/SPbQ=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=N/8TTywyoqyXk50Qmy4pifj29KwrBPVhMrOCkfJ+c0ijwVqAjjeryePTm7hM48NKY
	 D04sREWCSrtS6l6k0VFn1Y99wtVMQ5va5yEB8pfL4dewSDZFmUsHJoQPBzHDwuZG4a
	 ld/SSelMajMqJXMHWHKOMeWh8rsghFm4xMtglaXU=
Date: Mon, 26 Jan 2026 07:17:08 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047158/000000-72e7b1@github.com>
Subject: [bluez/bluez] 72e7b1: shared/tmap: Fix TMAP/SR/SGGIT/CHA/BV-01-C on
 big ...
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18397-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6BC728A06A
X-Rspamd-Action: no action

  Branch: refs/heads/1047158
  Home:   https://github.com/bluez/bluez
  Commit: 72e7b19e2f16e42cda81cb12343f88fcdac0be92
      https://github.com/bluez/bluez/commit/72e7b19e2f16e42cda81cb12343f88fcdac0be92
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-01-26 (Mon, 26 Jan 2026)

  Changed paths:
    M src/shared/tmap.c

  Log Message:
  -----------
  shared/tmap: Fix TMAP/SR/SGGIT/CHA/BV-01-C on big endian

This fix the following error cause by not converting the role value to
little endian:

TMAP/SR/SGGIT/CHA/BV-01-C [Characteristic GGIT - TMAP Role] - run
**
ERROR:src/shared/tester.c:992:test_io_recv: assertion failed: (memcmp(buf, iov->iov_base, len) == 0)
Bail out! ERROR:src/shared/tester.c:992:test_io_recv: assertion failed: (memcmp(buf, iov->iov_base, len) == 0)



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

