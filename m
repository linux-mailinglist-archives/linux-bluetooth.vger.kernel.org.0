Return-Path: <linux-bluetooth+bounces-18644-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KAsJs5ie2l2EQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18644-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 14:38:22 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF61B077D
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 14:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB93E304C061
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 13:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CBB1624D5;
	Thu, 29 Jan 2026 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Xr8dHdLo"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652DF2E9EBB
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693752; cv=none; b=ROYi0Z61tgw1/2vIyBVn/LsbpgVt7x3r6k6aZhSm9JS8QXOlgQqjVycNvm43eE4AbMFMokhT1w4kNpPTeJWfCHu1xrgEIP51+wp1vY6HGe92sB6t2Y330nA1HXdO8DIZtqNCWTQ/zOO0QqWA91P8ZpiItmxsMppMiP2jw319/iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693752; c=relaxed/simple;
	bh=F66pwKuUF+nn3872odwhRpib3Wkp2VVzONjrngqkDCQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=I2WuggFhBtO6OkRzmJAXrA5MMwr6LjJebN2mbAeaDXf+F9U+xYb0Lz1r99Hrt/SBI5QB0SAG10N6FCXCXuoWE+kSlhOF2SO74yq90D31P8BzrfLtmVslVBix//xEPg2gciOE264iblXDZdrnqQez0XyDvQuUbwfdbvc6l8KOV9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Xr8dHdLo; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-e051eb5.va3-iad.github.net [10.48.145.17])
	by smtp.github.com (Postfix) with ESMTPA id 43CDB3C1090
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 05:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769693750;
	bh=CnYzWX8Ojo96jVqi50y6yJUpAhxLlN0KLdm7DKIuddk=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Xr8dHdLoypX7+k73CJ8ZoU5TqPa5lKJBhi1wHDxpkLj0ri7UeCq9e5MbX8tiJTJ/Z
	 lKl2Xw26+i1pwsEq1md6ExBQbJg6oTwvS7wJAeUjHlW2mdnqIAjiye1tS5gJm21DOu
	 QeR9Z0JOHDneL6PAfILefLt37gUDupp2ZX15eDz4=
Date: Thu, 29 Jan 2026 05:35:50 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1045811/36aafb-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-18644-lists,linux-bluetooth=lfdr.de];
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
X-Rspamd-Queue-Id: 6BF61B077D
X-Rspamd-Action: no action

  Branch: refs/heads/1045811
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

