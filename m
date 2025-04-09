Return-Path: <linux-bluetooth+bounces-11603-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C81EA82794
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Apr 2025 16:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4FC24682A5
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Apr 2025 14:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF4B265633;
	Wed,  9 Apr 2025 14:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/8LQaLv"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D619025F7AC;
	Wed,  9 Apr 2025 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744208352; cv=none; b=QZS98bPl0rgMRobeq5hmI3hwQrpnSS3tWliitcWLp72EGuCBVA5WPMJGBI2DoOousdDiPU1KrMZ0xTaEB+OJvz3hXG0JzrfxPflkZKYqdenjcMBN3gry+27O4SNaabH5MlhpIthsp01yo0nwM8lLfU957E+jaSGnVKJ7xWPgIVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744208352; c=relaxed/simple;
	bh=fQRoMrQxm6YC2ITHZsRI3hvFn11/O+lTlM+0mDA5jDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TMyaQ2UVvkz2qCipY6j/tDZLKNiuMKj+WC4+ulMyLbaxTYUv7ACVAXW7P87prQ9QQ1aDMDrr+Vtf3X6Iwr2BFaJBCq+261jo/yq/8TdtQ+KBkk6ghm7gF0s+ZY+QpW5uqGMsykJvkwTu1vZVzInNe/UxfkLkdRS6sam+lZ7P4Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/8LQaLv; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso60108011fa.2;
        Wed, 09 Apr 2025 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744208348; x=1744813148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mkw/BtWtqCCP+eEBGw2QlVqyGpD6mhg20OXkFQqGWoQ=;
        b=b/8LQaLvEgGPJSwAzUKfSrruYSiTi6XN2PRimZyCc+rPF9JCuqxLnRHIIVs0TGv7So
         uolsrJTNf36nVZyAJ5tysppZZ/DBAJbvVeGIXZ6wiqfaqnJZJR4lZacihP//mFaVCkwH
         +ggcYjOHYZ5ofjlyuypLqPMFB72PMYTdoubfsJJJH9QwAUkrJcU75FEACRls0HsE31LJ
         kkYz+OaaPaURsBk5Pmxuh2q5V64XHMr89eYxk3ahO1pq5J1LCgGzIOnLDGtN3Oqc5L+g
         25rrYhtd9P6g5U5x8VpqAMByxNAr7LAiN8gsVvuppngvQIvKhoKeNPOiJg/Gbnjt//T+
         x0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744208348; x=1744813148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mkw/BtWtqCCP+eEBGw2QlVqyGpD6mhg20OXkFQqGWoQ=;
        b=uC8qGBOCjPMOYrFw17+UDiAkA2tpnDM0UqFkCNZI/eBAws/wNCbBOLMRbFxwAeXW1a
         b4k1a+j5KPKGzNoRZO920Z7xU86hcPsR75/I1nhdkVwQH850VrZW8+Vy9KwGAmpBDuFZ
         uVl4zCcCOGxi5Cxf9BBDEwYiDwwN2s4QERPJWncQjE3FOslTd9cEnAum4KkT2v7n8sPS
         oh40OTVog5yRQSRDXEfxi8ViJhMjOZvE8p4Qo7h9CEpd4mpkJvi52BYdDP0MhfgxSEzU
         qOb+KB7tsNa02TYi5M27RNwQT2PMYtWMfeenn1TD9HaywVMyjlt/xTglkMgYQD63Swxt
         Wolw==
X-Forwarded-Encrypted: i=1; AJvYcCUCp/HrfiHJwH4h8V1Pw5FnjqbNzlilGjnQz9U7XjZJXsKCOVTJ2URkcPublcpSimXDMReUHLaVzybpTBaQmwg=@vger.kernel.org, AJvYcCVNvOmwvbCmMqkK1Vgdic862iv77+6lUwHfTsC/KaprvUXTm1UxT0WHhZC7qCub/mVrP83Zy+X+i56cSYEd@vger.kernel.org, AJvYcCXb062m6KaKqN4uVpK8SG9oG910ZE+nC7OHXPKDacElziPK/I69BRZvdmzcXRCm4C+GIH2yliXY@vger.kernel.org
X-Gm-Message-State: AOJu0YygB5u7hVDqibmAUMV5VkMa7Oj1KXGAHOd/iGg6pGMy9hSPxrmp
	EfFmGrkXrPCdNSHp/QkQ4rpaRqzDol+x/DM5bzr+MaBO1bFiL/OTXxwRejMpHHrw+57nFiKdfOl
	CsStVJiVvOySqc6KqwTBfV1oDmF8=
