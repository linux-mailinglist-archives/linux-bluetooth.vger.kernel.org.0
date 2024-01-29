Return-Path: <linux-bluetooth+bounces-1446-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C26D8408E6
	for <lists+linux-bluetooth@lfdr.de>; Mon, 29 Jan 2024 15:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63A3EB20DF9
	for <lists+linux-bluetooth@lfdr.de>; Mon, 29 Jan 2024 14:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FD3148316;
	Mon, 29 Jan 2024 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoBXTVAi"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815438F6C
	for <linux-bluetooth@vger.kernel.org>; Mon, 29 Jan 2024 14:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706539740; cv=none; b=Hl6AhPyB2MYmVexfYRabpqZ2kMsvF1ubeGVwHdncjxx6Z57bpl6g6f9cao2nnYST+AjVKQ4bL/2/SQzeOuGuvpRPTXEIR31l763z7xF1wxr5pAMspUQfBYRbZlk2BLo3mQyVMg6YsHNpehTH/PoRzR6XButl1fDJ3oWiOzyhua4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706539740; c=relaxed/simple;
	bh=IIwzTKt5FOc95k5tLHIIt8op3AWIeLxlM/3CZ1yGhes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4siM0TrGZjRiEcnXPAImPfviDWgUD8bUBi06Gp0ry3CgJyB+smYexQYPTmm5mt4224yVncE+iPtlRxjxTBIi0JHUhupWvfmHzExEr6Ec6q3wnbmV30qMaWXx5W8FBiwi86neJ1ZyjOYjNXxfFWqfCVXmFX7E4vQOxey1IMQ90g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoBXTVAi; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-603e7d19725so4687607b3.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 29 Jan 2024 06:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706539738; x=1707144538; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IIwzTKt5FOc95k5tLHIIt8op3AWIeLxlM/3CZ1yGhes=;
        b=CoBXTVAixreqNLCAIU6K/ebo7RZ7d1oP1TtYeeXUg8aMqrawCngf1htAYquSEnLQ+w
         AnctEk2HQPMvqNIwU70fcvZlY+dCSefavxlZcobxlcZIn9Sfvi8dK343DRlcrWIDalW0
         4+0nA0rkBwyHJt/H8UFYpCQcy0C/GCzsWCrCW+nQxST4Vj+OGBB90V7J8Cio1tEDfa7s
         t3ZuGcZ9T6J/F3BYnXl33ZIA/eDTS+Iydz0ay1efsye5DAv8saGacjtYrOTOCMUoPtAR
         shWf1RrWDPJgU0O9YURahhwwEL3+adlFb9IMnBQoCpfXKXYsc/V8VrVNnczchUNYeido
         qLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706539738; x=1707144538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIwzTKt5FOc95k5tLHIIt8op3AWIeLxlM/3CZ1yGhes=;
        b=Xr8uEeWipi+U2vl4r8MV5qN4rczE6PwckAzsEMIZp9EpnQT3KAYIVCqGj5aOXzUbod
         eZVVo7G4CqOas4K7a4BkXRJRymYMTiaoj7xBUHO2mpdJMZq+04sxm/gkXY1K0iUvKBLe
         hTKQlCY+AN42xjVTf1yWbqryzm6TvhkF5IvohyB+rItrhLf3u2bGatQDH4IYCSsshX/N
         a4DDe76kiPnmGcpYyF53TkhC2gIxaxEg2w2UtOAhlB4LtVj3zgPazmZ7zRba2xEbQ1vz
         OxB3rq/Rw3Kxp7ywthExwvCAjYgALxNfNuXNt1dHTZqXdl/lYdQ/3KHTVYO8wHUQB/BE
         b/DQ==
X-Gm-Message-State: AOJu0YxoKXs53ycgx0bk+sBLCTFOGI/2TiJwEOQINnrxsnoXIDt+UHAJ
	8PWK4CBGAZDkVUJzQ7C3VA0SAreE/26xjwYThmX6kuPclNxDYC4Cfb3QTW77QEGyTp7T1zzgFwa
	cP+ENWC+rpYkD1L7u0dpv1+4MMI6u2dHx
X-Google-Smtp-Source: AGHT+IFZTllfHVatcFg/EP8Mqn4RF9R86p8dWDkIqWlGh/hpMwpZmyFNZJ9E1SfhJofvmkG72TYgNO+cIPxmf6eu1sc=
X-Received: by 2002:a81:f901:0:b0:602:a5ef:effa with SMTP id
 x1-20020a81f901000000b00602a5efeffamr5079900ywm.18.1706539738403; Mon, 29 Jan
 2024 06:48:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125-rm-ext-plugins-v3-0-d141f7870bb6@gmail.com>
 <20240125-rm-ext-plugins-v3-2-d141f7870bb6@gmail.com> <CABBYNZKafK6LRauk4RMVeE8PpsazFd75nxSA+a0-v2iHqsYQcQ@mail.gmail.com>
In-Reply-To: <CABBYNZKafK6LRauk4RMVeE8PpsazFd75nxSA+a0-v2iHqsYQcQ@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 29 Jan 2024 14:48:46 +0000
Message-ID: <CACvgo50tsiaLV=8XFSV89r_1DQzdfaTYV6b2e8h7GLoQqkGDUg@mail.gmail.com>
Subject: Re: [PATCH BlueZ v3 2/8] obexd: factor out external plugin support
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Luiz,

On Fri, 26 Jan 2024 at 18:50, Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:>> How about we do something like:

>
> https://gist.github.com/Vudentz/0b8bcb78a8898614fc4848cbf44a0a9f
>
> That way we leave it to the compiler to remove the dead code when
> linking but it still build checks which catches errors such as:
>

Not sure why I did not use that from the start. Considering I've done
similar changes in the kernel :facepalm:

Thanks an updated series is on the list,
-Emil

