Return-Path: <linux-bluetooth+bounces-16682-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B22AC6166A
	for <lists+linux-bluetooth@lfdr.de>; Sun, 16 Nov 2025 14:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 83E2D34D3F8
	for <lists+linux-bluetooth@lfdr.de>; Sun, 16 Nov 2025 13:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C2530B53E;
	Sun, 16 Nov 2025 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="LqLRodhd"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3C22EC086
	for <linux-bluetooth@vger.kernel.org>; Sun, 16 Nov 2025 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301508; cv=none; b=I5P35bfpSxcqOxk1bCAmLo+jf20wlpd9rHqqGlTvV0CPqtiojrCAevKooniIEpC0BjvHEcrbHkZyb/dloRq9tavkMANexGeo3GCvhU6gg3+XvQis6ZOKYWny5g2oCBM3s2UVfHi1jYM+sUtfUNj+gdA3TlG1Wo2yCyLqbjEqS7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301508; c=relaxed/simple;
	bh=cbnlEgsG5Bs9wApePHGdBjNn4+gvI0LkopMYeK9zXAw=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=crqlA+yTVZ1p2u9UohD1IKf5y1zcnMJpA/S2+YQPLvQamyfjZ9tk/2zNiYwKOgL/3t8wQqzj+nNfcxWFoCGGckWyEZ/TGemEjhXAfpul+XAsWGxwRXE1/V5CNMdSTolJyRAx07U6q2jt2NdBPe7FlKfRbvftdpbDCrVSRz7hsbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=LqLRodhd; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-89ac1ca.ash1-iad.github.net [10.56.207.29])
	by smtp.github.com (Postfix) with ESMTPA id 1094F9205DF
	for <linux-bluetooth@vger.kernel.org>; Sun, 16 Nov 2025 05:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1763301504;
	bh=plVtVLMn+v/W7LCF2wr5Wa45oydwwPJhvKjUdpAOo8A=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=LqLRodhdSvWHDdWLVn1uJ1/2xaKxmFFnBlPyhyqF/CyqAbE9S9oZGYsiy6dkHgAES
	 FiYBj4Q+WXwG/zAzkOdNik+QU0GTkQG4wvagZ8BQVbN9K22gVDi/kIB3w8i1evZpQP
	 hb8pnJcrSWmjs/Xm/snDjkq7czTLgm3fS3epfd40=
Date: Sun, 16 Nov 2025 05:58:24 -0800
From: Pauli Virtanen <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1023990/000000-ce8b8e@github.com>
Subject: [bluez/bluez] ce8b8e: mgmt-tester: add tests for discoverable timeout
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

  Branch: refs/heads/1023990
  Home:   https://github.com/bluez/bluez
  Commit: ce8b8e5693e936943c338698a3765399bf6a7918
      https://github.com/bluez/bluez/commit/ce8b8e5693e936943c338698a3765399bf6a7918
  Author: Pauli Virtanen <pav@iki.fi>
  Date:   2025-11-16 (Sun, 16 Nov 2025)

  Changed paths:
    M tools/mgmt-tester.c

  Log Message:
  -----------
  mgmt-tester: add tests for discoverable timeout

Test that the discoverable timeout can be set successfully and that the
timeout actually triggers:

Set discoverable on timeout - Success 1
Set discoverable on timeout - Success 2 (Timeout)



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

