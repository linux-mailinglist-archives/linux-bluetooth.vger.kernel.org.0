Return-Path: <linux-bluetooth+bounces-18649-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELxIHS+De2mvFAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18649-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 16:56:31 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA88B1B44
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 16:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EEFD30484F7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Jan 2026 15:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A103191C9;
	Thu, 29 Jan 2026 15:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b="NQ0E3VQl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W6IX52F4"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EED1EA7F4
	for <linux-bluetooth@vger.kernel.org>; Thu, 29 Jan 2026 15:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702057; cv=none; b=OQPGrpw5aXxF28+tBPH8UHpXQew1ulUmXalcGJlFkYGluS9EjGUgjzwRAINge+fYL78x9FPrUznNpc3zbTV3ezr01q69tuAafoW9EUkMVpqh4YnCmQYPnh099W3l4O8WJ0aO42Fh6HGHSBHokgdvB9KIgeTZXIwy1sgtnPZXGiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702057; c=relaxed/simple;
	bh=qnneVwr4RvTvU/NGdwIOJznaRrClNY5nKscZW3nGXWY=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=P/dSCBBO/jgeehssYwWpxeIzX2Ixmit0zxwlsBKlRvZhT0iwizo4V3aPlVXs7/fO3OKqZkanMV5rpV824nEPb3INlCIIZ9+eR+ANoUDNK6FsxVyVAD0giWhCWDuCfI6cNqP25CwRGgHEacMWQ6KoVh6xVhOmMpiremJiu6y/Lz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; spf=pass smtp.mailfrom=arunraghavan.net; dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b=NQ0E3VQl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W6IX52F4; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arunraghavan.net
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 4729F1D00058;
	Thu, 29 Jan 2026 10:54:14 -0500 (EST)
Received: from phl-imap-04 ([10.202.2.82])
  by phl-compute-07.internal (MEProxy); Thu, 29 Jan 2026 10:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm2; t=1769702054; x=1769788454; bh=+DCjW8zm/V5uAmMqAag1y
	gEAweskBnhC5ni7ckW4KfY=; b=NQ0E3VQl8SzF27+1nOMMTTzvKEfOqoSwHXs7c
	AC4uE1KDY/ouNRmP0zuu52jmNy7xtoc2tov2Obd2ONQAEudW7YcxqTsYxf7yE2L3
	4flY6099Coo0n4YULbSoC504otDqV4UBH4pRSPA1XXdI+iL+VEsMj/+J5gUMwf4B
	dkghMDSfq1QNppODeAxLjGg4MakGODtJCZyDQjsC4ASnU1DBRbwkU7q/+W3VYwF8
	OVKn9tK1+Rfrg7kao0aFJwPjhlrE9q7pOLnAba2I7v8Us8UdD30TVf6MtG/FjT8x
	UH8mf6FxUgD274GvDaD9ytG/8oDMMC3W9K1YAmwoGT1VqSnWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1769702054; x=1769788454; bh=+
	DCjW8zm/V5uAmMqAag1ygEAweskBnhC5ni7ckW4KfY=; b=W6IX52F4kiIIyuIIj
	stq9S1CqUzQUbWqlYUV0USBjTVAhZP5Y1UPqoWPFnWnaa+iTmOaY2MzAL2jweSYi
	7TK9Im7P5dm/Pvk+tSvAo5ZZ1vr6yGFX9MpeVbGBurKLjCdjrHUAZ6IMP+N/bsqQ
	xR5gB/6ctCevgwHlrjVDfPWRwlp4Csy2RoHDeoHZi/WQ2JNwIin4/xEfQkt+/u7C
	iqYP3pwvg9c4CExNeI/05HikCLbAFm/1YtTbqXeboLPCnGulpru81miDBoOtrfus
	V9CQ83gZVRR4H9mL3z4I0jzFfciMYKkCiYIsoonohv5L32+nQ/y8FfkLQsQIO/y+
	4J0yA==
X-ME-Sender: <xms:pYJ7acqvqpfFkG0aiuKhUOLUn4bGOxb6tu4IahSYMQ_HzJUBcovPKA>
    <xme:pYJ7adcoYwOxb3_hp5US-CbcJONFwZr2dWw4w9XL8VoS5LSSY6ch_T5MN6q_devsm
    v9LcAWfW6857hzFuVX51YWMQz4RsZlSL4i1Af4G19SOoRadoa5txQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeiiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertd
    ertddtnecuhfhrohhmpedftehruhhnucftrghghhgrvhgrnhdfuceorghruhhnsegrrhhu
    nhhrrghghhgrvhgrnhdrnhgvtheqnecuggftrfgrthhtvghrnhepuefhkeehgfevteejff
    egkeeitdegjeeiudfhueejgffftdehleejieeutdevleehnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghruhhnsegrrhhunhhrrghghhgrvh
    grnhdrnhgvthdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheprghrkhgrughiuhhsiidrsghokhhofiihsehgmhgrihhlrdgtohhmpdhrtghpth
    htoheplhhinhhugidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:pYJ7aXWdiDrfsbwklQGCiYqvHMkowdTRPCKvINNEOnDHDzT302nYuA>
    <xmx:pYJ7adhxWG_vv2jQjVh72hADLJEt9GzFeuuiqhBN0t2X_1ZesFNeSw>
    <xmx:pYJ7aa8G1wuTQxphfDH1ZsGAZNkoMXavvCR4CPJTAcF-XcG46acAyQ>
    <xmx:pYJ7afD9esPcSAtGTCS2GtgJuno97wwCI56kpu5Gjfff_sBQp8jXDQ>
    <xmx:poJ7aS4T3qNgMTnNfFRqWUgdZKgQEpKFk58yPwuBOmyxC05UNX6UOAc1>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D7BE4B6006E; Thu, 29 Jan 2026 10:54:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A3lZZcdkPOtg
Date: Thu, 29 Jan 2026 07:53:52 -0800
From: "Arun Raghavan" <arun@arunraghavan.net>
To: arkadiusz.bokowy@gmail.com, linux-bluetooth@vger.kernel.org
Message-Id: <7d0b3eff-1c65-4c76-bb53-6d61d2a5a06b@app.fastmail.com>
In-Reply-To: <20260129154755.410853-1-arun@arunraghavan.net>
References: <20260128103809.2679085-1-arkadiusz.bokowy@gmail.com>
 <20260129154755.410853-1-arun@arunraghavan.net>
Subject: Re: [PATCH] media: Fix G.722 @ 16 kHz codec ID value reported by transport
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.65 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[arunraghavan.net:s=fm2,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18649-lists,linux-bluetooth=lfdr.de];
	DMARC_NA(0.00)[arunraghavan.net];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[arunraghavan.net:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun@arunraghavan.net,linux-bluetooth@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ECA88B1B44
X-Rspamd-Action: no action

On Thu, 29 Jan 2026, at 7:47 AM, Arun Raghavan wrote:
> The G.722 @ 16 kHz codec ID is 0x01, not 0x02. The 0x02 value comes from
> the ASHA ReadOnlyProperties GATT characteristic which is a bitmask with
> bits corresponding to codec IDs - setting bit 1 gives bitmask value 0x02.
>
> Reviewed-by: Arun Raghavan <arun@arunraghavan.net>
> ---
>  profiles/audio/media.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks like I might have used git send-email wrong here, apologies if that's the case.

-- Arun

