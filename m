Return-Path: <linux-bluetooth+bounces-18969-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIYGK+/LjGnJtAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18969-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 19:35:27 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D28E2126E24
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 19:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DF433017C1A
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 18:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3838F34575A;
	Wed, 11 Feb 2026 18:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="cA/32snj"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C572F2989B5
	for <linux-bluetooth@vger.kernel.org>; Wed, 11 Feb 2026 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770834922; cv=none; b=FWX7F5FTOTj6vLw/F6hhThhXQgM6O0YbYODd2Kuiak4SaHfB53QdV7Sa1H+aNmhgT0vKH1koq1q+A7XBUKd75tbI1TbewCBr/rLUkjAzr0otsqN5hbXeO2IEk8TiEbwA9PrnjfJXMDlFksw3f0MKzZf7qBFLwGnov1UAp+/4sTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770834922; c=relaxed/simple;
	bh=/4Eh9Pe2pJmaT/m+t00cVBvJbAlQ9qNDfHr11lw9eKM=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=AdixHdtK+Y9huI1EEgUmsoJI4gdF1LnGUS+gFVo0GypiMNabblf48ffZBC0xQ3CvakN+ZZPSlSx+9GGUmIZ1u68j4H1sbNIRiCqAO98Szd5/8EH6Ogh5uGN0LMStzgCd9+gcK7GN6ExJm6yjbKJRDUuhOU57kq1N7y7hoOmjVlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=cA/32snj; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-f1463e4.ac4-iad.github.net [10.52.172.30])
	by smtp.github.com (Postfix) with ESMTPA id 024E440132C
	for <linux-bluetooth@vger.kernel.org>; Wed, 11 Feb 2026 10:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770834921;
	bh=ls1q1CoWLmLLiOz/RgjWnqoHYvQpo1xjQlUzlTBZYAI=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=cA/32snj2akvTzzIyqQeWwAavhY/Wbs0ikoqdJUgbYQIEktZnjYl446BArMknSVqt
	 E6eadvWR79aGaa67+yKuIYA7idHhs3oCD6GladASZhWCPXNESafOfRVVdYQd02TOGA
	 KvWndvHkwVLg7V0zsc0AsS2DCFNC1VgHS4JRN5kc=
Date: Wed, 11 Feb 2026 10:35:20 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/f1eedd-30acac@github.com>
Subject: [bluez/bluez] 6b2a73: client: Add mgmt.exp-iso command
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18969-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: D28E2126E24
X-Rspamd-Action: no action

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 6b2a732b434fef055e90bb845106b35c09288ed7
      https://github.com/bluez/bluez/commit/6b2a732b434fef055e90bb845106b35c09288ed7
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-02-10 (Tue, 10 Feb 2026)

  Changed paths:
    M client/mgmt.c

  Log Message:
  -----------
  client: Add mgmt.exp-iso command

This adds mgmt.exp-iso command which can be used to toggle ISO socket
support:

@ MGMT Command: Set Experimental Feature (0x004a) plen 17
        UUID: BlueZ Experimental ISO Socket
        Action: Enabled (0x01)
@ MGMT Event: Command Complete (0x0001) plen 23
      Set Experimental Feature (0x004a) plen 20
        Status: Success (0x00)
        UUID: BlueZ Experimental ISO Socket
        Flags: 0x00000001
          Active
@ MGMT Event: Experimental Feature Changed (0x0027) plen 20
        UUID: BlueZ Experimental ISO Socket
        Flags: 0x00000001
          Active


  Commit: 30acac54935cc175649612633f685a4fbcdda5c6
      https://github.com/bluez/bluez/commit/30acac54935cc175649612633f685a4fbcdda5c6
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-02-10 (Tue, 10 Feb 2026)

  Changed paths:
    M doc/bluetoothctl-mgmt.rst

  Log Message:
  -----------
  bluetoothctl-mgmt: Add documentation to exp-iso command


Compare: https://github.com/bluez/bluez/compare/f1eedda9cefc...30acac54935c

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

