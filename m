Return-Path: <linux-bluetooth+bounces-953-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB698275F5
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Jan 2024 18:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAC231F2319E
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Jan 2024 17:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6008753E31;
	Mon,  8 Jan 2024 17:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd3IGC3w"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B854657
	for <linux-bluetooth@vger.kernel.org>; Mon,  8 Jan 2024 17:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cd5c55d6b8so8365161fa.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 08 Jan 2024 09:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704733365; x=1705338165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWRzBMJQbwesAQmcSefipCGcsjHf/cVCJhqQP1BPwvg=;
        b=Zd3IGC3wqTIDpnwUh/xst4+gCXTdJ0n01EHgsuoDewS1ITMxkAPHmQQSDq4LbkuD7l
         LMOg5nCVVdMBlAvm5e5xhnw29RJBZsr7AAzd9gje5vJ7fVs9e/DuvrdKmPmepDn/mCws
         li8M380HFdGQ3bUhNbGyoLKiYVrmMYyv4CpvDRk66Uxk96h0TCP0gBbuM33kzpHW6NYr
         6fonhyUUBPwzC3XRQogSzB8WSZG5S7DgwZszfgZaf2dV9GxoQCfss1pePV46Fr946k1c
         m2WqaXzNGAcMq+fR0gBnFs4oU5wjgLNhcKO6mG4jItSFeDHN5Lpq9x6zMdBw1fcElrPz
         DA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704733365; x=1705338165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWRzBMJQbwesAQmcSefipCGcsjHf/cVCJhqQP1BPwvg=;
        b=PA10Z+xX49XPL7yLvRWU1OIkoX50R1BQfPTF60NE92rwKuj0Sd1NyVuI7L9IKp0v28
         MXceP3f98qRW2Ff/uRHPPpTVbOfOk4VEROoYHQI7k6Fmu9wRmLM9KZ1oVaQ3oI5WEBg6
         asGzlLADvDX8hrcNToNUCd5hgxC07AlcRdsmEgVqhBKpJl6FiypY+os+XZ1g0yT7eyss
         pEem7wKSc52UxnKpVv3/EjiR7BAqfeMBsPz5qVqdKziX4X91FZg9c/iJuQXtDu2/kfoO
         ZC9LF8ep/fxoaY5CzZNzhgGisxn//hBcl+e5yzdkb7HBLUvs9MU59HnPCMpYod+gbXY7
         N91g==
X-Gm-Message-State: AOJu0Yxgnb3VTyStT66T1GaCh2wotkhXI6Tk6S5JR7TygHBQ4GpiznIM
	gsyGpD4seFcwByXVPjYed1cz3kbdVJ9Y7znWa0SKimMF
X-Google-Smtp-Source: AGHT+IHGroPU01Hs6CjhRD+hlRaV46Id2peyd2efVwwHYswM/U1xLZfiSfq9U4Nt8sz0IbczUQC/lurDVj7TSc2jFWw=
X-Received: by 2002:a2e:a58c:0:b0:2cc:72e9:520 with SMTP id
 m12-20020a2ea58c000000b002cc72e90520mr1276025ljp.44.1704733364356; Mon, 08
 Jan 2024 09:02:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240108164258.77332-1-silviu.barbulescu@nxp.com> <20240108164258.77332-3-silviu.barbulescu@nxp.com>
In-Reply-To: <20240108164258.77332-3-silviu.barbulescu@nxp.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 8 Jan 2024 12:02:30 -0500
Message-ID: <CABBYNZLisyxRbZ+shRj+TXBx+G7B==YYdbd3R=NTMWTU4Yrgew@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] bap.c: Add support for multiple BISes
To: Silviu Florian Barbulescu <silviu.barbulescu@nxp.com>
Cc: linux-bluetooth@vger.kernel.org, mihai-octavian.urzica@nxp.com, 
	vlad.pruteanu@nxp.com, andrei.istodorescu@nxp.com, iulia.tanasescu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Silviu,

