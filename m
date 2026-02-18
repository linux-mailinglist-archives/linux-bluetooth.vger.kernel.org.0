Return-Path: <linux-bluetooth+bounces-19142-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A+2MJd/lWkqSAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19142-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 10:00:07 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 680BB154624
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 10:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 914D5300C306
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 09:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B428260580;
	Wed, 18 Feb 2026 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="OWHEynjP"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25FA327C05
	for <linux-bluetooth@vger.kernel.org>; Wed, 18 Feb 2026 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771405203; cv=none; b=tDHsU0m4+bQAMnTw3h+PBLNeLOzk/MFTnPvb9eAMVwrOqRjFcnn5Z6rvamtYwLNQ0gkMIu32kju4fwoHI4P48wLNOIjlW9XH0I++QC+SG36nKrOhS23oAoMS080WzTG3Po593GbkkoZspreF3E33KyK2exv3SwDWKzboPRuapQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771405203; c=relaxed/simple;
	bh=wyIARcxkXnMeREtMtUkXE7DROFzdDNa/ktfzH4JC8Ng=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=gH+t8uO6v6+UmA38auTSJm4sH4/VpcDZF3D1Xo48IkPIBYGHLadGpJk0Z0sYZ8QVrpdW1UqNhm3yP/NoUaR07dAi57EvyivScdQqv8MFTQAmQZWHptXOAKK2+afUicrYTWqUCkqpoDrJ328SfWYHWloONqP4/75r6yXBN6LAHIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=OWHEynjP; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-a4ac5c6.ac4-iad.github.net [10.52.159.31])
	by smtp.github.com (Postfix) with ESMTPA id CB4EB401255
	for <linux-bluetooth@vger.kernel.org>; Wed, 18 Feb 2026 01:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771405201;
	bh=FOO38FZj2yW/YppXSbJ+39vpKFYdhhPqrCsRsgZJ83U=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=OWHEynjPEgpnGdx8UaGcfOadHMaD2B+VO+1RbDHSSt/W0GXYV07/SnwUrpnP8RwOG
	 YIit/GaKxhiZBG+DCdzMqcKkdYn9nCLzg83u+8HhSc3/oAfw9Wbv1PFaM8sG5gdgnx
	 9KvixH0uqHNQLnPsxSwJti0c71J5YDZD5EVtCAG4=
Date: Wed, 18 Feb 2026 01:00:01 -0800
From: fdanis-oss <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1055133/000000-3890e9@github.com>
Subject: [bluez/bluez] 3890e9: client/btpclient: Add GATT support to get
 Device name
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19142-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 680BB154624
X-Rspamd-Action: no action

  Branch: refs/heads/1055133
  Home:   https://github.com/bluez/bluez
  Commit: 3890e9a0db3654cd7b6df71b9ef83d58ebd1886f
      https://github.com/bluez/bluez/commit/3890e9a0db3654cd7b6df71b9ef83=
d58ebd1886f
  Author: Fr=C3=A9d=C3=A9ric Danis <frederic.danis@collabora.com>
  Date:   2026-02-18 (Wed, 18 Feb 2026)

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



To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

