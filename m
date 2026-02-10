Return-Path: <linux-bluetooth+bounces-18934-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMyDI2+di2k3XAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18934-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 22:04:47 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0E11F3FC
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 22:04:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D5BD3000E3C
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 21:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E6B3358A3;
	Tue, 10 Feb 2026 21:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="EfE5jNaW"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7F6329E50
	for <linux-bluetooth@vger.kernel.org>; Tue, 10 Feb 2026 21:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770757483; cv=none; b=WkSBmH9ixslYVDUF63C4lu5DjEj59XsPLpHZq/C6NsCg/Si5zKhSaJ5qnqY0ufIrI4zxWxhbIbKOw4X9w1M4wA6gQ+mSF8IcaR+Luk1l1IgG2nlm0nlCnrJiYgQ8jomOnCRpoBC+xrogtcUKyW6n/yzfhFwkBD8Cdt1/JHaHYqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770757483; c=relaxed/simple;
	bh=a4zvwn1iONk65rsMUtaP/fp3l3c9Km99ZEYZfOOzZH0=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=sEcHELH51dDkNUgFyQXb9v45ii4Swev+cNC6z1B4PAzP67dUQSSu2ukJ3isbYR4XTh3ayJLjiRAs9+A7VCcWS+9RL59Ey1jJoeHH9YRjWM0OzrGwFhifHC/YwRes8sZrPIXmR6U8mvwg0gODsOj9vnIgFCDl5gUCyPUUtHsR9Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=EfE5jNaW; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-2d2dc45.ash1-iad.github.net [10.56.207.82])
	by smtp.github.com (Postfix) with ESMTPA id 5FC3992094B
	for <linux-bluetooth@vger.kernel.org>; Tue, 10 Feb 2026 13:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770757481;
	bh=mTEGc+iBRq1o808ZdCYHoxlMec7tz5T74A+FtwMuBBI=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=EfE5jNaW9Yw5QBsi3luCGF9GLVEpBYC4FmMFH2+anS19a5Y44DTXT8ue77y9eziex
	 8FjCGS77dNHUL8R++XIuSpcedkwdiCQSJ1v4pTl7JLl3gVP4zzCYrpvq6MwS2o7cwV
	 /zN9lprSA2nZPyspRwUjBf2QqDVM/AFfqjnlJXLE=
Date: Tue, 10 Feb 2026 13:04:41 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1052893/000000-83b74b@github.com>
Subject: [bluez/bluez] ad1fc2: client: Add mgmt.exp-iso command
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18934-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 04E0E11F3FC
X-Rspamd-Action: no action

  Branch: refs/heads/1052893
  Home:   https://github.com/bluez/bluez
  Commit: ad1fc2fce967bd8228545331070bd45f904dd742
      https://github.com/bluez/bluez/commit/ad1fc2fce967bd8228545331070bd45f904dd742
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


  Commit: 83b74bbb673c496f60d350226338e21c07a7e863
      https://github.com/bluez/bluez/commit/83b74bbb673c496f60d350226338e21c07a7e863
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-02-10 (Tue, 10 Feb 2026)

  Changed paths:
    M doc/bluetoothctl-mgmt.rst

  Log Message:
  -----------
  bluetoothctl-mgmt: Add documentation to exp-iso command


Compare: https://github.com/bluez/bluez/compare/ad1fc2fce967%5E...83b74bbb673c

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

