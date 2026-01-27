Return-Path: <linux-bluetooth+bounces-18565-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOd8GfQGeWlrugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18565-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:41:56 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E45A99464
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A9923082F5C
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7B03271F0;
	Tue, 27 Jan 2026 18:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="jVgC07rE"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-19.smtp.github.com (out-19.smtp.github.com [192.30.252.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D473632863D
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539263; cv=none; b=pbQP5bmbitB4oje+JYbOqouCIwPfy15wCHXzHcR33+B3jot8XX7YGES9/kHuRgnym60SJuOwkdRSUVd05w7rblt0FVqNRHlc2x6DPEAf989/TjmJqPcFHrtoEqCIBu9akk24lLVVyiv26YL5c07jumlf1Q9X4ZXBKBFh7AwVwMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539263; c=relaxed/simple;
	bh=eOZIJQsBmLukiY/bdOqAZnf9fETgToN5JoFvNYVuFTw=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=g3bm4bRXhSc+T5n99rAZgR+BLXx/pco7WV1636DHCP4hvzw7VPRgKNV7QgIO95CH/omt9BxjAiNKLb29Eq9AIakQIXY6kqFCMgD0EmaM74QJw/r7vDV0izCU1FuMJMM05tpuT7tA0hAN9z9HN44Z4w3kv70bR8A+4r6aQzOP8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=jVgC07rE; arc=none smtp.client-ip=192.30.252.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-aac98ad.va3-iad.github.net [10.48.168.36])
	by smtp.github.com (Postfix) with ESMTPA id 19892E0A9E
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 10:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769539261;
	bh=M7CAsOTEoeowPyE3/g0/oI4kNt8nVqJa7HUUBNCDCgA=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=jVgC07rE2YaovF0x/p2VDCO8lw1X7Dy6yKCOeFLzrC3vMzcRKqKCbqUincI7NcHNg
	 6kTkonvk9v6wrcm5o8418j6TRKr/S4wp2I1veUpyE6QgQ0AA+AclBb6KCk8/C30eZO
	 BDAWKDdd2Qx4q2iexR5dxnP9BbB6FLEWRfgd5yBI=
Date: Tue, 27 Jan 2026 10:41:01 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047697/221b97-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-18565-lists,linux-bluetooth=lfdr.de];
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
X-Rspamd-Queue-Id: 2E45A99464
X-Rspamd-Action: no action

  Branch: refs/heads/1047697
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

