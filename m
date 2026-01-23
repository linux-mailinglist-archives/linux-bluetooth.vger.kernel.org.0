Return-Path: <linux-bluetooth+bounces-18351-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOSrJDwgc2ngsQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18351-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 08:16:12 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B44718C1
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 08:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C40943005AA1
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 07:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D43364036;
	Fri, 23 Jan 2026 07:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="hCXw7i12"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EAF366827
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 07:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152567; cv=none; b=petgze4/JpBnxRuwjfMUstCjYfC9AxqGkTXQ2zjSQZvwkuIJ1KKGUjRZ+vQbGJB2BeaWJozYKUcMFImATumIeOJ7ytqqcxFb6Wdlw/WkxZEajys11K8cMJFmEVR7GIFFi/Lp5K9E6gFjd6Cczv9FxCBFuQm+AwvCRNmHN7Ogn38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152567; c=relaxed/simple;
	bh=ypmbjqKJE2UIoiGT24wObwCALhY7vnllBBCNUAFs+wY=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=CoXh4rzKjAkrEhgJj/XPUEapKg3dgxE0cyD26mTKWzwZleWG29sDt/LHVLxYTwKTts3o/qun0dIQcoUrIX293w8KZBmuWRAVNai6kpBJwoySBs25Bj+1MBMwlgRiUni0arszZ4REKYi9xuCYQm8F6CxEB5itLzbYeCR1jNAk8Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=hCXw7i12; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-b9b6490.va3-iad.github.net [10.48.15.40])
	by smtp.github.com (Postfix) with ESMTPA id 41CC54E03E1
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 23:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769152561;
	bh=KsQ5jCAZIIOzpeq3zje+f0IU8kiUcboK9TqSZheYPY0=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=hCXw7i12AYHo0iA0Oepvbec5Wdwzx5as9UFJG7SmWiL3SnQ5WulQoSLi2Xe7VfuOk
	 4P//XbOJQhBD3fnZb6LEIYajuO991qmW0mTxhHZTkiYF7SdvRiFV7MT2SkBIFQJNWx
	 q+ewjthTPEB+Eu7juNUeqRQwIKKF2Z7w3qif6EvA=
Date: Thu, 22 Jan 2026 23:16:01 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1036285/15a776-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18351-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 41B44718C1
X-Rspamd-Action: no action

  Branch: refs/heads/1036285
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

