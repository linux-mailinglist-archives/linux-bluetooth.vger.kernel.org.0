Return-Path: <linux-bluetooth+bounces-12868-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AC0AD22EB
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Jun 2025 17:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F18BF3AE8E7
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Jun 2025 15:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2822139B0;
	Mon,  9 Jun 2025 15:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="Ra4Ko4wa"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D573202C3A
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Jun 2025 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484140; cv=none; b=I4acle5FJuGSTmEdtapZq49JUj3qwJLxctoQm1+2t7tMf7Qo1fE/GLkkJUS43fSzEshmPuEBdp2HFxp/4RNJCikVW0XmjOvfJnc0wULuW1sZjCzEWuJzes12Qu8xu5hHBLzUEByvymXVQDHqPm7Y37QQ2DEuVQHTU5ebY7DbuxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484140; c=relaxed/simple;
	bh=ewF/ugwyRmw+0Kz++V8ZdgE/V+owxQARf38G1rD0Vaw=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=m4yY0TbtP7iJjY4ZfOeyxCdUQy9TbdLxEd1Luj21xf9uZanRbtv+YT9djls6hQOkqrtGLwEVhMtdEyI4Nzq+Jci1v5yU/pbvMfoX9BVp6fifrN0hEWPYjRmRmp7I+zjiX+J0kS/f+Ji5Ut9eFP20aL5ZjFMuNgCUDvr0biwx78M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=Ra4Ko4wa; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-6bb5c22.ash1-iad.github.net [10.56.208.48])
	by smtp.github.com (Postfix) with ESMTPA id 9A4F0920B85
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Jun 2025 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1749484138;
	bh=43mZ0BFAty5KZM/uIJeTJFYl8RJ6AREjQQd3CfN6Jv4=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=Ra4Ko4wa9j8vxNd2mpfzXw4BUziCmPVaUnQW+Ln1vtydRpsAx0VqPqcG1DxdoLxUU
	 UZ5seXGW1vbWwtmyhuo+d8Qk2eGPSGu/vpWdW8nqWg1qIQuwyv0G0G/Tth1KktdWMt
	 OuYr5WSBEx2Pbxqd6U9dkbQ3wjcFLz05132a9hSQ=
Date: Mon, 09 Jun 2025 08:48:58 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/969781/d69c12-000000@github.com>
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

  Branch: refs/heads/969781
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

