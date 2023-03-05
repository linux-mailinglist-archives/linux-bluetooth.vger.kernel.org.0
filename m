Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 352E26AB2F6
	for <lists+linux-bluetooth@lfdr.de>; Sun,  5 Mar 2023 23:27:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjCEW1c (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 5 Mar 2023 17:27:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCEW1b (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 5 Mar 2023 17:27:31 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8451206C
        for <linux-bluetooth@vger.kernel.org>; Sun,  5 Mar 2023 14:27:26 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id f16so7789452ljq.10
        for <linux-bluetooth@vger.kernel.org>; Sun, 05 Mar 2023 14:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkXZEaU+4xNMRPDtwcQLiePPBcGOkLPh4JyLf9FvAqM=;
        b=lvqeK+jzYPKAzhqEFj1HxKscemVO0tsXzKad7zNuBwv3k5HzIGwEjO50ERpTpNbjVi
         PcIYVOTPfyBEDnoEy0lUO5A6dPpDt1y72onp9eEKyLn8GhdJ0Ifjz5eSPJec30NhekZE
         Z51VC/mtQIbOprKUiYKfd0rKo6oCuomAHSHC41E+dCbhAbAYafwsGnJU1qguPT4Sj/A+
         J7/+bBiQ+eM5wph9l8vZYXBs5/yk7D1LOfsmUNA6aFTKWVEKETkCSXapWsT5DCeohdpu
         6BnbQvAnUW3PlQpmdtovi/w8TDuaCTgFNQrCVFBnn8YLzRZDb7oE9T04G8LEkAzaBKo4
         kFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkXZEaU+4xNMRPDtwcQLiePPBcGOkLPh4JyLf9FvAqM=;
        b=xpJcZH2LhN1O6ydVyvLkF13Bl3VH05N35BtfVCGGvmAw2LZJSA4WzEPYyj+L3VH5Yu
         ew6KAz291v0Qtu63r8aroYB4+/CD+eXKf2pz+D3wJfNzAUicagc/0BxgdNiVp1Hmpymy
         y+c3Ty7jlGGCfyP1qH5nc9AFmAuK/GEQ0RJN2db/uNmeHPiR0nrbxZhIqQV4+t2gIYH/
         W8ulpUnph+5KhMXrfeblcodQiBDjd8nXhxGb3ixBttJ/aFMOZpR2jPqddU25HxnpYKo8
         SYZqVlnSiUik0Xi1bMI8ocCNnDL1ulAXHsdvNtxh81VpkPKSFHHCJvYMp37tXIMmroFg
         N7NQ==
X-Gm-Message-State: AO0yUKXBDqXbMsTR4y9bmyVfk4w65J2k7Wzzt17q3tcnEO6wH1IKP5iC
        8INmaC91QxPdbR23LmrNqLa5umG+DhBTeRvLN3gxNwtK
X-Google-Smtp-Source: AK7set/vgTLN+HW1ZjfvjhDVWl7rfiCAAGTOef1tHcecy7tj18GmZA/Xhoz9trXa4Y77VOVb5EWb6QECoJlCuzb2dEc=
X-Received: by 2002:a2e:b990:0:b0:295:b96e:caa6 with SMTP id
 p16-20020a2eb990000000b00295b96ecaa6mr2519943ljp.9.1678055244357; Sun, 05 Mar
 2023 14:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20230303012742.1386291-1-luiz.dentz@gmail.com>
 <20230303012742.1386291-4-luiz.dentz@gmail.com> <e4082fe64bd4a3cec69a26f7d5b54a366e60d775.camel@iki.fi>
In-Reply-To: <e4082fe64bd4a3cec69a26f7d5b54a366e60d775.camel@iki.fi>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Sun, 5 Mar 2023 14:27:09 -0800
Message-ID: <CABBYNZKGy2PctpVpxK-Hj+6tO8pv8rgPVGS9o331=Tm97w=KsQ@mail.gmail.com>
Subject: Re: [RFC 4/9] core: Add initial implementation of DeviceSet interface
To:     Pauli Virtanen <pav@iki.fi>
Cc:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Pauli,

On Sun, Mar 5, 2023 at 1:57=E2=80=AFPM Pauli Virtanen <pav@iki.fi> wrote:
>
> Hi,
>
> to, 2023-03-02 kello 17:27 -0800, Luiz Augusto von Dentz kirjoitti:
> > From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> >
> > This adds the initial implementation of DeviceSet interface as
> > documented in doc/set-api.rst.
>
> Tried this with Samsung Galaxy Buds2 Pro, things mostly seems to work.
> When pairing, it asks to pair also the other earbud, and when
> connecting one it usually also connects the other one.
>
> On DBus, the deviceset appears correctly.
>
> I think on some of the attempts the pairing/connecting of the other set
> device did not work properly, but I don't have good information on this
> right now and nothing reproducible, will need to test again so just
> quick impressions now.
>
> (Right now I'm not able to play audio to both earbuds at the same time.
> This is unrelated to this patchset, and probably known issue similar to
> multiple CIS to same device. What seems to be happening is the same
> that there is a successful "LE Set Connected Isochronous Group
> Parameters" creating two connection handles but no following "LE Create
> Connected Isochronous Stream" so connect timeouts.)
>
> On one attempt, the other device auto-paired, bluetoothctl asked
> "Accept pairing" and the device appeared in "bluetoothctl devices".
> Trying to connect to it in bluetoothctl after that caused it to not
> connect successfully (just "Attempting to connect to ...") but reason
> was unclear.
>
> The device uses the random address scheme where the address changes on
> pairing. When I connected the device the first time, I see
>
> [Galaxy Buds2 Pro]# endpoint.list
> Endpoint /org/bluez/hci1/dev_69_1E_A2_F9_2D_6B/pac_source0
> Endpoint /org/bluez/hci1/dev_69_1E_A2_F9_2D_6B/pac_sink0
> Endpoint /org/bluez/hci1/dev_63_BD_D1_39_E8_75/pac_source0
> Endpoint /org/bluez/hci1/dev_63_BD_D1_39_E8_75/pac_sink0

We cant change the path since that object is how we do pairing and
other stuff and it gets exposed to plugins, so it is normal that it
would stay using the random address until you restart the daemon.

> which shows the random addresses. Sometimes the device and endpoint
> names get the resolved address, but this does not alway happen.
> Sometimes only of the devices gets the resolved in the names.
>
> Sometimes after pairing, in bluetoothctl I see three devices, one of
> them the old random address of one of the two other devices. Sometimes
> it's three devices with one of the addresses listed twice.

Yeah, I seem this as well, I think it might be a bug in bluetoothctl though=
.

> A few ASAN crashes:
>
> While connecting device:
>
> bluetoothd[29776]: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> bluetoothd[29776]: =3D=3D29776=3D=3DERROR: AddressSanitizer: heap-use-aft=
er-free on address 0x6170000001f0 at pc 0x000000670565 bp 0x7ffca7750f50 sp=
 0x7ffca7750f48
> bluetoothd[29776]: READ of size 8 at 0x6170000001f0 thread T0
> bluetoothd[29776]:     #0 0x670564 in device_connect_le src/device.c:5526
> bluetoothd[29776]:     #1 0x69f457 in set_connect_next src/set.c:237
> bluetoothd[29776]:     #2 0x69f7d9 in set_add src/set.c:257
> bluetoothd[29776]:     #3 0x69fdcf in btd_set_add_device src/set.c:319
> bluetoothd[29776]:     #4 0x64dcc0 in btd_device_add_set src/device.c:186=
0
> bluetoothd[29776]:     #5 0x521c2f in csip_ready profiles/audio/csip.c:26=
4
> bluetoothd[29776]:     #6 0x7d389e in csip_notify_ready src/shared/csip.c=
:578
> bluetoothd[29776]:     #7 0x7d43b6 in csip_idle src/shared/csip.c:659
> bluetoothd[29776]:     #8 0x7437d1 in idle_notify src/shared/gatt-client.=
c:171
> bluetoothd[29776]:     #9 0x713c7b in queue_remove_if src/shared/queue.c:=
279
> bluetoothd[29776]:     #10 0x7142af in queue_remove_all src/shared/queue.=
c:321
> bluetoothd[29776]:     #11 0x74388b in notify_client_idle src/shared/gatt=
-client.c:180
> bluetoothd[29776]:     #12 0x743cb9 in request_unref src/shared/gatt-clie=
nt.c:199
> bluetoothd[29776]:     #13 0x732bb1 in destroy_att_send_op src/shared/att=
.c:209
> bluetoothd[29776]:     #14 0x739773 in handle_rsp src/shared/att.c:862
> bluetoothd[29776]:     #15 0x73ae8f in can_read_data src/shared/att.c:105=
2
> bluetoothd[29776]:     #16 0x7d7d25 in watch_callback src/shared/io-glib.=
c:157
> bluetoothd[29776]:     #17 0x7ff21f9a6c7e in g_main_context_dispatch (/li=
b64/libglib-2.0.so.0+0x56c7e)
> bluetoothd[29776]:     #18 0x7ff21f9fd117 in g_main_context_iterate.const=
prop.0 (/lib64/libglib-2.0.so.0+0xad117)
> bluetoothd[29776]:     #19 0x7ff21f9a624e in g_main_loop_run (/lib64/libg=
lib-2.0.so.0+0x5624e)
> bluetoothd[29776]:     #20 0x7d8fe5 in mainloop_run src/shared/mainloop-g=
lib.c:66
> bluetoothd[29776]:     #21 0x7d9d0c in mainloop_run_with_signal src/share=
d/mainloop-notify.c:188
> bluetoothd[29776]:     #22 0x55497c in main src/main.c:1428
> bluetoothd[29776]:     #23 0x7ff21e84a50f in __libc_start_call_main (/lib=
64/libc.so.6+0x2750f)
> bluetoothd[29776]:     #24 0x7ff21e84a5c8 in __libc_start_main@GLIBC_2.2.=
5 (/lib64/libc.so.6+0x275c8)
> bluetoothd[29776]:     #25 0x40da34 in _start (/usr/local/stow/bluez-dev/=
libexec/bluetooth/bluetoothd+0x40da34)
> bluetoothd[29776]: 0x6170000001f0 is located 368 bytes inside of 680-byte=
 region [0x617000000080,0x617000000328)
