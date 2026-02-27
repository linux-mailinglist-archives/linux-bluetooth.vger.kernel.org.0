Return-Path: <linux-bluetooth+bounces-19477-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJqaN/24oWkYwAQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19477-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 16:32:13 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B321B9D40
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 16:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F374830439D6
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 15:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627EA41B361;
	Fri, 27 Feb 2026 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Sev8IpnA"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050382472A6
	for <linux-bluetooth@vger.kernel.org>; Fri, 27 Feb 2026 15:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205993; cv=none; b=hKyrV9HpUdiDESPiLs+Uxs27hDhcKzj/AOsgUXPGsropAMfKfOX9KJxinVYT3NDWflHLmcICYEW7GHTXlJ/pFIMgqlo82ZN+ksbL0RWqRX/e/IP9uY/dDT+BKkkpismAsru40oE0XpQbVta1h18ypbRWlctcYXAxAkEO4Ek7hyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205993; c=relaxed/simple;
	bh=dsZl1a31vPYIu0pvnuxlmsmzHHK05/S8NkZ8oKccn08=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=ucyKMjjtzW0JRVk7XUF6xuMsDvgBQY1GlmiOzD3ZigeGxZV100NaTUuawnyXkComstmX+iHZTLseL+8vzhXF13lcr2LioJeE6v4QXByOdevrthEiTLLaWNthVmFlcST4cYy+ii1U3ZWNbp1GbclkMDjXye9DYroE51OR/HopGIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Sev8IpnA; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-d3b9625.ac4-iad.github.net [10.52.201.77])
	by smtp.github.com (Postfix) with ESMTPA id 18ECD6402AC
	for <linux-bluetooth@vger.kernel.org>; Fri, 27 Feb 2026 07:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772205991;
	bh=aPAGO8HJmUag9uJ10BXVn9Vu79D1J/RahATjvXz6aLw=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Sev8IpnAAjsPXkktDD5+CRHLA3ibjxQAtzL9gcOTn/SQy8YFZrhNYVT/wYE6SG/o8
	 eLK4W+qVMSPkwbNTUoscpHrerEAMRhyuH6wcjK0HSWCVFPwCg9kIs1WkXsorrjJ7C3
	 0srf2gkrWjTeB6TnultvvtebN9Kzu0GRs9cRz4hQ=
Date: Fri, 27 Feb 2026 07:26:31 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1059044/3f921e-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19477-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 79B321B9D40
X-Rspamd-Action: no action

  Branch: refs/heads/1059044
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

