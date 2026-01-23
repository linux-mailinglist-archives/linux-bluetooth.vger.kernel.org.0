Return-Path: <linux-bluetooth+bounces-18369-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WELpIfpec2l3vAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18369-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 12:43:54 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0046D7546B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 12:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1B273089DCF
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 11:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC373859D4;
	Fri, 23 Jan 2026 11:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Caw6taCQ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E43B37D12F
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 11:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168254; cv=none; b=mFkOgQj1witdQleUHptyyOy4uaTKnjahf5otVSfAakzzGayfuy6Wx/u1nAdIjT94Lunvie/5kiViZpb9fAeMVjl4X1YeLY2wyXiQQZWVtV98cPRAmGg8fBDaSTPWKiTy3sknT/9avpNU+mtIFQ5ZFm2j9c3WP/9lLFNQgccuTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168254; c=relaxed/simple;
	bh=VFHi1Ny7oOXkcsSMTcRiK2cvFyZA1V1mztCREuE3DpM=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=ORjc1Gh+CTxj5vd9wToVYIDu3dexkdNWay4/A9nWmkhfQIkBR1sXNTa1MjYemmy3AULaFB2UmsCM4BSPA6S2CgS5l3YbcoLkBzTu4JtO4SiGftsdmy9/P4uNwG+rSLWry2MalAwexdGDAcIjNlE/iWhGxLgvw2YFpBMex84fp4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Caw6taCQ; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-9edabb7.va3-iad.github.net [10.48.219.77])
	by smtp.github.com (Postfix) with ESMTPA id 792184E0348
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 03:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769168249;
	bh=e+gq1i1vWOSA4jqsI9VDvjdoLdJxZwjDo5oqW47C2eo=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Caw6taCQCBHj/bYCmBYER05tj1nlhE5C8ZhYAALbc2T331iOTLLJsbR/nAMkoU6uH
	 pfUIkaSzwnVMnEEhw2u0ycAVdrTZ14vfHW4JkbMY8Q7SpXZFgZK8zIPwZ6sg6Aeu8Y
	 4mNh2SRX71ELOXM9H4/Z7zDkEg+rrEE3K7bANPX0=
Date: Fri, 23 Jan 2026 03:37:29 -0800
From: prathibhamadugonde <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1046227/000000-89bda3@github.com>
Subject: [bluez/bluez] 89bda3: unit: Add test cases for Ranging Profile (RAP)
 Thi...
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18369-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,makefile.am:url]
X-Rspamd-Queue-Id: 0046D7546B
X-Rspamd-Action: no action

  Branch: refs/heads/1046227
  Home:   https://github.com/bluez/bluez
  Commit: 89bda3162c617820919002a642c756b6ba98a9d9
      https://github.com/bluez/bluez/commit/89bda3162c617820919002a642c756b6ba98a9d9
  Author: Prathibha Madugonde <prathibha.madugonde@oss.qualcomm.com>
  Date:   2026-01-23 (Fri, 23 Jan 2026)

  Changed paths:
    M Makefile.am
    A unit/test-rap.c

  Log Message:
  -----------
  unit: Add test cases for Ranging Profile (RAP) This adds unit test cases for the Ranging Profile (RAP) implementation, specifically testing the Ranging Service (RAS) server functionality.

The test suite includes:
- RAS/SR/SGGIT/SER/BV-01-C: Service discovery test
- RAS/SR/SGGIT/CHA/BV-01-C: Characteristic GGIT -RAS Features
- RAS/SR/SGGIT/CHA/BV-02-C: Characteristic GGIT -Real-time Ranging Data
- RAS/SR/SGGIT/CHA/BV-03-C: Characteristic GGIT -On-demand Ranging Data
- RAS/SR/SGGIT/CHA/BV-04-C: Characteristic GGIT -RAS Control Point

These tests verify GATT server behavior for the Ranging Service,
including service discovery, characteristic discovery.



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

