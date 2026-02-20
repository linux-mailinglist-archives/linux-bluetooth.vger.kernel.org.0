Return-Path: <linux-bluetooth+bounces-19250-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BpHHMSimGn0KQMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19250-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 19:07:00 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF9169F84
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 19:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8986D304BCFE
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 18:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE497366069;
	Fri, 20 Feb 2026 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="DFNJBgFr"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ECD2EDD52
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 18:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771610815; cv=none; b=G/Cx8c6KY+ufYLlmXNmTl1u+d37fe1OAmcBvcIsnc9tIi1bL+fJUXrGUBqgtXZr3P7yM97P9Musma7doT0FbxIIyeIAePoBby3NsQ0GYFuqrJ3b3/0y4DRHq/52v0cuDidsG+rJGDftzYOqGwzSw32T8bRKzJpvowsFGA0Z7kM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771610815; c=relaxed/simple;
	bh=kLwCJruNoHNk347IMrue9YqOaJO4eLprx8J0f7+K8oA=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=F8HPeiaZ46a5JInWVjGs6lcS1+UIwWJrli7agOCUKsjdWjJpL6xih/4CgSbLJajexEEahFjA1jg7RxClJClBy3hpHiJPZ14Lj5ZNIq7HWeWDGnk5i+Y8VaaFKNF6XyPvPPsfNzZUQlXqcZZE4ehzDFERg3d+nvX1SD7G8qw0owA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=DFNJBgFr; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-a8a5355.va3-iad.github.net [10.51.90.36])
	by smtp.github.com (Postfix) with ESMTPA id 9934F4E1209
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 10:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771610813;
	bh=0OmCVFSoVJ9X5ixx37mSl1NdYzEVkuNltI6TpVkzcnc=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=DFNJBgFrLo49i09w9EcF1cBkr69GoHNKkPzf19QDZI/QicunFeGp1lHC6v1f/2RI7
	 BfL/OWAeZ8ZL3xOpL5vULyTII5DB2hSdRWQKVkF4kgGGcfBLa8uj3CHP1BSJz9zk8Z
	 vzI/PBb7VqVckdkJd5QyvSo0bmbOZYUMjeZOhaAI=
Date: Fri, 20 Feb 2026 10:06:53 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1055603/353f08-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-19250-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2DF9169F84
X-Rspamd-Action: no action

  Branch: refs/heads/1055603
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

