Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA244E595B
	for <lists+linux-bluetooth@lfdr.de>; Wed, 23 Mar 2022 20:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344381AbiCWTrg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 23 Mar 2022 15:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241263AbiCWTrf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 23 Mar 2022 15:47:35 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95478B6FD
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Mar 2022 12:46:04 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id y142so4622671ybe.11
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Mar 2022 12:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ta344CIcy1tdXZKh9alpR8O+mfao1JEnKlmQOcgvcUM=;
        b=iD5s9oWfkB33VDv1zYtn7pCCZ4/NfA1vpZZy78ItS6GgSSK6zYH3p8PnXAqe8GMsbr
         Y+qB99JrV2+bkJLHWAJk39TBRpEhgaEj3w8/+uUOHSuUn4l0VjC+ospWye1RaT2hCUrr
         hC3ppoyhVdvUthSv0Dfj+vUody3uVAwwcH/rOBoeoIMRJGk6y40mjPbh6Nd6cBP2iMzE
         VLZjLw5v0qPXjLmczQBVp3yuTfUl/G7C/ZLdbGE3hjzY9p+0oGxJXGEIZU+5zEGGvNJB
         4NfqIXfJVGmBvFRJdk2RULtCgWcgb7wf1Yy1OV6/Imc7WfALm3F9kNeEfe8PaBm6qXqg
         oJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ta344CIcy1tdXZKh9alpR8O+mfao1JEnKlmQOcgvcUM=;
        b=yFsRcIzcURht9ZN+AdsbEJ5RJAT2jCF6bILWmcEcJ3EJf3po0TK0j7ootFxBrOlobf
         1rdeLpbiJN/5vqFpb9A0cFDKlXBl0xcFpipS/Th6Sy3zS3pcraDFlggbDv44KXTzW+lL
         gjnZee6aDz6sg3mJFzYWXwY0o8bWEYIXbPTRI7xJRrTdIH8PR8Uoj2XiZYxxoNgMC9NS
         a1WTTYrgdjXFR95UHewNLyoQQ3v7GEkhqtS0V1AnBsMwlicg1SLa4g38nNg1dbTjkbES
         9BU0+4zu9CFfrsB2gLrnKa1IX0vzb1G2KUfhuEcu/SYoUmgXZKJ8tHCgOxHSC0mAbWz2
         qTAQ==
X-Gm-Message-State: AOAM531u1F0dJI/TIXdpLiAuQFCAd70NS+ETJdTRQdUoJtf5asyJmxNB
        OEoMyau3gagAAPmwVgnYDoRIUcUErxLvTD0cdvUSjAw+U8Y=
X-Google-Smtp-Source: ABdhPJyKKRgJSB/iZ/oMrRtl+bYg8Yt7TeMFLIlqzGDuzkVyxUqbaGx7YvjCNlxVlrOdyC2F8a7lr1sjFH6FheNZj2E=
X-Received: by 2002:a25:8546:0:b0:61e:1d34:ec71 with SMTP id
 f6-20020a258546000000b0061e1d34ec71mr1485921ybn.259.1648064763917; Wed, 23
 Mar 2022 12:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <CANFkB1ydGuwKRjusy3U0HCQo8E88XbZTh_UdPZ8wujt7P5KKnQ@mail.gmail.com>
 <CABBYNZLjV3PQ7Hm3PJZcTcs64aLzWLBNfooSYuZmSywv0RJG0g@mail.gmail.com>
 <CANFkB1yr3N_Twac=ocxBRst79-gmdu8=6VTD6oPgdGT0rb_HaQ@mail.gmail.com>
 <CANFkB1xEesP1cMmK4VGi5cH-v80ho00wT24q=+4QQSdyPegPQQ@mail.gmail.com>
 <CABBYNZKSsyqfiWYjpuZNYtKAZb4C2q73YwOj=KoUFq71gLs7Hg@mail.gmail.com>
 <CANFkB1zHTZF3Mcgn5GPBA0km+BNyL3bb9=MJFuSNFe6x5zgimQ@mail.gmail.com>
 <CABBYNZLWN3+51F-sNJ5yPc2bw+x4Ep6rCwcFLn0bfrwArL=Hyw@mail.gmail.com>
 <CABBYNZL-fjTd8JdmRRM5Y26d41KwDxvvuaED+j2+yPT-RBpMtw@mail.gmail.com>
 <CANFkB1w2UUq7W0EqEdskebhKcEtkZ-33q-Co5VF_WKf7dHsJtg@mail.gmail.com>
 <CANFkB1zMOYTD8ZsDHczHqce9ipgyu9-fEeXEZqTzuf=T4UufLQ@mail.gmail.com> <CANFkB1yOadrpibp4ZNE8e0E+-Wy4z_FV3LC=B7HZzUjGAh3DVA@mail.gmail.com>
