Return-Path: <linux-bluetooth+bounces-18410-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE1wAVapd2nrjwEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18410-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 18:50:14 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDE78BAF7
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 18:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4617D3019FF5
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 17:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D038034A790;
	Mon, 26 Jan 2026 17:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MT1r7Xsj"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF29346791
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 17:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769449811; cv=none; b=L5zsezBBCc/1NxHOkRk/kbZjzT8C2QlCqzHHtFSXXZ+T9SEFrTkbUVoDF3BrwSZUIXUxZwzTzcIZgcAAz+O2GwGt+8X2vKzNLrve8/82OJCBqxKOrfmEg/sE4nCZSs+YrDFzjuVoIRnYKPQVjzUgl7rbWDA5VOgao/qgPiGmTU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769449811; c=relaxed/simple;
	bh=SYwOh2jxsy20l7bMnJaBfl+wuyPlsmjnUmLLeoDBQIU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Xlc2LdvBioVPVgYiaIhEHgMDgHXVknwTAkspht72nhy+OCjZ+VXy2xqT9IVj1T5JY3Jn+JuULVQovJLNLzzy8CrZcinzHkUANazNJ9A5t+jnuKTY3ePBH7UihpAkqMQdeTsN8SXRf4RchcBAtcMkTmKbe2BzHrw5Txo+rzYe0tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MT1r7Xsj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267B5C116C6;
	Mon, 26 Jan 2026 17:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769449811;
	bh=SYwOh2jxsy20l7bMnJaBfl+wuyPlsmjnUmLLeoDBQIU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MT1r7XsjTkA9AhJ0AygDzKtOZh4JjgmhkSte4Ueo0Vk5ni7YtHMOEbsr/RwS5Qw7z
	 eQIvsHDq9x6QNUK/deCiWpFw4SHPci0uHX6jkj2X/CgcsdWpWlejY0ld++LRAXD1g4
	 G5C+r6o1MTiizutbhQageWVcOik/GClJ60c2wPxH3L57ovw4gJLrw/Rhao4DZFSNq4
	 wGSDFHjSNgIqNNDPnwxUK34bVE3ANSRYvTMfywu5ohOYBhxTjsQYMc1Lf/h/hlonLh
	 R7l5IbpCODXNJ8ZPJd/yiSbHpfulOM2IMJbTj6w4PTtDeSwM9ni/LukzC/jU7DYPNy
	 BLJKhPisrAaMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8B5D380A94A;
	Mon, 26 Jan 2026 17:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v2] shared/tmap: Fix TMAP/SR/SGGIT/CHA/BV-01-C on
 big
 endian
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176944980559.117979.2565536006432477470.git-patchwork-notify@kernel.org>
Date: Mon, 26 Jan 2026 17:50:05 +0000
References: <20260126165754.3567649-1-luiz.dentz@gmail.com>
In-Reply-To: <20260126165754.3567649-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-18410-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 6CDE78BAF7
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 26 Jan 2026 11:57:54 -0500 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This fix the following error cause by not converting the role value to
> little endian:
> 
> TMAP/SR/SGGIT/CHA/BV-01-C [Characteristic GGIT - TMAP Role] - run
> **
> ERROR:src/shared/tester.c:992:test_io_recv: assertion failed: (memcmp(buf, iov->iov_base, len) == 0)
> Bail out! ERROR:src/shared/tester.c:992:test_io_recv: assertion failed: (memcmp(buf, iov->iov_base, len) == 0)
> 
> [...]

Here is the summary with links:
  - [BlueZ,v2] shared/tmap: Fix TMAP/SR/SGGIT/CHA/BV-01-C on big endian
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=521088388bab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



