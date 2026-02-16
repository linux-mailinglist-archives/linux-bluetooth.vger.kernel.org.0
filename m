Return-Path: <linux-bluetooth+bounces-19088-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id p+JxBIB2k2lH5gEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19088-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Feb 2026 20:56:48 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7BE14759D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Feb 2026 20:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8446330054C2
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Feb 2026 19:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253DE2E7F11;
	Mon, 16 Feb 2026 19:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="C4LLkdJk"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B472D59FA
	for <linux-bluetooth@vger.kernel.org>; Mon, 16 Feb 2026 19:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771271802; cv=none; b=rQzpYQlIrb2iHuUL6BAIQPEYo0QUTfwznTIS1YkqY5t52HbkHTOYA+hSh95BVueRWXb0fDfLza0wVJ59XrenShSrY883EDhER0Rw/RvhIEqHGFzL0iDvrD7q5eJkp1ULnAuWT7eA/undql2tS14DHXgTND1PFA2kE7CWRYEFXAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771271802; c=relaxed/simple;
	bh=riI9R1Qc45kerpVmG1M5WsfP3j0DOz+wUMPE7BObE2o=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=jeg96pzwnZk6NGcBHM0MBJLXGf5MB3Z2ZZj6kK0zwKA7v052Z/U0DjLrL676OU7VE0o2hXEO4cf20GAOCm6PA/5Dm86fd+62mJ1FPfI7GPG1+Ggh5wUtabcLyGll+Lic7OBQ/cLBLR+38yoRuZxc9ksHcMB+EX73oT1AdLGw5HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=C4LLkdJk; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-fb76070.va3-iad.github.net [10.48.168.35])
	by smtp.github.com (Postfix) with ESMTPA id 0F2944E096E
	for <linux-bluetooth@vger.kernel.org>; Mon, 16 Feb 2026 11:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771271801;
	bh=t3R4HoIOiXnVOibgEWNcHHkvCU8GVYAIz6cc1bPdvXU=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=C4LLkdJk3ddYtlWAuYqZsvcPIHkp4fgqntst70ra+5Chg9wJ94zV7q6pJAKCfvwv3
	 tUY4QU1ftqzGcsOG1lCW8wlWE2X8g8oMou4sRgp+Fu5IVtetsvoEHTN2B5Qh6SIIxj
	 Ck6toeC+pcZHY+TSYHjDE+lYjLrO9ZjII53sLzDo=
Date: Mon, 16 Feb 2026 11:56:41 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1054634/50e9d2-000000@github.com>
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
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-19088-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[github.com:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8F7BE14759D
X-Rspamd-Action: no action

  Branch: refs/heads/1054634
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

