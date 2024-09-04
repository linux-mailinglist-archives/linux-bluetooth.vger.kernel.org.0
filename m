Return-Path: <linux-bluetooth+bounces-7173-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3928E96C1C1
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Sep 2024 17:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D8671C228E3
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Sep 2024 15:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023071DCB01;
	Wed,  4 Sep 2024 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZczRxt4Z"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF821DC723
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Sep 2024 15:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725462466; cv=none; b=WDmBVNkUfuEwfIPeEaPA8ETak/CsxTUe9ZBNCsapOozIA/83z1LeL2HGDQnyeAqh1ooHx2Gf9DHtHq4k9lBuD6zQCa/UT56mMMXF0MduKl5MJhX+UDi17PywHI72i0kxhqNmUWWJc8u9UnVM19e7YOsTRehu4PadJ56zxlNF2LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725462466; c=relaxed/simple;
	bh=btPHVcon9YDMqNYfKwngWcxA0cQhn3eBU0q38HMpFXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OfHJA0xSfua/CrW9m/7dalO+BiTIXhs0iSBpvnSk1kTqjLl89KUJEl5qGwNqMdUvfdMMxfhqFhKpQps7J9yNSe6adcLrvH7yaZqbi6UsCBNORJWzSNBgduyuSf8ME1O5G4s3Uyseq67Wn9QTOMndBRpXB6v0vBmmEyIqMI50JlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZczRxt4Z; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3f07ac2dcso74654721fa.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 Sep 2024 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725462462; x=1726067262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zruJ6SZ514YkU4YtSRS/cKRhklgyaoz5jEj/cbFjhE=;
        b=ZczRxt4Z/l5MdVY9l7/Dok09pglLt/zX+TBqVeKxj+ADYo94Nh5zURCqUlfnymFQgI
         pyFSj4duYCmisdTkdjl5tqFnKeGco/EaIUDrbIBVlLC53pgmfjo899qR08ZYFQ4FCQrc
         8K7/+LSAzSnxHZQdn1yQjTE4cmjJedJiTESgLRm7OAEw4SRVhJv/Mlygv9hAEfbLT++/
         YQZyGLOEy4ze8RB/CeKCVGwkLncHg+GlpcgzlFQXXtdT9cZE894v1ajkhVNq9tTZpq3O
         O2g/FqayiPnDv3M2Ju+jrtAVV1ZODIE3bEyEntBWmr2SF1bujcBvsaagy2cD2zEWjq2/
         Kwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725462462; x=1726067262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zruJ6SZ514YkU4YtSRS/cKRhklgyaoz5jEj/cbFjhE=;
        b=cfuhjo+dS/8ffY6RbfjWStsXAUyqnYP/ORyhIM4PiEAibaOzJtAOsyUQIEujeMjATu
         f03LnBX5256O6EThq6N/Hg8WehyU4KR5gaqeGu0jjQPp5C9S8wOSKUaKnxL4BUx90AAC
         R06ZmKM+CSNmd48g6LgMLjKcFNadNHsHhFpqYLNzRqcQSc1dgy5F8ePzqclGBgxhca95
         lB5N1FfesOEa6tICffHCXYe3xbKME+Y3e0MWCtR7LyvCaBSGIgOXVAMoPZUY3G1Btzyk
         7N2ptTmuhk8R+YQQgMTggnPNrocEMKIgdrROPXu5AY4dd9/jUqLe187oNL9G9YAwIgHm
         iylg==
X-Gm-Message-State: AOJu0Yxc4nXS45yeYzNOroMf8J67ifd34EOE+XDpOtwYAv5WG/cAbAql
	W5g3rZEZyYxqI6JhHx9IRzhmrkksqqaumFsrdcd6RC+yNRKgWX6i/CABdL6pYNTnzU7Ve3sRgPS
	l4UPO6KcsYdrQIH0Tu91rr575MWw=
X-Google-Smtp-Source: AGHT+IFdRf9+X6ELiB5goINEtvBZKt4Szlr1+EeXEM62aCcEQSoI1DYDM7ypvWsH0JFU18v1sgk+XTW/s7/iwPFnJpw=
X-Received: by 2002:a2e:1309:0:b0:2f3:91a1:596f with SMTP id
 38308e7fff4ca-2f6103c847fmr107194641fa.23.1725462461389; Wed, 04 Sep 2024
 08:07:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904140421.283166-1-frederic.danis@collabora.com> <20240904140421.283166-4-frederic.danis@collabora.com>
In-Reply-To: <20240904140421.283166-4-frederic.danis@collabora.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 4 Sep 2024 11:07:05 -0400
Message-ID: <CABBYNZKS501DW21KcjKVEhKV5CkvFdpb256=DQ=y6Xb87km=XA@mail.gmail.com>
Subject: Re: [PATCH BlueZ 3/7] player: Add image handle support property
To: =?UTF-8?B?RnLDqWTDqXJpYyBEYW5pcw==?= <frederic.danis@collabora.com>
Cc: linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fr=C3=A9d=C3=A9ric,

On Wed, Sep 4, 2024 at 10:04=E2=80=AFAM Fr=C3=A9d=C3=A9ric Danis
<frederic.danis@collabora.com> wrote:
>
> This is part of the metadata when the AVRCP target supports covert
> art download and a OBEX BIP session is connected.
> The image handle references the cover art associated to the track,
> and is valid only during OBEX BIP session.
> ---
>  doc/org.bluez.MediaPlayer.rst | 4 ++++
>  monitor/avctp.c               | 3 +++
>  profiles/audio/avrcp.c        | 7 ++++++-
>  profiles/audio/avrcp.h        | 3 ++-
>  tools/parser/avrcp.c          | 3 +++
>  5 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/doc/org.bluez.MediaPlayer.rst b/doc/org.bluez.MediaPlayer.rs=
t
> index f1e999bdf..5bb38e7c2 100644
> --- a/doc/org.bluez.MediaPlayer.rst
> +++ b/doc/org.bluez.MediaPlayer.rst
> @@ -237,6 +237,10 @@ dict Track [readonly]
>
>                 Track duration in milliseconds
>
> +       :string ImgHandle:
> +
> +               Track image handle

