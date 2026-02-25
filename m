Return-Path: <linux-bluetooth+bounces-19420-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BsRCP87n2kiZgQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19420-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 19:14:23 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA2519C188
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 19:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 675D5304D1CB
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 18:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8427C2DECA1;
	Wed, 25 Feb 2026 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="ClFgrpaw"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C6A2EBB8C
	for <linux-bluetooth@vger.kernel.org>; Wed, 25 Feb 2026 18:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043260; cv=none; b=Oy84S5ww4/1bF8vFkxh4glqE6BbzWIS2lQ9x+H/HCI8vJFsD+aRhRw9OFhqK+clFikltNPxx/k+vNM8jnbQuFxyGLwYwnc6L7Hoeib4A08ZM11+L/iX0ReseHYyC9Yfj44mmZ0xQc8DJsUCi3uqMmorFEPOEvb+v4dVk5JEr25c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043260; c=relaxed/simple;
	bh=qucoZgQsXY3pJO6uSWLcx4ITS1IrG/BGtbnbyldxrvw=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=bufA1UPi73HYHh+vXWHDK+5XT5sikylzTjcdFjlPx+PvyzNal9k29HuJnhI8vjk3kAraTeHeSCjRYV9G38IY5lpn9LKwby8lcaw6VkyXAg5O5z2MvQ2QIbzgJKvwlsqWm+gWOMnE8zvXjJckXoBECOOVcgU2LoOmdQEok0fxeqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=ClFgrpaw; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-1a3c992.ash1-iad.github.net [10.56.146.37])
	by smtp.github.com (Postfix) with ESMTPA id 3DEF9920B36
	for <linux-bluetooth@vger.kernel.org>; Wed, 25 Feb 2026 10:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1772043258;
	bh=SNiAlW6roEdJP0wQHC9aNjGvwvLjJu+p3JIOmp25yVg=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=ClFgrpaw2hs8wZYs0/u1aigpAV0TBg1QeYvCrfkw/JkQbmAYJI/V+0/LL+D2/ZqM2
	 0vztIiSz99tsDiMiT6zzY+U2vKhpKB5o/wq3xS+RtGa08yeRT5aQGYGjo4TXf0xHS9
	 vR+YNA0hv/EhHqjpVeiDoi5p244VBaQIomFhnCr0=
Date: Wed, 25 Feb 2026 10:14:18 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/7c9c86-a96f5f@github.com>
Subject: [bluez/bluez] a96f5f: shared/att: Simplify logic of DB out of sync
 recovery
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-19420-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 8CA2519C188
X-Rspamd-Action: no action

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: a96f5f4eba9a0dc2924faed5d0584fd7d345e2c6
      https://github.com/bluez/bluez/commit/a96f5f4eba9a0dc2924faed5d0584fd7d345e2c6
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2026-02-24 (Tue, 24 Feb 2026)

  Changed paths:
    M src/shared/att.c

  Log Message:
  -----------
  shared/att: Simplify logic of DB out of sync recovery

This removes struct pending_db_sync since it is not really necessary
to record all the field in bt_att_pdu_error_rsp, most of them can be
directly recovered from the original request and the ecode is meant
to be only BT_ATT_ERROR_DB_OUT_OF_SYNC.



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

