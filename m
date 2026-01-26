Return-Path: <linux-bluetooth+bounces-18426-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PVYBJvod2mwmQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18426-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 23:20:11 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DC78DE81
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 23:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 403B1303F7DD
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 22:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFE12FF144;
	Mon, 26 Jan 2026 22:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="bId8+ERp"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F22305976
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 22:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769465990; cv=none; b=EFikyTtRhsVJCLXfkF24v3Pg1YG+GPBY7Lm9BkJZqAMYTEZl2hEYJVoEsjl1rXul5r6+90IS9fzoar6v7LcQrQ5PCtBZpiDU27Tbace7GmM1qZ8e211P8NXu4sARnKtkcad3OYtOM+FV0r8smIcqkQt/b4u6vsTsuhjl0xtdCVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769465990; c=relaxed/simple;
	bh=U51NIzkfPswByj0Q0CodDa6cxENsfQf8ZfuBKy/JtU4=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=k+jIgaZYeUF4cplkR9THAb0WmDW2gWsSgdEUCeWHHZvRo9z12A5FbOKoCvyy95f4yUaMYcyL0VCLYNWHAt/IuzIdh7wMjmX4SRdOp7L6pt0FwTtwVXfi/qFPGcMfBOSn0AiC3JE/siybq/T1F9OIbPFg1h3ypcvUE4rBWPUijoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=bId8+ERp; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-5e24f68.va3-iad.github.net [10.48.209.64])
	by smtp.github.com (Postfix) with ESMTPA id 8F89D3C014C
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 14:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769465988;
	bh=/c8BbkvODtTZF8u8IIW9Uc8E3euSYLCWIgKpJ1mTdhM=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=bId8+ERpKubm6AtiLygrSTzAeG0KjEQfcgEkdVFCNFtim71RT7P9KwEM/a/L+o5rZ
	 Zbp6SoILnfN1AujyNrhZ//a7w/A1wxA9rwBqavAezMCHVSdbQiOk623s/JlrUT8Ezu
	 GtyyVJ/ztu6mBKNZOf4upM7dljwqClxLiSRPOM4I=
Date: Mon, 26 Jan 2026 14:19:48 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1046202/ded731-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18426-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C7DC78DE81
X-Rspamd-Action: no action

  Branch: refs/heads/1046202
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

