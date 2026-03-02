Return-Path: <linux-bluetooth+bounces-19589-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMfWFJqepWmuCAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19589-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Mar 2026 15:28:42 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2411E1DAC7F
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Mar 2026 15:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8EA3030000B0
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Mar 2026 14:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C763FD14B;
	Mon,  2 Mar 2026 14:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="TRor/Y2B"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCFB3FD13E
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Mar 2026 14:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461669; cv=none; b=BVMXUmHHxKmS9lNy1sLhlyYQ4rOarA+yHV/VgfuECqfVASHLikscVkc6pfq5cUmo40c0eAq72lJjULL1YTBUyc+i7QlXM3jWijWI90W4rJT1b6YmRRXaZ0975SMMe85+YilwnRv5VWKB7+tsyyfSpktyAFfO+xKv0C7Icfedeaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461669; c=relaxed/simple;
	bh=cX4QU2fcxKvQvLXVh87gTPMfOiPzxj2k+uBzSUBcOcI=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=nV4B1QYrg5g5QlmWwZmgBrj6QNRFWOIiDhj05012Gs8mmUTG383k2bVtorIQEEb+dlLz+upwrsuXYhqnPt73rL/mEvGbQTWFpbXC4Hh6KWMG0X0I9DWUZELcjMAyoZlMWfthlnPV0u8VX8Za9lAetOPvYm2jWLl/L88CBC+F16E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=TRor/Y2B; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-be2deb6.va3-iad.github.net [10.48.15.62])
	by smtp.github.com (Postfix) with ESMTPA id 5026E3C120A
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Mar 2026 06:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772461667;
	bh=iJinqkuRz/bk72UGsxZ7d33VqPzfanGfBh4tn89s8iM=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=TRor/Y2BvV85jp/kE7YzogQQ2wtjUV0k7ABMz9k3ZojkRRte2yKbKH2QdN2geVtd9
	 oYyiqEbCG2zWSRUMrYcpYInlQ+sgY8bjh39h6V/eKt0ZDXMgIu7Zi+qGjOsi7yGiOf
	 UoIWKpkQSbVGTr0ZYLr63vbkuygrO/H8p+W+sMEg=
Date: Mon, 02 Mar 2026 06:27:47 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1059103/8b909d-000000@github.com>
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
X-Rspamd-Queue-Id: 2411E1DAC7F
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
	TAGGED_FROM(0.00)[bounces-19589-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

  Branch: refs/heads/1059103
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

