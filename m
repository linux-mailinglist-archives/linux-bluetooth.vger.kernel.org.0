Return-Path: <linux-bluetooth+bounces-12490-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2D7ABE60D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 May 2025 23:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64DFD4C8339
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 May 2025 21:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DD425D91D;
	Tue, 20 May 2025 21:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="b5vPHOXP"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-18.smtp.github.com (out-18.smtp.github.com [192.30.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FB125C712
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 May 2025 21:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776528; cv=none; b=JWt9yk1k5NBCMDYGRAyuWUWzh8lXzqP8DounrzG8wn0NERNevUsQCpq0dZvfhjuGp8tKtXgiWQo8vFPSlVkX1JmWBshiwRz8IPUVSVF76mff+B5RoN6Eq0mYDtdn1dmnzl2AfiQSH3gf7yKqBV5JDsBSMtv9v3f1WCUu/VvcXmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776528; c=relaxed/simple;
	bh=InUMLlSPykKHADHlVQKqkgZ2eNPwFB0poTvOFIZ86Ps=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=hwhyIk8t6Nu5JFppsYw+0pV+1gaqbWuWRADsjuw0Z+miRIejGnNBeWNuIuhdryIWmOW2Wyh3Gdi+Efs13eGp4tp60lpdkwGI+uPlbD4keOchFWgFeCh8eN5NYQGe9/xoJPiKctr3qn9hgYTVIKBdsbDhYFzszlFLtRl8eUDoWC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=b5vPHOXP; arc=none smtp.client-ip=192.30.252.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-86730cb.va3-iad.github.net [10.48.155.33])
	by smtp.github.com (Postfix) with ESMTPA id D1EA7E0704
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 May 2025 14:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1747776525;
	bh=SJ5a5iGLasaO2ma6Jp2uIyfADGECyTYHj7M//39QBF0=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=b5vPHOXP4i93VM6fcEpr3rl5ktdm9qZgaEYBOm0klSWZOlcxfpupSq5xK7OzPzhUK
	 BwFEk8L6S1nm5U1mnVnnqV5fAU1igxqEms/qE0UzgyfjOgSTwnxKAO7KO0cIn+/95k
	 cc/7VtS/3OO7g7HZP4HtF/k7tlLOaFgFIW766w3M=
Date: Tue, 20 May 2025 14:28:45 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/963725/a851eb-000000@github.com>
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

  Branch: refs/heads/963725
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

