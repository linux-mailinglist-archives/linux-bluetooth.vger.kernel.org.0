Return-Path: <linux-bluetooth+bounces-16532-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC01C51465
	for <lists+linux-bluetooth@lfdr.de>; Wed, 12 Nov 2025 10:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C293C420110
	for <lists+linux-bluetooth@lfdr.de>; Wed, 12 Nov 2025 08:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A41822FD7B9;
	Wed, 12 Nov 2025 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="DQpPTRaP"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16BC23BD1B
	for <linux-bluetooth@vger.kernel.org>; Wed, 12 Nov 2025 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937922; cv=none; b=UGPlLmSzVZqSpxFWN9HlmL4NYidnh1KNJvZHsJ4Oqx4nq4JyuatzSLxyS5c64hC4G9Tce7LDuH+t7HORx+a01lgd6IfhKxxLEfgd+m2GMWiuOiiftEoIrPXXc1OGsuWBOCC7dzoWMXX/+lBX5KSUuHMrjrNmGi/hZsLO/IEfJMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937922; c=relaxed/simple;
	bh=LHbOyh6lm+V6xsDxSaH/53Rq9Nos9r5AlPbCMs8nTf4=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=hTI3NRFpuKdB5Is9D9rhydUiKoQ+JgWWPAWvUh+00KXLTcCgbRuT7heGkB/JkLcKPVHtWUmq9AanmA0AQgbyPsNfrIRD+zMkfQbJLGG7+gjCEsc4m1R8E/VjA9/84JZlY4Ykrg0AUqwA6VTMkTEpJh2IGiJzHbsIAwjoJxTSXI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=DQpPTRaP; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-3e15589.ash1-iad.github.net [10.56.196.55])
	by smtp.github.com (Postfix) with ESMTPA id 0C4FC920959
	for <linux-bluetooth@vger.kernel.org>; Wed, 12 Nov 2025 00:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1762937920;
	bh=M7wTsVOj2OHFTX0Rz2aeChj4ZW/uqhpK1PgZ3b3/dHk=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=DQpPTRaPA3pUtjHfxvw+kSTG1trTeB1kGzzofPLqTVCFc9AxPcE9+kG3h5YDW0b9j
	 Uec/gBohOBekIIZYotfcq6z9utxN81xrclaBaPow+4RmjkpE2cJjCgNC4ve+PKWQUS
	 dZK3MfVX24yxKvgLhZTv8SdzTfFnPnqwA8E89QXs=
Date: Wed, 12 Nov 2025 00:58:40 -0800
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1010619/aaf853-000000@github.com>
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

  Branch: refs/heads/1010619
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

