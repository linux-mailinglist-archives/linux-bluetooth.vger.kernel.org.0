Return-Path: <linux-bluetooth+bounces-18521-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDTQKlD9eGmOuQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18521-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:00:48 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC4198B73
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81D973010B89
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1336325714;
	Tue, 27 Jan 2026 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j/899n4d"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771843254B5
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769536815; cv=none; b=LBPvZsWQ8JzB+LhtLDMyNqGvEq7CsbtX1MvFeCUqmyCjV1F5FqqWUtdI3JyXsDWDXPUnb7jXcSYFkkQD2UWeAT4mbD8TPnSlSV3qannlK7TQjY/Fsnc3w/5sSyzhJVsQ+4ATT1t1XcOR3otHrHjfYWKhT0n9h68EpdO94fz+oEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769536815; c=relaxed/simple;
	bh=7brEYMqyYGQ+xYOYaFE8CFMMpktlEh5gHoIwCd7eeTg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hAcpQ2RkYdkC8VFbTZrrFESJJqHvHhi8fOyxL+uSVis4p+kNO7J4uMAz+EiVJrFSDEt+RqbZkYQsW5Rsgw9vABoRUfT/0Eq8Z4NxDXlvcXaLknxuqEtheVAnErEmShSL1Xf/dWAaJmZnsVjqHChHy7dGSlSqrP/DHcGV/HdnANc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j/899n4d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CAEC16AAE;
	Tue, 27 Jan 2026 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769536815;
	bh=7brEYMqyYGQ+xYOYaFE8CFMMpktlEh5gHoIwCd7eeTg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=j/899n4dR7hl/27dId3uChYXiLqSGkmef3UrK/hG+nfhuaPSNeBXGNWsSDsZM10M/
	 ScbR17DJp7hDHIBWEwnmt8iBNRF+qzYxFWACsS8eJvBeExXrg5h1Uy1EVWhhVZlnku
	 t8MKxm9Vmo2sQKqoZE/ESsw2Jdj4gZp6d4FEeTRoDKDhcuQELz5BfNIUX5cNudNZTK
	 teN8gT4nHje1hSgngfKnCa0qTaWib86vuNdjz0EDAB93PyiOsMfupKXWn1So7O0nd3
	 0EdbItZPzPcrdJMjr3ICW1GmTuY51WF9CEBs9Owmyzdlc0s76UpoiAGL7rjK3t7Ghj
	 0SHvszJjFioIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EB0D380AA58;
	Tue, 27 Jan 2026 18:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] profiles: Add Ranging Profile (RAP) implementation
 The
 profile is marked as experimental and requires D-Bus experimental flag to be
 enabled.
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176953680896.1341664.3051097263465558492.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 18:00:08 +0000
References: <20260123113515.552153-1-prathibha.madugonde@oss.qualcomm.com>
In-Reply-To: <20260123113515.552153-1-prathibha.madugonde@oss.qualcomm.com>
To: Prathibha Madugonde <prathibha.madugonde@oss.qualcomm.com>
Cc: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com,
 quic_mohamull@quicinc.com, quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-18521-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DC4198B73
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 23 Jan 2026 17:05:15 +0530 you wrote:
> ---
>  Makefile.plugins       |   3 +
>  profiles/ranging/rap.c | 333 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 336 insertions(+)
>  create mode 100644 profiles/ranging/rap.c

Here is the summary with links:
  - [BlueZ] profiles: Add Ranging Profile (RAP) implementation The profile is marked as experimental and requires D-Bus experimental flag to be enabled.
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=4e43a6283736

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



