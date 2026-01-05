Return-Path: <linux-bluetooth+bounces-17769-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FA8CF5BE4
	for <lists+linux-bluetooth@lfdr.de>; Mon, 05 Jan 2026 22:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 133E1302C9FD
	for <lists+linux-bluetooth@lfdr.de>; Mon,  5 Jan 2026 21:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C874311C32;
	Mon,  5 Jan 2026 21:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="i9/hbNUa"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11F4311C07
	for <linux-bluetooth@vger.kernel.org>; Mon,  5 Jan 2026 21:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767650342; cv=none; b=gMmNfgUQhAlvGNsMceG0mGzZDTeeWQS9V+mUfJw42TRQO3mJ+FXFHW4RVyE1YcWvavhULlYzOs4zauSb8w76ZWbS/L/d+M6czlGa5oAmtxOEibh1bVn88ik0XEipnqLRVBZu4gQGZ2LIp4PdPVuJmaDFKzUMtJ+qrbS9w4bHeLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767650342; c=relaxed/simple;
	bh=wNBPvkJtG9WS8cpmFUFTVzA9x7B3R3SSGf08ivIBVfE=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=mn01olwoVsq4HStxWqd+uwe1HfrPrB3coNWDCSWLwZlebsrHyXN4HYNyDOQiFBJHM7BlARcKdtMGF2bQLv9sFxgS0CXzoMfcrXdOzVdUl7hY+jH5ZXDCEXzp6PRrF51UJrN2a/hAgp/JOyjX8WXkDC9exyYEM6gU/G2gaGsdau4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=i9/hbNUa; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-3c925ea.ac4-iad.github.net [10.52.202.101])
	by smtp.github.com (Postfix) with ESMTPA id CBED6401174
	for <linux-bluetooth@vger.kernel.org>; Mon,  5 Jan 2026 13:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1767650339;
	bh=3znJqqbd5voqcbhf5NEG9Oc+tLFo7rTzJ+axFtASqvc=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=i9/hbNUaDoteVC9FFYd/F2rKYTvQojtdar7kOjJD9/QMGUcpvCuWF4KwSSJoy7O2y
	 nSPNBcvw2A3hgKCCHZXRlmxNjoN4hAr0OiDr7Zb5nS0jRVmP0gkrwB3dThYi9x6Mqc
	 JPdx/pJncj5EwxaeEznIMMg0FOLsKqy4x+R5axFQ=
Date: Mon, 05 Jan 2026 13:58:59 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1038262/3d339e-000000@github.com>
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

  Branch: refs/heads/1038262
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