> bluetoothd[29776]: freed by thread T0 here:
> bluetoothd[29776]:     #0 0x7ff21f2b9388 in __interceptor_free.part.0 (/l=
ib64/libasan.so.8+0xb9388)
> bluetoothd[29776]:     #1 0x7ff21f9ab88c in g_free (/lib64/libglib-2.0.so=
.0+0x5b88c)
> bluetoothd[29776]:     #2 0x6fb494 in remove_interface gdbus/object.c:660
> bluetoothd[29776]:     #3 0x70190f in g_dbus_unregister_interface gdbus/o=
bject.c:1394
> bluetoothd[29776]:     #4 0x67b761 in btd_device_unref src/device.c:6883
> bluetoothd[29776]:     #5 0x666838 in device_remove src/device.c:4527
> bluetoothd[29776]:     #6 0x5c0e21 in btd_adapter_remove_device src/adapt=
er.c:1441
> bluetoothd[29776]:     #7 0x5d269d in remove_device src/adapter.c:3546
> bluetoothd[29776]:     #8 0x6f7c8a in process_message gdbus/object.c:246
> bluetoothd[29776]:     #9 0x6ff1c1 in generic_message gdbus/object.c:1072
> bluetoothd[29776]:     #10 0x7ff21f917d88 in dbus_connection_dispatch (/l=
ib64/libdbus-1.so.3+0x1cd88)
> bluetoothd[29776]: previously allocated by thread T0 here:
> bluetoothd[29776]:     #0 0x7ff21f2ba097 in calloc (/lib64/libasan.so.8+0=
xba097)
> bluetoothd[29776]:     #1 0x661074 in device_new src/device.c:4006
> bluetoothd[29776]:     #2 0x661b34 in device_create_from_storage src/devi=
ce.c:4072
> bluetoothd[29776]:     #3 0x5de389 in load_devices src/adapter.c:4930
> bluetoothd[29776]:     #4 0x6051fe in adapter_register src/adapter.c:9264
> bluetoothd[29776]:     #5 0x60da49 in read_info_complete src/adapter.c:10=
159
> bluetoothd[29776]:     #6 0x71aec3 in request_complete src/shared/mgmt.c:=
306
> bluetoothd[29776]:     #7 0x71c271 in can_read_data src/shared/mgmt.c:394
> bluetoothd[29776]:     #8 0x7d7d25 in watch_callback src/shared/io-glib.c=
:157
> bluetoothd[29776]:     #9 0x7ff21f9a6c7e in g_main_context_dispatch (/lib=
64/libglib-2.0.so.0+0x56c7e)
> bluetoothd[29776]: SUMMARY: AddressSanitizer: heap-use-after-free src/dev=
ice.c:5526 in device_connect_le
> bluetoothd[29776]: Shadow bytes around the buggy address:
> bluetoothd[29776]:   0x0c2e7fff7fe0: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00
> bluetoothd[29776]:   0x0c2e7fff7ff0: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00
> bluetoothd[29776]:   0x0c2e7fff8000: fa fa fa fa fa fa fa fa fa fa fa fa =
fa fa fa fa
> bluetoothd[29776]:   0x0c2e7fff8010: fd fd fd fd fd fd fd fd fd fd fd fd =
fd fd fd fd
> bluetoothd[29776]:   0x0c2e7fff8020: fd fd fd fd fd fd fd fd fd fd fd fd =
fd fd fd fd
> bluetoothd[29776]: =3D>0x0c2e7fff8030: fd fd fd fd fd fd fd fd fd fd fd f=
d fd fd[fd]fd
> bluetoothd[29776]:   0x0c2e7fff8040: fd fd fd fd fd fd fd fd fd fd fd fd =
fd fd fd fd
> bluetoothd[29776]:   0x0c2e7fff8050: fd fd fd fd fd fd fd fd fd fd fd fd =
fd fd fd fd
> bluetoothd[29776]:   0x0c2e7fff8060: fd fd fd fd fd fa fa fa fa fa fa fa =
fa fa fa fa
> bluetoothd[29776]:   0x0c2e7fff8070: fa fa fa fa fa fa fa fa fa fa fa fa =
fa fa fa fa
> bluetoothd[29776]:   0x0c2e7fff8080: 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00
> bluetoothd[29776]: Shadow byte legend (one shadow byte represents 8 appli=
cation bytes):
> bluetoothd[29776]:   Addressable:           00
> bluetoothd[29776]:   Partially addressable: 01 02 03 04 05 06 07
> bluetoothd[29776]:   Heap left redzone:       fa
> bluetoothd[29776]:   Freed heap region:       fd
> bluetoothd[29776]:   Stack left redzone:      f1
> bluetoothd[29776]:   Stack mid redzone:       f2
> bluetoothd[29776]:   Stack right redzone:     f3
> bluetoothd[29776]:   Stack after return:      f5
> bluetoothd[29776]:   Stack use after scope:   f8
> bluetoothd[29776]:   Global redzone:          f9
> bluetoothd[29776]:   Global init order:       f6
> bluetoothd[29776]:   Poisoned by user:        f7
> bluetoothd[29776]:   Container overflow:      fc
> bluetoothd[29776]:   Array cookie:            ac
> bluetoothd[29776]:   Intra object redzone:    bb
> bluetoothd[29776]:   ASan internal:           fe
> bluetoothd[29776]:   Left alloca redzone:     ca
> bluetoothd[29776]:   Right alloca redzone:    cb
> bluetoothd[29776]: =3D=3D29776=3D=3DABORTING
>
> While removing device. In this case I had paired one of the earbuds
> which paired also the other one via CSIP. However, this ended up with
> duplicate entries for the same device in bluetoothctl devices:
>
> [Galaxy Buds2 Pro]# devices
> Device 28:3D:C2:4A:7D:2A Galaxy Buds2 Pro
> Device 28:3D:C2:4A:7E:DA Galaxy Buds2 Pro
> Device 28:3D:C2:4A:7D:2A Galaxy Buds2 Pro
>
> When removing (or maybe disconnecting) the duplicate devices bluetoothd c=
rashed.
>
> bluetoothd[65356]: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> bluetoothd[65356]: =3D=3D65356=3D=3DERROR: AddressSanitizer: heap-use-aft=
er-free on address 0x61700000d618 at pc 0x000000672263 bp 0x7fff4830e>
> bluetoothd[65356]: READ of size 8 at 0x61700000d618 thread T0
> bluetoothd[65356]:     #0 0x672262 in device_get_path src/device.c:5752
> bluetoothd[65356]:     #1 0x69df24 in append_device src/set.c:109
> bluetoothd[65356]:     #2 0x7132b1 in queue_foreach src/shared/queue.c:20=
7
> bluetoothd[65356]:     #3 0x69e10b in get_devices src/set.c:125
> bluetoothd[65356]:     #4 0x6f9aed in append_property gdbus/object.c:498
> bluetoothd[65356]:     #5 0x6f9fd3 in append_properties gdbus/object.c:52=
7
> bluetoothd[65356]:     #6 0x6fa22f in append_interface gdbus/object.c:542
> bluetoothd[65356]:     #7 0x7f1c0c743cef in g_slist_foreach (/lib64/libgl=
ib-2.0.so.0+0x72cef)
> bluetoothd[65356]:     #8 0x6ff44d in append_interfaces gdbus/object.c:11=
04
> bluetoothd[65356]:     #9 0x6ff62b in append_object gdbus/object.c:1119
> bluetoothd[65356]:     #10 0x7f1c0c743cef in g_slist_foreach (/lib64/libg=
lib-2.0.so.0+0x72cef)
> bluetoothd[65356]:     #11 0x6ff6e5 in append_object gdbus/object.c:1122
> bluetoothd[65356]:     #12 0x7f1c0c743cef in g_slist_foreach (/lib64/libg=
lib-2.0.so.0+0x72cef)
> bluetoothd[65356]:     #13 0x6ff6e5 in append_object gdbus/object.c:1122
> bluetoothd[65356]:     #14 0x7f1c0c743cef in g_slist_foreach (/lib64/libg=
lib-2.0.so.0+0x72cef)
> bluetoothd[65356]:     #15 0x6ff908 in get_objects gdbus/object.c:1154
> bluetoothd[65356]:     #16 0x6f7c8a in process_message gdbus/object.c:246
> bluetoothd[65356]:     #17 0x6ff1c1 in generic_message gdbus/object.c:107=
2
> bluetoothd[65356]:     #18 0x7f1c0bfc7d88 in dbus_connection_dispatch (/l=
ib64/libdbus-1.so.3+0x1cd88)
> bluetoothd[65356]:     #19 0x6ee2f9 in message_dispatch gdbus/mainloop.c:=
59
> bluetoothd[65356]:     #20 0x7f1c0c726c71 in g_idle_dispatch (/lib64/libg=
lib-2.0.so.0+0x55c71)
> bluetoothd[65356]:     #21 0x7f1c0c727c7e in g_main_context_dispatch (/li=
b64/libglib-2.0.so.0+0x56c7e)
> bluetoothd[65356]:     #22 0x7f1c0c77e117 in g_main_context_iterate.const=
prop.0 (/lib64/libglib-2.0.so.0+0xad117)
> bluetoothd[65356]:     #23 0x7f1c0c72724e in g_main_loop_run (/lib64/libg=
lib-2.0.so.0+0x5624e)
> bluetoothd[65356]:     #24 0x7d8fe5 in mainloop_run src/shared/mainloop-g=
lib.c:66
> bluetoothd[65356]:     #25 0x7d9d0c in mainloop_run_with_signal src/share=
d/mainloop-notify.c:188
> bluetoothd[65356]:     #26 0x55497c in main src/main.c:1428
> bluetoothd[65356]:     #27 0x7f1c0b64a50f in __libc_start_call_main (/lib=
64/libc.so.6+0x2750f)
> bluetoothd[65356]:     #28 0x7f1c0b64a5c8 in __libc_start_main@GLIBC_2.2.=
5 (/lib64/libc.so.6+0x275c8)
> bluetoothd[65356]:     #29 0x40da34 in _start (/usr/local/stow/bluez-dev/=
libexec/bluetooth/bluetoothd+0x40da34)
> bluetoothd[65356]: 0x61700000d618 is located 24 bytes inside of 680-byte =
region [0x61700000d600,0x61700000d8a8)
> bluetoothd[65356]: freed by thread T0 here:
> bluetoothd[65356]:     #0 0x7f1c0c0b9388 in __interceptor_free.part.0 (/l=
ib64/libasan.so.8+0xb9388)
> bluetoothd[65356]:     #1 0x7f1c0c72c88c in g_free (/lib64/libglib-2.0.so=
.0+0x5b88c)
> bluetoothd[65356]:     #2 0x6fb494 in remove_interface gdbus/object.c:660
> bluetoothd[65356]:     #3 0x70190f in g_dbus_unregister_interface gdbus/o=
bject.c:1394
> bluetoothd[65356]:     #4 0x67b761 in btd_device_unref src/device.c:6883
> bluetoothd[65356]:     #5 0x666838 in device_remove src/device.c:4527
> bluetoothd[65356]:     #6 0x5c0e21 in btd_adapter_remove_device src/adapt=
er.c:1441
> bluetoothd[65356]:     #7 0x5f2d01 in adapter_remove_connection src/adapt=
er.c:7381
> bluetoothd[65356]:     #8 0x5fc074 in dev_disconnected src/adapter.c:8352
> bluetoothd[65356]:     #9 0x5fc468 in disconnect_complete src/adapter.c:8=
392
> bluetoothd[65356]:     #10 0x71aec3 in request_complete src/shared/mgmt.c=
:306
> bluetoothd[65356]:     #11 0x71c271 in can_read_data src/shared/mgmt.c:39=
4
> bluetoothd[65356]:     #12 0x7d7d25 in watch_callback src/shared/io-glib.=
c:157
> bluetoothd[65356]:     #13 0x7f1c0c727c7e in g_main_context_dispatch (/li=
b64/libglib-2.0.so.0+0x56c7e)
> bluetoothd[65356]: previously allocated by thread T0 here:
> bluetoothd[65356]:     #0 0x7f1c0c0ba097 in calloc (/lib64/libasan.so.8+0=
xba097)
> bluetoothd[65356]:     #1 0x661074 in device_new src/device.c:4006
> bluetoothd[65356]:     #2 0x661c94 in device_create src/device.c:4097
> bluetoothd[65356]:     #3 0x5c0182 in adapter_create_device src/adapter.c=
:1373
> bluetoothd[65356]:     #4 0x5f0c23 in btd_adapter_update_found_device src=
/adapter.c:7130
> bluetoothd[65356]:     #5 0x5f280c in device_found_callback src/adapter.c=
:7341
> bluetoothd[65356]:     #6 0x71b53f in notify_handler src/shared/mgmt.c:33=
7
> bluetoothd[65356]:     #7 0x7132b1 in queue_foreach src/shared/queue.c:20=
7
> bluetoothd[65356]:     #8 0x71b7f3 in process_notify src/shared/mgmt.c:34=
9
> bluetoothd[65356]:     #9 0x71c60a in can_read_data src/shared/mgmt.c:409
> bluetoothd[65356]:     #10 0x7d7d25 in watch_callback src/shared/io-glib.=
c:157
> bluetoothd[65356]:     #11 0x7f1c0c727c7e in g_main_context_dispatch (/li=
b64/libglib-2.0.so.0+0x56c7e)
> bluetoothd[65356]: SUMMARY: AddressSanitizer: heap-use-after-free src/dev=
ice.c:5752 in device_get_path
> bluetoothd[65356]: Shadow bytes around the buggy address:
> bluetoothd[65356]:   0x0c2e7fff9a70: fd fd fd fd fd fd fd fd fd fd fd fd =
fd fd fd fd
> bluetoothd[65356]:   0x0c2e7fff9a80: fd fd fd fd fd fd fd fd fd fd fd fd =
fd fd fd fd
> bluetoothd[65356]:   0x0c2e7fff9a90: fd fd fd fd fd fd fd fd fd fd fd fd =
fd fd fd fd
> bluetoothd[65356]:   0x0c2e7fff9aa0: fd fd fd fd fd fd fd fd fa fa fa fa =
fa fa fa fa
> bluetoothd[65356]:   0x0c2e7fff9ab0: fa fa fa fa fa fa fa fa fa fa fa fa =
fa fa fa fa
> bluetoothd[65356]: =3D>0x0c2e7fff9ac0: fd fd fd[fd]fd fd fd fd fd fd fd f=
d fd fd fd fd
> bluetoothd[65356]:   0x0c2e7fff9ad0: fd fd fd fd fd fd fd fd fd fd fd fd =
fd fd fd fd
> bluetoothd[65356]:   0x0c2e7fff9ae0: fd fd fd fd fd fd fd fd fd fd fd fd =
fd fd fd fd
> bluetoothd[65356]:   0x0c2e7fff9af0: fd fd fd fd fd fd fd fd fd fd fd fd =
fd fd fd fd
> bluetoothd[65356]:   0x0c2e7fff9b00: fd fd fd fd fd fd fd fd fd fd fd fd =
fd fd fd fd
> bluetoothd[65356]:   0x0c2e7fff9b10: fd fd fd fd fd fa fa fa fa fa fa fa =
fa fa fa fa
> bluetoothd[65356]: Shadow byte legend (one shadow byte represents 8 appli=
cation bytes):
> bluetoothd[65356]:   Addressable:           00
> bluetoothd[65356]:   Partially addressable: 01 02 03 04 05 06 07
> bluetoothd[65356]:   Heap left redzone:       fa
> bluetoothd[65356]:   Freed heap region:       fd
> bluetoothd[65356]:   Stack left redzone:      f1
> bluetoothd[65356]:   Stack mid redzone:       f2
> bluetoothd[65356]:   Stack right redzone:     f3
> bluetoothd[65356]:   Stack after return:      f5
> bluetoothd[65356]:   Stack use after scope:   f8
> bluetoothd[65356]:   Global redzone:          f9
> bluetoothd[65356]:   Global init order:       f6
> bluetoothd[65356]:   Poisoned by user:        f7
> bluetoothd[65356]:   Container overflow:      fc
> bluetoothd[65356]:   Array cookie:            ac
> bluetoothd[65356]:   Intra object redzone:    bb
> bluetoothd[65356]:   ASan internal:           fe
> bluetoothd[65356]:   Left alloca redzone:     ca
> bluetoothd[65356]:   Right alloca redzone:    cb
> bluetoothd[65356]: =3D=3D65356=3D=3DABORTING
>
> "Rank" is also typoed to "Size" in the code below.
>
> The spec seems to allow the same device to belogn to multiple device
> sets. I think this was not allowed in the initial implementation below,
> but maybe room for it should be in the DBus API.

