Return-Path: <linux-bluetooth+bounces-14090-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6847B0664A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Jul 2025 20:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68A713AA875
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Jul 2025 18:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E6E2BE634;
	Tue, 15 Jul 2025 18:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="fmDkNL7d"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4487261D
	for <linux-bluetooth@vger.kernel.org>; Tue, 15 Jul 2025 18:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752605504; cv=none; b=rm8mNEaKzy2hjbrZnUI7+t6YvASu4+XDOn3bKRp/KKupLoju0rv9TlFHLq2LKjD9kxtx23FdrKp5ih+wzvR+xHzZvG+cAZoRq6A8yCahNVkM9+gFzUv9AdNk/mlewO9SWvTTU3MDF2xRB5DxlJCbpfjWMMcsXEzwzkxjYnnq9lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752605504; c=relaxed/simple;
	bh=N6WkoO1LqUHVpx6WSiV0SB7ULDocQT3ETwDmB6OXfTY=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=I3rSH5uXG8dz0NQWPV9ejxYNNlOWXCsGEgo2Xw+2RBVwo++5LW8XHTtmdjZz2rM6nCBEZo/zLrgWKZ5WMbv2EvLnwdAh2imk+AXehEULTJ+wQ7mqt7SNiRAHmoR7rgDmTIUExArGKLfLFhiT6b6fzcetn1df75xONd9YqI+Nbpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=fmDkNL7d; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-61de8af.va3-iad.github.net [10.48.144.43])
	by smtp.github.com (Postfix) with ESMTPA id 503954E0D5D
	for <linux-bluetooth@vger.kernel.org>; Tue, 15 Jul 2025 11:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1752605502;
	bh=lhh066/zA9ZrdCMr0jXZklvgEq5LUJcFDEzuHT0cSGM=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=fmDkNL7d1xlebdcPzd3cmKoss/BIEeOsWkPoyR5ulTrY4dJ27z0xOuBbDUQ3xwJBQ
	 xqTn2KIzjzn+3wUiKZ2CUnfJOR1fTA2sl9x1WUv892BOg5tI3aWxVUi2vrtsdArqEv
	 jmgv3aoqY2/bkFmQkE6WC6j+lBlqlZfoFhl0XTx4=
Date: Tue, 15 Jul 2025 11:51:42 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/982213/e40ecb-000000@github.com>
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

  Branch: refs/heads/982213
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

