Return-Path: <linux-bluetooth+bounces-19873-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFy5NNXxqmncYwEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19873-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Mar 2026 16:25:09 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8006A223BB7
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Mar 2026 16:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83F9D3028D62
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Mar 2026 15:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65483BA25C;
	Fri,  6 Mar 2026 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="RLRXCW+l"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-23.smtp.github.com (out-23.smtp.github.com [192.30.252.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57243BD622
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Mar 2026 15:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810687; cv=none; b=YcyxZPpfn1BIYuScsdb47EGdronOMvERTAnMrK67Orjsj7MzQblBJ9Alo6pNe5i7A8hWZMabngi3bKemrfkBfx6jQ1FtmVzxFxoXoDkejyU/m4ooRdW/MjHUPSMpBjqpij5PRy5xx12o8slg7PjnZR2YyWICPjIDY/RaFtSVvnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810687; c=relaxed/simple;
	bh=EC6YnHMmJvUijo5U65GNSvku6xgp27SaQ7AIHzhpSQ0=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=LqhuPQvB5+k4VGPn90yUQ4dHCAJv5G5gwogdCMTpmZqc0rsR0+V3f8RtVB+bz5xO9SfTtumVxyZRCCi3Pcnz2c24KlP1Covp4DUm8rhGBb6XzKR6qelYxIoGb9mH7/1UZhqmToJrPZJgxsbQdw1Dc+vYJHdiUorWPcDWX7mKH1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=RLRXCW+l; arc=none smtp.client-ip=192.30.252.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-67576cb.ac4-iad.github.net [10.52.13.75])
	by smtp.github.com (Postfix) with ESMTPA id AD60A301184
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Mar 2026 07:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772810679;
	bh=jrXKLbYTJ6oQpkLjDzA7q/FriYcn/0DpTfeJlHf2a90=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=RLRXCW+lzP/0Vi+lweF9nwh6qhMok7NWYKx5qn8/GNCzQuefiiJD7G2q6OffSBxIN
	 NaTEuJnAByCOaBkhBvOV5E61WpBnV7pUoOM8jpv43hMA4vsrCCkpMax3kfhvWNxlQd
	 Wia5yxixtV+JEUZEdzt3AO4Kqe/1aQUDEu0XaVuI=
Date: Fri, 06 Mar 2026 07:24:39 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1055133/3890e9-000000@github.com>
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
X-Rspamd-Queue-Id: 8006A223BB7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19873-lists,linux-bluetooth=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_SPAM(0.00)[0.169];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

  Branch: refs/heads/1055133
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

