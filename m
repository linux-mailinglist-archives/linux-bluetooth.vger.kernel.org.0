Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7AD634835
	for <lists+linux-bluetooth@lfdr.de>; Tue, 22 Nov 2022 21:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbiKVUbQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 22 Nov 2022 15:31:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233871AbiKVUbP (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 22 Nov 2022 15:31:15 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4656E14D07
        for <linux-bluetooth@vger.kernel.org>; Tue, 22 Nov 2022 12:31:09 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id be13so25272921lfb.4
        for <linux-bluetooth@vger.kernel.org>; Tue, 22 Nov 2022 12:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dSepLoDWdLX9h8ni565kGUBAadbDX0GMGFO+LzpqsvE=;
        b=XrLQyrSbtcDSXsBnIiF/LQnqK3WMUURn/hk5lwTz09GXqBEokGZKjW5uDmWQGdW/Vq
         dVHIDKhA81i1mELeUdycHxDTIBPN9k1ZvRP6nRDFTkaQ9bVZlKjmoNVUwGAHxSwoUQkQ
         MIm/YcVDMP54P9we1JlUjGLQPFe50FpYWyyGaMrPhZs8w8/XW0f5KO9ciOt5Hxe0vew7
         /WdPPRjCRV4iUqJXTJVmN2W9h4REIUmZ2giyhEW/ynu1k8mD2ICYUZM3wSCgwzn3gdYV
         OMFVdd0IiiD/xTWz9z2EOJQyS/AGHNOJs9Fq/E5EkXQrCY5AxbJ4NmXre1QZitULxF4t
         yP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSepLoDWdLX9h8ni565kGUBAadbDX0GMGFO+LzpqsvE=;
        b=5xpo9iL80dVki2/OJptjgSm/IAj6sfY8izXAhUdRajPql6GqKC/S09jXOQqE3RhuIQ
         otywwfKtruQadsdU6JONDyE5bHOw1Z7Ovnv/ZBS36tPfiohZ32hnJywjn4qA8HYURAiX
         jv3FmPk0Y1YYM6kFbx1YkBpxBGanOnxEV0BUgL0rtRIZ1yIdTVovGpRyTlTC1puQ2RXR
         6mFFIzI0X0p7yH1NkdrH4PLznzOOxXiQDC8iNNdAvGxk1akRGtXXkMWXvVsqWa995yfK
         6vqGxXecz6zaodTq290j8C5+nKVNTWHpdMq0lnBh3fP2YXBbtUglHXGS5OJ7FkdBnk6M
         elqg==
X-Gm-Message-State: ANoB5pkZVqJLa8d8XaAT8ubpIaG+DOPgDmBuccWTOAVwmLydknzgST7m
        yQ9WVbrEElq+tYEbkTZzYKS5uRmPymY8dO1uFyc9oSo8XHE=
X-Google-Smtp-Source: AA0mqf5Gb9GCO9Sk/mGU/5MTGswbW8Zkz+CNWOwZgn3O6D/yZSbkBbawTxX1ne4Xl6uQvsiNW5hc0uWqYMf1qqnjNpU=
X-Received: by 2002:a05:6512:3603:b0:4b4:b5d8:880d with SMTP id
 f3-20020a056512360300b004b4b5d8880dmr7807777lfs.121.1669149067483; Tue, 22
 Nov 2022 12:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20221122101232.45320-1-sathish.narasimman@intel.com> <20221122101232.45320-6-sathish.narasimman@intel.com>
In-Reply-To: <20221122101232.45320-6-sathish.narasimman@intel.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Tue, 22 Nov 2022 12:30:55 -0800
Message-ID: <CABBYNZ+p3k25fo-Qdx_FD1pDJ93NrjbSoLzytdFrCqXVTByp+A@mail.gmail.com>
Subject: Re: [PATCH BlueZ v3 5/7] profiles: Add initial code for csip plugin
To:     Sathish Narasimman <sathish.narasimman@intel.com>
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

Hi Sathish,

On Tue, Nov 22, 2022 at 2:16 AM Sathish Narasimman
<sathish.narasimman@intel.com> wrote:
>
> This adds initial code for csip plugin which handles Coordinated
> set identification Profile and Coordinated Set Identification
> Service.
> ---
>  Makefile.plugins      |   5 +
>  configure.ac          |   4 +
>  profiles/audio/csip.c | 319 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 328 insertions(+)
>  create mode 100644 profiles/audio/csip.c
>
> diff --git a/Makefile.plugins b/Makefile.plugins
> index 20cac384ef44..0f119e8714b7 100644
> --- a/Makefile.plugins
> +++ b/Makefile.plugins
> @@ -131,3 +131,8 @@ if VCP
>  builtin_modules += vcp
>  builtin_sources += profiles/audio/vcp.c
>  endif
> +
> +if CSIP
> +builtin_modules += csip
> +builtin_sources += profiles/audio/csip.c
> +endif
> diff --git a/configure.ac b/configure.ac
> index f9f0faf573ca..17c5f904a5c2 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -207,6 +207,10 @@ AC_ARG_ENABLE(vcp, AS_HELP_STRING([--disable-vcp],
>                 [disable VCP profile]), [enable_vcp=${enableval}])
>  AM_CONDITIONAL(VCP, test "${enable_vcp}" != "no")
>
> +AC_ARG_ENABLE(csip, AS_HELP_STRING([--disable-csip],
> +               [disable CSIP profile]), [enable_csip=${enableval}])
> +AM_CONDITIONAL(CSIP, test "${enable_csip}" != "no")
> +
>  AC_ARG_ENABLE(tools, AS_HELP_STRING([--disable-tools],
>                 [disable Bluetooth tools]), [enable_tools=${enableval}])
>  AM_CONDITIONAL(TOOLS, test "${enable_tools}" != "no")
> diff --git a/profiles/audio/csip.c b/profiles/audio/csip.c
> new file mode 100644
> index 000000000000..c00065bda676
> --- /dev/null
> +++ b/profiles/audio/csip.c
> @@ -0,0 +1,319 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *
> + * BlueZ - Bluetooth protocol stack for Linux
> + *
> + * Copyright (C) 2022 Intel Corporation. All rights reserved.
> + *
> + *
> + */
> +
> +#ifdef HAVE_CONFIG_H
> +#include <config.h>
> +#endif
> +
> +#define _GNU_SOURCE
> +
> +#include <ctype.h>
> +#include <stdbool.h>
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <fcntl.h>
> +#include <errno.h>
> +
> +#include <glib.h>
> +
> +#include "gdbus/gdbus.h"
> +
> +#include "lib/bluetooth.h"
> +#include "lib/hci.h"
> +#include "lib/sdp.h"
> +#include "lib/uuid.h"
> +
> +#include "src/dbus-common.h"
> +#include "src/shared/util.h"
> +#include "src/shared/att.h"
> +#include "src/shared/queue.h"
> +#include "src/shared/gatt-db.h"
> +#include "src/shared/gatt-client.h"
> +#include "src/shared/gatt-server.h"
> +#include "src/shared/csip.h"
> +
> +#include "btio/btio.h"
> +#include "src/plugin.h"
> +#include "src/adapter.h"
> +#include "src/gatt-database.h"
> +#include "src/device.h"
> +#include "src/profile.h"
> +#include "src/service.h"
> +#include "src/log.h"
> +#include "src/error.h"
> +
> +#define CSIS_UUID_STR "00001846-0000-1000-8000-00805f9b34fb"
> +
> +struct csip_data {
> +       struct btd_device *device;
> +       struct btd_service *service;
> +       struct bt_csip *csip;
> +};
> +
> +static struct queue *sessions;
> +
> +static void csip_debug(const char *str, void *user_data)
> +{
> +       DBG_IDX(0xffff, "%s", str);
> +}
> +
> +static struct csip_data *csip_data_new(struct btd_device *device)
> +{
> +       struct csip_data *data;
> +
> +       data = new0(struct csip_data, 1);
> +       data->device = device;
> +
> +       return data;
> +}
> +
> +static void csip_data_add(struct csip_data *data)
> +{
> +       DBG("data %p", data);
> +
> +       if (queue_find(sessions, NULL, data)) {
> +               error("data %p already added", data);
> +               return;
> +       }
> +
> +       bt_csip_set_debug(data->csip, csip_debug, NULL, NULL);
> +
> +       if (!sessions)
> +               sessions = queue_new();
> +
> +       queue_push_tail(sessions, data);
> +
> +       if (data->service)
> +               btd_service_set_user_data(data->service, data);
> +}
> +
> +static int csip_disconnect(struct btd_service *service)
> +{
> +       DBG("");
> +       return 0;
> +}
> +
> +static bool match_data(const void *data, const void *match_data)
> +{
> +       const struct csip_data *vdata = data;
> +       const struct bt_csip *csip = match_data;
> +
> +       return vdata->csip == csip;
> +}
> +
> +static void csip_data_free(struct csip_data *data)
> +{
> +       if (data->service) {
> +               btd_service_set_user_data(data->service, NULL);
> +               bt_csip_set_user_data(data->csip, NULL);
> +       }
> +
> +       bt_csip_unref(data->csip);
> +       free(data);
> +}
> +
> +
> +static void csip_data_remove(struct csip_data *data)
> +{
> +       DBG("data %p", data);
> +
> +       if (!queue_remove(sessions, data))
> +               return;
> +
> +       csip_data_free(data);
> +
> +       if (queue_isempty(sessions)) {
> +               queue_destroy(sessions, NULL);
> +               sessions = NULL;
> +       }
> +}
> +
> +static void csip_detached(struct bt_csip *csip, void *user_data)
> +{
> +       struct csip_data *data;
> +
> +       DBG("%p", csip);
> +
> +       data = queue_find(sessions, match_data, csip);
> +       if (!data) {
> +               error("Unable to find csip session");
> +               return;
> +       }
> +
> +       csip_data_remove(data);
> +}
> +
> +static void csip_attached(struct bt_csip *csip, void *user_data)
> +{
> +       struct csip_data *data;
> +       struct bt_att *att;
> +       struct btd_device *device;
> +
> +       DBG("%p", csip);
> +
> +       data = queue_find(sessions, match_data, csip);
> +       if (data)
> +               return;
> +
> +       att = bt_csip_get_att(csip);
> +       if (!att)
> +               return;
> +
> +       device = btd_adapter_find_device_by_fd(bt_att_get_fd(att));
> +       if (!device) {
> +               error("Unable to find device");
> +               return;
> +       }
> +
> +       data = csip_data_new(device);
> +       data->csip = csip;
> +
> +       csip_data_add(data);
> +
> +}
> +
> +static int csip_server_probe(struct btd_profile *p,
> +                               struct btd_adapter *adapter)
> +{
> +       struct btd_gatt_database *database = btd_adapter_get_database(adapter);
> +
> +       DBG("CSIP path %s", adapter_get_path(adapter));
> +
> +       bt_csip_add_db(btd_gatt_database_get_db(database));
> +
> +       return 0;
> +}
> +
> +static void csip_server_remove(struct btd_profile *p,
> +                                       struct btd_adapter *adapter)
> +{
> +       DBG("CSIP remove Adapter");
> +}
> +
> +static int csip_accept(struct btd_service *service)
> +{
> +       struct btd_device *device = btd_service_get_device(service);
> +       struct bt_gatt_client *client = btd_device_get_gatt_client(device);
> +       struct csip_data *data = btd_service_get_user_data(service);
> +       char addr[18];
> +
> +       ba2str(device_get_address(device), addr);
> +       DBG("%s", addr);
> +
> +       if (!data) {
> +               error("CSIP service not handled by profile");
> +               return -EINVAL;
> +       }
> +
> +       if (!bt_csip_attach(data->csip, client)) {
> +               error("CSIP unable to attach");
> +               return -EINVAL;
> +       }
> +
> +       btd_service_connecting_complete(service, 0);
> +
> +       return 0;
> +}
> +
> +static int csip_probe(struct btd_service *service)
> +{
> +       struct btd_device *device = btd_service_get_device(service);
> +       struct btd_adapter *adapter = device_get_adapter(device);
> +       struct btd_gatt_database *database = btd_adapter_get_database(adapter);
> +       struct csip_data *data = btd_service_get_user_data(service);
> +       char addr[18];
> +
> +       ba2str(device_get_address(device), addr);
> +       DBG("%s", addr);
> +
> +       /* Ignore, if we were probed for this device already */
> +       if (data) {
> +               error("Profile probed twice for the same device!");
> +               return -EINVAL;
> +       }
> +
> +       data = csip_data_new(device);
> +       data->service = service;
> +
> +       data->csip = bt_csip_new(btd_gatt_database_get_db(database),
> +                                       btd_device_get_gatt_db(device));
> +       if (!data->csip) {
> +               error("Unable to create CSIP instance");
> +               free(data);
> +               return -EINVAL;
> +       }
> +
> +       csip_data_add(data);
> +
> +       bt_csip_set_user_data(data->csip, service);
> +
> +       return 0;
> +}
> +
> +static void csip_remove(struct btd_service *service)
> +{
> +       struct btd_device *device = btd_service_get_device(service);
> +       struct csip_data *data;
> +       char addr[18];
> +
> +       ba2str(device_get_address(device), addr);
> +       DBG("%s", addr);
> +
> +       data = btd_service_get_user_data(service);
> +       if (!data) {
> +               error("CSIP service not handled by profile");
> +               return;
> +       }
> +
> +       csip_data_remove(data);
> +}
> +
> +static struct btd_profile csip_profile = {
> +       .name           = "csip",
> +       .priority       = BTD_PROFILE_PRIORITY_MEDIUM,
> +       .remote_uuid    = CSIS_UUID_STR,
> +
> +       .device_probe   = csip_probe,
> +       .device_remove  = csip_remove,
> +
> +       .accept         = csip_accept,
> +       .disconnect     = csip_disconnect,
> +
> +       .adapter_probe  = csip_server_probe,
> +       .adapter_remove = csip_server_remove,
> +};
> +
> +static unsigned int csip_id;
> +
> +static int csip_init(void)
> +{
> +       if (!(g_dbus_get_flags() & G_DBUS_FLAG_ENABLE_EXPERIMENTAL)) {
> +               warn("D-Bus experimental not enabled");
> +               return -ENOTSUP;
> +       }
> +
> +       btd_profile_register(&csip_profile);
> +       csip_id = bt_csip_register(csip_attached, csip_detached, NULL);
> +
> +       return 0;
> +}
> +
> +static void csip_exit(void)
> +{
> +       if (g_dbus_get_flags() & G_DBUS_FLAG_ENABLE_EXPERIMENTAL) {
> +               btd_profile_unregister(&csip_profile);
> +               bt_csip_unregister(csip_id);
> +       }
> +}
> +
> +BLUETOOTH_PLUGIN_DEFINE(csip, VERSION, BLUETOOTH_PLUGIN_PRIORITY_DEFAULT,
> +                                               csip_init, csip_exit)
> --
> 2.25.1

This seems to be handling just the discovery of the CSIS, which is
fine for now, but we probably need a way to expose the SIRK to the
daemon core which can then expose via D-Bus, or perhaps you have
something like that already on the works? I was thinking on something
like the following:

https://gist.github.com/Vudentz/55a7982b82c7a1156619b2a653969cac

I think as the object path we may need to use the SIRK or something
that uniquely identifies the set.

-- 
Luiz Augusto von Dentz
