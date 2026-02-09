Return-Path: <linux-bluetooth+bounces-18889-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM0EIuYhimnLHQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18889-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Feb 2026 19:05:26 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B4B1135F4
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Feb 2026 19:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B205A3028138
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Feb 2026 18:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D33238171E;
	Mon,  9 Feb 2026 18:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="gNOMLd1N"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0A01FCFFC
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Feb 2026 18:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770660194; cv=none; b=eIAzP7D3c4rOR3fvx3UfUkpLQd4s3r2lMA2eDyugElmQBnSoPXu3kbFIeGyfeT4qPpvrn1xZIxdjoDA9gdSyoUN0YCJBs4S+z4JLmYU8VWa96GAEZMCl/8GTbt9TgNB5sQh28oLfeW7yqLhxRSszMW7WDuPk87Qh1fov5r0u6Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770660194; c=relaxed/simple;
	bh=iBvTxYbyb2VBNhRYVsC1t68NmBKPwGIJumXZVvUKW/c=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=S4bV7U0lJNi+emfFsk+gMY0DQJLstHufnUNfERfDgDJIA3mA+jXFVRqHNUdplXS7aw89QW8RIUPXdRzv5fMmXjEIIoCQSOHadWLTy6cSJVtYM2NHxF37P5YWme4lInr0bQKHL4ul4i+fgX2wdPWP2Xtpo/cPXDq22EOTtYU6HTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=gNOMLd1N; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-e9b5fd4.ac4-iad.github.net [10.55.91.35])
	by smtp.github.com (Postfix) with ESMTPA id E78736435E2
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Feb 2026 10:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770660151;
	bh=83zYQA6EXjrFzGaFurNbpRcSxnGN152Td5s6MfLgM3Y=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=gNOMLd1NNK5PwOhujAe4/JUvYFMRFy/wPTy8cq5RepHn6JOUgSPK2bYh5FZocufvu
	 bcRo3d9HU7Xi/mVm+Wvh3t8eatowt5Ogbjr+r695ASM/a4RLysXZm0V2U3KX7yu92W
	 xfk2Ag6qcGq3CKPRGJ8H5C8CsEDQgg9CnoO6OHCY=
Date: Mon, 09 Feb 2026 10:02:31 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1052360/000000-1b2869@github.com>
Subject: [bluez/bluez] 1b2869: adapter: Add btd_adapter_send_cmd_event_sync
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
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18889-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1B4B1135F4
X-Rspamd-Action: no action

  Branch: refs/heads/1052360
  Home:   https://github.com/bluez/bluez
  Commit: 1b2869eaddfbfd2346f1f40226b36257bf925d97
      https://github.com/bluez/bluez/commit/1b2869eaddfbfd2346f1f40226b36257bf925d97
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-02-09 (Mon, 09 Feb 2026)

  Changed paths:
    M src/adapter.c
    M src/adapter.h

  Log Message:
  -----------
  adapter: Add btd_adapter_send_cmd_event_sync

This adds btd_adapter_send_cmd_event_sync which acts as a function
helper to generate MGMT_OP_HCI_CMD_SYNC.



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

