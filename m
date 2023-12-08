Return-Path: <linux-bluetooth+bounces-499-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A580AFB8
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Dec 2023 23:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D8FEB20C90
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Dec 2023 22:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F0259B77;
	Fri,  8 Dec 2023 22:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="VVrSq94q"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-23.smtp.github.com (out-23.smtp.github.com [192.30.252.206])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08762172B
	for <linux-bluetooth@vger.kernel.org>; Fri,  8 Dec 2023 14:37:50 -0800 (PST)
Received: from github.com (hubbernetes-node-398b48c.ac4-iad.github.net [10.52.133.33])
	by smtp.github.com (Postfix) with ESMTPA id 536CA5E0A05
	for <linux-bluetooth@vger.kernel.org>; Fri,  8 Dec 2023 14:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1702075069;
	bh=v3xeLoTRbnSK72kgkAlJRuSjD2kAw7cQM3PMLnk6dJE=;
	h=Date:From:To:Subject:From;
	b=VVrSq94qYdABpf8eeB7UNcqNrLB8ftPxX1l5C9Majs+49so4ZPxLWerxI9ECU6yqg
	 xjB1fz0vua79CN0lXT3NOHJSiMiQRBEGyh8hmW7GxeajFP3o1+xWeYOOj8TSQzTjgo
	 u4pGhRsdHKJqECBYOBnczfIAfdI7f2pVrgQ2UN9s=
Date: Fri, 08 Dec 2023 14:37:49 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/b0656c-477c41@github.com>
Subject: [bluez/bluez] 477c41: client/player: Fix not prompting all parameter
 on ...
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
  Commit: 477c41c683ead6be0aa26975a446be8ce4c8b6f3
      https://github.com/bluez/bluez/commit/477c41c683ead6be0aa26975a446be8ce4c8b6f3
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-12-08 (Fri, 08 Dec 2023)

  Changed paths:
    M client/player.c

  Log Message:
  -----------
  client/player: Fix not prompting all parameter on endpoint.register

When Auto Accept is not enable not all parameters are requested.



