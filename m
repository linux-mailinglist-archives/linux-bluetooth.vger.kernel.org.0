Return-Path: <linux-bluetooth+bounces-18553-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGIdFHMEeWk3ugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18553-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:31:15 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B20919916F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:31:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FC2E304B4F1
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF43F2E8E12;
	Tue, 27 Jan 2026 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5ixGZzv"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD94192B75
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538627; cv=none; b=GZojXLQq00Tvqna+C84NzOsbUN56jt5Xctur06DoaIHVQFwQngGKdwp3mv0wuLZqVWNdpmaaQ5g2FBYI73Teof6IO6VucDFudZ83R6hQoenW07tRXTnDAVKRqag8K2kfuuHP3zvjKRS9WtaYioG074WQWRXLgNRx0W/mW8ATLFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538627; c=relaxed/simple;
	bh=GyXHSdLfzV6AiykM4f5FdUXrlyJi4bWindaaUipfKgU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dcUQkkOosQhbPagshA9OpWRmDkZSD79hEP57aHPob3a9LxhWAUJ3JjyUcGTjKcyBAMCWvyjTkVk+F+nZSBVvb2zeKtZeMPV17nErTHBeQVjcVSsfx3VOuRNh7yPOOIQ89RVmKvjb6S4j1sqTBqvAjp2veEe3cDi9gen7NlOE9YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5ixGZzv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F47C116C6;
	Tue, 27 Jan 2026 18:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538626;
	bh=GyXHSdLfzV6AiykM4f5FdUXrlyJi4bWindaaUipfKgU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=J5ixGZzvJeC2EjO4j8wyCweuXu+Va+NTclScmcOPRA8Z/sufdDTonOa+qVjXrRGPa
	 SAmfo5dOGEtAfIKmEImlxVUyzCDcDcm0EkSWNyjuF6YCUOaVU5SuN+LNVwhfyol9Bz
	 FlnO7Pva3kBaG5S1J5Gb/DTtTPRAkgG1kaqHppgPjeEHszZzkhj67lp9g/BH+U4chT
	 rQhwGZrqcUk5RvxjU/DdDkdW++CwczYFBJVv9G+tfOvMBvA2jxyHebe5ibmFlkIAq9
	 4aK925N759U+3v/WT10cDOBYCDIg3/Kof407upQwSsU7sMQk2a7/RoSQ3FkxveKJDO
	 pDBxMhY8/HIww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 119F7380AA58;
	Tue, 27 Jan 2026 18:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Add PICS and howto for the HID
 qualification
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176953862084.1352702.7144867031499137784.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 18:30:20 +0000
References: <20260127171208.151197-1-frederic.danis@collabora.com>
In-Reply-To: <20260127171208.151197-1-frederic.danis@collabora.com>
To: =?utf-8?b?RnLDqWTDqXJpYyBEYW5pcyA8ZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbT4=?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-18553-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B20919916F
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Jan 2026 18:12:08 +0100 you wrote:
> ---
>  doc/qualification/hid-pics.rst | 385 +++++++++++++++++++++++++++++++++
>  doc/qualification/hid-pts.rst  |  61 ++++++
>  2 files changed, 446 insertions(+)
>  create mode 100644 doc/qualification/hid-pics.rst
>  create mode 100644 doc/qualification/hid-pts.rst

Here is the summary with links:
  - [BlueZ] doc/qualification: Add PICS and howto for the HID qualification
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=d4a8e19cf911

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



