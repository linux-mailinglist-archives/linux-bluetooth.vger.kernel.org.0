Return-Path: <linux-bluetooth+bounces-19893-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN5/AH4jq2n6aAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19893-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Mar 2026 19:57:02 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D02226E0E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Mar 2026 19:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4BF5A300E199
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Mar 2026 18:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409CA371056;
	Fri,  6 Mar 2026 18:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="c3eeo6et"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A603921F3
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Mar 2026 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772823416; cv=none; b=rfr5p9Dte1wT3agkTjH3pcnr8CK1Z5VvlyOiRuAaZ3wWynNZZz1+UE6BesrSbLxIK9WOaNgB/gI/eFLPxbisbJc5sw+OVnJAHKb7rySKzARIaFZGmIYG7uhipjw6qk00NmP0S7BJkE06tY7AVNSX1NxmtHsGU7MmqvYEJdSOFoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772823416; c=relaxed/simple;
	bh=179dERlEfxltrUigfiR3LCZh61/XMSLzK/jhplMHFkA=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=PGSudQLDzyLITLMIMv8d52/u4Jd2EJmnSZwAV9aQfsr+eSKPkQSuEYDQtv9oFkvYutf2/q/nc3B9iDzOUrmI4oxXdeuxacuEmVPi6QeJwomKTdc92SAgmBM9N0wj83q0FNI+Z4UVzWmPTPU3UHVEFDOx9V9juUFmesEd0An98Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=c3eeo6et; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-22b4aba.va3-iad.github.net [10.48.179.57])
	by smtp.github.com (Postfix) with ESMTPA id 111A81C11E7
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Mar 2026 10:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772823415;
	bh=qM5OMG8AobSv/Dc/F4+65FtlpbTzwwgqCkCwdGaRDu4=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=c3eeo6et59aFIEOLjWprVnePAaDXuIeB8+OBIJSJikXzqQ1mucq4wRzOjx9nPrQZJ
	 jMyWQ21RxvE1AW8i7Tk1VYcakyHPYOvAFFtTfuBI3Cv1NUfaYbHQL2YfyBfI8S1Mx4
	 Tr85xvcJZNGGK+0B3abGEsL+GuEhAfFxa9dWtANo=
Date: Fri, 06 Mar 2026 10:56:55 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1062730/9cabd8-000000@github.com>
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
X-Rspamd-Queue-Id: 53D02226E0E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19893-lists,linux-bluetooth=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_SPAM(0.00)[0.125];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

  Branch: refs/heads/1062730
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

