Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B38262608
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Sep 2020 06:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbgIIEB1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Sep 2020 00:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgIIEB0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Sep 2020 00:01:26 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CE0C061573
        for <linux-bluetooth@vger.kernel.org>; Tue,  8 Sep 2020 21:01:24 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id u21so1501941eja.2
        for <linux-bluetooth@vger.kernel.org>; Tue, 08 Sep 2020 21:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ICo08fkw0ndkMnrFj48qiB6kFz4pwYBOgvKGrVqQdYY=;
        b=AZNdVXrXydT18d0PINrbW86ZeKVXeKFGcF68K5ss5+t2cBrWm3OxeIpxiQCfmWxkMo
         3umgOYZgEc0aIwrS7Z/fOqd+CL9NdWJVdVZavnKndmcTF7FTfGpEqt3grswQA5g57df3
         yFWqkaYtQfBC42QGHlGB71Ia7NXprFIibICUhWybExL8gCm5ahwq9GONl04vcKT6xFSA
         PCqNBkFcRv3QESMabAUbDHxeFq1GbQ82ByMxLyidtLxPe+TGoEBBjkyY2TvN30FBBB9c
         u0+62S+dyLiQgrIueJW2/AaRaf7FzXxu4dAQtNa+BS8tuM5j7TWgBnI2sbFbdr3qNlqd
         05iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ICo08fkw0ndkMnrFj48qiB6kFz4pwYBOgvKGrVqQdYY=;
        b=b0gNXUitWi9hMUwOxGkJAs+c4aH5aUSrBZmpx0kObnDuEI98Uw/WT2ALa42X/5hNSA
         RU4vu2qRXA69P88ouZnsiaYv/KFajNDYzZHj/O+hdJYIHQwpPf0PeuhMmli2rrdEOPUM
         Lr6MMMuIrKtNlro2hbrMfrv1iI7TbkjVACNeyNUWeFfIjy/8QaRCkGAkXuIQZd8wRpQg
         xY2GEu1FLFxB5wkLWCYDNpIbeSMcdSODFj4OR24LfAlkS/xQiOmIIlVY/CW2dgj6RXLE
         wv1FYpKqR7VpAso+PxaZsNDW7KlJJ9phZOGlBXW73rC6q0tr76yELPw52DQMWdYReUDr
         rNPg==
X-Gm-Message-State: AOAM530+czMZ6NgTtgDTh0waPbBCfcKh8LqZOXWSu2cbn58ZbNZwMmVD
        EaV8kY7WkcIpf90ZorMylcYEiX/jR869o3ySv2EUWA==
X-Google-Smtp-Source: ABdhPJw3OBoOxyLxGNY79DIw61cEMquS/zcLuesHD4fo6CzpBdlZQMEWMOFIbugDnxKT/vOSZwJJg6+auvnajyjUyiY=
X-Received: by 2002:a17:906:9386:: with SMTP id l6mr1684312ejx.302.1599624083151;
 Tue, 08 Sep 2020 21:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200819121048.BlueZ.v1.1.I3a57ea1eb3e3f5b87abc44ea478fc83817627ffc@changeid>
 <20200819121048.BlueZ.v1.2.I045d6f668c141c6b834ba6b31fc81618c0a7b8e8@changeid>
 <CABBYNZLeqA=i_JdcJUD-Q-6p_8DtMpmmW=gg4yvQrJ77jRG4sw@mail.gmail.com>
In-Reply-To: <CABBYNZLeqA=i_JdcJUD-Q-6p_8DtMpmmW=gg4yvQrJ77jRG4sw@mail.gmail.com>
From:   Yun-hao Chung <howardchung@google.com>
Date:   Wed, 9 Sep 2020 12:01:12 +0800
Message-ID: <CAPHZWUc0ZKcEwNcy5uzetyutszcQg16fa7_Ph9n3eRV0U6H-eQ@mail.gmail.com>
Subject: Re: [BlueZ PATCH v1 2/4] client: Implement more interfaces of ADV
 monitor in bluetoothctl
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Alain Michaud <alainm@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>,
        Manish Mandlik <mmandlik@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

Thanks for the comments.


