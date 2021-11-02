Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735AD442706
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Nov 2021 07:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhKBGUF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 2 Nov 2021 02:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhKBGUF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 2 Nov 2021 02:20:05 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D3BC061714
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 Nov 2021 23:17:31 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id ay21so15520105uab.12
        for <linux-bluetooth@vger.kernel.org>; Mon, 01 Nov 2021 23:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ke6hiNo7XHR6PYDgJ5iqRU5+cSdYDtmCtmixxUDM878=;
        b=GNkHavLzzjUgpbpUihDFAIjOa1SIkAja/IX1zUXVMvUs9Uk9T8/ij+bHmkKJ451uxQ
         cJy2euWtt4kYe/PIg7HvPNAUjR4gHlruwb9GGcIm33s7aNDTtiWBCdzdKxkJ5UIwEdh5
         92MsWl5heYz4/RKLoirMVitWdltnNROwRSOpyzTMif72KfdME5NnCP1kJQVchHwjNizg
         1JjhySJ5mzaYn4L+VdsbC9Bt8H3dyZuID0l05W39c51kg5184d4spFIMlh/+znfQ3dA1
         EYueleEH58w3mZQ709CJMPGLF0RQlu7H0mllwR6m/Ai9RKtBlj3NJw3iRm7MNDwQuZE/
         R8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ke6hiNo7XHR6PYDgJ5iqRU5+cSdYDtmCtmixxUDM878=;
        b=GiqkupgUebLaw45pZ6/dT4LGliY/2m/EF/2tVMpBr3kvxJdPJcOYw/CoY6kSV654yw
         W+TbqO9jZdA2RkOP46nCSba+gDG2c2Dpa9kBARdiPuxX1x5u5T2VKZlygDnr4GAdkQUE
         n6PJ4SZdg80c6zch4+9S1eXZjxuDqCX/oYPIYy8LjH0g4Vk/Malm8/jqMOB3CqEr8fx1
         s68jOan9vRUhMbQvtU/tTZcFu/RRQt27VBUVz2ndDHtb3/3jAgtuwN+udVW0/0ubgVoe
         Ivqna2v8JRVM+ydbDsY+2axqjIJONo6IkjuiEt3azvRXLjpHaQ7J0uf1HJnUSh146zt5
         eNoA==
X-Gm-Message-State: AOAM530GAZWIbjeSq4svSUVWHjmF3oHZp2qMbkz0t10MxYP5R51sVzYr
        qx5hYEnJuA5Ux93W8zgKvJ/ZBPV3lLyUBqf+6mM=
X-Google-Smtp-Source: ABdhPJxjiez0jDsRXezy4Srq3xkX/WTYGAb+7U3jPNrN+8RZtuhDwtIUG2QtZkgSlepZL3Pt3s8WP+Ww6MlXVpEEz8M=
X-Received: by 2002:ab0:3e3:: with SMTP id 90mr34487778uau.102.1635833850007;
 Mon, 01 Nov 2021 23:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20211101140544.Bluez.1.I515833d2764b8ec2ac2bb1f87313de80ebb497cd@changeid>
In-Reply-To: <20211101140544.Bluez.1.I515833d2764b8ec2ac2bb1f87313de80ebb497cd@changeid>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Mon, 1 Nov 2021 23:17:19 -0700
Message-ID: <CABBYNZJg=Acx_BLyq=RzbkvfWOj-Rik3t7B1Z-XZqemo2LMykQ@mail.gmail.com>
Subject: Re: [Bluez PATCH 1/3] adapter: Use PeripheralLongTermKey to store LTK
To:     Archie Pusaka <apusaka@google.com>
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>,
        Sonny Sasaka <sonnysasaka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Archie,

