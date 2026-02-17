Return-Path: <linux-bluetooth+bounces-19117-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BQKBmWElGlBFQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19117-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 16:08:21 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A013E14D6A3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 16:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D391730501B2
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 15:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA9A36C5BD;
	Tue, 17 Feb 2026 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="mBwY88iu"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-27.smtp.github.com (out-27.smtp.github.com [192.30.252.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087FC36CE09
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 15:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771340807; cv=none; b=CUqvVnmPKDjiOTPQn1AxH7krXrCduT98Z9TT/UL+PxYrLSrY+KWn2BcxvI0Dj/dKGSnLWSzIaHF9riCIeTKgY3456v+lpy/RcqBoCJiXMd8X8Wt8Y0CqBumCV/GxMUVex8FG1UcRpyLZhAdU3RobEWtXrKyjXLpDBN9JrBig6wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771340807; c=relaxed/simple;
	bh=j8rkUevZsUJZ/kqyc7XhRCrqp2SG91UNMKCrH2rd0RU=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=DWO7G97EmUNBGF9IQyE+Nk5Vcv1aUjckfcjRb0K+x8m8FrEycQcE19myXKcUngpatp5oWV8buWMbmBvk1H4P5jW4ATyyz+SfY2EU2kUoylKkShGP4CVJ9ndBOta2RmtS8A1KW1k7HhFHbtnhSDppyqlf7mHWMbOofQi7FU9IVdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=mBwY88iu; arc=none smtp.client-ip=192.30.252.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-7ad441a.ash1-iad.github.net [10.56.212.17])
	by smtp.github.com (Postfix) with ESMTPA id 196BE6004AF
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 07:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771340805;
	bh=4Z0IuRuviFDmF7PxT6Mptqv/VoagFz0ZxDFlW9d4maY=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=mBwY88iuRP6lzWQanUvWvbmBuRsULP2v9M++VupfzmI7jFjnoMX1SFCRFaGhdFYOK
	 AkukfuCAVGvkrEGN/ThFPD9Gxoh81KEm8uwlNnrQrhXqSbLdSXtO6uWwFmwzlafM+V
	 ZOF3TGi3czjZ6+CYiJcedX5uALmGf2j4xpOHWGKI=
Date: Tue, 17 Feb 2026 07:06:45 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1054617/25a493-000000@github.com>
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
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19117-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A013E14D6A3
X-Rspamd-Action: no action

  Branch: refs/heads/1054617
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

