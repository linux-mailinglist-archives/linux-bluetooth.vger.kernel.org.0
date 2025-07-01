Return-Path: <linux-bluetooth+bounces-13440-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF8AF04AF
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Jul 2025 22:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49D927A6D33
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Jul 2025 20:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B552ECD34;
	Tue,  1 Jul 2025 20:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="gN+CBAyA"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52DA2EBDFD
	for <linux-bluetooth@vger.kernel.org>; Tue,  1 Jul 2025 20:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401192; cv=none; b=WMigAg5XfLh0JprqOZu86Mhz39m62rO3tPJrF1rz98vxlriHCuzyCNUcGqbZxTXtZFcW+sE/6bj31QffJ6t0Ua7RXWfX9xbMni7sVhnNIyICwmA+kguGhgK4dFPc7bppS7Em2lh33hOnwwwS9E8WDE3iMJYMEy4y+wgc8PRJnJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401192; c=relaxed/simple;
	bh=8ySvQ912Vv9rWKT86RHGZnp2X3mfwC4+K1G5ntFHhag=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=F6EnWFZcBIcpiq/l/WiJ2n/Tf8B2IdIR8zA3GvguUwmmyf2ZT/VZThBTqJ79nsxaFrKK9fv9gsBFN/8dDIe/aJpsasEVDqmRLmYD+Vq45QEZdzAIMerdwE6x/cTKBB/Qjk5X7F62MCQ75EmrmvXZsegkKakUKuH7OJvAxXScoso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=gN+CBAyA; arc=none smtp.client-ip=192.30.252.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-d5dae89.ac4-iad.github.net [10.52.12.66])
	by smtp.github.com (Postfix) with ESMTPA id C2A4070034C
	for <linux-bluetooth@vger.kernel.org>; Tue,  1 Jul 2025 13:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1751401190;
	bh=m0bHRTNCJQD4u0Iw8+X51eeeJ5QtnCcqRr5fWhR+N+U=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=gN+CBAyAimjqalakGmjMnYcZhnqY4cGinKOTzqfDZOb19ltEdrvjd081T3xVxOsKd
	 Xi/8nC9Etksr/5pTZ2GJ/BOGOoGZMaahvNAYY/uG8UL4CQlrDdLRICS9M/JEvkc3j0
	 SLA16N37RWfA8x6phw/GF98LkBllvnbzYlDCXJS0=
Date: Tue, 01 Jul 2025 13:19:50 -0700
From: BluezTestBot <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/977363/e5587b-000000@github.com>
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

  Branch: refs/heads/977363
  Home:   https://github.com/bluez/bluez

To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

