Return-Path: <linux-bluetooth+bounces-19871-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PmH0AvfxqmkJZAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19871-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Mar 2026 16:25:43 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EA4223BF3
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Mar 2026 16:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C9783028C2F
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Mar 2026 15:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A096F35AC23;
	Fri,  6 Mar 2026 15:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="aDaa+LRC"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-4.smtp.github.com (out-4.smtp.github.com [192.30.252.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AE7371074
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Mar 2026 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810635; cv=none; b=FVqF88GvCW/3g5Kv8c3lrMSoZmnEb+ZHzrZaxu3xqFTMeLCS0OEyjmUCn4VriEjqashPTZAmIdyuSD51zOpC0kVn5kjtZi+yHu2eYrXubP68WKwtQjNnlekgoWWmSiGsXcoD9seA6ePmg2gGW1RDuMO8rQv8iT3Jgu3U51XkCtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810635; c=relaxed/simple;
	bh=1Nn4qd3jXFdNko28N/xNVGijz2qDC7ToAxrIPNaK26c=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=r553+YbVpzrX/4EGDTmufGcZ78aJEKrBnDblOeR5pfRTzKoCO1g0A0B/kZPNpDKSdmOwdKsRAYeeSJaYSULjZojZMmA1N4B1e8BL5Kig2NXHPixCzgGP3edLNyh4o3eYID9qKtgIBIgSFJz9XCzh2kEgJuO4cEJSJWh9MaIHWDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=aDaa+LRC; arc=none smtp.client-ip=192.30.252.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-8bdb021.va3-iad.github.net [10.48.143.39])
	by smtp.github.com (Postfix) with ESMTPA id DBB102C114C
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Mar 2026 07:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772810631;
	bh=P1fXVWP4iPHhXobGp89eWToM+5KUaZ6hNrnpc67XB+A=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=aDaa+LRCexP5SLyyngGdZSf700YhH16OzfIPfFJbCkiNZ+M3CTELIINqdMuhiKCWP
	 hgP7SetD4NeGQjt9y1gFvQrs0vY61HoqHIKEKbX1v/qf1OFpuFikLGkeb8A2tEHy3W
	 TaS1GKHCezw7KpviR/KuTJaagjkgH08bRqNQtnyI=
Date: Fri, 06 Mar 2026 07:23:50 -0800
From: fdanis-oss <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/b138a0-8d82d3@github.com>
Subject: [bluez/bluez] f35561: monitor: Fix -a/--analyze printing wrong
 connectio...
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
X-Rspamd-Queue-Id: 65EA4223BF3
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
	TAGGED_FROM(0.00)[bounces-19871-lists,linux-bluetooth=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_SPAM(0.00)[0.103];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,collabora.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: f355617ee0e6e3fe56068020a2d775a0f824f7ff
      https://github.com/bluez/bluez/commit/f355617ee0e6e3fe56068020a2d77=
5a0f824f7ff
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-03-04 (Wed, 04 Mar 2026)

  Changed paths:
    M monitor/analyze.c

  Log Message:
  -----------
  monitor: Fix -a/--analyze printing wrong connection type


  Commit: 8d82d3e1e53909e22ebcc63158a05d35eb5d3083
      https://github.com/bluez/bluez/commit/8d82d3e1e53909e22ebcc63158a05=
d35eb5d3083
  Author: Fr=C3=A9d=C3=A9ric Danis <frederic.danis@collabora.com>
  Date:   2026-03-06 (Fri, 06 Mar 2026)

  Changed paths:
    M Makefile.tools
    M client/btpclient/btpclient.c
    M client/btpclient/btpclient.h
    M client/btpclient/core.c
    M client/btpclient/gap.c
    A client/btpclient/gatt.c
    A client/btpclient/gatt.h
    M src/shared/btp.h

  Log Message:
  -----------
  client/btpclient: Add GATT support to get Device name

Add GATT support to btpclient so the it can read the "Device Name"
characteristic (UUID 0x2A00) from the DBus interface resolved during
device connection.

The device connected event is postponed until ServicesResolved property
is set to true to ensure that the services, characteristics and
descriptors lists has been fully populated.

This allows to pass GAP/IDLE/NAMP/BV-01-C.


Compare: https://github.com/bluez/bluez/compare/b138a0849ba2...8d82d3e1e5=
39

To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

