Return-Path: <linux-bluetooth+bounces-18792-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O4nCRfZgGnMBwMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18792-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Feb 2026 18:04:23 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8D5CF55A
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Feb 2026 18:04:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FB08302AA04
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Feb 2026 17:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C188A38736C;
	Mon,  2 Feb 2026 17:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="NFrh8Vva"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152C7387351
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Feb 2026 17:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051774; cv=none; b=K/W7JXH0qI2uAmctiSMu8p1IQ1bpOs2wZO0MGU9wfvKSvCoU2lnIHgVLMEmaMt5ZHK8TnQCgwW71WKL9MdJ2rmxgTlulmFzMXOWHjCj2PEjiniiHJx8mhZiplIFGqB8zedTxcKPlS4PiWl9U/FCXKqrV1t2Ha08KkO4/ea2kVXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051774; c=relaxed/simple;
	bh=R0jmoYS4egpN1kyYhO5/IINCrI/0Stvbud3Rg2uMCy8=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=BXeNjDdQP2+Ij8zbXqBFwfXhc+Obc9tvYWn0j99c9RP/lUl/oTiUBG9l9nf1+wck5/jMWrMZDtiwOuQz/pYKKXEDA6WVDfWTg/5VGqyIdirSgL7BmgmObLwJ1uIHoYs8VcLm/M5r0CexvwBrqFutV6eeie6V4og0hhupb7mnIXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=NFrh8Vva; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-c347433.ac4-iad.github.net [10.52.152.35])
	by smtp.github.com (Postfix) with ESMTPA id F2BD640122B
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Feb 2026 09:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770051772;
	bh=44WS+SIArstJzr3bhVCcKx4rcickx6Fu4ggCbcKuaio=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=NFrh8Vvaw63qaf7u9HVGuudeHV+hp42JGh4RoW5qRKxpzhHR6l/OgAfDn7vHBBQI0
	 B0hB6r0FQwWa8A8Mp2fLomZXaDNX0mfebEKHpc07coKr29NgkmD+U7pnR2JGBffWQ7
	 s3gjC+3BESNybhtRCW+iUmUyumEH/4zZZ7D5rnDg=
Date: Mon, 02 Feb 2026 09:02:51 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/358ab8-4c963f@github.com>
Subject: [bluez/bluez] ba27f7: monitor/att: Add initial decoding for HIDS
 attributes
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
	TAGGED_FROM(0.00)[bounces-18792-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: AA8D5CF55A
X-Rspamd-Action: no action

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: ba27f7a12246a09a2c53f695c15ac4972fcabb03
      https://github.com/bluez/bluez/commit/ba27f7a12246a09a2c53f695c15ac4972fcabb03
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-01-30 (Fri, 30 Jan 2026)

  Changed paths:
    M monitor/att.c

  Log Message:
  -----------
  monitor/att: Add initial decoding for HIDS attributes

This adds decoders to HID Information and HID Control Point
characteristics.


  Commit: 4c963f21e56a5766fda63670c2ed4e12acc68ee1
      https://github.com/bluez/bluez/commit/4c963f21e56a5766fda63670c2ed4e12acc68ee1
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-01-30 (Fri, 30 Jan 2026)

  Changed paths:
    M monitor/att.c

  Log Message:
  -----------
  monitor/att: Fix printing data twice

This fixes ATT Read Response printing the data read twice by checking if
there is a dedicated decoder then skip printing the value since it is
latter printed by att_read_func:

== Before ==

> ACL Data RX: Handle 2048 flags 0x02 dlen 7
      ATT: Read Response (0x0b) len 2
        Value[2]:
        11 01
        Handle: 0x0030 Type: Report Reference (0x2908)
        Value Handle: 0x002e Type: Report (0x2a4d)
        Value[2]:
        11 01

== After ==

> ACL Data RX: Handle 2048 flags 0x02 dlen 7
      ATT: Read Response (0x0b) len 2
        Handle: 0x0030 Type: Report Reference (0x2908)
        Value Handle: 0x002e Type: Report (0x2a4d)
        Value[2]:
        11 01


Compare: https://github.com/bluez/bluez/compare/358ab8994207...4c963f21e56a

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

