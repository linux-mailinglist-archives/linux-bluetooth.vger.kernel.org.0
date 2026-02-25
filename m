Return-Path: <linux-bluetooth+bounces-19421-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BHFDS88n2kiZgQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19421-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 19:15:11 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 941AB19C199
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 19:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 38127301429F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 18:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2143F3D3008;
	Wed, 25 Feb 2026 18:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="FYKqgX8h"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81573D905A
	for <linux-bluetooth@vger.kernel.org>; Wed, 25 Feb 2026 18:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043304; cv=none; b=l2e3t8zYdZMLozTsqSFCzLGcZHMznBfxzyQwSAfi8s9P3NHSlVCihfojza87rZi7SN/ZmVSdh5T/SStR9e1b1DfkKqDEVGi9fxYwhCLgg+s6+ATkJJMCHsYdkdfj5DpXGqBgcEKfcqxKNFzGYJBiF8MER9IEZEbtvMAwTXatbCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043304; c=relaxed/simple;
	bh=2yjyZBHF5PclZRMTlSaThNe4UdpluR4k2LBt+PeAX9k=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=N4qerGPBsMVKkZPEbQcWTRYCSCYNSnr6C4yu84+Leb/PS066oyahKt2e6ZwtFXa7tMKUsHPn6t02ePnUPpqBmAJ59gHOI0Ct2omCriio0L7StgYEaQmBrwtTXPwP9ZKmEfLWOOCn+hcLOD7TNitTYkdis7DWSxMyWG0rWMLYVNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=FYKqgX8h; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-e26c9e1.va3-iad.github.net [10.48.162.15])
	by smtp.github.com (Postfix) with ESMTPA id BCC9B4E0CFB
	for <linux-bluetooth@vger.kernel.org>; Wed, 25 Feb 2026 10:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772043302;
	bh=nC78qiRfeTOgLdmEhDuEhGhffMSREr3KQBHd+SZAXCs=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=FYKqgX8hrl10QUSdC3SvzcC4oXibEZb17BakW+r/J/6asPZ3JOZ7Y/uo47Ad0SXSh
	 GUy8gue0kRyH+xeGbSCMUKrD44gc0iNc/EjoymfLf2o+WnxgHbXxSZ9l2lcfv647a6
	 3LEuvoz+FQroKFz8njYMcxyn4sKi4y8ADYm621Lo=
Date: Wed, 25 Feb 2026 10:15:02 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1057371/9bfb0b-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19421-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 941AB19C199
X-Rspamd-Action: no action

  Branch: refs/heads/1057371
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