X-Gm-Gg: ASbGncs85JopyCR6RdtWN6U6aK8KXuMZhhgvnsQ/+E1sIz2rMm5lB/4xyGLjmPfGjTU
	vt1TWv71DdHysdNeKt+wWS3LH6TMi4CflExND51UpC6ZmPxjqQaA9be+Xgr36uxFvxVPMkgIn1w
	xqirjv/G0tZx/bBlG/3n1/
X-Google-Smtp-Source: AGHT+IFMvocHpBsTiSFy5TbZt4q4Sk8s/eese8L/gvUz52bEHCXbewrGnv8ZC/Tot9f5py1DB6VAoUQsB/z9OHsDamA=
X-Received: by 2002:a2e:a909:0:b0:308:e54d:61b1 with SMTP id
 38308e7fff4ca-30f450764ecmr10957511fa.34.1744208347647; Wed, 09 Apr 2025
 07:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402162737.3271704-1-chharry@google.com> <CABBYNZJhxZOa30z1jxbnNpYJJb=QM1RZtpnL-Hp+beE_1VOZqg@mail.gmail.com>
 <CADg1FFd2PA-j8ck258i=QUjLD7Ah2PyUjY5rq1s7CcU0M78GiA@mail.gmail.com>
In-Reply-To: <CADg1FFd2PA-j8ck258i=QUjLD7Ah2PyUjY5rq1s7CcU0M78GiA@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 9 Apr 2025 10:18:54 -0400
X-Gm-Features: ATxdqUGkcEMtTTl_yqnFe0mtCN-DqBCGbAy0kr71359GDKtr4ELyqU8Nm46VzKE
Message-ID: <CABBYNZJVre9pGUHyQzG-4Bc8f1RXpiQH6mi+Zn2S=dRfeAa+qw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: Introduce HCI Driver Packet
To: Hsin-chen Chuang <chharry@google.com>
Cc: Hsin-chen Chuang <chharry@chromium.org>, chromeos-bluetooth-upstreaming@chromium.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Marcel Holtmann <marcel@holtmann.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Ying Hsu <yinghsu@chromium.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hsin-chen,

