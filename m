Return-Path: <linux-bluetooth+bounces-18421-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LRbLnzmd2k9mQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18421-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 23:11:08 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3BE8DDDC
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 23:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 698BB3050D47
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 22:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13ED52FFF82;
	Mon, 26 Jan 2026 22:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7U3eipH"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9892F2417C3
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769465414; cv=none; b=YX2eel1I3vbjoL9+Z/s5FUeo0EwpCNdF1V01D5IwOTZOU+3liMVdfWhDuapGRg7sZbUR0+wOzwNGAUnPdBd0PkNbN4PoTNqRSxhRf7rTEhIKHA+2Na6QClM2qEzhBqYy2XRLVA8WDZLioG33xQhnnBljVaDbs8D2LHxJPDvIPXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769465414; c=relaxed/simple;
	bh=MLmXmrGD/8QIOejj6QQcqwc0DWdoHe3u3qxK3Ku06eI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=n+jNLyI/r+enIphB+ld+BahYq1sBVttwYVTp5UsdzjBW9QAXxOp8G9inr7yCcvSnvLqRPoAo3YDI41ZKPuApB9YXmI3MvBCRMc/+RYbr80AKvlBElh8q6ntFt8oLd7QAeurlbCsGwUJx9Wte7qzqw4756jHdUcEHKO+33lSIUPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7U3eipH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7163EC116C6;
	Mon, 26 Jan 2026 22:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769465414;
	bh=MLmXmrGD/8QIOejj6QQcqwc0DWdoHe3u3qxK3Ku06eI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a7U3eipH+TlEX+w5WaaeNAvO6pDyzOEX2s/RO4Cc+iLolMrdJmwDeXdcw/aufH+9z
	 p/WbmS4Byi12lEHJhQDZ18Sfy18sHP9vAAfz0t/zXTiXiei6lRWX/GHbTX2qcB3cDw
	 mHLJucwWjCRBRpOKT/goZGEW1wiQJjQn8mxMP/041+GL/vXe0aKwqghaTfxYyngFOd
	 qp1h0gVhy5fIgSH8Lk24iNd7FzwPjNfPM7LEJ4hHgta4MilG/Aar6XKRe6dm7R4HAr
	 mZmKrVuQ4eVtVoF9Bi6C2AVfPz11wSrZrlZmOvmRAUeDzokHeX+benEe0jlM67asxQ
	 Gm8uQ8IFUlxcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 119CF380A958;
	Mon, 26 Jan 2026 22:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Add PICS and howto for the GATT
 qualification
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176946540860.196436.1658335279302606599.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 22:10:08 +0000
References: <20260123105338.677646-1-frederic.danis@collabora.com>
In-Reply-To: <20260123105338.677646-1-frederic.danis@collabora.com>
To: =?utf-8?b?RnLDqWTDqXJpYyBEYW5pcyA8ZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbT4=?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-18421-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 0F3BE8DDDC
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 23 Jan 2026 11:53:38 +0100 you wrote:
> ---
>  doc/qualification/gatt-pics.rst |  538 +++++++++++++++
>  doc/qualification/gatt-pts.rst  | 1151 +++++++++++++++++++++++++++++++
>  2 files changed, 1689 insertions(+)
>  create mode 100644 doc/qualification/gatt-pics.rst
>  create mode 100644 doc/qualification/gatt-pts.rst

Here is the summary with links:
  - [BlueZ] doc/qualification: Add PICS and howto for the GATT qualification
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=2c72364163e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



