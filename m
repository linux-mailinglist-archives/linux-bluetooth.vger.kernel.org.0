Return-Path: <linux-bluetooth+bounces-19270-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHiIC3/vmmmtngMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19270-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sun, 22 Feb 2026 12:58:55 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EB516EFFF
	for <lists+linux-bluetooth@lfdr.de>; Sun, 22 Feb 2026 12:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC19B300E3D0
	for <lists+linux-bluetooth@lfdr.de>; Sun, 22 Feb 2026 11:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC6C2571B0;
	Sun, 22 Feb 2026 11:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="aYZurXeT"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD68123C4FF
	for <linux-bluetooth@vger.kernel.org>; Sun, 22 Feb 2026 11:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771761531; cv=none; b=llnKqLp+Q5xxEBLhS02X/nF48pxUZAnBDwqAES+7OcHi5BG3xyKyJFp6qNcDsuksccNCrncM+Qx6pQU2pSjeR3sMBZLPM7D4KDFvx6IZRDF16bSb382WDZ/xZShzFoPU4nrw8rItdhHnZ/ahBI0jcP+eU6CzJAX74wnF7pHCSKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771761531; c=relaxed/simple;
	bh=grUSTzappW7XOsz5L2Mry38nfZX2ZpEq7hz9IA9W6uU=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=hv0SWepKdDTiL/NDwpOlrxOf4mIsLuav9a2ObVOEo6Gp4holfNqe+jbtyl568WD+ehwA3+AdaKoLmCwoRdRK6mUnAHI+t8BEZxuO3oAv7a5oqWPUhB/FYvLXcaTWdpEpeJWgvbD3oki3FVmWCusvKaJGbDaVqWXISYbXpg6iq8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=aYZurXeT; arc=none smtp.client-ip=192.30.252.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-22de16d.ash1-iad.github.net [10.56.128.63])
	by smtp.github.com (Postfix) with ESMTPA id C6CB4140B87
	for <linux-bluetooth@vger.kernel.org>; Sun, 22 Feb 2026 03:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771761529;
	bh=2URqM9AzMfnh9QsfwyG+X1Y054c8ujo1GQ6jkhcHlAw=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=aYZurXeTUMKFTc/haGgg7ugrAfz1zsTirpsdU8crfT8fjBiXaGoiHNPPQVqf5fBg+
	 FGqCwZqO0J8ElHsr/UeIqsNE6+cQI02M/GJPapk/zF3wuSQ5K1loXsqCTCFGmqd8yX
	 SgdICwsNHz6UJouVwjtM9h0kgxmx3IKlnezM0Q/Y=
Date: Sun, 22 Feb 2026 03:58:49 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1046224/035cd6-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19270-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5EB516EFFF
X-Rspamd-Action: no action

  Branch: refs/heads/1046224
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

