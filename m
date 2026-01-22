Return-Path: <linux-bluetooth+bounces-18325-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLfVBG3tcWlKZwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18325-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 10:27:09 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9864F64830
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 10:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E1DA88258FB
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 09:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9858731A044;
	Thu, 22 Jan 2026 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="J1KKTGab"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FD632BF26
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 09:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073618; cv=none; b=D7LjNCJvLDchxB327Gkzy1CaItbEyktwWxO6GZEUH/rwzWYldkHcrTcqDsCy46QIqJ/I/voEAAiV/fKsPBgr73ztmfd4hHafoqyTRNgal3BVRorTPaT8zY9MO56eerYOv4uLHJcf6n40woFpyNkd0d/ExuX83T8+jjXAQvS3Ujo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073618; c=relaxed/simple;
	bh=8tY9xYudoYmtmY0EIJV8M11bP1amD6ZZZdgxuur20wc=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=TUITmayanm13AZ46kdc5LNvctpH0q372isA6i9v9qmoJ1hvsoQ2+OOxZx9/cH0anmBMO0VxLN1VDPlIyImT8yn0K9xxzPUKL17iavyhk+1VAVyJ41B8EB5aQF6S3gQO+7nBGmkvPg7x1BYqawsjKSGS6PaNeV7RNbYeq1YcAvyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=J1KKTGab; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-552c987.ac4-iad.github.net [10.52.160.26])
	by smtp.github.com (Postfix) with ESMTPA id 3934D401264
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 01:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1769073615;
	bh=BbctoO8ZEodeZaXp575oFPaeMzHgRkxdWYQzNTJtA9Q=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=J1KKTGabJhF9ezFOTitqm5v662NU/bbNEw+i1aeXbnUW8q5LuXdzpktqS14uxUBrq
	 Y3p9K97kOx5/t8qzAbc614ikM5C+ey8eH7HsfkidrYeMN3S/fy3NaUuMpkgxUNvFfk
	 w4dIr5gixaS67Cl9gJbT+TqtAabO/QDXpTiVzQG0=
Date: Thu, 22 Jan 2026 01:20:15 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1044790/6c7858-000000@github.com>
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
X-Spamd-Result: default: False [2.24 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : No valid SPF,reject];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18325-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 9864F64830
X-Rspamd-Action: no action

  Branch: refs/heads/1044790
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

