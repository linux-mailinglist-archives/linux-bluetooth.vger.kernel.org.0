Return-Path: <linux-bluetooth+bounces-18788-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN1pOLXHgGl3AgMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18788-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Feb 2026 16:50:13 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF6DCE6D1
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Feb 2026 16:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D78B300C321
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Feb 2026 15:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F720242D7C;
	Mon,  2 Feb 2026 15:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="aZoEgs8G"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED61C24BBE4
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Feb 2026 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047410; cv=none; b=gVXChZIx1Fo+kbCJsXOhH3zLq07bjAcG069m6sw/HDV4Ly+4H9E7FbgNBuAExSoQa0Ysi5p/96YefhwJWmqkn3y/TPNZRwlqukLpU+xuhoCPX47lRl3VQiQX1DnhBSsTEYROBQNICrFlFKYLR3CWP59tQeDwwhED+flCetCFyk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047410; c=relaxed/simple;
	bh=UjzIGOKAKpadGHxHHUxtMDD8M845hmqA+1Gdb/6glMc=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=BPD1ds+2YO4CG94hG/0gvQVFx2+O+GUbayemJeB4858/9Elz+Y4iNPWyf7FyZlI1YeHpl3dc+OdLj+4VujjhEIM+XIouO/59uyzC1g+ApfoV1z0awORceBy1WrqIcM7huV/Zw+ObDtGJNetsib3Cvp2AIOh229pEOv7sgAiOb9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=aZoEgs8G; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-0fd4e2a.ac4-iad.github.net [10.52.200.26])
	by smtp.github.com (Postfix) with ESMTPA id 28F1664092F
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Feb 2026 07:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770047408;
	bh=419WupGDjQ+dnRsidNoBiy7ADI8DdZyfxcOT26jh0eA=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=aZoEgs8GCSh3j0NzMk2Bv3lK0HNfU2ok5FdPL1dWzDbn9BF+qGkIMFO/oe4nKb70b
	 H8blTj5u1uxKVToNafKtM8pQE6qAMp1KhKwlOYEpOmKIAo9dlGkq+EMOt2AdRB+W6p
	 7C95Ku1iqgG2zhZ9OgR1KS0DGzaJltIMx2f79zJg=
Date: Mon, 02 Feb 2026 07:50:08 -0800
From: Lasan Mahaliyana <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1049845/000000-cef822@github.com>
Subject: [bluez/bluez] cef822: shared/att: make att channel respect LE socket
 sec...
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18788-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BF6DCE6D1
X-Rspamd-Action: no action

  Branch: refs/heads/1049845
  Home:   https://github.com/bluez/bluez
  Commit: cef8221b4097ae601e149a1e680c694c6365e809
      https://github.com/bluez/bluez/commit/cef8221b4097ae601e149a1e680c694c6365e809
  Author: Lasan Mahaliyana <limahaliyana@gmail.com>
  Date:   2026-02-02 (Mon, 02 Feb 2026)

  Changed paths:
    M src/shared/att.c

  Log Message:
  -----------
  shared/att: make att channel respect LE socket security level

This prevents unwanted pairing requests instances where gatt-client tries
to read gatt characteristics that require higher security levels than
defined for the LE socket.

For example connecting to an LE L2CAP CoC socket with BT_SECURITY_LOW,
one would expect to not require pairing. But as the gatt-client starts
automatically for the initiator, if it tries to read characteristics which
require higher security levels, it fails and tries to elevate security
level. Which would prompt pairing.

Which makes it impossible to initiate a LE L2CAP CoC socket with
BT_SECURITY_LOW with some devices.



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

