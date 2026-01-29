Return-Path: <linux-bluetooth+bounces-18645-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG0hMNVie2l2EQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18645-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 14:38:29 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABC9B0784
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 14:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADDA4303B4C8
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 13:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12DA4288517;
	Thu, 29 Jan 2026 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="QJyH4H29"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7418F246BC5
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693754; cv=none; b=g3xXM8GthckvcN/w5eDsVEr53CGeL32Nqsk6TD0dGCM8nbkwllcLBE8AcKWUVjmcHpSFZsaTwQnpTkldAsJvac9BC5+lUtJH2Hz/dLSZtb0ym9rWQ7lH9kGywFHFsVejkMsh+QLNPByRbsOBFwkxmOonjYsXd897FJ1ML3Qzc+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693754; c=relaxed/simple;
	bh=kMaEZ2ZDNEcZNrsq3eqcKHGnf4+bDZIRRLiF8qmAPGE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=SFlR7YoGc9J6DQVG62uuudahLLF04XJrGmEjRIVGCniZyyPtgAssnwVDolfXC89OH4x408oX3kSNgV3W2VjIQjjmqLFGDjNWI1+p+Vf4Y0Z6rhfXo5PT2LaB1zJKotbqYChjTXVymonmCu3lHTfRMyX2+amLy4Y6Ddb5Bw/2WpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=QJyH4H29; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-e4e395f.va3-iad.github.net [10.48.221.74])
	by smtp.github.com (Postfix) with ESMTPA id 839883C0037
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 05:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769693752;
	bh=EgZvUem56H5eFdOCY8cqd6Hlv6sVzEfwrtNRXczhLjI=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=QJyH4H2994rsnEXWKG/SgwdGuia5KISjzx0QEiqQ3P/Dchqdsc+/VKNmez8ktNPD6
	 JnOOqkRyIZmNdIf7gL1uMBC1LzCbqjNX5TkbS0AZCgg+SLESPqwZAYDyKcV+BA/5YA
	 sLr/hWdB+SgVQqsDBaej+2HAPIf144nIqpg788Uc=
Date: Thu, 29 Jan 2026 05:35:52 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1045561/740595-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18645-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7ABC9B0784
X-Rspamd-Action: no action

  Branch: refs/heads/1045561
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

