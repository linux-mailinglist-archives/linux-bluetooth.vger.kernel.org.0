Return-Path: <linux-bluetooth+bounces-18247-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEO/EMjTb2mgMQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18247-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 20:13:12 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 890114A167
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 20:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 23FDBA0B56D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 16:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4AB466B5B;
	Tue, 20 Jan 2026 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdqUWUKm"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C223336ED1
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926612; cv=none; b=d18c9bhLdgdIixNWL20p5BxfyHG7j5BHuV0A+D/HBH5567+BwoVys61SHPQTnKxKzClol9bZ30W2PH3CZ/uyahhQiXoPI5f2XmBFtRCmzyf0SGNzcwNvRh3kMzhu2bFajdu0kDQpPPu9bsJ4aYqNQcF71XBLjvVXmdd/XDx6e4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926612; c=relaxed/simple;
	bh=Cm35LSw5OqFmrTTk2G4En4PdmrtnTFMjuqbfpoEwOQs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oRL01fPSJNxOAYyJ/2+OI/ueOtdi9v6fbrpw2WkQ6naOV/fXbzv3f5qJqpAM2azaa4uizVgRqXvfurds94rXGPee/VYSV6YEIFag9ldOdhCoVAheaCGJ9AWwlFhqLoo6i0e2zZlP7pazUuYzMBGzmqfEux7BVbTfvLZKgLWyKOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdqUWUKm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079C8C16AAE;
	Tue, 20 Jan 2026 16:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768926612;
	bh=Cm35LSw5OqFmrTTk2G4En4PdmrtnTFMjuqbfpoEwOQs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fdqUWUKmdJ74JxPCIYGC1mkDGsJ1h8J2nmzTs0tBQhT80lmAbxZGApxImbNcltSJc
	 GrK6FGD2f8DFXuvuHTNHeHT3grhgWFONnLc34DVFpxUayjtrkuLJhU2aeJ5h8C3jSz
	 B3OjTRfWwQlMgu4Kz0lUiuUw8O1TzMPXrEFn/xhWuQNy2jSGTXqPK4+0JkKh8H1uXG
	 QOqIqL9aFvwG7bZ+8Amouhpy2U/XbUiXl7PUk1iYcYwdM3OOlzfFbJdz0E4P6Ez0Dz
	 TqlSjGAd8EeELITRUCW6gG4u61qGjYwFjdE/7h+VlP9dvwVZjxoL9AMMIHL82aCSlG
	 wEoppqqyzsUiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C89C73806671;
	Tue, 20 Jan 2026 16:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [BlueZ 0/4] API fixes to make better bindings
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176892660934.117222.16357560256198589969.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jan 2026 16:30:09 +0000
References: <20260119141239.2683954-1-hadess@hadess.net>
In-Reply-To: <20260119141239.2683954-1-hadess@hadess.net>
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
	TAGGED_FROM(0.00)[bounces-18247-lists,linux-bluetooth=lfdr.de,bluetooth];
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
X-Rspamd-Queue-Id: 890114A167
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 19 Jan 2026 14:27:08 +0100 you wrote:
> Those changes will make using the internal bluez API easier to access
> from Rust.
> 
> Bastien Nocera (4):
>   src: Turn available priority macros into an enum
>   src: Prefix plugin-accessible adapter_set_name() function
>   adapter: Fix const'ness of struct btd_adapter_driver
>   src: Prefix plugin-accessible adapter_foreach() function
> 
> [...]

Here is the summary with links:
  - [BlueZ,1/4] src: Turn available priority macros into an enum
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=a1f2e53de4e9
  - [BlueZ,2/4] src: Prefix plugin-accessible adapter_set_name() function
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=69fd644df0a2
  - [BlueZ,3/4] adapter: Fix const'ness of struct btd_adapter_driver
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=80828d5ff016
  - [BlueZ,4/4] src: Prefix plugin-accessible adapter_foreach() function
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=c24f0b487ca3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



