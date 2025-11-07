Return-Path: <linux-bluetooth+bounces-16435-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BE003C417DC
	for <lists+linux-bluetooth@lfdr.de>; Fri, 07 Nov 2025 20:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE8184EB765
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Nov 2025 19:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D968C32D7F7;
	Fri,  7 Nov 2025 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="KHJO1zXF"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C6D2D5944
	for <linux-bluetooth@vger.kernel.org>; Fri,  7 Nov 2025 19:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762545579; cv=none; b=rlwx02lJxVzh+FGbnf44DOZbNs/N6AIYQbZiCWCdxuLbfeb5bGVemx9KexAedc0vKEFtUmaz0OYLjgNGCeOIL9nNJsb/BkoWuxgqr+h96Lqkv2quL/PI6okkm+1aEDu2IHcTbyZmoUHNOpbAoC5B5iICpAEgsBI25yGsE3wNrh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762545579; c=relaxed/simple;
	bh=aeQspq+sxegawetFza47ey+YkGZqQx8MI5Px231GIPw=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=QUrC6vGQ+RFTDu6CKnN4vzAkpa70R4z5/qmw0BDRIu+p7fdLp/aUe+N5o9qo/wXw0j2Gdw5F+JTJk13N5G/bV99Y1QG/UGu6jgWY9FvQks0/Ikms4K3sTrsYUqLkStyF9Bs/0dc5Hy/ES4bMAFmEJlVfMAwoF3z9d+oyEL2Eo3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=KHJO1zXF; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-7e248ca.va3-iad.github.net [10.48.222.42])
	by smtp.github.com (Postfix) with ESMTPA id 340D13C1167
	for <linux-bluetooth@vger.kernel.org>; Fri,  7 Nov 2025 11:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1762545577;
	bh=Ja7MhI6oGZxHRFT9t8ovdWZkp/70Xahbo/nzECivgHI=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=KHJO1zXF7mSCi2QmO8X9YD57gEd7bLTObjEUGSuC+EJqKRSuUcDzlL6GohVFNjvsj
	 ZysGBIUOvvtxRRiBJoynfgP0KlYm6YKNTp6mVXM4GZZYXeIFeoICrmWEHAauw0IQ2u
	 bADAXTzLx0Jp2OPGfWDvWjxF6KHRq+ni1XUKKBoc=
Date: Fri, 07 Nov 2025 11:59:37 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1020667/e01392-000000@github.com>
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

  Branch: refs/heads/1020667
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

