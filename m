Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69FBC4D14C6
	for <lists+linux-bluetooth@lfdr.de>; Tue,  8 Mar 2022 11:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244338AbiCHKbC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 8 Mar 2022 05:31:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242030AbiCHKbB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 8 Mar 2022 05:31:01 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663E53C492
        for <linux-bluetooth@vger.kernel.org>; Tue,  8 Mar 2022 02:30:02 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 8637C4000A;
        Tue,  8 Mar 2022 10:30:00 +0000 (UTC)
Message-ID: <1494b7b733480882272c16c402115c247bd7dd61.camel@hadess.net>
Subject: Re: Lenovo Legion M600 wireless bluetooth mouse connected and
 paired yet not working
From:   Bastien Nocera <hadess@hadess.net>
To:     Andrey Butirsky <butirsky@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Date:   Tue, 08 Mar 2022 11:30:00 +0100
In-Reply-To: <12462d5d-b140-6b08-2e72-d8fd77105086@gmail.com>
References: <f610b069-07ab-1004-e8f1-b84533593c92@gmail.com>
         <CABBYNZLA6bRCxd=Tse_XbUT8ReBo4QjvstSassfQAcTX+Fk9_g@mail.gmail.com>
         <b50b9b75-96ea-0d93-3687-3a79cdec5419@gmail.com>
         <CABBYNZKAUMOZ8vhk2ATPOaVHbcqCTg-DMD2vypkx_CTOjeVg2g@mail.gmail.com>
         <6bec2be7-a411-c5bf-6e5d-b3efee33b834@gmail.com>
         <CABBYNZLAZGoB1JKW63SNJuFB-4raDvHjjEk4w8y0K1MLwe4b7A@mail.gmail.com>
         <b7a2b073-fd69-36a4-6ce0-cb1b942ccde6@gmail.com>
         <CABBYNZKjUYAqctfpap2f36TcBuJFk0wX5P8jkUjpw1qqupeb0A@mail.gmail.com>
         <72b3b0ee-cca0-3804-ce78-1345c4590963@gmail.com>
         <CABBYNZJL4YCpXHL8ihSFh04fEGAqcB7K8a9aR22E6TwB2Wj0Tg@mail.gmail.com>
         <12462d5d-b140-6b08-2e72-d8fd77105086@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Sat, 2022-02-19 at 00:26 +0300, Andrey Butirsky wrote:
> Hi Luiz,
> 
> On 2/19/2022 12:15 AM, Luiz Augusto von Dentz wrote:
> > Hi Andrey,
> > 
> > On Fri, Feb 18, 2022 at 3:55 AM Andrey Butirsky
> > <butirsky@gmail.com> wrote:
> > > 
> > > Important addition: the mouse does work on Android 8.10.
> > > 
> > > Does it mean Android has that special HID driver that missed on
> > > Linux?
> > > 8.10 came out long before the mouse even existed..
> > > 
> > > Do you have explanation?
> > No, in fact android seems to also be using UHID, does it uses a
> > vendor
> > app to set it up?
> 
> No, it just works right away after connecting from Settings.
> 
> Also, the mouse works on Windows, without additional software. It's 
> detected as "Bluetooth Low Energy GATT compliant HID device" there.
> 

Can you please try using "hid-recorder" to capture the HID output out
of the device? It would show us whether we're receiving any events from
the device, and allow us to test whether there are problems at the HID
level on other machines.

Cheers
