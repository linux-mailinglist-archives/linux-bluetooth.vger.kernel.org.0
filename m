Return-Path: <linux-bluetooth+bounces-19114-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Jg+GkGAlGmwFAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19114-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 15:50:41 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0164B14D4D1
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 15:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88D9D303989B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 14:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E502DF136;
	Tue, 17 Feb 2026 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEaXMM++"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04CA36B07F
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771339815; cv=none; b=g5ouKVY57VBjPKenFACmCfQxTmIsA0h5Qv9rorKn57Gvz0n2/0YzGPZBvTdw22gHVFPqMgt1VdQFPat1f5uOgO8IrKcLPyHxWzjStBAZyM2kx7i7CgKKsmnMRw2dgojytpNodMm/ryC6uRd4jczl3oonmGa46rET2NEh8HVVnY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771339815; c=relaxed/simple;
	bh=SQH0O3UVxjfuznI0sM890PJGdscMjTYWGC8VamuX56s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QYc60W1eMcV/qL2fXnu/v2Uosz+77j09QuKtaG2aIdemL0c3DAyT4CwAN6T5/4OZTHj1rkXVMbAwe2wdKt2XgWbHcT/e0juzCCGLxOfaoFTiaXMrkhNl6x67Gv0wk7pISjHKLC6sAv70BoUZs5K+UiQwCORcxzxtIDE7cHxmHas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEaXMM++; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D14C4CEF7;
	Tue, 17 Feb 2026 14:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771339815;
	bh=SQH0O3UVxjfuznI0sM890PJGdscMjTYWGC8VamuX56s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cEaXMM++w5UNB984YHyamvAYrobuJz8lLqtwvE2hmXOBHtdDno/bFgcJd6/Fj8BOI
	 k9Gu/3cDQ2o2CZnukQJ2maXeVs/QJ5gjpoAVr2/Siu4ZCT4zWdgzj1bakLguGxhU0r
	 O6Duqkjc67mJO0vkBgV76j1PN/KVGs5u1iuPMTehEJrgBIj8bRZ9qys/mONDq/dALw
	 pGQnChMDI0PoP1U4M71lpsqcr4yUFoA6bnsGbQH7oA/L5ddrg1Z+ooUX/GeEEt2Lpr
	 G1LOIcL+cGdCVqiNUeBg3ItKGlPr5cSXYeCqs7wucqgUhGju/vymUDtXWsAhLUFVAv
	 bcbZobkPvPj8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C22D4380AAE0;
	Tue, 17 Feb 2026 14:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v2] a2dp: connect source profile after sink
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177133980757.109268.14810659540670317481.git-patchwork-notify@kernel.org>
Date: Tue, 17 Feb 2026 14:50:07 +0000
References: 
 <ba0e71b91a24557f088b015a349c6ccee6260ec2.1771258477.git.pav@iki.fi>
In-Reply-To: 
 <ba0e71b91a24557f088b015a349c6ccee6260ec2.1771258477.git.pav@iki.fi>
To: Pauli Virtanen <pav@iki.fi>
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
	TAGGED_FROM(0.00)[bounces-19114-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0164B14D4D1
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 16 Feb 2026 18:17:08 +0200 you wrote:
> Since cdcd845f87ee the order in which profiles with the same priority
> are connected is the same order as btd_profile_register() is called,
> instead of being the opposite order.  When initiating connections, we
> want to prefer a2dp-sink profile over a2dp-source, as connecting both at
> the same time does not work currently.
> 
> Add .after_services to specify the order.
> 
> [...]

Here is the summary with links:
  - [BlueZ,v2] a2dp: connect source profile after sink
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=066a164a524e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



