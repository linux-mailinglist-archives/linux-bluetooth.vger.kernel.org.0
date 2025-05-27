Return-Path: <linux-bluetooth+bounces-12616-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3295FAC5C37
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 May 2025 23:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F08FE4A6EA7
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 May 2025 21:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB31F1465A5;
	Tue, 27 May 2025 21:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="WRp0WxiM"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-25.smtp.github.com (out-25.smtp.github.com [192.30.252.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287ED213252
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 May 2025 21:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748381352; cv=none; b=dD9KpFSUihe8ygdgmoxmicxM6RhyjAsgTsUDj0ZvJlOL9rTx15BOAMRsJggvPj0t8M/O568Jp+s7fHUNW569aGG1wF3i/Luyu+NOfIxncK2txZtSG6yLge+tJFBmUqDpG5IvBYnoAbhofl+msQwCHHHS5mh1HyvxZBqsucU11nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748381352; c=relaxed/simple;
	bh=KaX/CwGePs3DJdj8yjkMOJ1myrRgTqRlb4u1h5r8a2c=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=FRzigQGyVoMwNKhA/XaFMkA2+7f5CF+JpkarfZOPxmNPwxmwXP19HNYs7zqXeo/mmppxXQafbm07d+bwsnLPsVVU0M90ORgOGuetI0dyYf1JEhLVxGjzjUr5g//5I4MwPOHIi2wBgic313j7p9iGKcvWA5vtvD84wR/pO8K2+rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=WRp0WxiM; arc=none smtp.client-ip=192.30.252.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-a047e84.ash1-iad.github.net [10.56.189.46])
	by smtp.github.com (Postfix) with ESMTPA id 03ACE1405FE
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 May 2025 14:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1748381350;
	bh=FNrK0+d70H9Ig6KCFjkEowlVnxAq9X+rJP3MYq/5Syk=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=WRp0WxiMGqwyXMVK4DHdxkpQt4ZWvJOhTnzAu6xktS4xYPZkrHpA0LNC/hTJqd8lU
	 7crPNrHY5Ees9Xrk36n7BqeuPy9gxgWjA78pd4yyOtzNXb6sWLFdL/ZGtqIc8Flq1t
	 2OnAlPF+JaFtBz7EQZnN0fbUNSGsSnzbZ/y7Fru4=
Date: Tue, 27 May 2025 14:29:10 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/966677/a08983-000000@github.com>
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

  Branch: refs/heads/966677
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

