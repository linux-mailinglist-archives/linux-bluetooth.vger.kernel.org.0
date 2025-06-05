Return-Path: <linux-bluetooth+bounces-12801-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55930ACF86F
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Jun 2025 21:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EBAE16AF85
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Jun 2025 19:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09BD27D779;
	Thu,  5 Jun 2025 19:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="DwaBWKgH"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E9927B4FA
	for <linux-bluetooth@vger.kernel.org>; Thu,  5 Jun 2025 19:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749153340; cv=none; b=ggFQK+Ho6p/wW/RTIGJxMXbhbTt7GEfIYSav/j35x3102uLV4BOZVEoZjpXcbSPvsV4FNpMWVJFKGUtGFX3zc3Y2Ye7qKTQsXWRDREBohAjXz+r1JaJkG9YvV0CKgSaxMzsQaIF63Sqqfdw47biDvFJtsw/6TusCt/OJImvRtVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749153340; c=relaxed/simple;
	bh=anevuxY/SRBTJIoLVWJt4l8VuPwUTVgVDG3WZ3lAgHo=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=jtT5DKdjHXFz5+ax37GBlq5tZvH2fQKGi76gqzOXgoiXyF0PmOXlVOv1Nztct3ohveWCkOEtCLT5RfSjRoXLB1NyyIKzNw5IUaBRhqEEEZ6qIncr2RRFZN6uMLESC5HSgywiHp2L6Ly+IivBAcr1sPvi389yeLUl2UrD6JsuhQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=DwaBWKgH; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-2488632.va3-iad.github.net [10.48.182.41])
	by smtp.github.com (Postfix) with ESMTPA id 1E5244E0C00
	for <linux-bluetooth@vger.kernel.org>; Thu,  5 Jun 2025 12:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1749153338;
	bh=9G5Kfq6AYxQqoCHus/snWfnVssdmetNZdAGYAscBUgw=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=DwaBWKgHTveki7kQH8mSvFguxsnZc4MeF6yZK5MsXjEKOSMttBwsrj9O/flBjz3L7
	 lhO1OWCeNCrlG+S7gyBkzMDUmgUM72MH8p1e4G+LXVDcxLk1hXtJKFdOUa7ihw0ZE6
	 JYZbIlNppoLvihlMGi4GlClyYukr/doePZfDV8hQ=
Date: Thu, 05 Jun 2025 12:55:38 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/969028/f0f469-000000@github.com>
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

  Branch: refs/heads/969028
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

