Return-Path: <linux-bluetooth+bounces-10614-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C4A41599
	for <lists+linux-bluetooth@lfdr.de>; Mon, 24 Feb 2025 07:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D2E33B1B71
	for <lists+linux-bluetooth@lfdr.de>; Mon, 24 Feb 2025 06:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FCB20ADC7;
	Mon, 24 Feb 2025 06:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gz59kaOG"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D8F17D2;
	Mon, 24 Feb 2025 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740379477; cv=none; b=RwzPWt3mBIrUPYda8R3ALzk2h787jaGgbEPVqzEy8ScE4aTL0ijRR0Dl/RuqmfgDH19Gv3MSQPEDvcv+vM+gG/LfbNQVP5+sOGBDlpIeTp48Kp+4ib+lY1DV0a5toBQIvTnBBkwkwfwDRtwEFc2rtIMN+yZbFWoohX5sWuhHhN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740379477; c=relaxed/simple;
	bh=fMNQQjdMT3YCgpRTOmbRDiWawMwJ98iX5QpK1r/vwTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9AnQGEmXvK7gQYgyYEy+gcVjEI5UZOC3swZqr6yox6QPsXKSLyXb6eQQbNTm06JqrX3IMaKn4kuYc3bAcCdOqjU+pyTX6aZzz6fikiSaBmjJoGiJrpWPHVNuC0UI2/PRZFQsl6NftnjFGzElYRpSR0RWisicbkanF4rMcEGIKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Gz59kaOG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19470C4CED6;
	Mon, 24 Feb 2025 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740379476;
	bh=fMNQQjdMT3YCgpRTOmbRDiWawMwJ98iX5QpK1r/vwTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gz59kaOGZvZD5RCXQkTZyRk8lY0uTamnGxQFag4rZ9H6I9jzJSeomUp2NFqs6jRA5
	 M5Cl+kBd2txduAtPnIjpbQZhOBpGd8s5Dk680NgOkt8dQtGY7m++SNcV+uEJUMVq/W
	 W3D9PQIs5qCP2wqR6h15A3/Rv2a+jaZEUluFTEdw=
Date: Mon, 24 Feb 2025 07:44:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hsin-chen Chuang <chharry@google.com>
Cc: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com,
	chromeos-bluetooth-upstreaming@chromium.org,
	Hsin-chen Chuang <chharry@chromium.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Ying Hsu <yinghsu@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Bluetooth: btusb: Configure altsetting for
 USER_CHANNEL
Message-ID: <2025022407-polo-disgrace-9655@gregkh>
References: <20250224045237.1290971-1-chharry@google.com>
 <2025022431-ditto-shy-c62f@gregkh>
 <CADg1FFeW5EXOJTqTS+jwBphGnDSCreNwM8hcFOhB1Tatdti6QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADg1FFeW5EXOJTqTS+jwBphGnDSCreNwM8hcFOhB1Tatdti6QA@mail.gmail.com>

