Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E245021924A
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Jul 2020 23:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgGHVTV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 Jul 2020 17:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgGHVTV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 Jul 2020 17:19:21 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEEEC061A0B
        for <linux-bluetooth@vger.kernel.org>; Wed,  8 Jul 2020 14:19:21 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id a9so1946448oof.12
        for <linux-bluetooth@vger.kernel.org>; Wed, 08 Jul 2020 14:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vl/FYHLqjZ2oHat94kKM5EVL+kYgEyeYQaLTsvpkkiM=;
        b=psoz/PTN+JYgWibcSoCuW877S4nSnLobm2bSv/zv3bQkm27nsuEwvNIRoQTFzVfiF8
         wDkG2shYUrEL5slP3HWDse7WfIYdckg7vRZwgbBTiKiMifmiUMrdXEKLnS/VTzc8Hbll
         Ij88EXouyX50VAZAelAiAPNe7ysNUItv4SJ2GR+29M86yF917q3of+NUxjnr2RfTOB/S
         F0fim7+42hlX4qiG4UYJLR6qJTn1ncUWWQN9kZkVONaxO3tPytrUw2d/eoSl2lebl4W9
         TRyZDE3v4+trS8Shj1uGPnMqsGccbfl09u/rYQyKyzqf9HA1HiRYbBLb/RiALJxcfN97
         Dihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vl/FYHLqjZ2oHat94kKM5EVL+kYgEyeYQaLTsvpkkiM=;
        b=O9iG/Kb8tQgD2D0yl74fkF34RUiOmGkvl8/T+DSDHDD1whDPFl8siIMzIC9GJ9zWbB
         s1mzsiK+WG8k+U2Esdmep2EZgeA2aF3Alv087wtK7Qp3ZT3MDx0+E/1fPthLRQR6zv8i
         TdpoIu7vqZruyc26HK+3VFhYXGGM20obSDcuOO4tcdfV7f2Vea6TOsO+9Y5vLdvr7t4E
         VPLej5PwXwZyD3f+OAMJQswgyp94KiIa+3/hzuRUCdv0RZBAk4ZlV4XoXs0+rpmTJFQI
         ERz47Y4AAIkmLejH5oHoxuJJjtBGRVydffhRA4VTDrtzw/YSgWNpOS31jOw1AupH2c4l
         TLvw==
X-Gm-Message-State: AOAM5304oYr7OrMssXub0Nn4zxwEknpOw+mYTJxnj34Tw66XfOgbLFkC
        7ACJQxEqyF6Knl00HYWcvYkjJNTjDdqH61SXaTWPDKp0
X-Google-Smtp-Source: ABdhPJwo0f42Wo1MWhRk7kTICUHp6qVvIjKupXpYDJ5QlF2fmRqc9qAGtUD12s7zlXvE9KmPmdzyKpH4+5/Cz5gU7O8=
X-Received: by 2002:a4a:3405:: with SMTP id b5mr3402166ooa.9.1594243160894;
 Wed, 08 Jul 2020 14:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAEQQxWxKs7ewwVyq4mnsyLbRhErQe9vZc5joNK6zfGSO3wN5bg@mail.gmail.com>
 <d9eca20059088ad8bdaac70d7d98811166839b27.camel@hadess.net>
 <CAEQQxWyz-9iDU5Cs_NjHm81A6kdr0WUXPggp_2DTHeVVAQXUZQ@mail.gmail.com> <CABBYNZLzQH5ow02xB61d8pF7pcxXoP7Boa06G-HNxJ0Q66FGRg@mail.gmail.com>
In-Reply-To: <CABBYNZLzQH5ow02xB61d8pF7pcxXoP7Boa06G-HNxJ0Q66FGRg@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 8 Jul 2020 14:19:09 -0700
Message-ID: <CABBYNZ+MayDXAe4x4LfU3dm6GTqQcs7xj0jLjnDqsT9AHQGZOg@mail.gmail.com>
Subject: Re: Temporary device removal during discovery
To:     Andrey Batyiev <batyiev@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Andrey, Bastien,

On Wed, Jul 8, 2020 at 2:14 PM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Andrey,
>
> On Wed, Jul 8, 2020 at 8:56 AM Andrey Batyiev <batyiev@gmail.com> wrote:
> >
> > Hi Bastien, everyone,
> >
> > I've made a patch to the bluez, so the temporary devices are routinely
> > purged based on their last_seen attribute.
> >
> > What do you think about such solution?

I pushed a patch so than if the adapter is power off or unplugged it
will immediately remove all temporary devices.

