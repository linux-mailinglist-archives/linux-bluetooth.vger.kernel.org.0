Return-Path: <linux-bluetooth+bounces-18547-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKSlI2AEeWk3ugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18547-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:56 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3D39913B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B017330649EA
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7F7327206;
	Tue, 27 Jan 2026 18:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nifXh7eF"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D82E8E12
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538618; cv=none; b=ZfeKF05OfVYqtQ3tMN6ljZl1xUN0eRaRVazQ1Kj4CTZDvyfOxMLDuLhsNKxTs4Qn0TVoIV5QM/Wk72VtJz7PYW99ZdYNEZxiWG+vmE4p7oM/ieZsAc8UQ08f3oiwMmu7urvin+lAL0bBLggGikmC0s6e18DiofdrvIQMMWHfGOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538618; c=relaxed/simple;
	bh=ndJZt6EsGXgSI5+WcvgYNgQusybkqLHWi02qNRrhMhA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=UyKtW5O7NhFquVufjgRc+nIFLSJPQsI02sejydzXWbpV+ZdxqkRupMQ3ZJcxyDVOXjibXY7SaiKBWXX4SVhMzsortI5A8cxK0TDBq7bQZRi8L8/lx1G/5p+cR9HCRZJ3G+6YVjdatJX8iGAu40kRWySZRt2E70nK1ov+Z+R4hSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nifXh7eF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35C3C116C6;
	Tue, 27 Jan 2026 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538618;
	bh=ndJZt6EsGXgSI5+WcvgYNgQusybkqLHWi02qNRrhMhA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nifXh7eFMeotlDva+RlZ0BUX9xWFB0HD0tjZ6abI+VX+Y1OWIAX6GuLfMfksSrOXb
	 dTNU/J+JZY+ge8qgWG1HNqhecNBUimtZqqfeKAic/RwwTH/VfmXybxAJGuwbygpUnT
	 62rtsJ4VTw5ODyOanrLnvnw+3EYIJC/kMXSk3gFZyoMG2gRECGQ6ldSAo/FZP3U/dZ
	 S2MSQE15tlFVZqP1YAO6wa7X4y/rfRhx2gYgPdpdOnBakq8iG+zXntzALQ7TzuHQTp
	 C6IQh6pqM35GLIxvQMgQxwGUH62ZGw8uE58j8Dqbfy36IqOVpojNEyd536UaInzrDU
	 NvC4NbJqL6dMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8BAA380AA58;
	Tue, 27 Jan 2026 18:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Add PICS and howto for the HoGP
 qualification
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176953861234.1352702.1841230686193146698.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 18:30:12 +0000
References: <20260127171543.151581-1-frederic.danis@collabora.com>
In-Reply-To: <20260127171543.151581-1-frederic.danis@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-18547-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE3D39913B
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Jan 2026 18:15:43 +0100 you wrote:
> ---
>  doc/qualification/hogp-pics.rst | 592 ++++++++++++++++++++++++++++++++
>  doc/qualification/hogp-pts.rst  | 104 ++++++
>  2 files changed, 696 insertions(+)
>  create mode 100644 doc/qualification/hogp-pics.rst
>  create mode 100644 doc/qualification/hogp-pts.rst

Here is the summary with links:
  - [BlueZ] doc/qualification: Add PICS and howto for the HoGP qualification
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=402d0c52ac40

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



