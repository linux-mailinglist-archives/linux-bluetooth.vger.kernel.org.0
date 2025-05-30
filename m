Return-Path: <linux-bluetooth+bounces-12684-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC340AC95DD
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 May 2025 20:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9CE31C20B1E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 May 2025 18:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103522367D6;
	Fri, 30 May 2025 18:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="b2VOI/vB"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-22.smtp.github.com (out-22.smtp.github.com [192.30.252.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A43E2868B
	for <linux-bluetooth@vger.kernel.org>; Fri, 30 May 2025 18:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748631274; cv=none; b=Z5OLiN7fWJ9D8TJl/mPdEdMR2wVCn69yq/XkfB1WpnNVNR7hOC6Din0Fn2Hzfjdy3/TiWhskaXzUHBt9THQRNEWUtR4NQPOJ0pZVGeJtn0ZhqT8ElF0V7XsIYl1cbqPHOG4z9kldzwdydzXOz1AgFCHfLfYDLwp2IcO4FGkbSfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748631274; c=relaxed/simple;
	bh=MbhOxALvGf+bFhlvbiGLQ3ufHbOezzrUyDgCScvagG8=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=Yu2aN8uFKMofYM0oNqztVx0n9JrHhp6460B8NS3m1vhCWoQOswUrO4XiYrFUV3fQvNMSJo7VKmyzVIKNfZ72UVMAPMmrFLfNrZ//dORcXFqbfAeWnMRIUAEGE6+oymAdfNFvmto37EOO/ctLsSa3nLkXjypljq3dkTOmFHXnBa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=b2VOI/vB; arc=none smtp.client-ip=192.30.252.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-44aa45b.ac4-iad.github.net [10.52.175.51])
	by smtp.github.com (Postfix) with ESMTPA id 16E1D20787
	for <linux-bluetooth@vger.kernel.org>; Fri, 30 May 2025 11:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1748631272;
	bh=3xMXAzrnrLHlyBrbHwDX3u+IpsXrfIq11K6MBJXa02M=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=b2VOI/vBVr4bA3ZogpiZbXEaAwX8sfKPAhqJDmHaeSQf8QeuynanRH32YuH98uAwJ
	 LFVyGcRMKs/cJ6vnPGqyq0ZjVkelHfMDfaKxhSRseeMBeQ2zdK9OT2gYL6A31cqhq8
	 ABl8NKmMd5nGHtIt/MZHkgOBn/WNtr/ymFCDx/eM=
Date: Fri, 30 May 2025 11:54:32 -0700
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/967697/000000-d0b56b@github.com>
Subject: [bluez/bluez] d0b56b: doc: Remove extra identation
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

  Branch: refs/heads/967697
  Home:   https://github.com/bluez/bluez
  Commit: d0b56b1099b0a8526a4645710f3d4f3770e8d4f3
      https://github.com/bluez/bluez/commit/d0b56b1099b0a8526a4645710f3d4f3770e8d4f3
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2025-05-30 (Fri, 30 May 2025)

  Changed paths:
    M doc/org.bluez.Adapter.rst
    M doc/org.bluez.AdminPolicySet.rst
    M doc/org.bluez.AdminPolicyStatus.rst
    M doc/org.bluez.AdvertisementMonitor.rst
    M doc/org.bluez.AdvertisementMonitorManager.rst
    M doc/org.bluez.Agent.rst
    M doc/org.bluez.AgentManager.rst
    M doc/org.bluez.Battery.rst
    M doc/org.bluez.BatteryProvider.rst
    M doc/org.bluez.BatteryProviderManager.rst
    M doc/org.bluez.Device.rst
    M doc/org.bluez.DeviceSet.rst
    M doc/org.bluez.GattCharacteristic.rst
    M doc/org.bluez.GattDescriptor.rst
    M doc/org.bluez.GattManager.rst
    M doc/org.bluez.GattProfile.rst
    M doc/org.bluez.GattService.rst
    M doc/org.bluez.Input.rst
    M doc/org.bluez.LEAdvertisement.rst
    M doc/org.bluez.LEAdvertisingManager.rst
    M doc/org.bluez.Media.rst
    M doc/org.bluez.MediaAssistant.rst
    M doc/org.bluez.MediaControl.rst
    M doc/org.bluez.MediaEndpoint.rst
    M doc/org.bluez.MediaFolder.rst
    M doc/org.bluez.MediaItem.rst
    M doc/org.bluez.MediaPlayer.rst
    M doc/org.bluez.MediaTransport.rst
    M doc/org.bluez.Network.rst
    M doc/org.bluez.NetworkServer.rst
    M doc/org.bluez.Profile.rst
    M doc/org.bluez.ProfileManager.rst
    M doc/org.bluez.obex.Agent.rst
    M doc/org.bluez.obex.AgentManager.rst
    M doc/org.bluez.obex.Client.rst
    M doc/org.bluez.obex.FileTransfer.rst
    M doc/org.bluez.obex.Image.rst
    M doc/org.bluez.obex.Message.rst
    M doc/org.bluez.obex.MessageAccess.rst
    M doc/org.bluez.obex.ObjectPush.rst
    M doc/org.bluez.obex.PhonebookAccess.rst
    M doc/org.bluez.obex.Session.rst
    M doc/org.bluez.obex.Synchronization.rst
    M doc/org.bluez.obex.Transfer.rst

  Log Message:
  -----------
  doc: Remove extra identation

This remove the extra identation which doesn't really matter for
manpages.



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

