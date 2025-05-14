Return-Path: <linux-bluetooth+bounces-12393-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37021AB74DF
	for <lists+linux-bluetooth@lfdr.de>; Wed, 14 May 2025 20:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C76284C61B4
	for <lists+linux-bluetooth@lfdr.de>; Wed, 14 May 2025 18:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CA028980A;
	Wed, 14 May 2025 18:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="ANSqa5+k"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537152741A0
	for <linux-bluetooth@vger.kernel.org>; Wed, 14 May 2025 18:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249050; cv=none; b=SUeFOWtG+RSVRZu81+yGIPYglzUTsE19GKmZ0iHTsEr9ok1SEff5aSgL+Dzo3ri2Q9rK4E2dtDqAZEqT3E9BC2yzu0BucMQyJGdUqTGK39JppjtIni5e6CRyUelbAR3rP7GP9nqQknCt5KetAROs4SF0GHc92nIpJh0TdA3u/Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249050; c=relaxed/simple;
	bh=L394cNs8WIYvf9+ImSK5BF3HW1Xr/ig5e96YiLtdG28=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=IorCiiT/KkTvande2VUDmsDhnPetwRDJ3cnWeU8wh8OrqIRCCWNju/JSUEXob6ICvwPDPqrfHmjt/BTCvK4qBrj0MYDkpZXnE9GgIJkN5nm+mdFhYj9iLbj4EwbvXTcCT2mRh0KWWBDg7k+2iCxBlvdoxPPekgcvBhkhNiiraKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=ANSqa5+k; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-2eee1c2.ac4-iad.github.net [10.52.167.44])
	by smtp.github.com (Postfix) with ESMTPA id 724AF7009ED
	for <linux-bluetooth@vger.kernel.org>; Wed, 14 May 2025 11:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1747249048;
	bh=PjMH5eW9GEzzgDbVGcmjDfy97pNpe8nGlGMx4uqtP3A=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=ANSqa5+kCnPSNQDuN2SyUS1S83s0VyHqRJ/CNG8SypH4sa3Lc1iQavaWwsM5dM3rZ
	 ljhPOctTCFhTYlCVLzCEkOaULR/z5zt1MkC+stXxW/nEw/yyfD1aB9k2Wxd7rINYB6
	 Kf/sDVrUY4i9LiiCTK5zTei6pURgspD8OiU5q7sI=
Date: Wed, 14 May 2025 11:57:28 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/960647/786b11-000000@github.com>
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

  Branch: refs/heads/960647
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

