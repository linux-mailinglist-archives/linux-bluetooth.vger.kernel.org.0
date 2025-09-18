Return-Path: <linux-bluetooth+bounces-15358-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB99B57DC2
	for <lists+linux-bluetooth@lfdr.de>; Mon, 15 Sep 2025 15:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2AC620460A
	for <lists+linux-bluetooth@lfdr.de>; Mon, 15 Sep 2025 13:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4633331AF31;
	Mon, 15 Sep 2025 13:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="hIYxW/YM"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7700731A57E
	for <linux-bluetooth@vger.kernel.org>; Mon, 15 Sep 2025 13:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757943839; cv=none; b=kU7/2N4Aagih7Zgjo2NAbvRJU0pCDQC2YSJ/QeUz0uCJS5dy+Dr/4fmlj39SKIJQas65RcM60pojntvHWqpy3y2KIUPVhao8ERTWD9uhtIs3h+YTk1y9szI6Bae1swm56Tiu2U6G1fNPyjW5E8pGKX2ndEeetjsdzYuN4kHw2Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757943839; c=relaxed/simple;
	bh=l37uCIthVkYKI64wyIwFg+lwwjuKSX7zL8MQjKO9s/s=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=FrxcJAz330uCMkq0IqQeKItum1Lk2m3Xp0HTYQc9T4r7iOsDj2rxUP860CJfC7mmb0y2qn+NjzStrq5a4xxh4ZAdrUrVPuaYw0IlVQ0mbpS2v4yXMmpvIZX5+ecTacfDgK8oxkRunhCeykTo5lf6UwnQDAUXcIyauIPByVcxuuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=hIYxW/YM; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-e3f008f.va3-iad.github.net [10.48.182.33])
	by smtp.github.com (Postfix) with ESMTPA id A261D8C05D1
	for <linux-bluetooth@vger.kernel.org>; Mon, 15 Sep 2025 06:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1757943837;
	bh=nA2i2VmGSRdkADwNM3wRX1+lUSaPgDsPWV3ZQVNi8kw=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=hIYxW/YMyULweDgMOqbNRmhTT0kcEHf70cXnFiRqbIKJLkh+XomjRJRpyTTXCqdNL
	 M89FvPr4V/av/J4reqXgqBK1uQX0qWFTCm1TBNfn93M8ZAFMab+xTBcduSJvEGh/YK
	 bVic/NjYc+oalDiJE2PiosriaBo3UsEiu2F+buv4=
Date: Mon, 15 Sep 2025 06:43:57 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1002167/bb5d72-000000@github.com>
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

  Branch: refs/heads/1002167
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

