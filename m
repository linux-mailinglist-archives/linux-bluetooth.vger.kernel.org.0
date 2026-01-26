Return-Path: <linux-bluetooth+bounces-18415-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHtYJp+qd2kZkAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18415-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 18:55:43 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 336658BCF3
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 18:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E62CF301C91C
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 17:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D023E34D4F3;
	Mon, 26 Jan 2026 17:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="DcRcopgH"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CFB34A790
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 17:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769450137; cv=none; b=fWx/W/YXhdL6/YoFzmDq72dsu6ZEPhxsTljz4cUIHSFcceaXCOwbsuspiTofm6Z5So37InCPOTWeNkGSELhcDhgwjUWKhJJ6Ab729Wv2RplfCkgs6tvSMT0wM8oLXkci0wy4p802+oVhKsfn4xbFNtWtjJXmvVfs4aNwarObqkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769450137; c=relaxed/simple;
	bh=0+vXhFz2I5SCZ4QeYp5yS7ChGZMzhaASNTIJCvSs0HQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=QojQbxeE4sN9XF81PQL2j7gu4qfQfuel5AKaESC3bqo6ZfHebOCQ7M2ANOCWoJopMEvfVnwp4An7QXB6PQGiG4+/QbQYvHPApNqWSEyVbV/KcOk9lkYwMfBhW88iuCfc7FvOtgk040sYgDLt+7Lwh8xhlPvwvk6XH/MfSi0Vjbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=DcRcopgH; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-915d32c.ac4-iad.github.net [10.52.184.41])
	by smtp.github.com (Postfix) with ESMTPA id 76C1E400AAA
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 09:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769450134;
	bh=XKs1JRwuJVT62pbftp1XLZ4bHBS0x8zl9AC0Lc6+mjk=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=DcRcopgHjpjLM0WXZzQshuWAjsTCjBf5zBiwTggmcDtay+Lk69QGK0n950Y8423Gn
	 Bp1TV5pnAGCCAm8vbx+sDpOBVeZRZMRvXW6nHLchtPrzQ27ySKRFNcXwFh9IvKCUrU
	 0yQLSyElo/yGH1YtmfbVO+L7lXfM0DPsi33nWW+w=
Date: Mon, 26 Jan 2026 09:55:34 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047149/618fd0-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-18415-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 336658BCF3
X-Rspamd-Action: no action

  Branch: refs/heads/1047149
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