On Thu, Apr 3, 2025 at 8:01=E2=80=AFPM Hsin-chen Chuang <chharry@google.com=
> wrote:
>
> Hi Luiz,
>
> On Fri, Apr 4, 2025 at 4:01=E2=80=AFAM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > Hi Hsin-chen,
> >
> > On Wed, Apr 2, 2025 at 12:28=E2=80=AFPM Hsin-chen Chuang <chharry@googl=
e.com> wrote:
> > >
> > > From: Hsin-chen Chuang <chharry@chromium.org>
> > >
> > > Although commit 75ddcd5ad40e ("Bluetooth: btusb: Configure altsetting
> > > for HCI_USER_CHANNEL") has enabled the HCI_USER_CHANNEL user to send =
out
> > > SCO data through USB Bluetooth chips, it's observed that with the pat=
ch
> > > HFP is flaky on most of the existing USB Bluetooth controllers: Intel
> > > chips sometimes send out no packet for Transparent codec; MTK chips m=
ay
> > > generate SCO data with a wrong handle for CVSD codec; RTK could split
> > > the data with a wrong packet size for Transparent codec; ... etc.
> > >
> > > To address the issue above one needs to reset the altsetting back to
> > > zero when there is no active SCO connection, which is the same as the
> > > BlueZ behavior, and another benefit is the bus doesn't need to reserv=
e
> > > bandwidth when no SCO connection.
> > >
> > > This patch introduces a fundamental solution that lets the user space
> > > program to configure the altsetting freely:
> > > - Define the new packet type HCI_DRV_PKT which is specifically used f=
or
> > >   communication between the user space program and the Bluetooth drvi=
ers
> > > - Define the btusb driver command HCI_DRV_OP_SWITCH_ALT_SETTING which
> > >   indicates the expected altsetting from the user space program
> > > - btusb intercepts the command and adjusts the Isoc endpoint
> > >   correspondingly
> > >
> > > This patch is tested on ChromeOS devices. The USB Bluetooth models
> > > (CVSD, TRANS alt3, and TRANS alt6) could pass the stress HFP test nar=
row
> > > band speech and wide band speech.
> > >
> > > Cc: chromeos-bluetooth-upstreaming@chromium.org
> > > Fixes: b16b327edb4d ("Bluetooth: btusb: add sysfs attribute to contro=
l USB alt setting")
> > > Signed-off-by: Hsin-chen Chuang <chharry@chromium.org>
> > > ---
> > >
> > >  drivers/bluetooth/btusb.c       | 112 ++++++++++++++++++++++++++++++=
++
> > >  drivers/bluetooth/hci_drv_pkt.h |  62 ++++++++++++++++++
> > >  include/net/bluetooth/hci.h     |   1 +
> > >  include/net/bluetooth/hci_mon.h |   2 +
> > >  net/bluetooth/hci_core.c        |   2 +
> > >  net/bluetooth/hci_sock.c        |  12 +++-
> > >  6 files changed, 189 insertions(+), 2 deletions(-)
> > >  create mode 100644 drivers/bluetooth/hci_drv_pkt.h
> > >
> > > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > > index 5012b5ff92c8..644a0f13f8ee 100644
> > > --- a/drivers/bluetooth/btusb.c
> > > +++ b/drivers/bluetooth/btusb.c
> > > @@ -26,6 +26,7 @@
> > >  #include "btbcm.h"
> > >  #include "btrtl.h"
> > >  #include "btmtk.h"
> > > +#include "hci_drv_pkt.h"
> > >
> > >  #define VERSION "0.8"
> > >
> > > @@ -2151,6 +2152,111 @@ static int submit_or_queue_tx_urb(struct hci_=
dev *hdev, struct urb *urb)
> > >         return 0;
> > >  }
> > >
> > > +static int btusb_switch_alt_setting(struct hci_dev *hdev, int new_al=
ts);
> > > +
> > > +static int btusb_drv_process_cmd(struct hci_dev *hdev, struct sk_buf=
f *cmd_skb)
> > > +{
> > > +       struct hci_drv_cmd_hdr *hdr;
> > > +       u16 opcode, cmd_len;
> > > +
> > > +       hdr =3D skb_pull_data(cmd_skb, sizeof(*hdr));
> > > +       if (!hdr)
> > > +               return -EILSEQ;
> > > +
> > > +       opcode =3D le16_to_cpu(hdr->opcode);
> > > +       cmd_len =3D le16_to_cpu(hdr->len);
> > > +       if (cmd_len !=3D cmd_skb->len)
> > > +               return -EILSEQ;
> > > +
> > > +       switch (opcode) {
> > > +       case HCI_DRV_OP_READ_SUPPORTED_DRIVER_COMMANDS: {
> > > +               struct hci_drv_resp_read_supported_driver_commands *r=
esp;
> > > +               struct sk_buff *resp_skb;
> > > +               struct btusb_data *data =3D hci_get_drvdata(hdev);
> > > +               int ret;
> > > +               u16 num_commands =3D 1; /* SUPPORTED_DRIVER_COMMANDS =
*/
> > > +
> > > +               if (data->isoc)
> > > +                       num_commands++; /* SWITCH_ALT_SETTING */
> > > +
> > > +               resp_skb =3D hci_drv_skb_alloc(
> > > +                       opcode, sizeof(*resp) + num_commands * sizeof=
(__le16),
> > > +                       GFP_KERNEL);
> > > +               if (!resp_skb)
> > > +                       return -ENOMEM;
> > > +
> > > +               resp =3D skb_put(resp_skb,
> > > +                              sizeof(*resp) + num_commands * sizeof(=
__le16));
> > > +               resp->status =3D HCI_DRV_STATUS_SUCCESS;
> > > +               resp->num_commands =3D cpu_to_le16(num_commands);
> > > +               resp->commands[0] =3D
> > > +                       cpu_to_le16(HCI_DRV_OP_READ_SUPPORTED_DRIVER_=
COMMANDS);
> > > +
> > > +               if (data->isoc)
> > > +                       resp->commands[1] =3D
> > > +                               cpu_to_le16(HCI_DRV_OP_SWITCH_ALT_SET=
TING);
> > > +
> > > +               ret =3D hci_recv_frame(hdev, resp_skb);
> > > +               if (ret)
> > > +                       return ret;
> > > +
> > > +               kfree_skb(cmd_skb);
> > > +               return 0;
> > > +       }
> >
> > If you have to enclose a case with {} then it probably makes more
> > sense to add a dedicated function to do that, that said it would
> > probably be best to add a struct table that can be used to define
> > supported commands. I also recommend splitting the commit adding the
> > command from the introduction of HCI_DRV_PKT.
> >
> > > +       case HCI_DRV_OP_SWITCH_ALT_SETTING: {
> > > +               struct hci_drv_cmd_switch_alt_setting *cmd;
> > > +               struct hci_drv_resp_status *resp;
> > > +               struct sk_buff *resp_skb;
> > > +               int ret;
> > > +               u8 status;
> > > +
> > > +               resp_skb =3D hci_drv_skb_alloc(opcode, sizeof(*resp),=
 GFP_KERNEL);
> > > +               if (!resp_skb)
> > > +                       return -ENOMEM;
> > > +
> > > +               cmd =3D skb_pull_data(cmd_skb, sizeof(*cmd));
> > > +               if (!cmd || cmd_skb->len || cmd->new_alt > 6) {
> > > +                       status =3D HCI_DRV_STATUS_INVALID_PARAMETERS;
> > > +               } else {
> > > +                       ret =3D btusb_switch_alt_setting(hdev, cmd->n=
ew_alt);
> > > +                       if (ret)
> > > +                               status =3D HCI_DRV_STATUS_UNSPECIFIED=
_ERROR;
> > > +                       else
> > > +                               status =3D HCI_DRV_STATUS_SUCCESS;
> > > +               }
> > > +
> > > +               resp =3D skb_put(resp_skb, sizeof(*resp));
> > > +               resp->status =3D status;
> > > +
> > > +               ret =3D hci_recv_frame(hdev, resp_skb);
> > > +               if (ret)
> > > +                       return ret;
> > > +
> > > +               kfree_skb(cmd_skb);
> > > +               return 0;
> > > +       }
> > > +       default: {
> > > +               struct hci_drv_resp_status *resp;
> > > +               struct sk_buff *resp_skb;
> > > +               int ret;
> > > +
> > > +               resp_skb =3D hci_drv_skb_alloc(opcode, sizeof(*resp),=
 GFP_KERNEL);
> > > +               if (!resp_skb)
> > > +                       return -ENOMEM;
> > > +
> > > +               resp =3D skb_put(resp_skb, sizeof(*resp));
> > > +               resp->status =3D HCI_DRV_STATUS_UNKNOWN_COMMAND;
> > > +
> > > +               ret =3D hci_recv_frame(hdev, resp_skb);
> > > +               if (ret)
> > > +                       return ret;
> > > +
> > > +               kfree_skb(cmd_skb);
> > > +               return 0;
> > > +       }
> > > +       }
> > > +}
> > > +
> > >  static int btusb_send_frame(struct hci_dev *hdev, struct sk_buff *sk=
b)
> > >  {
> > >         struct urb *urb;
> > > @@ -2192,6 +2298,9 @@ static int btusb_send_frame(struct hci_dev *hde=
v, struct sk_buff *skb)
> > >                         return PTR_ERR(urb);
> > >
> > >                 return submit_or_queue_tx_urb(hdev, urb);
> > > +
> > > +       case HCI_DRV_PKT:
> > > +               return btusb_drv_process_cmd(hdev, skb);
> > >         }
> > >
> > >         return -EILSEQ;
> > > @@ -2669,6 +2778,9 @@ static int btusb_send_frame_intel(struct hci_de=
v *hdev, struct sk_buff *skb)
> > >                         return PTR_ERR(urb);
> > >
> > >                 return submit_or_queue_tx_urb(hdev, urb);
> > > +
> > > +       case HCI_DRV_PKT:
> > > +               return btusb_drv_process_cmd(hdev, skb);
> > >         }
> > >
> > >         return -EILSEQ;
> > > diff --git a/drivers/bluetooth/hci_drv_pkt.h b/drivers/bluetooth/hci_=
drv_pkt.h
> > > new file mode 100644
> > > index 000000000000..800e0090f816
> > > --- /dev/null
> > > +++ b/drivers/bluetooth/hci_drv_pkt.h
> > > @@ -0,0 +1,62 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (C) 2025 Google Corporation
> > > + */
> > > +
> > > +#include <net/bluetooth/bluetooth.h>
> > > +#include <net/bluetooth/hci.h>
> > > +
> > > +struct hci_drv_cmd_hdr {
> > > +       __le16  opcode;
> > > +       __le16  len;
> > > +} __packed;
> > > +
> > > +struct hci_drv_resp_hdr {
> > > +       __le16  opcode;
> > > +       __le16  len;
> > > +} __packed;
> > > +
> > > +struct hci_drv_resp_status {
> > > +       __u8    status;
> > > +} __packed;
> > > +
> > > +#define HCI_DRV_STATUS_SUCCESS                 0x00
> > > +#define HCI_DRV_STATUS_UNSPECIFIED_ERROR       0x01
> > > +#define HCI_DRV_STATUS_UNKNOWN_COMMAND         0x02
> > > +#define HCI_DRV_STATUS_INVALID_PARAMETERS      0x03
> > > +
> > > +/* Common commands that make sense on all drivers start from 0x0000.=
 */
