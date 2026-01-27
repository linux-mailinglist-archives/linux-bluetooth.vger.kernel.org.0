Return-Path: <linux-bluetooth+bounces-18570-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN2EBwkHeWlrugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18570-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:42:17 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E0599487
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4E3B3096995
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9066F328B72;
	Tue, 27 Jan 2026 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="GxOLda9m"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00CA279907
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539272; cv=none; b=nP4GpoQScRo8Hay4A8u1GcRghxKMdRzE0CJFsVvWc20d9KAfI5zSu6RGflhEQlqMObQ8pZ8Rvb53WqM+UchlE/najxIdoyKR63LBuzZv9iIQYd4hI1a0HrV6sV2RjDWEcHPsDpJo8INDa/wxR9uOwnpsRkltL2Hll+dGXQb4Eg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539272; c=relaxed/simple;
	bh=6XA5553opCpq/zOrePt3oYXIkYCXKuvoAhyNtl9q6p0=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=ZDoeN7sJzA0ciAfipa/FiXzZOR5ZKY+S5+M2zj56xoK5vEhaaNyt3VhP3c44xsa+NLJhs2FAQo+rcaNrDZsWkYIrlYW0zC6djUDZX4vHqp2XdgKGsdz2BsDCvg/r4paalVLf9LsyqC4ZFZZhub1u5INe3/UVSUKHWSNHsoENElM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=GxOLda9m; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-93f4b09.va3-iad.github.net [10.48.204.60])
	by smtp.github.com (Postfix) with ESMTPA id E222D3C10DC
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 10:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769539267;
	bh=8sWGTMz5jwQG3Wpmil5llj7turhKJgTAfzAxSruDOPA=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=GxOLda9m98lZgo8RPlieL69UU3lpVA5QxtGXrCrnBUDdb/F2ITFRUELoYrP92OQNH
	 VIjyNpmCWsf96etvxgl66BwCZ/FZSpoPXJizf3hxlyDP/JozDgcd14kxohInyvjA9r
	 P928MLCtmLfYKrSlIVSuTbWsZy4u9fedr4zJ6i6s=
Date: Tue, 27 Jan 2026 10:41:07 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047690/0dc1f3-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-18570-lists,linux-bluetooth=lfdr.de];
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
X-Rspamd-Queue-Id: E6E0599487
X-Rspamd-Action: no action

  Branch: refs/heads/1047690
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

