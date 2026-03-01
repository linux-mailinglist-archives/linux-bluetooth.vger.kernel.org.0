Return-Path: <linux-bluetooth+bounces-19548-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Fu1HtqapGnZmAUAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19548-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sun, 01 Mar 2026 21:00:26 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF461D16CE
	for <lists+linux-bluetooth@lfdr.de>; Sun, 01 Mar 2026 21:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A28E630074E7
	for <lists+linux-bluetooth@lfdr.de>; Sun,  1 Mar 2026 20:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A6C3382EC;
	Sun,  1 Mar 2026 19:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Df4mLxns"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8025B3382C3
	for <linux-bluetooth@vger.kernel.org>; Sun,  1 Mar 2026 19:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772395194; cv=none; b=nX7To970CcGdIZNfJnFzcRpGwmcxSQICr6MDi8qSiDA+iPhJzzkY8c93tk6h+errbDEjQrTWu90lp5SR1lWVzTCEbVSlAZnquFlESpuNf1xHAPWQzLSzGSGt3sNu9ZzM7peapzYJbPlO7aCDr0ZAwyfIrfYqoLdq+f+etxNWrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772395194; c=relaxed/simple;
	bh=I3Wvf4LFz28/nlytMSFiF0j6HXDVw/Ar6PWFhEZDuDU=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=OWrjmAJ3aBD0D+I0tF82lFmECx/mQ/7EbWMW/zgRcTkQSD0k4zABhWpXbu0SZdLKWJKuZ47+X4swYHZvb7Xba2nvcShGtTXMPy4lCbjQcp9yGHnrXBk/ttjg2LPyofnAFkkYSIbAMS3LhLhQfsfTbsiecyiRKk17lCkFBITTMkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Df4mLxns; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-d106b86.va3-iad.github.net [10.48.175.13])
	by smtp.github.com (Postfix) with ESMTPA id A01D24E0413
	for <linux-bluetooth@vger.kernel.org>; Sun,  1 Mar 2026 11:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772395192;
	bh=F3FjFF9dteX49J03ExbYBYwxZ1mBfjY/TGw/hAiXf4A=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Df4mLxnsz5m11+PhatFu3r/J23WSB0GGQA/31/GIeoNeqE339RUeXuDH7jAVBza5y
	 /h7Z9+Vrld5qV3uDnFfLe52Q6YC9I+d4n4QCNUa6CTuU2zv8MPm0tHoEskSdgPykwo
	 V3Low1gk/n3KBtjStJLDyNVf/QLmZ5NCRXGi+O+w=
Date: Sun, 01 Mar 2026 11:59:52 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1049133/b520ac-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19548-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DAF461D16CE
X-Rspamd-Action: no action

  Branch: refs/heads/1049133
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

