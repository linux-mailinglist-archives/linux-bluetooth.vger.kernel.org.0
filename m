Return-Path: <linux-bluetooth+bounces-19947-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DyvGoPSrmlhJAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19947-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 15:00:35 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAB523A32D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 15:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E1B7301DC38
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Mar 2026 14:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CD23CD8C8;
	Mon,  9 Mar 2026 14:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcGRn9qb"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC0C38F948
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2026 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773064813; cv=none; b=e8FPQvZnEXARd6FQ6xP8meJzPcinpHnSspNBnUi+FpCsXml09HsUUtC9QHXhmx+fZwfnfAfoTAE51qBGVGefoBpkxIIRUUjdE8yQaEFIkU6jQ2CNY4hsl1rDfs/5+vAc8zthME/3jRJFw0G06dj3TVCT7b26UrGQIoQS5YNI3F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773064813; c=relaxed/simple;
	bh=uUikIqdyrVpEoGGcTWlaPaWzqGbYnadRqN++u+OPLDQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JvOj+hO4QsD8vT1yFhRuOw74seHzbR3CZqVQKdbZzgGc9JRx5gUitgJZRcJWCDPGfdqL6vqsdbPnwYktR7A+KulHcOrFwLcnTblDInxBhN7VL89UtHksxfU36WlOgn/I+/WPJLUJZVH7gwg4oU008WjVqIdaj/BDIxwYuh54o2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcGRn9qb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894A6C4CEF7;
	Mon,  9 Mar 2026 14:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773064813;
	bh=uUikIqdyrVpEoGGcTWlaPaWzqGbYnadRqN++u+OPLDQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UcGRn9qbV4QLDaeAS8ikFYj8t5El/gaLLliE4CZxTwueA9lG7Xakv2IzBEkEBbsHj
	 pJkQgyoTtogJ/VCHodeqRcB2Ql6UdJ+7uFAJzQqmq4VLYVsnwg87QE9FrkdecB80sH
	 k/vAtLwfaxHTc/Udc0hEkyIJMz8ryogkkVQPwsKXn2pQFG7pdgE7v5o7aTbBBJrcHH
	 h+e/YqFuFxutjokyru/bXaeJPl0Fhwzv8XGhZlKE/lyhTwJIJPupLRAta6c1sA+f3W
	 fZz6q3wljMI/M41PtqucgfAtCdpq1RxDlkfeSQ88/1wLB+XoA5Ec9JxEw5WLuJRabB
	 ZKNW/N4/Ko3zQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FC763808200;
	Mon,  9 Mar 2026 14:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ 0/2] lib/bluetooth/mgmt: Add missing mgmt_op entry
 for
 HCI_CMD_SYNC
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177306481078.1231626.29655346520084841.git-patchwork-notify@kernel.org>
Date: Mon, 09 Mar 2026 14:00:10 +0000
References: <20260309045902.2354-1-wolozgabriel@gmail.com>
In-Reply-To: <20260309045902.2354-1-wolozgabriel@gmail.com>
To: Gabriel Woloz <wolozgabriel@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Queue-Id: CFAB523A32D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19947-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon,  9 Mar 2026 00:59:01 -0400 you wrote:
> MGMT_OP_HCI_CMD_SYNC (0x005B) is missing from the mgmt_op[] array in lib/bluetooth/mgmt.h. The array terminates prematurely at 0x005A. Add the missing entry under the name "HCI Cmd Sync".
> 
> Gabriel Woloz (1):
>   lib/bluetooth/mgmt: Added missing command "HCI Cmd Sync" to mgmt_op
> 
>  lib/bluetooth/mgmt.h | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [BlueZ,1/1] lib/bluetooth/mgmt: Added missing command "HCI Cmd Sync" to mgmt_op
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=9c6e97516cb1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



