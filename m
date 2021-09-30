Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFE441CF70
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Sep 2021 00:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347330AbhI2Wtw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 29 Sep 2021 18:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346734AbhI2Wtv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 29 Sep 2021 18:49:51 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103FBC061767
        for <linux-bluetooth@vger.kernel.org>; Wed, 29 Sep 2021 15:48:10 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id n17so4972828vsr.10
        for <linux-bluetooth@vger.kernel.org>; Wed, 29 Sep 2021 15:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qt7W0NlF549nNCHl0j2wIhVHk1II8GAPV4kbtsgL6Ng=;
        b=N57EgxoK784ZIId57GzmmUFIeCC+3agSZk+vzGBYPFGWpcLctKM6jZ9GpGzsJ3y8u6
         yKsHNoFTW4we4BKY581HZ2d4PDOtehOzwEOAosdyKbTee58LdiB4SEDutyP+eR1gzzAV
         y3B1sVuGXNkGUi0RsqZs4/gVpjGhjFEd0hVZeAitYkpd1m1/cVLZZ5oUwF36JnjwNpNZ
         t9Tq4IrbBiuvuOlgfe12FgUmJv79bhrQ5zfOZiD7pqYWnmC9vNc7ntUiJh1m9SsnRTYU
         uWvNiybJ4RuAEbJIHLkQkRT6ufwi1XcL43MPmLJ3PiozFW+gt9zheHeezmxnaRMItcR/
         Z12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qt7W0NlF549nNCHl0j2wIhVHk1II8GAPV4kbtsgL6Ng=;
        b=gLLQIy6MWLKn7b8EeWeRwyFkNufmFl6spuySujxtKyjOF3QC0g0cmarCBqnq7emYpl
         S9elcvxUV+bYksEiItyDZQ2IdIWc+YG2ktAvylqal/gsb0ObOCTX/GMdkvBKkwxUotO7
         KOIrO392xOngWuNcHWjymjsP4HOVe5bGuf6T/zFMjQVKzP7p96znkD+nF5c49dwiMd/6
         5Xl8WjUke092EYJwk7KYrvXrOuSAKWItXMYUx4KJcTK7vdyGloIs5SezuxNEigiGysJf
         mIxM3EqL4DsdbkE5th0uZpLbEbxLoJ2AR3VWcsB99Fl3kVtQp1VdrFIYqrI767bFJeXh
         XD4Q==
X-Gm-Message-State: AOAM531ch+6Lp9abaTAHQEoREzesLnBW8iJz3hb9Dg1DjiZxIjqta+R1
        /lCkrqIQwhA8IYMWUq+MFW9PBOJZH2X/lzVigH0RDpqC
X-Google-Smtp-Source: ABdhPJw4QGav5dcRQQmx6MOnKpVWamUWouLRADYOXg+Ik9AZgvju+ktNSYtXPEYs3XCoKHpj2WdzoZj9Wvk/jZexMls=
X-Received: by 2002:a05:6102:2757:: with SMTP id p23mr1227588vsu.61.1632955689059;
 Wed, 29 Sep 2021 15:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210928230015.26295-1-bernie@allthenticate.net> <CABBYNZLv5=Wj_PJ7UVtLouWiAudaZDcvJiAhKzQRSmDbzXy5kg@mail.gmail.com>
In-Reply-To: <CABBYNZLv5=Wj_PJ7UVtLouWiAudaZDcvJiAhKzQRSmDbzXy5kg@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 29 Sep 2021 15:47:57 -0700
Message-ID: <CABBYNZKvbOf2R1ZXwOopTcNE4D=W8sXcwvsp9+Fk+JWaVn+nrg@mail.gmail.com>
Subject: Re: [RFC PATCH BlueZ v2] Cleaning up gatt operations on a disconnect
 to fix possible use after free
To:     Bernie Conrad <bernie@allthenticate.net>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Bernie,