> > Thanks,
> >     Andrey
> >
> >
> >
> > diff --git a/src/adapter.c b/src/adapter.c
> > index 529002b02..101b03633 100644
> > --- a/src/adapter.c
> > +++ b/src/adapter.c
> > @@ -88,6 +88,7 @@
> >
> > #define CONN_SCAN_TIMEOUT (3)
> > #define IDLE_DISCOV_TIMEOUT (5)
> > +#define TEMP_DEV_REAPER_INTERVAL (30)
> > #define TEMP_DEV_TIMEOUT (3 * 60)
> > #define BONDING_TIMEOUT (2 * 60)
> >
> > @@ -1491,18 +1492,18 @@ static gboolean remove_temp_devices(gpointer user_data)
> >
> >        DBG("%s", adapter->path);
> >
> > -       adapter->temp_devices_timeout = 0;
> > -
> >        for (l = adapter->devices; l != NULL; l = next) {
> >                struct btd_device *dev = l->data;
> >
> >                next = g_slist_next(l);
> >
> > -               if (device_is_temporary(dev) && !btd_device_is_connected(dev))
> > +               if (device_is_temporary(dev) &&
> > +                   !btd_device_is_connected(dev) &&
> > +                   device_last_seen_delta(dev) > TEMP_DEV_TIMEOUT)
>
> The delta logic might be a nice addition as a separate patch, it is
> more for detecting devices disappearing then actually cleanup during
> power off.
>
> >                        btd_adapter_remove_device(adapter, dev);
> >        }
> >
> > -       return FALSE;
> > +       return TRUE;
> > }
> >
> > static void discovery_cleanup(struct btd_adapter *adapter)
> > @@ -1516,11 +1517,6 @@ static void discovery_cleanup(struct
> > btd_adapter *adapter)
> >                adapter->discovery_idle_timeout = 0;
> >        }
> >
> > -       if (adapter->temp_devices_timeout > 0) {
> > -               g_source_remove(adapter->temp_devices_timeout);
> > -               adapter->temp_devices_timeout = 0;
> > -       }
> > -
> >        g_slist_free_full(adapter->discovery_found,
> >                                                invalidate_rssi_and_tx_power);
> >        adapter->discovery_found = NULL;
> > @@ -1536,9 +1532,6 @@ static void discovery_cleanup(struct btd_adapter *adapter)
> >                if (device_is_temporary(dev) && !device_is_connectable(dev))
> >                        btd_adapter_remove_device(adapter, dev);
> >        }
> > -
> > -       adapter->temp_devices_timeout = g_timeout_add_seconds(TEMP_DEV_TIMEOUT,
> > -                                               remove_temp_devices, adapter);
> > }
> >
> > static void discovery_free(void *user_data)
> > @@ -2405,7 +2398,7 @@ static bool parse_pathloss(DBusMessageIter *value,
> >        return true;
> > }
> >
> > -static bool parse_transport(DBusMessageIter *value,
> > +static bool parse_transport(DBusMessageIter *value,
> >                                        struct discovery_filter *filter)
> > {
> >        char *transport_str;
> > @@ -5362,6 +5355,11 @@ static void adapter_free(gpointer user_data)
> >                adapter->passive_scan_timeout = 0;
> >        }
> >
> > +       if (adapter->temp_devices_timeout > 0) {
> > +               g_source_remove(adapter->temp_devices_timeout);
> > +               adapter->temp_devices_timeout = 0;
> > +       }
> > +
> >        if (adapter->load_ltks_timeout > 0)
> >                g_source_remove(adapter->load_ltks_timeout);
> >
> > @@ -6343,6 +6341,9 @@ static struct btd_adapter *btd_adapter_new(uint16_t index)
> >
> >        adapter->auths = g_queue_new();
> >
> > +       adapter->temp_devices_timeout =
> > g_timeout_add_seconds(TEMP_DEV_REAPER_INTERVAL,
> > +                                               remove_temp_devices, adapter);
> > +
> >        return btd_adapter_ref(adapter);
> > }
> >
> > diff --git a/src/device.c b/src/device.c
> > index 0deee2707..cebbabab2 100644
> > --- a/src/device.c
> > +++ b/src/device.c
> > @@ -4240,6 +4240,15 @@ void device_update_last_seen(struct btd_device
> > *device, uint8_t bdaddr_type)
> >                device->le_seen = time(NULL);
> > }
> >
> > +time_t device_last_seen_delta(struct btd_device *device)
> > +{
> > +       const time_t now = time(NULL);
> > +       const time_t bredr_time = now - device->bredr_seen;
> > +       const time_t le_time = now - device->le_seen;
> > +
> > +       return bredr_time < le_time ? bredr_time : le_time;
> > +}
> > +
> > /* It is possible that we have two device objects for the same device in
> >  * case it has first been discovered over BR/EDR and has a private
> >  * address when discovered over LE for the first time. In such a case we
> > diff --git a/src/device.h b/src/device.h
> > index cb8d884e8..75fd3ec60 100644
> > --- a/src/device.h
> > +++ b/src/device.h
> > @@ -44,6 +44,7 @@ void device_update_addr(struct btd_device *device,
> > const bdaddr_t *bdaddr,
> > void device_set_bredr_support(struct btd_device *device);
> > void device_set_le_support(struct btd_device *device, uint8_t bdaddr_type);
> > void device_update_last_seen(struct btd_device *device, uint8_t bdaddr_type);
> > +time_t device_last_seen_delta(struct btd_device *device);
> > void device_merge_duplicate(struct btd_device *dev, struct btd_device *dup);
> > uint32_t btd_device_get_class(struct btd_device *device);
> > uint16_t btd_device_get_vendor(struct btd_device *device);
>
>
>
> --
> Luiz Augusto von Dentz



-- 
Luiz Augusto von Dentz
