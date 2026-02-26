Return-Path: <linux-bluetooth+bounces-19451-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GsxEzOroGlGlgQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19451-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Feb 2026 21:21:07 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A81421AF02F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Feb 2026 21:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89AEF300D9C0
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Feb 2026 20:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55834611EE;
	Thu, 26 Feb 2026 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="GZSKf8UI"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60066428828
	for <linux-bluetooth@vger.kernel.org>; Thu, 26 Feb 2026 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772137209; cv=none; b=ImI2MZCE26LkUv5ioIMRUWpo1xYNKTKHzsDMNMSHFWiGGwmTpyoknNtkf8jDWOTjh9CfZu5y6UMNoreBFlsRKDZ9iZ2amFbup5fk762AhZchoxFQDQvdeMDTGB00d+hZ4aWweozP6uWpjDtAoTNKA7JZfm73sLkPNkmuV66k6jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772137209; c=relaxed/simple;
	bh=LIcWmgYApA7L0ARRH3Ooh8WzxB+Y1uxSruTeeaVgcQw=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=MczwjHziuk9KV9242xBnbqOBAcO/CAD7LwgwFJ6jGsK96ViuGmQuBetnzQZO+1udvIEdiEovErKciFTzk7w7ruie93Seqd3GTzJYBgjpQFQcnSei47kp91dVShMtDEJ8B/LLXNwW5nKeuimUGfykko+B/y3fglrgYJo+bk6Ohnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=GZSKf8UI; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-4df9fdc.ash1-iad.github.net [10.56.191.30])
	by smtp.github.com (Postfix) with ESMTPA id 9382E92131A
	for <linux-bluetooth@vger.kernel.org>; Thu, 26 Feb 2026 12:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772137207;
	bh=lrAyz0iXG5JB+r4r6JNaYHJEQL6qVy6vpxYwOWath7I=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=GZSKf8UIiA7BeAkgJcejX3jL+uCyvQ+oJOyRl7GPAhdsQTGy6o0yMlNT97QZlE0DP
	 AWARYQfj1oNWlfBiyquErp8fzqSyJg8dXM/SxBvAd+83Bf1rkLByAcmkBnL+BO0lQv
	 nxWQsjDEwJhU8GIh8ziDf46dOmR8rnFRgkYAeenw=
Date: Thu, 26 Feb 2026 12:20:07 -0800
From: fdanis-oss <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/bf52d6-21459a@github.com>
Subject: [bluez/bluez] 21459a: shared/bap: Fix endpoint configuration
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19451-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A81421AF02F
X-Rspamd-Action: no action

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 21459ac269ed67cac7948ec7a482cf3c4e653d0d
      https://github.com/bluez/bluez/commit/21459ac269ed67cac7948ec7a482c=
f3c4e653d0d
  Author: Fr=C3=A9d=C3=A9ric Danis <frederic.danis@collabora.com>
  Date:   2026-02-26 (Thu, 26 Feb 2026)

  Changed paths:
    M profiles/audio/media.c
    M src/shared/bap.c
    M src/shared/bap.h

  Log Message:
  -----------
  shared/bap: Fix endpoint configuration

When a first local endpoint is created after connection to a remote
device this doesn't trigger the SelectProperties request because
bt_bap_bac ops are not yet set when bt_bap_select() is called.
Creating a second local endpoint allows to trigger SelectProperties
request for the first endpoint.

This commit fixes this behavior by setting the ops during bt_bap_pac
creation.



To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

