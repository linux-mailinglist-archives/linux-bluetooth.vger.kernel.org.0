Return-Path: <linux-bluetooth+bounces-19534-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xEGRITeBo2keFgUAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19534-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sun, 01 Mar 2026 00:58:47 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAF41C9C48
	for <lists+linux-bluetooth@lfdr.de>; Sun, 01 Mar 2026 00:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEE16302337C
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 Feb 2026 23:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E4839527D;
	Sat, 28 Feb 2026 23:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="lOtn/+gn"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-23.smtp.github.com (out-23.smtp.github.com [192.30.252.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBAF430B85
	for <linux-bluetooth@vger.kernel.org>; Sat, 28 Feb 2026 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772323121; cv=none; b=vADa/QhTC8xtpDW+bDJKhh8yYkmlSEBLEzI9oeb4rzcVueDl8nWzj7kG5HqMsCiejUXkah5B76Rl8BPTkNBNl6SGaiSVQALPPyxbxABxVgoRASItUfxr9OzEQdkI5WgNKQVAX7r/apB6pIbm/r6fBegA3R6cDPI5LkpqhFuTqMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772323121; c=relaxed/simple;
	bh=uDnbn+9w+oXxLqgaBcsb1gydanj0LvzOfuTJOQFufgQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=s9dcbHh/nQR+W/oOOtSyT+J15haYiNXguqb3eXbM1sOQkXwHDkBvyh60RbsxHw0VhCdiLyVvZCeuIjrOZJ5qMBkrUBY9Oc0QuSTYez7ihtgwUTOhfJl/LOkxWrViMiBXfeRiRImL4k2gzbWH2hfsI9ip58pzsaaHaesbqW2vcWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=lOtn/+gn; arc=none smtp.client-ip=192.30.252.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-bb63c76.ac4-iad.github.net [10.52.220.24])
	by smtp.github.com (Postfix) with ESMTPA id 03E7820521
	for <linux-bluetooth@vger.kernel.org>; Sat, 28 Feb 2026 15:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772323120;
	bh=O8lWI6+JHuOnW0n64I8jCmZxF3Etqv+OKVQPZVLq9HM=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=lOtn/+gnpacA+1gIgw8ZDSs+rGthg242eQ5cEh64CHc5xB5euVYLbahQqD48l8jHW
	 RFS+tBwZbqGdVFWeDsYORDfvKCrieL7dn19hQn+ZT+r3BmGmPhSHP7ACa/QsmKUHLC
	 QRRFr/RwPqn8NoXLSKPJ52nOpAqBhc56kWRKxUlU=
Date: Sat, 28 Feb 2026 15:58:40 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1048745/b5d9f1-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19534-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EEAF41C9C48
X-Rspamd-Action: no action

  Branch: refs/heads/1048745
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

