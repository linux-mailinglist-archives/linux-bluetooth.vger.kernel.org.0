Return-Path: <linux-bluetooth+bounces-19258-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oWrLEP7ImGl7MQMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19258-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 21:50:06 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A172D16AC31
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 21:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E5EC30055D8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 20:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE306309EFC;
	Fri, 20 Feb 2026 20:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="fTwYkk8B"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-18.smtp.github.com (out-18.smtp.github.com [192.30.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA9303C8A
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 20:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771620599; cv=none; b=r/aY/GmAzLeu1dYok9nQqo82Gaoa/vo/cm0+cepbEXx9HBeVfwKwXn/oJnI/eMmpd1e20/NcKtRjdwTvO+f7+tcji8qalMS3NivMmd18lTZMewBdtkqVuXIEBvesRAbzULBXCdBjkEmDaaPkH8iMOWO/hW8XD/lohWCuToRKJxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771620599; c=relaxed/simple;
	bh=4rHPVFA23lpLnjEmxxKDR8I9UvvhM3IX2R7A3Lb4JZI=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=kE8iuiPO9KkPqi45Q3iW06CoreJ9M4hEvmPUurPpqyFGbMPtVaghdWyBPiUVSXJYPgEMM1C0Pv7P7qeoQaD/N+SCPikog/zyOlf78x4rYvDBoJ2YsdH4wC20AMi06BF0ia69Dn2h0AZgAZbXs2oQkm5F/0zf6MYl1gB/jFAXapA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=fTwYkk8B; arc=none smtp.client-ip=192.30.252.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-99ad113.va3-iad.github.net [10.48.174.59])
	by smtp.github.com (Postfix) with ESMTPA id 9EC0FE0AA3
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 12:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771620597;
	bh=tJP8iQr26MOEGR97xCAW2Xk7pj0In0MyVUKEdecRRCM=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=fTwYkk8BpsahyY9a6AYF0DoRlhSQuNFflcLn/iV4EoksOGOXbeZXcGtDIWRLO31s4
	 URPlRPXJ30DCv5MqnFV+wj3VjKqy7/GuvlfTMlk4i3f8V7Y9gcILcYMKVI5LKvgb3M
	 kTCkwBuMQcOP1YeGHHOF+1qzI63boXzP/A0BanwE=
Date: Fri, 20 Feb 2026 12:49:57 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1055976/96a318-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-19258-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A172D16AC31
X-Rspamd-Action: no action

  Branch: refs/heads/1055976
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

