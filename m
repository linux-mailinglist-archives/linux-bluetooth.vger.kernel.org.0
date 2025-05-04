Return-Path: <linux-bluetooth+bounces-12217-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7BAAA8833
	for <lists+linux-bluetooth@lfdr.de>; Sun,  4 May 2025 18:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3A2E1895C5C
	for <lists+linux-bluetooth@lfdr.de>; Sun,  4 May 2025 16:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E2C1E1DF2;
	Sun,  4 May 2025 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="eHCSxIlF"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-22.smtp.github.com (out-22.smtp.github.com [192.30.252.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C38070807
	for <linux-bluetooth@vger.kernel.org>; Sun,  4 May 2025 16:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746377717; cv=none; b=puH88+/aY3b5hqmKxYr580QMPMoZOfH8qv+p/g1pjOmBhDdZK2YFIT9isOig0fmPlGOGPyDm11PZQjRMG7uv4JwTrlhu+7ozFdh06w4Rb/V/nYHl8YuOmayQuPL5/7oDne5hvT1/yJ75xzNWSugdMHoJbq1dZVIUj7qqrK2sR28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746377717; c=relaxed/simple;
	bh=86dC5rsHWslERL+XbTtt6en7ma32K/n8bK3+ymZbGsA=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=ptk9fQQUfRpQxZm44hSzK8gNn+0LwIo/PuA3hVFGaZlxskFzmSuT9PiJohaNZlnJhIWsOfkyY1usKM0qw5EWkFieN9Zeg7rx+4eCvWIEjIEkmhvHIM/YFv4wOKtGla3eoA3UYUKDhnrHTDxD/DS7sV78hZZHuYiOcLg8B+hMLKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=eHCSxIlF; arc=none smtp.client-ip=192.30.252.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-aedce9c.ac4-iad.github.net [10.52.177.37])
	by smtp.github.com (Postfix) with ESMTPA id A29A220442
	for <linux-bluetooth@vger.kernel.org>; Sun,  4 May 2025 09:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1746377715;
	bh=ELzHortjmhi3qKTLIKAJfSRBfNMSE8k0cEIEvElb+h0=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=eHCSxIlFwOk3l93u0/VikDmwls8Wcjb6EY3fk8LwQdR/03Brz8epwsyRzC3uxDOFq
	 89epp+QTDnIxJJSlFQgIjJW1ZmTJihIrpUx1YfelRZwYXPExIPulSLbH8BK+SWrHrE
	 9CukZ6l50IEmbD50CmgBH7KxA0VTi/WUsmW97HxI=
Date: Sun, 04 May 2025 09:55:15 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/959451/370c42-000000@github.com>
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

  Branch: refs/heads/959451
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

