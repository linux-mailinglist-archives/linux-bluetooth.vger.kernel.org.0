Return-Path: <linux-bluetooth+bounces-19478-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBEBMwG5oWkYwAQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19478-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 16:32:17 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2F31B9D48
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 16:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E598A3127770
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Feb 2026 15:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A45842B740;
	Fri, 27 Feb 2026 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="RJ0oRdBW"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377E12472A6
	for <linux-bluetooth@vger.kernel.org>; Fri, 27 Feb 2026 15:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205995; cv=none; b=dvHeLsq/blwxsqPNTZp8DS2T5BcfcaxAFqMf1Mzlpj9XgLjZHeHcWylyv7lNMdmvoFb9WuWkQQPoGp69scK0DqL/6MVOO09/wduJjTc8IPUa7+E41v2IUdfymXmhVe977qPodNz0IrTlANsuqnmSXWXWhhdIjnOLYd//nwqR/jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205995; c=relaxed/simple;
	bh=zma4D+DqbVpr76An8MgZE9Jbc8FKY6tRDeOfpyVfUQQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=bqrmIC/qleDrbu6MXeWTtIrVK4sTbIcaQxPHv+GWRALE7FEMPdlscXmj5nWVGqVYlOeZe5jFK93Jli4kY2LcP+IIJeB0uBtoOEhuIdhu+l9W3ohBZ7xs5UpOwk6jviJQxuvi1P0c88rUnD6tMI4XtCsLaAG2bn1FPrHWhcWgKaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=RJ0oRdBW; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-e034c63.va3-iad.github.net [10.48.13.18])
	by smtp.github.com (Postfix) with ESMTPA id 26A483C1385
	for <linux-bluetooth@vger.kernel.org>; Fri, 27 Feb 2026 07:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772205993;
	bh=PkNazDWTvoyXDqXhjAV/r/v9ah8f6nss5agrXcmQLcg=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=RJ0oRdBW3/nAi3vxaZMwee7o53LnXy9jI1uvB8OhEpPGBsMHZKhg/ksZQfqvezPmr
	 DpGz1ErTgkUl3u/CHhj4NHXSlIICSZqL5eHgyAyIQ3JHjUnbX0HBI7LdEMOcEtEo/F
	 W7fFQozSoCKDwR6nSAefoG0W9XLlAdgKsfe4psOY=
Date: Fri, 27 Feb 2026 07:26:33 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1058931/ee344c-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-19478-lists,linux-bluetooth=lfdr.de];
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
X-Rspamd-Queue-Id: 6B2F31B9D48
X-Rspamd-Action: no action

  Branch: refs/heads/1058931
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

