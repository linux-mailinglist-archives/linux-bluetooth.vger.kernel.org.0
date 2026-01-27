Return-Path: <linux-bluetooth+bounces-18497-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGK9I8/1eGnYuAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18497-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:28:47 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E6898714
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C2F7306452A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 17:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B75A3009D2;
	Tue, 27 Jan 2026 17:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="iFUy4SOJ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB7D2EC09F
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 17:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534801; cv=none; b=F5HD+bpjBZfpQIxfjN4moyyMVF+jisYxPULSAtXWROmK1lKlRkPvcCxgPyoYG/mKjpwUUJboHUy1hzqWi9iFoujRT5hL+FV4Q34O3YEsmwo7uRgHsNX2afQ7epl8RveVrsxNK0RQhMKUUXlVq3xnX6J0aFldEs+oZkh/5RmbHs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534801; c=relaxed/simple;
	bh=OQjjkHv6d8nARJJS9YtRwBjpYJRJVV3CtFaJ/ohCqHI=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=ZpXZ0R7HD9GNaIzcinr/RG6EHpfPq5hiIV4o38tzGOFvT1KO2shLHiF5kGlNVLVnlJBUqFJ7hxvpTXPPKJYQ3iEF3qcNJ7dce1xSb5FaBoPo+C6o/gXkhJRgnfvAy+CgkXQxmZKSlawSyREbM3R9vk3IBLDkhYeNYzQP+BdhHW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=iFUy4SOJ; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-fb7c32e.ac4-iad.github.net [10.52.130.37])
	by smtp.github.com (Postfix) with ESMTPA id 5F87F6412C0
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 09:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769534790;
	bh=HhBasUXxHIHqXbTPCsqK2gv69lkXZBj8PtBny6VAgYw=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=iFUy4SOJIpLGSZh8r8OWEyu/YMx/wNfm7cmMTCTd15lB1Rm/33XsS/K7+lXDrjxiH
	 48B1G68+Jk/dmKCR64rKc/rfFS5zgiFQaLTaX5/sikla9HA46gJl09JX928vSKPBy9
	 worMn1MNDyCs15gI2serx7BK5iaw5gTSB4IoWNTs=
Date: Tue, 27 Jan 2026 09:26:30 -0800
From: fdanis-oss <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047698/000000-96c51c@github.com>
Subject: [bluez/bluez] 96c51c: doc/qualification: Add PICS and howto for the
 SDP ...
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-18497-lists,linux-bluetooth=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 24E6898714
X-Rspamd-Action: no action

  Branch: refs/heads/1047698
  Home:   https://github.com/bluez/bluez
  Commit: 96c51cbd710bb954492f59c5e298d3e3869c2964
      https://github.com/bluez/bluez/commit/96c51cbd710bb954492f59c5e298d=
3e3869c2964
  Author: Fr=C3=A9d=C3=A9ric Danis <frederic.danis@collabora.com>
  Date:   2026-01-27 (Tue, 27 Jan 2026)

  Changed paths:
    A doc/qualification/sdp-pics.rst
    A doc/qualification/sdp-pts.rst

  Log Message:
  -----------
  doc/qualification: Add PICS and howto for the SDP qualification



To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

