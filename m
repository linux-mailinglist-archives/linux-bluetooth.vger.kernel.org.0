Return-Path: <linux-bluetooth+bounces-12608-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 549B5AC5093
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 May 2025 16:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13C0E1BA019E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 May 2025 14:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1F7278768;
	Tue, 27 May 2025 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="AA5yu2gN"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E742741AB
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 May 2025 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355256; cv=none; b=Y1xOWa/NtEaZh5lGKb0RG+Ztb7KL3zti5xkVzz+FjvgNO6KYDupLJ7wJEun+VnUvUZvZjpW9+QBMXI9TE4mz+soTYoWBVsmEUavmTFG2zFsMvsia0ksn3ZneM4hhYoctVHbmF72qHNwHGRMu2YcoydLhMGMUyqGB1yhjuk+DNc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355256; c=relaxed/simple;
	bh=6yTykHCa/gBRRmHzNR2zGb+la23UvKM3xrtmkcjPDqQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=FCqj1muF+OI9aJOGnhHY/twBVCD7W4g3RtQZ/ujEyCWASXZiMhL8zmJJek/oiTuxzFwo0t+zQSnjwy+1S5qN4BAkHUTvSWAdT+Nab9Yr4P0PosIaBrUVH6UIQa6Q3HOiOcP1QULbwvbIjU0cN7ifXR1QGexi0kl1fciVQDQw7zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=AA5yu2gN; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-196615f.ac4-iad.github.net [10.52.166.56])
	by smtp.github.com (Postfix) with ESMTPA id 83FFF6402C3
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 May 2025 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1748355253;
	bh=/bp09gM2c9WoIshrWIJ/ysLD2qCkYUQKx09lgtMKHvQ=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=AA5yu2gNsunnoyaSv0CAqjUF30EPgAi9ksm+lKkWhFAqYBIZF/0kfELVxujO9KBLw
	 IAWUsM+0B4dsCNUbC53UvwaigBEyjg3gs+rUlnlVCXW9qdwnVpaY7Gud9ELzSpN1h4
	 qFZkrUQqX9shk1VC1hRpnAQZt7O6ASxPUu3+0p3U=
Date: Tue, 27 May 2025 07:14:13 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/966569/946f22-000000@github.com>
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

  Branch: refs/heads/966569
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

