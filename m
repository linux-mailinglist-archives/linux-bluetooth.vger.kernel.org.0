Return-Path: <linux-bluetooth+bounces-18353-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APguKedSc2kDuwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18353-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 11:52:23 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2914E74982
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 11:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82603301C8B2
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 10:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84D13016E5;
	Fri, 23 Jan 2026 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="clVVBj6H"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-27.smtp.github.com (out-27.smtp.github.com [192.30.252.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8212E093A
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769165350; cv=none; b=huvl5/8kPQzdP8UAM2iPxkdCrk4V7ewYpHN+lxgevtze90P87H9B6tsQyGI/mAXeE4ExJWijBtUf79ziQ2PSkFGdFobZlpwEvfV5t5usCzI208lV2o/CLjCN535ox4BSi11LBn4QQldd/IuzxBeaLdftFkEBC/TIUax6t08c2lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769165350; c=relaxed/simple;
	bh=zPBYU5BbeyynOaUTx4Wf+ohvFWHdm9E+vIkCcBBw8Gs=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=B25GpaP/rpbt924X+OYqXbiY+i3bwvkEUK/ycPIhz40TGgJ5NHpYQYGIglAvtsVxBhm8u/x+XJeI/DyN17mXjLI2HRQsrEFY3eGQqEC+UOk6dMaB+nHUIzqzWy8QLDtCTp8QaspsbyMObbBIyxc6LmJPU48UPU1DiPnLSiJ9KP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=clVVBj6H; arc=none smtp.client-ip=192.30.252.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-2ab4973.ash1-iad.github.net [10.56.181.31])
	by smtp.github.com (Postfix) with ESMTPA id C90926011E8
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 02:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769165347;
	bh=SyGWONxRoT0PPUtn4JAH1VUNuJhzZ6F2OeRCHqL6nCk=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=clVVBj6HW6g+ZXkHKzhfwRYd3F/lNO+tHwtxGNmgNE29F+O893pdVyPj/QhKVFr1h
	 C0+6DQK1RFdNPi9TqBn4WHuMpagOwuL4DvIAQxPMNpTf9ReAySQ/I/TrXlbTfwpmO3
	 7dBOWrXNzsfsWDv98/toVsqLB64sZHIGzwxywGpc=
Date: Fri, 23 Jan 2026 02:49:07 -0800
From: prathibhamadugonde <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1046197/000000-d5ca4f@github.com>
Subject: [bluez/bluez] d5ca4f: lib/uuid: Add RAS service and characteristic
 UUIDs
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
	TAGGED_FROM(0.00)[bounces-18353-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2914E74982
X-Rspamd-Action: no action

  Branch: refs/heads/1046197
  Home:   https://github.com/bluez/bluez
  Commit: d5ca4f82128737232ab9e136dc757b3531e283c5
      https://github.com/bluez/bluez/commit/d5ca4f82128737232ab9e136dc757b3531e283c5
  Author: Prathibha Madugonde <prathibha.madugonde@oss.qualcomm.com>
  Date:   2026-01-23 (Fri, 23 Jan 2026)

  Changed paths:
    M lib/bluetooth/uuid.h

  Log Message:
  -----------
  lib/uuid: Add RAS service and characteristic UUIDs



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

