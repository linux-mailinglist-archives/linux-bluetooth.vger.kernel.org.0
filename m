Return-Path: <linux-bluetooth+bounces-15371-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A77B582A0
	for <lists+linux-bluetooth@lfdr.de>; Mon, 15 Sep 2025 18:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32B442A1E9B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 15 Sep 2025 16:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D4E286D78;
	Mon, 15 Sep 2025 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="iBJ5zDRj"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F68B1E50E
	for <linux-bluetooth@vger.kernel.org>; Mon, 15 Sep 2025 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757955359; cv=none; b=LkdQcnM6QQXyobtphKFrLeX/GLoofBOtK69jb8SFPwMp7F/+1pyrl4KLW0zx33TySQg4ms3mFMx2qt7e2F3n1eieiosGAd9LTgm5XFPffC98BEhtEBOFtQakDT6KvwJwwcKeRzewKDrlNWHHZ037xVjmIUzBidGfo8gfjrAIbB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757955359; c=relaxed/simple;
	bh=p+nBLYknBE7FbXG6UqkKwB5zIlhuj+z/AwWwH4YHQJ8=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=im07ZCkTcEjyfRAKCPz7V6YOibwXMEvt3i4RPhrFh9tyC4+Q/os0KT2e5cNjN5moEvfLBo1wn/NJV+uiPftwY6lq4FeK9i0G7o36Gl+VfL0cSNLHFTB4yivrFMLPkSf87scTTJXbjZEz26lmNVsUUT6XbuEU74/+09wB4sHTyRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=iBJ5zDRj; arc=none smtp.client-ip=192.30.252.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-035473a.ash1-iad.github.net [10.56.183.35])
	by smtp.github.com (Postfix) with ESMTPA id 5DB7E1411FD
	for <linux-bluetooth@vger.kernel.org>; Mon, 15 Sep 2025 09:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1757955357;
	bh=MOBx6jYNvZtwzuM3vGCmZyO+Zv9eT9ltX5WClUbqJeE=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=iBJ5zDRjIu8gNh2Ed4gHwle27bKQSX4pzqq1gyVvFNatRzUhhF4TFIKQamPYKU+Es
	 hrQ4tYT7c/x5HDSlt4RY1KPtblkxhgl6CNyAhitKU4Oi1b6+6LxR1XS3cMn14T5C5t
	 cl/kTq7WdyAMyQk+WRYysxH2gI5Jn8bPUuWB4fXQ=
Date: Mon, 15 Sep 2025 09:55:57 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1001291/6b4247-000000@github.com>
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

  Branch: refs/heads/1001291
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

