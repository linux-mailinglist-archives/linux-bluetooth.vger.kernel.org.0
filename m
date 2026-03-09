Return-Path: <linux-bluetooth+bounces-19940-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M8YLsu2rmnMIAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19940-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 13:02:19 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC102385E5
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 13:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 968BC3016812
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Mar 2026 12:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8003C36BCE6;
	Mon,  9 Mar 2026 12:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="NIPW7L7Y"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3A9393DC7
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2026 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057736; cv=none; b=S4ck1OQWh7DhUanuMK6MqtmHKvNHbQt/FNoq70QjFzsQTGGPKRIN0A948Ge6zX/cJvUZqkE9ECjYSdQItwBPqoFnqBbRfu0apE0kZ5mc5GyQ63XbB0TsNhw2qRA6vI3Ar5xF4XAkoqjbs/xO6xg4r7mbH5/IRMYv8+JTBY5o/dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057736; c=relaxed/simple;
	bh=rHnwF+LZ9lJOfP9SZnvUNPkZ50m6CM1ElGV5YO5m/nQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=T8thrFhjUvDH22XmG8lDfJ6DFqasKMRtqZF7CEQB+hb0picDBlcn8efgWrDk5E3NKUP9UKE/5rzJ7jh2Fs0YBFJs553UbM+1U3+vP4AFYgLTAjk2yLNM3CHklMmwu4bx5NqnGk1Kuv4i+JAcSbZTogNDoXvtIGJ9NSfKteGC9gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=NIPW7L7Y; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-e3a8c57.ac4-iad.github.net [10.52.178.31])
	by smtp.github.com (Postfix) with ESMTPA id 5E4D4401233
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2026 05:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1773057734;
	bh=7Ll8dBRLpttFCZXPTNTWK9I2iV+S9qsspDob2LjUJxc=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=NIPW7L7YsqppuPNKbGqTlcPamuj/BP8NDn8EviVClISPAsSWLVUcQkkiigiWu+aX1
	 SjTzwW0EX9DoWTKuRbLEcdMm9bzASpEvye/WDGEftAunDFSjQoGVFS4+iYr1O054cO
	 d/cWy4DWPwC+7ku5ajPn03Q1GRS0ESrINJD1Skiw=
Date: Mon, 09 Mar 2026 05:02:14 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1061791/9a6959-000000@github.com>
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
X-Rspamd-Queue-Id: 4DC102385E5
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
	TAGGED_FROM(0.00)[bounces-19940-lists,linux-bluetooth=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_SPAM(0.00)[0.125];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

  Branch: refs/heads/1061791
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

