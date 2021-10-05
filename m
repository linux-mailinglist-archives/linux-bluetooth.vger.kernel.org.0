Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9902942301A
	for <lists+linux-bluetooth@lfdr.de>; Tue,  5 Oct 2021 20:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhJESjX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Oct 2021 14:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhJESjW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Oct 2021 14:39:22 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086CCC061749
        for <linux-bluetooth@vger.kernel.org>; Tue,  5 Oct 2021 11:37:32 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id 66so215521vsd.11
        for <linux-bluetooth@vger.kernel.org>; Tue, 05 Oct 2021 11:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iv8nTXwDU1huZ5neGkm+Wa67tcLze/OPorFaOqSl9hc=;
        b=mSaQNwVbmqueVlcV8N4pMjm+TuV98vt34Zd24EVmNj4DeFs0LCxPrWioaKvLQhr1MQ
         hyYfqWdwmBYKzB6qIO0vw2RmJCZWadRANFdFJZL8h3IVcqJDlnuZl8VcYWPYY0Ql1rJX
         BT3K8qIF6spRUhAsKEaXToGiw3IAr/NAYrxBS7Uq+NHLxtzatWWxNFVM7tt43OVIv3h/
         XKgsJv5EFxj69N8SuU9U391cDOw7qnt1fK2qNhil1jJJQec1pGxt4e6pD9ZORBJVQK3I
         K2sDKEW4r8E07LxO5Yhf7qqurU/PjHWLF1gTHGkpNjZPokQZOoZQB4q56djAt2XedSG9
         Gqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iv8nTXwDU1huZ5neGkm+Wa67tcLze/OPorFaOqSl9hc=;
        b=NhwxzpnavcYzidn8Kv5p/qyf2j+bZb9t+l7Z3kPrPy+gl9a4EZyP3OGn4qtCvVDpjo
         zNTaFEjocO9Ro/9IYgfW5RkGBdUHLKWN2GOMCYH35sH2qCEln+cx/B7ngwuaFVVxKyam
         rQxy8Hd0YAF+sctszTv+GpB30lmNVSSJCa4+2yivLlZKg7OMeag+nvI41W9SBg6PNvA8
         Ps2ZOMJyiIW5Fj9PNvGNpoM2kBJQThFNaM3VVLJQVK1FqIaSv9/c+G3uXBWxESZhJECc
         EroHSuf6Kegd8aMmMD6dPJTTXkDk0NAc1KcTqz/fRl6THJBICaAoZWm0hZ6/8HXCkpeh
         Mqnw==
X-Gm-Message-State: AOAM530MH98Ce9zK92XeYdJZcnkhkdGs6Iy0DYW0ElnMl+VMV0cI6DzU
        qiGWPsA56x7vmfOQAdYcUtsNJGsP+mcOwZlKOYQ=
X-Google-Smtp-Source: ABdhPJyBm2zAkDfgdBnG7nhA+9vugD9Zh2I7qyHRTl48kXyM/I7H9eC4ykpFgP5sNpw6eBIXhigGd2N5jfZOwtoAsK4=
X-Received: by 2002:a67:d289:: with SMTP id z9mr11602530vsi.39.1633459051025;
 Tue, 05 Oct 2021 11:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+6+gU=AEHhnEwVq=RyOKemRjZM_zHLmCZKkGO+aUKCaaQVOhA@mail.gmail.com>
In-Reply-To: <CA+6+gU=AEHhnEwVq=RyOKemRjZM_zHLmCZKkGO+aUKCaaQVOhA@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Tue, 5 Oct 2021 11:37:20 -0700
Message-ID: <CABBYNZLps0q-UzEffiQeLvHGyZ4iiiwJ-CaBe__8LMi=7P+xNQ@mail.gmail.com>
Subject: Re: Null dereference in profiles/audio/avrcp.c
To:     Thomas Eriksson <thomas.eriksson@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Thomas,

