Return-Path: <linux-bluetooth+bounces-19816-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QANELTp3qGkLuwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19816-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Mar 2026 19:17:30 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 586B0206227
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Mar 2026 19:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C66C330781A8
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Mar 2026 18:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12963D1CD5;
	Wed,  4 Mar 2026 18:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="ZFARtVNv"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4378E37EFEA
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Mar 2026 18:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772647640; cv=none; b=WHvJj7i5/DcFr8E+22NhmB/VI2U6C6DiwyAYfhppB98Hco1R1v7shVT729/G0LTaS3RsPCNbR+i9dF0po6bNfXsBRzBu714JZ5ia+qoH76PXoE6PA3wqDV7ljPZxF+qebbY4IiFg0LWXCwKvBuEQqgDsMAhh3UbTC3YbXwdHgX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772647640; c=relaxed/simple;
	bh=7dkjVZRyhVRdVgvf8RJrqkuBxHSYQab7WUSxe1EUFs8=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=qfOAytx5GWEbzBLjwRtcCkuSFoXhojFYFOCSMwHhcDAEtZBwkJKnv1MU5YZWi4v6aVIPwer6ryxVCfOaws82wDXkTlqdJE1yg94HRsQ5XMSax/WVhQ2Yap4CwLCTrDpGE/Kekai6wuKh0Zig29eQouZPTMut6wRGX/gphjVjUAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=ZFARtVNv; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-413f1f7.va3-iad.github.net [10.48.155.12])
	by smtp.github.com (Postfix) with ESMTPA id 77B714E12FF
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Mar 2026 10:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772647638;
	bh=pkxHO9i2lv49I2pljI3DKunCIdPN+LXMvjpVZUxHFA4=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=ZFARtVNvpkNphOTMpxBb2rZxBmOM7R9Ca4VwcK/dkdlXvheiuZyDpQThxVeQR3lgS
	 fupdLeu1mJHTbDBF6kjRNCAsRGSoO/iLdAxjjRKAzomCfoK1w75dpiQ51RzvrDE7Cz
	 XAPaZVF3wAqobnhtqUlMtz+4F6ycmkNcyTbF/TaQ=
Date: Wed, 04 Mar 2026 10:07:18 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1061476/000000-f1c313@github.com>
Subject: [bluez/bluez] f1c313: l2test: Attempt to update BT_SNDMTU/omtu when
 usin...
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
X-Rspamd-Queue-Id: 586B0206227
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19816-lists,linux-bluetooth=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_SPAM(0.00)[0.970];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

  Branch: refs/heads/1061476
  Home:   https://github.com/bluez/bluez
  Commit: f1c313e4bb8d1bef9f6147cb8ae1b33777da7d52
      https://github.com/bluez/bluez/commit/f1c313e4bb8d1bef9f6147cb8ae1b33777da7d52
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-03-04 (Wed, 04 Mar 2026)

  Changed paths:
    M tools/l2test.c

  Log Message:
  -----------
  l2test: Attempt to update BT_SNDMTU/omtu when using -D

This attempts to update the omtu using getsockopt(BT_SNDMTU) since it
can be updated after the initial connection and there are tests such
L2CAP/ECFC/BV-23-C that attempts to check that the updated MTU is used.

Fixes: https://github.com/bluez/bluez/issues/1941



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

