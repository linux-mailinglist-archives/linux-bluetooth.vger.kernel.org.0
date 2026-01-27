Return-Path: <linux-bluetooth+bounces-18530-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CY5B13+eGmOuQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18530-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:05:17 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D981198C36
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0AB630AB639
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0C13112D5;
	Tue, 27 Jan 2026 18:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="TTYKzQ6S"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-27.smtp.github.com (out-27.smtp.github.com [192.30.252.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC78324716
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769536946; cv=none; b=n+7X0Ri3KHRcTpQRFL97+g4Pr3DWFdIoioQ3y5qH8pTiSrPtvLbKt2BRUEEUg68VsYwPaUqfkH/yGVF81xSyLnIKGq+8y/YudjjBcSj0l/oca7AmwDIKvBeH1dtz7RE1zmj8gPYu4/ORFU0fge3paVT9i5QUpSxAhFeQngROBkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769536946; c=relaxed/simple;
	bh=WoQbfNyffqVaYoO3+VCWI8qK3Exw+SvU2yEQ79Vagek=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=C4zszr613zQMDmzjt5UJXvfHdC+KxhuhpWIPaujePgY7w1vCM/uphNIr+W5/oCzN/7GdkNO7MqKaB9l3WNk6G3n7o6aHFpgLhjwvEMVbf9Lbx1ES4vhQfpp9YkElNNY4KI03Q7sUERyvOS6tweF5nM4qdeMLef2+DKcXIoVHhqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=TTYKzQ6S; arc=none smtp.client-ip=192.30.252.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-29323e3.ash1-iad.github.net [10.56.203.103])
	by smtp.github.com (Postfix) with ESMTPA id E1B7A6013BF
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 10:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769536944;
	bh=5rsl5dCx4H08EJtCMJ/d5E3b4lRZcGrOewOvdVwjCSg=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=TTYKzQ6S94wAcD9rqvcYlBrRXn1oyiC3R32AdabkowtcuZhWZci+d2gV02Pp9aqN3
	 f8db/q03uOcKZLyCUaeDR+z1AdB1nK8Qt3I+0OQD9AcgKm2/+SqAAgzbA73Nb6cQ2f
	 uYuLcXsbkbrIpGniszCk/8vGrfcvsMT7o1eZkVKA=
Date: Tue, 27 Jan 2026 10:02:24 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1046197/d5ca4f-000000@github.com>
Subject: [bluez/bluez]
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18530-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D981198C36
X-Rspamd-Action: no action

  Branch: refs/heads/1046197
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

