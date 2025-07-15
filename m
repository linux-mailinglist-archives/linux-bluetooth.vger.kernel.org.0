Return-Path: <linux-bluetooth+bounces-14072-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3871CB061BF
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Jul 2025 16:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52B0D1C42AAA
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Jul 2025 14:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993461E834F;
	Tue, 15 Jul 2025 14:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="mX8D8K2T"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48DD1DE8A3
	for <linux-bluetooth@vger.kernel.org>; Tue, 15 Jul 2025 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752590521; cv=none; b=qLl779eK8RLufLQJ5ssI4DBrWKjqcyCW7Jcp1dmFEomB6tqgkTe33UcLAFC+FCW9flfb7omrnTvZQT/zfEyDzO7/QWRBwAsdPOiTrdcB9zkJJm8KPB5iWfqLuWjQTBxvhxItybwqDLX1l1c3n+qY+C9jmbEwUZHANvqHqdj+MOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752590521; c=relaxed/simple;
	bh=ufQZCUudyTRYX5UM2d95OibPYEf5txpNj9gNJ9pnjsI=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=XijO4nZaT+ZvgQcqRdgIwO1CMGGfU3D2JJ00+6XyGXvM19U8C1ERffi2JDq+WGuvllaxgAPOx3cFIWRe5zcyN7gAl1Dp6FEh8Xz2vPw6UA98jjwC/6SQ13Mr6mQ06wrGUYXXYrGfk5u/2Sdjd/okpPsm00ZjWdzvQS0nXsSanW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=mX8D8K2T; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-1f2e298.ash1-iad.github.net [10.56.153.42])
	by smtp.github.com (Postfix) with ESMTPA id C3F3E920C65
	for <linux-bluetooth@vger.kernel.org>; Tue, 15 Jul 2025 07:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1752590518;
	bh=ugjwSOPlWYWpxHuHT8Gc1ej4OPwNCFV2hRNeoXeHY9g=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=mX8D8K2T+qda9GJoUJLABHceNbCct237KF9qOuLw65qDtVHw02d5YZW9TB8+pwP0k
	 8wKfp7+N86r4iqBFWVyoZdSQ7MQQRDgyvWS+Pn+BJbHEgYU1B/1zrbmPJrINt+U2Jg
	 Zgg+c37D4SX/Gx0dDTaNotfTwd1jURHucvi/S+pQ=
Date: Tue, 15 Jul 2025 07:41:58 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/980052/ae0f45-000000@github.com>
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

  Branch: refs/heads/980052
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

