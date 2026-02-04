Return-Path: <linux-bluetooth+bounces-18828-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGT+JmrBg2k6uAMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18828-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 23:00:10 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD583ECE7E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 23:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7857C300E702
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Feb 2026 22:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0039033986E;
	Wed,  4 Feb 2026 22:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2H4sZYo"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8471B20DD75
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Feb 2026 22:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770242406; cv=none; b=V9RtHLZIxG/ble9g+YhXuUhN+YUYy6UqBPzNqpXDAzHdjjtquI77zJR7mTpVUNPmZWjxgw1fplzApx5H63HBHlEGwHQnRY5McgfXy4Q7yfGiAT6Ia8arLo3tf4jyCa+4nUEbfI9vd2txo5sFOuLCLVJEyvYuBCjc+zzRYOcb9XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770242406; c=relaxed/simple;
	bh=Arw2FDJqE868Rg6JeQYeaerDlDTYsUZIjr5O7h6Td7A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BNzt0eUEOffe3NO0sG9BWKnLK3sb7NvOP+rlB8+2aAfRcGtq8Tq3287RcCGFxi/boRE8NL0k3sYgd26xreSzsbvXqmXhzJySQJ8iNmDlCrR1Bxc8emh/C5LiWjyZls36Z21J582SA8DX75OEjlId4RRY0sPVZhorzxQFoaMPlbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2H4sZYo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32714C4CEF7;
	Wed,  4 Feb 2026 22:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770242406;
	bh=Arw2FDJqE868Rg6JeQYeaerDlDTYsUZIjr5O7h6Td7A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M2H4sZYopAwFiafcmEEMkNfde3qu3+9F4IL6tYusNP6WfXFT1D2Nu8hPH7cm3sLi8
	 ZtzEiaNVPK25nCE0kIOUqF+DipnaLs4HcQZgllFb3HvWGBU48wYkl47o8S4NztUv2B
	 N4Rm2nW+o1BCWj6OLZVq6QWDGFBD8P6LMVsSiayJaPB101aZ7ES/xkOhQC7EKxseGT
	 auIhjmI1nOTVmQnVYwnOPUBOTkhzD3gkajolbgOwzj/8RRenxO+feTytm+fjf/OLRC
	 V+aj0ffxzMhPk5KceR6EuJtxSteXmPrkMfbpWQjGg2scrVroboPzpZV2NKvVIWY4IW
	 OVn9XcJd50VaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 851723808200;
	Wed,  4 Feb 2026 22:00:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v1] monitor/l2cap: Add missing result for
 BT_L2CAP_PDU_ECRED_RECONF_RSP
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177024240433.70576.12778414573997452669.git-patchwork-notify@kernel.org>
Date: Wed, 04 Feb 2026 22:00:04 +0000
References: <20260204185707.2327200-1-luiz.dentz@gmail.com>
In-Reply-To: <20260204185707.2327200-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-18828-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	HAS_WP_URI(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,bluetooth.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD583ECE7E
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed,  4 Feb 2026 13:57:07 -0500 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> Last 2 BT_L2CAP_PDU_ECRED_RECONF_RSP result opcodes were missing
> accourding to Bluetooth Core 6.2 spec:
> 
> https://www.bluetooth.com/wp-content/uploads/Files/Specification/HTML/Core-62/out/en/host/logical-link-control-and-adaptation-protocol-specification.html#UUID-02ef4c03-7278-7ad6-bbf2-ee2f0e921fed
> 
> [...]

Here is the summary with links:
  - [BlueZ,v1] monitor/l2cap: Add missing result for BT_L2CAP_PDU_ECRED_RECONF_RSP
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=fc20373d03c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



