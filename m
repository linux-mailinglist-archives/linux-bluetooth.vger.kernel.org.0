Return-Path: <linux-bluetooth+bounces-19043-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BTGB+7zj2k3UgEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19043-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Feb 2026 05:02:54 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A01CB13AF99
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Feb 2026 05:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 598B8303FAF8
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Feb 2026 04:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1094225416;
	Sat, 14 Feb 2026 04:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="XBg8rcTI"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6158017A31E
	for <linux-bluetooth@vger.kernel.org>; Sat, 14 Feb 2026 04:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771041766; cv=none; b=jrsvfpwH/JzviyzgzLiVBrtBrxb13tVNS3oicvnHk8fP0wueEh+ZCwiI0sPMQtlZdiaE1jQ0ag8Y/pqu2nu6bQroenvmQdYrV3aF6CfzWUras7eWDU0TpIDzri8+BUO6VpgWcz1YS+TedOjjQUpVEojbY/jECft2DO/43KLnC8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771041766; c=relaxed/simple;
	bh=l4enVJ9mMCmWhStKXzeFMgq2fKxLMwvp97s3fL81seg=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=TPviSRzTlIBXe7z82YMVCzYkjgHukfCOLeb9T7bB/zW5e9rDsEOSKK/0cQHF0bFwfZo4eEjQeIuW5e8Yze5czE03usasH++c2uQTnaLNWiaMFThv48NV1nncYAN5MtXi0BREg0k768QgmZ+fr0Mm9YXfqzXU1r07J1qBIK7Wjlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=XBg8rcTI; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-6a50456.va3-iad.github.net [10.48.125.76])
	by smtp.github.com (Postfix) with ESMTPA id 7969B3C1148
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 20:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771041764;
	bh=i9PdFisFzdlcPfgOXL8+kUNs4YC3P381SGjEVNlLsNE=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=XBg8rcTIuaXqRZR1wJPtNs5hxApiANUrV3Ftu4E/3/6dErpheF64A3N9j7LopVj8X
	 vmY1q+GaI6XBhKjiG+vXrNqJ5eAUZ+ePUWn2og3gC7w5NgrV2d6PkzfggFb2KYNaH6
	 460Riivy5MT/gyFQsI7B2W8UaTTdH7EEZg/QAJas=
Date: Fri, 13 Feb 2026 20:02:44 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1042572/5567c2-000000@github.com>
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
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-19043-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[github.com:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: A01CB13AF99
X-Rspamd-Action: no action

  Branch: refs/heads/1042572
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

