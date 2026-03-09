Return-Path: <linux-bluetooth+bounces-19949-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4En3H1TVrmlhJAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19949-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 15:12:36 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D65B123A51A
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 15:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E946D300A674
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Mar 2026 14:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B05F3CF67F;
	Mon,  9 Mar 2026 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="ZFlbga8j"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-22.smtp.github.com (out-22.smtp.github.com [192.30.252.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9873D1CD2
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2026 14:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065544; cv=none; b=QlFyqWu8TVAbejJAOj6bcSUbt6RMRSUMX6s73cM9YQVeXX0c662UWR+9F3RGQ3e1uhRsVypIlo5PbKsHP/Y2LYjebDHZIdE42pLLEZm+NOSbmW+AEFcb2pJKcD0nlWHzbkJH5gzVMjudQaqDeHsOc97pFA7V7Uy6e7OTAu51EP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065544; c=relaxed/simple;
	bh=yvzgyamwWLxPogFqduFJ+7AEvuyyg5jwgsQiXC5fSmM=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=lNU/Q4wy5watOsBgS7mEfVXDLvy0SBtMLOTQxA1Y4lmzJPIIU7s8I7GWaDMDbjkCk/n16Tuhf+ssvwVZotEl6bjcoZVxNK9Sz6IlV7MvwR3k7yuFpBapt1FvIC9Uw4v9mdT0sPer1tfOMgOaI4apv6ay2oX3R3E+SZem39jeG48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=ZFlbga8j; arc=none smtp.client-ip=192.30.252.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-32b210d.ac4-iad.github.net [10.52.81.31])
	by smtp.github.com (Postfix) with ESMTPA id E8FB521079
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2026 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1773065542;
	bh=8TteeGXqwTimgCjRdk1eXGnhd95EhhMqiURcrIIXHfk=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=ZFlbga8jJIYNxSlD543d5XcqXoGUqctDC2EBXqUKXNUxrdLAAC2av872wXRtXgsqW
	 Kqbu4X+6af8V1qDsUB6Ya+J2/NdtXAqLClLkE3aEr5QWqrwxjchRPqbrJcOPilePPB
	 pjZM0EQLNOPZppDSSV7IZoIBqr1ltO8WIAUXw7j0=
Date: Mon, 09 Mar 2026 07:12:22 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1063601/b83b48-000000@github.com>
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
X-Rspamd-Queue-Id: D65B123A51A
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
	TAGGED_FROM(0.00)[bounces-19949-lists,linux-bluetooth=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_SPAM(0.00)[0.138];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

  Branch: refs/heads/1063601
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

