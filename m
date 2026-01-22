Return-Path: <linux-bluetooth+bounces-18332-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBrPFL5ScmnpfAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18332-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 17:39:26 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 140736A202
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 17:39:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B149130039A9
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jan 2026 16:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFE43F557C;
	Thu, 22 Jan 2026 16:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJtl/6w4"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830F63F5DA3
	for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jan 2026 16:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098818; cv=none; b=hDkeA8B7BJQ0sqGhyzYLaWJ6zg+VfgOUwJX63h08IbNGvLic4r8l6+2BA1S665l6R6Or+OrV4CfF6KX/cfHkc3+YCiG+YR8D47xd67SsnzWFztSJA0uCRRU8aj2OFytHgrIgSs8P9ZDPhFeB7FLwiE9DEIJEPYfhmAsF3n7fI5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098818; c=relaxed/simple;
	bh=+XeS5b0xBdtx6sElp83qNzuoaaH9g+rL5B6Vrrqe/k8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kmIU2IrJ+idlO3YgF7x2aIPyM5N8QtNQOD4sVATbgLIYndcEq931XXx5L6zKIopKS1+T+ZLsBFkGAa0Ll/jHnspyCu6ivZd/MWZUgsTJNILc31IzoYl2Kb6inM/40gFD3yPRjGUDYFiu7zmIJX7Hs9fT7Xz6HVgiJ5Dxlpb1VNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJtl/6w4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5A8C19422;
	Thu, 22 Jan 2026 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098816;
	bh=+XeS5b0xBdtx6sElp83qNzuoaaH9g+rL5B6Vrrqe/k8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dJtl/6w49AO1bKBG7QB16p+GVumo51WF/UUeMPjDKBFATMpqZOI/eaEfGzVY4Goc+
	 QWMyjvNYHr0MdNUFfdAnQdrsLXIzm4z4/lpWonTCaZyKm7CGH1kIMG9KOSs2FYA1tT
	 vrN7axiA5dOqeuqUfRe2mtln89CvwzFB7LpuJ8sgRL/zUeSDLBlUXE6tUMeJ3NhmOq
	 10m/nKPNGa36TJEbZBzsudQtgWafmQfqpk7hbKo7uCxEHAtp+sCjHSJ7Utvg28cekV
	 AAZb2BJpHU8ZHS87VPfj1ywNcPyxoOgEFSqEdMBWoJ+OWQAzMvo7rvJd0qAtlXjTlL
	 ewrnRfiKYgteg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8CDB3808200;
	Thu, 22 Jan 2026 16:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Add PICS and howto for the L2CAP
 qualification
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176909881235.1793166.11223444856942486129.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 16:20:12 +0000
References: <20260119155548.89569-1-frederic.danis@collabora.com>
In-Reply-To: <20260119155548.89569-1-frederic.danis@collabora.com>
To: =?utf-8?b?RnLDqWTDqXJpYyBEYW5pcyA8ZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbT4=?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:-];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	TAGGED_FROM(0.00)[bounces-18332-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 140736A202
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 19 Jan 2026 16:55:48 +0100 you wrote:
> ---
>  doc/qualification/l2cap-pics.rst | 345 ++++++++++++++++++++++++
>  doc/qualification/l2cap-pts.rst  | 443 +++++++++++++++++++++++++++++++
>  2 files changed, 788 insertions(+)
>  create mode 100644 doc/qualification/l2cap-pics.rst
>  create mode 100644 doc/qualification/l2cap-pts.rst

Here is the summary with links:
  - [BlueZ] doc/qualification: Add PICS and howto for the L2CAP qualification
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=ad1ab05699b1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



