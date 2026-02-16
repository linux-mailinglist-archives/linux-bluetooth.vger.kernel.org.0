Return-Path: <linux-bluetooth+bounces-19072-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ2WNHMjk2kX1wEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19072-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Feb 2026 15:02:27 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EAF144614
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Feb 2026 15:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15632303CD31
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Feb 2026 13:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6399D30EF67;
	Mon, 16 Feb 2026 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8nYS48d"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E2830214B
	for <linux-bluetooth@vger.kernel.org>; Mon, 16 Feb 2026 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771250121; cv=none; b=XTwyD3LjRC87w/CgZJAahjuezUOPis+ICtE7EmV2w5JLboMe89LOwQgFu5cexLpBY+DHlINbNAg0z2owKbMZ3nZ9FKnn1ADu/ECrxWHMcVC3XEcUZ/kLCux1gSSPoTn5t3FcUAdv3+LN9C2sBvOcX//5vTC2v73oAtmeKBKsjvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771250121; c=relaxed/simple;
	bh=WuXtutbYXSx1uTXxQ9LkzK4NqHxGja73lK4froANsAw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZYFd4lnHyRVuwEH49Qd7Jlfr55pTtmlxtbIKUXhojcZpy9XzNt44s2N7suW7P4Xlzb05tE9XljcvAOraeS5AaUa6lGkcKhQDa2qVZstoQLm2G3bz05odpU+EbDrH2dPsjmScCXxesH+ZZvlGRXzOsBhkcZ1501bOJz1/RYY6Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8nYS48d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B50DC116C6
	for <linux-bluetooth@vger.kernel.org>; Mon, 16 Feb 2026 13:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771250120;
	bh=WuXtutbYXSx1uTXxQ9LkzK4NqHxGja73lK4froANsAw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=K8nYS48d37wzgf35U6a+33K+B8ArS4lgkTG79/jd5SdXBOD0lnXn3/TpVPEEc5455
	 zMV5IL09aXX5VkysBVP4YsFphe1p1jzYOr0Lm7JMyHa0xkKhpYXo8OyctMFO7Hvbt7
	 DicyNGEm+SL9oXSN9iYKWMEuojqhM8j1rX0j/qlEk4Gvv3Msn76Pzm6y+KNizO9TtL
	 NbjNYvEKPtfVlHi+Ez7Jvtt38v0xNxtQ11fK20k1knftOejRBwhdR7iKfug9NR5LIe
	 Nuu/0rBrvSmZXaez7dCeZch+mvnVABwKp9HEvGF8/nGmRbRLedHS5VBZTyvA23Xfrv
	 ynJF7sRS3adyw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3870c7479c0so24719831fa.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 16 Feb 2026 05:55:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWALMiAc6Z5jp2tfsaScFZ2hl5pAB89bHGOM7cw8dl0Hf/FuBtgGkCbQ6erpgETjf3/+nJBrwosIHQxZ1mP8dM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiaX68lgu3TAMrPweDDQJfE0iJSa8lG776AIC7cEct0CaSbtOs
	bUkeHMwrO/PvDMa9m7tEHDqaftb3DJf7kz5THb5gin3MYepzMpVDx919OyCB86ZAr0f+4RgDrlJ
	m6OMERK04PdaBtjCCpdKC3TH2FCNGFBjEBEZBDmefHw==
X-Received: by 2002:a05:651c:1989:b0:383:f43:ed45 with SMTP id
 38308e7fff4ca-38810576c8dmr34584651fa.30.1771250119305; Mon, 16 Feb 2026
 05:55:19 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 05:55:17 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Feb 2026 05:55:17 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260212141721.69961-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212141721.69961-1-johannes.goede@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 05:55:17 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mff1ui-RcobTuXK1r0Ftbm2ywtUtz7zr2LXb55pv6dtbQ@mail.gmail.com>
X-Gm-Features: AaiRm53DB-Dx51woX6Cd2-P4BBMCPMS2JeoPnyhASV_vRiV_Xz3X0YxDUx8eOM8
Message-ID: <CAMRc=Mff1ui-RcobTuXK1r0Ftbm2ywtUtz7zr2LXb55pv6dtbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Bluetooth: hci_qca: Fix confusing shutdown() and
 power_off() naming
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19072-lists,linux-bluetooth=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 37EAF144614
X-Rspamd-Action: no action

On Thu, 12 Feb 2026 15:17:20 +0100, Hans de Goede
<johannes.goede@oss.qualcomm.com> said:
> The function called qca_power_off() is actually the hci_dev shutdown
> handler, rename it to qca_hci_shutdown() to make this clear.
>
> While the qca_power_shutdown() function is actually the counter-part
> of qca_power_on() rename it to qca_power_off() to make this clear.
>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

