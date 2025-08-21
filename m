Return-Path: <linux-bluetooth+bounces-14878-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E22B2FC3C
	for <lists+linux-bluetooth@lfdr.de>; Thu, 21 Aug 2025 16:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB9A27A26D6
	for <lists+linux-bluetooth@lfdr.de>; Thu, 21 Aug 2025 14:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF0E28467F;
	Thu, 21 Aug 2025 14:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="gA+T8mqL"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F2126AA83
	for <linux-bluetooth@vger.kernel.org>; Thu, 21 Aug 2025 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755786009; cv=none; b=M5GmJQeOXNZdn2QPn5F3t88zJD6nTIh28vifSj/ECIr6BQx4pQN25eHvUXgFd+LAlcisyRbJIGrnktd1lYCSsopGS6sa+kQJ+FP/eaFus2lBCn4h+u8ybgmXZ1JgU8Fwe59dPNQOYa3b44duY7CUySZ5VMUQB8jJwcSEkMtDpWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755786009; c=relaxed/simple;
	bh=o28B1254SUnKgpYBJAS7p+nV2IaxXw09nBjgx1ufnW8=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=A0YgNE+UdEmpCzKswn2aSHX0n0UbRe586qw1GfHX6+GXArYzV9iZUlyYsQD/nlKMueSiqD/iXUFEtSsBX9wOnQBT4rYiLOeoP6PMm/fAuXByWpt7DDhGMRVRd94K6IYZ2/u7+Fdq+0K7/uwTCXeHH2ZQ5dZWmlOjgVV+z9dcoTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=gA+T8mqL; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-9bc6c83.ac4-iad.github.net [10.52.183.51])
	by smtp.github.com (Postfix) with ESMTPA id 569336414DD
	for <linux-bluetooth@vger.kernel.org>; Thu, 21 Aug 2025 07:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1755786007;
	bh=7Kiqgsu9tY7OD4XNC2Y1NPbigzGcVwpqyTcCm+fnb0g=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=gA+T8mqLcYxHFi4rWH8aVN4vywTf+RP6fgRgFb3VBNoShLKq/2ef4cK8d67MoUdx2
	 PyYVS39srrRObiL/YPCn222NphaIpNL+4xmUfGODE+QxA1HQS1MMQfZ5KO/gpXD20h
	 ETUBsgWaGJfeaU4kOQ9GqrI/iadEdjQ46taPYk2Y=
Date: Thu, 21 Aug 2025 07:20:07 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/993678/47ec10-000000@github.com>
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

  Branch: refs/heads/993678
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

