Return-Path: <linux-bluetooth+bounces-18659-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKxJDX2Te2nOGAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18659-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 18:06:05 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0170B2A02
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 18:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97CC93014C4B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 17:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6198A3168E8;
	Thu, 29 Jan 2026 17:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="ld6pe8gk"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-23.smtp.github.com (out-23.smtp.github.com [192.30.252.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4026345CC6
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 17:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769706362; cv=none; b=QyovNzwthJDtLyQu7hA3fz+SGhBCxwMJQAZOp9H+oPOu53rKOeH5PfeFN3SklaG3Iw+aUPWq/iq+UH89nftI76BMqHpjbcxAX/L4pSGwGfv2SH+L8qs2ueCMRyTeTJGEY2ZEDQPUPQvuBOhhgULmoATBzIpPAvv+6k+f/6dgjpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769706362; c=relaxed/simple;
	bh=X+jMuoI1yHM0jXdVUKRkp1tMNPU1QGfFRAQGgHPgmSs=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=jNSeKKz9sjC6idHOQ52r4xTb89piXUFEx12ctL11hg3rH5eDtefmfw9veZw5RO+k/OA41jmUPsSkZRX+ORJ7FmI11d9H1BO4sA9I5VjPxlPj0EmOM/W965mrU0JTOMz5rVXMgYQc+YsDnRgnuqrcCL7EStaDPnpYXKD6TxlAElQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=ld6pe8gk; arc=none smtp.client-ip=192.30.252.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-fce1076.ac4-iad.github.net [10.52.161.36])
	by smtp.github.com (Postfix) with ESMTPA id D891A214B3
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 09:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769706360;
	bh=Up0JnSggec9Ztj/s/QrlGQT75IHXy0812bAeYTO1EAk=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=ld6pe8gkE2EpYR+y+qmxgQpMBYGRk3oGe/uMeOAoWOsokSH7sc0udIP+k0Bycsz/i
	 Zy4fpShtCzN7jjkKU1HXdie8aerEMZcIS8YVcG0794tgly5la4Z5eAKIJ6V9MGkzqo
	 jVmXCQKucSzpjE0bXUR9DaVlKbtvg1+IM+njU598=
Date: Thu, 29 Jan 2026 09:06:00 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1048529/a78f42-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-18659-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E0170B2A02
X-Rspamd-Action: no action

  Branch: refs/heads/1048529
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

