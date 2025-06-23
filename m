Return-Path: <linux-bluetooth+bounces-13200-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE949AE4BFB
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Jun 2025 19:33:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46B3417C184
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Jun 2025 17:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65FB2C178E;
	Mon, 23 Jun 2025 17:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="GqjbhCk3"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-27.smtp.github.com (out-27.smtp.github.com [192.30.252.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC49E29DB7F
	for <linux-bluetooth@vger.kernel.org>; Mon, 23 Jun 2025 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750700023; cv=none; b=tQMMlFHOPG9TFXfQf/fNkWyzaQ4Z2eKfpERG/9vbqU77XvIe3r8XYHUlDzYqLoGNQz3l1dMrmjaYTTiXhsj1M0NMLl6PMgVUwAmBV89lo6YOXZe2UA+Y9ja49kkleY2HfszDntdapDqZhBIIlgKvmS7aG+LqM4YHMR2CAQW5PPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750700023; c=relaxed/simple;
	bh=LveA5N46NBxwK6Wd/eFjKH+gTqyXuFBmIeFfhZ6qvuM=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=jnOGkoMvHNXZsedgNz2sYMCYMiJFC6RxcBl/AvmPGfHckAoi57GK5kpJjW0rhQ2MeMYdSTmV3Q+ee5ibx/+noTy94lGrwYVroDFEJ5iYbjVQwEvQpBACiysHTmLdFPJn3WGZSFmOC3Lh7qRzHcytdt7Q0umF2JreCWPd8Wm7ymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=GqjbhCk3; arc=none smtp.client-ip=192.30.252.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-b970631.ash1-iad.github.net [10.56.165.41])
	by smtp.github.com (Postfix) with ESMTPA id ED75B600876
	for <linux-bluetooth@vger.kernel.org>; Mon, 23 Jun 2025 10:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1750700021;
	bh=1hIRwCXRutpedtdYLcAFBBFcug9UHch2ZQdzcjyKetg=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=GqjbhCk3jj8u/T2hVDvrPiNihD4K2xkyYZjEYI+MOOlJLhsk2R3eLrxKglGW2zz6C
	 QsZGkj+uRfH0WRE0vdt83cDpbJHxRYp/vPPlLqhAqYoFW25QTFNoTtakoaoqndgAuC
	 HJUlMvL4o7qvU/KOptyR1fCsYThcWdP52Qb9jdGw=
Date: Mon, 23 Jun 2025 10:33:40 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/974594/0ae2a2-000000@github.com>
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

  Branch: refs/heads/974594
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

