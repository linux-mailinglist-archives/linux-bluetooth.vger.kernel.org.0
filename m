Return-Path: <linux-bluetooth+bounces-14960-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B906B34C19
	for <lists+linux-bluetooth@lfdr.de>; Mon, 25 Aug 2025 22:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E8657B4013
	for <lists+linux-bluetooth@lfdr.de>; Mon, 25 Aug 2025 20:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EE523F405;
	Mon, 25 Aug 2025 20:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="cxmoien2"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9CB393DE3
	for <linux-bluetooth@vger.kernel.org>; Mon, 25 Aug 2025 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756154079; cv=none; b=PaeMnPZX6roAtgRhajs/+zswQTLuzYkzTzt3KoUdUZbpxQ1d+qVeIn12rxb8o4yOUr9/2Cwy7BOUmtS46C9lQeLV4Sel/Hk7bQkXMLZfQqrbdU0Q4hNu75KNqtgIIlnlffbXpQ3cojJ/rvsG1MTrjJ/XiHRyCTAfg2otVGA1vEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756154079; c=relaxed/simple;
	bh=OkUYxiiERcnErXjChnPegghLATBk5cTjs78ie524/Pc=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=toTDQk5mZISoBpUlIzSrtM3XE77UbqBKsvs8SsoLLuHPVrE2qZuNM8crortl6NxcDWLf6pCaHZFB30+mzW7iVhL6kNQXIyPsA2qWRoP6mGZTzr3AidVto6/cqpsBQaPliVo9txKf1DALyJogCXW9EP6XRoZN4zXzgDFJLeIZvvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=cxmoien2; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-a1c154e.ac4-iad.github.net [10.52.176.38])
	by smtp.github.com (Postfix) with ESMTPA id 9016D70057D
	for <linux-bluetooth@vger.kernel.org>; Mon, 25 Aug 2025 13:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1756154076;
	bh=NobrEMCbJVWVFQeoXVr2VHipe28sIvupqns22nPCeks=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=cxmoien2hd7M+HAna6mexpDOeQQbd7vB1rKtpoO7yHEUSQ0ePb06UgvZEKAIUIejY
	 ClAvL5aX0rdtMXYHmgif2ca/4F6uJ3DZ48WR5Y7JQgMFydKQtp55J29O6A1QdNR1U7
	 4hIQqFM4ERBERTJWEso5rZw8FWFOtEq2f6DY706o=
Date: Mon, 25 Aug 2025 13:34:36 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/995364/95b108-000000@github.com>
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

  Branch: refs/heads/995364
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

