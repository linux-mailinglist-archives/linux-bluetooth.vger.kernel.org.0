Return-Path: <linux-bluetooth+bounces-12067-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DCBA9F752
	for <lists+linux-bluetooth@lfdr.de>; Mon, 28 Apr 2025 19:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92B597A6A46
	for <lists+linux-bluetooth@lfdr.de>; Mon, 28 Apr 2025 17:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D995B2918C5;
	Mon, 28 Apr 2025 17:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="FHzCmz8j"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098E728F526
	for <linux-bluetooth@vger.kernel.org>; Mon, 28 Apr 2025 17:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861365; cv=none; b=uER4h5LqXBuFq4QLHMydP0U5RYZK2tWRGt/jM20h5GAnimUdbQW5PvljcvOC79sHMBalKxXVK4u1xiBvQ/G3UuUVIN1VI1CDwU/k1HWPp15aREP/SKwe5GD5r27NskNLNiGE1Vr8Z/Buz77G39p96CNctyil79hl48jUxSccSUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861365; c=relaxed/simple;
	bh=CAmZl+Gc4ysF7n71f1/t0Xx98dJtQwtuivaeJli5Mmc=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=d+9qHny/3mflY9kBokngYxPAJiYI2xlOPXqa0B4tyhUZtCHw4SicnlRU9P9iFoeXMKjTgujlXkol5uyppxa3GH3EX21Vughq4FP7yH55rEw61vLCp0kIisV8zvpZ/c5bdhEiHPgvkQ9+TmoFC4GO4yk/McESHEXD6su1rvSs+mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=FHzCmz8j; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-74a33c8.va3-iad.github.net [10.48.146.26])
	by smtp.github.com (Postfix) with ESMTPA id 104FB4E03FC
	for <linux-bluetooth@vger.kernel.org>; Mon, 28 Apr 2025 10:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1745861363;
	bh=NOyh0rDpQ6dOGkbp0xhOZYjK8BfS2TEzMRZJOoHorOU=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=FHzCmz8jWUAA4Cp12BTMtXkOdaKREDzy+JejDSPiOqYS20N2QsZ6dj/0t8ZrP7Seq
	 dJuD6hOKLxKVtXVfAUOem4/L/xPB9cBhry6+SxrsvaFDNqDOZJj41+IhkIW+lOLSjS
	 N/1CNT8Mb7VSyyTuFQrIGGS/d2uBRAfJIkvOHKrg=
Date: Mon, 28 Apr 2025 10:29:23 -0700
From: Pauli Virtanen <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/957795/000000-eaa24c@github.com>
Subject: [bluez/bluez] eaa24c: hciemu: fix accessing wrong/uninitialized
 variables
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

  Branch: refs/heads/957795
  Home:   https://github.com/bluez/bluez
  Commit: eaa24c7663fe217dca4c608f190b30d25f27f405
      https://github.com/bluez/bluez/commit/eaa24c7663fe217dca4c608f190b30d25f27f405
  Author: Pauli Virtanen <pav@iki.fi>
  Date:   2025-04-28 (Mon, 28 Apr 2025)

  Changed paths:
    M emulator/btdev.c
    M emulator/bthost.c

  Log Message:
  -----------
  hciemu: fix accessing wrong/uninitialized variables

Fixes: aeeb4fd64adf ("hciemu: set bthost ACL MTU to match btdev")
Fixes: a112d4345771 ("bthost: implement fragmenting to ACL MTU")



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

