Return-Path: <linux-bluetooth+bounces-18265-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PNPDwzpb2lhUQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18265-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 21:43:56 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8964B8B5
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 21:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 27A046AE026
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 18:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1225444CF43;
	Tue, 20 Jan 2026 18:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="R3FO5cbq"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-18.smtp.github.com (out-18.smtp.github.com [192.30.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2BE44CAE6
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932082; cv=none; b=TAadXhScunawrviF1WUwtMfAuoBzF6eaaEZ3Ae8rr1XS7MvSqW6w5L1SMb+/hdKLP7r8w+g/X3l1/6F8hTKgRvIsz2Nm4paU4t9lG44oPNUKLWiyRI8zVH4Ql7O1IGuoDYRoeCr1NbyUrdnYsgPDQ5Hb36wFURHjQUzc8nQod3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932082; c=relaxed/simple;
	bh=c0RBbrBU26bB89Lh9CYMGKGE1+2qoQqQXjbtG9L8ROs=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=qqkc7t5Ob//pSEfTz99RW+GJ5ylOx/gBQMrEQB3Uq0pbwFM5XCl5u6AkNnkCNvXeoBhdlBIRZ6tRrAXnds1oaGVSQIBGXoAueR/VpEVmj7JRGzpxLIo3WHpQ+S6SJDKJTBLAyTwtRqzc4RLJfX/YvhqDQ3VtRhEuFgsJ8RjQXZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=R3FO5cbq; arc=none smtp.client-ip=192.30.252.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-31b3d7a.va3-iad.github.net [10.48.178.39])
	by smtp.github.com (Postfix) with ESMTPA id 5FFA4E031D
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 10:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1768932080;
	bh=aFtSitaw4OH8IPWhldTZJ0UHN4wDR+Smy1DkyHgYgwM=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=R3FO5cbqpw+HDmLkcYob+nndav7UQaskBhCSFOgKpkMM+IN0eJuXPUAdMsK87toPK
	 jP3j+d66ZfeWJPkJLpZkDBz9pc7hx/vDk5/FhLwn6g2cd/zDLL/IjryJwSkjs9dOzS
	 A0uv8nwVKS4WibCaoJoGR8Wh/HHEvgs5JZB5SEwQ=
Date: Tue, 20 Jan 2026 10:01:20 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1044766/f2670a-000000@github.com>
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
X-Spamd-Result: default: False [2.24 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : No valid SPF,reject];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18265-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: BE8964B8B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  Branch: refs/heads/1044766
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