On Mon, Jan 8, 2024 at 11:43=E2=80=AFAM Silviu Florian Barbulescu
<silviu.barbulescu@nxp.com> wrote:
>
> Update broadcast to support the new setup structure.
> Change broadcast code from iovec struct to byte array.
> Add adapter property for broadcast endpoint.
> Make broadcast sink to select broadcast source BISes
> based on pac broadcast sink properties.
>
> ---
>  profiles/audio/bap.c       | 1273 ++++++++++++++++++++++++++++++------
>  profiles/audio/transport.c |   25 +-
>  src/shared/bap.c           |  441 ++++++++++++-
>  src/shared/bap.h           |   36 +-
>  4 files changed, 1543 insertions(+), 232 deletions(-)
>
> diff --git a/profiles/audio/bap.c b/profiles/audio/bap.c
> index b88876485..8bc292946 100644
> --- a/profiles/audio/bap.c
> +++ b/profiles/audio/bap.c
> @@ -45,6 +45,7 @@
>  #include "src/shared/gatt-client.h"
>  #include "src/shared/gatt-server.h"
>  #include "src/shared/bap.h"
> +#include "src/shared/lc3.h"
>
>  #include "btio/btio.h"
>  #include "src/plugin.h"
> @@ -75,6 +76,8 @@ struct bap_setup {
>         unsigned int id;
>         struct iovec *base;
>         DBusMessage *msg;
> +       struct queue *same_big_setups;
> +       struct bt_bap_qos combined_qos;

Perhaps we could use the same concept of links for broadcast as well?
But Id put that logic inside bt_bap instead because I recall there are
streaming tests for them, which is in my TODO list btw, which we
likely want to cover in unit/test-bap.

>  };
>
>  struct bap_ep {
> @@ -102,6 +105,64 @@ struct bap_data {
>         void *user_data;
>  };
>
> +struct stream_base_data {
> +       struct queue *ltv_caps;
> +       struct queue *ltv_meta;
> +       struct bap_setup *setup;
> +};
> +
> +struct base_data {
> +       uint32_t pres_delay;
> +       struct queue *base_data_subgroup;
> +};
> +
> +struct base_data_subgroup {
> +       uint8_t subgroup_index;
> +       struct bt_bap_codec codec;
> +       struct queue *ltv_caps;
> +       struct queue *ltv_meta;
> +       struct queue *bises;
> +};
> +
> +struct base_data_bis {
> +       uint8_t bis_index;
> +       struct queue *ltv_caps;
> +};
> +
> +#define DEFAULT_IO_QOS \
> +{ \
> +       .interval       =3D 10000, \
> +       .latency        =3D 10, \
> +       .sdu            =3D 40, \
> +       .phy            =3D 0x02, \
> +       .rtn            =3D 2, \
> +}
> +
> +static struct bt_iso_qos default_qos =3D {
> +       .bcast =3D {
> +               .big                    =3D BT_ISO_QOS_BIG_UNSET,
> +               .bis                    =3D BT_ISO_QOS_BIS_UNSET,
> +               .sync_factor    =3D 0x07,
> +               .packing                =3D 0x00,
> +               .framing                =3D 0x00,
> +               .in                     =3D DEFAULT_IO_QOS,
> +               .out                    =3D DEFAULT_IO_QOS,
> +               .encryption             =3D 0x00,
> +               .bcode                  =3D {0x00},
> +               .options                =3D 0x00,
> +               .skip                   =3D 0x0000,
> +               .sync_timeout           =3D 0x4000,
> +               .sync_cte_type          =3D 0x00,
> +               .mse                    =3D 0x00,
> +               .timeout                =3D 0x4000,
> +       }
> +};
> +struct ltv_compare_data {
> +       bool match;
> +       void *data;
> +       uint32_t data32;
> +};
> +

Id prefer we create helper functions in shared/bap.c to manipulate the
base data, or perhaps have it as part of shared/ad.c, either way I
think this should be unit testable.

>  static struct queue *sessions;
>
>  static bool bap_data_set_user_data(struct bap_data *data, void *user_dat=
a)
> @@ -258,10 +319,20 @@ static gboolean get_device(const GDBusPropertyTable=
 *property,
>         struct bap_ep *ep =3D data;
>         const char *path;
>
> -       if (bt_bap_pac_get_type(ep->lpac) =3D=3D BT_BAP_BCAST_SOURCE)
> -               path =3D adapter_get_path(ep->data->adapter);
> -       else
> -               path =3D device_get_path(ep->data->device);
> +       path =3D device_get_path(ep->data->device);
> +
> +       dbus_message_iter_append_basic(iter, DBUS_TYPE_OBJECT_PATH, &path=
);
> +
> +       return TRUE;
> +}
> +
> +static gboolean get_adapter(const GDBusPropertyTable *property,
> +                                       DBusMessageIter *iter, void *data=
)
> +{
> +       struct bap_ep *ep =3D data;
> +       const char *path;
> +
> +       path =3D adapter_get_path(ep->data->adapter);
>
>         dbus_message_iter_append_basic(iter, DBUS_TYPE_OBJECT_PATH, &path=
);
>
> @@ -370,6 +441,26 @@ static const GDBusPropertyTable ep_properties[] =3D =
{
>         { }
>  };
>
> +static const GDBusPropertyTable ep_properties_bcast_source[] =3D {
> +       { "UUID", "s", get_uuid, NULL, NULL,
> +                                       G_DBUS_PROPERTY_FLAG_EXPERIMENTAL=
 },
> +       { "Codec", "y", get_codec, NULL, NULL,
> +                                       G_DBUS_PROPERTY_FLAG_EXPERIMENTAL=
 },
> +       { "Capabilities", "ay", get_capabilities, NULL, has_capabilities,
> +                                       G_DBUS_PROPERTY_FLAG_EXPERIMENTAL=
 },
> +       { "Adapter", "o", get_adapter, NULL, NULL,
> +                                       G_DBUS_PROPERTY_FLAG_EXPERIMENTAL=
 },
> +       { "Locations", "u", get_locations, NULL, NULL,
> +                                       G_DBUS_PROPERTY_FLAG_EXPERIMENTAL=
 },
> +       { "SupportedContext", "q", get_supported_context, NULL, NULL,
> +                                       G_DBUS_PROPERTY_FLAG_EXPERIMENTAL=
 },
> +       { "Context", "q", get_context, NULL, NULL,
> +                                       G_DBUS_PROPERTY_FLAG_EXPERIMENTAL=
 },
> +       { "QoS", "a{sv}", get_qos, NULL, qos_exists,
> +                                       G_DBUS_PROPERTY_FLAG_EXPERIMENTAL=
 },
> +       { }
> +};
> +
>  static int parse_array(DBusMessageIter *iter, struct iovec *iov)
>  {
>         DBusMessageIter array;
> @@ -384,101 +475,755 @@ static int parse_array(DBusMessageIter *iter, str=
uct iovec *iov)
>         return 0;
>  }
>
> -static bool parse_base(void *data, size_t len, util_debug_func_t func,
> -               uint32_t *presDelay, uint8_t *numSubgroups, uint8_t *numB=
is,
> -               struct bt_bap_codec *codec, struct iovec **caps,
> -               struct iovec **meta)
> +static void cleanup_subgroup(struct bt_bap_base_subgroup *subgroup)
>  {
> -       struct iovec iov =3D {
> -               .iov_base =3D data,
> -               .iov_len =3D len,
> -       };
> +       if (!subgroup)
> +               return;
>
> -       uint8_t capsLen, metaLen;
> -       uint8_t *hexstream;
> +       if (subgroup->meta)
> +               util_iov_free(subgroup->meta, 1);
>
> -       if (presDelay) {
> -               if (!util_iov_pull_le24(&iov, presDelay))
> -                       return false;
> -               util_debug(func, NULL, "PresentationDelay %d", *presDelay=
);
> +       if (subgroup->caps)
> +               util_iov_free(subgroup->caps, 1);
> +
> +       while (!queue_isempty(subgroup->bises)) {
> +               struct bt_bap_bis *bis =3D queue_peek_head(subgroup->bise=
s);
> +
> +               if (bis->caps)
> +                       util_iov_free(bis->caps, 1);
> +               queue_remove(subgroup->bises, bis);
> +               subgroup->num_bises--;
>         }
> +       queue_destroy(subgroup->bises, NULL);
>
> -       if (numSubgroups) {
> -               if (!util_iov_pull_u8(&iov, numSubgroups))
> -                       return false;
> -               util_debug(func, NULL, "NumSubgroups %d", *numSubgroups);
> +       if (subgroup)
> +               free(subgroup);
> +}
> +
> +static void destroy_ltv(void *data)
> +{
> +       struct bt_ltv *ltv =3D data;
> +
> +       if (!ltv)
> +               return;
> +
> +       free(ltv);
> +}
> +
> +static void parse_ltv(size_t i, uint8_t l, uint8_t t, uint8_t *v,
> +                                       void *user_data)
> +{
> +       struct queue **ltv_queue =3D user_data;
> +       struct bt_ltv *q_ltv_elem =3D malloc(sizeof(struct bt_ltv) + l);
> +
> +       q_ltv_elem->len =3D l + 1;
> +       q_ltv_elem->type =3D t;
> +
> +       memcpy(q_ltv_elem->value, v, l);
> +
> +       if (!*ltv_queue)
> +               *ltv_queue =3D queue_new();
> +       queue_push_tail(*ltv_queue, q_ltv_elem);
> +}
> +
> +static struct stream_base_data *get_stream_base_info(
> +                       struct bap_setup *setup, util_debug_func_t func)
> +{
> +       struct stream_base_data *sbd =3D new0(struct stream_base_data, 1)=
;
> +       struct iovec *stream_caps_iov =3D util_iov_dup(
> +                       setup->caps, 1);
> +       struct iovec *stream_meta_iov =3D util_iov_dup(
> +                       setup->metadata, 1);
> +
> +       /*
> +        * Copy the Codec Specific configurations from stream
> +        */
> +       if (stream_caps_iov !=3D NULL) {
> +               if (!util_ltv_foreach(stream_caps_iov->iov_base,
> +                               stream_caps_iov->iov_len, NULL,
> +                               parse_ltv, &sbd->ltv_caps)) {
> +                       util_debug(func,
> +                       NULL, "Unable to parse Codec Specific configurati=
ons");
> +                       goto fail;
> +               }
>         }
>
> -       if (numBis) {
> -               if (!util_iov_pull_u8(&iov, numBis))
> -                       return false;
> -               util_debug(func, NULL, "NumBis %d", *numBis);
> +       /*
> +        * Copy the Metadata from stream
> +        */
> +       if (stream_meta_iov !=3D NULL) {
> +               if (!util_ltv_foreach(stream_meta_iov->iov_base,
> +                               stream_meta_iov->iov_len, NULL,
> +                               parse_ltv, &sbd->ltv_meta)) {
> +                       util_debug(func,
> +                       NULL, "Unable to parse Codec Specific configurati=
ons");
> +                       goto fail;
> +               }
>         }
>
> -       if (codec) {
> -               codec =3D util_iov_pull_mem(&iov, sizeof(*codec));
> -               if (!codec)
> +       sbd->setup =3D setup;
> +
> +       util_iov_free(stream_caps_iov, 1);
> +       util_iov_free(stream_meta_iov, 1);
> +
> +       return sbd;
> +
> +fail:
> +       util_iov_free(stream_caps_iov, 1);
> +       util_iov_free(stream_meta_iov, 1);
> +
> +       if (sbd->ltv_caps)
> +               queue_destroy(sbd->ltv_caps, destroy_ltv);
> +
> +       if (sbd->ltv_meta)
> +               queue_destroy(sbd->ltv_meta, destroy_ltv);
> +
> +       free(sbd);
> +
> +       return NULL;
> +}
> +
> +static void get_stream_base_data(void *data, void *user_data)
> +{
> +       struct bap_setup *setup =3D data;
> +       struct queue *streams_base_data =3D user_data;
> +       struct stream_base_data *sbd =3D get_stream_base_info(setup, bap_=
debug);
> +
> +       if (sbd)
> +               queue_push_tail(streams_base_data, sbd);
> +}
> +
> +static void set_device_presentation_delay(void *data, void *user_data)
> +{
> +       struct stream_base_data *sbd =3D data;
> +       struct base_data *base =3D user_data;
> +       struct bt_bap_qos *qos =3D &sbd->setup->qos;
> +
> +       if (base->pres_delay < qos->bcast.delay)
> +               base->pres_delay =3D qos->bcast.delay;
> +}
> +
> +static bool ltv_match(const void *data, const void *match_data)
> +{
> +       const struct bt_ltv *ltv1 =3D data;
> +       const struct bt_ltv *ltv2 =3D match_data;
> +
> +       if (ltv1->len =3D=3D ltv2->len)
> +               if (ltv1->type =3D=3D ltv2->type)
> +                       if (memcmp(ltv1->value, ltv2->value, ltv1->len - =
1)
> +                                               =3D=3D 0)
> +                               return true;
> +       return false;
> +}
> +
> +static bool compare_ltv_lists(struct queue *ltv_list1, struct queue *ltv=
_list2)
> +{
> +       const struct queue_entry *entry;
> +       /* Compare metadata length */
> +       if (queue_length(ltv_list1) !=3D queue_length(ltv_list2))
> +               return false;
> +
> +       /* Compare metadata ltvs */
> +       for (entry =3D queue_get_entries(ltv_list1); entry; entry =3D ent=
ry->next) {
> +               struct bt_ltv *ltv =3D entry->data;
> +
> +               if (!queue_find(ltv_list2, ltv_match, ltv))
>                         return false;
> -               util_debug(func, NULL, "%s: ID %d CID 0x%2.2x VID 0x%2.2x=
",
> -                               "Codec", codec->id, codec->cid, codec->vi=
d);
>         }
>
> -       if (!util_iov_pull_u8(&iov, &capsLen))
> -               return false;
> -       util_debug(func, NULL, "CC Len %d", capsLen);
> +       return true;
> +}
>
> -       if (!capsLen)
> -               return false;
> -       if (caps) {
> -               if (!(*caps))
> -                       *caps =3D new0(struct iovec, 1);
> -               (*caps)->iov_len =3D capsLen;
> -               (*caps)->iov_base =3D iov.iov_base;
> +static struct queue *compare_caps_ltv_lists(
> +               struct queue *subgroup_caps, struct queue *bis_caps)
> +{
> +       struct queue *ltv_caps =3D queue_new();
> +       const struct queue_entry *entry;
> +
> +       /* Compare metadata ltvs */
> +       for (entry =3D queue_get_entries(bis_caps); entry;
> +                                       entry =3D entry->next) {
> +               struct bt_ltv *ltv =3D entry->data;
> +
> +               if (!queue_find(subgroup_caps, ltv_match, ltv))
> +                       queue_push_tail(ltv_caps, ltv);
>         }
>
> -       for (int i =3D 0; capsLen > 1; i++) {
> -               struct bt_ltv *ltv =3D util_iov_pull_mem(&iov, sizeof(*lt=
v));
> -               uint8_t *caps;
> +       if (queue_isempty(ltv_caps)) {
> +               queue_destroy(ltv_caps, NULL);
> +               return NULL;
> +       } else
> +               return ltv_caps;
> +}
>
> -               if (!ltv) {
> -                       util_debug(func, NULL, "Unable to parse %s",
> -                                                               "Capabili=
ties");
> -                       return false;
> -               }
> +static void get_max_bises_index(void *data, void *user_data)
> +{
> +       struct base_data_bis *bdb =3D data;
> +       uint8_t *bis_index =3D user_data;
>
> -               util_debug(func, NULL, "%s #%u: len %u type %u",
> -                                       "CC", i, ltv->len, ltv->type);
> +       if (bdb->bis_index > *bis_index)
> +               *bis_index =3D bdb->bis_index + 1;
> +       else if (bdb->bis_index =3D=3D *bis_index)
> +               *bis_index =3D *bis_index + 1;
> +}
>
> -               caps =3D util_iov_pull_mem(&iov, ltv->len - 1);
> -               if (!caps) {
> -                       util_debug(func, NULL, "Unable to parse %s",
> -                                                               "CC");
> -                       return false;
> +static void get_bises_index(void *data, void *user_data)
> +{
> +       struct base_data_subgroup *bds =3D data;
> +       uint8_t *bis_index =3D user_data;
> +
> +       queue_foreach(bds->bises, get_max_bises_index, bis_index);
> +}
> +
> +static uint8_t get_bis_index(struct queue *subgroups)
> +{
> +       uint8_t bis_index =3D 1;
> +
> +       queue_foreach(subgroups, get_bises_index, &bis_index);
> +       return bis_index;
> +}
> +
> +static void add_new_bis(struct base_data_subgroup *subgroup,
> +                       uint8_t bis_index, struct queue *ltv_bis_caps)
> +{
> +               struct base_data_bis *bdb =3D new0(struct base_data_bis, =
1);
> +
> +               bdb->bis_index =3D bis_index;
> +               bdb->ltv_caps =3D ltv_bis_caps;
> +               queue_push_tail(subgroup->bises, bdb);
> +}
> +
> +static void add_new_subgroup(struct queue *subgroups,
> +                       struct stream_base_data *base_data)
> +{
> +               struct bt_bap_pac *lpac =3D base_data->setup->ep->lpac;
> +               struct base_data_subgroup *bds =3D new0(
> +                                       struct base_data_subgroup, 1);
> +               uint16_t cid;
> +               uint16_t vid;
> +
> +               bt_bap_pac_get_vendor_codec(lpac, &bds->codec.id, &cid,
> +                               &vid, NULL, NULL);
> +               bds->codec.cid =3D cid;
> +               bds->codec.vid =3D vid;
> +               bds->ltv_caps =3D base_data->ltv_caps;
> +               bds->ltv_meta =3D base_data->ltv_meta;
> +               base_data->ltv_caps =3D NULL;
> +               base_data->ltv_meta =3D NULL;
> +               bds->bises =3D queue_new();
> +               base_data->setup->qos.bcast.bis =3D get_bis_index(subgrou=
ps);
> +               add_new_bis(bds, base_data->setup->qos.bcast.bis,
> +                                               queue_new());
> +               queue_push_tail(subgroups, bds);
> +}
> +
> +static void remove_ltv_form_list(void *data, void *user_data)
> +{
> +       struct bt_ltv *ltv =3D data;
> +       struct queue *ltv_caps =3D user_data;
> +
> +       queue_remove(ltv_caps, ltv);
> +}
> +
> +static void set_base_subgroup(void *data, void *user_data)
> +{
> +       struct stream_base_data *stream_base =3D data;
> +       struct base_data *base =3D user_data;
> +       struct queue *ltv_caps;
> +
> +       if (queue_isempty(base->base_data_subgroup)) {
> +               add_new_subgroup(base->base_data_subgroup, stream_base);
> +       } else {
> +               /* Verify if a subgroup has the same metadata */
> +               const struct queue_entry *entry;
> +               struct base_data_subgroup *subgroup_base =3D NULL;
> +               bool same_meta =3D false;
> +
> +               for (entry =3D queue_get_entries(base->base_data_subgroup=
);
> +                                               entry; entry =3D entry->n=
ext) {
> +                       subgroup_base =3D entry->data;
> +                       if (compare_ltv_lists(subgroup_base->ltv_meta,
> +                                       stream_base->ltv_meta)) {
> +                               same_meta =3D true;
> +                               break;
> +                       }
>                 }
> -               util_hexdump(' ', caps, ltv->len - 1, func, NULL);
>
> -               capsLen -=3D (ltv->len + 1);
> +               if (!same_meta) {
> +                       /* No subgroup with the same metadata found.
> +                        * Create a new one.
> +                        */
> +                       add_new_subgroup(base->base_data_subgroup,
> +                               stream_base);
> +               } else {
> +                       /* Soubgroup found with the same metadata
> +                        * get different capabilities
> +                        */
> +                       ltv_caps =3D compare_caps_ltv_lists(
> +                                       subgroup_base->ltv_caps,
> +                                       stream_base->ltv_caps);
> +
> +                       queue_foreach(ltv_caps, remove_ltv_form_list,
> +                               stream_base->ltv_caps);
> +                       stream_base->setup->qos.bcast.bis =3D get_bis_ind=
ex(
> +                               base->base_data_subgroup);
> +                       add_new_bis(subgroup_base,
> +                                       stream_base->setup->qos.bcast.bis=
,
> +                                       ltv_caps);
> +               }
>         }
> +}
> +
> +static void get_tlv_size(void *data, void *user_data)
> +{
> +       struct bt_ltv *ltv =3D data;
> +       uint8_t *length =3D user_data;
> +
> +       *length =3D *length + ltv->len + 1;
> +}
> +
> +static uint8_t get_size_from_ltv_queue(struct queue *tlv_queue)
> +{
> +       uint8_t length =3D 0;
> +
> +       queue_foreach(tlv_queue, get_tlv_size, &length);
> +       return length;
> +}
> +
> +static void generate_ltv_base(void *data, void *user_data)
> +{
> +       struct bt_ltv *ltv =3D data;
> +       struct iovec *base_iov =3D user_data;
> +
> +       if (!util_iov_push_u8(base_iov, ltv->len))
> +               return;
> +
> +       if (!util_iov_push_u8(base_iov, ltv->type))
> +               return;
> +
> +       if (!util_iov_push_mem(base_iov, ltv->len - 1, ltv->value))
> +               return;
> +       util_debug(bap_debug, NULL, "ltv type %d", ltv->type);
> +}
> +
> +static void generate_bis_base(void *data, void *user_data)
> +{
> +       struct base_data_bis *bis =3D data;
> +       struct iovec *base_iov =3D user_data;
> +       uint8_t cc_length =3D get_size_from_ltv_queue(bis->ltv_caps);
> +
> +       if (!util_iov_push_u8(base_iov, bis->bis_index))
> +               return;
> +       util_debug(bap_debug, NULL, "Bis Index %d", bis->bis_index);
> +
> +       if (!util_iov_push_u8(base_iov, cc_length))
> +               return;
> +       util_debug(bap_debug, NULL, "Codec Specific Configuration length =
%d",
> +                               cc_length);
> +
> +       queue_foreach(bis->ltv_caps, generate_ltv_base, base_iov);
> +}
> +
> +static void generate_subgroup_base(void *data, void *user_data)
> +{
> +       struct base_data_subgroup *bds =3D data;
> +       struct iovec *base_iov =3D user_data;
> +       uint8_t cc_length =3D get_size_from_ltv_queue(bds->ltv_caps);
> +       uint8_t metadata_length =3D get_size_from_ltv_queue(bds->ltv_meta=
);
> +
> +       if (!util_iov_push_u8(base_iov, queue_length(bds->bises)))
> +               return;
> +
> +       util_debug(bap_debug, NULL, "Number of BIS %d",
> +                               queue_length(bds->bises));
> +
> +       if (!util_iov_push_u8(base_iov, bds->codec.id))
> +               return;
> +
> +       util_debug(bap_debug, NULL, "Codec ID %d", bds->codec.id);
> +
> +       if (!util_iov_push_le16(base_iov, bds->codec.cid))
> +               return;
> +
> +       util_debug(bap_debug, NULL, "Company ID %d", bds->codec.cid);
> +
> +       if (!util_iov_push_le16(base_iov, bds->codec.vid))
> +               return;
> +
> +       util_debug(bap_debug, NULL, "Vendor specific codec_ID %d",
> +                               bds->codec.vid);
> +
> +       if (!util_iov_push_u8(base_iov, cc_length))
> +               return;
> +
> +       util_debug(bap_debug, NULL, "Codec Specific Configuration length =
%d",
> +                               cc_length);
> +
> +       queue_foreach(bds->ltv_caps, generate_ltv_base, base_iov);
> +
> +       if (!util_iov_push_u8(base_iov, metadata_length))
> +               return;
> +
> +       util_debug(bap_debug, NULL, "Metadata length %d", metadata_length=
);
> +
> +       queue_foreach(bds->ltv_meta, generate_ltv_base, base_iov);
> +
> +       queue_foreach(bds->bises, generate_bis_base, base_iov);
> +}
> +
> +static struct iovec *generate_base(struct base_data *base,
> +                                       util_debug_func_t func)
> +{
> +       struct iovec *base_iov =3D g_new0(struct iovec, 0x1);
> +
> +       base_iov->iov_base =3D util_malloc(BASE_MAX_LENGTH);
> +
> +       if (!util_iov_push_le24(base_iov, base->pres_delay))
> +               return NULL;
> +       util_debug(func, NULL, "PresentationDelay %d", base->pres_delay);
> +
> +       if (!util_iov_push_u8(base_iov,
> +                       queue_length(base->base_data_subgroup)))
> +               return NULL;
> +
> +       util_debug(func, NULL, "Number of Subgroups %d",
> +                       queue_length(base->base_data_subgroup));
> +
> +       queue_foreach(base->base_data_subgroup, generate_subgroup_base,
> +                               base_iov);
> +
> +       return base_iov;
> +}
> +
> +static void update_endpoint_base(struct bap_setup *setup,
> +                       struct bap_data *data, struct iovec *base_iov)
> +{
> +       if (setup->base)
> +               util_iov_free(setup->base, 1);
> +
> +       setup->base =3D util_iov_dup(base_iov, 1);
> +}
> +
> +static void destroy_stream_base_data(void *data)
> +{
> +       struct stream_base_data *sbd =3D data;
> +
> +       if (!sbd)
> +               return;
> +
> +       queue_destroy(sbd->ltv_caps, destroy_ltv);
> +       queue_destroy(sbd->ltv_meta, destroy_ltv);
> +       sbd->setup =3D NULL;
> +       free(sbd);
> +}
> +
> +static void destroy_base_data_bis(void *data)
> +{
> +       struct base_data_bis *bis =3D data;
> +
> +       if (!bis)
> +               return;
> +
> +       queue_destroy(bis->ltv_caps, destroy_ltv);
> +       free(bis);
> +}
> +
> +static void destroy_base_data_subgroup(void *data)
> +{
> +       struct base_data_subgroup *subgroup =3D data;
> +
> +       if (!subgroup)
> +               return;
> +
> +       queue_destroy(subgroup->ltv_caps, destroy_ltv);
> +       queue_destroy(subgroup->ltv_meta, destroy_ltv);
> +       queue_destroy(subgroup->bises, destroy_base_data_bis);
> +
> +       free(subgroup);
> +}
> +
> +static void update_base(struct bap_setup *setup,
> +                       struct bap_data *data, util_debug_func_t func)
> +{
> +       struct base_data *base;
> +       struct iovec *base_iov;
> +       const struct queue_entry *entry;
> +       struct queue *streams_base_data =3D queue_new();
> +       struct stream_base_data *sbd =3D get_stream_base_info(setup, func=
);
> +
> +       queue_foreach(setup->same_big_setups, get_stream_base_data,
> +                                               streams_base_data);
> +
> +       queue_push_tail(streams_base_data, sbd);
> +
> +       base =3D new0(struct base_data, 1);
> +       base->base_data_subgroup =3D queue_new();
> +
> +       queue_foreach(streams_base_data, set_device_presentation_delay, b=
ase);
> +
> +       queue_foreach(streams_base_data, set_base_subgroup, base);
> +
> +       base_iov =3D generate_base(base, bap_debug);
> +
> +       /* Update the endpoints BASE iovec */
> +       update_endpoint_base(setup, data, base_iov);
> +
> +       for (entry =3D queue_get_entries(setup->same_big_setups);
> +                                               entry; entry =3D entry->n=
ext) {
> +               struct bap_setup *link =3D entry->data;
> +
> +               update_endpoint_base(link, data, base_iov);
> +       }
> +
> +       util_iov_free(base_iov, 1);
> +
> +       queue_destroy(streams_base_data, destroy_stream_base_data);
> +
> +       queue_destroy(base->base_data_subgroup, destroy_base_data_subgrou=
p);
> +
> +       free(base);
> +}
>
> -       if (!util_iov_pull_u8(&iov, &metaLen))
> +static void get_combined_qos(void *data, void *user_data)
> +{
> +       struct bap_setup *setup =3D data;
> +       struct bt_bap_qos **local_qos =3D user_data;
> +       struct bt_bap_qos *qos =3D &setup->qos;
> +
> +       if (*local_qos =3D=3D NULL)
> +               return;
> +
> +       if (((*local_qos)->bcast.io_qos.interval !=3D
> +                               qos->bcast.io_qos.interval) ||
> +        ((*local_qos)->bcast.io_qos.rtn !=3D qos->bcast.io_qos.rtn) ||
> +        ((*local_qos)->bcast.io_qos.latency !=3D
> +                               qos->bcast.io_qos.latency) ||
> +        ((*local_qos)->bcast.io_qos.phy !=3D qos->bcast.io_qos.phy) ||
> +        ((*local_qos)->bcast.framing !=3D qos->bcast.framing)) {
> +               util_debug(bap_debug,
> +               NULL,
> +               "Error: QOS is different between BISes in the BIG");
> +               free(*local_qos);
> +               *local_qos =3D NULL;
> +               return;
> +       }
> +
> +       if ((*local_qos)->bcast.io_qos.sdu !=3D qos->bcast.io_qos.sdu)
> +               if ((*local_qos)->bcast.io_qos.sdu < qos->bcast.io_qos.sd=
u)
> +                       (*local_qos)->bcast.io_qos.sdu =3D qos->bcast.io_=
qos.sdu;
> +
> +       if ((*local_qos)->bcast.delay !=3D qos->bcast.delay)
> +               if ((*local_qos)->bcast.delay < qos->bcast.delay)
> +                       (*local_qos)->bcast.delay =3D qos->bcast.delay;
> +}
> +
> +static void update_qos(struct bap_setup *setup,
> +                       struct bap_data *data)
> +{
> +       const struct queue_entry *entry;
> +       struct bt_bap_qos *local_qos =3D new0(struct bt_bap_qos, 1);
> +       struct bt_bap_qos *qos =3D &setup->qos;
> +
> +       memcpy(local_qos, qos, sizeof(struct bt_bap_qos));
> +
> +       queue_foreach(setup->same_big_setups,
> +                               get_combined_qos, &local_qos);
> +
> +       /* Update each endpoint QOS structure to have the
> +        * same values, as obtained in local_qos
> +        */
> +       if (local_qos !=3D NULL) {
> +               memcpy(&setup->combined_qos, local_qos,
> +                               sizeof(struct bt_bap_qos));
> +
> +               for (entry =3D queue_get_entries(setup->same_big_setups);
> +                               entry; entry =3D entry->next) {
> +                       struct bap_setup *link =3D entry->data;
> +
> +                       memcpy(&link->combined_qos, local_qos,
> +                                       sizeof(struct bt_bap_qos));
> +               }
> +       }
> +
> +       if (local_qos !=3D NULL)
> +               free(local_qos);
> +}
> +
> +static bool parse_base(struct bt_bap *bap, void *data, size_t len,
> +               util_debug_func_t func, struct bt_bap_base *base)
> +{
> +       uint8_t num_subgroups;
> +       uint8_t num_bis;
> +
> +       struct iovec iov =3D {
> +               .iov_base =3D data,
> +               .iov_len =3D len,
> +       };
> +       util_debug(func, NULL, "BASE len %ld", len);
> +       if (!base)
>                 return false;
> -       util_debug(func, NULL, "Metadata Len %d", metaLen);
>
> -       if (!metaLen)
> +       if (!util_iov_pull_le24(&iov, &base->pres_delay))
>                 return false;
> -       if (meta) {
> -               if (!(*meta))
> -                       *meta =3D new0(struct iovec, 1);
> -               (*meta)->iov_len =3D metaLen;
> -               (*meta)->iov_base =3D iov.iov_base;
> -       }
> +       util_debug(func, NULL, "PresentationDelay %d", base->pres_delay);
>
> -       hexstream =3D util_iov_pull_mem(&iov, metaLen);
> -       if (!hexstream)
> +       if (!util_iov_pull_u8(&iov, &base->num_subgroups))
>                 return false;
> -       util_hexdump(' ', hexstream, metaLen, func, NULL);
> +       util_debug(func, NULL, "NumSubgroups %d", base->num_subgroups);
> +       num_subgroups =3D base->num_subgroups;
> +
> +       for (int sg =3D 0; sg < num_subgroups; sg++) {
> +               struct bt_bap_base_subgroup *sub_group =3D new0(
> +                                               struct bt_bap_base_subgro=
up, 1);
> +               uint8_t caps_len, metaLen;
> +               uint8_t *hexstream;
> +
> +               sub_group->subgroup_index =3D sg;
> +
> +               util_debug(func, NULL, "Subgroup #%d", sg);
> +               sub_group->bap =3D bap;
> +               sub_group->bises =3D queue_new();
> +
> +               if (!util_iov_pull_u8(&iov, &num_bis)) {
> +                       cleanup_subgroup(sub_group);
> +                       goto fail;
> +               }
> +               util_debug(func, NULL, "NumBis %d", num_bis);
> +               sub_group->num_bises =3D num_bis;
> +
> +               memcpy(&sub_group->codec, util_iov_pull_mem(&iov,
> +               sizeof(struct bt_bap_codec)), sizeof(struct bt_bap_codec)=
);
> +               util_debug(func, NULL, "%s: ID %d CID 0x%2.2x VID 0x%2.2x=
",
> +                       "Codec", sub_group->codec.id, sub_group->codec.ci=
d,
> +                               sub_group->codec.vid);
> +               if (!util_iov_pull_u8(&iov, &caps_len)) {
> +                       cleanup_subgroup(sub_group);
> +                       goto fail;
> +               }
> +
> +               util_debug(func, NULL, "CC Len %d", caps_len);
> +
> +               /*
> +                * Copy the Codec Specific configurations from base
> +                */
> +               sub_group->caps =3D new0(struct iovec, 1);
> +               util_iov_memcpy(sub_group->caps, iov.iov_base, caps_len);
> +               DBG("subgroup caps len %ld", sub_group->caps->iov_len);
> +
> +               for (int i =3D 0; caps_len > 1; i++) {
> +                       struct bt_ltv *ltv =3D util_iov_pull_mem(&iov,
> +                                                               sizeof(*l=
tv));
> +                       uint8_t *caps;
> +
> +                       if (!ltv) {
> +                               util_debug(func, NULL, "Unable to parse %=
s",
> +                                                       "Capabilities");
> +                               cleanup_subgroup(sub_group);
> +                               goto fail;
> +                       }
> +
> +                       util_debug(func, NULL, "%s #%u: len %u type %u",
> +                                               "CC", i, ltv->len, ltv->t=
ype);
> +
> +                       caps =3D util_iov_pull_mem(&iov, ltv->len - 1);
> +                       if (!caps) {
> +                               util_debug(func, NULL, "Unable to parse %=
s",
> +                                                                       "=
CC");
> +                               cleanup_subgroup(sub_group);
> +                               goto fail;
> +                       }
> +                       util_hexdump(' ', caps, ltv->len - 1, func, NULL)=
;
> +
> +                       caps_len -=3D (ltv->len + 1);
> +               }
> +
> +               if (!util_iov_pull_u8(&iov, &metaLen)) {
> +                       cleanup_subgroup(sub_group);
> +                       goto fail;
> +               }
> +               util_debug(func, NULL, "Metadata Len %d", metaLen);
> +
> +               sub_group->meta =3D new0(struct iovec, 1);
> +               sub_group->meta->iov_len =3D metaLen;
> +               sub_group->meta->iov_base =3D iov.iov_base;
> +
> +               hexstream =3D util_iov_pull_mem(&iov, metaLen);
> +               if (!hexstream) {
> +                       cleanup_subgroup(sub_group);
> +                       goto fail;
> +               }
> +               util_hexdump(' ', hexstream, metaLen, func, NULL);
> +
> +               for (int bis_sg =3D 0; bis_sg < sub_group->num_bises; bis=
_sg++) {
> +                       struct bt_bap_bis *bis;
> +                       uint8_t caps_len;
> +                       uint8_t crt_bis;
> +
> +                       if (!util_iov_pull_u8(&iov, &crt_bis)) {
> +                               cleanup_subgroup(sub_group);
> +                               goto fail;
> +                       }
> +                       util_debug(func, NULL, "BIS #%d", crt_bis);
>
> +                       bis =3D new0(struct bt_bap_bis, 1);
> +                       bis->bisIndex =3D crt_bis;
> +
> +                       if (!util_iov_pull_u8(&iov, &caps_len)) {
> +                               cleanup_subgroup(sub_group);
> +                               goto fail;
> +                       }
> +                       util_debug(func, NULL, "CC Len %d", caps_len);
> +
> +                       bis->caps =3D new0(struct iovec, 1);
> +                       bis->caps->iov_len =3D caps_len;
> +                       util_iov_memcpy(bis->caps, iov.iov_base, caps_len=
);
> +                       DBG("bis caps len %ld", bis->caps->iov_len);
> +
> +                       for (int i =3D 0; caps_len > 1; i++) {
> +                               struct bt_ltv *ltv =3D util_iov_pull_mem(=
&iov,
> +                                                               sizeof(*l=
tv));
> +                               uint8_t *caps;
> +
> +                               if (!ltv) {
> +                                       util_debug(func, NULL, "Unable to=
 parse %s",
> +                                                               "Capabili=
ties");
> +                                       cleanup_subgroup(sub_group);
> +                                       goto fail;
> +                               }
> +
> +                               util_debug(func, NULL, "%s #%u: len %u ty=
pe %u",
> +                                               "CC", i, ltv->len, ltv->t=
ype);
> +
> +                               caps =3D util_iov_pull_mem(&iov, ltv->len=
 - 1);
> +                               if (!caps) {
> +                                       util_debug(func, NULL,
> +                                               "Unable to parse %s", "CC=
");
> +                                       cleanup_subgroup(sub_group);
> +                                       goto fail;
> +                               }
> +                               util_hexdump(' ', caps, ltv->len - 1, fun=
c,
> +                                                                       N=
ULL);
> +
> +                               caps_len -=3D (ltv->len + 1);
> +                       }
> +
> +                       queue_push_tail(sub_group->bises, bis);
> +               }
> +
> +               queue_push_tail(base->subgroups, sub_group);
> +       }
>         return true;
> +
> +fail:
> +               while (!queue_isempty(base->subgroups)) {
> +                       struct bt_bap_base_subgroup *subGroup =3D
> +                                       queue_peek_head(base->subgroups);
> +                       cleanup_subgroup(subGroup);
> +                       base->num_subgroups--;
> +               }
> +               util_debug(func, NULL, "Unable to parse %s", "Base");
> +
> +               return false;
>  }
>
>  static int parse_io_qos(const char *key, int var, DBusMessageIter *iter,
> @@ -561,6 +1306,16 @@ static int parse_bcast_qos(const char *key, int var=
, DBusMessageIter *iter,
>                         return -EINVAL;
>
>                 dbus_message_iter_get_basic(iter, &qos->bcast.encryption)=
;
> +       } else if (!strcasecmp(key, "BIG")) {
> +               if (var !=3D DBUS_TYPE_BYTE)
> +                       return -EINVAL;
> +
> +               dbus_message_iter_get_basic(iter, &qos->bcast.big);
> +       }  else if (!strcasecmp(key, "BIS")) {
> +               if (var !=3D DBUS_TYPE_BYTE)
> +                       return -EINVAL;
> +
> +               dbus_message_iter_get_basic(iter, &qos->bcast.bis);
>         } else if (!strcasecmp(key, "Options")) {
>                 if (var !=3D DBUS_TYPE_BYTE)
>                         return -EINVAL;
> @@ -596,6 +1351,11 @@ static int parse_bcast_qos(const char *key, int var=
, DBusMessageIter *iter,
>                         return -EINVAL;
>
>                 dbus_message_iter_get_basic(iter, &qos->bcast.timeout);
> +       } else if (!strcasecmp(key, "PresentationDelay")) {
> +               if (var !=3D DBUS_TYPE_UINT32)
> +                       return -EINVAL;
> +
> +               dbus_message_iter_get_basic(iter, &qos->bcast.delay);
>         } else if (!strcasecmp(key, "BCode")) {
>                 struct iovec iov;
>
> @@ -604,8 +1364,8 @@ static int parse_bcast_qos(const char *key, int var,=
 DBusMessageIter *iter,
>
>                 parse_array(iter, &iov);
>
> -               util_iov_free(qos->bcast.bcode, 1);
> -               qos->bcast.bcode =3D util_iov_dup(&iov, 1);
> +               memcpy(qos->bcast.bcode, iov.iov_base,
> +                               sizeof(qos->bcast.bcode));
>         } else {
>                 int err;
>
> @@ -618,14 +1378,15 @@ static int parse_bcast_qos(const char *key, int va=
r, DBusMessageIter *iter,
>  }
>
>  static int parse_qos(DBusMessageIter *iter, struct bt_bap_qos *qos,
> -                       struct iovec **base)
> +                       struct bt_bap_pac *lpac)
>  {
>         DBusMessageIter array;
>         const char *key;
>         int (*parser)(const char *key, int var, DBusMessageIter *iter,
>                         struct bt_bap_qos *qos);
>
> -       if (*base)
> +       if ((bt_bap_pac_get_type(lpac) =3D=3D BT_BAP_BCAST_SOURCE) ||
> +               (bt_bap_pac_get_type(lpac) =3D=3D BT_BAP_BCAST_SINK))
>                 parser =3D parse_bcast_qos;
>         else
>                 parser =3D parse_ucast_qos;
> @@ -657,8 +1418,9 @@ static int parse_qos(DBusMessageIter *iter, struct b=
t_bap_qos *qos,
>  }
>
>  static int parse_configuration(DBusMessageIter *props, struct iovec **ca=
ps,
> -                               struct iovec **metadata, struct iovec **b=
ase,
> -                               struct bt_bap_qos *qos)
> +                               struct iovec **metadata,
> +                               struct bt_bap_qos *qos,
> +                               struct bt_bap_pac *lpac)
>  {
>         const char *key;
>         struct iovec iov;
> @@ -699,24 +1461,13 @@ static int parse_configuration(DBusMessageIter *pr=
ops, struct iovec **caps,
>                         if (var !=3D DBUS_TYPE_ARRAY)
>                                 goto fail;
>
> -                       if (parse_qos(&value, qos, base))
> +                       if (parse_qos(&value, qos, lpac))
>                                 goto fail;
>                 }
>
>                 dbus_message_iter_next(props);
>         }
>
> -       if (*base) {
> -               uint32_t presDelay;
> -               uint8_t numSubgroups, numBis;
> -               struct bt_bap_codec codec;
> -
> -               util_iov_memcpy(*base, (*caps)->iov_base, (*caps)->iov_le=
n);
> -               parse_base((*caps)->iov_base, (*caps)->iov_len, bap_debug=
,
> -                       &presDelay, &numSubgroups, &numBis, &codec,
> -                       caps, NULL);
> -       }
> -
>         return 0;
>
>  fail:
> @@ -838,18 +1589,81 @@ static void setup_free(void *data)
>         if (setup->ep)
>                 queue_remove(setup->ep->setups, setup);
>
> +       queue_destroy(setup->same_big_setups, NULL);
> +
>         setup_io_close(setup, NULL);
>
>         util_iov_free(setup->caps, 1);
>         util_iov_free(setup->metadata, 1);
>         util_iov_free(setup->base, 1);
>
> -       if (bt_bap_stream_get_type(setup->stream) =3D=3D BT_BAP_STREAM_TY=
PE_BCAST)
> -               util_iov_free(setup->qos.bcast.bcode, 1);
> -
>         free(setup);
>  }
>
> +static void link_setups(void *data, void *user_data)
> +{
> +       struct bap_ep *ep =3D data;
> +       struct bap_setup *setup =3D user_data;
> +       const struct queue_entry *entry;
> +
> +       for (entry =3D queue_get_entries(ep->setups); entry;
> +                                       entry =3D entry->next) {
> +               struct bap_setup *iter_setup =3D entry->data;
> +
> +               if (iter_setup =3D=3D setup)
> +                       continue;
> +
> +               if (setup->qos.bcast.big =3D=3D iter_setup->qos.bcast.big=
) {
> +                       if (setup->same_big_setups =3D=3D NULL)
> +                               setup->same_big_setups =3D queue_new();
> +
> +                       if (iter_setup->same_big_setups =3D=3D NULL)
> +                               iter_setup->same_big_setups =3D queue_new=
();
> +
> +                       queue_push_tail(setup->same_big_setups, iter_setu=
p);
> +                       queue_push_tail(iter_setup->same_big_setups, setu=
p);
> +               }
> +       }
> +}
> +
> +static void bap_pac_foreach_channel(size_t i, uint8_t l, uint8_t t, uint=
8_t *v,
> +                                       void *user_data)
> +{
> +       struct ltv_compare_data *data =3D user_data;
> +       uint32_t location32;
> +
> +       if (!v)
> +               return;
> +
> +       memcpy(&location32, v, l);
> +
> +       /* If all the bits in the received bitmask are found
> +        * in the local bitmask we have a match
> +        */
> +       if ((le32_to_cpu(location32) & data->data32) =3D=3D
> +                       le32_to_cpu(location32))
> +               data->match =3D true;
> +       else
> +               data->match =3D false;
> +}
> +
> +static bool verify_bis_location_suported(struct bap_setup *setup,
> +                                               struct bap_ep *ep)
> +{
> +       uint8_t type =3D LC3_CONFIG_CHAN_ALLOC;
> +       struct ltv_compare_data data;
> +       struct iovec *caps =3D  util_iov_dup(setup->caps, 1);
> +
> +       data.data32 =3D bt_bap_pac_get_locations(ep->lpac);
> +
> +       util_ltv_foreach(caps->iov_base, caps->iov_len, &type,
> +                               bap_pac_foreach_channel, &data);
> +
> +       util_iov_free(caps, 1);
> +
> +       return data.match;
> +}
> +
>  static DBusMessage *set_configuration(DBusConnection *conn, DBusMessage =
*msg,
>                                                                 void *dat=
a)
>  {
> @@ -882,13 +1696,52 @@ static DBusMessage *set_configuration(DBusConnecti=
on *conn, DBusMessage *msg,
>                 setup->qos.ucast.cis_id =3D BT_ISO_QOS_CIS_UNSET;
>         }
>
> +       /* Populate setup with the received data */
>         if (parse_configuration(&props, &setup->caps, &setup->metadata,
> -                               &setup->base, &setup->qos) < 0) {
> +                               &setup->qos, ep->lpac) < 0) {
>                 DBG("Unable to parse configuration");
>                 setup_free(setup);
>                 return btd_error_invalid_args(msg);
>         }
>
> +       if (bt_bap_pac_get_type(ep->lpac) =3D=3D BT_BAP_BCAST_SOURCE) {
> +               /*
> +                * Kernel uses bis id as advertising handler.
> +                * To open all BISes from a big on the same
> +                * advertisng handler set the bis
> +                * to BT_ISO_QOS_BIS_UNSET.
> +                */
> +               setup->qos.bcast.bis =3D BT_ISO_QOS_BIS_UNSET;
> +
> +               if (!verify_bis_location_suported(setup, ep)) {
> +                       DBG("BIS Location is unsupported");
> +                       return btd_error_invalid_args(msg);
> +               }
> +               bt_bap_add_vendor_pac_from_pac(ep->lpac);
> +
> +               /* Link all setups based on the BIG id */
> +               queue_foreach(ep->data->bcast, link_setups, setup);
> +
> +               update_base(setup, data, bap_debug);
> +               update_qos(setup, data);
> +       } else if ((bt_bap_pac_get_type(ep->rpac) =3D=3D BT_BAP_BCAST_SOU=
RCE) &&
> +                       (bt_bap_pac_get_type(ep->lpac) =3D=3D BT_BAP_BCAS=
T_SINK)) {
> +               struct iovec *metadata;
> +               struct iovec *caps;
> +
> +               util_iov_free(setup->caps, 1);
> +               util_iov_free(setup->metadata, 1);
> +
> +               setup->caps =3D new0(struct iovec, 1);
> +               setup->metadata =3D new0(struct iovec, 1);
> +               setup->io =3D ep->data->listen_io;
> +
> +               bt_bap_pac_get_vendor_codec(ep->rpac, NULL, NULL, NULL, &=
caps,
> +                                               &metadata);
> +               bt_bap_ltv_merge(setup->caps, caps, false);
> +               bt_bap_ltv_merge(setup->metadata, metadata, false);
> +       }
> +
>         setup->stream =3D bt_bap_stream_new(ep->data->bap, ep->lpac, ep->=
rpac,
>                                                 &setup->qos, setup->caps)=
;
>
> @@ -900,12 +1753,12 @@ static DBusMessage *set_configuration(DBusConnecti=
on *conn, DBusMessage *msg,
>                 return btd_error_invalid_args(msg);
>         }
>
> -       bt_bap_stream_set_user_data(setup->stream, ep->path);
> -
>         if (setup->metadata && setup->metadata->iov_len)
>                 bt_bap_stream_metadata(setup->stream, setup->metadata, NU=
LL,
>                                                                 NULL);
>
> +       bt_bap_stream_set_user_data(setup->stream, ep->path);
> +
>         switch (bt_bap_stream_get_type(setup->stream)) {
>         case BT_BAP_STREAM_TYPE_UCAST:
>                 setup->msg =3D dbus_message_ref(msg);
> @@ -944,30 +1797,21 @@ static void update_bcast_qos(struct bt_iso_qos *qo=
s,
>         bap_qos->bcast.io_qos.sdu =3D qos->bcast.in.sdu;
>         bap_qos->bcast.io_qos.rtn =3D qos->bcast.in.rtn;
>
> -       bap_qos->bcast.bcode =3D new0(struct iovec, 1);
> -       util_iov_memcpy(bap_qos->bcast.bcode, qos->bcast.bcode,
> -               sizeof(qos->bcast.bcode));
> +       memcpy(bap_qos->bcast.bcode, qos->bcast.bcode,
> +                               sizeof(bap_qos->bcast.bcode));
>  }
>
>  static void iso_bcast_confirm_cb(GIOChannel *io, GError *err, void *user=
_data)
>  {
>         struct bap_setup *setup =3D user_data;
>         struct bap_ep *ep =3D setup->ep;
> -       struct bap_data *data =3D ep->data;
>         struct bt_iso_qos qos;
> -       struct bt_iso_base base;
>         char address[18];
>         int fd;
> -       struct iovec *base_io;
> -       uint32_t presDelay;
> -       uint8_t numSubgroups;
> -       uint8_t numBis;
> -       struct bt_bap_codec codec;
>
>         bt_io_get(io, &err,
>                         BT_IO_OPT_DEST, address,
>                         BT_IO_OPT_QOS, &qos,
> -                       BT_IO_OPT_BASE, &base,
>                         BT_IO_OPT_INVALID);
>         if (err) {
>                 error("%s", err->message);
> @@ -976,25 +1820,15 @@ static void iso_bcast_confirm_cb(GIOChannel *io, G=
Error *err, void *user_data)
>         }
>
>         g_io_channel_ref(io);
> -       btd_service_connecting_complete(data->service, 0);
> +       btd_service_connecting_complete(ep->data->service, 0);
>         DBG("BCAST ISO: sync with %s (BIG 0x%02x BIS 0x%02x)",
>                                         address, qos.bcast.big, qos.bcast=
.bis);
>
>         update_bcast_qos(&qos, &setup->qos);
>
> -       base_io =3D new0(struct iovec, 1);
> -       util_iov_memcpy(base_io, base.base, base.base_len);
> -
> -       parse_base(base_io->iov_base, base_io->iov_len, bap_debug,
> -                       &presDelay, &numSubgroups, &numBis,
> -                       &codec, &setup->caps, &setup->metadata);
> -
> -       /* Update pac with BASE information */
> -       bt_bap_update_bcast_source(ep->rpac, &codec, setup->caps,
> -                                       setup->metadata);
>         setup->id =3D bt_bap_stream_config(setup->stream, &setup->qos,
>                                         setup->caps, NULL, NULL);
> -       data->listen_io =3D io;
> +       setup->io =3D io;
>
>         bt_bap_stream_set_user_data(setup->stream, ep->path);
>
> @@ -1006,25 +1840,39 @@ static void iso_bcast_confirm_cb(GIOChannel *io, =
GError *err, void *user_data)
>                 return;
>         }
>
> -
>         return;
>
>  drop:
>         g_io_channel_shutdown(io, TRUE, NULL);
> -
>  }
>
>  static void iso_pa_sync_confirm_cb(GIOChannel *io, void *user_data)
>  {
>         GError *err =3D NULL;
> +       struct bt_iso_base base;
> +       char address[18];
> +       struct bt_bap_base base_s;
> +       struct bap_data *data =3D user_data;
> +       struct bt_iso_qos qos;
>
> -       if (!bt_io_bcast_accept(io, iso_bcast_confirm_cb,
> -                               user_data, NULL, &err, BT_IO_OPT_INVALID)=
) {
> -               error("bt_io_bcast_accept: %s", err->message);
> +       bt_io_get(io, &err,
> +                       BT_IO_OPT_DEST, address,
> +                       BT_IO_OPT_QOS, &qos,
> +                       BT_IO_OPT_BASE, &base,
> +                       BT_IO_OPT_INVALID);
> +       if (err) {
> +               error("%s", err->message);
>                 g_error_free(err);
> -               g_io_channel_shutdown(io, TRUE, NULL);
> +               return;
>         }
> +       g_io_channel_ref(io);
> +       data->listen_io =3D io;
> +       btd_service_connecting_complete(data->service, 0);
> +
> +       base_s.subgroups =3D queue_new();
> +       parse_base(data->bap, base.base, base.base_len, bap_debug, &base_=
s);
>
> +       bt_bap_update_bcast_source(NULL, &base_s);
>  }
>
>  static bool match_data_bap_data(const void *data, const void *match_data=
)
> @@ -1081,6 +1929,7 @@ static struct bap_ep *ep_register_bcast(struct bap_=
data *data,
>         int i, err =3D 0;
>         const char *suffix;
>         struct match_ep match =3D { lpac, rpac };
> +       const GDBusPropertyTable *properties;
>
>         switch (bt_bap_pac_get_type(lpac)) {
>         case BT_BAP_BCAST_SOURCE:
> @@ -1109,11 +1958,15 @@ static struct bap_ep *ep_register_bcast(struct ba=
p_data *data,
>         case BT_BAP_BCAST_SOURCE:
>                 err =3D asprintf(&ep->path, "%s/pac_%s%d",
>                                 adapter_get_path(adapter), suffix, i);
> +               properties =3D ep_properties_bcast_source;
>                 break;
>         case BT_BAP_BCAST_SINK:
>                 err =3D asprintf(&ep->path, "%s/pac_%s%d",
>                                 device_get_path(device), suffix, i);
> +               properties =3D ep_properties;
>                 break;
> +       default:
> +               return NULL;
>         }
>
>         if (err < 0) {
> @@ -1125,7 +1978,7 @@ static struct bap_ep *ep_register_bcast(struct bap_=
data *data,
>
>         if (g_dbus_register_interface(btd_get_dbus_connection(),
>                         ep->path, MEDIA_ENDPOINT_INTERFACE,
> -                       ep_methods, NULL, ep_properties,
> +                       ep_methods, NULL, properties,
>                         ep, ep_free) =3D=3D FALSE) {
>                 error("Could not register remote ep %s", ep->path);
>                 ep_free(ep);
> @@ -1646,9 +2499,12 @@ static gboolean setup_io_disconnected(GIOChannel *=
io, GIOCondition cond,
>
>         setup_io_close(setup, NULL);
>
> -       /* Check if connecting recreate IO */
> -       if (!is_cig_busy(setup->ep->data, setup->qos.ucast.cig_id))
> -               recreate_cig(setup);
> +       if (bt_bap_stream_get_type(setup->stream) =3D=3D
> +                                       BT_BAP_STREAM_TYPE_UCAST) {
> +               /* Check if connecting recreate IO */
> +               if (!is_cig_busy(setup->ep->data, setup->qos.ucast.cig_id=
))
> +                       recreate_cig(setup);
> +       }
>
>         return FALSE;
>  }
> @@ -1741,7 +2597,7 @@ static void setup_connect_io(struct bap_data *data,=
 struct bap_setup *setup,
>  static void setup_connect_io_broadcast(struct bap_data *data,
>                                         struct bap_setup *setup,
>                                         struct bt_bap_stream *stream,
> -                                       struct bt_iso_qos *qos)
> +                                       struct bt_iso_qos *qos, int defer=
)
>  {
>         struct btd_adapter *adapter =3D data->user_data;
>         GIOChannel *io =3D NULL;
> @@ -1778,7 +2634,7 @@ static void setup_connect_io_broadcast(struct bap_d=
ata *data,
>                         BT_IO_OPT_MODE, BT_IO_MODE_ISO,
>                         BT_IO_OPT_QOS, qos,
>                         BT_IO_OPT_BASE, &base,
> -                       BT_IO_OPT_DEFER_TIMEOUT, false,
> +                       BT_IO_OPT_DEFER_TIMEOUT, defer,
>                         BT_IO_OPT_INVALID);
>
>         if (!io) {
> @@ -1832,41 +2688,28 @@ static void setup_listen_io_broadcast(struct bap_=
data *data,
>                                         struct bt_bap_stream *stream,
>                                         struct bt_iso_qos *qos)
>  {
> -       GIOChannel *io;
>         GError *err =3D NULL;
>         struct sockaddr_iso_bc iso_bc_addr;
>
>         iso_bc_addr.bc_bdaddr_type =3D btd_device_get_bdaddr_type(data->d=
evice);
>         memcpy(&iso_bc_addr.bc_bdaddr, device_get_address(data->device),
>                         sizeof(bdaddr_t));
> -       iso_bc_addr.bc_bis[0] =3D 1;
>         iso_bc_addr.bc_num_bis =3D 1;
> +       iso_bc_addr.bc_bis[0] =3D strtol(bt_bap_pac_get_name(setup->ep->r=
pac),
> +                                       NULL, 10);
>
>         DBG("stream %p", stream);
>
> -       /* If IO already set skip creating it again */
> -       if (bt_bap_stream_get_io(stream) || data->listen_io)
> -               return;
> -
> -       io =3D bt_io_listen(NULL, iso_pa_sync_confirm_cb, setup, NULL, &e=
rr,
> -                       BT_IO_OPT_SOURCE_BDADDR,
> -                       btd_adapter_get_address(data->adapter),
> -                       BT_IO_OPT_DEST_BDADDR,
> -                       device_get_address(data->device),
> -                       BT_IO_OPT_DEST_TYPE,
> -                       btd_device_get_bdaddr_type(data->device),
> -                       BT_IO_OPT_MODE, BT_IO_MODE_ISO,
> -                       BT_IO_OPT_QOS, &qos->bcast,
> -                       BT_IO_OPT_ISO_BC_NUM_BIS, iso_bc_addr.bc_num_bis,
> -                       BT_IO_OPT_ISO_BC_BIS, iso_bc_addr.bc_bis,
> -                       BT_IO_OPT_INVALID);
> -       if (!io) {
> -               error("%s", err->message);
> +       if (!bt_io_bcast_accept(setup->io,
> +                               iso_bcast_confirm_cb,
> +                               setup, NULL, &err,
> +                               BT_IO_OPT_ISO_BC_NUM_BIS,
> +                               iso_bc_addr.bc_num_bis, BT_IO_OPT_ISO_BC_=
BIS,
> +                               iso_bc_addr.bc_bis, BT_IO_OPT_INVALID)) {
> +               error("bt_io_bcast_accept: %s", err->message);
>                 g_error_free(err);
> +               g_io_channel_shutdown(setup->ep->data->listen_io, TRUE, N=
ULL);
>         }
> -       setup->io =3D io;
> -       data->listen_io =3D io;
> -
>  }
>  static void setup_create_ucast_io(struct bap_data *data,
>                                         struct bap_setup *setup,
> @@ -1902,32 +2745,37 @@ static void setup_create_bcast_io(struct bap_data=
 *data,
>                                         struct bt_bap_stream *stream, int=
 defer)
>  {
>         struct bt_iso_qos iso_qos;
> +       struct bt_bap_qos *qos;
>
> -       memset(&iso_qos, 0, sizeof(iso_qos));
>
> -       if (!defer)
> -               goto done;
> +       memset(&iso_qos, 0, sizeof(iso_qos));
>
> -       iso_qos.bcast.big =3D setup->qos.bcast.big;
> -       iso_qos.bcast.bis =3D setup->qos.bcast.bis;
> -       iso_qos.bcast.sync_factor =3D setup->qos.bcast.sync_factor;
> -       iso_qos.bcast.packing =3D setup->qos.bcast.packing;
> -       iso_qos.bcast.framing =3D setup->qos.bcast.framing;
> -       iso_qos.bcast.encryption =3D setup->qos.bcast.encryption;
> -       if (setup->qos.bcast.bcode)
> -               memcpy(iso_qos.bcast.bcode, setup->qos.bcast.bcode->iov_b=
ase,
> -                                                                       1=
6);
> -       iso_qos.bcast.options =3D setup->qos.bcast.options;
> -       iso_qos.bcast.skip =3D setup->qos.bcast.skip;
> -       iso_qos.bcast.sync_timeout =3D setup->qos.bcast.sync_timeout;
> -       iso_qos.bcast.sync_cte_type =3D setup->qos.bcast.sync_cte_type;
> -       iso_qos.bcast.mse =3D setup->qos.bcast.mse;
> -       iso_qos.bcast.timeout =3D setup->qos.bcast.timeout;
> -       memcpy(&iso_qos.bcast.out, &setup->qos.bcast.io_qos,
> +       if (bt_bap_pac_get_type(setup->ep->lpac) =3D=3D
> +                                       BT_BAP_BCAST_SOURCE)
> +               qos =3D &setup->combined_qos;
> +       else
> +               qos =3D &setup->qos;
> +
> +       iso_qos.bcast.big =3D qos->bcast.big;
> +       iso_qos.bcast.bis =3D qos->bcast.bis;
> +       iso_qos.bcast.sync_factor =3D qos->bcast.sync_factor;
> +       iso_qos.bcast.packing =3D qos->bcast.packing;
> +       iso_qos.bcast.framing =3D qos->bcast.framing;
> +       iso_qos.bcast.encryption =3D qos->bcast.encryption;
> +       memcpy(iso_qos.bcast.bcode, qos->bcast.bcode,
> +                               sizeof(iso_qos.bcast.bcode));
> +       iso_qos.bcast.options =3D qos->bcast.options;
> +       iso_qos.bcast.skip =3D qos->bcast.skip;
> +       iso_qos.bcast.sync_timeout =3D qos->bcast.sync_timeout;
> +       iso_qos.bcast.sync_cte_type =3D qos->bcast.sync_cte_type;
> +       iso_qos.bcast.mse =3D qos->bcast.mse;
> +       iso_qos.bcast.timeout =3D qos->bcast.timeout;
> +       memcpy(&iso_qos.bcast.out, &qos->bcast.io_qos,
>                                 sizeof(struct bt_iso_io_qos));
> -done:
> +
>         if (bt_bap_pac_get_type(setup->ep->lpac) =3D=3D BT_BAP_BCAST_SOUR=
CE)
> -               setup_connect_io_broadcast(data, setup, stream, &iso_qos)=
;
> +               setup_connect_io_broadcast(data, setup, stream,
> +                                               &iso_qos, defer);
>         else
>                 setup_listen_io_broadcast(data, setup, stream, &iso_qos);
>  }
> @@ -1953,6 +2801,30 @@ static void setup_create_io(struct bap_data *data,=
 struct bap_setup *setup,
>                 break;
>         }
>  }
> +/*
> + * Function  test_linked_streams_state will check if all linked streams
> + * have the test state.
> + * If all streams are in test_state returns true; Else returns false
> + */
> +static bool test_linked_streams_state(struct bap_setup *setup,
> +                                               uint8_t test_state)
> +{
> +       const struct queue_entry *entry;
> +       struct bap_setup *linked_setups;
> +
> +       if (!setup->same_big_setups)
> +               return true;
> +
> +       for (entry =3D queue_get_entries(setup->same_big_setups); entry;
> +                                               entry =3D entry->next) {
> +               linked_setups =3D entry->data;
> +               if (bt_bap_stream_get_state(linked_setups->stream) !=3D
> +                                                       test_state)
> +                       return false;
> +       }
> +
> +       return true;
> +}
>
>  static void bap_state(struct bt_bap_stream *stream, uint8_t old_state,
>                                 uint8_t new_state, void *user_data)
> @@ -1983,17 +2855,29 @@ static void bap_state(struct bt_bap_stream *strea=
m, uint8_t old_state,
>                 break;
>         case BT_BAP_STREAM_STATE_CONFIG:
>                 if (setup && !setup->id) {
> -                       setup_create_io(data, setup, stream, true);
> -                       if (!setup->io) {
> -                               error("Unable to create io");
> -                               if (old_state !=3D BT_BAP_STREAM_STATE_RE=
LEASING)
> -                                       bt_bap_stream_release(stream, NUL=
L,
> -                                                               NULL);
> -                               return;
> -                       }
> -
>                         if (bt_bap_stream_get_type(stream) =3D=3D
> +                                       BT_BAP_STREAM_TYPE_BCAST) {
> +                               bool defer =3D !test_linked_streams_state=
(setup,
> +                                               BT_BAP_STREAM_STATE_CONFI=
G);
> +                               setup_create_io(data, setup, stream, defe=
r);
> +                               if (!setup->io) {
> +                                       error("Unable to create io");
> +                                       if (old_state !=3D
> +                                               BT_BAP_STREAM_STATE_RELEA=
SING)
> +                                               bt_bap_stream_release(str=
eam,
> +                                                               NULL,
> +                                                               NULL);
> +                                       return;
> +                               }
> +                       } else if (bt_bap_stream_get_type(stream) =3D=3D
>                                         BT_BAP_STREAM_TYPE_UCAST) {
> +                               setup_create_io(data, setup, stream, true=
);
> +                               if (!setup->io) {
> +                                       error("Unable to create io");
> +                                       bt_bap_stream_release(stream,
> +                                                               NULL, NUL=
L);
> +                                       return;
> +                               }
>                                 /* Wait QoS response to respond */
>                                 setup->id =3D bt_bap_stream_qos(stream,
>                                                                 &setup->q=
os,
> @@ -2311,6 +3195,12 @@ static int bap_bcast_probe(struct btd_service *ser=
vice)
>         struct btd_gatt_database *database =3D btd_adapter_get_database(a=
dapter);
>         struct bap_data *data =3D btd_service_get_user_data(service);
>         char addr[18];
> +       GIOChannel *io;
> +       GError *err =3D NULL;
> +       struct sockaddr_iso_bc iso_bc_addr;
> +
> +       iso_bc_addr.bc_bis[0] =3D 1;
> +       iso_bc_addr.bc_num_bis =3D 1;
>
>         ba2str(device_get_address(device), addr);
>
> @@ -2349,7 +3239,24 @@ static int bap_bcast_probe(struct btd_service *ser=
vice)
>
>         bt_bap_set_user_data(data->bap, service);
>
> -       bt_bap_new_bcast_source(data->bap, device_get_path(device));
> +       DBG("Create PA sync with source");
> +       io =3D bt_io_listen(NULL, iso_pa_sync_confirm_cb, data, NULL, &er=
r,
> +                       BT_IO_OPT_SOURCE_BDADDR,
> +                       btd_adapter_get_address(data->adapter),
> +                       BT_IO_OPT_DEST_BDADDR,
> +                       device_get_address(data->device),
> +                       BT_IO_OPT_DEST_TYPE,
> +                       btd_device_get_bdaddr_type(data->device),
> +                       BT_IO_OPT_MODE, BT_IO_MODE_ISO,
> +                       BT_IO_OPT_QOS, &default_qos,
> +                       BT_IO_OPT_ISO_BC_NUM_BIS, iso_bc_addr.bc_num_bis,
> +                       BT_IO_OPT_ISO_BC_BIS, iso_bc_addr.bc_bis,
> +                       BT_IO_OPT_INVALID);
> +       if (!io) {
> +               error("%s", err->message);
> +               g_error_free(err);
> +       }
> +
>         return 0;
>  }
>
> diff --git a/profiles/audio/transport.c b/profiles/audio/transport.c
> index a4696154a..657474a67 100644
> --- a/profiles/audio/transport.c
> +++ b/profiles/audio/transport.c
> @@ -172,7 +172,9 @@ find_transport_by_bap_stream(const struct bt_bap_stre=
am *stream)
>                 struct bap_transport *bap;
>
>                 if (strcasecmp(uuid, PAC_SINK_UUID) &&
> -                               strcasecmp(uuid, PAC_SOURCE_UUID))
> +                               strcasecmp(uuid, PAC_SOURCE_UUID) &&
> +                               strcasecmp(uuid, BCAA_SERVICE_UUID) &&
> +                               strcasecmp(uuid, BAA_SERVICE_UUID))
>                         continue;
>
>                 bap =3D transport->data;
> @@ -776,7 +778,11 @@ static gboolean get_device(const GDBusPropertyTable =
*property,
>         if (transport->device)
>                 path =3D device_get_path(transport->device);
>         else
> -               path =3D adapter_get_path(transport->adapter);
> +               /*
> +                *Use remote endpoint path as fake device path
> +                *for broadcast source transport
> +                */
> +               path =3D transport->remote_endpoint;
>
>         dbus_message_iter_append_basic(iter, DBUS_TYPE_OBJECT_PATH, &path=
);
>
> @@ -1132,6 +1138,7 @@ static gboolean get_bcast_qos(const GDBusPropertyTa=
ble *property,
>         struct media_transport *transport =3D data;
>         struct bap_transport *bap =3D transport->data;
>         DBusMessageIter dict;
> +       uint8_t *temp =3D bap->qos.bcast.bcode;
>
>         dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY,
>                                         DBUS_DICT_ENTRY_BEGIN_CHAR_AS_STR=
ING
> @@ -1150,10 +1157,9 @@ static gboolean get_bcast_qos(const GDBusPropertyT=
able *property,
>                                         &bap->qos.bcast.packing);
>         dict_append_entry(&dict, "Framing", DBUS_TYPE_BYTE,
>                                         &bap->qos.bcast.framing);
> -       if (bap->qos.bcast.bcode)
> -               dict_append_array(&dict, "BCode", DBUS_TYPE_BYTE,
> -                                       &bap->qos.bcast.bcode->iov_base,
> -                                       bap->qos.bcast.bcode->iov_len);
> +       dict_append_array(&dict, "BCode", DBUS_TYPE_BYTE,
> +                                       &temp,
> +                                       sizeof(bap->qos.bcast.bcode));
>         dict_append_entry(&dict, "Options", DBUS_TYPE_BYTE,
>                                         &bap->qos.bcast.options);
>         dict_append_entry(&dict, "Skip", DBUS_TYPE_UINT16,
> @@ -1614,9 +1620,10 @@ static void bap_state_changed(struct bt_bap_stream=
 *stream, uint8_t old_state,
>                 /* If a request is pending wait it to complete */
>                 if (owner && owner->pending)
>                         return;
> -               bap_update_links(transport);
> -               if (!media_endpoint_is_broadcast(transport->endpoint))
> +               if (!media_endpoint_is_broadcast(transport->endpoint)) {
> +                       bap_update_links(transport);
>                         bap_update_qos(transport);
> +               }
>                 else if (bt_bap_stream_io_dir(stream) !=3D BT_BAP_BCAST_S=
OURCE)
>                         bap_update_bcast_qos(transport);
>                 transport_update_playing(transport, FALSE);
> @@ -1633,7 +1640,7 @@ static void bap_state_changed(struct bt_bap_stream =
*stream, uint8_t old_state,
>                         bap_update_bcast_qos(transport);
>                 break;
>         case BT_BAP_STREAM_STATE_RELEASING:
> -               if (bt_bap_stream_io_dir(stream) =3D=3D BT_BAP_BCAST_SINK=
)
> +               if (!bt_bap_stream_io_dir(stream))
>                         return;
>                 break;
>         }
> diff --git a/src/shared/bap.c b/src/shared/bap.c
> index 078d308dc..6934c6d2d 100644
> --- a/src/shared/bap.c
> +++ b/src/shared/bap.c
> @@ -30,6 +30,7 @@
>  #include "src/shared/bap.h"
>  #include "src/shared/ascs.h"
>  #include "src/shared/bap-debug.h"
> +#include "src/shared/lc3.h"
>
>  /* Maximum number of ASE(s) */
>  #define NUM_SINKS 2
> @@ -260,6 +261,8 @@ static struct queue *bap_db;
>  static struct queue *bap_cbs;
>  static struct queue *sessions;
>
> +static bool bt_bap_new_bcast_sink(struct bt_bap *bap);
> +
>  static bool bap_db_match(const void *data, const void *match_data)
>  {
>         const struct bt_bap_db *bdb =3D data;
> @@ -1343,6 +1346,12 @@ static void stream_set_state_broadcast(struct bt_b=
ap_stream *stream,
>
>         bt_bap_ref(bap);
>
> +       switch (stream->ep->state) {
> +       case BT_ASCS_ASE_STATE_QOS:
> +               bap_stream_update_io_links(stream);
> +               break;
> +       }
> +
>         for (entry =3D queue_get_entries(bap->state_cbs); entry;
>                                                         entry =3D entry->=
next) {
>                 struct bt_bap_state *state =3D entry->data;
> @@ -2377,21 +2386,6 @@ static struct bt_bap_pac *bap_pac_find(struct bt_b=
ap_db *bdb, uint8_t type,
>         return NULL;
>  }
>
> -static void *ltv_merge(struct iovec *data, struct iovec *cont)
> -{
> -       uint8_t delimiter =3D 0;
> -
> -       if (!data)
> -               return NULL;
> -
> -       if (!cont || !cont->iov_len || !cont->iov_base)
> -               return data->iov_base;
> -
> -       iov_append(data, sizeof(delimiter), &delimiter);
> -
> -       return iov_append(data, cont->iov_len, cont->iov_base);
> -}
> -
>  static void bap_pac_foreach_channel(size_t i, uint8_t l, uint8_t t, uint=
8_t *v,
>                                         void *user_data)
>  {
> @@ -2427,7 +2421,7 @@ static void bap_pac_merge(struct bt_bap_pac *pac, s=
truct iovec *data,
>  {
>         /* Merge data into existing record */
>         if (pac->data)
> -               ltv_merge(pac->data, data);
> +               bt_bap_ltv_merge(pac->data, data, true);
>         else
>                 pac->data =3D util_iov_dup(data, 1);
>
> @@ -2436,7 +2430,7 @@ static void bap_pac_merge(struct bt_bap_pac *pac, s=
truct iovec *data,
>
>         /* Merge metadata into existing record */
>         if (pac->metadata)
> -               ltv_merge(pac->metadata, metadata);
> +               bt_bap_ltv_merge(pac->metadata, metadata, true);
>         else
>                 pac->metadata =3D util_iov_dup(metadata, 1);
>  }
> @@ -2650,6 +2644,8 @@ static void bap_add_broadcast_source(struct bt_bap_=
pac *pac)
>  static void bap_add_broadcast_sink(struct bt_bap_pac *pac)
>  {
>         queue_push_tail(pac->bdb->broadcast_sinks, pac);
> +
> +       pacs_add_sink_location(pac->bdb->pacs, pac->qos.location);
>  }
>
>  static void notify_pac_added(void *data, void *user_data)
> @@ -2668,6 +2664,20 @@ static void notify_session_pac_added(void *data, v=
oid *user_data)
>         queue_foreach(bap->pac_cbs, notify_pac_added, user_data);
>  }
>
> +struct bt_bap_pac *bt_bap_add_vendor_pac_from_pac(struct bt_bap_pac *pac=
)
> +{
> +       struct bt_bap_pac *new_pac;
> +
> +       new_pac =3D bt_bap_add_vendor_pac(pac->bdb->db, pac->name, pac->t=
ype,
> +                                                       pac->codec.id,
> +                                                       pac->codec.cid,
> +                                                       pac->codec.cid,
> +                                                       &pac->qos, pac->d=
ata,
> +                                                       pac->metadata);
> +       bt_bap_pac_set_ops(new_pac, pac->ops, pac->user_data);
> +       return new_pac;
> +}
> +
>  struct bt_bap_pac *bt_bap_add_vendor_pac(struct gatt_db *db,
>                                         const char *name, uint8_t type,
>                                         uint8_t id, uint16_t cid, uint16_=
t vid,
> @@ -2725,7 +2735,7 @@ struct bt_bap_pac *bt_bap_add_pac(struct gatt_db *d=
b, const char *name,
>                                         struct iovec *metadata)
>  {
>         return bt_bap_add_vendor_pac(db, name, type, id, 0x0000, 0x0000, =
qos,
> -                                                       data, metadata);
> +                                                   data, metadata);
>  }
>
>  uint8_t bt_bap_pac_get_type(struct bt_bap_pac *pac)
> @@ -2748,13 +2758,24 @@ uint32_t bt_bap_pac_get_locations(struct bt_bap_p=
ac *pac)
>         switch (pac->type) {
>         case BT_BAP_SOURCE:
>                 return pacs->source_loc_value;
> +       case BT_BAP_BCAST_SOURCE:
> +               return pac->qos.location;
>         case BT_BAP_SINK:
> +       case BT_BAP_BCAST_SINK:
>                 return pacs->sink_loc_value;
>         default:
>                 return 0;
>         }
>  }
>
> +struct iovec *bt_bap_pac_get_data(struct bt_bap_pac *pac)
> +{
> +       if (!pac)
> +               return 0x00;
> +
> +       return pac->data;
> +}
> +
>  uint16_t bt_bap_pac_get_supported_context(struct bt_bap_pac *pac)
>  {
>         struct bt_pacs *pacs;
> @@ -2837,12 +2858,26 @@ static void notify_session_pac_removed(void *data=
, void *user_data)
>  bool bt_bap_pac_set_ops(struct bt_bap_pac *pac, struct bt_bap_pac_ops *o=
ps,
>                                         void *user_data)
>  {
> +       const struct queue_entry *entry =3D NULL;
> +       struct bt_bap_pac *pac_entry;
> +
>         if (!pac)
>                 return false;
>
>         pac->ops =3D ops;
>         pac->user_data =3D user_data;
>
> +       if (pac->type =3D=3D BT_BAP_BCAST_SOURCE) {
> +               for (entry =3D queue_get_entries(pac->bdb->broadcast_sour=
ces);
> +                                       entry !=3D NULL; entry =3D entry-=
>next) {
> +                       pac_entry =3D entry->data;
> +                       if (pac_entry !=3D pac) {
> +                               pac_entry->ops =3D ops;
> +                               pac_entry->user_data =3D user_data;
> +                       }
> +               }
> +       }
> +
>         return true;
>  }
>
> @@ -4489,6 +4524,11 @@ bool bt_bap_pac_bcast_is_local(struct bt_bap *bap,=
 struct bt_bap_pac *pac)
>         return false;
>  }
>
> +char *bt_bap_pac_get_name(struct bt_bap_pac *pac)
> +{
> +       return pac->name;
> +}
> +
>  static bool find_ep_unused(const void *data, const void *user_data)
>  {
>         const struct bt_bap_endpoint *ep =3D data;
> @@ -4618,7 +4658,6 @@ unsigned int bt_bap_stream_config(struct bt_bap_str=
eam *stream,
>                 if (stream->lpac->type =3D=3D BT_BAP_BCAST_SINK) {
>                         if (data)
>                                 stream_config(stream, data, NULL);
> -                       stream_set_state(stream, BT_BAP_STREAM_STATE_CONF=
IG);
>                 }
>                 return 1;
>         }
> @@ -4763,7 +4802,7 @@ struct bt_bap_stream *bt_bap_stream_new(struct bt_b=
ap *bap,
>                         return NULL;
>
>                 bt_bap_foreach_pac(bap, type, match_pac, &match);
> -               if (!match.lpac)
> +               if ((!match.lpac) || (!lpac))
>                         return NULL;
>                 if (!match.rpac && (lpac->type !=3D BT_BAP_BCAST_SOURCE))
>                         return NULL;
> @@ -4780,7 +4819,15 @@ struct bt_bap_stream *bt_bap_stream_new(struct bt_=
bap *bap,
>         if (!ep) {
>                 /* Check for unused ASE */
>                 ep =3D queue_find(bap->remote_eps, find_ep_unused, &match=
);
> -               if (!ep) {
> +               if (!ep && lpac->type =3D=3D BT_BAP_BCAST_SOURCE) {
> +                       bt_bap_new_bcast_sink(bap);
> +                       ep =3D queue_find(bap->remote_eps, find_ep_unused=
,
> +                                                               &match);
> +                       if (!ep) {
> +                               DBG(bap, "Unable to find unused ASE");
> +                               return NULL;
> +                       }
> +               } else if (!ep) {
>                         DBG(bap, "Unable to find unused ASE");
>                         return NULL;
>                 }
> @@ -4943,11 +4990,10 @@ unsigned int bt_bap_stream_enable(struct bt_bap_s=
tream *stream,
>         case BT_BAP_STREAM_TYPE_BCAST:
>                 if (!bt_bap_stream_io_dir(stream))
>                         stream_set_state_broadcast(stream,
> -                               BT_BAP_STREAM_STATE_CONFIG);
> +                                               BT_BAP_STREAM_STATE_CONFI=
G);
>                 else if (bt_bap_stream_io_dir(stream) =3D=3D BT_BAP_BCAST=
_SOURCE)
>                         stream_set_state_broadcast(stream,
>                                  BT_BAP_STREAM_STATE_STREAMING);
> -
>                 return 1;
>         }
>
> @@ -5094,13 +5140,21 @@ unsigned int bt_bap_stream_metadata(struct bt_bap=
_stream *stream,
>         if (!stream)
>                 return 0;
>
> -       if (!stream->client) {
> -               stream_metadata(stream, metadata, NULL);
> +       switch (bt_bap_stream_get_type(stream)) {
> +       case BT_BAP_STREAM_TYPE_UCAST:
> +               if (!stream->client) {
> +                       stream_metadata(stream, metadata, NULL);
> +                       return 0;
> +               }
> +               return bap_stream_metadata(stream, BT_ASCS_METADATA,
> +                               metadata, func, user_data);
> +       case BT_BAP_STREAM_TYPE_BCAST:
> +               util_iov_free(stream->meta, 1);
> +               stream->meta =3D util_iov_dup(metadata, 1);
> +               return 1;
> +       default:
>                 return 0;
>         }
> -
> -       return bap_stream_metadata(stream, BT_ASCS_METADATA, metadata, fu=
nc,
> -                                                               user_data=
);
>  }
>
>  unsigned int bt_bap_stream_release(struct bt_bap_stream *stream,
> @@ -5207,6 +5261,14 @@ struct iovec *bt_bap_stream_get_metadata(struct bt=
_bap_stream *stream)
>         return stream->meta;
>  }
>
> +struct bt_bap_pac *bt_bap_stream_get_local_pac(struct bt_bap_stream *str=
eam)
> +{
> +       if (!stream)
> +               return NULL;
> +
> +       return stream->lpac;
> +}
> +
>  struct io *bt_bap_stream_get_io(struct bt_bap_stream *stream)
>  {
>         struct bt_bap_stream_io *io;
> @@ -5265,6 +5327,23 @@ static bool match_name(const void *data, const voi=
d *match_data)
>         return (!strcmp(pac->name, name));
>  }
>
> +void *bt_bap_ltv_merge(struct iovec *data, struct iovec *cont,
> +                                               bool add_delimiter)
> +{
> +       uint8_t delimiter =3D 0;
> +
> +       if (!data)
> +               return NULL;
> +
> +       if (!cont || !cont->iov_len || !cont->iov_base)
> +               return data->iov_base;
> +
> +       if (add_delimiter)
> +               iov_append(data, sizeof(delimiter), &delimiter);
> +
> +       return iov_append(data, cont->iov_len, cont->iov_base);
> +}
> +
>  int bt_bap_stream_cancel(struct bt_bap_stream *stream, unsigned int id)
>  {
>         struct bt_bap_req *req;
> @@ -5301,9 +5380,9 @@ int bt_bap_stream_io_link(struct bt_bap_stream *str=
eam,
>                 return -EALREADY;
>
>         if (stream->client !=3D link->client ||
> -                       stream->qos.ucast.cig_id !=3D link->qos.ucast.cig=
_id ||
> -                       stream->qos.ucast.cis_id !=3D link->qos.ucast.cis=
_id ||
> -                       stream->ep->dir =3D=3D link->ep->dir)
> +               stream->qos.ucast.cig_id !=3D link->qos.ucast.cig_id ||
> +               stream->qos.ucast.cis_id !=3D link->qos.ucast.cis_id ||
> +               stream->ep->dir =3D=3D link->ep->dir)
>                 return -EINVAL;
>
>         stream->link =3D link;
> @@ -5484,11 +5563,301 @@ bool bt_bap_new_bcast_source(struct bt_bap *bap,=
 const char *name)
>         return true;
>  }
>
> +static bool bt_bap_new_bcast_sink(struct bt_bap *bap)
> +{
> +       struct bt_bap_endpoint *ep;
> +
> +       /* Push remote endpoint with direction source */
> +       ep =3D bap_endpoint_new_broadcast(bap->ldb, BT_BAP_BCAST_SOURCE);
> +
> +       if (ep)
> +               queue_push_tail(bap->remote_eps, ep);
> +
> +       ep->bap =3D bap;
> +       return true;
> +}
> +
> +struct ltv_compare_data {
> +       bool match;
> +       void *data;
> +       uint32_t data32;
> +};
> +
> +static void bap_sink_match_allocation(size_t i, uint8_t l, uint8_t t,
> +               uint8_t *v, void *user_data)
> +{
> +       struct ltv_compare_data *data =3D user_data;
> +       uint32_t location32;
> +
> +       if (!v)
> +               return;
> +
> +       memcpy(&location32, v, l);
> +
> +       /* If all the bits in the received bitmask are found in
> +        * the local bitmask then we have a match
> +        */
> +       if ((le32_to_cpu(location32) & data->data32) =3D=3D
> +                       le32_to_cpu(location32))
> +               data->match =3D true;
> +       else
> +               data->match =3D false;
> +}
> +
> +static void bap_sink_match_caps_ltv(size_t i, uint8_t l, uint8_t t, uint=
8_t *v,
> +                                       void *user_data)
> +{
> +       struct ltv_compare_data *local_data =3D user_data;
> +       struct iovec local_caps =3D *((struct iovec *)local_data->data);
> +       struct bt_ltv *ltv =3D NULL;
> +       bool found =3D false;
> +
> +       /* Search for {l,t,v} in local_caps */
> +       do {
> +               ltv =3D util_iov_pull_mem(&local_caps, sizeof(*ltv));
> +
> +               if (ltv !=3D NULL) {
> +                       /* If the LTV is found, continue */
> +                       if (ltv->type =3D=3D t) {
> +                               switch (ltv->type) {
> +                               case LC3_FREQ:
> +                               {
> +                                       uint16_t val16 =3D
> +                                               *((uint16_t *)ltv->value)=
;
> +                                       val16 =3D le16_to_cpu(val16);
> +                                       if (val16 & (1 << (v[0] - 1)))
> +                                               found =3D true;
> +                               }
> +                               break;
> +                               case LC3_DURATION:
> +                                       if ((ltv->value[0]) & (1 << v[0])=
)
> +                                               found =3D true;
> +                                       break;
> +                               /* LC3_CHAN_COUNT */
> +                               case LC3_FRAME_LEN:
> +                               {
> +                                       uint16_t min =3D
> +                                               *((uint16_t *)ltv->value)=
;
> +                                       uint16_t max =3D
> +                                       *((uint16_t *)(&ltv->value[2]));
> +                                       uint16_t frame_len =3D *((uint16_=
t *)v);
> +
> +                                       min =3D le16_to_cpu(min);
> +                                       max =3D le16_to_cpu(max);
> +                                       frame_len =3D le16_to_cpu(frame_l=
en);
> +                                       if ((frame_len >=3D min) &&
> +                                                       (frame_len <=3D m=
ax))
> +                                               found =3D true;
> +                               }
> +                               /* LC3_FRAME_COUNT */
> +                               break;
> +                               }
> +
> +                               if (found)
> +                                       /* Matching LTV found -> mark it
> +                                        * in the output bitmask
> +                                        */
> +                                       local_data->data32 |=3D 1<<t;
> +                       }
> +
> +                       /* Advance over data field */
> +                       (void)util_iov_pull_mem(&local_caps, ltv->len - 1=
);
> +               }
> +       } while ((local_caps.iov_len > 0) && (ltv !=3D NULL) &&
> +                       (found =3D=3D false));
> +}
> +
> +static void check_capabilities(void *data, void *user_data)
> +{
> +       struct ltv_compare_data *ltv_data =3D user_data;
> +
> +       #define Codec_Specific_Configuration_Check_Mask (\
> +                       (1<<LC3_FREQ)|\
> +                       (1<<LC3_DURATION)|\
> +                       /*(1<<LC3_CONFIG_CHAN_ALLOC)|\*/\
> +                       (1<<LC3_FRAME_LEN))
> +
> +       /* Keep searching for a matching PAC if one wasn't found
> +        * in previous PAC elements
> +        */
> +       if (ltv_data->match =3D=3D false) {
> +               const struct bt_bap_pac *pac =3D data;
> +               struct iovec *in_caps =3D (struct iovec *)ltv_data->data;
> +               struct ltv_compare_data local_ltv_data =3D {
> +                               .data =3D pac->data,
> +                               .data32 =3D 0, /* LTVs bitmask result */
> +                               .match =3D false
> +               };
> +
> +               util_ltv_foreach(in_caps->iov_base, in_caps->iov_len, NUL=
L,
> +                               bap_sink_match_caps_ltv, &local_ltv_data)=
;
> +
> +               /* We have a match if all selected LTVs have a match */
> +               if (local_ltv_data.data32 &
> +                               Codec_Specific_Configuration_Check_Mask)
> +                       ltv_data->match =3D true;
> +       }
> +}
> +
> +static bool bap_compare_ltv_capabilities(struct iovec *in_caps,
> +               uint32_t location,
> +               struct queue *local_data)
> +{
> +       struct ltv_compare_data ltv_data =3D {0};
> +       uint8_t type =3D 0;
> +
> +       /* Check Audio_Channel_Allocation LTV from PACS data */
> +       if (location) {
> +               ltv_data.data32 =3D location;
> +               type =3D LC3_CONFIG_CHAN_ALLOC;
> +
> +               util_ltv_foreach(in_caps->iov_base, in_caps->iov_len, &ty=
pe,
> +                               bap_sink_match_allocation, &ltv_data);
> +       }
> +
> +       /* Check remaining LTVs from PACs list */
> +       if (ltv_data.match) {
> +               ltv_data.data =3D in_caps;
> +               ltv_data.match =3D false;
> +               queue_foreach(local_data, check_capabilities, &ltv_data);
> +       }
> +
> +       return ltv_data.match;
> +}
> +
> +static void bap_sink_get_allocation(size_t i, uint8_t l, uint8_t t,
> +               uint8_t *v, void *user_data)
> +{
> +       uint32_t location32;
> +
> +       if (!v)
> +               return;
> +
> +       memcpy(&location32, v, l);
> +       *((uint32_t *)user_data) =3D le32_to_cpu(location32);
> +}
> +
> +static void print_caps(const char *str, void *user_data)
> +{
> +       printf("%s\n\r", str);
> +}
> +
> +static void merge_codec_specific_config(struct iovec *caps_l2,
> +               struct iovec *caps_l3, struct iovec *result)
> +{
> +       struct iovec iov_l2 =3D {0};
> +       struct iovec iov_l3 =3D {0};
> +       struct bt_ltv *ltv2 =3D NULL;
> +
> +       /* Loop Level 2 LTVs */
> +       iov_l2 =3D *caps_l2;
> +       do {
> +               iov_l3 =3D *caps_l3;
> +               ltv2 =3D util_iov_pull_mem(&iov_l2, sizeof(*ltv2));
> +
> +               if (ltv2 !=3D NULL) {
> +                       struct bt_ltv *ltv3 =3D NULL;
> +                       bool found =3D false; /* found at Level3? */
> +
> +                       /* Loop Level 3 LTVs */
> +                       do {
> +                               ltv3 =3D util_iov_pull_mem(&iov_l3,
> +                                                       sizeof(*ltv3));
> +
> +                               if (ltv3 !=3D NULL) {
> +                                       /* If the LTV is found,
> +                                        * continue
> +                                        */
> +                                       if (ltv3->type =3D=3D ltv2->type)
> +                                               found =3D true;
> +
> +                                       /* Advance over data field */
> +                                       (void)util_iov_pull_mem(&iov_l3,
> +                                                       ltv3->len - 1);
> +                               }
> +                       } while ((iov_l3.iov_len > 0) && (ltv3 !=3D NULL)=
 &&
> +                                       (found =3D=3D false));
> +
> +                       /* In case LTV (L3) was not found at L2 add it */
> +                       if (!found)
> +                               iov_append(result, ltv2->len + 1, ltv2);
> +                       /* In case LTV (L3) was found at L2,
> +                        * get the one at Level 3
> +                        */
> +                       else
> +                               iov_append(result, ltv3->len + 1, ltv3);
> +
> +                       /* Advance over data field */
> +                       (void)util_iov_pull_mem(&iov_l2, ltv2->len - 1);
> +               }
> +       } while ((iov_l2.iov_len > 0) && (ltv2 !=3D NULL));
> +}
> +
> +static void bis_to_pac(void *data, void *user_data)
> +{
> +       struct bt_bap_bis *bis =3D data;
> +       struct bt_bap_base_subgroup *subgroup =3D user_data;
> +       struct bt_bap_pac *pac_source_bis;
> +       struct bt_bap_endpoint *ep;
> +       int err =3D 0;
> +       struct bt_bap_pac_qos bis_qos =3D {0};
> +       uint8_t type =3D 0;
> +       struct iovec *iov_bis =3D new0(struct iovec, 1);
> +
> +       /* Create a Codec Specific Configuration with LTVs at level 2
> +        * overwritten by LTVs at level 3
> +        */
> +       merge_codec_specific_config(subgroup->caps, bis->caps, iov_bis);
> +
> +       /* Search in local database to see if this BIS
> +        * matches our capabilities
> +        */
> +       if (bap_compare_ltv_capabilities(iov_bis,
> +                       subgroup->bap->ldb->pacs->sink_loc_value,
> +                       subgroup->bap->ldb->broadcast_sinks) !=3D true)
> +               return;
> +
> +       DBG(subgroup->bap, "Selected BIS %i", bis->bisIndex);
> +       bt_bap_debug_caps(iov_bis->iov_base, iov_bis->iov_len,
> +                       print_caps, NULL);
> +
> +       /* Create a QoS structure based on the received BIS information *=
/
> +       type =3D LC3_CONFIG_CHAN_ALLOC;
> +       util_ltv_foreach(iov_bis->iov_base, iov_bis->iov_len, &type,
> +                       bap_sink_get_allocation, &bis_qos.location);
> +
> +       /* Create a remote PAC */
> +       pac_source_bis =3D bap_pac_new(subgroup->bap->rdb, NULL,
> +                               BT_BAP_BCAST_SOURCE, &subgroup->codec, &b=
is_qos,
> +                               iov_bis, subgroup->meta);
> +
> +       err =3D asprintf(&pac_source_bis->name, "%d", bis->bisIndex);
> +
> +       if (err < 0)
> +               DBG(subgroup->bap, "error in asprintf");
> +
> +       /* Add remote source endpoint */
> +       if (!subgroup->bap->rdb->broadcast_sources)
> +               subgroup->bap->rdb->broadcast_sources =3D queue_new();
> +       queue_push_tail(subgroup->bap->rdb->broadcast_sources, pac_source=
_bis);
> +
> +       queue_foreach(subgroup->bap->pac_cbs, notify_pac_added, pac_sourc=
e_bis);
> +       /* Push remote endpoint with direction sink */
> +       ep =3D bap_endpoint_new_broadcast(subgroup->bap->rdb, BT_BAP_BCAS=
T_SINK);
> +
> +       if (ep)
> +               queue_push_tail(subgroup->bap->remote_eps, ep);
> +
> +       util_iov_free(iov_bis, 1);
> +}
> +static void parse_bis(void *data, void *user_data)
> +{
> +       struct bt_bap_base_subgroup *subgroup =3D data;
> +
> +       queue_foreach(subgroup->bises, bis_to_pac, subgroup);
> +}
>  void bt_bap_update_bcast_source(struct bt_bap_pac *pac,
> -                                       struct bt_bap_codec *codec,
> -                                       struct iovec *data,
> -                                       struct iovec *metadata)
> +                               struct bt_bap_base *base)
>  {
> -       bap_pac_merge(pac, data, metadata);
> -       pac->codec =3D *codec;
> +       queue_foreach(base->subgroups, parse_bis, NULL);
>  }
> diff --git a/src/shared/bap.h b/src/shared/bap.h
> index 51edc08ab..814b3af9e 100644
> --- a/src/shared/bap.h
> +++ b/src/shared/bap.h
> @@ -79,7 +79,7 @@ struct bt_bap_bcast_qos {
>         uint8_t  packing;
>         uint8_t  framing;
>         uint8_t  encryption;
> -       struct iovec *bcode;
> +       uint8_t  bcode[16];
>         uint8_t  options;
>         uint16_t skip;
>         uint16_t sync_timeout;
> @@ -87,6 +87,7 @@ struct bt_bap_bcast_qos {
>         uint8_t  mse;
>         uint16_t timeout;
>         uint8_t  pa_sync;
> +       uint32_t delay;                 /* Presentation Delay */
>         struct bt_bap_io_qos io_qos;
>  };
>
> @@ -97,6 +98,27 @@ struct bt_bap_qos {
>         };
>  };
>
> +struct bt_bap_base {
> +       uint32_t pres_delay;
> +       uint8_t num_subgroups;
> +       struct queue *subgroups;
> +};
> +
> +struct bt_bap_base_subgroup {
> +       uint8_t subgroup_index;
> +       struct bt_bap *bap;
> +       uint8_t num_bises;
> +       struct bt_bap_codec codec;
> +       struct iovec *caps;
> +       struct iovec *meta;
> +       struct queue *bises;
> +};
> +
> +struct bt_bap_bis {
> +       uint8_t bisIndex;
> +       struct iovec *caps;
> +};
> +
>  typedef void (*bt_bap_ready_func_t)(struct bt_bap *bap, void *user_data)=
;
>  typedef void (*bt_bap_destroy_func_t)(void *user_data);
>  typedef void (*bt_bap_debug_func_t)(const char *str, void *user_data);
> @@ -168,6 +190,8 @@ uint8_t bt_bap_pac_get_type(struct bt_bap_pac *pac);
>
>  uint32_t bt_bap_pac_get_locations(struct bt_bap_pac *pac);
>
> +struct iovec *bt_bap_pac_get_data(struct bt_bap_pac *pac);
> +
>  uint16_t bt_bap_pac_get_supported_context(struct bt_bap_pac *pac);
>
>  uint16_t bt_bap_pac_get_context(struct bt_bap_pac *pac);
> @@ -176,6 +200,8 @@ struct bt_bap_pac_qos *bt_bap_pac_get_qos(struct bt_b=
ap_pac *pac);
>
>  uint8_t bt_bap_stream_get_type(struct bt_bap_stream *stream);
>
> +struct bt_bap_pac *bt_bap_add_vendor_pac_from_pac(struct bt_bap_pac *pac=
);
> +
>  struct bt_bap_stream *bt_bap_pac_get_stream(struct bt_bap_pac *pac);
>
>  /* Session related function */
> @@ -231,6 +257,7 @@ int bt_bap_pac_get_codec(struct bt_bap_pac *pac, uint=
8_t *id,
>
>  void bt_bap_pac_set_user_data(struct bt_bap_pac *pac, void *user_data);
>  void *bt_bap_pac_get_user_data(struct bt_bap_pac *pac);
> +char *bt_bap_pac_get_name(struct bt_bap_pac *pac);
>
>  /* Stream related functions */
>  int bt_bap_select(struct bt_bap_pac *lpac, struct bt_bap_pac *rpac,
> @@ -294,6 +321,7 @@ uint32_t bt_bap_stream_get_location(struct bt_bap_str=
eam *stream);
>  struct iovec *bt_bap_stream_get_config(struct bt_bap_stream *stream);
>  struct bt_bap_qos *bt_bap_stream_get_qos(struct bt_bap_stream *stream);
>  struct iovec *bt_bap_stream_get_metadata(struct bt_bap_stream *stream);
> +struct bt_bap_pac *bt_bap_stream_get_local_pac(struct bt_bap_stream *str=
eam);
>
>  struct io *bt_bap_stream_get_io(struct bt_bap_stream *stream);
>  bool bt_bap_match_bcast_sink_stream(const void *data, const void *user_d=
ata);
> @@ -315,9 +343,9 @@ bool bt_bap_stream_io_is_connecting(struct bt_bap_str=
eam *stream, int *fd);
>
>  bool bt_bap_new_bcast_source(struct bt_bap *bap, const char *name);
>  void bt_bap_update_bcast_source(struct bt_bap_pac *pac,
> -                                       struct bt_bap_codec *codec,
> -                                       struct iovec *data,
> -                                       struct iovec *metadata);
> +                               struct bt_bap_base *base);
> +void *bt_bap_ltv_merge(struct iovec *data, struct iovec *cont,
> +                                               bool add_delimiter);
>
>  bool bt_bap_pac_bcast_is_local(struct bt_bap *bap, struct bt_bap_pac *pa=
c);
>
> --
> 2.39.2
>


--=20
Luiz Augusto von Dentz

