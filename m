Return-Path: <linux-bluetooth+bounces-19180-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOMmLOBDl2kiwQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19180-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 18:09:52 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA3F160F60
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 18:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9F9130101DC
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 17:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D07930E0F1;
	Thu, 19 Feb 2026 17:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="i7SfgTSv"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DEB2C1589
	for <linux-bluetooth@vger.kernel.org>; Thu, 19 Feb 2026 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520990; cv=none; b=GAY1wZc523rYjuqW83iEK5+sM9cGIrxSsi1UOJXeNge1DB5xAPztVvy3Jnwicfo0HuZNnSM7xStS1FOJhnxIvAJO5t0iXIpyLr74svQJiKkrxL140Gfs2Qq/IsKkZAP+rRpEClBe8arjSN1m1VW/xXAD+Xd/zH0eWnC7eeadEq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520990; c=relaxed/simple;
	bh=CBrTiuKCYxhZIpD+zUHDpDEq+dZVOYDpS3ay6kpXkYo=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=eyh14IjWYsAT7rcBWhAot0LYXzisEdbDBiZXXQCyM0agoaA7pbLvEeHpnHx5gSCfVvM1JDU/Lrv5pP2tUglOCxPtcoG0XA/vz3hnYCo9b0kKc5YBkLyS8lO1TPHeJs5OyTmUGDcjW7ilgdhbRosVCobSR+Ei/Cq9LzeiQQGrCI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=i7SfgTSv; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-67e9ede.ac4-iad.github.net [10.52.178.45])
	by smtp.github.com (Postfix) with ESMTPA id DCFFD40136A
	for <linux-bluetooth@vger.kernel.org>; Thu, 19 Feb 2026 09:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771520988;
	bh=WJBbemKfMiA33FsBeuCa2+oU+eBxgeecLRsGckMbr18=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=i7SfgTSvvtM1cBz+/c4mzX4czP3+r+8XGnsRGajTSI31KP7HoP5+vk8hPDChho1jR
	 eRXb4v5NNM322z4ERfkKEjRqBgdj0E8lA/VEo8ohOPgsOb3RiRPiKcmbsCRO462QCj
	 muhSHzwfUaehDOb0XIR5a6b7eJ6TU0K50/v5FHQE=
Date: Thu, 19 Feb 2026 09:09:48 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1055296/d2476b-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19180-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5CA3F160F60
X-Rspamd-Action: no action

  Branch: refs/heads/1055296
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

