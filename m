Return-Path: <linux-bluetooth+bounces-11281-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75EA6E01A
	for <lists+linux-bluetooth@lfdr.de>; Mon, 24 Mar 2025 17:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3FF2170399
	for <lists+linux-bluetooth@lfdr.de>; Mon, 24 Mar 2025 16:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EC22641F2;
	Mon, 24 Mar 2025 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="G7zoh1GQ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-23.smtp.github.com (out-23.smtp.github.com [192.30.252.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E001B2641EA
	for <linux-bluetooth@vger.kernel.org>; Mon, 24 Mar 2025 16:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742834770; cv=none; b=lXrWOJrL2nRvtlsaupIO0EiEFbNBg6y5yl+kZeNG4Ej8M9B8bgdWDZmTlnFhSumeHUVJ/Z/Jnt9wpCMQ4pthzA2I0/jkEmzYuimIHhiSWBP+Wkh9qRs4SG/8v5ZGvuRImDy+PWDgGXJ++Mmk7IoHCAgfWISUoqF5+SFetoIKnTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742834770; c=relaxed/simple;
	bh=MwsRNSgWZWEYNj4IrFucJVpnIjRYeZHX6S47eATX7kQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=NrtxPfT68TzqzdxNOCq+fibCyTQ29DoMKjI1gk/cj4SxBmVEZTVNNXgXZILwAUbGdfsdfG7a5e/RBdEt4M6+7sM9H84FLiROBDXvioS99scJZcsUlWbgI7WV7I9+qVuLwmyeDYyf0RWbxiIu5GUfHy/xQaG63cVU9raKWpxEvlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=G7zoh1GQ; arc=none smtp.client-ip=192.30.252.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-c6d2e56.ac4-iad.github.net [10.52.139.43])
	by smtp.github.com (Postfix) with ESMTPA id DD23F211F3
	for <linux-bluetooth@vger.kernel.org>; Mon, 24 Mar 2025 09:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1742834767;
	bh=iIyMEibm6cgXJg/4sCIRrzFuYKZ//9cr5KIt+wgB7vo=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=G7zoh1GQUkZ7SIap6RWhjk7qo6smSd+3WtqCXIP+/5eud08IkvxEVsXgrWgh4oMRW
	 Z1r/1KNChSGT2Yu3D5OlN8Q6mMcrCamlcN+p9NQQXoKm0EmObeYIghS1cRx9b8VhYk
	 eCRfLJRYnTwsyw1CIP0bqfMKU4j/uK6LS28DgJ8I=
Date: Mon, 24 Mar 2025 09:46:07 -0700
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/f77e72-912e2f@github.com>
Subject: [bluez/bluez] e45343: mgmt-api: Add missing Device Flag
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
  Commit: e45343a37bf8a30ba1059743a3645551639974b7
      https://github.com/bluez/bluez/commit/e45343a37bf8a30ba1059743a3645551639974b7
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2025-03-24 (Mon, 24 Mar 2025)

  Changed paths:
    M doc/mgmt-api.txt

  Log Message:
  -----------
  mgmt-api: Add missing Device Flag

This adds the missing Device Flag - Address Resolution = bit(2)


  Commit: cf8b2f308e31be757b5aa08a6c11887244cb5b21
      https://github.com/bluez/bluez/commit/cf8b2f308e31be757b5aa08a6c11887244cb5b21
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2025-03-24 (Mon, 24 Mar 2025)

  Changed paths:
    M doc/mgmt-api.txt

  Log Message:
  -----------
  mgmt-api: Add LL Privacy setting

This adds LL Privacy (bit 22) to Read Controller Information so it can
be propagated to the likes of bluetoothd.


  Commit: a0d6d3c78b28e667e53524b5e5961711e60ff13e
      https://github.com/bluez/bluez/commit/a0d6d3c78b28e667e53524b5e5961711e60ff13e
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2025-03-24 (Mon, 24 Mar 2025)

  Changed paths:
    M lib/mgmt.h
    M src/adapter.c
    M src/gatt-database.c

  Log Message:
  -----------
  gatt-database: Fix always registering CentralAddressResolution

CentralAddressResolution shall be conditional to LL Privacy to avoid
peripherals assuming Directed Advertising can be used which may lead
to issues like:

Fixes: https://github.com/bluez/bluez/issues/1138


  Commit: 122c9fcacfa93266051de2edabef608bc63986a3
      https://github.com/bluez/bluez/commit/122c9fcacfa93266051de2edabef608bc63986a3
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2025-03-24 (Mon, 24 Mar 2025)

  Changed paths:
    M tools/mgmt-tester.c

  Log Message:
  -----------
  mgmt-tester: Fix missing MGMT_SETTING_LL_PRIVACY

This fixes the tests which now requires MGMT_SETTING_LL_PRIVACY (bit
22).


  Commit: 912e2f54fd57ba4fbe66b6331149d7131122ad09
      https://github.com/bluez/bluez/commit/912e2f54fd57ba4fbe66b6331149d7131122ad09
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2025-03-24 (Mon, 24 Mar 2025)

  Changed paths:
    M monitor/packet.c

  Log Message:
  -----------
  monitor: Add decoding of MGMT LL Privacy setting

This adds decoding support of MGM LL Privacy setting (bit 22).


Compare: https://github.com/bluez/bluez/compare/f77e72c3ab11...912e2f54fd57

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

