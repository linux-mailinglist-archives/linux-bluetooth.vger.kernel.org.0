Return-Path: <linux-bluetooth+bounces-18529-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLvdOln+eGmOuQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18529-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:05:13 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E5398C2F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96A5030A99E3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEC232471E;
	Tue, 27 Jan 2026 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="mvDCEL10"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-18.smtp.github.com (out-18.smtp.github.com [192.30.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CC42D47E1
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769536945; cv=none; b=f92pejmx9bZMDp/bmzJCpiAif3POoMg51krs62bOo67o9SJYg/ewDVXFi2fZ/huZEhtQ5Xuf1k68sepOWEipr4MB/rPNdsXXM1iyVzfYWyx6Az3iAVcv+i97dKOIIqfnpv0avSdYAx7wEvZbb5r3mOHYgAkJK9xSaVuoMuLTLKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769536945; c=relaxed/simple;
	bh=KYVZJ4bbHHpDk4UoxxRiyhoQC5MdyeAjipp0LJA27wk=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=aODAyix8NTm3QpJVtRdVJNEG/9Hh21hUv7ejlQ+zLk0owMk8QQJlvNpTxP5Ziioo8eJ/vVKhPK9f0i/Qh9iTUMuZ7JL/Uo+9S5pbWDZ3klfau/xxPH70MdBaLNUpNV7nWI4OuVIUzGo7+9M5Lce8O+J14O0bMHoMRmr+6u6jBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=mvDCEL10; arc=none smtp.client-ip=192.30.252.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-86518d7.va3-iad.github.net [10.48.149.56])
	by smtp.github.com (Postfix) with ESMTPA id 2FADCE1464
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 10:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769536943;
	bh=ktlMyUjHndOWKHiOs7X4OhBkgdkwTmrsu6/4IjOR23w=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=mvDCEL10vsRpAvwXBpHsvj5YWcQs7Z2XcjyqKTBzVnu2dogekmVfmL93Y5V7F0tka
	 7ksFlfOcBo7E0inneXxS02qei7tmI31/v7ShopRV6I6e1WANoSS3jV7liHjmAvdsXO
	 5PZT4yBmoMbXdg9dXjwC7KWb8bPotwoJ0L11IrJg=
Date: Tue, 27 Jan 2026 10:02:23 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1046215/cd6e34-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-18529-lists,linux-bluetooth=lfdr.de];
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
X-Rspamd-Queue-Id: C5E5398C2F
X-Rspamd-Action: no action

  Branch: refs/heads/1046215
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

