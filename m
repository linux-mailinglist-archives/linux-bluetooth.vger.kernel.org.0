Return-Path: <linux-bluetooth+bounces-15778-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA0CBCAB86
	for <lists+linux-bluetooth@lfdr.de>; Thu, 09 Oct 2025 21:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 201EB4ECCF4
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Oct 2025 19:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B92258EDE;
	Thu,  9 Oct 2025 19:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="UKWcRmT4"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266DA1B423B
	for <linux-bluetooth@vger.kernel.org>; Thu,  9 Oct 2025 19:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760038955; cv=none; b=WIdomFz9VHStt5cMtZw4D25yDwmr8JeH1pQSVN6TZPfT2cvGmXWAyqAEgEbpe2nc2pA+D+YvEnoEFjOWmP+jXZrwfrBgyCAtyvqfV4J1/VNrObODlNfu3HzT6qkArqBzbW09Qvq3ipEW1ERsq15zGMcw1Q2BmnYEJoKMX+gcCAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760038955; c=relaxed/simple;
	bh=RXPkQKaXORnTrtbF2A18iiFRg9maVicwxwlMI49B7IA=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=HAbpGlm8AXiVXeUfPJQd7dh4mHYPWQw2KADmuCNgPmxY8WM0gIJvnMZGNjetiyUI9/IyBvkXDfkX3PFekEZaFodBxzsRJAOzIAS/Nry4QmjPYNtGdkbIl0/a20yHkczaJ5jhe3GiVI2P7eHCHrZ5LvwAuR90maXBGQ282k3PByA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=UKWcRmT4; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-fd2241a.va3-iad.github.net [10.48.153.32])
	by smtp.github.com (Postfix) with ESMTPA id 20C9E4E132E
	for <linux-bluetooth@vger.kernel.org>; Thu,  9 Oct 2025 12:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1760038953;
	bh=VjWGvorOOUDqhjqS3Y0KNmLD5s1YyjzSICRP16FLhiA=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=UKWcRmT4f39VB/nMHDrMH+mOoB39kl97OpLOMgXwjH7zwKRXqoYEjx4ni48P0cEF0
	 n2S9M3KBYhR+jJwxWYidgn7Jpb/KTk0O+vx5JDjc3eYjG+ZVWnKdk1ITXVomM22zDy
	 J44M9e5KcO7hAfn713xVXjj9Dc1iWBszQFMiUxMo=
Date: Thu, 09 Oct 2025 12:42:33 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1009812/029fc1-000000@github.com>
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

  Branch: refs/heads/1009812
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

