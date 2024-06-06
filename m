Return-Path: <linux-bluetooth+bounces-5191-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 799178FF6A7
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Jun 2024 23:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05178B25B24
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Jun 2024 21:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121FD19753B;
	Thu,  6 Jun 2024 21:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nzp9e4aW"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7341DFD1;
	Thu,  6 Jun 2024 21:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717709007; cv=none; b=hIKUk6Qa8PcOrwG0iYu1c1Cu6g2mzVIcdAmkyp0P2S8+P1G+Ur+dXP7VaI+/qPqPNqPmCqLjUgwUKk5WGmj7czUnJLBs7K0rhAEVreXvl6xsn0+IAS6QU0ygDUANItvoEKFNAy0JQ/i4qD/Whr9Uh4UHVPFvxp2eWNLsZG6wPKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717709007; c=relaxed/simple;
	bh=18ErmTQ+WGncl+Pa0OIgOMyrs4urCsczi4HxtdcrsRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flK/rvvjm7iWotP/Yhhlb2ALXpH7WrukyNb63g38L92h44h9VagqX6B92qk0KVATXkLQ6np5PoXiDwdG+UpgKgsDGAliOezUXK9h+rRQWgBNHTp9zN8D2jZSzbsQhln+FIVCg8+r0/LSYx/GK9MyRIz99onSap+LsIBY0LLOLdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nzp9e4aW; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eab19e7034so23284141fa.0;
        Thu, 06 Jun 2024 14:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717709004; x=1718313804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18ErmTQ+WGncl+Pa0OIgOMyrs4urCsczi4HxtdcrsRU=;
        b=Nzp9e4aWVJ6OGPC7/Rv90fZ1IeTfB20ysO9DWi4FA4Rv+jVFf4qdxRYtCsNFamPti7
         rywlm/Id2AbvczOCTNFh1u9Q3aXjpxB3cqrZAuZI/93gRWrUg5iKgpvZEN7BRY8CCZFI
         Gc++LBrEoAvtgmdS8RVw9DFlhJAA9fi8lI7x8rwMXNWVIbHufxGM0j6eugaiYD9xT3wK
         oR+tnYnfQJrWEBpbzcxy7riq6XrZTkf4j9vHyFvF+/+ed7Tq4acDf7He5d1TxJ86vhjX
         SYw5PQCbcYg6QohDZq/UOcDtToRk/mBPwe2kaHxjlnXhnE47n21LlLgJx3wNfe9aLflp
         5f+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717709004; x=1718313804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18ErmTQ+WGncl+Pa0OIgOMyrs4urCsczi4HxtdcrsRU=;
        b=lRI3BfZVZcS4pgB9Jh8X4rnWCkKL0uTGseezNVLHDujaunBpejKNqPx2LYHwVIHAQv
         dqMbz4HHJIjssDZaggN9JegtFHYO+y6n/DZP3coIpJ82cyIQaTP/T1vOG6AXZPVPV+fx
         /F8PowvjWmvH+MEzaUjzBxlxsSjcO++MMs3TF2c2/jnJNegvZempzAUY5+NFbcksWJiY
         cxXTLc3N/Pu60nnAj6B/4OV6N099lMKs9/AQgupg7LT6pCKf/59+dvIpO8jbOyhAqIcv
         QVxtQ6zXOgqsQHtO9USMhb5WwnSpR9UxTqAuFXJlpplowM/6CLUHsEjNCbrnZiGmtp0Y
         jZoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZVG/KuhUNaoMprI5UnlLsaz+rt0/xtO8N3qRTjsScK1ICp6o9s7PXXeZP94KbIfeXO/TdiY/x89w6oCVwCq74wNvmN5evkeZIZjnLKFc7
X-Gm-Message-State: AOJu0YwU32pFAE5jd5vqZmYCCYEBUsIuHrUopDQtiFwmoxM/ZqlACvQ+
	fYDZJiRZOToD9dSbQJR26Gk4QZPoeMez6yGumh4NIJV9L/B6kJfL/Bj6DSPIFaYQVYfzoAokRws
	aDXL3LAU8ccpSgshfOR6GaENGN6A=
X-Google-Smtp-Source: AGHT+IG2uNcusRrlYiy5pSN/MoSZfc+1gv2u2voDfSUD2LA4yyPyxkGk9q2e9tLZT7lM4NLeRsHMKiBiDHCj2x0EHXw=
X-Received: by 2002:a2e:9e4a:0:b0:2e3:331e:e33d with SMTP id
 38308e7fff4ca-2ead00b8920mr10688881fa.11.1717709003796; Thu, 06 Jun 2024
 14:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGew7BttU+g40uRnSCN5XmbXs1KX1ZBbz+xyXC_nw5p4dR2dGA@mail.gmail.com>
In-Reply-To: <CAGew7BttU+g40uRnSCN5XmbXs1KX1ZBbz+xyXC_nw5p4dR2dGA@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 6 Jun 2024 17:23:11 -0400
Message-ID: <CABBYNZLE9uYiRM-baoBt=RQktq__TguMETgmVWGzfeorARfm4w@mail.gmail.com>
Subject: Re: Bluetooth Kernel Bug: After connecting either HFP/HSP or A2DP is
 not available (Regression in 6.9.3, 6.8.12)
To: =?UTF-8?Q?Timo_Schr=C3=B6der?= <der.timosch@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	linux-bluetooth@vger.kernel.org, luiz.von.dentz@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Timo,

On Thu, Jun 6, 2024 at 4:46=E2=80=AFPM Timo Schr=C3=B6der <der.timosch@gmai=
l.com> wrote:
>
> Hallo,
> on my two notebooks, one with Ubuntu (Mainline Kernel 6.9.3, bluez
> 5.7.2) and the other one with Manjaro (6.9.3, bluez 5.7.6) I'm having
> problems with my Sony WH-1000XM3 and Shure BT1. Either A2DP or HFP/HSP
> is not available after the connection has been established after a
> reboot or a reconnection. It's reproducible that with the WH-1000XM3
> the A2DP profiles are missing and with the Shure BT1 HFP/HSP profiles
> are missing. It also takes longer than usual to connect and I have a
> log message in the journal:
>
> Jun 06 16:28:10 liebig bluetoothd[854]:
> profiles/audio/avdtp.c:cancel_request() Discover: Connection timed out
> (110)
>
> When I disable and re-enable bluetooth (while the Headsets are still
> on) and trigger a reconnect from the notebooks, A2DP and HFP/HSP
> Profiles are available again.
>
> I also tested it with 6.8.12 and it's the same problem. 6.8.11 and
> 6.9.2 don't have the problem.
> So I did a bisection. After reverting commit
> af1d425b6dc67cd67809f835dd7afb6be4d43e03 "Bluetooth: HCI: Remove
> HCI_AMP support" for 6.9.3 it's working again without problems.
>
> Let me know if you need anything from me.

Wait what, that patch has nothing to do with any of these profiles not
really sure how that would cause a regression really, are you sure you
don't have actual connection timeout happening at the link layer and
that by some chance didn't happen when running with HCI_AMP reverted?

I'd be surprised that HCI_AMP has any effect in most controllers
anyway, only virtual controllers was using that afaik.


--=20
Luiz Augusto von Dentz

