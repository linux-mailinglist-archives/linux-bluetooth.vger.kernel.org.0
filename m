Return-Path: <linux-bluetooth+bounces-18658-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EL0KDxWUe2nOGAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18658-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 18:08:37 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC13B2A6E
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 18:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 398B730136A7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 17:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B24A34251D;
	Thu, 29 Jan 2026 17:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="L779++uw"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F5E23D7FB
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 17:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769706360; cv=none; b=q4Dt+T/Mbkr1oD7ULKIdapjZJoPpsAvLoto3h8m+Sx+KisP+Xzbc9sfG5JavjSfRIGuBHa4bzV5CQM6yNR564Nk6NMamLKg7kC0+5o6r5brLX/Z/H6LLT1ihA9bZ7mH67cqBa7btztu6M8PxtnVP6uezX/MC3ZptB62auTThYus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769706360; c=relaxed/simple;
	bh=V9cuWOwKfblZBnmQFp0O4osau8mevC/sSfZFJfcVG0k=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=bNd3UnXDO5LZKRkSGRfEIj+l025RYeXjQAxPkx6RaVzAbKUJJl/ROhfufXMCczG9QOHQgBv72mUZSqBUSQoTAMMKjYt0ZZOXJWhkYt5BOVT2PHXIiJ9oWP17342q8Qrm3pvCEokkMErJKk8exuCFE1+Bt4fLX9xS+rlZxlsLauc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=L779++uw; arc=none smtp.client-ip=192.30.252.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-e1bf046.ash1-iad.github.net [10.56.195.33])
	by smtp.github.com (Postfix) with ESMTPA id EAA3214133B
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 09:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769706359;
	bh=NaP0gvsfAM9ON7RVfbeWi8Rlz9CQqBz0mvI5aK8iFNg=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=L779++uwYnFzr+9iahM/Xwj1yuBZhYcTZnF75Dvss0TQP7AH3gd1i/YQ1kEwk2ahc
	 4l7njFp8uHNxhrsN+3BfMWr25r4rXwKNHYpWjnYaUC6+Gwu5GbwPcj00dOpzeekp+Y
	 8wVZQiVshD59nLqbauml06fZYm0lOr11qJ4ft+As=
Date: Thu, 29 Jan 2026 09:05:58 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1048593/58b07f-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	TAGGED_FROM(0.00)[bounces-18658-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: BBC13B2A6E
X-Rspamd-Action: no action

  Branch: refs/heads/1048593
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

