Return-Path: <linux-bluetooth+bounces-12911-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 898ACAD44A0
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Jun 2025 23:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4ACE2178BC1
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Jun 2025 21:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D95A28315D;
	Tue, 10 Jun 2025 21:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="JOE+nEnV"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D3B283146
	for <linux-bluetooth@vger.kernel.org>; Tue, 10 Jun 2025 21:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749590322; cv=none; b=ubaSs9iLxcspr621RXbArP83jzVACwJY4BQ3kIiuSZac0kO691nJhkTLy63jcmKLPNMWOS2OT2TyV48AacHJLbAw8M/hKeTxlSoOOU9AOYBfnbJaZ7nan8ZqHg3RuNXYkyQrZK2yIP5pcj/do9fyccwOqWew6jOcXI28JXn8zLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749590322; c=relaxed/simple;
	bh=W5Em9+EECPYzPzBcxacGDwD6TbpGn6b+o21xR8NhmFY=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=eZzi+QxY0Pk3C9QQnrU7jPfL2Jg2ndnyqEjwiits0YgNUl6BPPWaBBpyXZgy/9X3tbBWinsLaqrIjtk5t3GjfWRR0Lw00XE/4g6y6sXaVy1HwS2E8u2/fU9PAMlHbBardI8OJqqjNGC0raylwaBj0+Sz2bFqh2k/2Ha1RhvIG3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=JOE+nEnV; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-30b42e5.ac4-iad.github.net [10.52.136.18])
	by smtp.github.com (Postfix) with ESMTPA id D9483640248
	for <linux-bluetooth@vger.kernel.org>; Tue, 10 Jun 2025 14:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1749590319;
	bh=WHaHaEnzgnOl/4IZ4XHcEqR7vjIHOzhwepboT2sO3P4=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=JOE+nEnVBnFTxpsKtnvR27RFzJ9NBZYrCWc4/TJefYSLc8Lt6PCnPOKTlE8zDNvwD
	 dadBg826MroUnjs2BtXlyiNCF2h0XGs8MdUAVSIIl/8unpfhxdbv6TluklNpnAPpGM
	 a8acar36zZDwo/iEe0gRjTWzr0CB0eTEA1lojuQk=
Date: Tue, 10 Jun 2025 14:18:39 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/970489/653039-000000@github.com>
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

  Branch: refs/heads/970489
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

