Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9935BEE64
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Sep 2022 22:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiITUWs (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 20 Sep 2022 16:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiITUWr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 20 Sep 2022 16:22:47 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB775280D
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Sep 2022 13:22:45 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a8so5704716lff.13
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Sep 2022 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=N56+1yqCe2EugcLvX7Cw1xmgHADQPxvTdZ/RKN5TFc8=;
        b=mc7qQGafwPds4fjuO3/Z8vjTYJyLR7Ve5osrwQFTCO7UB8n+HHglWmfG/aLqeUtb4L
         sL5/m/l/vqVery3bB7Yq8zSvjnnyGuCJBAphD7JRlmCFD+TenwO36xefD9sqlMHhzicf
         A+6ZJdztv9g+Tfty3IbrHEOVlJSJ4BuAjWZSf7SPXWJjBtlCAUcXDaEPR7CJBHn7XhFq
         7OPPk54WzDAuOKcUfucE5HhLPJQNavvAOHcUYHfGso6bAaYtkSLnS3GzxqVUoEnoa+0G
         gEsqgmbqhKXgJ7nSG+5NW3XpKi9Rmz5yOsI4nB5x+hIxWU5ZXRYAKe5ixkIZ7/zRobWa
         oCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=N56+1yqCe2EugcLvX7Cw1xmgHADQPxvTdZ/RKN5TFc8=;
        b=06EE2x6eEx0QOwqpzVUIr3YtzwToASG52qY+hRYQQUsggJJWWtLDSYqbjETNRxbNVc
         ENI9dbXaMgOqagyj8JkyeGQNgVl7x9z01xJu2BpqkIfvnWoaDBuT7lW+r3DW2h/Uu6eM
         Tz814IVB0t8RU1/l/VnPtTAc/pGtKS5GJm5TDs/QzaPlwLtev2bC0Wo3JwC1Kb8SUuKX
         Ozr+F0eyC6u1Ss8UusTOIJI69ak1YDCZ2iREIC2dj3CPK2osovTb8XEVHsPRsoYjacaU
         jk2VC1xwoicI3mtRRHqKpzWCTec6lJrmOyqc3UqoMDVsuLIlP0/Rzq8XX/SEPxpeHcJ+
         vKLA==
X-Gm-Message-State: ACrzQf035Jj7FK0gTOM8j7nlREZFNSLlaXhmxiLddBx/H7EwXgaL59Ky
        2e7GKejZNQkIWSIr/XBGc8vZrG3WTtzb9JLu6pGxxczuvLL8nA==
X-Google-Smtp-Source: AMsMyM7a7jftwVi4c/DjiJZkmGK3UFmAY81h0PzuoqtTPg06Gsb8WryHCkzXmAxIVhLe03ZgPvIfnqLIx5koccgXaHQ=
X-Received: by 2002:a05:6512:2621:b0:47f:d228:bdeb with SMTP id
 bt33-20020a056512262100b0047fd228bdebmr8151494lfb.121.1663705362907; Tue, 20
 Sep 2022 13:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220920102847.599893-1-sathish.narasimman@intel.com>
In-Reply-To: <20220920102847.599893-1-sathish.narasimman@intel.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Tue, 20 Sep 2022 13:22:31 -0700
Message-ID: <CABBYNZK5-sL8Ls+1F2f7+NO7rK5B1z7tgfq+=Yh66Xgcesu7wg@mail.gmail.com>
Subject: Re: [PATCH BlueZ 1/1] sharaed/vcp: Add bt_vcp_set_debug
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

On Tue, Sep 20, 2022 at 3:29 AM Sathish Narasimman
<sathish.narasimman@intel.com> wrote:
>
> This enables debug with bt_vcp_set_debug.
> ---
>  profiles/audio/vcp.c |   7 ++
>  src/shared/vcp.c     | 238 +++++++++++++++++++++++++++----------------
>  src/shared/vcp.h     |   5 +
>  3 files changed, 163 insertions(+), 87 deletions(-)
>
> diff --git a/profiles/audio/vcp.c b/profiles/audio/vcp.c
> index e7e84174e7d4..b42b0a4f79dd 100644
> --- a/profiles/audio/vcp.c
> +++ b/profiles/audio/vcp.c
> @@ -62,6 +62,11 @@ struct vcp_data {
>
>  static struct queue *sessions;
>
> +static void vcp_debug(const char *str, void *user_data)
> +{
> +       DBG_IDX(0xffff, "%s", str);
> +}
> +
>  static int vcp_disconnect(struct btd_service *service)
>  {
>         DBG("");
> @@ -87,6 +92,8 @@ static void vcp_data_add(struct vcp_data *data)
>                 return;
>         }
>
> +       bt_vcp_set_debug(data->vcp, vcp_debug, NULL, NULL);
> +
>         if (!sessions)
>                 sessions = queue_new();

Let's have the above changes as a separate patch.

> diff --git a/src/shared/vcp.c b/src/shared/vcp.c
> index 4f8dc37e3c3e..3d0ff016d805 100644
> --- a/src/shared/vcp.c
> +++ b/src/shared/vcp.c
> @@ -26,7 +26,9 @@
>  #include "src/shared/gatt-server.h"
>  #include "src/shared/gatt-client.h"
>  #include "src/shared/vcp.h"
> -#include "src/log.h"
> +
> +#define DBG(_vcp, fmt, arg...) \
> +       vcp_debug(_vcp, "%s:%s() " fmt, __FILE__, __func__, ## arg)
>
>  #define VCP_STEP_SIZE 1
>
> @@ -87,8 +89,11 @@ struct bt_vcp {
>         unsigned int vstate_id;
>         unsigned int vflag_id;
>
> +       struct queue *notify;
>         struct queue *pending;
>
> +       bt_vcp_debug_func_t debug_func;
> +       bt_vcp_destroy_func_t debug_destroy;
>         void *debug_data;
>         void *user_data;
>  };
> @@ -262,11 +267,23 @@ void bt_vcp_unref(struct bt_vcp *vcp)
>         vcp_free(vcp);
>  }
>
> +static void vcp_debug(struct bt_vcp *vcp, const char *format, ...)
> +{
> +       va_list ap;
> +
> +       if (!vcp || !format || !vcp->debug_func)
> +               return;
> +
> +       va_start(ap, format);
> +       util_debug_va(vcp->debug_func, vcp->debug_data, format, ap);
> +       va_end(ap);
> +}
> +
>  static void vcp_disconnected(int err, void *user_data)
>  {
>         struct bt_vcp *vcp = user_data;
>
> -       DBG("vcp %p disconnected err %d", vcp, err);
> +       DBG(vcp, "vcp %p disconnected err %d", vcp, err);
>
>         bt_vcp_detach(vcp);
>  }
> @@ -301,17 +318,17 @@ static uint8_t vcs_rel_vol_down(struct bt_vcs *vcs, struct bt_vcp *vcp,
>         struct vol_state *vstate;
>         uint8_t *change_counter;
>
> -       DBG("");
> +       DBG(vcp, "Volume Down");
>
>         vdb = vcp_get_vdb(vcp);
>         if (!vdb) {
> -               DBG("error: VDB not availalbe");
> +               DBG(vcp, "error: VDB not availalbe");

While at it please fix the typos s/availalbe/available, there are
quite a few of those.

>                 return 0;
>         }
>
>         vstate = vdb_get_vstate(vdb);
>         if (!vstate) {
> -               DBG("error: VSTATE not availalbe");
> +               DBG(vcp, "error: VSTATE not availalbe");
>                 return 0;
>         }
>
> @@ -320,7 +337,7 @@ static uint8_t vcs_rel_vol_down(struct bt_vcs *vcs, struct bt_vcp *vcp,
>                 return 0;
>
>         if (*change_counter != vstate->counter) {
> -               DBG("Change Counter Mismatch Volume not decremented!");
> +               DBG(vcp, "Change Counter Mismatch Volume not decremented!");
>                 return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
>         }
>
> @@ -340,17 +357,17 @@ static uint8_t vcs_rel_vol_up(struct bt_vcs *vcs, struct bt_vcp *vcp,
>         struct vol_state *vstate;
>         uint8_t *change_counter;
>
> -       DBG("");
> +       DBG(vcp, "Volume Up");
>
>         vdb = vcp_get_vdb(vcp);
>         if (!vdb) {
> -               DBG("error: VDB not availalbe");
> +               DBG(vcp, "error: VDB not availalbe");
>                 return 0;
>         }
>
>         vstate = vdb_get_vstate(vdb);
>         if (!vstate) {
> -               DBG("error: VCP database not availalbe!!!!");
> +               DBG(vcp, "error: VCP database not availalbe!!!!");
>                 return 0;
>         }
>
> @@ -359,7 +376,7 @@ static uint8_t vcs_rel_vol_up(struct bt_vcs *vcs, struct bt_vcp *vcp,
>                 return 0;
>
>         if (*change_counter != vstate->counter) {
> -               DBG("Change Counter Mismatch Volume not decremented!");
> +               DBG(vcp, "Change Counter Mismatch Volume not decremented!");
>                 return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
>         }
>
> @@ -379,17 +396,17 @@ static uint8_t vcs_unmute_rel_vol_down(struct bt_vcs *vcs, struct bt_vcp *vcp,
>         struct vol_state *vstate;
>         uint8_t *change_counter;
>
> -       DBG("");
> +       DBG(vcp, "Un Mute and Volume Down");
>
>         vdb = vcp_get_vdb(vcp);
>         if (!vdb) {
> -               DBG("error: VDB not availalbe");
> +               DBG(vcp, "error: VDB not availalbe");
>                 return 0;
>         }
>
>         vstate = vdb_get_vstate(vdb);
>         if (!vstate) {
> -               DBG("error: VCP database not availalbe!!!!");
> +               DBG(vcp, "error: VCP database not availalbe!!!!");
>                 return 0;
>         }
>
> @@ -398,7 +415,7 @@ static uint8_t vcs_unmute_rel_vol_down(struct bt_vcs *vcs, struct bt_vcp *vcp,
>                 return 0;
>
>         if (*change_counter != vstate->counter) {
> -               DBG("Change Counter Mismatch Volume not decremented!");
> +               DBG(vcp, "Change Counter Mismatch Volume not decremented!");
>                 return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
>         }
>
> @@ -419,17 +436,17 @@ static uint8_t vcs_unmute_rel_vol_up(struct bt_vcs *vcs, struct bt_vcp *vcp,
>         struct vol_state *vstate;
>         uint8_t *change_counter;
>
> -       DBG("");
> +       DBG(vcp, "UN Mute and Volume Up");
>
>         vdb = vcp_get_vdb(vcp);
>         if (!vdb) {
> -               DBG("error: VDB not availalbe");
> +               DBG(vcp, "error: VDB not availalbe");
>                 return 0;
>         }
>
>         vstate = vdb_get_vstate(vdb);
>         if (!vstate) {
> -               DBG("error: VSTATE not availalbe");
> +               DBG(vcp, "error: VSTATE not availalbe");
>                 return 0;
>         }
>
> @@ -438,7 +455,7 @@ static uint8_t vcs_unmute_rel_vol_up(struct bt_vcs *vcs, struct bt_vcp *vcp,
>                 return 0;
>
>         if (*change_counter != vstate->counter) {
> -               DBG("Change Counter Mismatch Volume not decremented!");
> +               DBG(vcp, "Change Counter Mismatch Volume not decremented!");
>                 return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
>         }
>
> @@ -459,17 +476,17 @@ static uint8_t vcs_set_absolute_vol(struct bt_vcs *vcs, struct bt_vcp *vcp,
>         struct vol_state *vstate;
>         struct bt_vcs_ab_vol *req;
>
> -       DBG("");
> +       DBG(vcp, "Set Absolute Volume");
>
>         vdb = vcp_get_vdb(vcp);
>         if (!vdb) {
> -               DBG("error: VDB not availalbe");
> +               DBG(vcp, "error: VDB not availalbe");
>                 return 0;
>         }
>
>         vstate = vdb_get_vstate(vdb);
>         if (!vstate) {
> -               DBG("error: VSTATE not availalbe");
> +               DBG(vcp, "error: VSTATE not availalbe");
>                 return 0;
>         }
>
> @@ -478,7 +495,7 @@ static uint8_t vcs_set_absolute_vol(struct bt_vcs *vcs, struct bt_vcp *vcp,
>                 return 0;
>
>         if (req->change_counter != vstate->counter) {
> -               DBG("Change Counter Mismatch Volume not decremented!");
> +               DBG(vcp, "Change Counter Mismatch Volume not decremented!");
>                 return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
>         }
>
> @@ -498,17 +515,17 @@ static uint8_t vcs_unmute(struct bt_vcs *vcs, struct bt_vcp *vcp,
>         struct vol_state *vstate;
>         uint8_t *change_counter;
>
> -       DBG("");
> +       DBG(vcp, "Un Mute");
>
>         vdb = vcp_get_vdb(vcp);
>         if (!vdb) {
> -               DBG("error: VDB not availalbe");
> +               DBG(vcp, "error: VDB not availalbe");
>                 return 0;
>         }
>
>         vstate = vdb_get_vstate(vdb);
>         if (!vstate) {
> -               DBG("error: VSTATE not availalbe");
> +               DBG(vcp, "error: VSTATE not availalbe");
>                 return 0;
>         }
>
> @@ -517,7 +534,7 @@ static uint8_t vcs_unmute(struct bt_vcs *vcs, struct bt_vcp *vcp,
>                 return 0;
>
>         if (*change_counter != vstate->counter) {
> -               DBG("Change Counter Mismatch Volume not decremented!");
> +               DBG(vcp, "Change Counter Mismatch Volume not decremented!");
>                 return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
>         }
>
> @@ -537,17 +554,17 @@ static uint8_t vcs_mute(struct bt_vcs *vcs, struct bt_vcp *vcp,
>         struct vol_state *vstate;
>         uint8_t *change_counter;
>
> -       DBG("");
> +       DBG(vcp, "MUTE");
>
>         vdb = vcp_get_vdb(vcp);
>         if (!vdb) {
> -               DBG("error: VDB not availalbe");
> +               DBG(vcp, "error: VDB not availalbe");
>                 return 0;
>         }
>
>         vstate = vdb_get_vstate(vdb);
>         if (!vstate) {
> -               DBG("error: VSTATE not availalbe");
> +               DBG(vcp, "error: VSTATE not availalbe");
>                 return 0;
>         }
>
> @@ -556,7 +573,7 @@ static uint8_t vcs_mute(struct bt_vcs *vcs, struct bt_vcp *vcp,
>                 return 0;
>
>         if (*change_counter != vstate->counter) {
> -               DBG("Change Counter Mismatch Volume not decremented!");
> +               DBG(vcp, "Change Counter Mismatch Volume not decremented!");
>                 return BT_ATT_ERROR_INVALID_CHANGE_COUNTER;
>         }
>
> @@ -622,16 +639,16 @@ static void vcs_cp_write(struct gatt_db_attribute *attrib,
>         struct vcs_op_handler *handler;
>         uint8_t ret = BT_ATT_ERROR_REQUEST_NOT_SUPPORTED;
>
> -       DBG("");
> +       DBG(vcp, "VCP Control Point Write");
>
>         if (offset) {
> -               DBG("invalid offset %d", offset);
> +               DBG(vcp, "invalid offset %d", offset);
>                 ret = BT_ATT_ERROR_INVALID_OFFSET;
>                 goto respond;
>         }
>
>         if (len < sizeof(*vcp_op)) {
> -               DBG("invalid len %ld < %ld sizeof(*param)", len,
> +               DBG(vcp, "invalid len %ld < %ld sizeof(*param)", len,
>                                                         sizeof(*vcp_op));
>                 ret = BT_ATT_ERROR_INVALID_ATTRIBUTE_VALUE_LEN;
>                 goto respond;
> @@ -639,14 +656,12 @@ static void vcs_cp_write(struct gatt_db_attribute *attrib,
>
>         vcp_op = iov_pull_mem(&iov, sizeof(*vcp_op));
>
> -       DBG("op: %x", *vcp_op);
> -
>         for (handler = vcp_handlers; handler && handler->str; handler++) {
>                 if (handler->op != *vcp_op)
>                         continue;
>
>                 if (iov.iov_len < handler->size) {
> -                       DBG("invalid len %ld < %ld handler->size", len,
> +                       DBG(vcp, "invalid len %ld < %ld handler->size", len,
>                             handler->size);
>                         ret = BT_ATT_ERROR_OPCODE_NOT_SUPPORTED;
>                         goto respond;
> @@ -656,11 +671,11 @@ static void vcs_cp_write(struct gatt_db_attribute *attrib,
>         }
>
>         if (handler && handler->str) {
> -               DBG("%s", handler->str);
> +               DBG(vcp, "%s", handler->str);
>
>                 ret = handler->func(vcs, vcp, &iov);
>         } else {
> -               DBG("Unknown opcode 0x%02x", *vcp_op);
> +               DBG(vcp, "Unknown opcode 0x%02x", *vcp_op);
>                 ret = BT_ATT_ERROR_OPCODE_NOT_SUPPORTED;
>         }
>
> @@ -676,8 +691,6 @@ static void vcs_state_read(struct gatt_db_attribute *attrib,
>         struct bt_vcs *vcs = user_data;
>         struct iovec iov;
>
> -       DBG("");
> -
>         iov.iov_base = vcs->vstate;
>         iov.iov_len = sizeof(*vcs->vstate);
>
> @@ -693,8 +706,6 @@ static void vcs_flag_read(struct gatt_db_attribute *attrib,
>         struct bt_vcs *vcs = user_data;
>         struct iovec iov;
>
> -       DBG("vf: %x", vcs->vol_flag);
> -
>         iov.iov_base = &vcs->vol_flag;
>         iov.iov_len = sizeof(vcs->vol_flag);
>
> @@ -797,6 +808,22 @@ void bt_vcp_add_db(struct gatt_db *db)
>         vcp_db_new(db);
>  }
>
> +bool bt_vcp_set_debug(struct bt_vcp *vcp, bt_vcp_debug_func_t func,
> +                       void *user_data, bt_vcp_destroy_func_t destroy)
> +{
> +       if (!vcp)
> +               return false;
> +
> +       if (vcp->debug_destroy)
> +               vcp->debug_destroy(vcp->debug_data);
> +
> +       vcp->debug_func = func;
> +       vcp->debug_destroy = destroy;
> +       vcp->debug_data = user_data;
> +
> +       return true;
> +}
> +
>  unsigned int bt_vcp_register(bt_vcp_func_t attached, bt_vcp_func_t detached,
>                                                         void *user_data)
>  {
> @@ -871,40 +898,28 @@ done:
>         return vcp;
>  }
>
> -static void vcp_vstate_register(uint16_t att_ecode, void *user_data)
> -{
> -       DBG("");
> -       if (att_ecode)
> -               DBG("VCS register failed: 0x%04x", att_ecode);
> -}
> -
> -static void vcp_vflag_register(uint16_t att_ecode, void *user_data)
> -{
> -       DBG("");
> -       if (att_ecode)
> -               DBG("VCS register failed: 0x%04x", att_ecode);
> -}
> -
> -static void vcp_vstate_notify(uint16_t value_handle, const uint8_t *value,
> -                               uint16_t length, void *user_data)
> +static void vcp_vstate_notify(struct bt_vcp *vcp, uint16_t value_handle,
> +                               const uint8_t *value, uint16_t length,
> +                               void *user_data)
>  {
>         struct vol_state vstate;
>
>         memcpy(&vstate, value, sizeof(struct vol_state));
>
> -       DBG("Vol Settings 0x%x", vstate.vol_set);
> -       DBG("Mute Status 0x%x", vstate.mute);
> -       DBG("Vol Counter 0x%x", vstate.counter);
> +       DBG(vcp, "Vol Settings 0x%x", vstate.vol_set);
> +       DBG(vcp, "Mute Status 0x%x", vstate.mute);
> +       DBG(vcp, "Vol Counter 0x%x", vstate.counter);
>  }
>
> -static void vcp_vflag_notify(uint16_t value_handle, const uint8_t *value,
> -                               uint16_t length, void *user_data)
> +static void vcp_vflag_notify(struct bt_vcp *vcp, uint16_t value_handle,
> +                            const uint8_t *value, uint16_t length,
> +                            void *user_data)
>  {
>         uint8_t vflag;
>
>         memcpy(&vflag, value, sizeof(vflag));
>
> -       DBG("Vol Flag 0x%x", vflag);
> +       DBG(vcp, "Vol Flag 0x%x", vflag);
>  }
>
>  static void read_vol_flag(struct bt_vcp *vcp, bool success, uint8_t att_ecode,
> @@ -918,17 +933,17 @@ static void read_vol_flag(struct bt_vcp *vcp, bool success, uint8_t att_ecode,
>         };
>
>         if (!success) {
> -               DBG("Unable to read VCP Vol State: error 0x%02x", att_ecode);
> +               DBG(vcp, "Unable to read Vol Flag: error 0x%02x", att_ecode);
>                 return;
>         }
>
>         vol_flag = iov_pull_mem(&iov, sizeof(*vol_flag));
>         if (!vol_flag) {
> -               DBG("Unable to get Vol State");
> +               DBG(vcp, "Unable to get Vol Flag");
>                 return;
>         }
>
> -       DBG("Vol Flag:%x", *vol_flag);
> +       DBG(vcp, "Vol Flag:%x", *vol_flag);
>  }
>
>  static void read_vol_state(struct bt_vcp *vcp, bool success, uint8_t att_ecode,
> @@ -942,19 +957,19 @@ static void read_vol_state(struct bt_vcp *vcp, bool success, uint8_t att_ecode,
>         };
>
>         if (!success) {
> -               DBG("Unable to read VCP Vol State: error 0x%02x", att_ecode);
> +               DBG(vcp, "Unable to read Vol State: error 0x%02x", att_ecode);
>                 return;
>         }
>
>         vs = iov_pull_mem(&iov, sizeof(*vs));
>         if (!vs) {
> -               DBG("Unable to get Vol State");
> +               DBG(vcp, "Unable to get Vol State");
>                 return;
>         }
>
> -       DBG("Vol Set:%x", vs->vol_set);
> -       DBG("Vol Mute:%x", vs->mute);
> -       DBG("Vol Counter:%x", vs->counter);
> +       DBG(vcp, "Vol Set:%x", vs->vol_set);
> +       DBG(vcp, "Vol Mute:%x", vs->mute);
> +       DBG(vcp, "Vol Counter:%x", vs->counter);
>  }
>
>  static void vcp_pending_destroy(void *data)
> @@ -991,7 +1006,7 @@ static void vcp_read_value(struct bt_vcp *vcp, uint16_t value_handle,
>                                                 vcp_pending_complete, pending,
>                                                 vcp_pending_destroy);
>         if (!pending->id) {
> -               DBG("Unable to send Read request");
> +               DBG(vcp, "Unable to send Read request");
>                 free(pending);
>                 return;
>         }
> @@ -999,6 +1014,60 @@ static void vcp_read_value(struct bt_vcp *vcp, uint16_t value_handle,
>         queue_push_tail(vcp->pending, pending);
>  }
>
> +static void vcp_register(uint16_t att_ecode, void *user_data)
> +{
> +       struct bt_vcp_notify *notify = user_data;
> +
> +       if (att_ecode)
> +               DBG(notify->vcp, "VCP register failed: 0x%04x", att_ecode);
> +}
> +
> +static void vcp_notify(uint16_t value_handle, const uint8_t *value,
> +                               uint16_t length, void *user_data)
> +{
> +       struct bt_vcp_notify *notify = user_data;
> +
> +       if (notify->func)
> +               notify->func(notify->vcp, value_handle, value, length,
> +                                               notify->user_data);
> +}
> +
> +static void vcp_notify_destroy(void *data)
> +{
> +       struct bt_vcp_notify *notify = data;
> +       struct bt_vcp *vcp = notify->vcp;
> +
> +       if (queue_remove_if(vcp->notify, NULL, notify))
> +               free(notify);
> +}
> +
> +static unsigned int vcp_register_notify(struct bt_vcp *vcp,
> +                                       uint16_t value_handle,
> +                                       vcp_notify_t func,
> +                                       void *user_data)
> +{
> +       struct bt_vcp_notify *notify;
> +
> +       notify = new0(struct bt_vcp_notify, 1);
> +       notify->vcp = vcp;
> +       notify->func = func;
> +       notify->user_data = user_data;
> +
> +       notify->id = bt_gatt_client_register_notify(vcp->client,
> +                                               value_handle, vcp_register,
> +                                               vcp_notify, notify,
> +                                               vcp_notify_destroy);
> +       if (!notify->id) {
> +               DBG(vcp, "Unable to register for notifications");
> +               free(notify);
> +               return 0;
> +       }
> +
> +       queue_push_tail(vcp->notify, notify);
> +
> +       return notify->id;
> +}
> +
>  static void foreach_vcs_char(struct gatt_db_attribute *attr, void *user_data)
>  {
>         struct bt_vcp *vcp = user_data;
> @@ -1006,7 +1075,6 @@ static void foreach_vcs_char(struct gatt_db_attribute *attr, void *user_data)
>         bt_uuid_t uuid, uuid_vstate, uuid_cp, uuid_vflag;
>         struct bt_vcs *vcs;
>
> -       DBG("");
>         if (!gatt_db_attribute_get_char_data(attr, NULL, &value_handle,
>                                                 NULL, NULL, &uuid))
>                 return;
> @@ -1016,7 +1084,7 @@ static void foreach_vcs_char(struct gatt_db_attribute *attr, void *user_data)
>         bt_uuid16_create(&uuid_vflag, VOL_FLAG_CHRC_UUID);
>
>         if (!bt_uuid_cmp(&uuid, &uuid_vstate)) {
> -               DBG("VCS Volume state found: handle 0x%04x", value_handle);
> +               DBG(vcp, "VCS Vol state found: handle 0x%04x", value_handle);
>
>                 vcs = vcp_get_vcs(vcp);
>                 if (!vcs || vcs->vs)
> @@ -1025,16 +1093,15 @@ static void foreach_vcs_char(struct gatt_db_attribute *attr, void *user_data)
>                 vcs->vs = attr;
>
>                 vcp_read_value(vcp, value_handle, read_vol_state, vcp);
> -               vcp->vstate_id = bt_gatt_client_register_notify(vcp->client,
> -                                               value_handle,
> -                                               vcp_vstate_register,
> -                                               vcp_vstate_notify, vcp, NULL);
> +
> +               vcp->vstate_id = vcp_register_notify(vcp, value_handle,
> +                                                    vcp_vstate_notify, NULL);
>
>                 return;
>         }
>
>         if (!bt_uuid_cmp(&uuid, &uuid_cp)) {
> -               DBG("VCS Volume CP found: handle 0x%04x", value_handle);
> +               DBG(vcp, "VCS Volume CP found: handle 0x%04x", value_handle);
>
>                 vcs = vcp_get_vcs(vcp);
>                 if (!vcs || vcs->vol_cp)
> @@ -1046,7 +1113,7 @@ static void foreach_vcs_char(struct gatt_db_attribute *attr, void *user_data)
>         }
>
>         if (!bt_uuid_cmp(&uuid, &uuid_vflag)) {
> -               DBG("VCS Vol Flaf found: handle 0x%04x", value_handle);
> +               DBG(vcp, "VCS Vol Flag found: handle 0x%04x", value_handle);
>
>                 vcs = vcp_get_vcs(vcp);
>                 if (!vcs || vcs->vf)
> @@ -1055,12 +1122,10 @@ static void foreach_vcs_char(struct gatt_db_attribute *attr, void *user_data)
>                 vcs->vf = attr;
>
>                 vcp_read_value(vcp, value_handle, read_vol_flag, vcp);
> -               vcp->vflag_id = bt_gatt_client_register_notify(vcp->client,
> -                                               value_handle,
> -                                               vcp_vflag_register,
> -                                               vcp_vflag_notify, vcp, NULL);
> -       }
> +               vcp->vflag_id = vcp_register_notify(vcp, value_handle,
> +                                                   vcp_vflag_notify, NULL);
>
> +       }
>  }
>
>  static void foreach_vcs_service(struct gatt_db_attribute *attr,
> @@ -1069,7 +1134,6 @@ static void foreach_vcs_service(struct gatt_db_attribute *attr,
>         struct bt_vcp *vcp = user_data;
>         struct bt_vcs *vcs = vcp_get_vcs(vcp);
>
> -       DBG("");
>         vcs->service = attr;
>
>         gatt_db_service_set_claimed(attr, true);
> diff --git a/src/shared/vcp.h b/src/shared/vcp.h
> index 1a999c7776fd..26db5732d19b 100644
> --- a/src/shared/vcp.h
> +++ b/src/shared/vcp.h
> @@ -33,6 +33,8 @@
>
>  struct bt_vcp;
>
> +typedef void (*bt_vcp_destroy_func_t)(void *user_data);
> +typedef void (*bt_vcp_debug_func_t)(const char *str, void *user_data);
>  typedef void (*bt_vcp_func_t)(struct bt_vcp *vcp, void *user_data);
>
>  struct bt_vcp *bt_vcp_ref(struct bt_vcp *vcp);
> @@ -43,6 +45,9 @@ void bt_vcp_add_db(struct gatt_db *db);
>  bool bt_vcp_attach(struct bt_vcp *vcp, struct bt_gatt_client *client);
>  void bt_vcp_detach(struct bt_vcp *vcp);
>
> +bool bt_vcp_set_debug(struct bt_vcp *vcp, bt_vcp_debug_func_t cb,
> +                       void *user_data, bt_vcp_destroy_func_t destroy);
> +
>  struct bt_att *bt_vcp_get_att(struct bt_vcp *vcp);
>
>  bool bt_vcp_set_user_data(struct bt_vcp *vcp, void *user_data);
> --
> 2.25.1
>


-- 
Luiz Augusto von Dentz