I guess we want something more descriptive here, as ThumbnailURL or
something .e.g obex://<handle>, that said I don't know if perhaps we
could load it automatically via plugin.

>  object Device [readonly]
>  ````````````````````````
>
> diff --git a/monitor/avctp.c b/monitor/avctp.c
> index c59e93b20..4da448750 100644
> --- a/monitor/avctp.c
> +++ b/monitor/avctp.c
> @@ -156,6 +156,7 @@
>  #define AVRCP_MEDIA_ATTRIBUTE_TOTAL    0x05
>  #define AVRCP_MEDIA_ATTRIBUTE_GENRE    0x06
>  #define AVRCP_MEDIA_ATTRIBUTE_DURATION 0x07
> +#define AVRCP_MEDIA_ATTRIBUTE_IMG_HANDLE       0x08
>
>  /* play status */
>  #define AVRCP_PLAY_STATUS_STOPPED      0x00
> @@ -582,6 +583,8 @@ static const char *mediattr2str(uint32_t attr)
>                 return "Genre";
>         case AVRCP_MEDIA_ATTRIBUTE_DURATION:
>                 return "Track duration";
> +       case AVRCP_MEDIA_ATTRIBUTE_IMG_HANDLE:
> +               return "Imaging handle";
>         default:
>                 return "Reserved";
>         }
> diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
> index 61558e492..fe24b5a92 100644
> --- a/profiles/audio/avrcp.c
> +++ b/profiles/audio/avrcp.c
> @@ -417,7 +417,8 @@ static sdp_record_t *avrcp_ct_record(bool browsing)
>         uint16_t feat =3D ( AVRCP_FEATURE_CATEGORY_1 |
>                                                 AVRCP_FEATURE_CATEGORY_2 =
|
>                                                 AVRCP_FEATURE_CATEGORY_3 =
|
> -                                               AVRCP_FEATURE_CATEGORY_4)=
;
> +                                               AVRCP_FEATURE_CATEGORY_4 =
|
> +                                               AVRCP_FEATURE_CT_GET_THUM=
BNAIL);
>
>         record =3D sdp_record_alloc();
>         if (!record)
> @@ -883,6 +884,8 @@ static const char *metadata_to_str(uint32_t id)
>                 return "NumberOfTracks";
>         case AVRCP_MEDIA_ATTRIBUTE_DURATION:
>                 return "Duration";
> +       case AVRCP_MEDIA_ATTRIBUTE_IMG_HANDLE:
> +               return "ImgHandle";
>         }
>
>         return NULL;
> @@ -1197,6 +1200,8 @@ static uint32_t str_to_metadata(const char *str)
>                 return AVRCP_MEDIA_ATTRIBUTE_N_TRACKS;
>         else if (strcasecmp(str, "Duration") =3D=3D 0)
>                 return AVRCP_MEDIA_ATTRIBUTE_DURATION;
> +       else if (strcasecmp(str, "ImgHandle") =3D=3D 0)
> +               return AVRCP_MEDIA_ATTRIBUTE_IMG_HANDLE;
>
>         return 0;
>  }
> diff --git a/profiles/audio/avrcp.h b/profiles/audio/avrcp.h
> index dcc580e37..59117e946 100644
> --- a/profiles/audio/avrcp.h
> +++ b/profiles/audio/avrcp.h
> @@ -46,7 +46,8 @@
>  #define AVRCP_MEDIA_ATTRIBUTE_N_TRACKS 0x05
>  #define AVRCP_MEDIA_ATTRIBUTE_GENRE    0x06
>  #define AVRCP_MEDIA_ATTRIBUTE_DURATION 0x07
> -#define AVRCP_MEDIA_ATTRIBUTE_LAST     AVRCP_MEDIA_ATTRIBUTE_DURATION
> +#define AVRCP_MEDIA_ATTRIBUTE_IMG_HANDLE       0x08
> +#define AVRCP_MEDIA_ATTRIBUTE_LAST     AVRCP_MEDIA_ATTRIBUTE_IMG_HANDLE
>
>  /* play status */
>  #define AVRCP_PLAY_STATUS_STOPPED      0x00
> diff --git a/tools/parser/avrcp.c b/tools/parser/avrcp.c
> index e73a6317e..d574c7ee3 100644
> --- a/tools/parser/avrcp.c
> +++ b/tools/parser/avrcp.c
> @@ -160,6 +160,7 @@
>  #define AVRCP_MEDIA_ATTRIBUTE_TOTAL    0x5
>  #define AVRCP_MEDIA_ATTRIBUTE_GENRE    0x6
>  #define AVRCP_MEDIA_ATTRIBUTE_DURATION 0x7
> +#define AVRCP_MEDIA_ATTRIBUTE_IMG_HANDLE       0x08
>
>  /* play status */
>  #define AVRCP_PLAY_STATUS_STOPPED      0x00
> @@ -933,6 +934,8 @@ static const char *mediattr2str(uint32_t attr)
>                 return "Genre";
>         case AVRCP_MEDIA_ATTRIBUTE_DURATION:
>                 return "Track duration";
> +       case AVRCP_MEDIA_ATTRIBUTE_IMG_HANDLE:
> +               return "Imaging handle";
>         default:
>                 return "Reserved";
>         }
> --
> 2.34.1
>
>


--=20
Luiz Augusto von Dentz

