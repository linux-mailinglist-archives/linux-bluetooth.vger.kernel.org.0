Return-Path: <linux-bluetooth+bounces-14891-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C8B3012F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 21 Aug 2025 19:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28111CC4B90
	for <lists+linux-bluetooth@lfdr.de>; Thu, 21 Aug 2025 17:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24FE338F50;
	Thu, 21 Aug 2025 17:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="AUK28CDI"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-26.smtp.github.com (out-26.smtp.github.com [192.30.252.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80C82E7F2A
	for <linux-bluetooth@vger.kernel.org>; Thu, 21 Aug 2025 17:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755797775; cv=none; b=PG3si7lWyHSYiJcKMw9jblQhIEqndMFIcSXIDUgK6d9h8LEN+4TrIoHP1EOvuy3u8NfWUms3eKk6xA14CKy9lhbiPwKbkDWH6kEouiN8BgBwLDd2deOil3LRB/QD1dPXu5nrX1NbXaCRPubrnLCHmpDvXARlRRlJsYBeqAnf3JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755797775; c=relaxed/simple;
	bh=2FG0+tNqioLEgtV/OWbaEZ8gGtpM7ITPkKhb8y1uv9Y=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=T5QVwakoFTZwr1ZF26Y3xhez4H/9B7OGnc3VVOoSeL+CVrUtRy/uw+fLc5ExdR19XsJmV5MvoVDdj6XX2/gjeRfa+vSkp4G4WTUtr4TTOSmhr2adLhSItu++BZ3XQmLBDKJcX6e0lcW4rJ72sx2LFTDZHXWplnKlzwBJY4tuJH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=AUK28CDI; arc=none smtp.client-ip=192.30.252.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-86fb855.ash1-iad.github.net [10.56.209.97])
	by smtp.github.com (Postfix) with ESMTPA id E48E960136D
	for <linux-bluetooth@vger.kernel.org>; Thu, 21 Aug 2025 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1755797772;
	bh=1Xu/xpQnw6Ny/80Tbl3AAYpuaJ3ZMDOOcyFNMLrdvNw=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=AUK28CDIwDuFMdrGlnioL5I8igQnOPYNivnWiKF1OMpYl3QWE8bHIANhjef/rG84r
	 qWl1Zr/N9UGJVmEbDQ680xOMk8MyvKeqZgapH85GtS4F0tBGjSMo9lDHH2AilJat21
	 LqfLT0DCormJiqDdvZ66fkxzum1gC63e3jtm11dE=
Date: Thu, 21 Aug 2025 10:36:12 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/994106/aea455-000000@github.com>
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

  Branch: refs/heads/994106
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