In-Reply-To: <CANFkB1yOadrpibp4ZNE8e0E+-Wy4z_FV3LC=B7HZzUjGAh3DVA@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 23 Mar 2022 12:45:52 -0700
Message-ID: <CABBYNZK_CdiXaZzw++x8fzarP_WhCehLia17EpruVTduKZ=Png@mail.gmail.com>
Subject: Re: GATT issue, possible bluez bug?
To:     Adam Pigg <adam@piggz.co.uk>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Adam,

On Wed, Mar 23, 2022 at 7:46 AM Adam Pigg <adam@piggz.co.uk> wrote:
>
> On Wed, 23 Mar 2022 at 13:36, Adam Pigg <adam@piggz.co.uk> wrote:
> >
> > Hi Luiz
> >
> > On Wed, 23 Mar 2022 at 09:11, Adam Pigg <adam@piggz.co.uk> wrote:
> > >
> > > Hi Luiz
> > >
> > > Good that you clearly know more about this than me!...
> > >
> > > On Tue, 22 Mar 2022 at 23:44, Luiz Augusto von Dentz
> > > <luiz.dentz@gmail.com> wrote:
> > > >
> > > > Hi Adam,
> > > >
> > > > On Tue, Mar 22, 2022 at 4:35 PM Luiz Augusto von Dentz
> > > > <luiz.dentz@gmail.com> wrote:
> > > > >
> > > > > Hi Adam,
> > > > >
> > > > > On Tue, Mar 22, 2022 at 4:09 PM Adam Pigg <adam@piggz.co.uk> wrote:
> > > > > >
> > > > > > Thanks Luiz
> > > > > >
> > > > > > On Tue, 22 Mar 2022 at 21:35, Luiz Augusto von Dentz
> > > > > > <luiz.dentz@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi Adam,
> > > > > > >
> > > > > > > On Tue, Mar 22, 2022 at 3:40 AM Adam Pigg <adam@piggz.co.uk> wrote:
> > > > > > > >
> > > > > > > > Hi Luiz
> > > > > > > >
> > > > > > > >
> > > > > > > > On Tue, 22 Mar 2022 at 07:55, Adam Pigg <adam@piggz.co.uk> wrote:
> > > > > > > > >
> > > > > > > > > Hi Luiz
> > > > > > > > >
> > > > > > > > > On Tue, 22 Mar 2022 at 00:44, Luiz Augusto von Dentz
> > > > > > > > > <luiz.dentz@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > Hi Adam,
> > > > > > > > > >
> > > > > > > > > > On Mon, Mar 21, 2022 at 4:03 PM Adam Pigg <adam@piggz.co.uk> wrote:
> > > > > > > > > > >
> > > > > > > > > > > Hi
> > > > > > > > > > >
> > > > > > > > > > > A bit of background, I write a linux desktop/mobile app called
> > > > > > > > > > > Amazfish which interfaces with several watches over BLE using their
> > > > > > > > > > > GATT services.  To do this, I use the bluez dbus api (technically a
> > > > > > > > > > > thin wrapper around it I wrote called qble
> > > > > > > > > > > https://github.com/piggz/qble)
> > > > > > > > > > >
> > > > > > > > > > > All has been good so far, I support several generations of
> > > > > > > > > > > Huami/Amazfit watches, as well as the open source Pinetime and
> > > > > > > > > > > Bangle.js.  For the Amazfit watches, i have implementations for older
> > > > > > > > > > > devies such as the Bip, and newer ones such as the GTS.
> > > > > > > > > > >
> > > > > > > > > > > Much of the reverse engineering comes from the Android Gadget Bridge
> > > > > > > > > > > project, which supports many more devices.
> > > > > > > > > > >
> > > > > > > > > > > My community of users donated to buy me a newer device called a GTR2,
> > > > > > > > > > > which, according to the GB devs uses the same protocol as the slightly
> > > > > > > > > > > older GTS, and the packet captures I have from Android would support
> > > > > > > > > > > this.
> > > > > > > > > > >
> > > > > > > > > > > But this is where my trouble starts with Bluez, my existing
> > > > > > > > > > > implementation doesnt work at all.  Normally, after a connection, I
> > > > > > > > > > > would wait for the ServicesResolved signal, which happens pretty fast
> > > > > > > > > > > on all other devices, but on the GTR2, it takes about 30 seconds, by
> > > > > > > > > > > which time, the watch has disconnected. (i get a disconnected signal
> > > > > > > > > > > immediately after the ServicesResolved signal)
> > > > > > > > > > >
> > > > > > > > > > > To rule out my code, I have tried several things:
> > > > > > > > > > > Gatttool
> > > > > > > > > > > With gattool, i can connect, get the services, enable a notification,
> > > > > > > > > > > write a value and get the expected results seemingly fine
> > > > > > > > > > >
> > > > > > > > > > > Python-gatt (using the bluez dbus api)
> > > > > > > > > > > Im unable to iterate the services, like my app, it takes 30 seconds to
> > > > > > > > > > > get the signal and then swiftly disconnects
> > > > > > > > > > >
> > > > > > > > > > > Gattlib (https://github.com/labapart/gattlib)
> > > > > > > > > > > Gattlib is interesting as it appears to have "borrowed" much of its
> > > > > > > > > > > code directly from bluez.  When built against the system bluez, if the
> > > > > > > > > > > version is > 5.42, it will use the dbus api.  When I do this, again im
> > > > > > > > > > > unable to list services on the watch.  However, if I edit the build to
> > > > > > > > > > > force it to use its internal gatt implementation, which appears to be
> > > > > > > > > > > the same one used by gatttool, then, it IS able to interrogate the
> > > > > > > > > > > watch.
> > > > > > > > > > >
> > > > > > > > > > > I have attached 3 files
> > > > > > > > > > > 1. test python program which should print services, and associated btmon
> > > > > > > > > > > 2. btmon output while using gatttool
> > > > > > > > > > > 3. btmon output running gattlib discover example
> > > > > > > > > > >
> > > > > > > > > > > Note, other than discovery, I havnt been able to get gattlib to
> > > > > > > > > > > read/write/notify!
> > > > > > > > > > >
> > > > > > > > > > > It seems as though I may be triggering a bug in the bluez dbus api?
> > > > > > > > > > > Can anyone suggest anything?
> > > > > > > > > >
> > > > > > > > > > What version are you using? I would first try with the latest to see
> > > > > > > > > > if that something already fixed.
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > Im using 5.63 already, which is the latest tag (on opensuse tumbleweed)
> > > > > > > > >
> > > > > > > > > I'll also try bluetoothctl and attach logs using that, though I
> > > > > > > > > suspect it will behave the same as the python library and my own
> > > > > > > > > library.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Attached is the output of btmon while using bluetoothctl
> > > > > > > >
> > > > > > > > bluetoothctl behaves the same as my lib and python, it is unable to
> > > > > > > > list services, and after a while, emits the ServicesResolved and
> > > > > > > > disconnected messages at the same time.  Im sure it should be able to
> > > > > > > > list the services immediately after connect just like gatttool can.
> > > > > > >
> > > > > > > Looks like there is multiple rounds of MTU Exchange, not sure if that
> > > > > > > is actually a problem but the spec does say it shall only be sent once
> > > > > > > per client:
> > > > > > >
> > > > > > > BLUETOOTH CORE SPECIFICATION Version 5.3 | Vol 3, Part F
> > > > > > > page 1424:
> > > > > > >
> > > > > > > This request shall only be sent once during a connection by the client.
> > > > > > >
> > > > > > > There is also no response to frame #30:
> > > > > > > < ACL Data TX: Handle 3585 flags 0x00 dlen 7
> > > > > > >
> > > > > > >                            #30 [hci0] 26.641557
> > > > > > >       ATT: Read Request (0x0a) len 2
> > > > > > >         Handle: 0x0018
> > > > > > >
> > > > > > > So after 30 seconds (ATT timeout) without receiving any response it disconnects:
> > > > > > >
> > > > > >
> > > > > > So, the verdict is that the watch isnt acting to spec right?
> > > > > >
> > > > > > Why does gatttool work ok, is it a completely different implementation?
> > > > > >
> > > > > > I understand if wouldnt be to spec, but would it be possible to make
> > > > > > bluez more resilient to devices not acting to spec?  Android and iOS
> > > > > > work just fine in this regard, so could bluez handle mis-behaving
> > > > > > devices more flexibly?
> > > > >
> > > > > That I can't really explain, perhaps it is timing related, something
> > > > > with Exchange MTU since it appears to stop the device from responding
> > > > > when it happens a second time.
> > > > >
> > > > > > Do you have any suggestions for things I could try? I looked for
> > > > > > similar lines in the working gatttool log, and it doesnt have anything
> > > > > > like that, seems to send flags 0x00 dlen 9 (instead of 7?)  ... how is
> > > > > > it behaving differently?
> > > > >
> > > > > Not sure really, does Android/iOS Exchange the MTU? Maybe we need a
> > > > > timer to start it later or perhaps the problem first response to
> > > > > exchange MTU does actually use the final_mtu which makes the watch to
> > > > > trigger yet another exchange to have both rx and tx MTU the same so
> > > > > try with the following change:
> > > > >
> > > > > diff --git a/src/shared/gatt-server.c b/src/shared/gatt-server.c
> > > > > index 2adb4afbf..d326782bf 100644
> > > > > --- a/src/shared/gatt-server.c
> > > > > +++ b/src/shared/gatt-server.c
> > > > > @@ -1499,7 +1499,7 @@ static void exchange_mtu_cb(struct bt_att_chan
> > > > > *chan, uint8_t opcode,
> > > > >         final_mtu = MAX(MIN(client_rx_mtu, server->mtu), BT_ATT_DEFAULT_LE_MTU);
> > > > >
> > > > >         /* Respond with the server MTU */
> > > > > -       put_le16(server->mtu, rsp_pdu);
> > > > > +       put_le16(final_mtu, rsp_pdu);
> > > > >         bt_att_chan_send_rsp(chan, BT_ATT_OP_MTU_RSP, rsp_pdu, 2);
> > > > >
> > > > >         /* Set MTU to be the minimum */
> > > >
> > > > Hmm Im not sure if this will work since the peripheral seems to
> > > > respond different values 252 vs 247, also the spec does say that:
> > > >
> > > > 'The Server Rx MTU parameter shall be set to the *maximum size* of the
> > > > Attribute protocol PDU that the server can receive.
> > > > The server and client shall set ATT_MTU to the *minimum of the Client Rx MTU
> > > > and the Server Rx MTU*. The size is the same to ensure that a client can
> > > > correctly detect the final packet of a long attribute read.'
> > > >
> > > > So my interpretation is that the minimum is calculated after the
> > > > Exchange is complete so it doesn't require the Server MTU to be
> > > > limited by the Client MTU, anyway if Android and iOS does apply the
> > > > minimum logic before responding we can do the same.
> > > >
> > >
> > > Maybe it will help if I attach an android packet capture....
> > >
> > > The attachedhttps://marc.info/?l=linux-bluetooth&m=164799909020040&w=2
> > > log can be opened in Wireshark, and to my untrained eye, it looks like
> > > the MTU negotiation is at packets 451 and 452, and 247 is used?
> > >
> > > Ill try and get the proposed patch built and see how it behaves
> >
> > Attached if the btmon and bluetoothctl.  It doesnt seem to be there quite yet.
> >
> > There was one point before i applied the patch where bluetoothctl
> > seemed to list the attributes quickly, but i havnt been able to
> > reproduce that again with or without the patch.
> >
>
> For completeness, also attached the output of my program and btmon
>
> My program should connect, wait for resolved signal, then read a char,
> enable some notifications, and do a write.  You can see the 30 second
> wait between connect, resolved, and quickly followed by a disconnect.


< ACL Data TX: Handle 3585 flags 0x00 dlen 7

                           #22 [hci0] 12.507730
      ATT: Exchange MTU Request (0x02) len 2
        Client RX MTU: 517
> ACL Data RX: Handle 3585 flags 0x02 dlen 7                                                                                                                             #23 [hci0] 12.556081
      ATT: Exchange MTU Request (0x02) len 2
        Client RX MTU: 247
< ACL Data TX: Handle 3585 flags 0x00 dlen 7

                           #24 [hci0] 12.556256
      ATT: Exchange MTU Response (0x03) len 2
        Server RX MTU: 247
> ACL Data RX: Handle 3585 flags 0x02 dlen 7                                                                                                                             #27 [hci0] 12.655972
      ATT: Exchange MTU Response (0x03) len 2
        Server RX MTU: 252

So we are now responding with 247 and the peripheral responds with 252
to our request :/, so we would need to probably delay our request or
something, that said we are the central so I really which we don't
have to do it since that would penalize well behaving devices, could
we perhaps inform the vendor about these issues? I'd considered this
to be really bad behavior from the remote side since they are not
following the spec in many respects as even their MTU changes from
request to response and it does multiple rounds of Exchange MTU and
stop responding while doing it.

>
>
> > Thanks
> >
> >
> > >
> > > Thanks
> > >
> > > > >
> > > > > >
> > > > > > > < HCI Command: Disconnect (0x01|0x0006) plen 3
> > > > > > >
> > > > > > >                            #48 [hci0] 58.673128
> > > > > > >         Handle: 3585
> > > > > > >         Reason: Remote User Terminated Connection (0x13)
> > > > > > >
> > > > > > > > Thanks
> > > > > > > >
> > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > Luiz Augusto von Dentz
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Luiz Augusto von Dentz
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Luiz Augusto von Dentz
> > > >
> > > >
> > > >
> > > > --
> > > > Luiz Augusto von Dentz



-- 
Luiz Augusto von Dentz
