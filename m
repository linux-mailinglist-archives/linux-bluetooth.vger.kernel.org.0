Return-Path: <linux-bluetooth+bounces-19711-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCMhCmMVpmnZKAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19711-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Mar 2026 23:55:31 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE71E5FD5
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Mar 2026 23:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4198A328C9BC
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Mar 2026 21:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D257390999;
	Mon,  2 Mar 2026 21:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="UrQofbtW"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E115B3909AE
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Mar 2026 21:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772488347; cv=none; b=YkTz9+TmIIB010UJSU3cI3maiL1UNu9daHNXoVEJ7Rz3DJy2tsW5mPJngKE14XWtBcZzvi95/ZjGWzLcLalhI7romhNrcvw4PhrpFedF/i+AAD9/EU6Vb5+mcJGJgKTUXBnixbufl7s18tJneM4wyAXSEB1hNsnLpPhz25LtDBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772488347; c=relaxed/simple;
	bh=ighCmIpW3iXZWw1Fnpx8+6ZRgkIjdEsc32m1rUZRb6o=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=ZQzmcM4zlcW2B+b7HFfyANhxezCFFZd0LsruGkrMmBd5sQVtppfHqM+W0Bfu9Ae/zBhv7KxY28v9UKkKSgk65iWwttl1UZ0DYMp52lAGz0jhLqJUUP3WC1iAGoe7i41DTaM6b46zIqOYtFGLCU9HCVy26e/5fVDMCDYfd2YlQNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=UrQofbtW; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-5d93682.ash1-iad.github.net [10.56.208.37])
	by smtp.github.com (Postfix) with ESMTPA id 0970C920A28
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Mar 2026 13:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772488346;
	bh=ccjAJCEuNU0CCzGgAsD+WwFvUU+GkMi+5vdr8RG8xlI=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=UrQofbtWs0Ro8zofmvrrnWoiKxJyPRLlNOrhFvkGdfTGYLGVoL2fFmIecP8cdXqzK
	 J6ZtoIHzrAB83D8VIqlmYYsliQS/UKwy94h29PcMRlPkKF0U62h7hc6TAQX3WA2h9x
	 YhINfPy3gXuL2uobzy5dxDRdFO01vhgB7ehx2qTE=
Date: Mon, 02 Mar 2026 13:52:26 -0800
From: Marcel Holtmann <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/d99f2e-d66e23@github.com>
Subject: [bluez/bluez] d66e23: shared: Fix the Apple Packet Logger format
 detection
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
X-Rspamd-Queue-Id: C2CE71E5FD5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19711-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.953];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,holtmann.org:email]
X-Rspamd-Action: no action

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: d66e23695b1b46df757482bb6f7d98cb7d556814
      https://github.com/bluez/bluez/commit/d66e23695b1b46df757482bb6f7d98cb7d556814
  Author: Marcel Holtmann <marcel@holtmann.org>
  Date:   2026-03-02 (Mon, 02 Mar 2026)

  Changed paths:
    M src/shared/btsnoop.c

  Log Message:
  -----------
  shared: Fix the Apple Packet Logger format detection



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

