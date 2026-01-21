Return-Path: <linux-bluetooth+bounces-18294-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NXgGESccGlyYgAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18294-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 10:28:36 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E05054608
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 10:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D36B85C083C
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 09:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A813803D1;
	Wed, 21 Jan 2026 09:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="SNyE5L5M"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BD844B697
	for <linux-bluetooth@vger.kernel.org>; Wed, 21 Jan 2026 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768987152; cv=none; b=k3yJ3+1anGj6yZo2zlbMydagWXoPGAVgLP32insA0BudHS4rfYs0nqPR0o2uH1txnCT9vMroTAdsfcZ+2MQ6NEvBdlVyJoYejp0gOoYDfBeKb0YY1wBC43xu0IbbKMFSbD2lDP8l18pxUj7qR+cElEasP1JK+3hNCknjpvUli78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768987152; c=relaxed/simple;
	bh=TXFObLnArJGGZEAdPl6JyFDSkDTS6WV15q+1rcoiLrE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=B3A7oDpTL/D6tqs91CcYYldYM2dR0Tijh/yrai/2aMDafKzSLAmBCRSWYofCft5jBkOupnCaR2x0x7zLQPmv19kcTsSTGKt1nn5RPi8pmg0UML5e+HsvLjXXar5MsSTzqmoiaukHMC8qaTu4K7IniDddDnqP4SxPT7x54p26pUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=SNyE5L5M; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-c1cb629.va3-iad.github.net [10.48.204.56])
	by smtp.github.com (Postfix) with ESMTPA id DEB253C11DD
	for <linux-bluetooth@vger.kernel.org>; Wed, 21 Jan 2026 01:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1768987149;
	bh=RbS8oJTGR9smzGqsPpMb2A10fnqxGml07lvqLxSBvi0=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=SNyE5L5M8JWMbp8gB88ykSKKq2FhUmXTKGfpHl0l5jqelYqv/A5gEEx9BC48qNK1d
	 +EW7IQEUg9cLm5AoWelpjs9e/hrimd9//putgaijvmYXgvV5pfQfT3mh0nN4XGHJFD
	 8t+1IzxzlCnc3FynDONRyWFk5oB1HsjalqzQeIVM=
Date: Wed, 21 Jan 2026 01:19:09 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1038430/192876-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-18294-lists,linux-bluetooth=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 1E05054608
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  Branch: refs/heads/1038430
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

