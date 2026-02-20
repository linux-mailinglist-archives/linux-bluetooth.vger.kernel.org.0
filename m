Return-Path: <linux-bluetooth+bounces-19257-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPUDNvLBmGksLwMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19257-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 21:20:02 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4141C16A978
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 21:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84F2B3021EA1
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 20:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200E02E4263;
	Fri, 20 Feb 2026 20:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkz1374K"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C47280324
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 20:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771618798; cv=none; b=LLWoC9L3qVJlPxgVnNrwoQvwG1TpisPwXYcr1G8DfbDPs2ZBhFWA/u89QvV/rknhdO+31GaIrYQ2MO+6ROsIk2lojrr7pz5iqncQydt3Ez13nl9EzlEdFtqJZdnZO6dwHl+At666V6vfGjg1ONvsH3hWlsYfToqQnGxdAMmeRdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771618798; c=relaxed/simple;
	bh=pS1TkHmuWk82DV/jVcIYX/LYN1hirSpkFIJbI+2dDXs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=shC42InmC1yqIHoKQ1o23Ol0xDUxEWqLzojKuxmVIYLDTLTJhB6JXlIVB0Q2ok10LdTadAm1GmRlK2xwUFrjC2BEoRqvCW0N6NB275boGC1NL6e26pyBMbl8ut9sDOwKABAEjW+d5T2ByFBMfiqyYhiNnLj0v5iahDcMXX8lAQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkz1374K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FEE2C116C6;
	Fri, 20 Feb 2026 20:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771618798;
	bh=pS1TkHmuWk82DV/jVcIYX/LYN1hirSpkFIJbI+2dDXs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gkz1374K7DLXvu4dfkqoRlvyBzy5bf/2A7XU9d92j5vl0vx80sbKsBtbJJ64eh+M0
	 0HfKk+S1QI+sxCDnmqWomL/eZ8/0Whr8ENukn5H7Mct0E10GbkztuE9IIX1Z6rwOV0
	 d+CenZy50KIhWJTTPKTA4Hu2h3Cm5x+1OfNCw8bEIDzVoYm1nC5GSc1o0AiyP8NxM3
	 5uy+7wwNgcNFASIBBT/NxnFBGsT9Ltj/BJZjvDsGS8uLzeRlcAhZNYH5UeLAFD3edv
	 uwvF8Nfu/wmdZAFllT3HHnyOYkfajoTf47U8N4gJ2WeVXy65W7/l38eWxbfqjtFI+k
	 6imj8yYETUtaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CECB3808200;
	Fri, 20 Feb 2026 20:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v2 01/12] doc/btmon: Add missing documentation
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177161880629.894003.4454027310644157468.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 20:20:06 +0000
References: <20260220173120.3418666-1-luiz.dentz@gmail.com>
In-Reply-To: <20260220173120.3418666-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19257-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4141C16A978
X-Rspamd-Action: no action

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 20 Feb 2026 12:31:05 -0500 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This adds missing documentation for -I/--iso and -N/--no-time options.
> ---
>  doc/btmon.rst | 5 +++++
>  1 file changed, 5 insertions(+)

Here is the summary with links:
  - [BlueZ,v2,01/12] doc/btmon: Add missing documentation
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=5958e4492990
  - [BlueZ,v2,02/12] doc/btmon: Add dedicate sections for timestamp and frame number
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=36197cc3965d
  - [BlueZ,v2,03/12] doc/btmon: Add connection tracking section
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=3ddbc4f499c6
  - [BlueZ,v2,04/12] doc/btmon: Add a dedicated section for analyze mode
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=c25a8de27137
  - [BlueZ,v2,05/12] doc/btmon: Add a section for automated trace analysis
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=197f1d2a86c1
  - [BlueZ,v2,06/12] doc: add btsnoop protocol manpage
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=076e705fdb52
  - [BlueZ,v2,07/12] doc/btmon: Add reference to btsnoop documention
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=791a7bb024c1
  - [BlueZ,v2,08/12] monitor: Annotate ACL/SCO/ISO data with device address
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=611f84a0ff0e
  - [BlueZ,v2,09/12] monitor: Print connection type in Disconnect Complete
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=8157e2fde5d3
  - [BlueZ,v2,10/12] monitor: Add connection lifecycle to analyze summary
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=13cf50b6607e
  - [BlueZ,v2,11/12] monitor: Prefix data packets with proper type
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=25ba1ab49f34
  - [BlueZ,v2,12/12] doc/btmon: Update documentation to reflect lastest changes
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=d84a8fb8db97

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



