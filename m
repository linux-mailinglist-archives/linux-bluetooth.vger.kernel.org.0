Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7364710C5B7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 Nov 2019 10:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfK1JMZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 28 Nov 2019 04:12:25 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:41461 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfK1JMZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 28 Nov 2019 04:12:25 -0500
Received: by mail-io1-f67.google.com with SMTP id z26so24642882iot.8
        for <linux-bluetooth@vger.kernel.org>; Thu, 28 Nov 2019 01:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HLR6WLMzuyNUhbluWUBQv7/n0cYqj8CN19gux9WGRIM=;
        b=m+4/fSxxhFnGEl50qa2ar8cDwEUt/9Ym/Jb99P4+I19x2OrNAqQMymydRrnF4f3O4K
         XePcrUEQxLoYlgRFZrdgDk2JlXKEAwNKDcHAyTCOF3Kxy5g3OakBWHFxhrzcx5pmvIw3
         ygyG81hAVyLQVyRzplI9OtHy3fqzuyBAhfxPrA97NjzcqxdKsDAIPE5txNu7u1HVgIFA
         hzyx6HAeT37hfOID5Ras54ERVB4zdRSVnpgc6RLBjCBL88/BPRiWQzs/53ivL1F2fGO7
         q00PKynzZVTrKzc8ngpvqBPq4f/BimmPzg0pxWCf1mhUYp0KhWdivjxnOmPKnTu9Y3y/
         hSGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HLR6WLMzuyNUhbluWUBQv7/n0cYqj8CN19gux9WGRIM=;
        b=ct5xD1H/Xxoon1DTOokPXTQ1KHvqI0Y38oGTmc+x34UzqNxNfO4aVL9qdUmmszLEum
         BJHRSVd9jiiOyZgvxiL3V5TiLuZQip4NlbSzFP8X68nemOnk7O3oa7EDkZeaycZEDNHg
         uajzLyIu67NmusUd+s6h7LJf01b24xDPCYa14KzTfWBNtVnRPJkrsSuJchDIiPsApkLW
         c4fVy/MzdEjG6HMSTYkcrLqNoUFPBg16abCZaiCCMQX8OrWKc/SSSGENShWGn7s8F8/x
         8shP4iF1TUfqNJ1JowtO7Y7+hySn6UgRFqvuoyFfDX//WQJJycA3uJn+/T7Pl12TeNdV
         J/GQ==
X-Gm-Message-State: APjAAAVWJp0Pd0xzARw6r8qKFPtRL5FkdTEh62fNQBm1GVD+zgIJK5++
        ohpwd5xL1Fp5ejroUGl2GvI7Jv1PHix2rbUWyno=
X-Google-Smtp-Source: APXvYqy6KuxU9mnbbMAGItu+sK3fSfoB6l/liNquT968tp2lqLKARRnXWSCCYcmUp3JzrPd9Nb5pt1ikUp6/irE3bY4=
X-Received: by 2002:a02:cd31:: with SMTP id h17mr179922jaq.94.1574932342573;
 Thu, 28 Nov 2019 01:12:22 -0800 (PST)
MIME-Version: 1.0
References: <20191113033857.3508-1-sathish.narasimman@intel.com> <74403892-771B-4690-90DC-A88AB5107A60@holtmann.org>
In-Reply-To: <74403892-771B-4690-90DC-A88AB5107A60@holtmann.org>
From:   Sathish Narasimman <nsathish41@gmail.com>
Date:   Thu, 28 Nov 2019 14:42:11 +0530
Message-ID: <CAOVXEJKQTnHo-RK+xMb=+yB_u-LL9FmWJmguZN3gp3qOTUz=9A@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: btusb: hci_event: handle msbc audio over
 USB Endpoints
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Sathish Narasimman <sathish.narasimman@intel.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Hsin-Yu Chao <hychao@chromium.org>,
        Amit K Bag <amit.k.bag@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel


