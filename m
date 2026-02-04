Return-Path: <linux-bluetooth+bounces-18829-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFP5ATrHg2k/uQMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18829-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 23:24:58 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB16ECF97
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 23:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55E543017C07
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Feb 2026 22:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E332435BDBF;
	Wed,  4 Feb 2026 22:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="bIiESW3B"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-18.smtp.github.com (out-18.smtp.github.com [192.30.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5F436A007
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Feb 2026 22:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770243878; cv=none; b=QrIJTQgbyBdOZqrM4WuyRY74HJGMrB3eCOrkLpJFXSO/Im14g1PTeVqk5RJMRAZgdTgbO1Yh0TRnCePsNMALD5+OFni0lLTNXNMiiD/9gExnHHpI9ugoNeHrxRjMUxN79pAb5rzk9jHjJvIKDr5lLVXMs4pdX4U5oK9qi3CFIPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770243878; c=relaxed/simple;
	bh=FrQeeqwAPT96UtpMF+ygE/wYF1TAi+fAZtZ6oqVv8eg=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=s+CalpPMcPdTgZXdNihZvd/BmNC5rsRQHH9c0VhC29VNXfsN4EbqNRqR076v2zb8j3WaW9zGs0A21KKc+fAZFz5tuyVwMfOMWmPckzApSPE8uIpspzdDnETFvQ7KpWYKj7aV8sVb/cUW5rt5YDUGM9oh7dVDZzpkI1/2kMiAWb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=bIiESW3B; arc=none smtp.client-ip=192.30.252.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-0064ba0.va3-iad.github.net [10.48.155.32])
	by smtp.github.com (Postfix) with ESMTPA id 68B49E0862
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Feb 2026 14:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770243877;
	bh=O0Rbiic+sYvJ4L+0f/fLcm0DBMz/24KlJqjpgAcG1xs=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=bIiESW3Bmxm4twjOunt/fAKOubzIBiNEvRus6hd5nB/ZqzLTo28D0jZsZZGUXpMYe
	 vPnQknhSvXTgK37W10hfq/hkXdUGs9+Lp3FZFPhG/u7BH4W3/vcjNKRmalJ8Jur7ew
	 65MnMZiyAF5k6JkjGblC0FqGDuUlOG/ZJOr10rUs=
Date: Wed, 04 Feb 2026 14:24:37 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1050866/f9f1be-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18829-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9AB16ECF97
X-Rspamd-Action: no action

  Branch: refs/heads/1050866
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

