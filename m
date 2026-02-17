Return-Path: <linux-bluetooth+bounces-19134-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGXBFZXtlGnUIwIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19134-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 23:37:09 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C39541518A8
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 23:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A30C4305D28B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 22:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D83314A90;
	Tue, 17 Feb 2026 22:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Bt/EL6ea"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-26.smtp.github.com (out-26.smtp.github.com [192.30.252.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4976B31619A
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 22:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771367798; cv=none; b=fk/TlYITVZbHhD2G1aVqnnEdPKH9qQNgz93ASCK4OjQzFqlvD4BY77UK5NVPVg0d/NjA3WMdY9bvSd9rUa60Tn75RPV3OdK/CVUOcsbj5ZMAmCDkBHefRtsrzOkUNO1oHclmH/XAOoML9IGf/rhEqEXAQfAPYmw/hymJatLDeEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771367798; c=relaxed/simple;
	bh=KRF4Q9Uc/7PxZcxfZSuPOBkJPRmKxxP1bA/GHcEHcGQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=RBXrrM/0ig6YUeNIriIbP00hgY1o9IlWPXvAwbSYOEL2W/l/CCRbnIHRyK6//ywpWsBXoLzhfLeyQ+haq/tLhtJjZgfJFAgC2NM2ce/vWWgIC0wVfUbEtYeYS25vDjzukY7FoWdA4BXl5z0nqrnogScqAcI6INBzie/lSd7Pxl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Bt/EL6ea; arc=none smtp.client-ip=192.30.252.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-9ce4de4.ash1-iad.github.net [10.56.209.82])
	by smtp.github.com (Postfix) with ESMTPA id 9D4EF600DBB
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 14:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1771367796;
	bh=P1Jg727nsvq/ZDLhR9wmyuTVg1KAVlE8sMd6Xy7zkuk=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Bt/EL6ea0pt0QvJyOGr84jpaEKIJ9Ijmlx8lT+OuMlDohKy2Dm54aVxCp1ts4AHTo
	 e+h5PYbnIFQshhvrgKmjnqTtnGDWJaVr5ISvcoYP43rKskxFoc/aKVXgEkU6COH5Em
	 6Fnpx4N1GeM++A5QwsHGIn2uedphFOnJKQKbNfZU=
Date: Tue, 17 Feb 2026 14:36:36 -0800
From: Lars Christensen <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1055023/000000-34b31e@github.com>
Subject: [bluez/bluez] 34b31e: shared/shell: Fix bt_shell_printf in
 non-interacti...
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[github.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19134-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C39541518A8
X-Rspamd-Action: no action

  Branch: refs/heads/1055023
  Home:   https://github.com/bluez/bluez
  Commit: 34b31e091659601ec95a402c967e4eb565daeb2b
      https://github.com/bluez/bluez/commit/34b31e091659601ec95a402c967e4eb565daeb2b
  Author: Lars Christensen <larsch@belunktum.dk>
  Date:   2026-02-17 (Tue, 17 Feb 2026)

  Changed paths:
    M src/shared/shell.c

  Log Message:
  -----------
  shared/shell: Fix bt_shell_printf in non-interactive mode

Commit e73bf582d ("shared/shell: Don't init input for
non-interactive shells") stopped creating input objects for
non-interactive shells to avoid reading from stdin. However, this
caused bt_shell_printf to stop working because it checks if the
inputs queue is empty and returns early without printing anything.

Fix this by moving the empty inputs check to after the
non-interactive mode check, so that non-interactive mode can print
using vprintf even when no inputs are registered.

This fixes command-line invocations like 'bluetoothctl devices
Paired' which would execute but produce no output.

Fixes: https://github.com/bluez/bluez/issues/1896



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

