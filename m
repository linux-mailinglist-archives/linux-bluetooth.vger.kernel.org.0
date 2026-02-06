Return-Path: <linux-bluetooth+bounces-18838-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uH6oB/WuhWkRFAQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18838-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Feb 2026 10:05:57 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E9CFBCB3
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Feb 2026 10:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F69D3024A0D
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Feb 2026 09:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB753557EA;
	Fri,  6 Feb 2026 09:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="g6Cyk9Xm"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23959279DB6
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Feb 2026 09:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770368754; cv=none; b=KyJ85HQNGG7sI+Jf3d2mF3WnQw0wdBvCZ9uBZ4gx8YYabX6IJyaIdk5yp6Yn6ov6S/UDg+VPGC2yKzBpAHsBo3eNt4JBkhLgK44B2TsLxdbhIKuIHNM78XwBdXo0/2DpAHJwB63XAjs+Uas3tqQj7xVrbGRgUDTBYf6fSdoa8g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770368754; c=relaxed/simple;
	bh=E+QbVJF7IWJ7Wd2u3EGeHkclrwe56wizSI/4wkREck8=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=XU0ijG4bvPgt2ZO6enPML/EfQrLgYhjOGL7tyVHHAJrBE7vukvtPgAvrrUggINPO6wWcRCWiZOeQlJiEn6yhIDjryssF0kYLQxS4STBrUNrih8MYUC1XpUGukWv5B4/KBoRr0jTZgCIWXVCn6ai6ecILx5xmYUWxw8isrbXlDxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=g6Cyk9Xm; arc=none smtp.client-ip=192.30.252.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-d35ecd1.ash1-iad.github.net [10.56.153.29])
	by smtp.github.com (Postfix) with ESMTPA id 4CE8914125B
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Feb 2026 01:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770368753;
	bh=TgUjtu0EAeROfkREZcw/9vW03ZakXeSHqchLB4qhdmQ=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=g6Cyk9Xmoqi6Ob/Gy19sJxSkp3Vx2sGxwpsVlUVdljZzYDLdoJpPzK24kzMGhiSQq
	 6onf8GmFXRExzH9mFtf7RrRqbejBBiz7nBiLrtvpIKAJFroz0iRFiEHh+fFpBmNHXj
	 uFgKZcftqFOdKU98saP5XmHN7oqoBUzYLvuowGSE=
Date: Fri, 06 Feb 2026 01:05:53 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1039291/31b82c-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18838-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A5E9CFBCB3
X-Rspamd-Action: no action

  Branch: refs/heads/1039291
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

