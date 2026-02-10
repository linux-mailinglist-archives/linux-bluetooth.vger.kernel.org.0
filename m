Return-Path: <linux-bluetooth+bounces-18926-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLluMS9yi2m7UQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18926-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 19:00:15 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 238D811E2E0
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 19:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4233F303F7FC
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 18:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A996A38B7A2;
	Tue, 10 Feb 2026 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvIH7W6z"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395412877CF
	for <linux-bluetooth@vger.kernel.org>; Tue, 10 Feb 2026 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770746410; cv=none; b=s827mIhxmbVnIK9eviYgxyUW2oaa4B7xxi1VzoHwfcsAWDeJO7y4SxE4y7l7+1pD+JLGKKJp90+B/aHTpnFXogeFrEmMpX5Xk4WN6RygbeUFCJnfP2xOI2thJCIaCdkqO/KKl15RMNFtkQo475qapMbGVcjRJW48zLi6xO3oGZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770746410; c=relaxed/simple;
	bh=MwCGYLSMHTQ6USEa2POxqQu3zno54HHNr+tCJWU0O14=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nvvz1B0+XuG/moLF2bZEM/tHPnLSlRi48oxEbBCqw6Ppgo1ByZTofJenVMxEagS6OfdeKv4h+55a+1Fps88N8nu+YE3PAqhmTX8JpF1NLuAazYcHEHmKZutVk8kF5o3MmFDjjOobOfmdwifN/v7qsI71bzgZuybKKHsj7F/erCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvIH7W6z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EA5C116C6;
	Tue, 10 Feb 2026 18:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770746410;
	bh=MwCGYLSMHTQ6USEa2POxqQu3zno54HHNr+tCJWU0O14=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PvIH7W6zhewLpoRTAYyhrN/dGJjxJ/hG4XknXQ1M/Qn3aTHyQN5/tD2A/JYuK2o+b
	 aynQA/7rrFlVbrQUnbHtXTNEfZnhqz/Izt/euyc0yVhEy4HHrGYVMvgShRei4s1JoR
	 WmwpagrBkbBz8Yd5skNTrWb+CQjoEhTQs/2Jky3cdGAIkijJaBYOypAS6d7+MfkqwI
	 dJUNHs4MxK4J1aLhCDLX+EA7J3ii2HWHuTXxzlEQCHsDXVGOK6e/2cvoZAd0CYTOlo
	 BIi97dCOsA8WPUKKI5b3icWA7C1CTe6jfHw43RAMr8fJXCEpa0sa7tIlVmCX69OHwc
	 x10wGOm6MqT3g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 850D539E3B79;
	Tue, 10 Feb 2026 18:00:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v1] adapter: Add btd_adapter_send_cmd_event_sync
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177074640408.3616367.6343089667493303605.git-patchwork-notify@kernel.org>
Date: Tue, 10 Feb 2026 18:00:04 +0000
References: <20260209163420.844741-1-luiz.dentz@gmail.com>
In-Reply-To: <20260209163420.844741-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18926-lists,linux-bluetooth=lfdr.de,bluetooth];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 238D811E2E0
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon,  9 Feb 2026 11:34:20 -0500 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This adds btd_adapter_send_cmd_event_sync which acts as a function
> helper to generate MGMT_OP_HCI_CMD_SYNC.
> ---
>  src/adapter.c | 28 ++++++++++++++++++++++++++++
>  src/adapter.h | 13 +++++++++++++
>  2 files changed, 41 insertions(+)

Here is the summary with links:
  - [BlueZ,v1] adapter: Add btd_adapter_send_cmd_event_sync
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=ecf4448a5811

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



