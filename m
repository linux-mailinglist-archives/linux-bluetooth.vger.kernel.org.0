Return-Path: <linux-bluetooth+bounces-18656-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLVRCoqMe2mlFQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18656-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 17:36:26 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A64B2425
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 17:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 278E9300EF89
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 16:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA9534403F;
	Thu, 29 Jan 2026 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZEMM/q1"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC855343D76
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769704215; cv=none; b=W2xYsLgoshvJpnISxzPhEVXWuEesa5THoo5FEz/M5HjmrTI/s0kRgCr3UQTDSqZSSeqnwyjR5pH33xYBLkHzuPo0ctm5oSInkYMPeYtztNAN9zFWEMvBCJMv3FUpPlRsxN3AP05ohK7P1Y/3xDDjhEVn9z94SJDN83PnQogTtBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769704215; c=relaxed/simple;
	bh=A0iOCKQ/LZ2PEAdA52eHKP+ZK18XjdCGLios2gtOxfI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=a4ZzdIRGgmkMaN0tDH2Ex5CPCYy9qJ64DFwrOKBVIaLjTE6yE/RbEEA1UJ51Lbzy9GBxv9hXR87UpWYNW378m+1JNkpI+76effuwtv4eguQqwphNYx3af2vyTThchDmKLkI2WSz1hDHKHI9WilIVDdquh4uH9EBiLntW7U2zhxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZEMM/q1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22F5C116D0;
	Thu, 29 Jan 2026 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769704215;
	bh=A0iOCKQ/LZ2PEAdA52eHKP+ZK18XjdCGLios2gtOxfI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bZEMM/q1wNS7p71aj7hALDgNku58mi4kvDFdAy+pPmFUDP9BepWhZqzXucIBq0Xb0
	 tY+5Bhsb1LapKTepUN3plw1r99fPEfX2DjZIsiwJBMKGpuy3cWFjbE1/huqHQ7nXmD
	 0EiClauZ6gpNzdEj2L83NjVpsvhXRw9LVzbAkeuozLiOTEqqooe5tpFvUQymxFDHx/
	 8ocfQ6/CAhWJuxGiwbp7V5U2IyAXhfVacRvyrYOBs5ZZLFP2tK0NgJJQfVa+I8+LdR
	 Ix3Ey6cR/Mv4z9uTWQGlD1oigCjVAjzEBmU6ujYMjWS7YL/0mTfjNgkCR8+TSpXYnT
	 8kLR3lO+9U8oQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8B09380CECB;
	Thu, 29 Jan 2026 16:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Fix typos
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176970420859.2563498.154813540931646475.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 16:30:08 +0000
References: <20260128115359.222251-1-frederic.danis@collabora.com>
In-Reply-To: <20260128115359.222251-1-frederic.danis@collabora.com>
To: =?utf-8?b?RnLDqWTDqXJpYyBEYW5pcyA8ZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbT4=?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-18656-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: B1A64B2425
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 28 Jan 2026 12:53:59 +0100 you wrote:
> This fix the errors and warnings found during HTML generation.
> ---
>  doc/qualification/avrcp-pics.rst |  2 +-
>  doc/qualification/gap-pics.rst   | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)

Here is the summary with links:
  - [BlueZ] doc/qualification: Fix typos
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=9bd859ea4a4c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



