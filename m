Return-Path: <linux-bluetooth+bounces-18334-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGhfK/Zacmn5iwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18334-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 18:14:30 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4790E6AF7B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 18:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E21A6304FA1E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 17:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F74E366553;
	Thu, 22 Jan 2026 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="ODWg6BMN"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB353624D1
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769100089; cv=none; b=VVNdOim1JJYyD1AS59gzrWLnkKd0vHle3oJHkp/PFRRxw743RWqSiyj5SlR2+BKtSZ5pfRxAhEEdwNHwguPFA+ilPSlJ2FFqYvuiRXCCSnN5yCPj0oq7iqvMscXmEJD18x6PIVz7DmsXwuW8gTk7caYARudJ3gYj7RFPwIVzEiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769100089; c=relaxed/simple;
	bh=uAxZAZI8zppK/Ngu8oOGl/VngkdPrOBIy/vvtMcH/vI=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=qbyq94EsxYKNIiUpUkM5mbwVSTfiHD/nUTJ/05TzUYPsCj/JkaNcIVi7g6lPfhWVm+0zyLs4sEHvWtjQf3dm9ndsoe15JxTfzsNpMgZlperEtolh6knSYRQlsLSdGB2tNxyRbTrwr7LcY6xezk+VS8kLsJ5kVLV2zle4Npr4fCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=ODWg6BMN; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-7e90b62.ac4-iad.github.net [10.52.167.34])
	by smtp.github.com (Postfix) with ESMTPA id B0D42643BC2
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 08:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769100080;
	bh=6AK9OkOKBQeALThqqQofuglGCezr2hedLVLFVO0awng=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=ODWg6BMNr0gdMsSeoihM72WWJmRDCIBfxETD7BFlOLUICUUoGBei1mcWxNgLM7enu
	 LxtxOHAkjiQrUjxedv1ejt4Hgt/gKAO3w9rjAlhOyA52Jzxa649RtkIKKjtWf0fXji
	 ZojPoRx67+LrlT4+kl6iLQ7Uq9Ta9JinJhW+WR6E=
Date: Thu, 22 Jan 2026 08:41:20 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1044232/89c24e-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18334-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4790E6AF7B
X-Rspamd-Action: no action

  Branch: refs/heads/1044232
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

