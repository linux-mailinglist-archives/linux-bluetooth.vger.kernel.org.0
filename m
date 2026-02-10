Return-Path: <linux-bluetooth+bounces-18927-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNmrFjRyi2m7UQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18927-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 19:00:20 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F10511E2EF
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 19:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07D9E3042B7B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Feb 2026 18:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DED031814F;
	Tue, 10 Feb 2026 18:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkJQXYfT"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27EF38A9B1
	for <linux-bluetooth@vger.kernel.org>; Tue, 10 Feb 2026 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770746410; cv=none; b=rEuDfRw76fzZMOgr0B1XNwO74YGhfhrivXW8QBKQVv+bHGZ0IlwmMiLCUzKAsEWv8CZ9uiLLJyG8UXEKS9SLlU8sJcKBGzJp0CZarnwF5NfnK221HQqEoquTeEteuXg/MPdGfsZnCuzYp6hLqifKBY+5bvERhMO/YEzdKmvLfhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770746410; c=relaxed/simple;
	bh=Cb4+LEPragJuCC/NeKrII2sV/xrrJ0EdXO/IOVfsFfA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=r9IugKSw30k1QvI2FFHvrCZ6xGWoTi5wAq2I7H/QQJ2Zkkn39kER7FeuNoq9OmKdD9f/tcBaDUUA/QvkZKVKqdyu29GXp8eNhqXhGV1ztrMMTH29Fq7niTLXzwy9ubJzEImUWJ5+wQG4kbpYp7El0HkTPC1eKb+39xjI7hVvXqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkJQXYfT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C15C116C6;
	Tue, 10 Feb 2026 18:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770746410;
	bh=Cb4+LEPragJuCC/NeKrII2sV/xrrJ0EdXO/IOVfsFfA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qkJQXYfT2TXc5gUJpNdbHfbyZxGgVyf8riNOgyUI8DjAdBbi4yvxGPS2mYm/bGTxp
	 ezS3EUbZ5YCuaas5X4J58KNFd1XBdV4fMLKLqssOsfHAxxVbw+n5T27Vlbij+vOJfT
	 yP5JodYbaHLg/kaz1SytypFmUbhk1ynZKMx+w3LHqKSfm5UZHbhASYWJTJjihDSZbu
	 jIz0/mJQ+Ffte37eyRA6s4NZtkHcvVhhKyPcJFueCLby216edMqn/3mH+yLMYnMxOV
	 cqggmduSb9xxEmdXk7/o4CEIgJdhWHa454eTJtSkEJGuN2OTWyDaYsERdPD8H7sIgY
	 HwW1JMQaBi4nw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0AF1B39E3B79;
	Tue, 10 Feb 2026 18:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v2] emulator: Fix compilation on big endian systems
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177074640557.3616367.16240515640902857241.git-patchwork-notify@kernel.org>
Date: Tue, 10 Feb 2026 18:00:05 +0000
References: <20260210093254.3246483-1-hadess@hadess.net>
In-Reply-To: <20260210093254.3246483-1-hadess@hadess.net>
To: Bastien Nocera <hadess@hadess.net>
Cc: linux-bluetooth@vger.kernel.org, pav@iki.fi
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18927-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F10511E2EF
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 10 Feb 2026 10:32:47 +0100 you wrote:
> This fixes the build on big endian systems like s390x:
> 
> Remove the "static" so the array doesn't need to be initialised
> with constants.
> 
> emulator/bthost.c: In function ‘bthost_setup_sco’:
> ./src/shared/util.h:43:26: error: initializer element is not constant
>    43 | #define cpu_to_le32(val) bswap_32(val)
>       |                          ^~~~~~~~
> etc.
> 
> [...]

Here is the summary with links:
  - [BlueZ,v2] emulator: Fix compilation on big endian systems
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=f1eedda9cefc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



