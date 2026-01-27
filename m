Return-Path: <linux-bluetooth+bounces-18563-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFdXIL4GeWlrugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18563-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:41:02 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BFB99419
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1FF5F3015848
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CF0327C18;
	Tue, 27 Jan 2026 18:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="GM155y4S"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B815233149
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769539259; cv=none; b=QlJyHJfL4Zv39b/VyjmcDLb8l5fVrkgf5NxeINhl984xCTxkFRlZTuOwevUzuaPW0pswJ3pBkwLHz6oTlADKKNBFvNhu26Lw1eZaRjXmJ+xL/AliSts8jezD+DaYHcEafwg2zmkfBB32eiCOz4k1PFkd5WtE4bKNIGHmpXQ/vdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769539259; c=relaxed/simple;
	bh=wdkE3DcHOjES4B0wF1lYY5+0ycHg9bgIpjlESY5y+ds=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=uVpgKVklM8sRX0ZW2c8ITIoTd7UM8TF3GHzbSvf9yTI9AXPdjhUz/u+6e6qyyvx5HmlSzY55Z9snwQoKsbW7ZSR4YrvIr1xXZOijZnKy6/MA+r67x8G+VIuqWcazrJE85Y6P7EZVWQrbeoCBJwHxFaB9kqBff6zM0K44KWjLP3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=GM155y4S; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-3df726f.va3-iad.github.net [10.48.171.21])
	by smtp.github.com (Postfix) with ESMTPA id A11E13C12B1
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 10:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769539257;
	bh=7IXl7GCrwtBlNE0xRUUC6d3hgfiQMZZSFN78Ekdu3j8=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=GM155y4Sh//hn9yCpqgyhGv4wlp6qlDYhSM62+/9qVNQ4do3EREVRgWdR1sx/C6cV
	 VcSUg2Z/8kqAmrH8oSuRIlgFgWD8DhoVL3zdCLgUjCucWpr5uWcWsXcDzwY+UfnQna
	 8nAiiNBzxwyJ/PZS7EGlfh6UlY5jXgxlEPpHOv24=
Date: Tue, 27 Jan 2026 10:40:57 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1047699/108554-000000@github.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18563-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19BFB99419
X-Rspamd-Action: no action

  Branch: refs/heads/1047699
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

