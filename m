Return-Path: <linux-bluetooth+bounces-18966-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iC0ZCbHDjGkmswAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18966-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 19:00:17 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A615126C33
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 19:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BE4D3019447
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Feb 2026 18:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB237352921;
	Wed, 11 Feb 2026 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGgx4Iro"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C207212FAD
	for <linux-bluetooth@vger.kernel.org>; Wed, 11 Feb 2026 18:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770832810; cv=none; b=jszSlvjVrhOUkW7//KaHvF4pXDd3I8cNLLAWOpkh+V82/+jkHoZ+8JNmKDpGvaRIsJznp1WMQ3xopZywZOO1UgWDEVJqJAYftcuUeUEEJNO+lJNjqD8VkIaDao0SQkREcXScyHj0ratA2kESVsvxJc07i64SDtpxX0nZn29ROvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770832810; c=relaxed/simple;
	bh=SDmXJUjG8vKfbcSGw8q/I7LRLvlKPQ9FOytjjQz1s4o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=O6tKYB03EOSdkecPmQ/NkVtOTRUZM54XplL2yG7bqnXorXK7h4GJ1mhRBINkhAHd8T7h1ZJ4g+6TflxevcbTanjru5u7MoaP5mwVBQWKX19vsa2eVQ6mT7SzdyZ4BX6YitaRhMEg6v0m63zXanl/lkMzPGQrSi84am2Ur+/YGRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGgx4Iro; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82542C4CEF7;
	Wed, 11 Feb 2026 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770832809;
	bh=SDmXJUjG8vKfbcSGw8q/I7LRLvlKPQ9FOytjjQz1s4o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RGgx4IrooLWKqgAZwyqeMXKtv3YhyFnlorln7yJDnPmN58S5HFVnu54cZr3ugaWlx
	 g9Om70QusxoQNNyC0oGIwDJvOSRzlduO6S1c/mlM5ZwQUPL76EaB24G4YqrxOmX6am
	 I73F5geOeDlhzkX531KfUvQu1qpLdFwCfmmTRDpE5kQtXOfDIdVRMVUyTRK69uJbiM
	 sMuaZcfzhApZzWIj9lNGzLN5d7KAaJ4UMiaIc+vrodH33ia/FM5StEcgsp4dhSEaYi
	 DEUbofCFrwkFT7O9eLetYWwJ7pCDaQW+7FNuEhFQ3jJdbHjUQToorRLb70rRxzJDsf
	 gl/5Fg1w0Eg+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8552239EF967;
	Wed, 11 Feb 2026 18:00:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v1 1/2] client: Add mgmt.exp-iso command
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177083280433.661760.11432200820071274630.git-patchwork-notify@kernel.org>
Date: Wed, 11 Feb 2026 18:00:04 +0000
References: <20260210205859.1240075-1-luiz.dentz@gmail.com>
In-Reply-To: <20260210205859.1240075-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18966-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 8A615126C33
X-Rspamd-Action: no action

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 10 Feb 2026 15:58:58 -0500 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This adds mgmt.exp-iso command which can be used to toggle ISO socket
> support:
> 
> @ MGMT Command: Set Experimental Feature (0x004a) plen 17
>         UUID: BlueZ Experimental ISO Socket
>         Action: Enabled (0x01)
> @ MGMT Event: Command Complete (0x0001) plen 23
>       Set Experimental Feature (0x004a) plen 20
>         Status: Success (0x00)
>         UUID: BlueZ Experimental ISO Socket
>         Flags: 0x00000001
>           Active
> @ MGMT Event: Experimental Feature Changed (0x0027) plen 20
>         UUID: BlueZ Experimental ISO Socket
>         Flags: 0x00000001
>           Active
> 
> [...]

Here is the summary with links:
  - [BlueZ,v1,1/2] client: Add mgmt.exp-iso command
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=6b2a732b434f
  - [BlueZ,v1,2/2] bluetoothctl-mgmt: Add documentation to exp-iso command
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=30acac54935c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