On Sun, Oct 31, 2021 at 11:06 PM Archie Pusaka <apusaka@google.com> wrote:
>
> From: Archie Pusaka <apusaka@chromium.org>
>
> Introducing PeripheralLongTermKey group for storing LTK info to
> replace the less inclusive term. Currently we still need to write/read
> from both to ensure smooth transition, but later we should deprecate
> the old term.
>
> Reviewed-by: Sonny Sasaka <sonnysasaka@chromium.org>
> ---
>
>  src/adapter.c | 41 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 9 deletions(-)
>
> diff --git a/src/adapter.c b/src/adapter.c
> index d0d38621b8..6b12c9e793 100644
> --- a/src/adapter.c
> +++ b/src/adapter.c
> @@ -3868,7 +3868,11 @@ static struct smp_ltk_info *get_peripheral_ltk_info(GKeyFile *key_file,
>
>         DBG("%s", peer);
>
> -       ltk = get_ltk(key_file, peer, bdaddr_type, "SlaveLongTermKey");
> +       /* Read from both entries. Later we should deprecate Slave. */
> +       ltk = get_ltk(key_file, peer, bdaddr_type, "PeripheralLongTermKey");
> +       if (!ltk)
> +               ltk = get_ltk(key_file, peer, bdaddr_type, "SlaveLongTermKey");

If you find the old name being used you better replace it with the new
one and erase the old.

>         if (ltk)
>                 ltk->central = false;
>
> @@ -8415,13 +8419,12 @@ static void new_link_key_callback(uint16_t index, uint16_t length,
>         bonding_complete(adapter, &addr->bdaddr, addr->type, 0);
>  }
>
> -static void store_longtermkey(struct btd_adapter *adapter, const bdaddr_t *peer,
> +static void store_ltk_group(struct btd_adapter *adapter, const bdaddr_t *peer,
>                                 uint8_t bdaddr_type, const unsigned char *key,
> -                               uint8_t central, uint8_t authenticated,
> +                               const char *group, uint8_t authenticated,
>                                 uint8_t enc_size, uint16_t ediv,
>                                 uint64_t rand)
>  {
> -       const char *group = central ? "LongTermKey" : "SlaveLongTermKey";
>         char device_addr[18];
>         char filename[PATH_MAX];
>         GKeyFile *key_file;
> @@ -8431,11 +8434,6 @@ static void store_longtermkey(struct btd_adapter *adapter, const bdaddr_t *peer,
>         char *str;
>         int i;
>
> -       if (central != 0x00 && central != 0x01) {
> -               error("Unsupported LTK type %u", central);
> -               return;
> -       }
> -
>         ba2str(peer, device_addr);
>
>         snprintf(filename, PATH_MAX, STORAGEDIR "/%s/%s/info",
> @@ -8475,6 +8473,31 @@ static void store_longtermkey(struct btd_adapter *adapter, const bdaddr_t *peer,
>         g_key_file_free(key_file);
>  }
>
> +static void store_longtermkey(struct btd_adapter *adapter, const bdaddr_t *peer,
> +                               uint8_t bdaddr_type, const unsigned char *key,
> +                               uint8_t central, uint8_t authenticated,
> +                               uint8_t enc_size, uint16_t ediv,
> +                               uint64_t rand)
> +{
> +       if (central != 0x00 && central != 0x01) {
> +               error("Unsupported LTK type %u", central);
> +               return;
> +       }
> +
> +       if (central) {
> +               store_ltk_group(adapter, peer, bdaddr_type, key, "LongTermKey",
> +                               authenticated, enc_size, ediv, rand);
> +       } else {
> +               /* Store duplicates for now. Later we should deprecate Slave. */
> +               store_ltk_group(adapter, peer, bdaddr_type, key,
> +                               "PeripheralLongTermKey", authenticated,
> +                               enc_size, ediv, rand);
> +               store_ltk_group(adapter, peer, bdaddr_type, key,
> +                               "SlaveLongTermKey", authenticated,
> +                               enc_size, ediv, rand);

In not following why you want to keep duplicate entries?

> +       }
> +}
> +
>  static void new_long_term_key_callback(uint16_t index, uint16_t length,
>                                         const void *param, void *user_data)
>  {
> --
> 2.33.1.1089.g2158813163f-goog
>


-- 
Luiz Augusto von Dentz
