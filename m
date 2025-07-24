Return-Path: <linux-bluetooth+bounces-14268-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EB4B10C40
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Jul 2025 15:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72EC81611AC
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Jul 2025 13:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FD62DE6E3;
	Thu, 24 Jul 2025 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="eb52YNQI"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-28.smtp.github.com (out-28.smtp.github.com [192.30.252.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E292254844
	for <linux-bluetooth@vger.kernel.org>; Thu, 24 Jul 2025 13:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365193; cv=none; b=OGmGOpUjhkwQN3FIsKYYTLTfctN/gOMcbH7eTXADJYUSYHv9uhlgUHLZ3by401fDphLA2uiuP3LwIQtvvQcyyFH8sZ5gKME6hHIw4kTIi10WGaVT6OlYGxUbR2lua9xwW/0+R0yu7DO/EcpJIVloxZnwNVQ1ZHBvoC0XqHPsiy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365193; c=relaxed/simple;
	bh=+XBV6W0lLFPnuhOA775uxN5KKrycpnLkAwQVC8cUDWg=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=jSldv1RFkv1FmlmfG8UTKnPDpx4HL2mvUs+i+fZQqkUqRRmqnrw3XghkNo7YfqmD8J9Sifkk5FGdC+/Bb9CEzlNR2bHqOY+WtIH5Ueo6C0jpe62VhP+Fgzd+iwpgj8l87Jfbc6xbWs0gb7j5OWjLs0OjmR3DGdJpp3tfcGXh1UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=eb52YNQI; arc=none smtp.client-ip=192.30.252.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-726c29b.ash1-iad.github.net [10.56.151.40])
	by smtp.github.com (Postfix) with ESMTPA id B57A4921083
	for <linux-bluetooth@vger.kernel.org>; Thu, 24 Jul 2025 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1753365187;
	bh=sc6MyFY20dGb+5dCtEFsGT752pirH07n7HLsMSx/60Y=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=eb52YNQIt9b7a1js7TqNMT1CfMU3SMvtBso+f1bXCgcIuJs1VWpRXQ3OUaBI/N3eW
	 phYnSFVo8NZvRV1wM8EPfP+ddlynGyqGnewQQJ/M/k0oHcD0Kn2dnxCRLMgt1RYuyL
	 63TpM1oxkurQ0PuAGgSu3dZMqJ+sLRjjlxOF/fdk=
Date: Thu, 24 Jul 2025 06:53:07 -0700
From: kirankrishnappa-intel <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/3c0693-cd1314@github.com>
Subject: [bluez/bluez] cd1314: monitor/intel: Add decoding of cnvi core
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

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: cd13141c95c6ec68ce3d72f06ff2a181911866d1
      https://github.com/bluez/bluez/commit/cd13141c95c6ec68ce3d72f06ff2a181911866d1
  Author: Kiran K <kiran.k@intel.com>
  Date:   2025-07-24 (Thu, 24 Jul 2025)

  Changed paths:
    M monitor/intel.c

  Log Message:
  -----------
  monitor/intel: Add decoding of cnvi core

Add decoding of cnvi core from Intel read version event.

bluetooctl> hci.cmd 0xfc05 0xff

HCI traces:
< HCI Command: Intel Read Version (0x3f|0x0005) plen 1
        Requested Type:
          All Supported Types(0xff)
> HCI Event: Command Complete (0x0e) plen 122
      Intel Read Version (0x3f|0x0005) ncmd 1
        Status: Success (0x00)
        CNVi TOP(16): 0x01080901
        CNVr TOP(17): 0x00002a10
        CNVi BT(18): 0x001c3700 - Gale Peak2(0x1c)
        CNVr BT(19): 0x00313000
        CNVr OTP(21): 0x0344
	.....
	.....



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

