Return-Path: <linux-bluetooth+bounces-19860-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPzhDQdLqmmIOwEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19860-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Mar 2026 04:33:27 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C4421B21E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Mar 2026 04:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26E0F3032D14
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Mar 2026 03:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7814136BCE6;
	Fri,  6 Mar 2026 03:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCfql+Kx"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051D1353ED9;
	Fri,  6 Mar 2026 03:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772767989; cv=none; b=Qn6T/WCJayW6IoQnY+Ser89V7XgNtKhs573QDdT2n9E8q5dPgeOcErupTNi91hNK9gmvbeVBwfQIfeN5bQHSxfnxIKAmG+GWtdHx7jCxsDiNBOdGVOX6ehGWSBo8sMgTxxVyXLNlZR+MUJ+FAKouKPJ8f0eTYMx0Tn8DKl78JjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772767989; c=relaxed/simple;
	bh=unv0SRNShvYUMd68zRxLISvrt/O9tQGwFHiJtU7kG2w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PEdjFdZMm1ShQVj6SF0MHdxURXbeDMtcaQY8G1Jmdfpyo2u4xEJT1HVd9yDejieqEHx4I2sHFQmklQilVs/wu3rfIXN5U3sp9Nu2Kz90Bw/QzJ2UZNuajWrmNkVYwvOUbk5f/viRX+JHM8T9qJn9Flx9X3xmSinyRccC9ub9LVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCfql+Kx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9384EC116C6;
	Fri,  6 Mar 2026 03:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772767988;
	bh=unv0SRNShvYUMd68zRxLISvrt/O9tQGwFHiJtU7kG2w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XCfql+KxJQxNueivV5sxjpCb9vnrWXvgNKwVRQcEof7u0rWFLhDhlQu7zGPVSDBTl
	 0POWoWNG4cX8LzzDdmVeuh5zLBqeT/k3JjFfObTpAHX17sDFztbK7oWu6ryjVnCv/k
	 PiNaEnEAsudPn5nNQoqeCXURF8A1sYy+ranf5c7ylGFQnhbzPOXdkVCAe5ysZl4D6s
	 Bftga6P6s52cckUxfYNdpTeemcpP2GNlC6IVGT7GdcIV2FXk/fLLQyUfMSVFXfOee/
	 2Tiw73jn/Bh7SLJ+PT90UbMsFFrp3cWdbB3vU0/H2HGUTHyPFyX66CfMX9Sz+z2ViT
	 qFgr7T1tvklog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D2773808200;
	Fri,  6 Mar 2026 03:33:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: MGMT: Fix list corruption and UAF in command
 complete handlers
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177276798804.3348267.17252106352846534808.git-patchwork-notify@kernel.org>
Date: Fri, 06 Mar 2026 03:33:08 +0000
References: <20260227110339.919014-1-wangtao554@huawei.com>
In-Reply-To: <20260227110339.919014-1-wangtao554@huawei.com>
To: Wang Tao <wangtao554@huawei.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhangqiao22@huawei.com, tanghui20@huawei.com
X-Rspamd-Queue-Id: E7C4421B21E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19860-lists,linux-bluetooth=lfdr.de,bluetooth];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,vger.kernel.org,huawei.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 27 Feb 2026 11:03:39 +0000 you wrote:
> Commit 302a1f674c00 ("Bluetooth: MGMT: Fix possible UAFs") introduced
> mgmt_pending_valid(), which not only validates the pending command but
> also unlinks it from the pending list if it is valid. This change in
> semantics requires updates to several completion handlers to avoid list
> corruption and memory safety issues.
> 
> This patch addresses two left-over issues from the aforementioned rework:
> 
> [...]

Here is the summary with links:
  - Bluetooth: MGMT: Fix list corruption and UAF in command complete handlers
    https://git.kernel.org/bluetooth/bluetooth-next/c/eaf573d74cd1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



