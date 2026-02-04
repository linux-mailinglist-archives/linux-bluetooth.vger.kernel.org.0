Return-Path: <linux-bluetooth+bounces-18827-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAeXKkfBg2k6uAMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18827-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 22:59:35 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7DBECE75
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 22:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98F28300E385
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Feb 2026 21:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D623939D3;
	Wed,  4 Feb 2026 21:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="i4b2iPvS"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FFE3242B0
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Feb 2026 21:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770242371; cv=none; b=YDkw0oytvpQT9B+nXArZW0UBLHNl5dPXeoxmTN4fVZt9JHlD+X2vLVTerqKsQdqiw1hMDg7f9elKVd3DcvSRmqRRx9qCZe1egUTEP6jOuW8kdYQqe0IOpVsQ6O1fEADyKCwgXgBBtQSpwdbxxQ2l7Ceyr1IkuAstVBGzomGY77Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770242371; c=relaxed/simple;
	bh=Bxxq0+6n1gPsmm8xIjKsh6DZtWjZ8l8L+a5JjN7rMcI=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=nmYSvpCglk7OmmzSItm2LRf+a8po46hxzVcGsl/7QL1b8wYY+o4FUin0C9qc31vrezDv+M3yGLs8yeO9L7vB1WDpkCN88hJiUcyBnQP0KLMwH5TBPZTuQhyVIjdkRV9pZnTwCmIpdZNRwfHxayFU0F1nl9MxvPDRNbrUK9E35n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=i4b2iPvS; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-b9d68ec.va3-iad.github.net [10.48.15.48])
	by smtp.github.com (Postfix) with ESMTPA id BFF0C4E118E
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Feb 2026 13:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770242370;
	bh=ipnp35gWA7r0i6aTSERsTelDxJMjbGPmlgSE9OUWFms=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=i4b2iPvSX3dsBVHvDNmwYdalaJtFKtT52mf6daIeCcCbTk7vuMI5F7oZhuedoRAn+
	 kf7yvx3II3gLUEBWWSBrY4J6lGAbs3XNOsHOvcNQrFyEWdeZ1FTMnVM9v/qyZ9eY5Y
	 A/vQHdtqdBMHDkVBwcTBIoaAq+QVFrBcKKAxPafo=
Date: Wed, 04 Feb 2026 13:59:30 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/9b54cf-fc2037@github.com>
Subject: [bluez/bluez] fc2037: monitor/l2cap: Add missing result for
 BT_L2CAP_PDU...
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[github.com:-];
	TAGGED_FROM(0.00)[bounces-18827-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	HAS_WP_URI(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bluetooth.com:url]
X-Rspamd-Queue-Id: 0F7DBECE75
X-Rspamd-Action: no action

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: fc20373d03c4a9a07afa2036abb6f15583699fcc
      https://github.com/bluez/bluez/commit/fc20373d03c4a9a07afa2036abb6f15583699fcc
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-02-04 (Wed, 04 Feb 2026)

  Changed paths:
    M monitor/l2cap.c

  Log Message:
  -----------
  monitor/l2cap: Add missing result for BT_L2CAP_PDU_ECRED_RECONF_RSP

Last 2 BT_L2CAP_PDU_ECRED_RECONF_RSP result opcodes were missing
accourding to Bluetooth Core 6.2 spec:

https://www.bluetooth.com/wp-content/uploads/Files/Specification/HTML/Core-62/out/en/host/logical-link-control-and-adaptation-protocol-specification.html#UUID-02ef4c03-7278-7ad6-bbf2-ee2f0e921fed



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

