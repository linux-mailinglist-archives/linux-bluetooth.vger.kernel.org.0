Return-Path: <linux-bluetooth+bounces-19249-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3nndLcCimGn0KQMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19249-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 19:06:56 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C76169F7D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 19:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D63F5303983D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 18:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A5B235EDDD;
	Fri, 20 Feb 2026 18:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="RcrQyF9Z"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-22.smtp.github.com (out-22.smtp.github.com [192.30.252.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0139327144B
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771610812; cv=none; b=X2bFkSAR94mWkrGNQkyJZdcuFTGtwEEYW2xILwZSHEo8W35WjqO4Pd7rsDQ1t5yThkToxBJQiaUc3/u2EcupbjepJzVUsGReaqcbxGL6D8OZb8A0iAWBXF54K78MP+q+6HjzoNazYT1w6xkKm+CJi1zbIUndhJJMWtQou+bF2fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771610812; c=relaxed/simple;
	bh=Q72PbDAWU0XQ0VQB5wFpnNebzbcBQD8ATFUjmOLYDHw=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=egC2JDmWISBeG1CMZin3HiV2DaxlHu3Xh2HKDdzpQybIYF1ENpQ2X0s7JARaIlKNiyJ5h1/BkOc1p4TY06zwJm+5piIk8mUSNlniIaGIzNESHX0U3gLz5cv93R5FfRl9DYvir8EG55UscQGLrsyVX1PoLaT4Qr1yiW0Lyeqs078=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=RcrQyF9Z; arc=none smtp.client-ip=192.30.252.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-0983238.ac4-iad.github.net [10.52.14.56])
	by smtp.github.com (Postfix) with ESMTPA id 1884420796
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 10:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771610810;
	bh=pbhsVPu/oJYvLnJU7pwBhwOMrCG3AMMBM0gEQHVqrEk=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=RcrQyF9ZBDmZKX+hkgisC/QL9OS+KwlxKGvNpPEhDUtS4EKtWcXJ1HYpkansaM3fZ
	 Z4Ze1227VrbLeiWlwjMcFDgk/N+UxDCKUVMSrOHNqHbxb/3pjO4xkYnbuNrFnnWHYn
	 qWkOwmnZcskMsy6Wf6eyEG7OGps1VGtWJSZyejPw=
Date: Fri, 20 Feb 2026 10:06:50 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1055977/000000-791df0@github.com>
Subject: [bluez/bluez] 791df0: l2test: Attempt to use BT_SNDMTU if output MTU
 has...
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
	TAGGED_FROM(0.00)[bounces-19249-lists,linux-bluetooth=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 18C76169F7D
X-Rspamd-Action: no action

  Branch: refs/heads/1055977
  Home:   https://github.com/bluez/bluez
  Commit: 791df0f00bad5517294f85df5e2f078be961de7f
      https://github.com/bluez/bluez/commit/791df0f00bad5517294f85df5e2f078be961de7f
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-02-20 (Fri, 20 Feb 2026)

  Changed paths:
    M tools/l2test.c

  Log Message:
  -----------
  l2test: Attempt to use BT_SNDMTU if output MTU has been set

With the suggested fixes for L2CAP/ECFC/BV-27-C the kernel shall be
able to accept setsockopt(BT_SNDMTU) in order for an applications
to require a minimal output MTU greater than 64.

Fixes: https://github.com/bluez/bluez/issues/1895



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

