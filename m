Return-Path: <linux-bluetooth+bounces-18849-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKR1D8lqhmnwMwQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18849-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Feb 2026 23:27:21 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFE6103C54
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Feb 2026 23:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2744F3014A10
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Feb 2026 22:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE86B301001;
	Fri,  6 Feb 2026 22:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="SpcCN7/H"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CE723183F
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Feb 2026 22:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770416837; cv=none; b=c7j0a/h3J5fJmCFdwxLUCyXaBjp/tXXLeNvj0N1dKuQ2aaWr82DgqiXSvDj4TTtLdEeDXSKg/FkiEDeQeo1Kfe0MeBKGo2ZPVlKP89tzRV8fGdb7Km+8o+89ofRuucGlcMlPtTptbe3l4aU/4kseKx4aud/JCxl86pMfqXWIiZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770416837; c=relaxed/simple;
	bh=5LC3/rrOtH7O/z1NIMpytaIYPrNVT/usSQFfJAziXcY=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=AtXds+gbtB4epPIpGjrTdLlGL18ZSymjxUD8tR43McPDiEd9fx5MTanMt3NlIIJblrf5/HkvGQ6YXNH1Evfdppgn3EtR6jj6Wymlo91SU3srF8ZSomcelHbgK+/oRKSPaOZ3p2Gi2354gY+wOf0q4VSYXtoFkQSOxhhZZGL20Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=SpcCN7/H; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-ca8a697.va3-iad.github.net [10.48.131.32])
	by smtp.github.com (Postfix) with ESMTPA id 66A813C000F
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Feb 2026 14:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770416836;
	bh=OoZpLCDi74zYdsuhzf5Gn3LUTG+rUhLNnNilVOOPkEw=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=SpcCN7/HBJdTuvMefGT/iXVmzgtRLbmLamloEx25UQ5JLMOrcrcmPTUlo7vwUc4Ec
	 rrklmFWynYNyBNuJ3Cx4gDpjHzUUZlB9Xws6aP/RYuvjvAAEkr/n2k8jQU3ryOO4Bk
	 X/+1ME0hAr7N747SCOpoe3SijF5v+W3+CfphgKyI=
Date: Fri, 06 Feb 2026 14:27:16 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/fc2037-6704b4@github.com>
Subject: [bluez/bluez] ac9292: test-runner: Add support for creating multiple
 con...
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18849-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DAFE6103C54
X-Rspamd-Action: no action

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: ac92925158589325c0af40aa9f1b1fbccf94852f
      https://github.com/bluez/bluez/commit/ac92925158589325c0af40aa9f1b1fbccf94852f
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-02-05 (Thu, 05 Feb 2026)

  Changed paths:
    M doc/test-runner.rst
    M tools/test-runner.c

  Log Message:
  -----------
  test-runner: Add support for creating multiple controllers

This enables -l/--emulator optional argument that allow passing an
integer number for creating multiple controllers:

$ tools/test-runner -l2 -d -k /pathto/bzImage -- client/bluetoothctl
[CHG] Controller 00:AA:01:01:00:01 Pairable: yes
[CHG] Controller 00:AA:01:00:00:00 Pairable: yes


  Commit: 6704b44cce887d8c3d4111e604665e90faba01c9
      https://github.com/bluez/bluez/commit/6704b44cce887d8c3d4111e604665e90faba01c9
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-02-06 (Fri, 06 Feb 2026)

  Changed paths:
    M tools/l2test.c

  Log Message:
  -----------
  l2test: Fix not being able to use -X ext-flowctl

-X ext-flowctl requires using setsockopt(BT_MODE, BT_MODE_EXT_FLOWCTL)
but instead the code was attempting to use L2CAP_OPTIONS to read the
current l2cap_options which is not support when the address type if
not BDADDR_BREDR.

Fixes: https://github.com/bluez/bluez/issues/1869


Compare: https://github.com/bluez/bluez/compare/fc20373d03c4...6704b44cce88

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

