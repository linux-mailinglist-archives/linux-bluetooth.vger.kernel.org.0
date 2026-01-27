Return-Path: <linux-bluetooth+bounces-18567-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FEQNf0GeWlrugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18567-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:42:05 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C38E99472
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82D7F308C519
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2BB329368;
	Tue, 27 Jan 2026 18:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="CJMitvTU"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-26.smtp.github.com (out-26.smtp.github.com [192.30.252.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6135328B6D
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539265; cv=none; b=fRrQGR2cewQISqOlTzJmVbkYzcksZ7ODpVrrITxvIAN5I0p2gVR0AETw97LnxmED2mFU6ey7YcKILhpSNu7OYqKwRP4V2Yyv9Si5oNIbkiHYlr9XkiFdWWa5qT+9Qq3Wr5K72KXbVPv5OUqj5jlHqa4CZSH7Z1B3Zt6d7AY3DJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539265; c=relaxed/simple;
	bh=dcyhqVAi8khmacbJW10GaMkGQI2PRwaGery5R2MwpZ8=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=rnraC9j725fbDZSz91y85OSP5CqUVHPff7aKnsDFj1g5kp9/iiENwl1MbzFAgqg+vEpB7ScUeD56cQzPj5zWnMpI+DKv0Qhp35mBLBRYMSNa4I7TRbvVyZ2NmeLaKe3cY5CZZRX78WZkX8LikD8cYWzLKQZi++23KX29cEPmJsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=CJMitvTU; arc=none smtp.client-ip=192.30.252.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-5f624db.ash1-iad.github.net [10.56.209.106])
	by smtp.github.com (Postfix) with ESMTPA id 7BA786000E2
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 10:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769539262;
	bh=muH0dna6f6JQtcDHioBSgHvX/OCTTrS9trn/Z1aBAPc=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=CJMitvTUMye7nRAjAWzwEE896lIKClkithCRweIDytfU3D2HPEw31Z/D0y1cE96IY
	 PFjmB/jC4j1NiulDt/Ih9DgS1RkIyOKcYOE1EwBttj+PCyju2oxQgNHVbRstK0kME1
	 EzgSkpr0NDbov1E3iF3WFgeldK0PxvTInJw0mcT4=
Date: Tue, 27 Jan 2026 10:41:02 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047695/0ba82d-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-18567-lists,linux-bluetooth=lfdr.de];
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
X-Rspamd-Queue-Id: 9C38E99472
X-Rspamd-Action: no action

  Branch: refs/heads/1047695
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

