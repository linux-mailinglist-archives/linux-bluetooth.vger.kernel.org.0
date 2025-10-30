Return-Path: <linux-bluetooth+bounces-16199-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D79C217FE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Oct 2025 18:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7308C1896CFE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Oct 2025 17:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E450A3683A1;
	Thu, 30 Oct 2025 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="e+zPVaeB"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312EC226D00
	for <linux-bluetooth@vger.kernel.org>; Thu, 30 Oct 2025 17:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761845467; cv=none; b=YshPgdsnQB89HNfLAzecjmZvqFf1AvbqQKfbsFcQm/ocStGO2HdI40eVAFWFNxmngANghC8W3rBHArtGY+XFufruDVQBnptoNXrYCll91xlmwwv+FDRHJq+PFgBsB1Q4ip7E8IbOVI7kBIL+o9BxuxpphVSSEQIoLvVB0ER1l6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761845467; c=relaxed/simple;
	bh=x8+EmNuy/rsyZ5Vp5sKG377wOeDwpzPVjNt5DW/mHeo=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=BDI2c9hISt+XKQLyXJtOK7uwe039cjkADANYJEE65Up0Plq4nJYjwK2ZgEFzC30tc44qZzIPGOAgP96kpG3iPW2nCcFELKyhkoIRgmOOUTQriD/ym+zfECm9rMgLmHOK4REMO7hFKLUfNgJ/TjiuvCDCAAsCIiB/EPAvTFfPAbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=e+zPVaeB; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-5ef803c.ac4-iad.github.net [10.52.211.90])
	by smtp.github.com (Postfix) with ESMTPA id 287FD401325
	for <linux-bluetooth@vger.kernel.org>; Thu, 30 Oct 2025 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1761845465;
	bh=WdfMgg23I0FZYsY1IQw8pkOkWPJ1s4NujGlsoJlUWQM=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=e+zPVaeBuxDnnlKU4G7aoRlTJAl7aYuTB1baWPm/qINKZIZi6RG+OF0cUA1iHeIl3
	 /hxriWim5pDfke4VqxEhnlzThenDFC1hVh4iY8/Tymr7pdrJj5PN7wNCda+aHL5ADE
	 hWSG6NJYAMevrPbcccqteHJ9a1NWb9PuTx6OUzdc=
Date: Thu, 30 Oct 2025 10:31:05 -0700
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1017831/000000-31dd96@github.com>
Subject: [bluez/bluez] 31dd96: monitor: Add decoding support for LL Extended
 Feat...
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All

  Branch: refs/heads/1017831
  Home:   https://github.com/bluez/bluez
  Commit: 31dd968405b8e9079f22d8c1b02cd9504c82d033
      https://github.com/bluez/bluez/commit/31dd968405b8e9079f22d8c1b02cd=
9504c82d033
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2025-10-30 (Thu, 30 Oct 2025)

  Changed paths:
    M monitor/bt.h
    M monitor/packet.c

  Log Message:
  -----------
  monitor: Add decoding support for LL Extended Feature Set

This adds support for decoding LL Extended Feature Set introduced in 6.0
that adds the following:

Commands:

 - HCI_LE_Read_All_Local_Supported_=C2=ADFeatures(0x2087)(Feature:47,1)
 - HCI_LE_Read_All_Remote_Features(0x2088)(Feature:47,2)

Events:

 - HCI_LE_Read_All_Remote_Features_Complete(0x2b)(Mask bit:42)



To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

