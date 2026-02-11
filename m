Return-Path: <linux-bluetooth+bounces-18979-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B2zJ9nfjGkSugAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18979-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 21:00:25 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB891274CE
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 21:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADDDC3019FC6
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 20:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2ADE357A24;
	Wed, 11 Feb 2026 20:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQAZtx9i"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEC13559CA;
	Wed, 11 Feb 2026 20:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770840010; cv=none; b=RcaVkCyBjE9sqRyuHUlmZy55/1ngJMqYIA9uEB2x+g9Z+7i/AcoirpveQQXvTGzO8Q8Xd6kId3k1zy9Apd4HM778MrS+xnbiiNQzzbY8y4i+uRcE2uRW+jpX0NVt2UIIvGtWU7ZDH6Xy94hTjzqXvm2jvlnt/oyyJfnUo70yN0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770840010; c=relaxed/simple;
	bh=WtSYJXSQDzDHRYiJjuwOL+nLba3YZw+6UIMvDq2sOwI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YiG3nohBJin/XQZlwudO302/kC/H4j4Ek6dE4CQ2kLqh3o6bVK1wEHQOrOQOZfM/PXQOeyLCBGyTBSUr0dIqK24mW2EmdVHwCNjyCzKKXwTPLsrRJxgQT8jHtLPupNURZ4fHoQgGZLfaCTNesPKSqNexwWFqm/SlZxFpaGo1aR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQAZtx9i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9678AC4CEF7;
	Wed, 11 Feb 2026 20:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770840009;
	bh=WtSYJXSQDzDHRYiJjuwOL+nLba3YZw+6UIMvDq2sOwI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BQAZtx9ioTyEiCQxmZq4A6NWm6kcILwwLpmKdKxNZFjuzEiLAu7iQiUPexhr2oUX5
	 5ND+O7JqxDP2tj6mcz+2+EIaKuuuO5JeksJC2ILyQJ85wyR8qrl2CjiyZB4wAp1nFR
	 jcEod8UCG3B7OS5M8S0ajKT79+98GxX165yKITjOQrLL1YcTOlpG0bIvJ2Ue7SgPxS
	 f5ZVajabIpBQUbSsaYztyIACrTvQOS1sLjqRMFRouUc1LE1e4iHuch8Lk+ga0JjS0f
	 f4nGaIHmfq+BN/nuXa60Ig4Qcl4Lfb6sQh2W/slrVNbiYZohei+x1hY/Xog13B6uyN
	 KiDaWG0rQngeA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8512A39EFA52;
	Wed, 11 Feb 2026 20:00:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: qca: Refactor code on the basis of chipset
 names
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177084000433.693413.16945062238265797804.git-patchwork-notify@kernel.org>
Date: Wed, 11 Feb 2026 20:00:04 +0000
References: <20260210120101.1046091-1-vivek.sahu@oss.qualcomm.com>
In-Reply-To: <20260210120101.1046091-1-vivek.sahu@oss.qualcomm.com>
To: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: brgl@kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com,
 quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-18979-lists,linux-bluetooth=lfdr.de,bluetooth];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1FB891274CE
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 10 Feb 2026 17:31:01 +0530 you wrote:
> Whenever new chipset support is added to the driver code,
> we ended up adding chipset name to the last of the switch case
> arising code readability issue because of improper sorting of
> the chipset names in various places of the code.
> 
> Refactor code such a way that new chipset can be added easily
> in the code without compromising code readability.
> 
> [...]

Here is the summary with links:
  - [v1] Bluetooth: qca: Refactor code on the basis of chipset names
    https://git.kernel.org/bluetooth/bluetooth-next/c/c2b82511ef7d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



