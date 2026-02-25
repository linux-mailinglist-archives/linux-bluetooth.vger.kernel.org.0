Return-Path: <linux-bluetooth+bounces-19418-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IbvIks2n2m5ZQQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19418-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 18:50:03 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B6519BC7E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 18:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C4D0303B4C4
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Feb 2026 17:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E9E3E959C;
	Wed, 25 Feb 2026 17:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hmt+HqWT"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792BD3D649D
	for <linux-bluetooth@vger.kernel.org>; Wed, 25 Feb 2026 17:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772041799; cv=none; b=bmsfNTZTmgVYnyaiRCntkItupSUTA8Z9RevlxRXXbJTl7FAte/SY4KUsAJ/7zAnl6AugD4okeu+kUk6zaWsfSvVLDtnysa59feJq/0MtMueKXldgJv/2/GB+BQK0XQHaP7X2iCUcwcwzhk1+xUA+eC9z/D2pQ+30XVb01ppFqCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772041799; c=relaxed/simple;
	bh=vVctGAP5Ir3ff/0PW2dvQs8XyWa87FXcA64417p0lmc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YmsXZxxHZICuYtHRhPpzTfVlOC0SHX7Coy45lfhk63Na3qsmbsHlkhKOTau/xZfswO6a9I9+8qool/PKTiHyn4K+6PZNvuqi4m3QJS9cHXPEMQgsIHcEok3tppLv5a94b/xzEsgeecrFnlTHAvz4ZvT63r342sWMq4LmQVkpwcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hmt+HqWT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109EFC116D0;
	Wed, 25 Feb 2026 17:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772041799;
	bh=vVctGAP5Ir3ff/0PW2dvQs8XyWa87FXcA64417p0lmc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Hmt+HqWT5wyoElmmPONnOHNtSAr3ZFmq6M+XjzErCI6WUuNN5YL0ZDdw1g/4a77Qk
	 W8jAZScpCM1ERCg3LfylYLSgTlonYESmW5VG6x7kH+gJzXgOfzdjah8PjwDdcYcJ1y
	 rfe1um2EV2UJ0sVUwwjAcnh8juo1lD1fTWvvb4kYs4qLMNg7+01iXBU9k31ZYzX1y3
	 3TkL2HMGgZ+Z3+DtNrTVVHvDBC+TPgp9thv7Bl8kWd+ybiDcFHW9XNuBIMJE3Ysocq
	 ZMB/72PEN2zPVjPHUPepEtxgWD6tPqsPsI/JafFMsCKm7JkTapUluonp6h6PbKP97g
	 fFaxAVLvmU1Ig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE2D3809A90;
	Wed, 25 Feb 2026 17:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v1] shared/att: Simplify logic of DB out of sync
 recovery
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177204180404.847049.14351266975208736704.git-patchwork-notify@kernel.org>
Date: Wed, 25 Feb 2026 17:50:04 +0000
References: <20260224185524.4044679-1-luiz.dentz@gmail.com>
In-Reply-To: <20260224185524.4044679-1-luiz.dentz@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-19418-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1B6519BC7E
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 24 Feb 2026 13:55:24 -0500 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This removes struct pending_db_sync since it is not really necessary
> to record all the field in bt_att_pdu_error_rsp, most of them can be
> directly recovered from the original request and the ecode is meant
> to be only BT_ATT_ERROR_DB_OUT_OF_SYNC.
> 
> [...]

Here is the summary with links:
  - [BlueZ,v1] shared/att: Simplify logic of DB out of sync recovery
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=a96f5f4eba9a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



