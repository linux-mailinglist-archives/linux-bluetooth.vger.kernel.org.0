Return-Path: <linux-bluetooth+bounces-19869-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEIRIJHuqmmOYAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19869-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Mar 2026 16:11:13 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F089223877
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Mar 2026 16:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 201DE3025700
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Mar 2026 15:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6123B3C15;
	Fri,  6 Mar 2026 15:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tID2KumI"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D969F3A4519
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Mar 2026 15:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809806; cv=none; b=bVcp7GTFBVP7tn4aM0C2ryVpsL8z555+1xivAPmguaHBOH9X3fjU+Vxzzu4ap8LV1Xb7w+FZJGAS2fSIa/3V3y81sHiBKkWBkJcaD8RroUoS8a1ap5Bl9nZtMQWZn7SMTp0rxgQ57clUpnW0hEid/iJBOGDsNJdcViTEXP6Lp48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809806; c=relaxed/simple;
	bh=s13SbSnL6pi72yBoVi41y8V+92OUkGYVKlXnNfmzSxs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TNMPGHL8XnGYH1X2jZh+hSTloOxZrIql6OcHqwXga8mM+ccNnrKgnmOyD3waGumO8OO8T3zzR5HQ5Vx6nWO9lL54NRuwVLR8UhyRisxT3SrDCSBSOV4vxqi+w4Z/DeM25f0Epbx1bfK7nXHPudb20QXmId9oujvlu4GrpriblgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tID2KumI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFE7C4CEF7;
	Fri,  6 Mar 2026 15:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772809805;
	bh=s13SbSnL6pi72yBoVi41y8V+92OUkGYVKlXnNfmzSxs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tID2KumIAfp2UJK1GvoJVqpWmAqqQAdspbCemO6lD5zB2xvLE062GejaEu1tPdyaw
	 TbYQNDJ8j1lOyTAS4gNL4+4sHRgpUrYWxVq4shzwHEEeym2KHQdqgbMqfsljbAF+pD
	 MSjQh6HvZR5vJ+o6z2VKesouqKBmj5pa0hVegOv5U1DDukwJiyQp9auMyeFD8vCJSv
	 nkNGrQjQyb99bSX2p1tpysELXbbu4tW7xx05WdQdO94EV8i7TcRiOmr68aS8OQSbiC
	 s3AHEe0Jv/bc2qay6JAxH+UVgqaRrc8rqrDQ9J4ZhIit+I8ZmHHPh0VZJ5/BpqqgW8
	 yhBgxxW4dcB2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FA43808200;
	Fri,  6 Mar 2026 15:10:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v3] client/btpclient: Add GATT support to get Device
 name
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177280980455.3708258.3926582645716607139.git-patchwork-notify@kernel.org>
Date: Fri, 06 Mar 2026 15:10:04 +0000
References: <20260218085206.498756-1-frederic.danis@collabora.com>
In-Reply-To: <20260218085206.498756-1-frederic.danis@collabora.com>
To: =?utf-8?b?RnLDqWTDqXJpYyBEYW5pcyA8ZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbT4=?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Queue-Id: 0F089223877
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_SPAM(0.00)[0.949];
	TAGGED_FROM(0.00)[bounces-19869-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 18 Feb 2026 09:52:06 +0100 you wrote:
> Add GATT support to btpclient so the it can read the "Device Name"
> characteristic (UUID 0x2A00) from the DBus interface resolved during
> device connection.
> 
> The device connected event is postponed until ServicesResolved property
> is set to true to ensure that the services, characteristics and
> descriptors lists has been fully populated.
> 
> [...]

Here is the summary with links:
  - [BlueZ,v3] client/btpclient: Add GATT support to get Device name
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=8d82d3e1e539

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



