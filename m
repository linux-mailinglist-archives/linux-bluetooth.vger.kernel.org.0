Return-Path: <linux-bluetooth+bounces-19567-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PiyErlapWlp+AUAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19567-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Mar 2026 10:39:05 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B06301D5A7D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Mar 2026 10:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9144B302FA83
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Mar 2026 09:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158EA38E5F9;
	Mon,  2 Mar 2026 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="KNxaoeFY"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7431A2C0B
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Mar 2026 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444245; cv=none; b=n9LD5sztQT0S8w7V2HUoaVyoMXUt1kDyQ2OkBx1tDnWFet0Orm+vtpwJ1G96RkRNISbDGe4zmq0EwnGwUwdQ/PkBP1L50nBoZZlTkuKgBU2Nm/NPyvT6Ynh6350VqGMMfyrob2BV8OJtV2vXjN0RJUCQKQvI5OLtyoJXfZ48BwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444245; c=relaxed/simple;
	bh=jIAd1Bg5kbVUtnkV+sunGXA1stMBv8mDR1SzON5JiKU=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=WQz5jvOcK7rIoXUXhV4hcxyG9pchmNXisPOMp61mVo3qfbGCyXwPlWE/ZcbdCloE3TQTAP5qoWBa2MN5LsgHeQH1jOPerFnn5mMsUsfwhhaC5/IJKvgvQM8LS+216z9gwOfdmXawRc7ICN0Y7yqPQohfAPUJT+5eXRik8Vby7yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=KNxaoeFY; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-7e2fa91.ac4-iad.github.net [10.52.211.63])
	by smtp.github.com (Postfix) with ESMTPA id B80E864116A
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Mar 2026 01:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772444243;
	bh=un0bDJNHPgxsQXXgpVubq8jJD2iW4ObVbzw6XeIr1mU=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=KNxaoeFYu9M68+plaYuQDXz0Iq0f5y/9wrvHe/lXKuiZ5V11MOEW8fpUoMy9eDxnY
	 QMbuBFL2QPJjCPj9X2dV0piKxZraSpeYahL6mvpykBP0juXfEz6xEljNyq9n3EbgsB
	 Ziu/uk8jvU1Fsy2diqpt0DxjQr+vqkBi9rMmZX6E=
Date: Mon, 02 Mar 2026 01:37:23 -0800
From: Pavel Bozhko <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1059867/000000-c456c0@github.com>
Subject: [bluez/bluez] c456c0: audio/avrcp: fix EVENT_VOLUME_CHANGED not
 supported
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
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19567-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.941];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,salutedevices.com:email]
X-Rspamd-Queue-Id: B06301D5A7D
X-Rspamd-Action: no action

  Branch: refs/heads/1059867
  Home:   https://github.com/bluez/bluez
  Commit: c456c0240962d86b8d0ad8e1f1217ee1c4be30a4
      https://github.com/bluez/bluez/commit/c456c0240962d86b8d0ad8e1f1217=
ee1c4be30a4
  Author: Pavel Bozhko <pvbozhko@salutedevices.com>
  Date:   2026-03-02 (Mon, 02 Mar 2026)

  Changed paths:
    M profiles/audio/avrcp.c

  Log Message:
  -----------
  audio/avrcp: fix EVENT_VOLUME_CHANGED not supported

Some devices with AVRCP 1.3 may support remote volume
control=E2=80=94for example, certain TV models such as:
- LG webOS TV UM7450PLA
- Xiaomi Mi TV 4A 43
when they act as the audio source, provided that
Category 2 (Monitor/Amplifier) functionality is supported.



To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

