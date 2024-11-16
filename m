Return-Path: <linux-bluetooth+bounces-8750-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 016F59CFDD5
	for <lists+linux-bluetooth@lfdr.de>; Sat, 16 Nov 2024 11:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85F6B1F2688A
	for <lists+linux-bluetooth@lfdr.de>; Sat, 16 Nov 2024 10:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A14197A67;
	Sat, 16 Nov 2024 10:11:02 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0FF192B77;
	Sat, 16 Nov 2024 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731751862; cv=none; b=byE3vDuZxG/AvnPfZLsBAxnDm3kx2SlaMcJwMfyNAMCsvXxHjkOL5cCJVLG2hROiNmJNMgSk1SUrOsP1RkMIQmxAVpp+UoFItGE2NkeAOXTpjuLKYQ/EPR5wvPQEU3OSa1v8lkKzLmLhjV44hN0fQKHA0pKPI8qzC6UHP4D60CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731751862; c=relaxed/simple;
	bh=xksNnw+gkMp5XjS+cpaBCLtGghYgnvoCGMV+G6vSmdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWc/gT0u7Bs5Qm46shG5suhjdrgILtCz/Cq3O0jsUZdz21wIx3koDtbdXkWDLEXMUJwVcVa7J1vv1134UNYAAnQaek/hv13k4BvgRubzVHZnt+e2tuzs65G/VY74ub3xz+exSuAYjDwtpUnVixKBYlenipZfVbW8AqHuhDeod14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Xr8mL1R16z9sSd;
	Sat, 16 Nov 2024 11:10:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sS8O0LnxtKc7; Sat, 16 Nov 2024 11:10:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xr8mJ5rw4z9sSb;
	Sat, 16 Nov 2024 11:10:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ABE338B7A0;
	Sat, 16 Nov 2024 11:10:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id F1qWTVabQRIL; Sat, 16 Nov 2024 11:10:56 +0100 (CET)
Received: from [192.168.232.159] (POS169858.IDSI0.si.c-s.fr [192.168.232.159])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 35D3D8B763;
	Sat, 16 Nov 2024 11:10:53 +0100 (CET)
Message-ID: <718febc4-59ee-4701-ad62-8b7a8fa7a910@csgroup.eu>
Date: Sat, 16 Nov 2024 11:10:52 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/21] livepatch: Convert timeouts to secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann
 <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-19-911fb7595e79@linux.microsoft.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-19-911fb7595e79@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
> [Vous ne recevez pas souvent de courriers de eahariha@linux.microsoft.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Changes made with the following Coccinelle rules:
> 
> @@ constant C; @@
> 
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
> 
> @@ constant C; @@
> 
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)
> 
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>   samples/livepatch/livepatch-callbacks-busymod.c |  2 +-
>   samples/livepatch/livepatch-shadow-fix1.c       |  2 +-
>   samples/livepatch/livepatch-shadow-mod.c        | 10 +++++-----
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/samples/livepatch/livepatch-callbacks-busymod.c b/samples/livepatch/livepatch-callbacks-busymod.c
> index 378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993badcc9aba 100644
> --- a/samples/livepatch/livepatch-callbacks-busymod.c
> +++ b/samples/livepatch/livepatch-callbacks-busymod.c
> @@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
>   {
>          pr_info("%s\n", __func__);
>          schedule_delayed_work(&work,
> -               msecs_to_jiffies(1000 * 0));
> +               secs_to_jiffies(0));

Using secs_to_jiffies() is pointless, 0 is universal, should become 
schedule_delayed_work(&work, 0);

>          return 0;
>   }
> 
> diff --git a/samples/livepatch/livepatch-shadow-fix1.c b/samples/livepatch/livepatch-shadow-fix1.c
> index 6701641bf12d454a770e49abeeb0dea92560e55e..948ea1f5760fed2fa27baf478c97cf98ad5c99a8 100644
> --- a/samples/livepatch/livepatch-shadow-fix1.c
> +++ b/samples/livepatch/livepatch-shadow-fix1.c
> @@ -73,7 +73,7 @@ static struct dummy *livepatch_fix1_dummy_alloc(void)
>                  return NULL;
> 
>          d->jiffies_expire = jiffies +
> -               msecs_to_jiffies(1000 * EXPIRE_PERIOD);
> +               secs_to_jiffies(EXPIRE_PERIOD);
> 
>          /*
>           * Patch: save the extra memory location into a SV_LEAK shadow
> diff --git a/samples/livepatch/livepatch-shadow-mod.c b/samples/livepatch/livepatch-shadow-mod.c
> index 7e753b0d2fa611524c9e2adbe02c8fa3e9b6015e..79296e6ccb119f521e86a121623855d841c9fc5e 100644
> --- a/samples/livepatch/livepatch-shadow-mod.c
> +++ b/samples/livepatch/livepatch-shadow-mod.c
> @@ -102,7 +102,7 @@ static __used noinline struct dummy *dummy_alloc(void)
>                  return NULL;
> 
>          d->jiffies_expire = jiffies +
> -               msecs_to_jiffies(1000 * EXPIRE_PERIOD);
> +               secs_to_jiffies(EXPIRE_PERIOD);

Should fit on a single line, avoid multiple lines when possible.

> 
>          /* Oops, forgot to save leak! */
>          leak = kzalloc(sizeof(*leak), GFP_KERNEL);
> @@ -153,7 +153,7 @@ static void alloc_work_func(struct work_struct *work)
>          mutex_unlock(&dummy_list_mutex);
> 
>          schedule_delayed_work(&alloc_dwork,
> -               msecs_to_jiffies(1000 * ALLOC_PERIOD));
> +               secs_to_jiffies(ALLOC_PERIOD));

Should fit on a single line, avoid multiple lines when possible.


>   }
> 
>   /*
> @@ -185,15 +185,15 @@ static void cleanup_work_func(struct work_struct *work)
>          mutex_unlock(&dummy_list_mutex);
> 
>          schedule_delayed_work(&cleanup_dwork,
> -               msecs_to_jiffies(1000 * CLEANUP_PERIOD));
> +               secs_to_jiffies(CLEANUP_PERIOD));

Should fit on a single line, avoid multiple lines when possible.


>   }
> 
>   static int livepatch_shadow_mod_init(void)
>   {
>          schedule_delayed_work(&alloc_dwork,
> -               msecs_to_jiffies(1000 * ALLOC_PERIOD));
> +               secs_to_jiffies(ALLOC_PERIOD));

Should fit on a single line, avoid multiple lines when possible.


>          schedule_delayed_work(&cleanup_dwork,
> -               msecs_to_jiffies(1000 * CLEANUP_PERIOD));
> +               secs_to_jiffies(CLEANUP_PERIOD));

Should fit on a single line, avoid multiple lines when possible.


> 
>          return 0;
>   }
> 
> --
> 2.34.1
> 

