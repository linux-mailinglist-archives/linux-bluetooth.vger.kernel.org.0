Return-Path: <linux-bluetooth+bounces-15328-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE53B567D6
	for <lists+linux-bluetooth@lfdr.de>; Sun, 14 Sep 2025 12:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A123189C935
	for <lists+linux-bluetooth@lfdr.de>; Sun, 14 Sep 2025 10:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B712459E1;
	Sun, 14 Sep 2025 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Dw3FvZrU"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF02E134AB
	for <linux-bluetooth@vger.kernel.org>; Sun, 14 Sep 2025 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757847474; cv=none; b=Yj8P64XOYvTzFkNLfCGYKQgO6VxAmGTPtRfM7Fzmu1fYBldGzkfoDdUPvPVr9K0+Dom1ZeYrXRTYHe/FnmhuaafNMwfB4rynLOe5I48UKEWQsUfPbYK6JZym+cDNfpTq53qhtuv8N6kqsL5oDUxcawfGM0BRauM41t4uxFpDOS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757847474; c=relaxed/simple;
	bh=RdfLlc797d4BfFN1idWmbTjhkjhjOCKh1snT1BHh0VM=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=IVwoYNlQ4u0r92Z1R2LfNRlvyDlfiGTmnBRO+knKqJHhadChzhToRkFl0DehQglSCGyW6wXrMy6kxQqcp0kys8Bf5pVQYkD172Qu682cVY7pdWIlP3d9c42Dt1V9/lYMvm9tjeBxg/0bO0goAgGJbca8BQpcHbOi3xYScq8UmgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Dw3FvZrU; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-8b9c3e9.va3-iad.github.net [10.48.206.52])
	by smtp.github.com (Postfix) with ESMTPA id 058228C059C
	for <linux-bluetooth@vger.kernel.org>; Sun, 14 Sep 2025 03:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1757847471;
	bh=/NUFB82tAER6S3oyZLTdMKBaTeY87gR4PyMOXzYCM2A=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Dw3FvZrUMjfUjiOImGtgsYzK6DvA6IGc8lnJaQrzDtfdY2WHWHDdRhUb8sIYym5Pd
	 3F3XR3eeLMT99ZONJcvNZreOtUdHofOakelO276xp/mHQKlB5+CYfsoB5pcr0XmjNN
	 DWp1aoHGvW6BVOX2Wmw586u8HYS2+uSkXuheY99Y=
Date: Sun, 14 Sep 2025 03:57:51 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/991899/5773fe-000000@github.com>
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

  Branch: refs/heads/991899
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

