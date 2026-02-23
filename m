Return-Path: <linux-bluetooth+bounces-19298-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE1zGj3BnGmgKAQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19298-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 22:06:05 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C0817D5A7
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 22:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 511183001CEC
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 20:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37F7376463;
	Mon, 23 Feb 2026 20:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="msmypxW/"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-22.smtp.github.com (out-22.smtp.github.com [192.30.252.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEDA3783BB
	for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 20:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771880114; cv=none; b=VH6gBSpAd4iXY7ZRGnSqlrvLG5zF8KVkZ0BrGxuWIUoBlt4cx6iskDKTJQkGvymj0D8DQysMketRyOi8CEZGmGucTPT0cgbO4Ljt1U1XVE1h6kGuAgcjm5fIYxGEw6wySTHGVDIGR0PFKWf4BlpgvCANDrHG5aAseBgXiIF8Ahk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771880114; c=relaxed/simple;
	bh=Pf8et/PYUYHVg2Re0f3Y/V9JmU3srt4F0C2ts/pAqtQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=g0khOVduQNNFrFoBl+IksI0bID7A+hzONXoJDCHSNISh9JxN7KP9YCGW/KPZEFjDWk1npxUqoS5LGNCGfLa5OjlXZRLTpNRh4Z92imBCmoRxbFKjau9ExGgoZCao9z/3UmwmONUx8BxUTUgGVvr2eucERVp2KPdGxBibw+LK3z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=msmypxW/; arc=none smtp.client-ip=192.30.252.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-0b721df.ac4-iad.github.net [10.52.202.91])
	by smtp.github.com (Postfix) with ESMTPA id 5904E208AE
	for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 12:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771880112;
	bh=BI3PPI9plfKHJ4sbe2do1krrvehyjKXFQeCx++OT9Yc=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=msmypxW/dSGXJUfT7xrvHxQrgxbLg3DyHKaQNVBDnZB80RhpzoDh1GbPZLi/cMTlA
	 HHiOB6O9hyR+xUAeQTL/EuleOhzw9O6VO9pBC6vUI8djKvBofjKV4sK2Gg+bfz88Os
	 Se/XJTazUlOko3hi/8Zdrjc8V5FNRtObNitkiD9o=
Date: Mon, 23 Feb 2026 12:55:12 -0800
From: fdanis-oss <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1056772/000000-054e7e@github.com>
Subject: [bluez/bluez] 054e7e: client/btpclient: Move BTP definitions per
 service
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19298-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 79C0817D5A7
X-Rspamd-Action: no action

  Branch: refs/heads/1056772
  Home:   https://github.com/bluez/bluez
  Commit: 054e7ead40b1341650a8ff86e45019609a9ac43a
      https://github.com/bluez/bluez/commit/054e7ead40b1341650a8ff86e4501=
9609a9ac43a
  Author: Fr=C3=A9d=C3=A9ric Danis <frederic.danis@collabora.com>
  Date:   2026-02-23 (Mon, 23 Feb 2026)

  Changed paths:
    M Makefile.tools
    A client/btpclient/btp/core.h
    A client/btpclient/btp/gap.h
    M client/btpclient/btpclient.c
    M client/btpclient/btpclientctl.c
    M client/btpclient/core.c
    M client/btpclient/gap.c
    A client/btpclient/services.h
    M src/shared/btp.h

  Log Message:
  -----------
  client/btpclient: Move BTP definitions per service

Over the years, BTP interface has grown way over what has been
initially anticipated in terms of number of services and commands.

To simplify addition and maintenance of new services this commit
split the commands in btp.h per services and move them under
client/btpclient/btp folder.



To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