On Wed, Sep 9, 2020 at 1:06 AM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Howard,
>
> On Tue, Aug 18, 2020 at 9:15 PM Howard Chung <howardchung@google.com> wrote:
> >
> > This patch creates a submenu in bluetoothctl and implements several
> > commands.
> >
> > new commands:
> > [bluetooth]# menu advmon
> > [bluetooth]# add-pattern-monitor or_patterns -10,10,-30,5 1,2,ab0011
> > Advertisement Monitor 0 added
> > [bluetooth]# get-pattern-monitor all
> > Advertisement Monitor 0
> >         path: /org/bluez/adv_monitor_app/0
> >         type: or_patterns
> >         rssi:
> >                 high threshold: -10
> >                 high threshold timer: 10
> >                 low threshold: -30
> >                 low threshold timer: 5
> >         pattern 1:
> >                 start position: 1
> >                 AD data type: 2
> >                 content: ab0011
> > [bluetooth]# get-supported-info
> > Supported Features:
> > Supported Moniter Types: or_patterns
> > [bluetooth]# remove-pattern-monitor 0
> > Monitor 0 deleted
> >
> > Signed-off-by: Howard Chung <howardchung@google.com>
> > ---
> >
> >  client/advertisement_monitor.c | 328 ++++++++++++++++++++++++++++++++-
> >  client/advertisement_monitor.h |   4 +
> >  client/main.c                  |  70 +++++++
> >  3 files changed, 399 insertions(+), 3 deletions(-)
> >
> > diff --git a/client/advertisement_monitor.c b/client/advertisement_monitor.c
> > index bd2309537..ec8f23711 100644
> > --- a/client/advertisement_monitor.c
> > +++ b/client/advertisement_monitor.c
> > @@ -29,6 +29,7 @@
> >  #include <string.h>
> >
> >  #include "gdbus/gdbus.h"
> > +#include "src/shared/ad.h"
> >  #include "src/shared/util.h"
> >  #include "src/shared/shell.h"
> >  #include "advertisement_monitor.h"
> > @@ -36,6 +37,27 @@
> >  #define ADV_MONITOR_APP_PATH "/org/bluez/adv_monitor_app"
> >  #define ADV_MONITOR_INTERFACE "org.bluez.AdvertisementMonitor1"
> >
> > +struct rssi_setting {
> > +       int16_t high_threshold;
> > +       uint16_t high_timer;
> > +       int16_t low_threshold;
> > +       uint16_t low_timer;
> > +};
> > +
> > +struct pattern {
> > +       uint8_t start_pos;
> > +       uint8_t ad_data_type;
> > +       uint8_t content_len;
> > +       uint8_t content[BT_AD_MAX_DATA_LEN];
> > +};
> > +
> > +struct adv_monitor {
> > +       uint8_t idx;
> > +       char *type;
> > +       struct rssi_setting *rssi;
> > +       GSList *patterns;
> > +};
> > +
> >  struct adv_monitor_manager {
> >         GSList *supported_types;
> >         GSList *supported_features;
> > @@ -43,6 +65,9 @@ struct adv_monitor_manager {
> >         gboolean app_registered;
> >  } manager = { NULL, NULL, NULL, FALSE };
> >
> > +static uint8_t adv_mon_idx;
> > +static GSList *adv_mons;
> > +
> >  static void set_supported_list(GSList **list, DBusMessageIter *iter)
> >  {
> >         char *str;
> > @@ -138,7 +163,10 @@ static void unregister_reply(DBusMessage *message, void *user_data)
> >
> >  void adv_monitor_register_app(DBusConnection *conn)
> >  {
> > -       if (manager.supported_types == NULL || manager.app_registered == TRUE ||
> > +       if (manager.app_registered == TRUE) {
> > +               bt_shell_printf("Advertisement Monitor already registered\n");
> > +               return bt_shell_noninteractive_quit(EXIT_FAILURE);
> > +       } else if (manager.supported_types == NULL ||
> >                 g_dbus_proxy_method_call(manager.proxy, "RegisterMonitor",
> >                                         register_setup, register_reply,
> >                                         NULL, NULL) == FALSE) {
> > @@ -150,8 +178,10 @@ void adv_monitor_register_app(DBusConnection *conn)
> >
> >  void adv_monitor_unregister_app(DBusConnection *conn)
> >  {
> > -       if (manager.app_registered == FALSE ||
> > -               g_dbus_proxy_method_call(manager.proxy, "UnregisterMonitor",
> > +       if (manager.app_registered == FALSE) {
> > +               bt_shell_printf("Advertisement Monitor not registered\n");
> > +               return bt_shell_noninteractive_quit(EXIT_FAILURE);
> > +       } else if (g_dbus_proxy_method_call(manager.proxy, "UnregisterMonitor",
> >                                         unregister_setup, unregister_reply,
> >                                         NULL, NULL) == FALSE) {
> >                 bt_shell_printf("Failed to unregister Advertisement Monitor\n");
> > @@ -159,3 +189,295 @@ void adv_monitor_unregister_app(DBusConnection *conn)
> >         }
> >         manager.app_registered = FALSE;
> >  }
> > +
> > +static void free_pattern(void *user_data)
> > +{
> > +       struct pattern *p = user_data;
> > +
> > +       g_free(p);
> > +}
> > +
> > +static void free_adv_monitor(void *user_data)
> > +{
> > +       struct adv_monitor *adv_monitor = user_data;
> > +
> > +       g_free(adv_monitor->type);
> > +       g_free(adv_monitor->rssi);
> > +       g_slist_free_full(adv_monitor->patterns, free_pattern);
> > +       g_free(adv_monitor);
> > +}
> > +
> > +static uint8_t str2bytearray(char *str, uint8_t *arr)
> > +{
> > +       int idx, len = strlen(str), arr_len = 0;
> > +
> > +       if (len%2 != 0)
> > +               return 0;
> > +
> > +       for (idx = 0; idx < len; idx += 2) {
> > +               if (sscanf(str+idx, "%2hhx", &arr[arr_len++]) < 1)
> > +                       return 0;
> > +       }
> > +       return arr_len;
> > +}
> > +
> > +static struct rssi_setting *parse_rssi(char *rssi_str)
> > +{
> > +       struct rssi_setting *rssi;
> > +       int16_t high_threshold, low_threshold;
> > +       uint16_t high_timer, low_timer;
> > +
> > +       if (sscanf(rssi_str, "%hd,%hu,%hd,%hu", &high_threshold, &high_timer,
> > +                                       &low_threshold, &low_timer) < 4)
> > +               return NULL;
> > +
> > +       rssi = g_malloc0(sizeof(struct rssi_setting));
> > +
> > +       if (!rssi) {
> > +               bt_shell_printf("Failed to allocate rssi_setting");
> > +               bt_shell_noninteractive_quit(EXIT_FAILURE);
> > +               return NULL;
> > +       }
> > +
> > +       rssi->high_threshold = high_threshold;
> > +       rssi->high_timer = high_timer;
> > +       rssi->low_threshold = low_threshold;
> > +       rssi->low_timer = low_timer;
> > +
> > +       return rssi;
> > +}
> > +
> > +static struct pattern *parse_pattern(char *pattern)
> > +{
> > +       uint8_t start_pos, ad_data_type;
> > +       char content_str[BT_AD_MAX_DATA_LEN];
> > +       struct pattern *pat;
> > +
> > +       if (sscanf(pattern, "%hhu,%hhu,%s", &start_pos, &ad_data_type,
> > +                                                       content_str) < 3)
> > +               return NULL;
> > +
> > +       pat = g_malloc0(sizeof(struct pattern));
> > +
> > +       if (!pat) {
> > +               bt_shell_printf("Failed to allocate pattern");
> > +               bt_shell_noninteractive_quit(EXIT_FAILURE);
> > +               return NULL;
> > +       }
> > +
> > +       pat->start_pos = start_pos;
> > +       pat->ad_data_type = ad_data_type;
> > +       pat->content_len = str2bytearray(content_str, pat->content);
> > +       if (pat->content_len == 0) {
> > +               free_pattern(pat);
> > +               return NULL;
> > +       }
> > +
> > +       return pat;
> > +}
> > +
> > +static GSList *parse_patterns(char *pattern_list[], int num)
> > +{
> > +       GSList *patterns = NULL;
> > +       int cnt;
> > +
> > +       if (num == 0) {
> > +               bt_shell_printf("No pattern provided\n");
> > +               return NULL;
> > +       }
> > +
> > +       for (cnt = 0; cnt < num; cnt++) {
> > +               struct pattern *pattern;
> > +
> > +               pattern = parse_pattern(pattern_list[cnt]);
> > +               if (pattern == NULL) {
> > +                       g_slist_free_full(patterns, free_pattern);
> > +                       return NULL;
> > +               }
> > +               patterns = g_slist_append(patterns, pattern);
> > +       }
> > +
> > +       return patterns;
> > +}
> > +
> > +static gint cmp_adv_monitor_with_idx(gconstpointer a, gconstpointer b)
> > +{
> > +       const struct adv_monitor *adv_monitor = a;
> > +       uint8_t idx = *(uint8_t *)b;
> > +
> > +       return adv_monitor->idx != idx;
> > +}
> > +
> > +static struct adv_monitor *find_adv_monitor_with_idx(uint8_t monitor_idx)
> > +{
> > +       GSList *list;
> > +
> > +       list = g_slist_find_custom(adv_mons, &monitor_idx,
> > +                                               cmp_adv_monitor_with_idx);
> > +
> > +       if (list)
> > +               return (struct adv_monitor *)list->data;
> > +       return NULL;
> > +}
> > +
> > +static void print_bytearray(char *prefix, uint8_t *arr, uint8_t len)
> > +{
> > +       int idx;
> > +
> > +       bt_shell_printf("%s", prefix);
> > +       for (idx = 0; idx < len; idx++)
> > +               bt_shell_printf("%02hhx", arr[idx]);
> > +       bt_shell_printf("\n");
> > +}
> > +
> > +static void print_adv_monitor(struct adv_monitor *adv_monitor)
> > +{
> > +       GSList *l;
> > +
> > +       bt_shell_printf("Advertisement Monitor %d\n", adv_monitor->idx);
> > +       bt_shell_printf("\ttype: %s\n", adv_monitor->type);
> > +       if (adv_monitor->rssi) {
> > +               bt_shell_printf("\trssi:\n");
> > +               bt_shell_printf("\t\thigh threshold: %hd\n",
> > +                                       adv_monitor->rssi->high_threshold);
> > +               bt_shell_printf("\t\thigh threshold timer: %hu\n",
> > +                                       adv_monitor->rssi->high_timer);
> > +               bt_shell_printf("\t\tlow threshold: %hd\n",
> > +                                       adv_monitor->rssi->low_threshold);
> > +               bt_shell_printf("\t\tlow threshold timer: %hu\n",
> > +                                       adv_monitor->rssi->low_timer);
> > +       }
> > +
> > +       if (adv_monitor->patterns) {
> > +               int idx = 1;
> > +
> > +               for (l = adv_monitor->patterns; l; l = g_slist_next(l), idx++) {
> > +                       struct pattern *pattern = l->data;
> > +
> > +                       bt_shell_printf("\tpattern %d:\n", idx);
> > +                       bt_shell_printf("\t\tstart position: %hhu\n",
> > +                                                       pattern->start_pos);
> > +                       bt_shell_printf("\t\tAD data type: %hhu\n",
> > +                                                       pattern->ad_data_type);
> > +                       print_bytearray("\t\tcontent: ", pattern->content,
> > +                                                       pattern->content_len);
> > +               }
> > +       }
> > +}
> > +
> > +void adv_monitor_add_monitor(DBusConnection *conn, int argc, char *argv[])
> > +{
> > +       struct adv_monitor *adv_monitor;
> > +       struct rssi_setting *rssi;
> > +       GSList *patterns = NULL;
> > +       char *type;
> > +
> > +       if (g_slist_length(adv_mons) >= UINT8_MAX) {
> > +               bt_shell_printf("Number of advertisement monitor exceeds "
> > +                               "the limit");
> > +               return;
> > +       }
> > +
> > +       while (find_adv_monitor_with_idx(adv_mon_idx))
> > +               adv_mon_idx += 1;
> > +
> > +       type = argv[1];
> > +
> > +       if (strcmp(argv[2], "-") == 0)
> > +               rssi = NULL;
> > +       else {
> > +               rssi = parse_rssi(argv[2]);
> > +               if (rssi == NULL) {
> > +                       bt_shell_printf("RSSIThresholdAndTimers malformed\n");
> > +                       return;
> > +               }
> > +       }
> > +
> > +       patterns = parse_patterns(argv+3, argc-3);
> > +       if (patterns == NULL) {
> > +               bt_shell_printf("pattern-list malformed\n");
> > +               return;
> > +       }
> > +
> > +       adv_monitor = g_malloc0(sizeof(struct adv_monitor));
> > +
> > +       if (!adv_monitor) {
> > +               bt_shell_printf("Failed to allocate adv_monitor");
> > +               return bt_shell_noninteractive_quit(EXIT_FAILURE);
> > +       }
> > +
> > +       adv_monitor->idx = adv_mon_idx;
> > +       adv_monitor->type = g_strdup(type);
> > +       adv_monitor->rssi = rssi;
> > +       adv_monitor->patterns = patterns;
> > +
> > +       adv_mons = g_slist_append(adv_mons, adv_monitor);
> > +       bt_shell_printf("Advertisement Monitor %d added\n", adv_monitor->idx);
> > +}
> > +
> > +void adv_monitor_print_monitor(DBusConnection *conn, int monitor_idx)
> > +{
> > +       struct adv_monitor *adv_monitor;
> > +       GSList *l;
> > +
> > +       if (monitor_idx < 0) {
> > +               for (l = adv_mons; l; l = g_slist_next(l)) {
> > +                       adv_monitor = l->data;
> > +                       print_adv_monitor(adv_monitor);
> > +               }
> > +               return;
> > +       }
> > +
> > +       adv_monitor = find_adv_monitor_with_idx(monitor_idx);
> > +
> > +       if (adv_monitor == NULL) {
> > +               bt_shell_printf("Can't find monitor with index %d\n",
> > +                                                               monitor_idx);
> > +               return;
> > +       }
> > +
> > +       print_adv_monitor(adv_monitor);
> > +}
> > +
> > +void adv_monitor_remove_monitor(DBusConnection *conn, int monitor_idx)
> > +{
> > +       struct adv_monitor *adv_monitor;
> > +
> > +       if (monitor_idx < 0) {
> > +               g_slist_free_full(g_steal_pointer(&adv_mons), free_adv_monitor);
> > +               return;
> > +       }
> > +
> > +       adv_monitor = find_adv_monitor_with_idx(monitor_idx);
> > +       if (adv_monitor == NULL) {
> > +               bt_shell_printf("Can't find monitor with index %d\n",
> > +                                                               monitor_idx);
> > +               return;
> > +       }
> > +
> > +       adv_mons = g_slist_remove(adv_mons, adv_monitor);
> > +       free_adv_monitor(adv_monitor);
> > +       bt_shell_printf("Monitor %d deleted\n", monitor_idx);
> > +}
> > +
> > +static void print_supported_list(GSList *list)
> > +{
> > +       GSList *iter;
> > +
> > +       for (iter = list; iter; iter = g_slist_next(iter)) {
> > +               char *data = iter->data;
> > +
> > +               printf(" %s", data);
> > +       }
> > +}
> > +
> > +void adv_monitor_get_supported_info(void)
> > +{
> > +       bt_shell_printf("Supported Features:");
> > +       print_supported_list(manager.supported_features);
> > +       bt_shell_printf("\n");
> > +
> > +       bt_shell_printf("Supported Moniter Types:");
> > +       print_supported_list(manager.supported_types);
> > +       bt_shell_printf("\n");
> > +}
> > diff --git a/client/advertisement_monitor.h b/client/advertisement_monitor.h
> > index 77b0b62c6..f2a0caf77 100644
> > --- a/client/advertisement_monitor.h
> > +++ b/client/advertisement_monitor.h
> > @@ -21,3 +21,7 @@ void adv_monitor_add_manager(DBusConnection *conn, GDBusProxy *proxy);
> >  void adv_monitor_remove_manager(DBusConnection *conn);
> >  void adv_monitor_register_app(DBusConnection *conn);
> >  void adv_monitor_unregister_app(DBusConnection *conn);
> > +void adv_monitor_add_monitor(DBusConnection *conn, int argc, char *argv[]);
> > +void adv_monitor_print_monitor(DBusConnection *conn, int monitor_idx);
> > +void adv_monitor_remove_monitor(DBusConnection *conn, int monitor_idx);
> > +void adv_monitor_get_supported_info(void);
> > diff --git a/client/main.c b/client/main.c
> > index 7ddd13aa0..2b63ee62a 100644
> > --- a/client/main.c
> > +++ b/client/main.c
> > @@ -2686,6 +2686,53 @@ static void cmd_ad_clear(int argc, char *argv[])
> >                 return bt_shell_noninteractive_quit(EXIT_FAILURE);
> >  }
> >
> > +static void print_add_monitor_usage(void)
> > +{
> > +       bt_shell_usage();
> > +       bt_shell_printf("RSSIThresholdAndTimers format:\n"
> > +                       "\t<high-rssi>,<high-timeout>,<low-rssi>,<low-timeout>\n"
> > +                       "\tor single '-' for not using RSSI as filter\n");
> > +       bt_shell_printf("pattern format:\n"
> > +                       "\t<start_position>,<ad_data_type>,<content_of_pattern>\n");
> > +       bt_shell_printf("e.g.\n"
> > +                       "\tadd-pattern-monitor or_patterns -10,10,-20,20 1,2,01ab55\n");
>
> btshell parameters are space separated not comma.

The reason we use commas is because RSSIThresholdAndTimers is an
all-or-none property, it's clearer for users to either input all the
four parameters or a single '-' to leave it unset.
For a similar reason, a valid pattern requires all of the three
parameters provided. If we want to avoid comma for maintaining
consistency, we could have command usage like:

add-pattern or_patterns -10 10 -20 20 1 2 01ab55     // single content
with RSSI filter
add-pattern or_patterns - 1 2 01ab55                         // single
content without RSSI filter

Let me know if this is OK with you and other suggestions are welcome.

>
> > +}
> > +
> > +static void cmd_adv_monitor_add_monitor(int argc, char *argv[])
> > +{
> > +       if (argc < 3)
> > +               print_add_monitor_usage();
> > +       else
> > +               adv_monitor_add_monitor(dbus_conn, argc, argv);
> > +}
> > +
> > +static void cmd_adv_monitor_print_monitor(int argc, char *argv[])
> > +{
> > +       int monitor_idx;
> > +
> > +       if (strcmp(argv[1], "all") == 0)
> > +               monitor_idx = -1;
> > +       else
> > +               monitor_idx = atoi(argv[1]);
> > +       adv_monitor_print_monitor(dbus_conn, monitor_idx);
> > +}
> > +
> > +static void cmd_adv_monitor_remove_monitor(int argc, char *argv[])
> > +{
> > +       int monitor_idx;
> > +
> > +       if (strcmp(argv[1], "all") == 0)
> > +               monitor_idx = -1;
> > +       else
> > +               monitor_idx = atoi(argv[1]);
> > +       adv_monitor_remove_monitor(dbus_conn, monitor_idx);
> > +}
> > +
> > +static void cmd_adv_monitor_get_supported_info(int argc, char *argv[])
> > +{
> > +       adv_monitor_get_supported_info();
> > +}
> > +
> >  static const struct bt_shell_menu advertise_menu = {
> >         .name = "advertise",
> >         .desc = "Advertise Options Submenu",
> > @@ -2722,6 +2769,28 @@ static const struct bt_shell_menu advertise_menu = {
> >         { } },
> >  };
> >
> > +static const struct bt_shell_menu advertise_monitor_menu = {
> > +       .name = "advmon",
>
> I'd use monitor instead of advmon here.

Will address these in the next patch. Thanks!

>
> > +       .desc = "Advertisement Monitor Options Submenu",
> > +       .entries = {
> > +       { "add-pattern-monitor", "<type-of-monitor/help> "
> > +                               "[RSSIThresholdAndTimers] "
> > +                               "[patterns=pattern1 pattern2 ...]",
> > +                               cmd_adv_monitor_add_monitor,
> > +                               "Add pattern monitor" },
> > +       { "get-pattern-monitor", "<monitor-id/all>",
> > +                               cmd_adv_monitor_print_monitor,
> > +                               "Get advertisement monitor" },
> > +       { "remove-pattern-monitor", "<monitor-id/all>",
> > +                               cmd_adv_monitor_remove_monitor,
> > +                               "Remove advertisement monitor" },
> > +       { "get-supported-info", NULL,
> > +                               cmd_adv_monitor_get_supported_info,
> > +                               "Get advertisement manager supported "
> > +                               "features and supported monitor types" },
>
> We could probably drop the monitor from the commands here which should
> leave us at:
>
> add-pattern
> get-pattern
> remote-pattern
> supported-info
>
> > +       { } },
> > +};
> > +
> >  static const struct bt_shell_menu scan_menu = {
> >         .name = "scan",
> >         .desc = "Scan Options Submenu",
> > @@ -2897,6 +2966,7 @@ int main(int argc, char *argv[])
> >         bt_shell_init(argc, argv, &opt);
> >         bt_shell_set_menu(&main_menu);
> >         bt_shell_add_submenu(&advertise_menu);
> > +       bt_shell_add_submenu(&advertise_monitor_menu);
> >         bt_shell_add_submenu(&scan_menu);
> >         bt_shell_add_submenu(&gatt_menu);
> >         bt_shell_set_prompt(PROMPT_OFF);
> > --
> > 2.28.0.220.ged08abb693-goog
> >
>
>
> --
> Luiz Augusto von Dentz
