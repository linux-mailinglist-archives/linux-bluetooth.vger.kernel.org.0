Return-Path: <linux-bluetooth+bounces-18554-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMliKXYEeWk3ugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18554-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:31:18 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E57B99176
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDC7F307A367
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F2428030E;
	Tue, 27 Jan 2026 18:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BEACpb7t"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAF9192B75
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538628; cv=none; b=E0BKSRGpZdHlUuUviUPEaZntd1MvAPe1nV4o0XHYsNhDTd7SiK1i/iixc+GrA1dzmAsplbYslwTYXNIr2o9y2IJK3PbK3kXsh+w4hmfyRZGIlSPiHh98KPZkdN1BjmvzQLIe+rZU2pJeeRS7feOrgT3mwTdEL2xtMVp/8851Icw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538628; c=relaxed/simple;
	bh=zjTZWKxIaXfElzuI+jlzcyNKTvMoKfqR/11TGfNyVv4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=p99L9OZse/bvq3ZeR/CuSK+Y6VGCnwznQqorStd/h7fHBsYP3WP4UOP67D0uUJtjnQ6nEwNywaoWs93s5k3sGTDU5P6+WHxoaIkekO0pZKK4qmfFW07Fnh9BB008vaeusA1t8/EG1yU7Q09HXcOg2H4Dn8rZpIhq9elvGuO1JHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEACpb7t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23480C116C6;
	Tue, 27 Jan 2026 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538628;
	bh=zjTZWKxIaXfElzuI+jlzcyNKTvMoKfqR/11TGfNyVv4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BEACpb7tyJ0h20XhzeYu5VGR4pRpciPC2ZDwagsq4QvJppEQ0xaiash/aVrMn7d/H
	 CL7yhkXjCPlad9RQAs/0BkswAAv8PU6UNZdlvnTn7C+fUVljXy6hwpEcFgr3MXBgu9
	 sQ3kNIGpYZ7nrgphDEa5cF2Nm8YtLLGZ+qXjrdDRySPhbjB4o8L/Q/w0WEDoIER7ok
	 vh0oRo926uJsCnjFPwSeVNwXJGUbVPJZpOmc3tVH91e9FsEJLe1rSs5RC12ZWt5m55
	 D2ABGWgeOCSpdt5XLxDOCLxCTAOtT2ifzRn4nNV4UUQIXMdzihaJTR6YoymzrITbq2
	 UzHG7JtTAjE9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EA9D380AA58;
	Tue, 27 Jan 2026 18:30:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Add PICS and howto for the GAVDP
 qualification
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176953862209.1352702.10295983368981058028.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 18:30:22 +0000
References: <20260127171133.151134-1-frederic.danis@collabora.com>
In-Reply-To: <20260127171133.151134-1-frederic.danis@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-18554-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E57B99176
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Jan 2026 18:11:33 +0100 you wrote:
> ---
>  doc/qualification/gavdp-pics.rst | 170 +++++++++++++++++++++++++++++++
>  doc/qualification/gavdp-pts.rst  |  33 ++++++
>  2 files changed, 203 insertions(+)
>  create mode 100644 doc/qualification/gavdp-pics.rst
>  create mode 100644 doc/qualification/gavdp-pts.rst

Here is the summary with links:
  - [BlueZ] doc/qualification: Add PICS and howto for the GAVDP qualification
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=4a38072ba45e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



