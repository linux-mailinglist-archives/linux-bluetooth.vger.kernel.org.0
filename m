Return-Path: <linux-bluetooth+bounces-17295-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD9DCB6DC6
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Dec 2025 19:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17F4F301A34F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Dec 2025 18:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D475A319859;
	Thu, 11 Dec 2025 17:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="k+FltTTj"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-24.smtp.github.com (out-24.smtp.github.com [192.30.252.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B81531A04D
	for <linux-bluetooth@vger.kernel.org>; Thu, 11 Dec 2025 17:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765475801; cv=none; b=Nwbc2I3pJzbdHZEDEoSOwO5TvT6lKw5ShZk9S1Mp166qxgGyAy95VhxQPhU3amSHIxPe0UBecjnqB96tTcyDemxViaUsEAczoKPoFIKa0IngtSpAAQ5soGWOb7E6pVGumB0ZEHmTWOIUzltlUMKmwTxP3r21dNw+BLG4MtxZbyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765475801; c=relaxed/simple;
	bh=Xpn3K0C62AebqsRloKKr64CtReH3SQIjj8yR7dupWWA=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=grHawmoclV9WY7FSnPcgKMlQRVM/fLJF2H7viGuoYcdsGmiE4JcUs+G8bRW7QpDOqXMwJ+8bU93Nm+nHwlrucLgBHnjsVhBbJiXqqMj1kXvAEcQOELO1U34ln4jfLAk3L1QZN8WPHkW4s+tCWQZY4SQtqnVfUkeE2VDwzgxthdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=k+FltTTj; arc=none smtp.client-ip=192.30.252.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-fa60c3f.ac4-iad.github.net [10.52.137.34])
	by smtp.github.com (Postfix) with ESMTPA id 37F7F640BBA
	for <linux-bluetooth@vger.kernel.org>; Thu, 11 Dec 2025 09:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1765475799;
	bh=ZLuDfbrE8kh6TD/4eRPjsQ7ejzdjx7lUyk7yfYTwXF0=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=k+FltTTjrxzrkDyVs9m8MXZ6pUk0unaMki9WHf/3WSB/MIBV8Zk4oVnHnrJVzi2AG
	 bx/lwxBFTowuvBmyONpclLoanLJ/1LRhWZRtnbELc0NfeLGrP3A1MVGaKq/oi62kgX
	 BPCjjo2mnWZ+Yhk6gIcKjvQk7WWpZubdz3F5Vmu4=
Date: Thu, 11 Dec 2025 09:56:39 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/fa6f1e-e83c6c@github.com>
Subject: [bluez/bluez] e83c6c: l2cap-test: Add tests for BT_PHY
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
  Commit: e83c6cf125cd4f5047d00d0bba12c7f026da0efd
      https://github.com/bluez/bluez/commit/e83c6cf125cd4f5047d00d0bba12c7f026da0efd
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2025-12-11 (Thu, 11 Dec 2025)

  Changed paths:
    M tools/l2cap-tester.c

  Log Message:
  -----------
  l2cap-test: Add tests for BT_PHY

This adds the following tests that uses BT_PHY to retrieve the ACL/LE
connection supported PHYs:

L2CAP BR/EDR Client - PHY
L2CAP BR/EDR Server - PHY
L2CAP LE Client - PHY
L2CAP LE Server - PHY
L2CAP Ext-Flowctl Client - PHY
L2CAP Ext-Flowctl Server - PHY



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

