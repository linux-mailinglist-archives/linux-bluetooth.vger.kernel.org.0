Return-Path: <linux-bluetooth+bounces-18549-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCZuCkgEeWk3ugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18549-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:32 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA27C99109
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 723A4303295E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C7D28030E;
	Tue, 27 Jan 2026 18:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9MKSD5m"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD3D192B75
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538621; cv=none; b=g8Md+jV6Kk4t5yB3JgYolDlWPeRP9It9RfiAabph1r1pYR7zM5AQkJ2ofp8pH6p+d9ctxGAAjeZV+f7Zhuiph88S4F4fM2QrrHgaCRLH9DnIYx3EhXvgrxg99uX8bWt+AXgGfoea6NmVRMv8NX9TPKkpkGbYf/pmQWXQefAwIJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538621; c=relaxed/simple;
	bh=3l0aODXpjEMFR9YTipUgyTwI6MMfMopGJPlv8LAkD7I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=h6e7gEL2IoHnkTHc9UU8ohu+RsI9M6azfeXylVYyRTIb/MXCJKIuI9ni0i3pH/XgQ11dWbgpKj5HchFEOSGZm1X0GrIEZVyZsy5OSU7U6jj7RLVP3BBlTsG46EW/YO28KzV5ORq34QLak7Qd7VulcNngbnqnm63Snpp/txEkXmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9MKSD5m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685AEC16AAE;
	Tue, 27 Jan 2026 18:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538621;
	bh=3l0aODXpjEMFR9YTipUgyTwI6MMfMopGJPlv8LAkD7I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E9MKSD5mHQwM8wLZKMLMkuQbj8YjciGPBF5uWuuSraWUUH2kia1j0BkSM8x2grgg2
	 yIkzsTqA07L9/TAW9NLvsFaPMBx5xpXpc9CdSI7MO+3/mvtS2MtTHC6CkuknJQydFi
	 Oj3Pk8xAoO2ZYzaulGUyk8eTxY69dBpi6qV+r3oI52d4xjR+38sy70Qd6xciettYid
	 j6tOzewVa11G/eqy7dPpEhlVSSFxOm25VY/dba+mL/XfjCbNs2ywsbjHWHiqlp7SS0
	 m9BGXC0hzaytULjH5pWgtclSW9fbbmEm99a+PlIh2JwV8FgLtpIjCDUKMBVrQfyqyO
	 sVq8t36pJD+1g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BACF380AA58;
	Tue, 27 Jan 2026 18:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Add PICS and howto for the AVCTP
 qualification
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176953861534.1352702.11792908613826653070.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 18:30:15 +0000
References: <20260127170527.150218-1-frederic.danis@collabora.com>
In-Reply-To: <20260127170527.150218-1-frederic.danis@collabora.com>
To: =?utf-8?b?RnLDqWTDqXJpYyBEYW5pcyA8ZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbT4=?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-18549-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CA27C99109
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Jan 2026 18:05:27 +0100 you wrote:
> ---
>  doc/qualification/avctp-pics.rst | 116 +++++++++++++++++++++++++++++++
>  doc/qualification/avctp-pts.rst  |  49 +++++++++++++
>  2 files changed, 165 insertions(+)
>  create mode 100644 doc/qualification/avctp-pics.rst
>  create mode 100644 doc/qualification/avctp-pts.rst

Here is the summary with links:
  - [BlueZ] doc/qualification: Add PICS and howto for the AVCTP qualification
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=ae788af205ad

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



