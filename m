Return-Path: <linux-bluetooth+bounces-18371-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHd9LKlfc2ngvAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18371-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 12:46:49 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CC07556C
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 12:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B560306A334
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 11:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A3A387577;
	Fri, 23 Jan 2026 11:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="XoYuSJwE"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-18.smtp.github.com (out-18.smtp.github.com [192.30.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497743859C0
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 11:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168258; cv=none; b=LCLeqMU8EUL54a/ZIlMPOVK/eD6rmo6r2o5kNygwlq1jihaavUigq+Xis3cKmO5GNjjrXhPyHaOWcd3G69WLqIl7waUNe/QvnjyhA/MlKeeHVu+fCi765W33/cR/2Qb9F9tQdM8z3DZ8f+lJBEuIjUED6f7TiXrrQobo3iqvxlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168258; c=relaxed/simple;
	bh=dK9+HDz8MgdfjUIWswGs9J8K7zohIrE5C7Z8/ZS5E+Q=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=Q3rvOJNesLZyLY+Pvxaj2f5HAs6EnjyiD2BoiiB5WhTu1Hz0tXRvrpt8oFq+Z6dUmn2tlU+xJxwor6gBLKDD2+JqOfZpOLoFBQ+0SUoWUafDWKUxW4OBUjH5BvzLx4UFs9rBOXY8nbKmbY7HROg8jWB080Rby9mqQnzIrkqyNEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=XoYuSJwE; arc=none smtp.client-ip=192.30.252.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-9ed4a31.va3-iad.github.net [10.48.148.27])
	by smtp.github.com (Postfix) with ESMTPA id CBDCBE0C6E
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 03:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769168253;
	bh=+L1jVVJfMhCzf4KCajOR6SdPiEzZEnMlPKSTDlmx0g0=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=XoYuSJwEWqTmxrF+XeHsf1tS6EU3VlYJxiaoA8L1l6e41/A/psezx5b1WI7AoEIml
	 l29/GuddvcSqB66SDMpT2BgwYZi1ybaDhJAEQ5WCNkG/E7xmGsgiTDlw0nMFhEL/Vj
	 YkqDLFNfH+H3qcnThnqYFKLssiJ/EjHmxwi8RONY=
Date: Fri, 23 Jan 2026 03:37:33 -0800
From: prathibhamadugonde <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1046231/000000-fafdc1@github.com>
Subject: [bluez/bluez] fafdc1: profiles: Add Ranging Profile (RAP)
 implementation...
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
	TAGGED_FROM(0.00)[bounces-18371-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.965];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 09CC07556C
X-Rspamd-Action: no action

  Branch: refs/heads/1046231
  Home:   https://github.com/bluez/bluez
  Commit: fafdc19ba797b3b429649e4b2011d714391a10fb
      https://github.com/bluez/bluez/commit/fafdc19ba797b3b429649e4b2011d714391a10fb
  Author: Prathibha Madugonde <prathibha.madugonde@oss.qualcomm.com>
  Date:   2026-01-23 (Fri, 23 Jan 2026)

  Changed paths:
    M Makefile.plugins
    A profiles/ranging/rap.c

  Log Message:
  -----------
  profiles: Add Ranging Profile (RAP) implementation The profile is marked as experimental and requires D-Bus experimental flag to be enabled.



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