> > > +
> > > +#define HCI_DRV_OP_READ_SUPPORTED_DRIVER_COMMANDS      0x0000
> > > +struct hci_drv_resp_read_supported_driver_commands {
> > > +       __u8    status;
> > > +       __le16  num_commands;
> > > +       __le16  commands[];
> > > +} __packed;
> > > +
> > > +/* btusb specific commands start from 0x1135.
> > > + * No particular reason - It's my lucky number.
> > > + */
> > > +
> > > +#define HCI_DRV_OP_SWITCH_ALT_SETTING  0x1135
> >
> > Id actually start from 0x00, each driver can have its own command
>
> If each driver can have its own command opcodes, how could the user
> know which one to begin with?
> I think at least the opcode of the Read Supported Driver Commands
> shall be the same across all drivers. And if we do so, don't we
> reserve some space in case there are more commands that need to be
> shared?

Yeah, the Read Supported Driver Commands shall probably be reserved to
0 and perhaps return the driver name as well so the client understand
the command domain is related to the driver.

> We could make a small change here - not btusb specific, but "driver
> specific" - that is, starting from this code the meaning could be
> different on each driver.
>
> > opcodes, and we can probably add a description to Read Supported
>
> Do you mean a human readable description? I doubt that's really useful
> if we have the opcode well defined and by human readable it's hard for
> the user space program to parse.