On Fri, Nov 22, 2019 at 6:15 PM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Sathish,
>
> > For msbc encoded audio stream over usb transport, btusb driver
> > to be set to alternate settings 6 as per BT core spec 5.0. This
> > done from  hci_sync_conn_complete_evt.  The type of air mode is known
> > during this event.  For this reason the btusb is to be notifed
> > about the TRANSPARENT air mode and the ALT setting 6 is selected.
> > The changes are made considering some discussion over the similar
> > patch submitted earlier from Kuba Pawlak(link below)
> > https://www.spinics.net/lists/linux-bluetooth/msg64577.html
> >
> > (am from https://www.spinics.net/lists/linux-bluetooth/msg76982.html)
> >
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
> > Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> > Signed-off-by: Hsin-Yu Chao <hychao@chromium.org>
> > Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> > ---
> > drivers/bluetooth/btusb.c        | 157 ++++++++++++++++++++++++-------
> > include/net/bluetooth/hci.h      |   7 +-
> > include/net/bluetooth/hci_core.h |   3 +
> > net/bluetooth/hci_conn.c         |   2 -
> > net/bluetooth/hci_event.c        |   9 ++
> > 5 files changed, 137 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index 04a139e7793f..7a4260757822 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -483,6 +483,8 @@ struct btusb_data {
> >       __u8 cmdreq;
> >
> >       unsigned int sco_num;
> > +     unsigned int air_mode;
> > +     bool usb_alt6_packet_flow;
> >       int isoc_altsetting;
> >       int suspend_count;
> >
> > @@ -974,6 +976,42 @@ static void btusb_isoc_complete(struct urb *urb)
> >       }
> > }
> >
> > +static inline void __fill_isoc_descriptor_msbc(struct urb *urb, int len,
> > +                                            int mtu, bool packet_flow)
> > +{
> > +     int i, offset = 0;
> > +     unsigned int interval;
> > +
> > +     /* For msbc ALT 6 setting the host will send the packet at continuous
> > +      * flow. As per core spec 5, vol 4, part B, table 2.1. For ALT setting
> > +      * 6 the HCI PACKET INTERVAL should be 7.5ms for every usb packets.
> > +      * To maintain the rate we send 63bytes of usb packets alternatively for
> > +      * 7ms and 8ms to maintain the rate as 7.5ms.
> > +      */
> > +     if (packet_flow) {
> > +             interval = 7;
> > +             packet_flow = false;
> > +     } else {
> > +             interval = 6;
> > +             packet_flow = true;
> > +     }
> > +
> > +     BT_DBG("interval:%d len %d mtu %d", interval, len, mtu);
> > +
> > +     for (i = 0; i < interval; i++) {
> > +             urb->iso_frame_desc[i].offset = offset;
> > +             urb->iso_frame_desc[i].length = offset;
> > +     }
> > +
> > +     if (len && i < BTUSB_MAX_ISOC_FRAMES) {
> > +             urb->iso_frame_desc[i].offset = offset;
> > +             urb->iso_frame_desc[i].length = len;
> > +             i++;
> > +     }
> > +
> > +     urb->number_of_packets = i;
> > +}
> > +
> > static inline void __fill_isoc_descriptor(struct urb *urb, int len, int mtu)
> > {
> >       int i, offset = 0;
> > @@ -1376,9 +1414,13 @@ static struct urb *alloc_isoc_urb(struct hci_dev *hdev, struct sk_buff *skb)
> >
> >       urb->transfer_flags  = URB_ISO_ASAP;
> >
> > -     __fill_isoc_descriptor(urb, skb->len,
> > +     if (data->isoc_altsetting == 6)
> > +             __fill_isoc_descriptor_msbc(urb, skb->len,
> > +                            le16_to_cpu(data->isoc_tx_ep->wMaxPacketSize),
> > +                            data->usb_alt6_packet_flow);
> > +     else
> > +             __fill_isoc_descriptor(urb, skb->len,
> >                              le16_to_cpu(data->isoc_tx_ep->wMaxPacketSize));
> > -
> >       skb->dev = (void *)hdev;
> >
> >       return urb;
> > @@ -1474,6 +1516,7 @@ static void btusb_notify(struct hci_dev *hdev, unsigned int evt)
> >
> >       if (hci_conn_num(hdev, SCO_LINK) != data->sco_num) {
> >               data->sco_num = hci_conn_num(hdev, SCO_LINK);
> > +             data->air_mode = evt;
> >               schedule_work(&data->work);
> >       }
> > }
> > @@ -1521,11 +1564,70 @@ static inline int __set_isoc_interface(struct hci_dev *hdev, int altsetting)
> >       return 0;
> > }
> >
> > +static int bt_switch_alt_setting(struct hci_dev *hdev, int new_alts)
> > +{
> > +     struct btusb_data *data = hci_get_drvdata(hdev);
> > +     int err;
> > +
> > +     if (data->isoc_altsetting != new_alts) {
> > +             unsigned long flags;
> > +
> > +             clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
> > +             usb_kill_anchored_urbs(&data->isoc_anchor);
> > +
> > +             /* When isochronous alternate setting needs to be
> > +              * changed, because SCO connection has been added
> > +              * or removed, a packet fragment may be left in the
> > +              * reassembling state. This could lead to wrongly
> > +              * assembled fragments.
> > +              *
> > +              * Clear outstanding fragment when selecting a new
> > +              * alternate setting.
> > +              */
> > +             spin_lock_irqsave(&data->rxlock, flags);
> > +             kfree_skb(data->sco_skb);
> > +             data->sco_skb = NULL;
> > +             spin_unlock_irqrestore(&data->rxlock, flags);
> > +
> > +             err = __set_isoc_interface(hdev, new_alts);
> > +             if (err < 0)
> > +                     return err;
> > +     }
> > +     if (!test_and_set_bit(BTUSB_ISOC_RUNNING, &data->flags)) {
> > +             if (btusb_submit_isoc_urb(hdev, GFP_KERNEL) < 0)
> > +                     clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
> > +             else
> > +                     btusb_submit_isoc_urb(hdev, GFP_KERNEL);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static struct usb_host_interface *btusb_find_altsetting(struct btusb_data *data, int alt)
> > +{
> > +     struct usb_interface *intf = data->isoc;
> > +     int i;
> > +
> > +     BT_DBG("Looking for Alt no :%d", alt);
> > +
> > +     if (intf == NULL) {
> > +             BT_ERR("INterface NULL");
> > +             return NULL;
> > +     }
> > +
> > +     for (i = 0; i < intf->num_altsetting; i++) {
> > +             if (intf->altsetting[i].desc.bAlternateSetting == alt)
> > +                     return &intf->altsetting[i];
> > +     }
> > +
> > +     return NULL;
> > +}
> > +
> > static void btusb_work(struct work_struct *work)
> > {
> >       struct btusb_data *data = container_of(work, struct btusb_data, work);
> >       struct hci_dev *hdev = data->hdev;
> > -     int new_alts;
> > +     int new_alts = 0;
> >       int err;
> >
> >       if (data->sco_num > 0) {
> > @@ -1540,44 +1642,27 @@ static void btusb_work(struct work_struct *work)
> >                       set_bit(BTUSB_DID_ISO_RESUME, &data->flags);
> >               }
> >
> > -             if (hdev->voice_setting & 0x0020) {
> > -                     static const int alts[3] = { 2, 4, 5 };
> > -
> > -                     new_alts = alts[data->sco_num - 1];
> > -             } else {
> > -                     new_alts = data->sco_num;
> > -             }
> > -
> > -             if (data->isoc_altsetting != new_alts) {
> > -                     unsigned long flags;
> > +             if (data->air_mode == HCI_NOTIFY_ENABLE_SCO_CVSD) {
> > +                     if (hdev->voice_setting & 0x0020) {
> > +                             static const int alts[3] = { 2, 4, 5 };
> >
> > -                     clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
> > -                     usb_kill_anchored_urbs(&data->isoc_anchor);
> > -
> > -                     /* When isochronous alternate setting needs to be
> > -                      * changed, because SCO connection has been added
> > -                      * or removed, a packet fragment may be left in the
> > -                      * reassembling state. This could lead to wrongly
> > -                      * assembled fragments.
> > -                      *
> > -                      * Clear outstanding fragment when selecting a new
> > -                      * alternate setting.
> > -                      */
> > -                     spin_lock_irqsave(&data->rxlock, flags);
> > -                     kfree_skb(data->sco_skb);
> > -                     data->sco_skb = NULL;
> > -                     spin_unlock_irqrestore(&data->rxlock, flags);
> > +                             new_alts = alts[data->sco_num - 1];
> > +                     } else {
> > +                             new_alts = data->sco_num;
> > +                     }
> > +             } else if (data->air_mode == HCI_NOTIFY_ENABLE_SCO_TRANSP) {
> >
> > -                     if (__set_isoc_interface(hdev, new_alts) < 0)
> > -                             return;
> > -             }
> > +                     data->usb_alt6_packet_flow = true;
> >
> > -             if (!test_and_set_bit(BTUSB_ISOC_RUNNING, &data->flags)) {
> > -                     if (btusb_submit_isoc_urb(hdev, GFP_KERNEL) < 0)
> > -                             clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
> > +                     /* Check if Alt 6 is supported for Transparent audio*/
> > +                     if (btusb_find_altsetting(data, 6))
> > +                             new_alts = 6;
> >                       else
> > -                             btusb_submit_isoc_urb(hdev, GFP_KERNEL);
> > +                             BT_ERR("%s Device does not support ALT setting 6", hdev->name);
> >               }
> > +
> > +             if (bt_switch_alt_setting(hdev, new_alts) < 0)
> > +                     BT_ERR("%s Set USB Alt: %d failed!", hdev->name, new_alts);
> >       } else {
> >               clear_bit(BTUSB_ISOC_RUNNING, &data->flags);
> >               usb_kill_anchored_urbs(&data->isoc_anchor);
> > diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> > index 5bc1e30dedde..8183394c2cc0 100644
> > --- a/include/net/bluetooth/hci.h
> > +++ b/include/net/bluetooth/hci.h
> > @@ -49,9 +49,10 @@
> > #define HCI_DEV_SETUP                 9
> >
> > /* HCI notify events */
> > -#define HCI_NOTIFY_CONN_ADD          1
> > -#define HCI_NOTIFY_CONN_DEL          2
> > -#define HCI_NOTIFY_VOICE_SETTING     3
> > +#define HCI_NOTIFY_ENABLE_SCO_CVSD   1
> > +#define HCI_NOTIFY_ENABLE_SCO_TRANSP 2
> > +#define HCI_NOTIFY_CONN_DEL          3
> > +#define HCI_NOTIFY_VOICE_SETTING     4
>
> hmmm. Can we keep CONN_ADD and CONN_DEL for the ACL and LE links. And then introduce ENABLE_SCO_CVSD, ENABLE_SCO_TRANSP and DISABLE_SCO. Right now this patch creates an imbalance.
we have HCI_NOTIFY_CONN_DEL what is the reason the use DISABLE_SCO.
where we need to notify this. Do I miss something?
>
> And we need to split the core changes and the USB driver changes into separate patches.
will split it and update the next version
>
> Regards
>
> Marcel
>

Regards
Sathish N
