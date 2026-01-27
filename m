Return-Path: <linux-bluetooth+bounces-18552-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP8RDEwEeWk3ugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18552-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:36 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D79EE9911E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96DA73034329
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DDB2E9EDA;
	Tue, 27 Jan 2026 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igb9/PLP"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE029192B75
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538625; cv=none; b=uV60+NdkDAgTq/2O5Z7W0MeG+nWokmEitlpbR6M1KREddQCXZAmeNyTg1PVXlAj2duzAL0E1WOJrkwpqh1/nu+xVBFlDSoNKuCkgoOLm75fxskI5I9Q/gWRg5O39P64DvPxCBvDf12EENnQz6vbLgd2wDm8jnTV3E0R7Ub7xKxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538625; c=relaxed/simple;
	bh=YYQEF81ss+tdhQpEZ/RLdANh+wMUlg5PXBNB0D2wtAQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SpU2gjk032kMolbcVHaRjJGncM961LTLJuV4xiUi3RHk1ZsLK1wRGAfvtnG5Xg6uXo1RpC3XgXsz5bRNFYWZFBGkq1nVFce8A/wTLCcXhNNEduwfTYfiYDgaBqvr0fvn9YOwtfMEzxMvVjXETI9gsJhtCSJtxfCTEXcbq7LryBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igb9/PLP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEE7C116C6;
	Tue, 27 Jan 2026 18:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538625;
	bh=YYQEF81ss+tdhQpEZ/RLdANh+wMUlg5PXBNB0D2wtAQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=igb9/PLPJ/X+FkFrNtJaBxzj+RcL1mzIpcyapg6AsM2CgalP1GShYZ5s0AuUYoZC6
	 3XxZmntJa5XlZGJZ2rbjTq613G8o4t++UoCudcbeQDLKa4byFsvIj8RxY0p+OvpIht
	 hCI4542Upi1rGFqbCLcNnbhWuxIb30NWQ2OliKcMvb1536CYcFxX3qoUXvRF/w92Vb
	 +lPuQPQ4fM5VNmx8vSugfozUkVnQBd3sQkV6I1vjyEWNvdudm0NLtS5r9MV/YHdZbV
	 yY3tbDU9fD6X92xb2PZ/MAwH6LFkf/ahqFjgkubeV4zHiR2zGlCc0DfWpbNsSVCnoq
	 5sU6ZJGGK8KVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8B9C380AA58;
	Tue, 27 Jan 2026 18:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Add PICS and howto for the IOPT
 qualification
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176953861934.1352702.15171472737312812184.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 18:30:19 +0000
References: <20260127171648.151717-1-frederic.danis@collabora.com>
In-Reply-To: <20260127171648.151717-1-frederic.danis@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-18552-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: D79EE9911E
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Jan 2026 18:16:48 +0100 you wrote:
> ---
>  doc/qualification/iopt-pics.rst | 37 ++++++++++++++++
>  doc/qualification/iopt-pts.rst  | 75 +++++++++++++++++++++++++++++++++
>  2 files changed, 112 insertions(+)
>  create mode 100644 doc/qualification/iopt-pics.rst
>  create mode 100644 doc/qualification/iopt-pts.rst

Here is the summary with links:
  - [BlueZ] doc/qualification: Add PICS and howto for the IOPT qualification
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=a3c0aa5fc106

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



