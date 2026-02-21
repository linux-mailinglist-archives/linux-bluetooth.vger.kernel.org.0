Return-Path: <linux-bluetooth+bounces-19264-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xIYsOzldmWkwTAMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19264-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sat, 21 Feb 2026 08:22:33 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EC216C5E5
	for <lists+linux-bluetooth@lfdr.de>; Sat, 21 Feb 2026 08:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 494573014130
	for <lists+linux-bluetooth@lfdr.de>; Sat, 21 Feb 2026 07:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77329331A5F;
	Sat, 21 Feb 2026 07:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Ym0Lln4g"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0CD2FE579
	for <linux-bluetooth@vger.kernel.org>; Sat, 21 Feb 2026 07:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771658550; cv=none; b=O/1aubTpf1nV4ZjS2nPcY6l/fUA30SqrmqWKn+ey2n0rSMep9/Lcryk2Wpyf7Dbz2QSD3xo4suqAzc1JU0cMqoSfQpap6eHIOsMMDT3bhOEmzBmQXsPOZD8w79ykkrtCHLZSSW4XE7M+flDKTcFydUiPN45ztzKIBw7EAlF+05U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771658550; c=relaxed/simple;
	bh=2Oo9sg3D8NqjehHHLXE4DlEXWCsbc+Ni+w0FZSuaTH4=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=kZciWgdGC0idssl1TVF6YCoKRt3FF6ylzpngUHy0jeeWioAk1KB6yHLrLQmAivHBYn0tj5nuYo3Ol2fSBnWlqDajCHf+aNw9s8F+zrsXq/n3E8fPBJLVko9cPRUjgLlItKDHwzXnIihwPxL/EKGAOgY0NkPGXsM/XXDjyQ4Ji44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Ym0Lln4g; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-f5dd002.va3-iad.github.net [10.48.180.54])
	by smtp.github.com (Postfix) with ESMTPA id 50FC33C04A9
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 23:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771658548;
	bh=LV0+8M57qqTPc0GVzX2aB52OLECekHUziO5Vl66C+tg=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Ym0Lln4gcWyscxk+VNH7QgyCJO9Q/eDAPmZJ5xlAaSFFnv2nn3Ixa2FyXySxylAFw
	 hvCTTRNjWAO25JRAdYDjmgw27U/ziAKWQlhJj0a4/Apqg2s2x0X+w8pp/Se51i3ry7
	 rubN1avA+Nvcogsap2PQK0l1bvPQp2yvWVJNzT2M=
Date: Fri, 20 Feb 2026 23:22:28 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1045489/986b05-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19264-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67EC216C5E5
X-Rspamd-Action: no action

  Branch: refs/heads/1045489
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

