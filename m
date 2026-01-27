Return-Path: <linux-bluetooth+bounces-18524-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPjaI2f9eGmOuQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18524-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:01:11 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE82E98B9E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B524306055E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8CA2F5491;
	Tue, 27 Jan 2026 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imEUHegz"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC71221540
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769536820; cv=none; b=Svn3lXiuvqOBDDcdl4bC58DLKBmTT2sPJ4LdeTaIh6s69DidAFpUem0wyMRO18QbxWei8e/RPbrzG4GS9PVOigLOHcNdNnI6JI21WV2k1MkdkVzGxyO/+d/KZUEVMaSWloxI/gVdFhK5FU9uJmYxUrDS8KIrFG6kEbcSpkIADZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769536820; c=relaxed/simple;
	bh=Y+viwQriiu7/jgfyiLFyX5UbL72v/zbO4O6I24b+P5U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=K+xq724SEY1U/Lra47YH25q6smdRbZbO1hOYBHjB0qUcY9Btm1q0yDUFrbH2I3cVF3T7p78eFFWeHTUwzg83D3Ckblu2NFLnApnQPDuX1G3KZetdZALE/RSCj9qh3ZOSx22svrCwe4mq6Rmy0EpNQvPCYo4ActGWt+AWWBV9NT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imEUHegz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0C2C116C6;
	Tue, 27 Jan 2026 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769536819;
	bh=Y+viwQriiu7/jgfyiLFyX5UbL72v/zbO4O6I24b+P5U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=imEUHegz9SdbqrstBSNz5vQj1gXpi3CjVtOZnQcnttx6396MEkKpijG9wCPpO5yyq
	 dZ702beambvBi8ByVUXBQodJETTk2lWUBjWRb9gTNDDcvZl5hVlpopGrtgmWA/Xkm/
	 G26k+WUx0uzpmFkKqIPLUiy3kvjrlLDkqHUNs4SzFfl4Rskmo8UJ/OJokHjWP1l53f
	 VTm7v0DQZjkj2SAa/BPGhnW5DrhiTYFC/clmkhzHHLX4p32lcnGimegAegdBHzEhSV
	 oOI68zzAlaA05+vDQYo7YMme205RNfhNmSytX22POl2iGVIoBnCkfZ5oCEX3ATbuNq
	 iF2+DRkPI1O3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11BD9380AA58;
	Tue, 27 Jan 2026 18:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] lib/uuid: Add RAS service and characteristic UUIDs
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176953681359.1341664.5577270517791433879.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 18:00:13 +0000
References: <20260123104120.528321-1-prathibha.madugonde@oss.qualcomm.com>
In-Reply-To: <20260123104120.528321-1-prathibha.madugonde@oss.qualcomm.com>
To: Prathibha Madugonde <prathibha.madugonde@oss.qualcomm.com>
Cc: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com,
 quic_mohamull@quicinc.com, quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-18524-lists,linux-bluetooth=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,quicinc.com];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE82E98B9E
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 23 Jan 2026 16:11:20 +0530 you wrote:
> ---
>  lib/bluetooth/uuid.h | 8 ++++++++
>  1 file changed, 8 insertions(+)

Here is the summary with links:
  - [BlueZ] lib/uuid: Add RAS service and characteristic UUIDs
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=92482d569345

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



