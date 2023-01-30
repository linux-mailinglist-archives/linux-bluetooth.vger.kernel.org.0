Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8750681AAC
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Jan 2023 20:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237588AbjA3Tjf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Jan 2023 14:39:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbjA3Tje (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Jan 2023 14:39:34 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9D645BFD
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Jan 2023 11:39:32 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id h17so13680543ljq.4
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Jan 2023 11:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a8RgJKmLksVs2XyJT+I+Eu2Yy8A5PVxcGoGH0GWv3bM=;
        b=BA0SSklORCJDdsjpkgd6aH/TYXyl30UbqA4hUQouF8M7sE0E9v5r2rPsvf3va9L15D
         QpKXxGT60cgRvgBUDjLNE1lIYKBfEFEASV+uV35E9Cvh+x36VKo7HNMzyUs3dhIh3e/x
         CfX+cxKvDdxi6hgvGVKtu6NECKkndI5UknUAKvyDRieowTRnkFXACEhhvbR2sKy52amO
         kJNOy66D1AKOQ8JVCnf2BWuGgB1bNnsPmB2/6tehjPfmMMNzBYXApAEeftQNKs7UqFYd
         k2fcjus+gExcHP7x9DEzGJJJkw7hFYU/NNeK/afh3c1N3MDeS+2K8nWqboxtMJh2fntZ
         FXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8RgJKmLksVs2XyJT+I+Eu2Yy8A5PVxcGoGH0GWv3bM=;
        b=hS8fLihJeEcH0digkMgT84GoJVnLZOYc1qnT3bvjjy5L+M16+N4mbS2JuDvMU76vEt
         W02NIZ23SQOnH84ETu4ZMzSftaEfFum52xQdfLfAVBVek/by3ZjA57oqdSbIRCgAc4p+
         7JH/OuueL2kx4GSipiXtlSuUSkSuczyiKy/Ez08Nn/iA5RG/OQ2OJy4uJvAZ4t5s6Zqr
         FDkzzCn51rMCd4a0DUwojY4pbWCyqYLvCQNf2LVzLy5eFSEtq3HP2fSWWmzJxVnvTGDw
         CvpKKj/9ieEySyJMLf/jHhx7UJyDbwtjVQDNavkYXm+sGiAP5zZKV1W7jBOjzVVgQHv9
         g0WA==
X-Gm-Message-State: AO0yUKUXQmXi6mS5PSgzX6Fg0GJ3c181y2Ncy7lkO5RkNRIukNNNntrS
        uxx3gDfG6SalICvSMq8blsTWDDCVZSHksewH7WomoByX
X-Google-Smtp-Source: AK7set+VAAONF/AMqrrL8GPQttGToZkZFuomWaiJ88ZjLHnUJQm7pMVVAW6tXd5OSa/wm8ffk1ONYJq6kARueSUwHW8=
X-Received: by 2002:a05:651c:1689:b0:290:6ee9:f774 with SMTP id
 bd9-20020a05651c168900b002906ee9f774mr137080ljb.43.1675107570091; Mon, 30 Jan
 2023 11:39:30 -0800 (PST)
MIME-Version: 1.0
References: <20230127205205.20235-1-pav@iki.fi> <a8aedc0f9a4c1e21d61694589c5b7a9f31cbedc1.1675103676.git.pav@iki.fi>
 <161c4172f60d926d015a5b48de48b890412d57e5.1675103676.git.pav@iki.fi>
In-Reply-To: <161c4172f60d926d015a5b48de48b890412d57e5.1675103676.git.pav@iki.fi>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Mon, 30 Jan 2023 11:39:18 -0800
Message-ID: <CABBYNZ+Vrzpa4ppBkLTcHXbXUgJxL1CsW00yzn-inWqBwUmo2w@mail.gmail.com>
Subject: Re: [PATCH BlueZ 7/8] shared/bap: handle central-only case
To:     Pauli Virtanen <pav@iki.fi>
Cc:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Jan 30, 2023 at 11:06 AM Pauli Virtanen <pav@iki.fi> wrote:
>
> Support central-only case, where no local endpoints are created, and
> nothing is registered in the local GATT database.
>
> In this case, we keep track of the local PACs ("sinks" and "sources"),
> but there are no PACS and ASCS registrations or endpoints.

I'm not really following how that would work without local endpoints
since the endpoints are the interface which is used to setup the
stream with the likes of pipewire/pulseaudio we can't really remove
them, what Id would suggest doing is to have a flag indicating if the
instance is client only or not, that way bt_bap can identify if it
needs to register services or not.

> ---
>  src/shared/bap.c | 58 ++++++++++++++++++++++++++----------------------
>  src/shared/bap.h |  9 +++++---
>  unit/test-bap.c  |  4 +++-
>  3 files changed, 40 insertions(+), 31 deletions(-)
>
> diff --git a/src/shared/bap.c b/src/shared/bap.c
> index 22f2e6714..24113bb34 100644
> --- a/src/shared/bap.c
> +++ b/src/shared/bap.c
> @@ -110,11 +110,13 @@ struct bt_ascs {
>
>  struct bt_bap_db {
>         struct gatt_db *db;
> -       struct bt_pacs *pacs;
> -       struct bt_ascs *ascs;
>         struct queue *sinks;
>         struct queue *sources;
> +
> +       /* The following are NULL if central-only (no GATT) */
>         struct queue *endpoints;
> +       struct bt_pacs *pacs;
> +       struct bt_ascs *ascs;
>  };
>
>  struct bt_bap_req {
> @@ -565,6 +567,7 @@ static void bap_disconnected(int err, void *user_data)
>  static struct bt_bap *bap_get_session(struct bt_att *att, struct gatt_db *db)
>  {
>         const struct queue_entry *entry;
> +       struct bt_bap_db *ldb;
>         struct bt_bap *bap;
>
>         for (entry = queue_get_entries(sessions); entry; entry = entry->next) {
> @@ -574,7 +577,8 @@ static struct bt_bap *bap_get_session(struct bt_att *att, struct gatt_db *db)
>                         return bap;
>         }
>
> -       bap = bt_bap_new(db, NULL);
> +       ldb = bt_bap_get_local_db(db, true);
> +       bap = bt_bap_new(ldb, NULL);
>         bap->att = att;
>
>         bt_bap_attach(bap, NULL);
> @@ -620,7 +624,7 @@ static struct bt_bap_endpoint *bap_get_endpoint(struct bt_bap_db *db,
>  {
>         struct bt_bap_endpoint *ep;
>
> -       if (!db || !attr)
> +       if (!db || !attr || !db->endpoints)
>                 return NULL;
>
>         ep = queue_find(db->endpoints, bap_endpoint_match, attr);
> @@ -652,7 +656,7 @@ static struct bt_bap_endpoint *bap_get_endpoint_id(struct bt_bap *bap,
>         struct gatt_db_attribute *attr = NULL;
>         size_t i;
>
> -       if (!bap || !db)
> +       if (!bap || !db || !db->endpoints)
>                 return NULL;
>
>         ep = queue_find(db->endpoints, bap_endpoint_match_id, UINT_TO_PTR(id));
> @@ -2170,7 +2174,7 @@ static struct bt_ascs *ascs_new(struct gatt_db *db)
>         return ascs;
>  }
>
> -static struct bt_bap_db *bap_db_new(struct gatt_db *db)
> +static struct bt_bap_db *bap_db_new(struct gatt_db *db, bool peripheral)
>  {
>         struct bt_bap_db *bdb;
>
> @@ -2181,23 +2185,26 @@ static struct bt_bap_db *bap_db_new(struct gatt_db *db)
>         bdb->db = gatt_db_ref(db);
>         bdb->sinks = queue_new();
>         bdb->sources = queue_new();
> -       bdb->endpoints = queue_new();
>
>         if (!bap_db)
>                 bap_db = queue_new();
>
> -       bdb->pacs = pacs_new(db);
> -       bdb->pacs->bdb = bdb;
> +       if (peripheral) {
> +               bdb->endpoints = queue_new();
>
> -       bdb->ascs = ascs_new(db);
> -       bdb->ascs->bdb = bdb;
> +               bdb->pacs = pacs_new(db);
> +               bdb->pacs->bdb = bdb;
> +
> +               bdb->ascs = ascs_new(db);
> +               bdb->ascs->bdb = bdb;
> +       }
>
>         queue_push_tail(bap_db, bdb);
>
>         return bdb;
>  }
>
> -static struct bt_bap_db *bap_get_db(struct gatt_db *db)
> +struct bt_bap_db *bt_bap_get_local_db(struct gatt_db *db, bool peripheral)
>  {
>         struct bt_bap_db *bdb;
>
> @@ -2205,7 +2212,7 @@ static struct bt_bap_db *bap_get_db(struct gatt_db *db)
>         if (bdb)
>                 return bdb;
>
> -       return bap_db_new(db);
> +       return bap_db_new(db, peripheral);
>  }
>
>  static struct bt_pacs *bap_get_pacs(struct bt_bap *bap)
> @@ -2328,6 +2335,9 @@ static void bap_add_sink(struct bt_bap_pac *pac)
>
>         queue_push_tail(pac->bdb->sinks, pac);
>
> +       if (!pac->bdb->endpoints)
> +               return;
> +
>         memset(value, 0, sizeof(value));
>
>         iov.iov_base = value;
> @@ -2346,6 +2356,9 @@ static void bap_add_source(struct bt_bap_pac *pac)
>
>         queue_push_tail(pac->bdb->sources, pac);
>
> +       if (!pac->bdb->endpoints)
> +               return;
> +
>         memset(value, 0, sizeof(value));
>
>         iov.iov_base = value;
> @@ -2373,21 +2386,16 @@ static void notify_session_pac_added(void *data, void *user_data)
>         queue_foreach(bap->pac_cbs, notify_pac_added, user_data);
>  }
>
> -struct bt_bap_pac *bt_bap_add_vendor_pac(struct gatt_db *db,
> +struct bt_bap_pac *bt_bap_add_vendor_pac(struct bt_bap_db *bdb,
>                                         const char *name, uint8_t type,
>                                         uint8_t id, uint16_t cid, uint16_t vid,
>                                         struct bt_bap_pac_qos *qos,
>                                         struct iovec *data,
>                                         struct iovec *metadata)
>  {
> -       struct bt_bap_db *bdb;
>         struct bt_bap_pac *pac;
>         struct bt_bap_codec codec;
>
> -       if (!db)
> -               return NULL;
> -
> -       bdb = bap_get_db(db);
>         if (!bdb)
>                 return NULL;
>
> @@ -2417,13 +2425,13 @@ struct bt_bap_pac *bt_bap_add_vendor_pac(struct gatt_db *db,
>         return pac;
>  }
>
> -struct bt_bap_pac *bt_bap_add_pac(struct gatt_db *db, const char *name,
> +struct bt_bap_pac *bt_bap_add_pac(struct bt_bap_db *bdb, const char *name,
>                                         uint8_t type, uint8_t id,
>                                         struct bt_bap_pac_qos *qos,
>                                         struct iovec *data,
>                                         struct iovec *metadata)
>  {
> -       return bt_bap_add_vendor_pac(db, name, type, id, 0x0000, 0x0000, qos,
> +       return bt_bap_add_vendor_pac(bdb, name, type, id, 0x0000, 0x0000, qos,
>                                                         data, metadata);
>  }
>
> @@ -2635,7 +2643,7 @@ static void bap_attached(void *data, void *user_data)
>         cb->attached(bap, cb->user_data);
>  }
>
> -struct bt_bap *bt_bap_new(struct gatt_db *ldb, struct gatt_db *rdb)
> +struct bt_bap *bt_bap_new(struct bt_bap_db *ldb, struct gatt_db *rdb)
>  {
>         struct bt_bap *bap;
>         struct bt_bap_db *bdb;
> @@ -2643,12 +2651,8 @@ struct bt_bap *bt_bap_new(struct gatt_db *ldb, struct gatt_db *rdb)
>         if (!ldb)
>                 return NULL;
>
> -       bdb = bap_get_db(ldb);
> -       if (!bdb)
> -               return NULL;
> -
>         bap = new0(struct bt_bap, 1);
> -       bap->ldb = bdb;
> +       bap->ldb = ldb;
>         bap->reqs = queue_new();
>         bap->pending = queue_new();
>         bap->notify = queue_new();
> diff --git a/src/shared/bap.h b/src/shared/bap.h
> index 47a15636c..a4e8549a5 100644
> --- a/src/shared/bap.h
> +++ b/src/shared/bap.h
> @@ -34,6 +34,7 @@
>  #define BT_BAP_CONFIG_PHY_CODEC                0x03
>
>  struct bt_bap;
> +struct bt_bap_db;
>  struct bt_bap_pac;
>  struct bt_bap_stream;
>
> @@ -98,14 +99,14 @@ struct bt_bap_pac_qos {
>         uint32_t ppd_max;
>  };
>
> -struct bt_bap_pac *bt_bap_add_vendor_pac(struct gatt_db *db,
> +struct bt_bap_pac *bt_bap_add_vendor_pac(struct bt_bap_db *bdb,
>                                         const char *name, uint8_t type,
>                                         uint8_t id, uint16_t cid, uint16_t vid,
>                                         struct bt_bap_pac_qos *qos,
>                                         struct iovec *data,
>                                         struct iovec *metadata);
>
> -struct bt_bap_pac *bt_bap_add_pac(struct gatt_db *db, const char *name,
> +struct bt_bap_pac *bt_bap_add_pac(struct bt_bap_db *bdb, const char *name,
>                                         uint8_t type, uint8_t id,
>                                         struct bt_bap_pac_qos *qos,
>                                         struct iovec *data,
> @@ -135,7 +136,9 @@ unsigned int bt_bap_register(bt_bap_func_t added, bt_bap_func_t removed,
>                                                         void *user_data);
>  bool bt_bap_unregister(unsigned int id);
>
> -struct bt_bap *bt_bap_new(struct gatt_db *ldb, struct gatt_db *rdb);
> +struct bt_bap_db *bt_bap_get_local_db(struct gatt_db *db, bool peripheral);
> +
> +struct bt_bap *bt_bap_new(struct bt_bap_db *ldb, struct gatt_db *rdb);
>
>  bool bt_bap_set_user_data(struct bt_bap *bap, void *user_data);
>
> diff --git a/unit/test-bap.c b/unit/test-bap.c
> index afeefac84..b677f5197 100644
> --- a/unit/test-bap.c
> +++ b/unit/test-bap.c
> @@ -311,6 +311,7 @@ static void test_client(const void *user_data)
>  {
>         struct test_data *data = (void *)user_data;
>         struct io *io;
> +       struct bt_bap_db *ldb;
>         struct gatt_db *db;
>
>         io = tester_setup_io(data->iov, data->iovcnt);
> @@ -321,7 +322,8 @@ static void test_client(const void *user_data)
>         db = gatt_db_new();
>         g_assert(db);
>
> -       data->bap = bt_bap_new(db, bt_gatt_client_get_db(data->client));
> +       ldb = bt_bap_get_local_db(db, true);
> +       data->bap = bt_bap_new(ldb, bt_gatt_client_get_db(data->client));
>         g_assert(data->bap);
>
>         bt_bap_set_debug(data->bap, print_debug, "bt_bap:", NULL);
> --
> 2.39.1
>


-- 
Luiz Augusto von Dentz
