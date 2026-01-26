Return-Path: <linux-bluetooth+bounces-18413-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEMGMYard2kZkAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18413-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 18:59:34 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBAC8BD99
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 18:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A3053087DE5
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 17:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D957346E51;
	Mon, 26 Jan 2026 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="FLkT2jkd"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-26.smtp.github.com (out-26.smtp.github.com [192.30.252.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BC8233149
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 17:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769450086; cv=none; b=VlvFEpw/la/TwB3urDWyosH9ckrI4QEtkuU95vOIYSs0llv3IUbrjxEqZwCyZtRD038V+ZumZPgHwlkIqKURqc3mWuiU36S5vCjmKKRlXc4YO57y6rrxNYH0Ui7D623ry3npVuhJ9GRsUAhsnJpCqFbHseoNj/s+ASTMoyoWXow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769450086; c=relaxed/simple;
	bh=COYA/W13Oa9LI8zrZOqsTDvbS4NDXwJooK4hXMQkS6Q=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=eLvprh6+si87baFGLBnM690wYVjYyoA5pqf2SNgdRxbMGMukKwaC/ZBnsAFRX+ulhwtNPAw3Qc6QrTKg1LjedsJqRuCxl2tBNnXu4JpjvYYZ1XAlWLJGpg/WnVhNBWpjXe9UXPKbQ/igzixrY3A2beXlngXa2V0hl9poVES2nxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=FLkT2jkd; arc=none smtp.client-ip=192.30.252.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-48c6993.ash1-iad.github.net [10.56.175.30])
	by smtp.github.com (Postfix) with ESMTPA id E63A76000E9
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 09:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769450083;
	bh=/KQo7ihDNRPvDxBVhTSBuO6TMyA0TjLO/B2kOxgFbT0=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=FLkT2jkdFiwAD4Elu8YUDiB9tYtgTGwWPx6sclk8skhk9e0cgh0yLEjbuSbDb++1j
	 B1MWKf84lkaBg/xmn9VKF2rpYMMrBM8RfPHlcdW7ahXWtihasB1bOkz72qpeQmo6xb
	 iB/N2Y+zwEt5qMpwa/97uNISh1x2U0Zuy8ccA1WE=
Date: Mon, 26 Jan 2026 09:54:43 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/fddcda-521088@github.com>
Subject: [bluez/bluez] 825015: shared/shell: Fix not dequeueing command
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18413-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 2FBAC8BD99
X-Rspamd-Action: no action

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 825015d82e2efbef08f669f146735c1f6be42583
      https://github.com/bluez/bluez/commit/825015d82e2efbef08f669f146735c1f6be42583
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-01-23 (Fri, 23 Jan 2026)

  Changed paths:
    M src/shared/shell.c

  Log Message:
  -----------
  shared/shell: Fix not dequeueing command

If script execution started with command that call
bt_shell_noninteractive_quit directly it wouldn't execute the next
command since data.line wouldn't be set.


  Commit: 521088388babaa02deca64abf729ebae9d7f1a2b
      https://github.com/bluez/bluez/commit/521088388babaa02deca64abf729ebae9d7f1a2b
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-01-26 (Mon, 26 Jan 2026)

  Changed paths:
    M src/shared/tmap.c

  Log Message:
  -----------
  shared/tmap: Fix TMAP/SR/SGGIT/CHA/BV-01-C on big endian

This fix the following error cause by not converting the role value to
little endian:

TMAP/SR/SGGIT/CHA/BV-01-C [Characteristic GGIT - TMAP Role] - run
**
ERROR:src/shared/tester.c:992:test_io_recv: assertion failed: (memcmp(buf, iov->iov_base, len) == 0)
Bail out! ERROR:src/shared/tester.c:992:test_io_recv: assertion failed: (memcmp(buf, iov->iov_base, len) == 0)


Compare: https://github.com/bluez/bluez/compare/fddcda9751af...521088388bab

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