Well I guess each set would need its one unique SIRK as well, although
it might be a good idea to have the Device.Set property be a list to
allow it to be a member of multiple Sets or have it as something like
a dictionary e.g. a{ov} where o is the DeviceSet and v is another
dictionary which can then be something like: s:"Rank", byte:1, the
dictionary allows use to introduce new properties specific for the
device/set so we don't have to break the API in the future. I will try
to fix the crashes, I haven't tried much of removing the devices
belonging to a set and Im yet to implement proper cleanup if all
devices in a set is removed, or if a new device is found with a
matching RSI while scanning it should be automativally added, and
connected if auto-connect is set.

> > ---
> >  Makefile.am   |   3 +-
> >  src/adapter.c |   6 +-
> >  src/device.c  | 124 ++++++++++++++++++-
> >  src/device.h  |  11 +-
> >  src/set.c     | 335 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  src/set.h     |  14 +++
> >  6 files changed, 482 insertions(+), 11 deletions(-)
> >  create mode 100644 src/set.c
> >  create mode 100644 src/set.h
> >
> > diff --git a/Makefile.am b/Makefile.am
> > index 0e8cce249c7d..7b010c8159e9 100644
> > --- a/Makefile.am
> > +++ b/Makefile.am
> > @@ -326,7 +326,8 @@ src_bluetoothd_SOURCES =3D $(builtin_sources) \
> >                       src/eir.h src/eir.c \
> >                       src/adv_monitor.h src/adv_monitor.c \
> >                       src/battery.h src/battery.c \
> > -                     src/settings.h src/settings.c
> > +                     src/settings.h src/settings.c \
> > +                     src/set.h src/set.c
> >  src_bluetoothd_LDADD =3D lib/libbluetooth-internal.la \
> >                       gdbus/libgdbus-internal.la \
> >                       src/libshared-glib.la \
> > diff --git a/src/adapter.c b/src/adapter.c
> > index 538310c1ddc6..ae0eb364bad5 100644
> > --- a/src/adapter.c
> > +++ b/src/adapter.c
> > @@ -4387,8 +4387,8 @@ static void load_ltks(struct btd_adapter *adapter=
, GSList *keys)
> >               if (dev) {
> >                       device_set_paired(dev, info->bdaddr_type);
> >                       device_set_bonded(dev, info->bdaddr_type);
> > -                     device_set_ltk_enc_size(dev, info->enc_size);
> > -                     device_set_ltk_enc_size(dev, info->enc_size);
> > +                     device_set_ltk(dev, info->val, info->central,
> > +                                             info->enc_size);
> >               }
> >       }
> >
> > @@ -8657,7 +8657,7 @@ static void new_long_term_key_callback(uint16_t i=
ndex, uint16_t length,
> >               device_set_bonded(device, addr->type);
> >       }
> >
> > -     device_set_ltk_enc_size(device, ev->key.enc_size);
> > +     device_set_ltk(device, ev->key.val, ev->key.central, ev->key.enc_=
size);
> >
> >       bonding_complete(adapter, &addr->bdaddr, addr->type, 0);
> >  }
> > diff --git a/src/device.c b/src/device.c
> > index cb16d37c1ae1..caee2183b9d8 100644
> > --- a/src/device.c
> > +++ b/src/device.c
> > @@ -64,6 +64,7 @@
> >  #include "storage.h"
> >  #include "eir.h"
> >  #include "settings.h"
> > +#include "set.h"
> >
> >  #define DISCONNECT_TIMER     2
> >  #define DISCOVERY_TIMER              1
> > @@ -159,11 +160,24 @@ struct bearer_state {
> >       time_t last_seen;
> >  };
> >
> > +struct ltk_info {
> > +     uint8_t key[16];
> > +     bool central;
> > +     uint8_t enc_size;
> > +};
> > +
> >  struct csrk_info {
> >       uint8_t key[16];
> >       uint32_t counter;
> >  };
> >
> > +struct sirk_info {
> > +     uint8_t encrypted;
> > +     uint8_t key[16];
> > +     uint8_t size;
> > +     uint8_t rank;
> > +};
> > +
> >  enum {
> >       WAKE_FLAG_DEFAULT =3D 0,
> >       WAKE_FLAG_ENABLED,
> > @@ -253,7 +267,8 @@ struct btd_device {
> >
> >       struct csrk_info *local_csrk;
> >       struct csrk_info *remote_csrk;
> > -     uint8_t ltk_enc_size;
> > +     struct ltk_info *ltk;
> > +     struct sirk_info *sirk;
> >
> >       sdp_list_t      *tmp_records;
> >
> > @@ -386,6 +401,21 @@ static void store_csrk(struct csrk_info *csrk, GKe=
yFile *key_file,
> >       g_key_file_set_integer(key_file, group, "Counter", csrk->counter)=
;
> >  }
> >
> > +static void store_sirk(struct sirk_info *sirk, GKeyFile *key_file)
> > +{
> > +     const char *group =3D "SetIdentityResolvingKey";
> > +     char key[33];
> > +     int i;
> > +
> > +     for (i =3D 0; i < 16; i++)
> > +             sprintf(key + (i * 2), "%2.2X", sirk->key[i]);
> > +
> > +     g_key_file_set_boolean(key_file, group, "Encrypted", sirk->encryp=
ted);
> > +     g_key_file_set_string(key_file, group, "Key", key);
> > +     g_key_file_set_integer(key_file, group, "Size", sirk->size);
> > +     g_key_file_set_integer(key_file, group, "Size", sirk->rank);
>
> This should be "Rank", not "Size".
>
> > +}
> > +
> >  static gboolean store_device_info_cb(gpointer user_data)
> >  {
> >       struct btd_device *device =3D user_data;
> > @@ -483,6 +513,9 @@ static gboolean store_device_info_cb(gpointer user_=
data)
> >       if (device->remote_csrk)
> >               store_csrk(device->remote_csrk, key_file, "RemoteSignatur=
eKey");
> >
> > +     if (device->sirk)
> > +             store_sirk(device->sirk, key_file);
> > +
> >       str =3D g_key_file_to_data(key_file, &length, NULL);
> >       if (!g_file_set_contents(filename, str, length, &gerr)) {
> >               error("Unable set contents for %s: (%s)", filename,
> > @@ -806,6 +839,7 @@ static void device_free(gpointer user_data)
> >
> >       g_free(device->local_csrk);
> >       g_free(device->remote_csrk);
> > +     free(device->ltk);
> >       g_free(device->path);
> >       g_free(device->alias);
> >       free(device->modalias);
> > @@ -1792,10 +1826,43 @@ bool device_is_disconnecting(struct btd_device =
*device)
> >       return device->disconn_timer > 0;
> >  }
> >
> > -void device_set_ltk_enc_size(struct btd_device *device, uint8_t enc_si=
ze)
> > +void device_set_ltk(struct btd_device *device, const uint8_t val[16],
> > +                             bool central, uint8_t enc_size)
> >  {
> > -     device->ltk_enc_size =3D enc_size;
> > -     bt_att_set_enc_key_size(device->att, device->ltk_enc_size);
> > +     if (!device->ltk)
> > +             device->ltk =3D new0(struct ltk_info, 1);
> > +
> > +     memcpy(device->ltk->key, val, sizeof(device->ltk->key));
> > +     device->ltk->central =3D central;
> > +     device->ltk->enc_size =3D enc_size;
> > +     bt_att_set_enc_key_size(device->att, enc_size);
> > +
> > +     if (device->sirk && device->sirk->encrypted)
> > +             btd_set_add_device(device, device->ltk->key, device->sirk=
->key,
> > +                                             device->sirk->size,
> > +                                             device->sirk->rank);
> > +}
> > +
> > +bool btd_device_add_set(struct btd_device *device, bool encrypted,
> > +                             uint8_t sirk[16], uint8_t size, uint8_t r=
ank)
> > +{
> > +     if (encrypted && !device->ltk)
> > +             return false;
> > +
> > +     if (!device->sirk)
> > +             device->sirk =3D new0(struct sirk_info, 1);
> > +
> > +     device->sirk->encrypted =3D encrypted;
> > +     memcpy(device->sirk->key, sirk, sizeof(device->sirk->key));
> > +     device->sirk->size =3D size;
> > +     device->sirk->rank =3D rank;
> > +
> > +     btd_set_add_device(device, encrypted ? device->ltk->key : NULL, s=
irk,
> > +                                                     size, rank);
> > +
> > +     store_device_info(device);
> > +
> > +     return true;
> >  }
> >
> >  static void device_set_auto_connect(struct btd_device *device, gboolea=
n enable)
> > @@ -3290,6 +3357,39 @@ fail:
> >       return NULL;
> >  }
> >
> > +static struct sirk_info *load_sirk(GKeyFile *key_file)
> > +{
> > +     const char *group =3D "SetIdentityResolvingKey";
> > +     struct sirk_info *sirk;
> > +     char *str;
> > +     int i;
> > +
> > +     str =3D g_key_file_get_string(key_file, group, "Key", NULL);
> > +     if (!str)
> > +             return NULL;
> > +
> > +     sirk =3D g_new0(struct sirk_info, 1);
> > +
> > +     for (i =3D 0; i < 16; i++) {
> > +             if (sscanf(str + (i * 2), "%2hhx", &sirk->key[i]) !=3D 1)
> > +                     goto fail;
> > +     }
> > +
> > +
> > +     sirk->encrypted =3D g_key_file_get_boolean(key_file, group, "Encr=
ypted",
> > +                                                                     N=
ULL);
> > +     sirk->size =3D g_key_file_get_integer(key_file, group, "Size", NU=
LL);
> > +     sirk->rank =3D g_key_file_get_integer(key_file, group, "Rank", NU=
LL);
> > +     g_free(str);
> > +
> > +     return sirk;
> > +
> > +fail:
> > +     g_free(str);
> > +     g_free(sirk);
> > +     return NULL;
> > +}
> > +
> >  static void load_services(struct btd_device *device, char **uuids)
> >  {
> >       char **uuid;
> > @@ -3430,6 +3530,12 @@ static void load_info(struct btd_device *device,=
 const char *local,
> >
> >               device->local_csrk =3D load_csrk(key_file, "LocalSignatur=
eKey");
> >               device->remote_csrk =3D load_csrk(key_file, "RemoteSignat=
ureKey");
> > +
> > +             device->sirk =3D load_sirk(key_file);
> > +             if (device->sirk && !device->sirk->encrypted)
> > +                     btd_set_add_device(device, NULL, device->sirk->ke=
y,
> > +                                             device->sirk->size,
> > +                                             device->sirk->rank);
> >       }
> >
> >       g_strfreev(techno);
> > @@ -5207,7 +5313,9 @@ static void gatt_server_init(struct btd_device *d=
evice,
> >               return;
> >       }
> >
> > -     bt_att_set_enc_key_size(device->att, device->ltk_enc_size);
> > +     if (device->ltk)
> > +             bt_att_set_enc_key_size(device->att, device->ltk->enc_siz=
e);
> > +
> >       bt_gatt_server_set_debug(device->server, gatt_debug, NULL, NULL);
> >
> >       btd_gatt_database_server_connected(database, device->server);
> > @@ -6928,3 +7036,9 @@ int8_t btd_device_get_volume(struct btd_device *d=
evice)
> >  {
> >       return device->volume;
> >  }
> > +
> > +void btd_device_foreach_ad(struct btd_device *dev, bt_ad_func_t func,
> > +                                                     void *data)
> > +{
> > +     bt_ad_foreach_data(dev->ad, func, data);
> > +}
> > diff --git a/src/device.h b/src/device.h
> > index 9e81fda9e948..96347ff229cc 100644
> > --- a/src/device.h
> > +++ b/src/device.h
> > @@ -128,8 +128,10 @@ void device_remove_connection(struct btd_device *d=
evice, uint8_t bdaddr_type,
> >                                                               bool *rem=
ove);
> >  void device_request_disconnect(struct btd_device *device, DBusMessage =
*msg);
> >  bool device_is_disconnecting(struct btd_device *device);
> > -void device_set_ltk_enc_size(struct btd_device *device, uint8_t enc_si=
ze);
> > -
> > +void device_set_ltk(struct btd_device *device, const uint8_t val[16],
> > +                             bool central, uint8_t enc_size);
> > +bool btd_device_add_set(struct btd_device *device, bool encrypted,
> > +                             uint8_t sirk[16], uint8_t size, uint8_t r=
ank);
> >  void device_store_svc_chng_ccc(struct btd_device *device, uint8_t bdad=
dr_type,
> >                                                               uint16_t =
value);
> >  void device_load_svc_chng_ccc(struct btd_device *device, uint16_t *ccc=
_le,
> > @@ -188,3 +190,8 @@ void btd_device_cleanup(void);
> >
> >  void btd_device_set_volume(struct btd_device *dev, int8_t volume);
> >  int8_t btd_device_get_volume(struct btd_device *dev);
> > +
> > +typedef void (*bt_device_ad_func_t)(void *data, void *user_data);
> > +
> > +void btd_device_foreach_ad(struct btd_device *dev, bt_device_ad_func_t=
 func,
> > +                                                     void *data);
> > diff --git a/src/set.c b/src/set.c
> > new file mode 100644
> > index 000000000000..6b3cd82651e6
> > --- /dev/null
> > +++ b/src/set.c
> > @@ -0,0 +1,335 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *
> > + *  BlueZ - Bluetooth protocol stack for Linux
> > + *
> > + *  Copyright (C) 2023  Intel Corporation
> > + *
> > + *
> > + */
> > +
> > +#ifdef HAVE_CONFIG_H
> > +#include <config.h>
> > +#endif
> > +
> > +#define _GNU_SOURCE
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <unistd.h>
> > +#include <fcntl.h>
> > +#include <stdbool.h>
> > +#include <errno.h>
> > +
> > +#include <glib.h>
> > +#include <dbus/dbus.h>
> > +
> > +#include "gdbus/gdbus.h"
> > +#include "src/shared/util.h"
> > +#include "src/shared/queue.h"
> > +#include "src/shared/ad.h"
> > +#include "src/shared/crypto.h"
> > +
> > +#include "log.h"
> > +#include "error.h"
> > +#include "adapter.h"
> > +#include "device.h"
> > +#include "dbus-common.h"
> > +#include "set.h"
> > +
> > +static struct queue *set_list;
> > +
> > +struct btd_device_set {
> > +     struct btd_adapter *adapter;
> > +     char *path;
> > +     uint8_t sirk[16];
> > +     uint8_t size;
> > +     uint8_t rank;
> > +     bool auto_connect;
> > +     struct queue *devices;
> > +     struct btd_device *device;
> > +};
> > +
> > +static DBusMessage *set_disconnect(DBusConnection *conn, DBusMessage *=
msg,
> > +                                                     void *user_data)
> > +{
> > +     /* TODO */
> > +     return NULL;
> > +}
> > +
> > +static DBusMessage *set_connect(DBusConnection *conn, DBusMessage *msg=
,
> > +                                                     void *user_data)
> > +{
> > +     /* TODO */
> > +     return NULL;
> > +}
> > +
> > +static const GDBusMethodTable set_methods[] =3D {
> > +     { GDBUS_EXPERIMENTAL_ASYNC_METHOD("Disconnect", NULL, NULL,
> > +                                             set_disconnect) },
> > +     { GDBUS_EXPERIMENTAL_ASYNC_METHOD("Connect", NULL, NULL,
> > +                                             set_connect) },
> > +     {}
> > +};
> > +
> > +static gboolean get_auto_connect(const GDBusPropertyTable *property,
> > +                                     DBusMessageIter *iter, void *data=
)
> > +{
> > +     struct btd_device_set *set =3D data;
> > +
> > +     dbus_message_iter_append_basic(iter, DBUS_TYPE_BOOLEAN,
> > +                                             &set->auto_connect);
> > +
> > +     return TRUE;
> > +}
> > +
> > +static void set_auto_connect(const GDBusPropertyTable *property,
> > +                                     DBusMessageIter *iter,
> > +                                      GDBusPendingPropertySet id, void=
 *data)
> > +{
> > +     struct btd_device_set *set =3D data;
> > +     dbus_bool_t b;
> > +
> > +     if (dbus_message_iter_get_arg_type(iter) !=3D DBUS_TYPE_BOOLEAN) =
{
> > +             g_dbus_pending_property_error(id,
> > +                                     ERROR_INTERFACE ".InvalidArgument=
s",
> > +                                     "Invalid arguments in method call=
");
> > +             return;
> > +     }
> > +
> > +     dbus_message_iter_get_basic(iter, &b);
> > +
> > +     set->auto_connect =3D b ? true : false;
> > +
> > +     g_dbus_pending_property_success(id);
> > +}
> > +
> > +static void append_device(void *data, void *user_data)
> > +{
> > +     struct btd_device *device =3D data;
> > +     const char *path =3D device_get_path(device);
> > +     DBusMessageIter *entry =3D user_data;
> > +
> > +     dbus_message_iter_append_basic(entry, DBUS_TYPE_OBJECT_PATH, &pat=
h);
> > +}
> > +
> > +static gboolean get_devices(const GDBusPropertyTable *property,
> > +                                     DBusMessageIter *iter, void *data=
)
> > +{
> > +     struct btd_device_set *set =3D data;
> > +     DBusMessageIter entry;
> > +
> > +     dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY,
> > +                                     DBUS_TYPE_OBJECT_PATH_AS_STRING,
> > +                                     &entry);
> > +
> > +     queue_foreach(set->devices, append_device, &entry);
> > +
> > +     dbus_message_iter_close_container(iter, &entry);
> > +
> > +     return TRUE;
> > +}
> > +
> > +static gboolean get_size(const GDBusPropertyTable *property,
> > +                                     DBusMessageIter *iter, void *data=
)
> > +{
> > +     struct btd_device_set *set =3D data;
> > +
> > +     dbus_message_iter_append_basic(iter, DBUS_TYPE_BYTE, &set->size);
> > +
> > +     return TRUE;
> > +}
> > +
> > +static gboolean get_rank(const GDBusPropertyTable *property,
> > +                                     DBusMessageIter *iter, void *data=
)
> > +{
> > +     struct btd_device_set *set =3D data;
> > +
> > +     dbus_message_iter_append_basic(iter, DBUS_TYPE_BYTE, &set->rank);
> > +
> > +     return TRUE;
> > +}
> > +
> > +static const GDBusPropertyTable set_properties[] =3D {
> > +     { "AutoConnect", "b", get_auto_connect, set_auto_connect, NULL,
> > +                     G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
> > +     { "Devices", "ao", get_devices, NULL, NULL,
> > +                     G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
> > +     { "Size", "y", get_size, NULL, NULL,
> > +                     G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
> > +     { "Rank", "y", get_rank, NULL, NULL,
> > +                     G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
> > +     {}
> > +};
> > +
> > +static void set_free(void *data)
> > +{
> > +     struct btd_device_set *set =3D data;
> > +
> > +     queue_destroy(set->devices, NULL);
> > +     free(set);
> > +}
> > +
> > +static struct btd_device_set *set_new(struct btd_device *device,
> > +                                     uint8_t sirk[16], uint8_t size,
> > +                                     uint8_t rank)
> > +{
> > +     struct btd_device_set *set;
> > +
> > +     set =3D new0(struct btd_device_set, 1);
> > +     set->adapter =3D device_get_adapter(device);
> > +     memcpy(set->sirk, sirk, sizeof(set->sirk));
> > +     set->size =3D size;
> > +     set->rank =3D rank;
> > +     set->auto_connect =3D true;
> > +     set->devices =3D queue_new();
> > +     queue_push_tail(set->devices, device);
> > +     set->path =3D g_strdup_printf("%s/set_%02x%02x%02x%02x%02x%02x%02=
x%02x"
> > +                                     "%02x%02x%02x%02x%02x%02x%02x%02x=
",
> > +                                     adapter_get_path(set->adapter),
> > +                                     sirk[15], sirk[14], sirk[13], sir=
k[12],
> > +                                     sirk[11], sirk[10], sirk[9], sirk=
[8],
> > +                                     sirk[7], sirk[6], sirk[5], sirk[4=
],
> > +                                     sirk[3], sirk[2], sirk[1], sirk[0=
]);
> > +
> > +     DBG("Creating set %s", set->path);
> > +
> > +     if (g_dbus_register_interface(btd_get_dbus_connection(),
> > +                                     set->path, BTD_DEVICE_SET_INTERFA=
CE,
> > +                                     set_methods, NULL,
> > +                                     set_properties, set,
> > +                                     set_free) =3D=3D FALSE) {
> > +             error("Unable to register set interface");
> > +             set_free(set);
> > +             return NULL;
> > +     }
> > +
> > +     return set;
> > +}
> > +
> > +static struct btd_device_set *set_find(struct btd_device *device,
> > +                                             uint8_t sirk[16])
> > +{
> > +     struct btd_adapter *adapter =3D device_get_adapter(device);
> > +     const struct queue_entry *entry;
> > +
> > +     for (entry =3D queue_get_entries(set_list); entry; entry =3D entr=
y->next) {
> > +             struct btd_device_set *set =3D entry->data;
> > +
> > +             if (set->adapter !=3D adapter)
> > +                     continue;
> > +
> > +             if (!memcmp(set->sirk, sirk, sizeof(set->sirk)))
> > +                     return set;
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > +static void set_connect_next(struct btd_device_set *set)
> > +{
> > +     const struct queue_entry *entry;
> > +
> > +     for (entry =3D queue_get_entries(set->devices); entry;
> > +                                     entry =3D entry->next) {
> > +             struct btd_device *device =3D entry->data;
> > +
> > +             /* Only connect one at time(?) */
> > +             if (!device_connect_le(device))
> > +                     return;
> > +     }
> > +}
> > +
> > +static void set_add(struct btd_device_set *set, struct btd_device *dev=
ice)
> > +{
> > +     /* Check if device is already part of the set then skip to connec=
t */
> > +     if (queue_find(set->devices, NULL, device))
> > +             goto done;
> > +
> > +     DBG("set %s device %s", set->path, device_get_path(device));
> > +
> > +     queue_push_tail(set->devices, device);
> > +     g_dbus_emit_property_changed(btd_get_dbus_connection(), set->path=
,
> > +                                     BTD_DEVICE_SET_INTERFACE, "Device=
s");
> > +
> > +done:
> > +     /* Check if set is marked to auto-connect */
> > +     if (btd_device_is_connected(device) && set->auto_connect)
> > +             set_connect_next(set);
> > +}
> > +
> > +static void foreach_rsi(void *data, void *user_data)
> > +{
> > +     struct bt_ad_data *ad =3D data;
> > +     struct btd_device_set *set =3D user_data;
> > +     struct bt_crypto *crypto;
> > +     uint8_t res[3];
> > +
> > +     if (ad->type !=3D BT_AD_CSIP_RSI || ad->len < 6)
> > +             return;
> > +
> > +     crypto =3D bt_crypto_new();
> > +     if (!crypto)
> > +             return;
> > +
> > +     if (!bt_crypto_sih(crypto, set->sirk, ad->data + 3, res)) {
> > +             bt_crypto_unref(crypto);
> > +             return;
> > +     }
> > +
> > +     bt_crypto_unref(crypto);
> > +
> > +     if (!memcmp(ad->data, res, sizeof(res)))
> > +             device_connect_le(set->device);
> > +}
> > +
> > +static void foreach_device(struct btd_device *device, void *data)
> > +{
> > +     struct btd_device_set *set =3D data;
> > +
> > +     /* Check if device is already part of the set then skip */
> > +     if (queue_find(set->devices, NULL, device))
> > +             return;
> > +
> > +     set->device =3D device;
> > +
> > +     btd_device_foreach_ad(device, foreach_rsi, set);
> > +}
> > +
> > +void btd_set_add_device(struct btd_device *device, uint8_t *key,
> > +                             uint8_t sirk[16], uint8_t size, uint8_t r=
ank)
> > +{
> > +     struct btd_device_set *set;
> > +
> > +     /* In case key has been set it means SIRK is encrypted */
> > +     if (key) {
> > +             struct bt_crypto *crypto =3D bt_crypto_new();
> > +
> > +             if (!crypto)
> > +                     return;
> > +
> > +             /* sef and sdf are symmetric */
> > +             bt_crypto_sef(crypto, key, sirk, sirk);
> > +
> > +             bt_crypto_unref(crypto);
> > +     }
> > +
> > +     /* Check if DeviceSet already exists */
> > +     set =3D set_find(device, sirk);
> > +     if (set) {
> > +             set_add(set, device);
> > +             return;
> > +     }
> > +
> > +     set =3D set_new(device, sirk, size, rank);
> > +     if (!set)
> > +             return;
> > +
> > +     if (!set_list)
> > +             set_list =3D queue_new();
> > +
> > +     queue_push_tail(set_list, set);
> > +
> > +     /* Attempt to add devices which have matching RSI */
> > +     btd_adapter_for_each_device(device_get_adapter(device), foreach_d=
evice,
> > +                                                                     s=
et);
> > +}
> > diff --git a/src/set.h b/src/set.h
> > new file mode 100644
> > index 000000000000..c3831ef9ca66
> > --- /dev/null
> > +++ b/src/set.h
> > @@ -0,0 +1,14 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + *
> > + *  BlueZ - Bluetooth protocol stack for Linux
> > + *
> > + *  Copyright (C) 2023  Intel Corporation
> > + *
> > + *
> > + */
> > +
> > +#define BTD_DEVICE_SET_INTERFACE     "org.bluez.DeviceSet1"
> > +
> > +void btd_set_add_device(struct btd_device *device, uint8_t *ltk,
> > +                             uint8_t sirk[16], uint8_t size, uint8_t r=
ank);
>
> --
> Pauli Virtanen



--=20
Luiz Augusto von Dentz
