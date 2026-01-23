Return-Path: <linux-bluetooth+bounces-18368-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHR3Arhec2l3vAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18368-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 12:42:48 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A737543F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 12:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3831E302AF95
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 11:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7923815EE;
	Fri, 23 Jan 2026 11:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="AwEQ0C13"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7A23783CA
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 11:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168251; cv=none; b=lfykG0l4JMebBN6/MGzARbFZe43LHSyy0JwD80jy7pjFHdSxjL+p1iREkD0VBoUtNiaV25pZDxxG9vsWjFNHXdYGeRL5hun9INhF1pLEeyj4RqWQAdJXf+tci8G5ExlYuiAm+s2q0sKG8/Z6CobjLdunUlqmP8PDsYC0ZHseVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168251; c=relaxed/simple;
	bh=9WWBLGsXU2bYH9qHARX3lnzrrCNjBBFKopWhjUzZkyg=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=KiOA8cvAAUEZEMwk3jLtTIeeK7Dt3q6hoUIwmTe3Soi8Wi3zPN3azl9eYDTAJnxDrZyBb6c2rjmAjxUvF63uSw8liB9Iax25eEnqPUYwaMucI4wQtiYmvU5LEhUg8P9/WG5kfgYblmb8M2RaEnyIJpZ0TqY/IyWQppPz2SIdSqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=AwEQ0C13; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-4cb5629.ac4-iad.github.net [10.52.152.39])
	by smtp.github.com (Postfix) with ESMTPA id 54CB464052D
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 03:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769168247;
	bh=6my0mpc1/vPJnI8ITWoIMPkYjaJ1SDWMFKFkSrMjk9E=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=AwEQ0C13s0/ikAkGsNkZ8fh6d+kCG99t0ENLnRDZjun8sMYms9M8fGv3bSdnnUpbc
	 6s6PjMa6EFgXkXQJc/S5q8HVRZNNIEcedPUaROIw71IYg3SQIe71sPInQAdujotRwG
	 jfgn4aCP2XgZZ/a5BHz5FSjErbAYzmdnBg6YB5SE=
Date: Fri, 23 Jan 2026 03:37:27 -0800
From: prathibhamadugonde <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1046224/000000-035cd6@github.com>
Subject: [bluez/bluez] 035cd6: Implement the Bluetooth Ranging Profile GATT
 serve...
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18368-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,makefile.am:url,qualcomm.com:email]
X-Rspamd-Queue-Id: E7A737543F
X-Rspamd-Action: no action

  Branch: refs/heads/1046224
  Home:   https://github.com/bluez/bluez
  Commit: 035cd6cf546de269737d194b7de495ec56b51609
      https://github.com/bluez/bluez/commit/035cd6cf546de269737d194b7de495ec56b51609
  Author: Prathibha Madugonde <prathibha.madugonde@oss.qualcomm.com>
  Date:   2026-01-23 (Fri, 23 Jan 2026)

  Changed paths:
    M Makefile.am
    A src/shared/rap.c
    A src/shared/rap.h

  Log Message:
  -----------
  Implement the Bluetooth Ranging Profile GATT server and client support as specified by the Bluetooth SIG:

Add RAS service, characteristics, and descriptors to the local GATT DB
Implement server-side callbacks for RAS Features, Procedure Data,
Data Ready and Data Overwritten characteristics
Add client-side session handling, notification registration and
ready callbacks
Wire RAS attachment/detachment to ATT/GATT client and server



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

