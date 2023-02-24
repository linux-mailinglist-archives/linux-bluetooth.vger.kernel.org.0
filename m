Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5896A2289
	for <lists+linux-bluetooth@lfdr.de>; Fri, 24 Feb 2023 20:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbjBXTxC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 24 Feb 2023 14:53:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjBXTxB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 24 Feb 2023 14:53:01 -0500
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585FA15CB7
        for <linux-bluetooth@vger.kernel.org>; Fri, 24 Feb 2023 11:52:59 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id A5E9E2404A7
        for <linux-bluetooth@vger.kernel.org>; Fri, 24 Feb 2023 20:52:57 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4PNgY50w2Pz9rxK;
        Fri, 24 Feb 2023 20:52:57 +0100 (CET)
Message-ID: <cb4b657b13f21bd9f164a0c205e31e3a2184c6c8.camel@iki.fi>
Subject: Re: [PATCH] Bluetooth: ISO: fix timestamped HCI ISO data packet
 parsing
From:   Pauli Virtanen <pav@iki.fi>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
Date:   Fri, 24 Feb 2023 19:52:56 +0000
In-Reply-To: <CABBYNZ+kGVtCXN1X7ZOG64mLfWfXBah_Qo5+cy2dGWQMbNidoA@mail.gmail.com>
References: <1fd2d4523c139deda93aab2c31f1508d79c32472.1676921889.git.pav@iki.fi>
         <CABBYNZ+kGVtCXN1X7ZOG64mLfWfXBah_Qo5+cy2dGWQMbNidoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NEUTRAL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

ti, 2023-02-21 kello 14:08 -0800, Luiz Augusto von Dentz kirjoitti:
> > Hi Pauli,
> > 
> > On Mon, Feb 20, 2023 at 11:42 AM Pauli Virtanen <pav@iki.fi> wrote:
> > > > 
> > > > Use correct HCI ISO data packet header struct when the packet has
> > > > timestamp. The timestamp, when present, goes before the other fields
> > > > (Core v5.3 4E 5.4.5), so the structs are not compatible.
> > > > 
> > > > Fixes: ccf74f2390d6 ("Bluetooth: Add BTPROTO_ISO socket type")
> > > > Signed-off-by: Pauli Virtanen <pav@iki.fi>
> > > > ---
> > > > 
> > > > Notes:
> > > >     My hardware doesn't seem to produce timestamped packets, so this is not
> > > >     properly tested, except to the extent that it doesn't break the
> > > >     non-timestamped code path.
> > > > 
> > > >     Regardless, the current state of things looks wrong, so sending this to
> > > >     the list in any case.
> > 
> > Perhaps we should first attempt to enable this in the emulator, Id use
> > BT_HCI_CMD_LE_READ_ISO_TX_SYNC as hint that the host is interested in
> > knowing the timestamp:
> > 
> > https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/emulator/btdev.c#n5752

Yes, it probably would be best, and probably not too complicated to do
at least if we are happy with not per spec timestamps.

> > > >  net/bluetooth/iso.c | 9 +++++++--
> > > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
> > > > index 2dabef488eaa..cb959e8eac18 100644
> > > > --- a/net/bluetooth/iso.c
> > > > +++ b/net/bluetooth/iso.c
> > > > @@ -1621,7 +1621,6 @@ static void iso_disconn_cfm(struct
> > > > hci_conn *hcon, __u8 reason)
> > > >  void iso_recv(struct hci_conn *hcon, struct sk_buff *skb, u16
> > > > flags)
> > > >  {
> > > >         struct iso_conn *conn = hcon->iso_data;
> > > > -       struct hci_iso_data_hdr *hdr;
> > > >         __u16 pb, ts, len;
> > > > 
> > > >         if (!conn)
> > > > @@ -1643,6 +1642,8 @@ void iso_recv(struct hci_conn *hcon,
> > > > struct sk_buff *skb, u16 flags)
> > > >                 }
> > > > 
> > > >                 if (ts) {
> > > > +                       struct hci_iso_ts_data_hdr *hdr;
> > > > +
> > > >                         /* TODO: add timestamp to the packet?
> > > > */
> > 
> > Perhaps we should use skb_set_delivery_time to set the timestamp as
> > received by the controller? That said I don't know if the unit
> > would
> > be compatible.

The userspace I think is interested also in the sequence number and
packet status flags (if controller knows data is corrupted, that should
be indicated to userspace, similarly for missed packets). Would e.g.
putting all these into some custom cmsg struct be better here?

This timestamp is also based on controller clock. Not sure if
delivery_time is supposed to be in system clock not some unrelated
hardware clock.

Userspace may also want to set the packet sequence numbers and
timestamps itself when sending, to indicate in which interval it wanted
things to come out.

On systems where synchronization to Controller ISO clock is not
available (it IIUC cannot really be done via HCI and so this is likely
the situation on desktop/laptop machines), userspace needs some other
tool to keep its SDU timing in sync with the controller, and for e.g.
keeping a fixed number of packets queued to have some buffer for missed
deadlines, and making sure there is no timing offset between eg. left
and right earpieces of TWS headset.

This probably means things like information on the timing of the latest
Number of Completed Packets event for the handle, the number of
currently queued ISO packets on the controller, and the sequence number
of the latest packet queued on controller (to know how much is still in
socket buffer). Probably also LE Read TX Sync information to know
controller timestamp on a sent packet...

Does this go via some new ioctls? Or send empty packets with some cmsg
(so userspace can just poll until it needs to do something)?

It should also be decided how much the kernel is going to be involved
in getting the SDU timing, sequence numbers, etc. right, or whether
it's just left to the userspace.

Before trying to propose something here, I think I'd need to first make
some prototypes so that it becomes clearer how it would best work.


> > > >                         hdr = skb_pull_data(skb,
> > > > HCI_ISO_TS_DATA_HDR_SIZE);
> > > >                         if (!hdr) {
> > > > @@ -1650,15 +1651,19 @@ void iso_recv(struct hci_conn *hcon,
> > > > struct sk_buff *skb, u16 flags)
> > > >                                 goto drop;
> > > >                         }
> > > > 
> > > > +                       len = __le16_to_cpu(hdr->slen);
> > > >                 } else {
> > > > +                       struct hci_iso_data_hdr *hdr;
> > > > +
> > > >                         hdr = skb_pull_data(skb,
> > > > HCI_ISO_DATA_HDR_SIZE);
> > > >                         if (!hdr) {
> > > >                                 BT_ERR("Frame is too short (len
> > > > %d)", skb->len);
> > > >                                 goto drop;
> > > >                         }
> > > > +
> > > > +                       len = __le16_to_cpu(hdr->slen);
> > > >                 }
> > > > 
> > > > -               len    = __le16_to_cpu(hdr->slen);
> > > >                 flags  = hci_iso_data_flags(len);
> > > >                 len    = hci_iso_data_len(len);
> > > > 
> > > > --
> > > > 2.39.2
> > > > 
> > 
> > 


