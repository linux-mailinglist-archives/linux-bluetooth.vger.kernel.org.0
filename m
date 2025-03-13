Return-Path: <linux-bluetooth+bounces-11094-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD4CA5F763
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 Mar 2025 15:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 265E416F433
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 Mar 2025 14:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777EB267B6A;
	Thu, 13 Mar 2025 14:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="OuEjXJIP"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9650D19ADB0
	for <linux-bluetooth@vger.kernel.org>; Thu, 13 Mar 2025 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741875238; cv=none; b=tr91nStjYLQJzrQXOqeCBIHgeyOPGKCr2UbqfQ9S0qabpwKX2FfYCNGrYrzBdBg4EuwwcOtApwtIJoQd2YYi5a7RjjZaj64xU59NsmgtfvskleXULoYakb3Ac7oH0ujoDo2190sLrUx4PL3jvnuK9KcqRK+YGVQ+ZdLQ6AzoOC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741875238; c=relaxed/simple;
	bh=sjghN9iL/zOOR3gxp2gj5GUUKdD6iDL/kIk7X2jC4eU=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=SSOQOYURGLXtThIcBS0m7H9ax13MUMrtvdV7+6NzmmnUMhaye+iUheQQ4padTNmRjgF3elfEDUpHrn3LGWH9WbgCEbCFI5jDcdinvD9QICasexY/wWiWfY2S5QWaiw1SME7tBTEbgA3lVLOZ1wZ9Jklg/d2Bb01hndH0B/hHrXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=OuEjXJIP; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-38e7e71.ac4-iad.github.net [10.52.134.30])
	by smtp.github.com (Postfix) with ESMTPA id 950B07008A4
	for <linux-bluetooth@vger.kernel.org>; Thu, 13 Mar 2025 07:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1741875236;
	bh=9Bt00LFnXLoUurTdX+Jz8VEKbLlHHMC6BMku9F8TwrA=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=OuEjXJIPKzumWmSbspf6v//OEEe+2cCkuu9WWKQ9nrvUqZkJlQkyTrECXeEJh0Elc
	 sNdavj/VnYjF9hJwEVxHByyXJyb+UTo1fFALAthz3/hqSlVn2FXwybA0Ua5Q4FCs8+
	 DvN017eJmmJLVvdJIZv4bPImNn94o9d0shcdOyJg=
Date: Thu, 13 Mar 2025 07:13:56 -0700
From: Yao Wei <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/d4749c-ee2243@github.com>
Subject: [bluez/bluez] ee2243: policy: connect HSP/HFP when A2DP is connected
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

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: ee22431a8d849047c1f019d2dedaf8fb72151c2a
      https://github.com/bluez/bluez/commit/ee22431a8d849047c1f019d2dedaf=
8fb72151c2a
  Author: Yao Wei (=E9=AD=8F=E9=8A=98=E5=BB=B7) <yao.wei@canonical.com>
  Date:   2025-03-13 (Thu, 13 Mar 2025)

  Changed paths:
    M plugins/policy.c

  Log Message:
  -----------
  policy: connect HSP/HFP when A2DP is connected

When A2DP is connected, also connect HSP/HFP if it is not connected.

Fixes: https://github.com/bluez/bluez/issues/1069



To unsubscribe from these emails, change your notification settings at ht=
tps://github.com/bluez/bluez/settings/notifications

