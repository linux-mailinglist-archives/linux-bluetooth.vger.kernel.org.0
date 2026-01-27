Return-Path: <linux-bluetooth+bounces-18544-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MC6CTwEeWk3ugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18544-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:20 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74743990EB
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86004301B904
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763A43271E8;
	Tue, 27 Jan 2026 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oB3FE4mH"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A8F2E9EDA
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538615; cv=none; b=GEWyb9eGt87eZRsurkxKICdmELUPfH8L1YzJ5HrAJM5EOvIRvQNp1FYbZ5Ye2xLBJGgPmfvHQOPDyueHmHQC8YUAZnFdCRNQnVX9/lJuZojWazZIb+qfLGLcpaTkhaTowEUcuVb+rU+ja9UhBCrtDVzJP707Pmo01awmREgZWn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538615; c=relaxed/simple;
	bh=NVnfe/H4jHJdduSpuL+TfiYkmNjRzBN0OqF2JahPg3E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=C/W7MBUg7WTMAE9T8fMPYCgnFJQ0+I0o0zLsNGr4HR0HkOLuZUhmk/McfNIx+Oa3swr2suIzmMn6F+ICULhOGjTWj6BRSFVA4MDdwbespbTxUSgCyYjeAb/hGpGS+iRL0sCBjDv+VlAJpsp/ER/XIcILWjay0ornxEqZoarlJSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oB3FE4mH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1049C116C6;
	Tue, 27 Jan 2026 18:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538614;
	bh=NVnfe/H4jHJdduSpuL+TfiYkmNjRzBN0OqF2JahPg3E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oB3FE4mHFwmvFCzzNkFszyPQ0JhDM2FERQW1yTNjJze/f0O79VZaqy8YhMwbshCYG
	 7m7gbAtpx6rznNV7qqp0Wg7CGWxwmMc6UsVzZKEomW4n+S3msK2F/mYWs3nalk25kn
	 izEEZt0sk/95LziXp263SjxDm40jPqV1/3QN1DbsxSdmujE3FoEi54V4XRVJqkZ5VO
	 Z31YNAGjz4xXxKmvs0rwCCplRJJ3xorN5ehieYkFlevM40A/l+8jvs/XhiHVcoFztJ
	 3PeypYIChrW6tywj4K3dwHqmDmUzIuf4D9Ids2pxd0X5RF6WwTUrmiNg4mI5UdmLnh
	 QtABhFOvDTWqQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8C6A380AA58;
	Tue, 27 Jan 2026 18:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Add PICS and howto for the SDP
 qualification
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176953860861.1352702.5838161072961375584.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 18:30:08 +0000
References: <20260127171433.151442-1-frederic.danis@collabora.com>
In-Reply-To: <20260127171433.151442-1-frederic.danis@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-18544-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74743990EB
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Jan 2026 18:14:33 +0100 you wrote:
> ---
>  doc/qualification/sdp-pics.rst | 205 +++++++++++++++++++++++++++++++++
>  doc/qualification/sdp-pts.rst  |  63 ++++++++++
>  2 files changed, 268 insertions(+)
>  create mode 100644 doc/qualification/sdp-pics.rst
>  create mode 100644 doc/qualification/sdp-pts.rst

Here is the summary with links:
  - [BlueZ] doc/qualification: Add PICS and howto for the SDP qualification
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=516b7adfa7a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



