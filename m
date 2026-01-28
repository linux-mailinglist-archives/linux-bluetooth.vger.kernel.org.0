Return-Path: <linux-bluetooth+bounces-18612-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEBANG9demm35QEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18612-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 20:03:11 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 728FEA8067
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 20:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C58CB30058E8
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 19:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B42C2D73B5;
	Wed, 28 Jan 2026 19:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="dCsY1u9U"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEE035FF67
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 19:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626986; cv=none; b=HFnLpEi6ZS5bojF7IFD3IKX+fz4rvHTGoLvq8O2OETjbQevkB/2XGx/XqcrLpp+RCs0ydNMQR7eK46Ifa0sG+AnjvfYbfK5yK1gAlwSBRfVNegRf+d3EPB8IYT45MkNJ8y2b+A5HgqBAzqQciNOI9J+j7LR1n4ovpiW8k9zdqlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626986; c=relaxed/simple;
	bh=Rvet5rM3TtLEuU9LNW7ObVa/AeeuIbD4bTvHOb0raDY=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=iWgKTFcZhETifgwiIn+GYJ7smWLhuKUN33G76sVTFq2/vU7wet/bYwvplB65KosJJBJm8LNgl3xbv3uVkHEzibLPEJb0t7alXFu5yFqYXVAyfx/+Vxl9J4vjrZIk6HiKZh2kppioM02t2NctWCXwUzL60rKcaGJqRGvF6XfeyDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=dCsY1u9U; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-c9ad705.va3-iad.github.net [10.48.137.13])
	by smtp.github.com (Postfix) with ESMTPA id 15E843C0B47
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 11:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769626983;
	bh=uNhOwMc3mLLv2HhZHkNXNSYOTcv1N+4E0MBIoHr+QaQ=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=dCsY1u9UCUUt27FaLoNqCvMONZzlwoT1XFsnBbQlu405Pf94f70cTjEUbLpcFlnUo
	 gjpjc54IEv13KYIcvtGTrV8aKkOQVnpAulkbyvpxNR41cOdItDBBB+pXD5ztW1lLw/
	 R9jucWe0Eh0nqfSS+5548L7lnulkE6eKtm/WRwRA=
Date: Wed, 28 Jan 2026 11:03:03 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1048215/000000-969859@github.com>
Subject: [bluez/bluez] 21a1e1: build: Remove SAP support
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18612-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[configure.ac:url,makefile.am:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,makefile.tools:url]
X-Rspamd-Queue-Id: 728FEA8067
X-Rspamd-Action: no action

  Branch: refs/heads/1048215
  Home:   https://github.com/bluez/bluez
  Commit: 21a1e19858899a8f285458f9a1b1b5f2fa86d1b8
      https://github.com/bluez/bluez/commit/21a1e19858899a8f285458f9a1b1b5f2fa86d1b8
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


  Commit: 969859b6c259674ef66ecb9b6dfbbb9d77ec1122
      https://github.com/bluez/bluez/commit/969859b6c259674ef66ecb9b6dfbbb9d77ec1122
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


Compare: https://github.com/bluez/bluez/compare/21a1e1985889%5E...969859b6c259

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

