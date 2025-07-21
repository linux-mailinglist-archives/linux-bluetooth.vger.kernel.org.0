Return-Path: <linux-bluetooth+bounces-14184-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB4AB0C205
	for <lists+linux-bluetooth@lfdr.de>; Mon, 21 Jul 2025 12:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BDB218922D1
	for <lists+linux-bluetooth@lfdr.de>; Mon, 21 Jul 2025 10:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FC828EA63;
	Mon, 21 Jul 2025 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="QOxWOKt8"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-20.smtp.github.com (out-20.smtp.github.com [192.30.252.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B5728FAA8
	for <linux-bluetooth@vger.kernel.org>; Mon, 21 Jul 2025 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095469; cv=none; b=spfBrS2wOocDJN7KjaE5ODMTuAuBsmodmQvLicV9vOWxpUdAx9wN4euwDF+kXCBJLrJ8Jk3VW6MxE+COvOCnxC6/Cs0oesynDyIApyu6Z31x5x5RmCrwoc+vgC1OSEehxXozxFdciipWLN3ZHEpB9hi9IU+9zVgynMtPotgzUbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095469; c=relaxed/simple;
	bh=f47WEY824pM1k6rGwy2Fw8REBgELBQcZzBKSu0Jss5w=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=NsO4j7yh5rC50Xcvl1Z/EpVgzp1TYKN5d4INVnmRHrVSE5dNXxk6U/fM2vAojUtRgRTCF3v/BZ+2brgTQKeoLFID8yD0xv7BoPqEsucEOI702iwXgLZSwCXTQdz69tyvsX8xQRK6L9Dv2tPxamTZorLRnOXN5zbC/JkIxfuV21Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=QOxWOKt8; arc=none smtp.client-ip=192.30.252.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-d9d068c.va3-iad.github.net [10.48.168.41])
	by smtp.github.com (Postfix) with ESMTPA id 57D8C8C06B3
	for <linux-bluetooth@vger.kernel.org>; Mon, 21 Jul 2025 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1753095467;
	bh=aDWurBIre/llf3+L1WlRztElbudLZn/wjvxhSvdON0E=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=QOxWOKt8T6HSzJUDrihkj9aErYc9zNqQFMBODzxTwleuGJq54wV4x527aIyBS/hpl
	 8EAbYOLlYJAFye4+qn/jIQ0csl2D7585sLgVv4UkcmDO2sE93HP2LnQlIFhdCv6qSA
	 Ec2moQV9rPVYf4ZgIE3dtxA5+Tq05DkcWi5Nv26k=
Date: Mon, 21 Jul 2025 03:57:47 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/974481/fccc3d-000000@github.com>
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

  Branch: refs/heads/974481
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

