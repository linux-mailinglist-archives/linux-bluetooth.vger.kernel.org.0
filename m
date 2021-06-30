Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A11A3B899D
	for <lists+linux-bluetooth@lfdr.de>; Wed, 30 Jun 2021 22:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234019AbhF3USF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 30 Jun 2021 16:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233847AbhF3USF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 30 Jun 2021 16:18:05 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7AEC061756
        for <linux-bluetooth@vger.kernel.org>; Wed, 30 Jun 2021 13:15:35 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id r135so7144245ybc.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 30 Jun 2021 13:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=10MqG1y4LsIt3U34tekoOCI5FCBWML+inNnDuz4ekng=;
        b=J0b+rHJ2FOO8jp3Gw0Mt4i/0TgQsu54tCdrQcRICWtDArEnh4JCQ3PqCcfWCUZ8cr6
         YUPIlo+phqQsRqqOLmYrckpitqmw0qQbLtxpIEyB1VPeipERvYQwFqAz6O8lr85wINuE
         VJEToEQmI4MFWvKtWRkYWu5wnX4ouHIDlMp2fFbJtbY/jv0ihrXKYV7E6UcuyaovSwbG
         dY5DFeVoCFw2vdse74DBHbUBEKhqMM+uTCLhl5zUbeFGU4U+hXwry5FD4cAioL3GUPHV
         JHgw5yOAhtp4khmqqmO0Dvf0Z5akqKCDF6JMmJraqJfmqnw5O8Ls2sdWgOou6Q+NPgOw
         CClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10MqG1y4LsIt3U34tekoOCI5FCBWML+inNnDuz4ekng=;
        b=DdXxNYnGUXOzzzFRbtUkc/l7r8t6w7XjQ1eYnxM4LBDZMAeA0/4faLL1uc6htzsSva
         speuok2cDLTkOnXZ0g3bSKcizkS4AVHcHaKUMg2jtZkVJa7KQUnvIPQvjvPKFmmiDSKn
         R9MghNiH7IHyws/4XwPfNHZi40ihz7lErx/J/gBvujsTEZAKCHjqEOy9tIzT2ApWdGAR
         UoERH3H0ol0DjPsPmcxmMeKjgNM/BP0qfcp8Gkc95lAbnZA0L/YVIPqhLuzZ3SfbhhE5
         Nr5mKfdTZBTTyXnRDo4vEhuw9nurp1pW527lJii3d+lIUCiPVfgUCzXt1wm2+do7DCcb
         GiHA==
X-Gm-Message-State: AOAM530YHtizEAmUFgAuT4EyCY8V1HQF41jwL2LoYcTK8QK7lpalXN1U
        y9C4aE1M8eU4Yuvmo8vr7vaBBOipiJw28B8Q+x4HHMorXOc=
X-Google-Smtp-Source: ABdhPJxj5+HtJBmZnzq2lsgl1s04f+Kf9bM/nBfHuazBt6iimPyu/OCiBXX3hi5k5zlCueVQzsgcB6VbObExBRnN9iY=
X-Received: by 2002:a25:b216:: with SMTP id i22mr19093395ybj.264.1625084134070;
 Wed, 30 Jun 2021 13:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210630080807.12600-1-kiran.k@intel.com>
In-Reply-To: <20210630080807.12600-1-kiran.k@intel.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 30 Jun 2021 13:15:23 -0700
Message-ID: <CABBYNZJ3Gy7u0Erqmbn=8X6Rko=4kmmjx_Cg9c-U=CVYsyJ-bA@mail.gmail.com>
Subject: Re: [PATCH v10 01/10] Bluetooth: Enumerate local supported codec and
 cache details
To:     Kiran K <kiran.k@intel.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

