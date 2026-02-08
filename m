Return-Path: <linux-bluetooth+bounces-18867-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPkAOBoAiWnF0QQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18867-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sun, 08 Feb 2026 22:28:58 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A0A10A3CB
	for <lists+linux-bluetooth@lfdr.de>; Sun, 08 Feb 2026 22:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA37F30022D1
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Feb 2026 21:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591A134B192;
	Sun,  8 Feb 2026 21:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="YkXXa5t4"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA58034A799
	for <linux-bluetooth@vger.kernel.org>; Sun,  8 Feb 2026 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770586135; cv=none; b=HPiGXgeufi39zBK1Jg98f5yvn0D4pgTWnk8XaGfFaYr7QRXMZ+r85TvNyoaBd/fnY1FuEaJpMvg5TrgGGJ5MJaPY/0pvEdgR4MUNUhQ1wv60ZrMCfPzqg9oTQQQA4GM8oFVhbEMAv1IO2nnpf+GYypQWcMKoLbEz9IoIm4DdbdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770586135; c=relaxed/simple;
	bh=1fksKJXlW9dKRwZydAoCC/tKVqBoFr5vDziclSG0u8A=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=frM0R1dBIn/8KG70wHxeHXzB4eQT3YZUrwDozhhRtF3o1+1OtSltKrcpSg4ABCB7+3hFlbCm0/5pTHTrVcJ259qMJ/qLB6K7OoUEhCnW3kWHq2GCzzpeC3IDLlC2zIqCIIJ2W+cR0a1W904Pz+3GzrHYrZxPRW23tbDObBlibkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=YkXXa5t4; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-6b8dd41.ac4-iad.github.net [10.52.184.45])
	by smtp.github.com (Postfix) with ESMTPA id 334DB400CF1
	for <linux-bluetooth@vger.kernel.org>; Sun,  8 Feb 2026 13:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1770586135;
	bh=Wu63yc/SDy6PrrnzRneazrhFT3LIE6ouwQVNeL3NcHQ=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=YkXXa5t47fWTE93hS9Ztzh+qmjk+8JHb2S9JAu+Id+sfC17FUd4HvbHtyjKaxOws/
	 eaGhWhzsQgdbvSz1/TnjFt54xjJc8DPAm4NmUrKrjjqd7/O4luUBWEMzCIfJavcbOG
	 r2GrckTdn5QKEP/KOdT6DYh7fXsKkm10Q8j3P9MI=
Date: Sun, 08 Feb 2026 13:28:55 -0800
From: Marcel Holtmann <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/6704b4-74770b@github.com>
Subject: [bluez/bluez] 11dc12: build: Update library version
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-18867-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[configure.ac:url,makefile.am:url]
X-Rspamd-Queue-Id: 74A0A10A3CB
X-Rspamd-Action: no action

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 11dc12880e1d405e1f87a9521697a13a0ad24e54
      https://github.com/bluez/bluez/commit/11dc12880e1d405e1f87a9521697a13a0ad24e54
  Author: Marcel Holtmann <marcel@holtmann.org>
  Date:   2026-02-08 (Sun, 08 Feb 2026)

  Changed paths:
    M Makefile.am

  Log Message:
  -----------
  build: Update library version


  Commit: f9781ed9e2a8580f37a0b534360a5175a81f24fe
      https://github.com/bluez/bluez/commit/f9781ed9e2a8580f37a0b534360a5175a81f24fe
  Author: Marcel Holtmann <marcel@holtmann.org>
  Date:   2026-02-08 (Sun, 08 Feb 2026)

  Changed paths:
    M .gitignore

  Log Message:
  -----------
  build: Add test-rap binary to ignore list


  Commit: 74770b1fd2be612f9c2cf807db81fcdcc35e6560
      https://github.com/bluez/bluez/commit/74770b1fd2be612f9c2cf807db81fcdcc35e6560
  Author: Marcel Holtmann <marcel@holtmann.org>
  Date:   2026-02-08 (Sun, 08 Feb 2026)

  Changed paths:
    M ChangeLog
    M configure.ac

  Log Message:
  -----------
  Release 5.86


Compare: https://github.com/bluez/bluez/compare/6704b44cce88...74770b1fd2be

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