I was thinking more for logging though, anyway we could actually have
it decoded and logged directly by the driver itself e.g. via vendor
diagnostic or user message for example.

> > Driver Commands in case it is not clear or for decoding purposes, we
> > could also return some driver info so the upper layers know what is
> > the driver.
> >
> > > +struct hci_drv_cmd_switch_alt_setting {
> > > +       __u8    new_alt;
> > > +} __packed;
> > > +
> > > +static inline struct sk_buff *hci_drv_skb_alloc(u16 opcode, u16 plen=
, gfp_t how)
> > > +{
> > > +       struct hci_drv_resp_hdr *hdr;
> > > +       struct sk_buff *skb;
> > > +
> > > +       skb =3D bt_skb_alloc(sizeof(*hdr) + plen, how);
> > > +       if (!skb)
> > > +               return NULL;
> > > +
> > > +       hdr =3D skb_put(skb, sizeof(*hdr));
> > > +       hdr->opcode =3D __cpu_to_le16(opcode);
> > > +       hdr->len =3D __cpu_to_le16(plen);
> > > +
> > > +       hci_skb_pkt_type(skb) =3D HCI_DRV_PKT;
> > > +
> > > +       return skb;
> > > +}
> > > diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.=
h
> > > index a8586c3058c7..e297b312d2b7 100644
> > > --- a/include/net/bluetooth/hci.h
> > > +++ b/include/net/bluetooth/hci.h
> > > @@ -494,6 +494,7 @@ enum {
> > >  #define HCI_EVENT_PKT          0x04
> > >  #define HCI_ISODATA_PKT                0x05
> > >  #define HCI_DIAG_PKT           0xf0
> > > +#define HCI_DRV_PKT            0xf1
> > >  #define HCI_VENDOR_PKT         0xff
> > >
> > >  /* HCI packet types */
> > > diff --git a/include/net/bluetooth/hci_mon.h b/include/net/bluetooth/=
hci_mon.h
> > > index 082f89531b88..bbd752494ef9 100644
> > > --- a/include/net/bluetooth/hci_mon.h
> > > +++ b/include/net/bluetooth/hci_mon.h
> > > @@ -51,6 +51,8 @@ struct hci_mon_hdr {
> > >  #define HCI_MON_CTRL_EVENT     17
> > >  #define HCI_MON_ISO_TX_PKT     18
> > >  #define HCI_MON_ISO_RX_PKT     19
> > > +#define HCI_MON_DRV_TX_PKT     20
> > > +#define HCI_MON_DRV_RX_PKT     21
> > >
> > >  struct hci_mon_new_index {
> > >         __u8            type;
> > > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > > index 5eb0600bbd03..bb4e1721edc2 100644
> > > --- a/net/bluetooth/hci_core.c
> > > +++ b/net/bluetooth/hci_core.c
> > > @@ -2911,6 +2911,8 @@ int hci_recv_frame(struct hci_dev *hdev, struct=
 sk_buff *skb)
> > >                 break;
> > >         case HCI_ISODATA_PKT:
> > >                 break;
> > > +       case HCI_DRV_PKT:
> > > +               break;
> > >         default:
> > >                 kfree_skb(skb);
> > >                 return -EINVAL;
> > > diff --git a/net/bluetooth/hci_sock.c b/net/bluetooth/hci_sock.c
> > > index 022b86797acd..428ee5c7de7e 100644
> > > --- a/net/bluetooth/hci_sock.c
> > > +++ b/net/bluetooth/hci_sock.c
> > > @@ -234,7 +234,8 @@ void hci_send_to_sock(struct hci_dev *hdev, struc=
t sk_buff *skb)
> > >                         if (hci_skb_pkt_type(skb) !=3D HCI_EVENT_PKT =
&&
> > >                             hci_skb_pkt_type(skb) !=3D HCI_ACLDATA_PK=
T &&
> > >                             hci_skb_pkt_type(skb) !=3D HCI_SCODATA_PK=
T &&
> > > -                           hci_skb_pkt_type(skb) !=3D HCI_ISODATA_PK=
T)
> > > +                           hci_skb_pkt_type(skb) !=3D HCI_ISODATA_PK=
T &&
> > > +                           hci_skb_pkt_type(skb) !=3D HCI_DRV_PKT)
> > >                                 continue;
> > >                 } else {
> > >                         /* Don't send frame to other channel types */
> > > @@ -391,6 +392,12 @@ void hci_send_to_monitor(struct hci_dev *hdev, s=
truct sk_buff *skb)
> > >                 else
> > >                         opcode =3D cpu_to_le16(HCI_MON_ISO_TX_PKT);
> > >                 break;
> > > +       case HCI_DRV_PKT:
> > > +               if (bt_cb(skb)->incoming)
> > > +                       opcode =3D cpu_to_le16(HCI_MON_DRV_RX_PKT);
> > > +               else
> > > +                       opcode =3D cpu_to_le16(HCI_MON_DRV_TX_PKT);
> > > +               break;
> > >         case HCI_DIAG_PKT:
> > >                 opcode =3D cpu_to_le16(HCI_MON_VENDOR_DIAG);
> > >                 break;
> > > @@ -1860,7 +1867,8 @@ static int hci_sock_sendmsg(struct socket *sock=
, struct msghdr *msg,
> > >                 if (hci_skb_pkt_type(skb) !=3D HCI_COMMAND_PKT &&
> > >                     hci_skb_pkt_type(skb) !=3D HCI_ACLDATA_PKT &&
> > >                     hci_skb_pkt_type(skb) !=3D HCI_SCODATA_PKT &&
> > > -                   hci_skb_pkt_type(skb) !=3D HCI_ISODATA_PKT) {
> > > +                   hci_skb_pkt_type(skb) !=3D HCI_ISODATA_PKT &&
> > > +                   hci_skb_pkt_type(skb) !=3D HCI_DRV_PKT) {
> > >                         err =3D -EINVAL;
> > >                         goto drop;
> > >                 }
> > > --
> > > 2.49.0.504.g3bcea36a83-goog
> > >
> >
> >
> > --
> > Luiz Augusto von Dentz



--=20
Luiz Augusto von Dentz