On Wed, Sep 29, 2021 at 2:05 PM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Bernie,
>
> On Tue, Sep 28, 2021 at 4:01 PM Bernie Conrad <bernie@allthenticate.net> wrote:
> >
> > There is a current use after free possible on a gatt server if a client
> > disconnects while a WriteValue call is being processed with dbus.
> >
> > This patch includes the addition of a pending disconnect callback to handle
> > cleanup better if a disconnect occurs during a write, an acquire write
> > or read operation using bt_att_register_disconnect with the cb.
> >
> > v2: Fixed a bad call to pending_read_new
> >
> > ---
> >  src/gatt-database.c | 115 +++++++++++++++++++++++++-------------------
> >  1 file changed, 65 insertions(+), 50 deletions(-)
> >
> > diff --git a/src/gatt-database.c b/src/gatt-database.c
> > index 1f7ce5f02..a03c579cf 100644
> > --- a/src/gatt-database.c
> > +++ b/src/gatt-database.c
> > @@ -933,6 +933,24 @@ static struct btd_device *att_get_device(struct bt_att *att)
> >         return btd_adapter_find_device(adapter, &dst, dst_type);
> >  }
> >
> > +
> > +static void pending_op_free(void *data)
> > +{
> > +       struct pending_op *op = data;
> > +
> > +       if (op->owner_queue)
> > +               queue_remove(op->owner_queue, op);
> > +
> > +       free(op);
>
> We might need to do something like the following:
>
> https://gist.github.com/Vudentz/958d540591d1ae6a32d226ef8a0d6d54
>
> Otherwise we risk the op being freeing when the op is completely
> properly but when att is disconnected it still runs
> pending_disconnect_cb causing a UAF.
>
> > +}
> > +
> > +static void pending_disconnect_cb(int err, void *user_data)
> > +{
> > +       struct pending_op *op = user_data;
> > +
> > +       op->owner_queue = NULL;
> > +}
> > +
> >  static struct pending_op *pending_ccc_new(struct bt_att *att,
> >                                         struct gatt_db_attribute *attrib,
> >                                         uint16_t value,
> > @@ -956,17 +974,12 @@ static struct pending_op *pending_ccc_new(struct bt_att *att,
> >         op->attrib = attrib;
> >         op->link_type = link_type;
> >
> > -       return op;
> > -}
> > +       bt_att_register_disconnect(att,
> > +                                  pending_disconnect_cb,
> > +                                  op,
> > +                                  NULL);
> >
> > -static void pending_op_free(void *data)
> > -{
> > -       struct pending_op *op = data;
> > -
> > -       if (op->owner_queue)
> > -               queue_remove(op->owner_queue, op);
> > -
> > -       free(op);
> > +       return op;
> >  }
> >
> >  static void gatt_ccc_write_cb(struct gatt_db_attribute *attrib,
> > @@ -2169,24 +2182,26 @@ done:
> >         gatt_db_attribute_read_result(op->attrib, op->id, ecode, value, len);
> >  }
> >
> > -static struct pending_op *pending_read_new(struct btd_device *device,
> > +
> > +static struct pending_op *pending_read_new(struct bt_att *att,
> >                                         struct queue *owner_queue,
> >                                         struct gatt_db_attribute *attrib,
> > -                                       unsigned int id, uint16_t offset,
> > -                                       uint8_t link_type)
> > +                                       unsigned int id, uint16_t offset)
> >  {
> >         struct pending_op *op;
> >
> >         op = new0(struct pending_op, 1);
> >
> >         op->owner_queue = owner_queue;
> > -       op->device = device;
> > +       op->device = att_get_device(att);
> >         op->attrib = attrib;
> >         op->id = id;
> >         op->offset = offset;
> > -       op->link_type = link_type;
> > +       op->link_type = bt_att_get_link_type(att);
> >         queue_push_tail(owner_queue, op);
> >
> > +       bt_att_register_disconnect(att, pending_disconnect_cb, op, NULL);
> > +
> >         return op;
> >  }
> >
> > @@ -2243,18 +2258,16 @@ static void read_setup_cb(DBusMessageIter *iter, void *user_data)
> >         dbus_message_iter_close_container(iter, &dict);
> >  }
> >
> > -static struct pending_op *send_read(struct btd_device *device,
> > +static struct pending_op *send_read(struct bt_att *att,
> >                                         struct gatt_db_attribute *attrib,
> >                                         GDBusProxy *proxy,
> >                                         struct queue *owner_queue,
> >                                         unsigned int id,
> > -                                       uint16_t offset,
> > -                                       uint8_t link_type)
> > +                                       uint16_t offset)
> >  {
> >         struct pending_op *op;
> >
> > -       op = pending_read_new(device, owner_queue, attrib, id, offset,
> > -                                                       link_type);
> > +       op = pending_read_new(att, owner_queue, attrib, id, offset);
> >
> >         if (g_dbus_proxy_method_call(proxy, "ReadValue", read_setup_cb,
> >                                 read_reply_cb, op, pending_op_free) == TRUE)
> > @@ -2337,15 +2350,17 @@ static void write_reply_cb(DBusMessage *message, void *user_data)
> >         }
> >
> >  done:
> > -       gatt_db_attribute_write_result(op->attrib, op->id, ecode);
> > +       // Make sure that only reply if the device is connected
> > +       if (btd_device_is_connected(op->device))
> > +               gatt_db_attribute_write_result(op->attrib, op->id, ecode);
> >  }
> >
> > -static struct pending_op *pending_write_new(struct btd_device *device,
> > +static struct pending_op *pending_write_new(struct bt_att *att,
> >                                         struct queue *owner_queue,
> >                                         struct gatt_db_attribute *attrib,
> >                                         unsigned int id,
> >                                         const uint8_t *value, size_t len,
> > -                                       uint16_t offset, uint8_t link_type,
> > +                                       uint16_t offset,
> >                                         bool is_characteristic,
> >                                         bool prep_authorize)
> >  {
> > @@ -2356,33 +2371,37 @@ static struct pending_op *pending_write_new(struct btd_device *device,
> >         op->data.iov_base = (uint8_t *) value;
> >         op->data.iov_len = len;
> >
> > -       op->device = device;
> > +       op->device = att_get_device(att);
> >         op->owner_queue = owner_queue;
> >         op->attrib = attrib;
> >         op->id = id;
> >         op->offset = offset;
> > -       op->link_type = link_type;
> > +       op->link_type = bt_att_get_link_type(att);
> >         op->is_characteristic = is_characteristic;
> >         op->prep_authorize = prep_authorize;
> >         queue_push_tail(owner_queue, op);
> >
> > +       bt_att_register_disconnect(att,
> > +                           pending_disconnect_cb,
> > +                           op, NULL);
> > +
> >         return op;
> >  }
> >
> > -static struct pending_op *send_write(struct btd_device *device,
> > +static struct pending_op *send_write(struct bt_att *att,
> >                                         struct gatt_db_attribute *attrib,
> >                                         GDBusProxy *proxy,
> >                                         struct queue *owner_queue,
> >                                         unsigned int id,
> >                                         const uint8_t *value, size_t len,
> > -                                       uint16_t offset, uint8_t link_type,
> > +                                       uint16_t offset,
> >                                         bool is_characteristic,
> >                                         bool prep_authorize)
> >  {
> >         struct pending_op *op;
> >
> > -       op = pending_write_new(device, owner_queue, attrib, id, value, len,
> > -                                       offset, link_type, is_characteristic,
> > +       op = pending_write_new(att, owner_queue, attrib, id, value, len,
> > +                                       offset, is_characteristic,
> >                                         prep_authorize);
> >
> >         if (g_dbus_proxy_method_call(proxy, "WriteValue", write_setup_cb,
> > @@ -2558,17 +2577,16 @@ static void acquire_write_setup(DBusMessageIter *iter, void *user_data)
> >  }
> >
> >  static struct pending_op *acquire_write(struct external_chrc *chrc,
> > -                                       struct btd_device *device,
> > +                                       struct bt_att *att,
> >                                         struct gatt_db_attribute *attrib,
> >                                         unsigned int id,
> > -                                       const uint8_t *value, size_t len,
> > -                                       uint8_t link_type)
> > +                                       const uint8_t *value, size_t len)
> >  {
> >         struct pending_op *op;
> >         bool acquiring = !queue_isempty(chrc->pending_writes);
> >
> > -       op = pending_write_new(device, chrc->pending_writes, attrib, id, value,
> > -                               len, 0, link_type, false, false);
> > +       op = pending_write_new(att, chrc->pending_writes, attrib, id, value,
> > +                               len, 0, false, false);
> >
> >         if (acquiring)
> >                 return op;
> > @@ -2851,8 +2869,8 @@ static void desc_read_cb(struct gatt_db_attribute *attrib,
> >                 goto fail;
> >         }
> >
> > -       if (send_read(device, attrib, desc->proxy, desc->pending_reads, id,
> > -                                       offset, bt_att_get_link_type(att)))
> > +       if (send_read(att, attrib, desc->proxy, desc->pending_reads, id,
> > +                                       offset))
> >                 return;
> >
> >  fail:
> > @@ -2883,10 +2901,9 @@ static void desc_write_cb(struct gatt_db_attribute *attrib,
> >         if (opcode == BT_ATT_OP_PREP_WRITE_REQ) {
> >                 if (!device_is_trusted(device) && !desc->prep_authorized &&
> >                                                 desc->req_prep_authorization)
> > -                       send_write(device, attrib, desc->proxy,
> > +                       send_write(att, attrib, desc->proxy,
> >                                         desc->pending_writes, id, value, len,
> > -                                       offset, bt_att_get_link_type(att),
> > -                                       false, true);
> > +                                       offset, false, true);
> >                 else
> >                         gatt_db_attribute_write_result(attrib, id, 0);
> >
> > @@ -2896,9 +2913,8 @@ static void desc_write_cb(struct gatt_db_attribute *attrib,
> >         if (opcode == BT_ATT_OP_EXEC_WRITE_REQ)
> >                 desc->prep_authorized = false;
> >
> > -       if (send_write(device, attrib, desc->proxy, desc->pending_writes, id,
> > -                       value, len, offset, bt_att_get_link_type(att), false,
> > -                       false))
> > +       if (send_write(att, attrib, desc->proxy, desc->pending_writes, id,
> > +                       value, len, offset, false, false))
> >                 return;
> >
> >  fail:
> > @@ -2977,8 +2993,8 @@ static void chrc_read_cb(struct gatt_db_attribute *attrib,
> >                 goto fail;
> >         }
> >
> > -       if (send_read(device, attrib, chrc->proxy, chrc->pending_reads, id,
> > -                                       offset, bt_att_get_link_type(att)))
> > +       if (send_read(att, attrib, chrc->proxy, chrc->pending_reads, id,
> > +              offset))
> >                 return;
> >
> >  fail:
> > @@ -3016,9 +3032,9 @@ static void chrc_write_cb(struct gatt_db_attribute *attrib,
> >         if (opcode == BT_ATT_OP_PREP_WRITE_REQ) {
> >                 if (!device_is_trusted(device) && !chrc->prep_authorized &&
> >                                                 chrc->req_prep_authorization)
> > -                       send_write(device, attrib, chrc->proxy, queue,
> > +                       send_write(att, attrib, chrc->proxy, queue,
> >                                         id, value, len, offset,
> > -                                       bt_att_get_link_type(att), true, true);
> > +                                       true, true);
> >                 else
> >                         gatt_db_attribute_write_result(attrib, id, 0);
> >
> > @@ -3039,13 +3055,12 @@ static void chrc_write_cb(struct gatt_db_attribute *attrib,
> >         }
> >
> >         if (g_dbus_proxy_get_property(chrc->proxy, "WriteAcquired", &iter)) {
> > -               if (acquire_write(chrc, device, attrib, id, value, len,
> > -                                               bt_att_get_link_type(att)))
> > +               if (acquire_write(chrc, att, attrib, id, value, len))
> >                         return;
> >         }
> >
> > -       if (send_write(device, attrib, chrc->proxy, queue, id, value, len,
> > -                       offset, bt_att_get_link_type(att), false, false))
> > +       if (send_write(att, attrib, chrc->proxy, queue, id, value, len,
> > +                       offset, false, false))
> >                 return;
> >
> >  fail:
> > --
> > 2.17.1
> >
>
>
> --
> Luiz Augusto von Dentz

I went ahead and applied this with my changes on top, thanks.

-- 
Luiz Augusto von Dentz