On Mon, Feb 24, 2025 at 02:25:52PM +0800, Hsin-chen Chuang wrote:
> Hi Greg,
> 
> On Mon, Feb 24, 2025 at 2:10 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Feb 24, 2025 at 12:52:32PM +0800, Hsin-chen Chuang wrote:
> > > From: Hsin-chen Chuang <chharry@chromium.org>
> > >
> > > Automatically configure the altsetting for USER_CHANNEL when a SCO is
> > > connected. This adds support for the USER_CHANNEL to transfer SCO data
> > > over USB transport.
> > >
> > > Fixes: b16b327edb4d ("Bluetooth: btusb: add sysfs attribute to control USB alt setting")
> > > Signed-off-by: Hsin-chen Chuang <chharry@chromium.org>
> > > ---
> > >
> > > Changes in v2:
> > > - Give up tracking the SCO handles. Only configure the altsetting when
> > >   SCO connected.
> > > - Put the change behind Kconfig/module parameter
> > >
> > >  drivers/bluetooth/Kconfig | 11 ++++++++++
> > >  drivers/bluetooth/btusb.c | 46 +++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 57 insertions(+)
> > >
> > > diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
> > > index 4ab32abf0f48..7c497f878732 100644
> > > --- a/drivers/bluetooth/Kconfig
> > > +++ b/drivers/bluetooth/Kconfig
> > > @@ -56,6 +56,17 @@ config BT_HCIBTUSB_POLL_SYNC
> > >         Say Y here to enable USB poll_sync for Bluetooth USB devices by
> > >         default.
> > >
> > > +config BT_HCIBTUSB_AUTO_SET_ISOC_ALT
> > > +     bool "Auto set isoc_altsetting for USER_CHANNEL when SCO connected"
> > > +     depends on BT_HCIBTUSB
> > > +     default n
> > > +     help
> > > +       Say Y here to enable auto set isoc_altsetting for USER_CHANNEL
> > > +       when SCO connected
> > > +
> > > +       This can be overridden by passing btusb.auto_set_isoc_alt=[y|n]
> > > +       on the kernel commandline.
> > > +
> > >  config BT_HCIBTUSB_BCM
> > >       bool "Broadcom protocol support"
> > >       depends on BT_HCIBTUSB
> > > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > > index de3fa725d210..af93d757911b 100644
> > > --- a/drivers/bluetooth/btusb.c
> > > +++ b/drivers/bluetooth/btusb.c
> > > @@ -34,6 +34,8 @@ static bool force_scofix;
> > >  static bool enable_autosuspend = IS_ENABLED(CONFIG_BT_HCIBTUSB_AUTOSUSPEND);
> > >  static bool enable_poll_sync = IS_ENABLED(CONFIG_BT_HCIBTUSB_POLL_SYNC);
> > >  static bool reset = true;
> > > +static bool auto_set_isoc_alt =
> > > +     IS_ENABLED(CONFIG_BT_HCIBTUSB_AUTO_SET_ISOC_ALT);
> > >
> > >  static struct usb_driver btusb_driver;
> > >
> > > @@ -1113,6 +1115,42 @@ static inline void btusb_free_frags(struct btusb_data *data)
> > >       spin_unlock_irqrestore(&data->rxlock, flags);
> > >  }
> > >
> > > +static void btusb_sco_connected(struct btusb_data *data, struct sk_buff *skb)
> > > +{
> > > +     struct hci_event_hdr *hdr = (void *) skb->data;
> > > +     struct hci_ev_sync_conn_complete *ev =
> > > +             (void *) skb->data + sizeof(*hdr);
> > > +     struct hci_dev *hdev = data->hdev;
> > > +     unsigned int notify_air_mode;
> > > +
> > > +     if (hci_skb_pkt_type(skb) != HCI_EVENT_PKT)
> > > +             return;
> > > +
> > > +     if (skb->len < sizeof(*hdr) || hdr->evt != HCI_EV_SYNC_CONN_COMPLETE)
> > > +             return;
> > > +
> > > +     if (skb->len != sizeof(*hdr) + sizeof(*ev) || ev->status)
> > > +             return;
> > > +
> > > +     switch (ev->air_mode) {
> > > +     case BT_CODEC_CVSD:
> > > +             notify_air_mode = HCI_NOTIFY_ENABLE_SCO_CVSD;
> > > +             break;
> > > +
> > > +     case BT_CODEC_TRANSPARENT:
> > > +             notify_air_mode = HCI_NOTIFY_ENABLE_SCO_TRANSP;
> > > +             break;
> > > +
> > > +     default:
> > > +             return;
> > > +     }
> > > +
> > > +     bt_dev_info(hdev, "enabling SCO with air mode %u", ev->air_mode);
> > > +     data->sco_num = 1;
> > > +     data->air_mode = notify_air_mode;
> > > +     schedule_work(&data->work);
> > > +}
> > > +
> > >  static int btusb_recv_event(struct btusb_data *data, struct sk_buff *skb)
> > >  {
> > >       if (data->intr_interval) {
> > > @@ -1120,6 +1158,11 @@ static int btusb_recv_event(struct btusb_data *data, struct sk_buff *skb)
> > >               schedule_delayed_work(&data->rx_work, 0);
> > >       }
> > >
> > > +     /* Configure altsetting for HCI_USER_CHANNEL on SCO connected */
> > > +     if (auto_set_isoc_alt &&
> > > +         hci_dev_test_flag(data->hdev, HCI_USER_CHANNEL))
> > > +             btusb_sco_connected(data, skb);
> > > +
> > >       return data->recv_event(data->hdev, skb);
> > >  }
> > >
> > > @@ -4354,6 +4397,9 @@ MODULE_PARM_DESC(enable_autosuspend, "Enable USB autosuspend by default");
> > >  module_param(reset, bool, 0644);
> > >  MODULE_PARM_DESC(reset, "Send HCI reset command on initialization");
> > >
> > > +module_param(auto_set_isoc_alt, bool, 0644);
> > > +MODULE_PARM_DESC(auto_set_isoc_alt, "Auto set isoc_altsetting for USER_CHANNEL when SCO connected");
> >
> > This is not the 1990's, why are you adding new module parameters when we
> > have so many other more proper ways to do this?  And really, this would
> 
> Sorry but could you please provide an example to guard a feature like this.

Depends on what you want to do with this configuration.  Why is it an
option at all?  Why can't it "just work"?  Module parameters are a pain
to configure, we have loads of other ways to do this now (configfs,
debugfs for debugging stuff, sysfs for device-specific things, etc.)

> > not work at all for multiple controllers in teh same system, right?
> 
> Do you mean we can't have separate parameters for different
> controllers? Yes that's true, but why would a user want the different
> behavior on the same machine?

Why would you prevent them from allowing this to happen for a
device-specific option?

thanks,

greg k-h

