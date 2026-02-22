Return-Path: <linux-bluetooth+bounces-19269-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAAcKX7vmmmtngMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19269-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sun, 22 Feb 2026 12:58:54 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4012616EFFD
	for <lists+linux-bluetooth@lfdr.de>; Sun, 22 Feb 2026 12:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27A27300C0CA
	for <lists+linux-bluetooth@lfdr.de>; Sun, 22 Feb 2026 11:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85072255F52;
	Sun, 22 Feb 2026 11:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="U5oFXTgn"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2672B2BD11
	for <linux-bluetooth@vger.kernel.org>; Sun, 22 Feb 2026 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771761531; cv=none; b=Ctf1EnSTmkVOjrgnOwatf4wZtowGh3/9lZqem4JS43FeTtW1OSrH0tIaAkAg+WDA121L6pS1m30Yq7RqoV166o1CZasnOBo4+hjZhMEF14dh46/ub5CQKH4Aw4YGWWQ3UGq6HnSuFtisiHZFS30lMqXcEiODHLrbHdjyJGLsIHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771761531; c=relaxed/simple;
	bh=0rAEMLiHCFlGBJQA/li6at+vH0it5N/2opStN4OG1MM=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=jiJw+re12HeDIj5N1J3WMAlItM725tfKqE/f34HmRQ9aQCOEBfCNcfuTsG6DJAPFPVjdY3syIMVESASewH6Xu8FnHCg57nIAARGr5m6ob6X0LH9ZK/BEMl3fGJn2T2NYaJIM80GE2VkGGSyL7sbJMDpqUhNwYIeNa3KDt3sEiIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=U5oFXTgn; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-e87e602.va3-iad.github.net [10.48.136.31])
	by smtp.github.com (Postfix) with ESMTPA id 430243C10B5
	for <linux-bluetooth@vger.kernel.org>; Sun, 22 Feb 2026 03:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771761529;
	bh=npU7HX/21Y6jcy68UqLwCRy/Xm1crMRgjtdKy21OuNA=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=U5oFXTgnmFu6CN6r57NKLEg01qIXeuM5cbsBVey1OHeNWcfN7TQu7dQAp1N2nYwZs
	 RlTBCBb1wCY8FgBMHjStFJ07sQ+A+S5VzQrbtJnQI24EDx0/VFu9XPDPDGU1vSoKRx
	 zxJurjE3I4fsW4Rg4weVhihANPx7JLj2KmOf6Tsc=
Date: Sun, 22 Feb 2026 03:58:49 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1046230/1a4f0e-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19269-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4012616EFFD
X-Rspamd-Action: no action

  Branch: refs/heads/1046230
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

