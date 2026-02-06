Return-Path: <linux-bluetooth+bounces-18850-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKlcGftqhmnwMwQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18850-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Feb 2026 23:28:11 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C2A103C71
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Feb 2026 23:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5423B300D0A4
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Feb 2026 22:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3C32FE598;
	Fri,  6 Feb 2026 22:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Zs+9/YYv"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F249223183F
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Feb 2026 22:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770416885; cv=none; b=sVzQ1WeTzG9a9G/jBc29M/4rSjrpja0LCTcqNuG3+zQzu8Pn2yZZkcBJlwLfM8OLKYKV8Rs2F3t2qdsO8FhRV1YbVlxCTJTD0d7p7odVzN0iWZ7FvtxeyYu7WpNywqgJZ4w2fINMzY1cEjWjR1QJqO6EmUD6lxTXc8CmGoyhCcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770416885; c=relaxed/simple;
	bh=4y48nxPPEPp69H+0w1iD7YdRpIbzA5z8HVSV7dtwO6Q=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=bf0Lhu2rXIIHASReUPHrrsizLJ7w5jsWbBrGj7LYnIqK2M1s2wlnHGhgdm9oHmZI3BjgvT9Se4yZqrhqP18Wbb/uj8E2RElw4PsAnVox6EdUnJNNaNt01hMOTXPOCubjb5cwxqBpSaXyqSv8oF/XizZcIk9+mHcxemszO+X6em0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Zs+9/YYv; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-2dc86fd.va3-iad.github.net [10.48.220.71])
	by smtp.github.com (Postfix) with ESMTPA id 252393C108B
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Feb 2026 14:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770416884;
	bh=DFMkevsp7jZfE7KvDy49RhPP26djIYAiBzriNYVZMlA=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Zs+9/YYvjXDiBnkwW15toMlBl4v0sKn/yjPLcUqvqkc/gCEzQO8IKj4/x5MLU/+8P
	 6Q+/JyzeRZQzvyAmQXd6k/vQGr++K5+dMOEQZMwF8MORub5NxwmfVAVCYq5w1lsOVl
	 HaNLTd91ClbMDjHZnlYd7Hgo+CUsDaUl54t0oh0A=
Date: Fri, 06 Feb 2026 14:28:04 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1051705/0b8cb3-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-18850-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5C2A103C71
X-Rspamd-Action: no action

  Branch: refs/heads/1051705
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

