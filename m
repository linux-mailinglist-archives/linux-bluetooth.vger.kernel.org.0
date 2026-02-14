Return-Path: <linux-bluetooth+bounces-19051-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qsX1FSWOkGkZbQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19051-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Feb 2026 16:00:53 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C974713C400
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Feb 2026 16:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DBE03020D41
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Feb 2026 15:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3393723C8AE;
	Sat, 14 Feb 2026 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="DLPVlRpo"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-19.smtp.github.com (out-19.smtp.github.com [192.30.252.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08ED2571B8
	for <linux-bluetooth@vger.kernel.org>; Sat, 14 Feb 2026 15:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771081248; cv=none; b=kxwGy4y67t+rOv6OzNgmtnDg/IKHCfW5Falcs55hMV2OVbi8jUjfcBR9MWDCMjRGpslRPI0aqU8AuN5ZV0XufbTdogV2INsN053X+0o9p2r9ORWehY0884Yg7HbNswmI3f8rD5MVLTdJFeCvfPT44oMQwFO7WPOv8J8oDOIE/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771081248; c=relaxed/simple;
	bh=ggOHoTZg/h1B9FMaDAgTa5lGRmgI+bJR5cWOcXzpNd0=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=G2tZTVzSyemyRk/OSl3tlHpi86DDkA0YouEpYJxXATHKuuRizdo2bTuGWVQ8NXFZI8w6wpjzCZH733MWYMsanweVfy3UaHYPIdmTGVux3WuGdS8IrfBcp2rfawTGsHQA1nvpkCFExBTHOMAxBV3dDtEAILJOY/SafXEFWwJniFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=DLPVlRpo; arc=none smtp.client-ip=192.30.252.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-9c7194b.va3-iad.github.net [10.48.15.13])
	by smtp.github.com (Postfix) with ESMTPA id 19F7DE082A
	for <linux-bluetooth@vger.kernel.org>; Sat, 14 Feb 2026 07:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771081247;
	bh=OpSqSwQcdA5YH73Ly0mYHiXumrv/p13KXGbOlpwi5s4=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=DLPVlRpoUhxfnFzXAQyE6tES5Cq7A2oacbpzRF+aKoZG7QXBAWT0Uq6Ms6s1U6JDn
	 kF8JitG+ERaHiwV+eIgLlPrBB1PlQSBr+RCP3W5kRzkMc+Be4BQbEuLbY4UbJ/rKRM
	 9Lku7wtBuf+053VogAicDzuQItV37zAQlwFMc5F0=
Date: Sat, 14 Feb 2026 07:00:47 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1042856/1e15ef-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19051-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C974713C400
X-Rspamd-Action: no action

  Branch: refs/heads/1042856
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

