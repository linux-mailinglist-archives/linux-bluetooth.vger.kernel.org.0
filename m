Return-Path: <linux-bluetooth+bounces-17756-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 792DECF568D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 05 Jan 2026 20:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88961302F2E5
	for <lists+linux-bluetooth@lfdr.de>; Mon,  5 Jan 2026 19:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AB231ED86;
	Mon,  5 Jan 2026 19:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="EIbKxFZw"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9782513FEE
	for <linux-bluetooth@vger.kernel.org>; Mon,  5 Jan 2026 19:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767642103; cv=none; b=icicJMa4iw1HaRT8OeyCEfOgYZAYDyDQlPOK/p1sidP+f30OsiBp5QZCEvbO00J3h85AvOFtn3Aji2NTbYSxKxPwcvZ8EleuHKjB4kJ+qp8FLXnWIEDVyuxRDgejMuMKUcaMDggxA2p8GeRaje/DfxPQ1pq040w+GWC6lG7iXTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767642103; c=relaxed/simple;
	bh=p9w3vciB+ywk3vi1VbAM2sE349DRKL7/EWtUwuR1xik=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=nixFrO4Z6/I5cquY8AtWtEWQ1/wOAw8vhXB8tMILft72zO6q3UdVnG5MS180E7IPKFiYwkE1Ir+/ZITZbEIvL0K415+rCSNcDz+nTyT51hh0oB0Hxmg1/ByyCsSJZDCsFOiF1cOo37c/RSHt42tQY8VKi9BjubuGqZJtAdW1fh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=EIbKxFZw; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-ce3e992.va3-iad.github.net [10.48.171.36])
	by smtp.github.com (Postfix) with ESMTPA id A9E1C4E03F8
	for <linux-bluetooth@vger.kernel.org>; Mon,  5 Jan 2026 11:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1767642101;
	bh=AUZD1vU+AlvcbNHPT+TBz8MYJiVSffiwWEhSFhhX6KA=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=EIbKxFZwBn7XIM9NOF9YUMWJoZa5NIxwE3v7ImNwZnxHJAkjyPh8gWqcYWih3AfJ6
	 +ZbU2Vo3KA2Q8baPnVx8zXRg3QvJRlOoKHFDU4ESsQaWTHKIcf/0I0fXY1cbpJGw0p
	 Ev1tmgN/7VtyBXp51sUQ0vD3xtG7vDBwwcslISBQ=
Date: Mon, 05 Jan 2026 11:41:41 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1037326/d031ad-000000@github.com>
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

  Branch: refs/heads/1037326
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

