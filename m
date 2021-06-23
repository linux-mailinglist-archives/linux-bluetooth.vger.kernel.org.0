Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C5E3B2373
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Jun 2021 00:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhFWWQs (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 23 Jun 2021 18:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhFWWQ3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 23 Jun 2021 18:16:29 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8594BC061766
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Jun 2021 15:10:32 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c23so9221524qkc.10
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Jun 2021 15:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sdjgGBdNA87x1/cp7+QU4gMZFDgy/Uf22ZGVvix+LOs=;
        b=DOeuUxaLthjqElqZhqKnlSsV2vUc802u5zasJ0jc5CFMAnxUaB/Dmin32FRUJHyUSg
         RjIsZDhiwBs/+yIcXzL3gcUAtuZ1+Kqgu57H2Wb9YBwSEldCOHTCbxEIGi7/MtJJJqn8
         EfbIcer2+JxhzKBfkD2brRJxsWh6DaULsEgD41Jiz5ld6YjkVNzi39x6vK3HqdF1Kdvr
         xL/Ef7CdsdFDFrU3HZ6eQ7Ptom2zVIhzWmcdwo4FEeebpmXa2bgiRZJ51g2VlCJHRPme
         DL96Q2h4KqOWk7evhzxcvs11gV4MLe5PdCL8VlftfBd0aLZvQVnEP8ECtqFZPvmnmeuC
         P1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sdjgGBdNA87x1/cp7+QU4gMZFDgy/Uf22ZGVvix+LOs=;
        b=Cqn+/eRcBcTKJ1PLARn5H5N+dYWNB+iLtlEy5YJgMhRiG1f2KyyKKnisWmVzoqlqDj
         OBKJL38M7Nfea3J867W7rf2giA14CtetQ3WyM8VliN1STClgQR9F019if2YiW1J/9Tcu
         9iOhslk5YtCLPnNNz9TecuSMCw7vokKyDeM7dYsjIXHdpC1TMcm1qNcQ8xNxVCqbVmC1
         lIGhM/p/0Y+83qfweI2RnkaZIaphqUypAAWCa3YdejyuOuvWH3cgc6hOUODGDuxuGhlz
         3CjN/d0tfsh5sXr10V9Rkvd9jCcx9imki8bdrNZdyxQ4tQ6SsU3G8MqGbQsub9GWMZS8
         Mgew==
X-Gm-Message-State: AOAM531bRUHdQkM5tpXmtRJLlI4GmUPflILi633uMXFoTsVploCcWTeE
        ko8oOl1jYRoSwcr787bCtdad8u5RV5QejqAHVvk=
X-Google-Smtp-Source: ABdhPJxAPxRKDjssk/KKgOoF+fZQymF531mpri7jDEu5rtcpqffumOVH0Qt1Rg9t8eKMwQ7qk5S+5Zdt4siuvWq4D1w=
X-Received: by 2002:a25:be02:: with SMTP id h2mr384177ybk.91.1624486231647;
 Wed, 23 Jun 2021 15:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAPNBayJJA7uYZb_oGHVw3ydasYwdCh_2VXLsNDJeippqX=frRw@mail.gmail.com>
In-Reply-To: <CAPNBayJJA7uYZb_oGHVw3ydasYwdCh_2VXLsNDJeippqX=frRw@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 23 Jun 2021 15:10:21 -0700
Message-ID: <CABBYNZLO1iX2GZ2S4hj+TFtg_y0hL7-hQigN_jsEpvBDGw0wuw@mail.gmail.com>
Subject: Re: A2DP Sink, problem reading data from mediatransport
To:     Nick Shaforostoff <shaforostoff@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Nick,

On Wed, Jun 23, 2021 at 3:12 AM Nick Shaforostoff
<shaforostoff@gmail.com> wrote:
>
> Hi! I am implementing audio sink on my desktop linux (as a first step;
> second step is linux embedded). My application uses Qt 5.15, and also
> bluez-qt library from KDE project. I am using bluez 5.55
>
> On my laptop I have organized registering of endpoint to accept sbc
> audio from my android smartphone. When I receive
> BluezQt::MediaTransport::stateChanged signal with state =3D
> BluezQt::MediaTransport::State::Pending, I call transport->acquire().
>
> In reply I get file descriptor 33, mtu read 672, mtu write 1008.
>
> But then, when I start new thread that reads from this file
> descriptor, I get errno 9 (returned length being -1) all the time (on
> each for(;;) loop iteration).
>
> On smartphones's side everything looks good - it streams audio over
> bluetooth (in youtube application) and I can change bluetooth volume.
>
> I found out that bluetooth documentation is scarce. The only detailed
> document I found besides *-api.txt files is
> https://www.lightofdawn.org/blog/?viewDetailed=3D00032 but it talks
> about bluez 4
>
> Could you please give me advice on where to look to fix this problem?
>
> This is the log from bluetoothd -d:
>
> Jun 23 10:52:52 debian-e330 bluetoothd[629]: Endpoint registered:
> sender=3D:1.170 path=3D/MediaEndpoint/Sink/Sbc
>
> Jun 23 10:52:52 debian-e330 bluetoothd[629]:
> src/adapter.c:dev_class_changed_callback() Class: 0x14010c
>
>
> Jun 23 10:52:53 debian-e330 bluetoothd[629]:
> src/adapter.c:device_found_callback() hci0 addr 60:AB:67:17:74:03,
> rssi -79 flags 0x0000 eir_len 170
> Jun 23 10:52:53 debian-e330 bluetoothd[629]:
> src/device.c:device_set_legacy() legacy 0
> Jun 23 10:52:53 debian-e330 bluetoothd[629]:
> src/device.c:device_set_rssi_with_delta() rssi -79
>
>
>
>
> Jun 23 10:52:57 debian-e330 bluetoothd[629]:
> src/adapter.c:discovering_callback() hci0 type 7 discovering 0 method
> 1
> Jun 23 10:52:57 debian-e330 bluetoothd[629]:
> src/adapter.c:trigger_start_discovery()
> Jun 23 10:52:57 debian-e330 bluetoothd[629]:
> src/adapter.c:cancel_passive_scanning()
> Jun 23 10:52:57 debian-e330 bluetoothd[629]:
> src/adapter.c:start_discovery_timeout()
> Jun 23 10:52:57 debian-e330 bluetoothd[629]:
> src/adapter.c:start_discovery_timeout()
> adapter->current_discovery_filter =3D=3D 1
> Jun 23 10:52:57 debian-e330 bluetoothd[629]:
> src/adapter.c:start_discovery_timeout() sending
> MGMT_OP_START_SERVICE_DISCOVERY 127, 7, 0
> Jun 23 10:52:57 debian-e330 bluetoothd[629]:
> src/adapter.c:start_discovery_complete() status 0x00
> Jun 23 10:52:57 debian-e330 bluetoothd[629]:
> src/adapter.c:discovering_callback() hci0 type 7 discovering 1 method
> 1
> Jun 23 10:53:02 debian-e330 bluetoothd[629]:
> src/adapter.c:connected_callback() hci0 device 60:AB:67:17:74:03
> connected eir_len 12
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:confirm_cb() AVDTP: incoming connect from
> 60:AB:67:17:74:03
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/source.c:source_set_state() State changed
> /org/bluez/hci0/dev_60_AB_67_17_74_03: SOURCE_STATE_DISCONNECTED ->
> SOURCE_STATE_CONNECTING
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_connect_cb() AVDTP: connected signaling
> channel to 60:AB:67:17:74:03
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_connect_cb() AVDTP imtu=3D672, omtu=3D672
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_register_remote_sep() seid 1 type 0 media
> 0 delay_reporting true
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:register_remote_sep() Found remote SEP:
> /org/bluez/hci0/dev_60_AB_67_17_74_03/sep1
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_ref() 0x560dcaedf8a0: ref=3D1
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:set_disconnect_timer() timeout 1
> Jun 23 10:53:03 debian-e330 bluetoothd[629]: profiles/audio/avdtp.c:sessi=
on_cb()
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_parse_cmd() Received DISCOVER_CMD
> Jun 23 10:53:03 debian-e330 bluetoothd[629]: profiles/audio/avdtp.c:sessi=
on_cb()
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_parse_cmd() Received
> GET_ALL_CAPABILITIES_CMD
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:endpoint_getcap_ind() Sink 0x560dcaeb1050:
> Get_Capability_Ind
> Jun 23 10:53:03 debian-e330 bluetoothd[629]: profiles/audio/avdtp.c:sessi=
on_cb()
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_parse_cmd() Received
> SET_CONFIGURATION_CMD
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:caps_to_list() Invalid capability data in
> getcap resp
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:endpoint_setconf_ind() Sink 0x560dcaeb1050:
> Set_Configuration_Ind
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_ref() 0x560dcaedf8a0: ref=3D2
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_unref() 0x560dcaedf8a0: ref=3D1
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:setup_ref() 0x560dcaec4cc0: ref=3D1
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:setup_ref() 0x560dcaec4cc0: ref=3D2
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/media.c:media_endpoint_async_call() Calling
> SetConfiguration: name =3D :1.170 path =3D /MediaEndpoint/Sink/Sbc
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_ref() 0x560dcaedf8a0: ref=3D2
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_sep_set_state() stream state changed:
> IDLE -> CONFIGURED
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:setup_unref() 0x560dcaec4cc0: ref=3D1
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:setup_unref() 0x560dcaec4cc0: ref=3D0
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:setup_free() 0x560dcaec4cc0
> Jun 23 10:53:03 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_unref() 0x560dcaedf8a0: ref=3D1
> Jun 23 10:53:05 debian-e330 bluetoothd[629]: profiles/audio/avdtp.c:sessi=
on_cb()
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_parse_cmd() Received OPEN_CMD
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:open_ind() Sink 0x560dcaeb1050: Open_Ind
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_ref() 0x560dcaedf8a0: ref=3D2
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:setup_ref() 0x560dcaec4cc0: ref=3D1
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:confirm_cb() AVDTP: incoming connect from
> 60:AB:67:17:74:03
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_sep_set_state() stream state changed:
> CONFIGURED -> OPEN
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> src/service.c:change_state() 0x560dcaebb5a0: device 60:AB:67:17:74:03
> profile a2dp-source state changed: disconnected -> connected (0)
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> plugins/policy.c:service_cb() Added a2dp-source reconnect 1
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> profiles/audio/source.c:source_set_state() State changed
> /org/bluez/hci0/dev_60_AB_67_17_74_03: SOURCE_STATE_CONNECTING ->
> SOURCE_STATE_CONNECTED
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> profiles/audio/transport.c:transport_update_playing()
> /org/bluez/hci0/dev_60_AB_67_17_74_03/fd1 State=3DTRANSPORT_STATE_IDLE
> Playing=3D0
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:setup_unref() 0x560dcaec4cc0: ref=3D0
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:setup_free() 0x560dcaec4cc0
> Jun 23 10:53:05 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_unref() 0x560dcaedf8a0: ref=3D1
> Jun 23 10:53:07 debian-e330 bluetoothd[629]:
> src/adapter.c:stop_discovery() sender :1.170
> Jun 23 10:53:07 debian-e330 bluetoothd[629]:
> src/adapter.c:discovering_callback() hci0 type 7 discovering 0 method
> 1
> Jun 23 10:53:07 debian-e330 bluetoothd[629]:
> src/adapter.c:trigger_start_discovery()
> Jun 23 10:53:07 debian-e330 bluetoothd[629]:
> src/adapter.c:cancel_passive_scanning()
> Jun 23 10:53:07 debian-e330 bluetoothd[629]:
> src/adapter.c:stop_discovery_complete() status 0x00
> Jun 23 10:53:07 debian-e330 bluetoothd[629]:
> src/adapter.c:discovery_remove() owner :1.170
> Jun 23 10:53:07 debian-e330 bluetoothd[629]:
> src/device.c:device_set_rssi_with_delta() rssi 0
> Jun 23 10:53:07 debian-e330 bluetoothd[629]:
> src/adapter.c:trigger_passive_scanning()
>
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> plugins/policy.c:policy_connect()
> /org/bluez/hci0/dev_60_AB_67_17_74_03 profile audio-avrcp-target
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/avrcp.c:avrcp_connect() path
> /org/bluez/hci0/dev_60_AB_67_17_74_03
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/avctp.c:avctp_set_state() AVCTP Connecting
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> src/service.c:change_state() 0x560dcaeba730: device 60:AB:67:17:74:03
> profile audio-avrcp-target state changed: disconnected -> connecting
> (0)
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/avctp.c:avctp_connect_cb() AVCTP: connected to
> 60:AB:67:17:74:03
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/avctp.c:init_uinput() AVRCP: uinput initialized for Mi
> A3
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/avrcp.c:controller_init() 0x560dcaeae780 version 0x0103
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> src/service.c:change_state() 0x560dcaeba730: device 60:AB:67:17:74:03
> profile audio-avrcp-target state changed: connecting -> connected (0)
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> src/device.c:device_profile_connected() audio-avrcp-target Success (0)
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_controller_create()
> /org/bluez/hci0/dev_60_AB_67_17_74_03/player0
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/avrcp.c:target_init() 0x560dcaee0d00 version 0x0103
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> src/service.c:change_state() 0x560dcaea88d0: device 60:AB:67:17:74:03
> profile avrcp-controller state changed: disconnected -> connected (0)
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/avctp.c:avctp_set_state() AVCTP Connected
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/avrcp.c:handle_vendordep_pdu() AVRCP PDU 0x31, company
> 0x001958 len 0x0005
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/avrcp.c:handle_vendordep_pdu() AVRCP PDU parameters
> length don't match
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_setting() Repeat: off
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_setting() Shuffle: off
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_position() 0
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_status() stopped
>
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_playlist_item() 0
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_metadata() Title:
> CIAO, 2020! =D0=9F=D0=BE=D0=BB=D0=BD=D0=B0=D1=8F =D0=B2=D0=B5=D1=80=D1=81=
=D0=B8=D1=8F
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_metadata() Artist: =D0=92=D0=B5=
=D1=87=D0=B5=D1=80=D0=BD=D0=B8=D0=B9
> =D0=A3=D1=80=D0=B3=D0=B0=D0=BD=D1=82
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_metadata() Album: =D0=92=D0=B5=
=D1=87=D0=B5=D1=80=D0=BD=D0=B8=D0=B9
> =D0=A3=D1=80=D0=B3=D0=B0=D0=BD=D1=82
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_metadata() TrackNumber: 0
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_metadata() NumberOfTracks: 0
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_metadata() Genre:
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_metadata() Duration: 3184000
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_duration() 3184000
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_position() 0
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_status() stopped
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_duration() 3184000
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_position() 0
> Jun 23 10:53:08 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_status() stopped
>
> Jun 23 10:53:09 debian-e330 bluetoothd[629]: profiles/audio/avdtp.c:sessi=
on_cb()
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_parse_cmd() Received START_CMD
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:start_ind() Sink 0x560dcaeb1050: Start_Ind
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_ref() 0x560dcaedf8a0: ref=3D2
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_sep_set_state() stream state changed:
> OPEN -> STREAMING
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/source.c:source_set_state() State changed
> /org/bluez/hci0/dev_60_AB_67_17_74_03: SOURCE_STATE_CONNECTED ->
> SOURCE_STATE_PLAYING
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/transport.c:transport_update_playing()
> /org/bluez/hci0/dev_60_AB_67_17_74_03/fd1 State=3DTRANSPORT_STATE_IDLE
> Playing=3D1
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/transport.c:transport_set_state() State changed
> /org/bluez/hci0/dev_60_AB_67_17_74_03/fd1: TRANSPORT_STATE_IDLE ->
> TRANSPORT_STATE_PENDING
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/transport.c:media_owner_create() Owner created:
> sender=3D:1.170
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_ref() 0x560dcaedf8a0: ref=3D3
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:a2dp_sep_lock() SEP 0x560dcaeb1050 locked
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_ref() 0x560dcaedf8a0: ref=3D4
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:setup_ref() 0x560dcaed05b0: ref=3D1
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_unref() 0x560dcaedf8a0: ref=3D3
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/transport.c:media_request_create() Request created:
> method=3DAcquire id=3D3
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/transport.c:media_owner_add() Owner :1.170 Request
> Acquire
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/transport.c:media_transport_set_owner() Transport
> /org/bluez/hci0/dev_60_AB_67_17_74_03/fd1 Owner :1.170
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> /org/bluez/hci0/dev_60_AB_67_17_74_03/fd1: fd(37) ready
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/transport.c:media_owner_remove() Owner :1.170 Request
> Acquire
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/transport.c:transport_set_state() State changed
> /org/bluez/hci0/dev_60_AB_67_17_74_03/fd1: TRANSPORT_STATE_PENDING ->
> TRANSPORT_STATE_ACTIVE
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:setup_unref() 0x560dcaed05b0: ref=3D0
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/a2dp.c:setup_free() 0x560dcaed05b0
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/avdtp.c:avdtp_unref() 0x560dcaedf8a0: ref=3D2
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_status() playing
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_duration() 3184000
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_position() 0
> Jun 23 10:53:09 debian-e330 bluetoothd[629]:
> profiles/audio/player.c:media_player_set_status() playing
>
>
>
>
>
>
>
>
>
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> And this is the output of my application, Mi A3 is my smartphone.
>
> Change "org.bluez.Device1" QMap(("RSSI", QVariant(short, -79)))
> Change "org.bluez.Device1" QMap(("Connected", QVariant(bool, true)))
> isInSet false isConnected  true
> CONNECTED
> configurationSet "/org/bluez/hci0/dev_60_AB_67_17_74_03/fd1"
> Change "org.bluez.Device1" QMap()
> Change "org.bluez.Adapter1" QMap(("Discovering", QVariant(bool, false)))
> Change "org.bluez.MediaControl1" QMap(("Connected", QVariant(bool,
> true))("Player", QVariant(QDBusObjectPath, )))
> MediaTransportPrivate::onPropertiesChanged key "State"
> QVariant(QString, "pending")
> Transport state: BluezQt::MediaTransport::State::Pending "Mi A3"
> Transport state: BluezQt::MediaTransport::State::Pending "Mi A3"
> fd:  33 mtu read: 672 mtu write: 1008
> fd reply err 0
> fd reply mtu read write 672 1008
> fd reply fd 33
> MediaTransportPrivate::onPropertiesChanged key "State"
> QVariant(QString, "active")
> Transport state: BluezQt::MediaTransport::State::Active "Mi A3"
> Transport state: BluezQt::MediaTransport::State::Active "Mi A3"
> BluetoothAudioRead len errno -1 9

Are you sure there is any data to be read? You can check how
pulseaudio/pipewire does it, Im curious why you decided to reimplement
the audio handling instead of just using an existing implementation?

> I use read() call:
> uint8_t payload[2 * 512];
> ssize_t len =3D read(bluetooth_fd, payload, sizeof(payload));
> qDebug()<<"BluetoothAudioRead len errno"<<len<<errno;
>
> I also tried using recvmsg() the way it is done in pulseaudio, but
> result is the same.



--=20
Luiz Augusto von Dentz
