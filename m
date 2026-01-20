Return-Path: <linux-bluetooth+bounces-18264-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJrzOZXUb2mgMQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18264-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 20:16:37 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5214A23C
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 20:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C9291A4B015
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 17:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BF843CECC;
	Tue, 20 Jan 2026 17:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="M0403zRV"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-19.smtp.github.com (out-19.smtp.github.com [192.30.252.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E133BF317
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931296; cv=none; b=aNj3k3jRYNzYSUSaww4Ns5ThpQZp5GFfTSVKfyqUGj22BwqzQcBkFsnzBTYboMdX2Ap3LW4uqQCsepqE4EzmspvOMTpwqbmnQQC/ayte1tqwqDyCaK4K40n7LeEARCuckB7U22Q1UL7DruubxPOWA/XjpoAbDdz+eEaDNEDvsfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931296; c=relaxed/simple;
	bh=CU21sG6lNwrncClxtzpTHLF0KDLKyntqAYvnmXLBW84=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=Nch3jvSptfh9oE505Rj1sIN93zf1Lp1u/A27wRLajMRFvyemlNZcyKO4A71KSyQgQPmvt6fYnxw+T2ppcLnNUp7Fv3pmu8bhbOlUxCkLhYgIoeHmwXwRrU0A/SH1rx6rMNx+UwDsh85T5Z5a+TcOl5W9UcQ5KS66GvR/hchaDys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=M0403zRV; arc=none smtp.client-ip=192.30.252.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-93cebcf.va3-iad.github.net [10.48.179.46])
	by smtp.github.com (Postfix) with ESMTPA id BBD16E0BB7
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 09:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1768931292;
	bh=G67Anz8VmIhtkJMOIp4UDBlq6saMQJQAUTO2fOL4dtI=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=M0403zRVTLwGLIOk4NAvvq/yJODdz3ORvvT8xBUtn0HrFXpHWDsHtNYSH3iUZWsse
	 x6B4p2jpxOxfMeK6AQwh0YTePFQRCrVpSmAFwlljwHXB4KFKgeGSpi9OtTgwocCwsv
	 2mDqcX5ut6SIEi9kiSg6eG+Euey99MuL5uqCNUZQ=
Date: Tue, 20 Jan 2026 09:48:12 -0800
From: hadess <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1044790/000000-6c7858@github.com>
Subject: [bluez/bluez] 6a7f38: doc: Port assigned-numbers.txt to RST
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
	TAGGED_FROM(0.00)[bounces-18264-lists,linux-bluetooth=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,hadess.net:email]
X-Rspamd-Queue-Id: 5B5214A23C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  Branch: refs/heads/1044790
  Home:   https://github.com/bluez/bluez
  Commit: 6a7f388e9534601cf861a2cc21d43be21bf0ba31
      https://github.com/bluez/bluez/commit/6a7f388e9534601cf861a2cc21d43be21bf0ba31
  Author: Bastien Nocera <hadess@hadess.net>
  Date:   2026-01-20 (Tue, 20 Jan 2026)

  Changed paths:
    M Makefile.am
    A doc/assigned-numbers.rst
    R doc/assigned-numbers.txt

  Log Message:
  -----------
  doc: Port assigned-numbers.txt to RST


  Commit: 5c53424de606909bc957624a6dd578a846010342
      https://github.com/bluez/bluez/commit/5c53424de606909bc957624a6dd578a846010342
  Author: Bastien Nocera <hadess@hadess.net>
  Date:   2026-01-20 (Tue, 20 Jan 2026)

  Changed paths:
    M Makefile.am
    A doc/org.bluez.Thermometer.rst
    A doc/org.bluez.ThermometerManager.rst
    A doc/org.bluez.ThermometerWatcher.rst
    R doc/thermometer-api.txt

  Log Message:
  -----------
  doc: Port thermometer-api.txt to RST


  Commit: ac2b23c26be1693eab8052a36e96ceb87f8e925e
      https://github.com/bluez/bluez/commit/ac2b23c26be1693eab8052a36e96ceb87f8e925e
  Author: Bastien Nocera <hadess@hadess.net>
  Date:   2026-01-20 (Tue, 20 Jan 2026)

  Changed paths:
    A doc/security-bugs.rst
    R doc/security-bugs.txt

  Log Message:
  -----------
  doc: Port security-bugs.txt to RST


  Commit: 247d7e74550d3878b228217a3b21017aff7a2349
      https://github.com/bluez/bluez/commit/247d7e74550d3878b228217a3b21017aff7a2349
  Author: Bastien Nocera <hadess@hadess.net>
  Date:   2026-01-20 (Tue, 20 Jan 2026)

  Changed paths:
    A doc/coding-style.rst
    R doc/coding-style.txt

  Log Message:
  -----------
  doc: Port coding-style.txt to RST


  Commit: 36fd01d8d4fa932c57336d2f5e55af3920007a71
      https://github.com/bluez/bluez/commit/36fd01d8d4fa932c57336d2f5e55af3920007a71
  Author: Bastien Nocera <hadess@hadess.net>
  Date:   2026-01-20 (Tue, 20 Jan 2026)

  Changed paths:
    M Makefile.am
    A doc/org.bluez.SimAccess.rst
    R doc/sap-api.txt

  Log Message:
  -----------
  doc: Port sap-api.txt to RST


  Commit: 1fb5e8a2af9aa8080073d434d5e731ae229d5b6a
      https://github.com/bluez/bluez/commit/1fb5e8a2af9aa8080073d434d5e731ae229d5b6a
  Author: Bastien Nocera <hadess@hadess.net>
  Date:   2026-01-20 (Tue, 20 Jan 2026)

  Changed paths:
    A doc/maintainer-guidelines.rst
    R doc/maintainer-guidelines.txt

  Log Message:
  -----------
  doc: Port maintainer-guidelines.txt to RST


  Commit: 6c7858ffef842d6e7408962d29e89a510c83088a
      https://github.com/bluez/bluez/commit/6c7858ffef842d6e7408962d29e89a510c83088a
  Author: Bastien Nocera <hadess@hadess.net>
  Date:   2026-01-20 (Tue, 20 Jan 2026)

  Changed paths:
    M Makefile.am
    R doc/health-api.txt
    A doc/org.bluez.HealthChannel.rst
    A doc/org.bluez.HealthDevice.rst
    A doc/org.bluez.HealthManager.rst

  Log Message:
  -----------
  doc: Port health-api.txt to RST


Compare: https://github.com/bluez/bluez/compare/6a7f388e9534%5E...6c7858ffef84

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

