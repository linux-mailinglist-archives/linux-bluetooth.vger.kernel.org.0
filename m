Return-Path: <linux-bluetooth+bounces-18546-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFPNGz4EeWk3ugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18546-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:22 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D43990F3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0818302C66E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2735327798;
	Tue, 27 Jan 2026 18:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTohvc4Z"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29E325729
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538617; cv=none; b=Ee61B20abd4vj5PzO2wEor7VV5NJshtf54F1ZMjq+38piHCN8S6i+GRYOEKfcHKFGFhQoV6cqontAlqBGYtcbG2f922IOGlK7VrJ6rZiPshq1TzOovpXJ9oT/1+x02B/sotZC6wjmE4OtUBWtKWg5cUvTvOXFVDfnnA14QRHN/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538617; c=relaxed/simple;
	bh=32PgvUR9cOcambbNP1WQvaqVIsJYLonb8uuwi9ujZfk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ElbQ6Od1WtRzemEKBc6ZFNQDp5ZnRfXnW1928+XxqrI02fPS8ljhDaO0r2sp9bZcMSGRwfKiEYOuX5B8bIy13tA36nFcHuiubHUU2+1QOypNQAImgHLd2X89lQ0wn5Ykg++LMc0H5jpcfe8BmMpjG+NYfeHBQPiuVo8V1dnDiso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTohvc4Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D9AC116C6;
	Tue, 27 Jan 2026 18:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538617;
	bh=32PgvUR9cOcambbNP1WQvaqVIsJYLonb8uuwi9ujZfk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UTohvc4Z7zlbTGrP/UYT/sq/Ll+ejcQMSkyW0WsWaUpSyDEbT4nbmx1xiF9kH5tM7
	 Kft6cV8WYoGATjimJwQXQrDcC6UsN4AkzRwogwwiyxzySMY70ZYPqyVXc+/VfAgnX6
	 QhrIAu7UeEBIAnV4oMTpT7mx3cixsb6OjPHa30qzIHF99YQROhIsNpDmHEl6g2vqXK
	 SVPi/LoxGCtuHSAolytAN6vKR6qm8cPfv8GONBMO+c68TderCc2CdbrYEQ1KrsTWqW
	 zCoSqyw7DZfdzw6+gRABkGLYSzq7XcO+svZnIAJvFK2mifdGYwm1x6d73y8LSZjfKt
	 DPraWQyii2g0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EABF380AA58;
	Tue, 27 Jan 2026 18:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Add PICS and howto for the
 RFComm
 qualification
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176953861109.1352702.6154758372019992511.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 18:30:11 +0000
References: <20260127171306.151311-1-frederic.danis@collabora.com>
In-Reply-To: <20260127171306.151311-1-frederic.danis@collabora.com>
To: =?utf-8?b?RnLDqWTDqXJpYyBEYW5pcyA8ZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbT4=?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-18546-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D2D43990F3
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Jan 2026 18:13:06 +0100 you wrote:
> ---
>  doc/qualification/rfcomm-pics.rst | 106 ++++++++++++++++++++++++++++++
>  doc/qualification/rfcomm-pts.rst  |  58 ++++++++++++++++
>  2 files changed, 164 insertions(+)
>  create mode 100644 doc/qualification/rfcomm-pics.rst
>  create mode 100644 doc/qualification/rfcomm-pts.rst

Here is the summary with links:
  - [BlueZ] doc/qualification: Add PICS and howto for the RFComm qualification
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=04d67cea10f7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



