Return-Path: <linux-bluetooth+bounces-18330-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ1WGmpCcmnpfAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18330-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 16:29:46 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E18C68D6B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 16:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C583E52CB1F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 13:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245CF3271E8;
	Thu, 22 Jan 2026 13:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="W52uvJjf"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383572DB797
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769090210; cv=none; b=dhYG/oUHp3oaPj81eRtzDXVmQJdHKqydXlKW5wqEXgkAjqIkfvaRl15Y0bSNaDR1XMjUwoEeXFh6PEcqAf4s7caWGjE6PE9OdMnKajfVi8/HBwWQg4hXVL1ZEm2yT7FZPHLOJZ2sR/sWP3Rhzcii+ESaKeC5yKey22js/zpOU50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769090210; c=relaxed/simple;
	bh=jc4CouFNBivQHcYFWEZbgdLZG0uBFaGCRm7SIaBnxSo=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=cP47rtcayJSTX3K1vj5YAc6LPxAtqvnbshrfg9w/DyN1YV2WVsyFi9Yvt7Zf2EBhMIGseCPc+bjEXdz0mgQFZ/lTLViyU0GPbpVRGFWHYh5tr1DmllVLqoO/FNWnXh+NqeY0C4JB+Yf/9Fljw3DFEyQmgfzXDudSZW/BpYzHzL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=W52uvJjf; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-1ba4af3.va3-iad.github.net [10.48.135.33])
	by smtp.github.com (Postfix) with ESMTPA id 545FD4E02CD
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 05:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769090208;
	bh=I6ZM3sPxH9dBWXvDuPkTcjHRwVNodxm5G1ONkT6WNu4=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=W52uvJjf0oe1VrnzFWdPdBM6GXzXc4hZkQmfiMygavFQjJT5O7wwy0u1Yelm0qEIg
	 N3i+69kmXCIa7agMX7HtnaDmUuk/ZRJIpVUkxtNGWBi0JLdXIPpjacgqZyfpUKUU3g
	 uBhbqpuYYnv1uzwfjXkhxrNsqrE5S1LsGsH8EuBU=
Date: Thu, 22 Jan 2026 05:56:48 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1036073/c84809-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-18330-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 4E18C68D6B
X-Rspamd-Action: no action

  Branch: refs/heads/1036073
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