On Wed, Jun 30, 2021 at 1:06 AM Kiran K <kiran.k@intel.com> wrote:
>
> Move reading of supported local codecs into a separate init function,
> query codecs capabilities and cache the data
>
> Signed-off-by: Kiran K <kiran.k@intel.com>
> Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> Signed-off-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
> ---
> * changes in v10:
>  - define Kconfig to control offload feature at build time
>  - fix review comments
>
> * changes in v9:
>   - use shortname vnd instead of ven
>
> * changes in v8:
>   - add comments
>   - split __u8 codec_id[5] into {__u8 id; __le16 cid, vid }
>   - address review comment related codec caps structure
>
> * changes in v7:
>   - keep codec enumeration call in hci_init instead of having a separate
>     function
>   - Remove unused bitmasks defined for LE transports
>
> * changes  in v6:
>   - fix compiler warning reported for ARCH=arc
>
> * changes in v5:
>   - fix review comments
>   - move code used to read standard/vendor codecs caps into single function
>
> * changes in v4:
>   - convert  reading of codecs and codecs caps calls from async to sync
>
> * changes in v3
>   move codec enumeration into a new init function
>
> * changes in v2
>   add skb length check before accessing data
>
>  include/net/bluetooth/hci.h      |  41 ++++++
>  include/net/bluetooth/hci_core.h |  23 ++++
>  net/bluetooth/Kconfig            |  11 ++
>  net/bluetooth/hci_core.c         | 207 ++++++++++++++++++++++++++++++-
>  4 files changed, 278 insertions(+), 4 deletions(-)
>
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index b80415011dcd..f76849c8eafd 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -1307,6 +1307,28 @@ struct hci_rp_read_data_block_size {
>  } __packed;
>
>  #define HCI_OP_READ_LOCAL_CODECS       0x100b
> +struct hci_std_codecs {
> +       __u8    num;
> +       __u8    codec[];
> +} __packed;
> +
> +struct hci_vnd_codec {
> +       /* company id */
> +       __le16  cid;
> +       /* vendor codec id */
> +       __le16  vid;
> +} __packed;
> +
> +struct hci_vnd_codecs {
> +       __u8    num;
> +       struct hci_vnd_codec codec[];
> +} __packed;
> +
> +struct hci_rp_read_local_supported_codecs {
> +       __u8    status;
> +       struct hci_std_codecs std_codecs;
> +       struct hci_vnd_codecs vnd_codecs;
> +} __packed;
>
>  #define HCI_OP_READ_LOCAL_PAIRING_OPTS 0x100c
>  struct hci_rp_read_local_pairing_opts {
> @@ -1315,6 +1337,25 @@ struct hci_rp_read_local_pairing_opts {
>         __u8     max_key_size;
>  } __packed;
>
> +#define HCI_OP_READ_LOCAL_CODEC_CAPS   0x100e
> +struct hci_op_read_local_codec_caps {
> +       __u8    id;
> +       __le16  cid;
> +       __le16  vid;
> +       __u8    transport;
> +       __u8    direction;
> +} __packed;
> +
> +struct hci_codec_caps {
> +       __u8    len;
> +       __u8    data[];
> +} __packed;
> +
> +struct hci_rp_read_local_codec_caps {
> +       __u8    status;
> +       __u8    num_caps;
> +} __packed;
> +
>  #define HCI_OP_READ_PAGE_SCAN_ACTIVITY 0x0c1b
>  struct hci_rp_read_page_scan_activity {
>         __u8     status;
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
> index a53e94459ecd..7b8d603358b9 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -131,6 +131,19 @@ struct bdaddr_list {
>         u8 bdaddr_type;
>  };
>
> +#if IS_ENABLED(CONFIG_BT_OFFLOAD_CODECS)
> +struct codec_list {
> +       struct list_head list;
> +       u8      id;
> +       __le16  cid;
> +       __le16  vid;

I wonder why you are not storing these fields in host byte order?
Looks odd since everything else is using host order.

> +       u8      transport;
> +       u8      num_caps;
> +       u32     len;
> +       struct hci_codec_caps caps[];
> +};
> +#endif
> +
>  struct bdaddr_list_with_irk {
>         struct list_head list;
>         bdaddr_t bdaddr;
> @@ -535,6 +548,9 @@ struct hci_dev {
>         struct list_head        pend_le_conns;
>         struct list_head        pend_le_reports;
>         struct list_head        blocked_keys;
> +#if IS_ENABLED(CONFIG_BT_OFFLOAD_CODECS)
> +       struct list_head        local_codecs;
> +#endif

I wonder if this is preferable over just leaving the local_codecs
empty as we would probably just save a couple of bytes here but when
using preprocessor #if that means we can no longer use IS_ENABLED
directly inside the C statements.

>
>         struct hci_dev_stats    stat;
>
> @@ -1849,4 +1865,11 @@ void hci_copy_identity_address(struct hci_dev *hdev, bdaddr_t *bdaddr,
>  #define SCO_AIRMODE_CVSD       0x0000
>  #define SCO_AIRMODE_TRANSP     0x0003
>
> +#if IS_ENABLED(CONFIG_BT_OFFLOAD_CODECS)
> +#define LOCAL_CODEC_ACL_MASK   BIT(0)
> +#define LOCAL_CODEC_SCO_MASK   BIT(1)
> +
> +#define TRANSPORT_TYPE_MAX     0x04

Ditto, Id just have these defines all the time.

> +#endif
> +
>  #endif /* __HCI_CORE_H */
> diff --git a/net/bluetooth/Kconfig b/net/bluetooth/Kconfig
> index e0ab4cd7afc3..1069623f36c4 100644
> --- a/net/bluetooth/Kconfig
> +++ b/net/bluetooth/Kconfig
> @@ -92,6 +92,17 @@ config BT_LEDS
>           This option selects a few LED triggers for different
>           Bluetooth events.
>
> +config BT_OFFLOAD_CODECS
> +       bool "Enable offload codecs"
> +       depends on BT && BT_BREDR
> +       default n
> +       help
> +         This option enables offload codecs if controller supports.
> +         When this option is enabled, user space audio modules can
> +         query offload codecs and can set the codec to be used for
> +         specific use case.

I would have named this BT_HCI_CODECS.

> +
>  config BT_MSFTEXT
>         bool "Enable Microsoft extensions"
>         depends on BT
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 2560ed2f144d..2657d84e8240 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -838,10 +838,6 @@ static int hci_init4_req(struct hci_request *req, unsigned long opt)
>         if (hdev->commands[22] & 0x04)
>                 hci_set_event_mask_page_2(req);
>
> -       /* Read local codec list if the HCI command is supported */
> -       if (hdev->commands[29] & 0x20)
> -               hci_req_add(req, HCI_OP_READ_LOCAL_CODECS, 0, NULL);
> -
>         /* Read local pairing options if the HCI command is supported */
>         if (hdev->commands[41] & 0x08)
>                 hci_req_add(req, HCI_OP_READ_LOCAL_PAIRING_OPTS, 0, NULL);
> @@ -907,6 +903,197 @@ static int hci_init4_req(struct hci_request *req, unsigned long opt)
>         return 0;
>  }
>
> +#if IS_ENABLED(CONFIG_BT_OFFLOAD_CODECS)
> +static int hci_codec_list_add(struct list_head *list,
> +                             struct hci_op_read_local_codec_caps *sent,
> +                             struct hci_rp_read_local_codec_caps *rp,
> +                             void *caps,
> +                             __u32 len)
> +{
> +       struct codec_list *entry;
> +
> +       entry = kzalloc(sizeof(*entry) + len, GFP_KERNEL);
> +       if (!entry)
> +               return -ENOMEM;
> +
> +       entry->id = sent->id;
> +       if (sent->id == 0xFF) {
> +               entry->cid = __le16_to_cpu(sent->cid);
> +               entry->vid = __le16_to_cpu(sent->vid);
> +       }
> +       entry->transport = sent->transport;
> +       entry->len = len;
> +       entry->num_caps = rp->num_caps;
> +       if (rp->num_caps)
> +               memcpy(entry->caps, caps, len);
> +       list_add(&entry->list, list);
> +
> +       return 0;
> +}
> +
> +static void hci_codec_list_clear(struct list_head *codec_list)
> +{
> +       struct codec_list *c, *n;
> +
> +       list_for_each_entry_safe(c, n, codec_list, list) {
> +               list_del(&c->list);
> +               kfree(c);
> +       }
> +}
> +
> +static void hci_read_codec_capabilities(struct hci_dev *hdev, void *codec_id,
> +                                       __u8 transport, bool is_vnd_codec)
> +{
> +       struct hci_op_read_local_codec_caps cmd;
> +       __u8 i;
> +
> +       memset(&cmd, 0, sizeof(cmd));
> +
> +       if (is_vnd_codec) {
> +               struct hci_vnd_codec *vnd_codec;
> +
> +               vnd_codec = codec_id;
> +               cmd.id = 0xFF;
> +               cmd.cid = vnd_codec->cid;
> +               cmd.vid = vnd_codec->vid;
> +       } else {
> +               cmd.id = *(__u8 *)codec_id;
> +       }
> +
> +       cmd.direction = 0x00;
> +
> +       for (i = 0; i < TRANSPORT_TYPE_MAX; i++) {
> +               if (transport & BIT(i)) {
> +                       struct hci_rp_read_local_codec_caps *rp;
> +                       struct hci_codec_caps *caps;
> +                       struct sk_buff *skb;
> +                       __u8 j;
> +                       __u32 len;
> +
> +                       cmd.transport = i;
> +                       skb = __hci_cmd_sync(hdev, HCI_OP_READ_LOCAL_CODEC_CAPS,
> +                                            sizeof(cmd), &cmd,
> +                                            HCI_CMD_TIMEOUT);
> +                       if (IS_ERR(skb)) {
> +                               bt_dev_err(hdev, "Failed to read codec capabilities (%ld)",
> +                                          PTR_ERR(skb));
> +                               continue;
> +                       }
> +
> +                       if (skb->len < sizeof(*rp))
> +                               goto error;
> +
> +                       rp = (void *)skb->data;
> +
> +                       if (rp->status)
> +                               goto error;
> +
> +                       if (!rp->num_caps) {
> +                               len = 0;
> +                               /* this codec doesn't have capabilities */
> +                               goto skip_caps_parse;
> +                       }
> +
> +                       skb_pull(skb, sizeof(*rp));
> +
> +                       for (j = 0, len = 0; j < rp->num_caps; j++) {
> +                               caps = (void *)skb->data;
> +                               if (skb->len < sizeof(*caps))
> +                                       goto error;
> +                               if (skb->len < caps->len)
> +                                       goto error;
> +                               len += sizeof(caps->len) + caps->len;
> +                               skb_pull(skb,  sizeof(caps->len) + caps->len);
> +                       }
> +
> +skip_caps_parse:
> +                       hci_dev_lock(hdev);
> +                       hci_codec_list_add(&hdev->local_codecs, &cmd, rp,
> +                                          (__u8 *)rp + sizeof(*rp), len);
> +                       hci_dev_unlock(hdev);
> +error:
> +                       kfree_skb(skb);
> +               }
> +       }
> +}
> +
> +static void hci_codec_list_parse(struct hci_dev *hdev, __u8 num_codecs,
> +                                void *codec_list, bool is_vnd_codec)
> +{
> +       __u8 i;
> +
> +       for (i = 0; i < num_codecs; i++) {
> +               if (!is_vnd_codec) {
> +                       struct hci_std_codecs *codecs = codec_list;
> +
> +                       hci_read_codec_capabilities(hdev, &codecs->codec[i],
> +                                                   LOCAL_CODEC_ACL_MASK,
> +                                                   is_vnd_codec);
> +               } else {
> +                       struct hci_vnd_codecs *codecs = codec_list;
> +
> +                       hci_read_codec_capabilities(hdev, &codecs->codec[i],
> +                                                   LOCAL_CODEC_ACL_MASK,
> +                                                   is_vnd_codec);
> +               }
> +       }
> +}
> +
> +static void hci_read_supported_codecs(struct hci_dev *hdev)
> +{
> +       struct sk_buff *skb;
> +       struct hci_rp_read_local_supported_codecs *rp;
> +       struct hci_std_codecs *std_codecs;
> +       struct hci_vnd_codecs *vnd_codecs;
> +
> +       skb = __hci_cmd_sync(hdev, HCI_OP_READ_LOCAL_CODECS, 0, NULL,
> +                            HCI_CMD_TIMEOUT);
> +
> +       if (IS_ERR(skb)) {
> +               bt_dev_err(hdev, "Failed to read local supported codecs (%ld)",
> +                          PTR_ERR(skb));
> +               return;
> +       }
> +
> +       if (skb->len < sizeof(*rp))
> +               goto error;
> +
> +       rp = (void *)skb->data;
> +
> +       if (rp->status)
> +               goto error;
> +
> +       skb_pull(skb, sizeof(rp->status));
> +
> +       std_codecs = (void *)skb->data;
> +
> +       /* validate codecs length before accessing */
> +       if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
> +           + sizeof(std_codecs->num))
> +               goto error;
> +
> +       /* enumerate codec capabilities of standard codecs */
> +       hci_codec_list_parse(hdev, std_codecs->num, std_codecs, false);
> +
> +       skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
> +                + sizeof(std_codecs->num));
> +
> +       vnd_codecs = (void *)skb->data;
> +
> +       /* validate vendor codecs length before accessing */
> +       if (skb->len <
> +           flex_array_size(vnd_codecs, codec, vnd_codecs->num)
> +           + sizeof(vnd_codecs->num))
> +               goto error;
> +
> +       /* enumerate vendor codec capabilities */
> +       hci_codec_list_parse(hdev, vnd_codecs->num, vnd_codecs, true);
> +
> +error:
> +       kfree_skb(skb);
> +}
> +#endif

We might as well move these to hci_codec.c so we just enable/disable
via Makefile, hci_core.c is getting a little too convoluted handling
so many things.

>  static int __hci_init(struct hci_dev *hdev)
>  {
>         int err;
> @@ -937,6 +1124,12 @@ static int __hci_init(struct hci_dev *hdev)
>         if (err < 0)
>                 return err;
>
> +#if IS_ENABLED(CONFIG_BT_OFFLOAD_CODECS)
> +       /* Read local codec list if the HCI command is supported */
> +       if (hdev->commands[29] & 0x20)
> +               hci_read_supported_codecs(hdev);
> +#endif
> +
>         /* This function is only called when the controller is actually in
>          * configured state. When the controller is marked as unconfigured,
>          * this initialization procedure is not run.
> @@ -1841,6 +2034,9 @@ int hci_dev_do_close(struct hci_dev *hdev)
>         memset(hdev->eir, 0, sizeof(hdev->eir));
>         memset(hdev->dev_class, 0, sizeof(hdev->dev_class));
>         bacpy(&hdev->random_addr, BDADDR_ANY);
> +#if IS_ENABLED(CONFIG_BT_OFFLOAD_CODECS)
> +       hci_codec_list_clear(&hdev->local_codecs);
> +#endif
>
>         hci_req_sync_unlock(hdev);
>
> @@ -3843,6 +4039,9 @@ struct hci_dev *hci_alloc_dev(void)
>         INIT_LIST_HEAD(&hdev->adv_instances);
>         INIT_LIST_HEAD(&hdev->blocked_keys);
>
> +#if IS_ENABLED(CONFIG_BT_OFFLOAD_CODECS)
> +       INIT_LIST_HEAD(&hdev->local_codecs);
> +#endif
>         INIT_WORK(&hdev->rx_work, hci_rx_work);
>         INIT_WORK(&hdev->cmd_work, hci_cmd_work);
>         INIT_WORK(&hdev->tx_work, hci_tx_work);
> --
> 2.17.1
>


-- 
Luiz Augusto von Dentz
