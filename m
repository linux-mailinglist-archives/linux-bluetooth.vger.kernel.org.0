Return-Path: <linux-bluetooth+bounces-18568-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBUPAgEHeWlrugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18568-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:42:09 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C23FA99479
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79720305980D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D04C328B5B;
	Tue, 27 Jan 2026 18:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="AUx9L2NP"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-18.smtp.github.com (out-18.smtp.github.com [192.30.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA35328632
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539267; cv=none; b=JSmS4+/E4/1IBUh8+GnuBAM7acefSo/w2LQZnFIjn2Y7Ly8WwV7byG6Q6AKzxkWg6nzNhJlTAaxZZ2ZpQ1/Y8oSkfJCCYA3hVXtSaagfQEEeqYM0hBoK5IfA/IlL7PzrL8JoUDBKgu1rJUqhF2yZ9XPwgCW0cSry48cs5Sltpvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539267; c=relaxed/simple;
	bh=TkgnodTG5TBWRoG4OaqAORnZdIkeL6OsHCcsu/Mi9L8=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=euGebMUUgKP0qu86lYezyO2LJPWLYk+GmH+W3ejgCsk18Fk0cin5gz/X903c6sRIgCEZTYwsk4xmIl5eyFvoUhYBgozvKajFAWUBcWbdqdLW1RzDTfzonSIgKi2A1wwJnS6OdnBoWIwGUcQ958gBa4ak4SJZqAzHH0gwPZ/CE6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=AUx9L2NP; arc=none smtp.client-ip=192.30.252.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-d1e60ba.va3-iad.github.net [10.48.205.93])
	by smtp.github.com (Postfix) with ESMTPA id 98692E072A
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 10:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769539264;
	bh=egB63yD1JELDR8vSkry8FbhMlbyE29SsOn8/0TOll4M=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=AUx9L2NPDGqJ7Yiv4wFAMFMV1YRzw6ZQL0JQ+Ts3bKVucbb0DXTZC82b/jlY2/8b8
	 RgsSMn82T2rH4aEZypAFExRtotsb0u/AOIzuCyCcYa8s5G73v3xy2xUz/e8Z+EfuTF
	 OWAx9cawq6eUYHBWXTln3GP/5YFBEakb7HZ7n+DQ=
Date: Tue, 27 Jan 2026 10:41:04 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047694/b609db-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-18568-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C23FA99479
X-Rspamd-Action: no action

  Branch: refs/heads/1047694
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

