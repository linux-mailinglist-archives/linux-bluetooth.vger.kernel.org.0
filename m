Return-Path: <linux-bluetooth+bounces-18643-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIQwAsdie2l2EQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18643-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 14:38:15 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BF5B0776
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 14:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F414730387CB
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 13:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE3F288517;
	Thu, 29 Jan 2026 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="L7yHeAOW"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-22.smtp.github.com (out-22.smtp.github.com [192.30.252.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFA32032D
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 13:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693749; cv=none; b=afUg5Nj/xxXZxPTmaRgG7VlbuKrSqGjmTO2KUchDLZT8aCYukyA1PEDJiDA+vsTA2aEA+XewUngIW5Th7xlegKAIDXxzOuL9NijNiAepbz1GuMomr80N9yFeoMTVHXXx3QRQa7OutUekdUfsgaeA/AbKV4CMWYNttdRL8CoYpyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693749; c=relaxed/simple;
	bh=OmBqPW56BFadpjqxMUqLZWTANKs1BjiR/ZdTmGGJVOE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=MY3peVIxpIOCmxdul3LE9xQ6AwbSxVx0GzlQSQ8qXUlwLsn8PvRff5usTkSMwGZ4T+sIWGJ+fKxCyr7/rZOeWOuWFILmfWlUjxmZHzZiBt4NnDoTINMeNL/cr0iA62TlqgtOtHexQLqO0F1fhLG6aX2F4gpc3YGf0SvKhZfYHt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=L7yHeAOW; arc=none smtp.client-ip=192.30.252.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-2fbd351.ac4-iad.github.net [10.52.180.40])
	by smtp.github.com (Postfix) with ESMTPA id CDFBA213EC
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 05:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769693747;
	bh=Lsh4o2YYsbV6Evil6pdve9x02ho4CZ84zag7P5Nf9q8=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=L7yHeAOW4r+xEYcJ0qtXJP2mZHk+E97f7Hkeq14MPj791Wn7b0ae9zo+lkGrrSUhL
	 TLjp3PgKCd06IPCzWFLL/l7jXYc3xZYCsTkk/tAQEsNeW0WvO99ddxE8YlFs0bG3OX
	 GLyosMq4SlfFJGIRNj7P5/gtPfbYykMNtPcruC6w=
Date: Thu, 29 Jan 2026 05:35:47 -0800
From: hadess <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1048529/000000-a78f42@github.com>
Subject: [bluez/bluez] a78f42: build: Don't install btmgmt man page as tool
 isn't
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18643-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hadess.net:email]
X-Rspamd-Queue-Id: 72BF5B0776
X-Rspamd-Action: no action

  Branch: refs/heads/1048529
  Home:   https://github.com/bluez/bluez
  Commit: a78f425dbae965efa2ffc1144b7372815d476f3c
      https://github.com/bluez/bluez/commit/a78f425dbae965efa2ffc1144b7372815d476f3c
  Author: Bastien Nocera <hadess@hadess.net>
  Date:   2026-01-29 (Thu, 29 Jan 2026)

  Changed paths:
    M Makefile.tools

  Log Message:
  -----------
  build: Don't install btmgmt man page as tool isn't

The btmgmt tool isn't installed through the Makefiles, so the
man page shouldn't be installed either.



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

