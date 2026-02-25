Return-Path: <linux-bluetooth+bounces-19431-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODgeOsdUn2nXaAQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19431-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 21:00:07 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5149A19CFF7
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 21:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC5523009FB0
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 20:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2073EDADB;
	Wed, 25 Feb 2026 20:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhYvLoRq"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F417D2D876A;
	Wed, 25 Feb 2026 19:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772049600; cv=none; b=AipVR94ygYnLcKq32cPAGdjXit7aRW0KSbQARmTi7YXEQZVsQxzcchXFeHuai5lHOtkfoO/VSTPmmT5xblU0Lp/k6sktdJ73A7I7RtzBhDKPUdDbyvV5sVjlW/pYzPUGXeW9SDXWD4RJWDlRE12qYAdXYdAw9asCX58IO7ia4TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772049600; c=relaxed/simple;
	bh=wN9IGlzi6Lol0/tAm0S9iHO2nYaI0APLP6A+BqTA0Do=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FU9A5xFC6Aw4CwnzcnroRaR0FNIkI5dchF5qp1JjlkhyAImAm8AgVKdROLMSKJcb2+ccN0eyKrtqTlfdBXX8T7yrEjAWMGtYSQxEVZ+dHy3CyrD7HqJtd3CP1nVv+vXXHH66kE7ogxhdZFYqQpOoDyqMRuF9a1g4m3uv3Fkj7Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhYvLoRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4046C116D0;
	Wed, 25 Feb 2026 19:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772049599;
	bh=wN9IGlzi6Lol0/tAm0S9iHO2nYaI0APLP6A+BqTA0Do=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OhYvLoRqkFIbcABO76zMpGbu9M3hSy/WvnRO8YLD398Mq2Z6gbdkbuj9mdZw9iWFh
	 kv8mZLF/vPOjgt047xAPoma6GSBK6lIzVFYmLHMq5eipKrVRFq9ryAD3sLPwnKZ8zI
	 QdG3qDyXVWkWWMpzLGYTKKzodH+dKdsFR3agv+CJBmhhSTktiFudYdG6Jgu2V6MFxq
	 swaw3KkNNAdJ8onXwgevoS7+ifDcugf9WzmUHI/HTzsqbroZihF/kFvBpkdS7kYG0x
	 hBHXMjJevTpW8dxOlBByjdtCBUGUhsTqKHNTU3mnn32bpozxqxXwsMgY7s6by3ztcO
	 n4/lvKWMbwWfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EDE3809A90;
	Wed, 25 Feb 2026 20:00:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/4] Bluetooth: L2CAP: CoC: Disconnect if received
 packet's
 SDU exceeds IMTU
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177204960430.891307.11891539364765725410.git-patchwork-notify@kernel.org>
Date: Wed, 25 Feb 2026 20:00:04 +0000
References: <20260225170728.30327-1-ceggers@arri.de>
In-Reply-To: <20260225170728.30327-1-ceggers@arri.de>
To: Christian Eggers <ceggers@arri.de>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19431-lists,linux-bluetooth=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5149A19CFF7
X-Rspamd-Action: no action

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 25 Feb 2026 18:07:25 +0100 you wrote:
> Core 6.0, Vol 3, Part A, 3.4.3:
> "If the SDU length field value exceeds the receiver's MTU, the receiver
> shall disconnect the channel..."
> 
> This fixes L2CAP/LE/CFC/BV-26-C (running together with 'l2test -r -P
> 0x0027 -V le_public -I 100').
> 
> [...]

Here is the summary with links:
  - [1/4] Bluetooth: L2CAP: CoC: Disconnect if received packet's SDU exceeds IMTU
    (no matching commit)
  - [2/4] Bluetooth: L2CAP: CoC: Disconnect if received packet size exceeds MPS
    (no matching commit)
  - [3/4] Bluetooth: L2CAP: CoC: Disconnect if sum of payload sizes exceed SDU
    https://git.kernel.org/bluetooth/bluetooth-next/c/0911d455d881
  - [4/4] Bluetooth: SMP: make SM/PER/KDU/BI-04-C happy
    https://git.kernel.org/bluetooth/bluetooth-next/c/85e59519f724

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



