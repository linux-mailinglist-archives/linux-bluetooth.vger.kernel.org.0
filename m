Return-Path: <linux-bluetooth+bounces-18614-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLveOJCEemnx7AEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18614-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 22:50:08 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46578A93C4
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 22:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DC5F301BC32
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 21:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6EE31C57B;
	Wed, 28 Jan 2026 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Vog5XHV/"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-26.smtp.github.com (out-26.smtp.github.com [192.30.252.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA9C16DC28
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 21:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769636988; cv=none; b=bYgMZg7TPqXUP8pGJPKaGnWyK++OnAjQ5r1TVtgk5sZ0c9RI7FhYdajjcz4pdibX8qD5zWSW8SBrqWq0mPudj7zo6MIjAuizQZu1novN1E77XfnNrbrR7L0TSx19VdhpSIvte3xsIF2xNW62NlCj0Qy22qTqlzKkLhJ6bL3zs3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769636988; c=relaxed/simple;
	bh=qx1dWhFv40HOldJuC4u7zEyZaAlynmIshjF4n/rtdUk=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=jQEgnC/F8EtAShassPi9BJtls29vt8/BuIas7qd2QqOqlWuXzPlat/K90HASjivTtuOoPpiCobWEUmhgmV8wKpKnukAwg8RVNtY56K7dl31pVvSQi6NIn9ChWhDty8sxDp+znRj98L+1E5mJThRkRQmlW77cfATyxkz3oSdUUxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Vog5XHV/; arc=none smtp.client-ip=192.30.252.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-77d345c.ash1-iad.github.net [10.56.209.113])
	by smtp.github.com (Postfix) with ESMTPA id 4B47B60119C
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 13:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769636986;
	bh=5cQVb1x4NJJRI55/DmveHPjxHu1YMyQOp9umUAnVmo4=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Vog5XHV/KZIkyVfqnkGBltIRL9y8WQU67Tkk4q1kaKT6QHLJGrBimHYcXnaGrdep8
	 LNj0PPesD9U0zFC+aKI90nOiIQy6uXGUSslUW9jl7sP01s73pNZLHeD6Wn6dL457W1
	 RQpxv5NDeIx0tEeicqM0XKYH40IPT/Y5qXI833bA=
Date: Wed, 28 Jan 2026 13:49:46 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/a3c0aa-e2551c@github.com>
Subject: [bluez/bluez] e328fd: build: Remove SAP support
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18614-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,makefile.tools:url]
X-Rspamd-Queue-Id: 46578A93C4
X-Rspamd-Action: no action

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: e328fde3e2e29888fa6098ea88f38d39c8ba6e33
      https://github.com/bluez/bluez/commit/e328fde3e2e29888fa6098ea88f38d39c8ba6e33
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-01-28 (Wed, 28 Jan 2026)

  Changed paths:
    M .gitignore
    M Makefile.am
    M Makefile.plugins
    M Makefile.tools
    M README
    M bootstrap-configure
    M configure.ac
    R doc/sap-api.txt
    R profiles/sap/main.c
    R profiles/sap/manager.c
    R profiles/sap/manager.h
    R profiles/sap/sap-dummy.c
    R profiles/sap/sap.h
    R profiles/sap/server.c
    R profiles/sap/server.h
    R test/sap_client.py
    R test/test-sap-server

  Log Message:
  -----------
  build: Remove SAP support

SAP plugin hasn't seen any updates in decades and the industry doesn't
really use it anymore.


  Commit: e2551c5b9809605b402b47d1c8c3b922c9d2acca
      https://github.com/bluez/bluez/commit/e2551c5b9809605b402b47d1c8c3b922c9d2acca
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-01-28 (Wed, 28 Jan 2026)

  Changed paths:
    M .gitignore
    M Makefile.am
    M Makefile.plugins
    M Makefile.tools
    M README
    M bootstrap-configure
    M configure.ac
    R doc/health-api.txt
    R profiles/health/hdp.c
    R profiles/health/hdp.h
    R profiles/health/hdp_main.c
    R profiles/health/hdp_manager.c
    R profiles/health/hdp_manager.h
    R profiles/health/hdp_types.h
    R profiles/health/hdp_util.c
    R profiles/health/hdp_util.h
    R profiles/health/mcap.c
    R profiles/health/mcap.h
    R test/test-health
    R test/test-health-sink
    R tools/mcaptest.c

  Log Message:
  -----------
  build: Remove health profiles support

Health plugin hasn't seen any updates in decades and most of the industry
has probably move on to LE and GATT.


Compare: https://github.com/bluez/bluez/compare/a3c0aa5fc106...e2551c5b9809

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

