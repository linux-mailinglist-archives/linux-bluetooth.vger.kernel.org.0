Return-Path: <linux-bluetooth+bounces-18653-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFl2CT+Le2mlFQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18653-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 17:30:55 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC5BB2344
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 17:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C6006300598F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 16:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE9B3469F6;
	Thu, 29 Jan 2026 16:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFi2bMSa"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D0D346792
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 16:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769704212; cv=none; b=C6Xk806jenWKgXeLPngBjm8ZEj+9VbgafA5W1MZozu4QWtoymOHD32xFeqLwX1tyO8DiWFEah9gELWuo4Hygk1pLgVUTIFQpoMa/3oUyuXCYYB+v5KuRLJclQj+Foiq0o8QmiizHoENpA6MWc6XnAlnbJIEi+jrOqVcH1MWzG8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769704212; c=relaxed/simple;
	bh=n66D/MNNFEBL3GF/+dZjE/xAaesgZpTG3yhJVq9iN4g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oT+b8goeWaBO8KgRGZYfVbe4Ox+23lRDhxQ/Qtv7cOghfmhkMAJjMOCTYU0ygG3Ri88pZlmd8TVlQr+jWgG4DlFoNbEDjlwS8kanpfDBYKdVK1qyKCM4PIl/D+bcYhzO88J7m638ONxZx6r4xJl028SWpEsGWlmKbiIomSpf/rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFi2bMSa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FCE7C4CEF7;
	Thu, 29 Jan 2026 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769704211;
	bh=n66D/MNNFEBL3GF/+dZjE/xAaesgZpTG3yhJVq9iN4g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WFi2bMSao2v1qbr0gGrQVTyORXyvSbp+Dq5WEka2pY8oaidpb0kPrifBWoEfO2L5V
	 e2/9Rqu1nE4q7U/+2UlfM3LMACUoa0AG1csXwPDxDP8oLS/k0SYlhyhXUgtIaI/izc
	 LN5WLsH1rsWa7J9TRZooUbKUHmovQ1eqhv68FxEMC68rwLWd/8rdQzKaAnQWSf5zu1
	 eiQfPqNeviKY/R60YGLMy7fW6ILOSCLgRs9EJGYLkXK8yru4ua3LkyVIQspo+uWQRX
	 bCcQcyMOI7JGJebDSM3fQp7b41tUQWhHDn8E/xhQ+KrmuPKpoWhFN6HO2BzlWmG5ZF
	 4k76GV+i3w/dQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8CA7380CECB;
	Thu, 29 Jan 2026 16:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] media: Fix G.722 @ 16 kHz codec ID value reported by
 transport
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176970420460.2563498.7347833153547034544.git-patchwork-notify@kernel.org>
Date: Thu, 29 Jan 2026 16:30:04 +0000
References: <20260128103809.2679085-1-arkadiusz.bokowy@gmail.com>
In-Reply-To: <20260128103809.2679085-1-arkadiusz.bokowy@gmail.com>
To: Arkadiusz Bokowy <arkadiusz.bokowy@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-18653-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BAC5BB2344
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 28 Jan 2026 11:38:09 +0100 you wrote:
> The G.722 @ 16 kHz codec ID is 0x01, not 0x02. The 0x02 value comes from
> the ASHA ReadOnlyProperties GATT characteristic which is a bitmask with
> bits corresponding to codec IDs - setting bit 1 gives bitmask value 0x02.
> ---
>  profiles/audio/media.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - media: Fix G.722 @ 16 kHz codec ID value reported by transport
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=ebb33150ba76

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