On Tue, Oct 5, 2021 at 1:55 AM Thomas Eriksson
<thomas.eriksson@gmail.com> wrote:
>
> Hi,
>
> When trying to pair my "3M Peltor WS Alert XPI" headset with Bluez i
> get a null dereference in profiles/audio/avrcp.c.
>
> The following small patch avoids the problem:
>
> diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
> index 7c280203c..6064ab40b 100644
> --- a/profiles/audio/avrcp.c
> +++ b/profiles/audio/avrcp.c
> @@ -3740,10 +3740,13 @@ static void avrcp_status_changed(struct avrcp *session,
>                                                 struct avrcp_header *pdu)
>  {
>         struct avrcp_player *player = session->controller->player;
> -       struct media_player *mp = player->user_data;
> +       struct media_player *mp = NULL;
>         uint8_t value;
>         const char *curval, *strval;
>
> +       if (player == NULL)
> +               return;
> +       mp = player->user_data;
>         value = pdu->params[1];
>
>         curval = media_player_get_status(mp);
>

What version are you using? This should not be reproducible with:

commit cc235a8d528b36cad2cf9fe6517d54711613331a
Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Date:   Fri Apr 1 11:07:15 2016 +0300

    audio/avrcp: Fix registering to player events

    If controller does not have a player skip registering to events which
    requires a player.

diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
index 0c6279a20..37bc29137 100644
--- a/profiles/audio/avrcp.c
+++ b/profiles/audio/avrcp.c
@@ -3647,8 +3647,9 @@ static gboolean
avrcp_get_capabilities_resp(struct avctp *conn,
                case AVRCP_EVENT_ADDRESSED_PLAYER_CHANGED:
                case AVRCP_EVENT_UIDS_CHANGED:
                case AVRCP_EVENT_AVAILABLE_PLAYERS_CHANGED:
-                       /* These events above are controller specific */
-                       if (!session->controller)
+                       /* These events above requires a player */
+                       if (!session->controller ||
+                                               !session->controller->player)
                                break;
                case AVRCP_EVENT_VOLUME_CHANGED:
                        avrcp_register_notification(session, event);

>
> Below is the backtrace from GDB:
>
> GNU gdb (Debian 10.1-2) 10.1.90.20210103-git
> Copyright (C) 2021 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.
> Type "show copying" and "show warranty" for details.
> This GDB was configured as "x86_64-linux-gnu".
> Type "show configuration" for configuration details.
> For bug reporting instructions, please see:
> <https://www.gnu.org/software/gdb/bugs/>.
> Find the GDB manual and other documentation resources online at:
>     <http://www.gnu.org/software/gdb/documentation/>.
>
> For help, type "help".
> Type "apropos word" to search for commands related to "word"...
> Reading symbols from /usr/local/libexec/bluetooth/bluetoothd...
> (gdb) run
> Starting program: /usr/local/libexec/bluetooth/bluetoothd
> [Thread debugging using libthread_db enabled]
> Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
>
>
>
> Program received signal SIGSEGV, Segmentation fault.
> 0x0000555555594f14 in avrcp_status_changed (pdu=0x5555556d1b36,
> pdu=0x5555556d1b36, session=0x5555556a9800) at
> profiles/audio/avrcp.c:3743
> 3743 struct media_player *mp = player->user_data;
> (gdb)
> (gdb)
> (gdb) bt
> #0  0x0000555555594f14 in avrcp_status_changed (pdu=0x5555556d1b36,
> pdu=0x5555556d1b36, session=0x5555556a9800) at
> profiles/audio/avrcp.c:3743
> #1  avrcp_handle_event (conn=0x5555556c98e0, code=15 '\017',
> subunit=<optimized out>, transaction=<optimized out>,
> operands=0x5555556d1b36 "", operand_count=9, user_data=0x5555556a9800)
>     at profiles/audio/avrcp.c:3884
> #2  0x000055555558f3c7 in control_response (operand_count=9,
> operands=0x5555556d1b36 "", avc=<optimized out>, avctp=<optimized
> out>, control=<optimized out>) at profiles/audio/avctp.c:938
> #3  session_cb (chan=<optimized out>, cond=<optimized out>,
> data=<optimized out>) at profiles/audio/avctp.c:1107
> #4  0x00007ffff7ebdc0f in g_main_context_dispatch () from
> /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
> #5  0x00007ffff7ebdfb8 in ?? () from /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
> #6  0x00007ffff7ebe2ab in g_main_loop_run () from
> /usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
> #7  0x0000555555617415 in mainloop_run () at src/shared/mainloop-glib.c:66
> #8  0x00005555556177f2 in mainloop_run_with_signal
> (func=func@entry=0x5555555af8d0 <signal_callback>,
> user_data=user_data@entry=0x0) at src/shared/mainloop-notify.c:188
> #9  0x0000555555577147 in main (argc=<optimized out>, argv=<optimized
> out>) at src/main.c:1210
>
>
> Best regards
> /Thomas Eriksson



-- 
Luiz Augusto von Dentz
