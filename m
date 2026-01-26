Return-Path: <linux-bluetooth+bounces-18424-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAxzHZPod2mwmQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18424-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 23:20:03 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 074858DE73
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 23:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9DC23028B31
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 22:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F742F6181;
	Mon, 26 Jan 2026 22:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="i7QFeU3E"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD7F1C862F
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 22:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769465988; cv=none; b=JXM44ZvR1DpxrkyncY0QWs8g41l3tM6RYPTeVKIl0eTClAB+ZXj1yM6a2wJWfVCa2ON4df2R9Ycf07bRw2qqMJr0MAwmhakQwQZDRy7Leir7jwApH4CItcZFYV5/APzVxJk7WUrAl/5MIDvkStolgFGEGbYHNDlrt4yI9Fyg4cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769465988; c=relaxed/simple;
	bh=c+ykR5oK9kMqaKNAGUG0nGEDx+qxwrC9XDPld7G57kQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=kprLsLnzA/VuSkavpDPGfiapZKPaS8DchsUcvJAeEM8JrLyIXvQOugJehkILWnxbCdDAotjnMX8VaOskbgZKsjt52oEjOdKT11uC05JZsm+ynnJhsGm9b/veNo9lQpF/GOFbJ+Ux3DwKJq5uyVh3aoOJKPZKGQNTCw82kmm7AAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=i7QFeU3E; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-263cedd.ac4-iad.github.net [10.52.206.120])
	by smtp.github.com (Postfix) with ESMTPA id 15C31640448
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 14:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769465986;
	bh=esbjC3SNjWnjAk0EOoqmZUcIGVp/thiDezdr+dl6c9A=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=i7QFeU3EGhJBbIT56gkaiiKXG8WeWyZazd9/s9lemxdX2Z8IUhdJTY0imhWIzNe6i
	 KAZMfg4QBRgP4hpu1Eubb1OiO2pgnMh186PmH9ME0KFSJpS+AXsTzG3sm788sRKYqG
	 mZyP7diZo+WqovH/67khTAxX0vDFN+Gp+QcHz7Ts=
Date: Mon, 26 Jan 2026 14:19:46 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1046381/35c39b-000000@github.com>
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
	TAGGED_FROM(0.00)[bounces-18424-lists,linux-bluetooth=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 074858DE73
X-Rspamd-Action: no action

  Branch: refs/heads/1046381
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

