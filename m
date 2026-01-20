Return-Path: <linux-bluetooth+bounces-18268-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAwyOOPhb2n8RwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18268-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 21:13:23 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD194B191
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 21:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E165AA6B077
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 18:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D12A364EA7;
	Tue, 20 Jan 2026 18:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbSvhwZW"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9362F3C22
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 18:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768933207; cv=none; b=UAKwQNbql6JmIRhVd1Q/dpYEcbH83S40sofOoqjvXbzgwnz+dCpPahiAmzJ/sH0TFFE1UMF6ZOFQxlZmT1Y4l7JlN7n8MidHjfotZHsuil1bdmMF86pFDB0v0CKyS4QwekTH0xZFsL825hb0Js8p+RN2Yl+IUGGscBC2SV86RxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768933207; c=relaxed/simple;
	bh=AeEoRRDFoRLgLEIPe06xANju/gQ9/ZFxuKdO6nia9Ok=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=IDnA/gN/ftHRHgga1oWDlGxce+XcsCxLGPeu2hTvX8rfy1cMeDFcnoJSKJkytoU9BISait6TECm5lSn0NVHJ8N+3e9zpp09HrolJw4GTreApNrdyWrMq1rlaDUfaO5ki7ljRTSOqkmFX+le/x+rYBtCBRp/5iHtaZI4NZkZBB6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbSvhwZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C763C16AAE;
	Tue, 20 Jan 2026 18:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768933207;
	bh=AeEoRRDFoRLgLEIPe06xANju/gQ9/ZFxuKdO6nia9Ok=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WbSvhwZW5oNcIiAJMkVsw+R4a1/b3LxdQyaAa4NRz+5GrtSDou2bpg7G2bOL7W44Z
	 qSIkSvwUEt71MmCb6mDaXC2crSkPyuKtu12q84erbm1JKPkJxcT+oTWwNHajwKS+Em
	 5R3VmutCGsytS5ktcnBaRwgVrR2eY9Sz3pE+HzoBew09qV3/ODl7btXPtTwen1hXWF
	 9Ui+gGflKHoUjbxlhlxipRPkCzl/vJhBUKjMshM62n9tHBgt6Y3EanJcpxhRBfIUGK
	 0s9X4B1bYJ56RqRuWR5hreBGa2dLPewtovrzNHQ0MSvDPVbUpVK2pJb3SEqHakuapn
	 HKiynUHZQX0Zw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EAC93810935;
	Tue, 20 Jan 2026 18:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] More CONFIG_PM* simplifications
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176893320510.555371.12355664459156628417.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jan 2026 18:20:05 +0000
References: <20260119123537.2611794-1-hadess@hadess.net>
In-Reply-To: <20260119123537.2611794-1-hadess@hadess.net>
To: Bastien Nocera <hadess@hadess.net>
Cc: linux-bluetooth@vger.kernel.org
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWO(0.00)[2];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18268-lists,linux-bluetooth=lfdr.de,bluetooth];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 1CD194B191
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 19 Jan 2026 13:34:58 +0100 you wrote:
> Follow-up from the earlier "Bluetooth: btusb: Use pm_ptr instead of
> #ifdef CONFIG_PM" patch.
> 
> Both drivers were successfully compiled with CONFIG_PM disabled.
> 
> Changes since v2:
> - Drop btmtksdio.c changes, there's a fix in bluetooth-next
> 
> [...]

Here is the summary with links:
  - [v3,1/2] Bluetooth: btnxpuart: Remove unneeded CONFIG_PM ifdef
    https://git.kernel.org/bluetooth/bluetooth-next/c/854aa613b6b3
  - [v3,2/2] Bluetooth: btintel: Remove unneeded CONFIG_PM* #ifdef's
    https://git.kernel.org/bluetooth/bluetooth-next/c/ba93b539e8d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



