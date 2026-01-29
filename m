Return-Path: <linux-bluetooth+bounces-18669-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC0EHTDre2npJQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18669-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 00:20:16 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D54EB59F0
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 00:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF7FE30115AE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 23:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B69132E732;
	Thu, 29 Jan 2026 23:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyaWrIbS"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B3D1EB5F8
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 23:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769728811; cv=none; b=FK0NdAOzKOCESbqMnLYEY1z1lwf27ViZxCPGSZa4KJHewNU9WKXzXR/8OyugSqSnnOymjM94xgVWpo8hIuIim8khNsEhhluRjqs5PbFCR5pHNcJT17G4icCXCwEYyJSGF1/qUSxMjozIRpDg5D9hpmSCuEq9hZObgSrl2hwyOvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769728811; c=relaxed/simple;
	bh=WfSq/w17gldpNuokoWI5xVaoh6W8xd+NwZOaw2KgdB0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=igFIalY4/F8gekevNi/M+mxcgK5ZJyN95M1XGoEWAanqCTq1j1bhh8ovJugAUR63CRJQvZxckbNTWWw9iG+mopvGvr9aVCLS5WTDmekl2/4NgABHpuXLdyfWvKEpUrR/JbFv5Phib4ipKEYRmEqM6tm0lLpPI9GGIVo8Y9NDsMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyaWrIbS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57105C4CEF7;
	Thu, 29 Jan 2026 23:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769728811;
	bh=WfSq/w17gldpNuokoWI5xVaoh6W8xd+NwZOaw2KgdB0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cyaWrIbSqIkEUsLFLUUHTWgHVR6EJCD8EIAoYWMFSIZ79FhpC6MXd6ydzCyn2Nc4p
	 tejyTPlJ5+TMiRGI9XYGx3EfV7E94vCAoFnAtkur7V6pISPdjVg4CxKLOjgEtMn4wH
	 RDyW+uQez1o8y2z0P0v0+9lzz+Eu/3EBymcRwvwW/v3ZYI6tLB+cm9iVB6jIH/htRu
	 15aZkqXGU5RUh9F/7agdvhRvndwfxQ2n2SNNpWSp3RIr+LWSOjuTpG4bW3YSMcbD7r
	 2lO4t7VP0wf41XI7xNfWAEdKUHXSsJjCNXRK7ybWJPt9s/y8B1BBM2ZV9w/2m0khYb
	 FHXm1+xO1AqEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EBCE380CEDD;
	Thu, 29 Jan 2026 23:20:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v7 00/16] Add meson build system and HTML docs
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176972880410.3097460.14401542538153173311.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 23:20:04 +0000
References: <20260128221536.2319084-1-hadess@hadess.net>
In-Reply-To: <20260128221536.2319084-1-hadess@hadess.net>
To: Bastien Nocera <hadess@hadess.net>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-18669-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D54EB59F0
X-Rspamd-Action: no action

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 28 Jan 2026 23:11:50 +0100 you wrote:
> Changes since v6:
> Drop:
>   doc: Port sap-api.txt to RST
>   doc: Port health-api.txt to RST
>   doc: Add "C" code-block markers for coding-style doc
>   tools: Install btmgmt along with other tools
> 
> [...]

Here is the summary with links:
  - [BlueZ,v7,01/16] build: Add meson wrap for libell
    (no matching commit)
  - [BlueZ,v7,02/16] build: Add meson build system
    (no matching commit)
  - [BlueZ,v7,03/16] build: Make more use of 'feature' options
    (no matching commit)
  - [BlueZ,v7,04/16] build: Separate systemd and libsystemd dependencies
    (no matching commit)
  - [BlueZ,v7,05/16] tools: Install gatttool if deprecated tools are enabled
    (no matching commit)
  - [BlueZ,v7,06/16] tools: Install avinfo tool by default
    (no matching commit)
  - [BlueZ,v7,07/16] emulator: Install the emulator if built
    (no matching commit)
  - [BlueZ,v7,08/16] build: Add option to allow disabling bluetoothd
    (no matching commit)
  - [BlueZ,v7,09/16] unit: Run test-bap tests concurrently
    (no matching commit)
  - [BlueZ,v7,10/16] unit: Make gobex-transfer tests run concurrently
    (no matching commit)
  - [BlueZ,v7,11/16] build: Only build profiles if the daemon is built
    (no matching commit)
  - [BlueZ,v7,12/16] build: Only build gdbus library if there is a user
    (no matching commit)
  - [BlueZ,v7,14/16] github: Add docs deployment
    (no matching commit)
  - [BlueZ,v7,15/16] client: Expand GATT submenu documentation
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=358ab8994207
  - [BlueZ,v7,16/16] doc: Add introduction to GATT
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



