Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEC80134CCD
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Jan 2020 21:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgAHUIN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 Jan 2020 15:08:13 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46311 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgAHUIM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 Jan 2020 15:08:12 -0500
Received: by mail-lj1-f195.google.com with SMTP id m26so4606325ljc.13
        for <linux-bluetooth@vger.kernel.org>; Wed, 08 Jan 2020 12:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wWXvFrbIR7hYFUpksJNVg/DOVORgW1Hhy2Tuj/Pi2uk=;
        b=dWtsSrcmfAhO8+uBQ2f6OslLZYnsv6IrNhY1IJv83rBiorbKgl8vJRY1eqbD/+CqYf
         tHYb5ZFoB5b/u+7ebdWMO1RKU1/Gu7GL7c8tvn70MxfnolWndu4iDJJ2/fXk4RRrXxV2
         /A67xYzNgBi7n+w2yBMj1AxcloFnstALOYUtbF0nHY4JhEeAKxdF2D66x3dKXz2tatWJ
         pXaWSApNx0PxG67tDcIONjamKHMoxJbl1HP3Ig1eBdAvt2Fa9kLxY3C36JhfY0D9dCs3
         ppKqu3V3qoThaL1IGa7W49L7rztGk8oq8TLMZ0p2ap2YZtEhPwvKNB14yzJr7vk4i6kN
         lk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wWXvFrbIR7hYFUpksJNVg/DOVORgW1Hhy2Tuj/Pi2uk=;
        b=nnD1Q5Xi5qySuEbgXfPdNERMKV5L7gwSK8oq3QIQssob/+jmqADF70HbzL4DCw98Fx
         V5hlYTeiZeEVivCRf376J2Ceo3nZhNu2ptEvR1t6EglabyXR70d3b65bMmD3jnscnvPq
         g+2nFqi9nBFP5+xtgwxf4HOCM+xo/VpYnpY+I+3dCsTaGbTRAai2ptIruKhdlHVZP9d0
         ovNOMYSHCOTEXr0Kff4qrLBD6GnzQmogPUuJOZrnGxFRSNXcftGOIDnKcdiG8jdZow0W
         e4Yd1wS+d1YoX9bJb/ANxzFgi7LAv9sjQEaLorfG0T2XZMoTx6l8LuUZkhyc3amgWvEK
         sS/A==
X-Gm-Message-State: APjAAAVsgNHURqt3l2UyzFBxCt8es13KoVJ/yKg+9IfVeuph9oyYPg/O
        ZGNEzxCkC7mtXPcVvdpae0Z9SNRboCUL8iTC5L0Neg==
X-Google-Smtp-Source: APXvYqwQcpvM8iGeR/st7hr2pRUAuhap3yyILZrz1F8S9rTS0R58p1iOL1HOdARTXCYHNBWBFQOI0dBkpxtNmgNxRPA=
X-Received: by 2002:a2e:9050:: with SMTP id n16mr4086096ljg.49.1578514089826;
 Wed, 08 Jan 2020 12:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20200107012820.158721-1-alainm@chromium.org> <20200107012820.158721-3-alainm@chromium.org>
 <CABBYNZK8SaQsX70w2FFd12=XRmV09Lk+KqvU+ryc-STfyOzhLg@mail.gmail.com>
 <CALWDO_UQJcnA0h_Na6AidW9JvWEMWZppZap2-8BO3QrEB1pPmQ@mail.gmail.com> <CABBYNZKrJ5=pLmvdhOH33BxtXc3=om+vdWOVtz44eZ2AR7sHoQ@mail.gmail.com>
In-Reply-To: <CABBYNZKrJ5=pLmvdhOH33BxtXc3=om+vdWOVtz44eZ2AR7sHoQ@mail.gmail.com>
From:   Alain Michaud <alainmichaud@google.com>
Date:   Wed, 8 Jan 2020 15:07:57 -0500
Message-ID: <CALWDO_VTNag8Fic=JWmiyzRL4mK05GJ0WNAR3GDs-A8AMiE99A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] Loading keys that should be blocked by the kernel.
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Alain Michaud <alainm@chromium.org>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,


On Wed, Jan 8, 2020 at 3:00 PM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Alain,
>
> On Wed, Jan 8, 2020 at 7:04 AM Alain Michaud <alainmichaud@google.com> wrote:
> >
> > Hi Luiz,
> >
> >
> > On Tue, Jan 7, 2020 at 6:22 PM Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> > >
> > > Hi Alain,
> > >
> > > On Mon, Jan 6, 2020 at 5:31 PM Alain Michaud <alainm@chromium.org> wrote:
> > > >
> > > > This change accomplishes 2 things:
> > > >  1. Drop device security data from previously paired devices
> > > >  using blocked keys.
> > > >  2. Send the list of known bad keys that should be blocked to the kernel
> > > >  if supported.
> > > >
> > > > In particular keys from the Google Titan Security key are being
> > > > blocked.
> > > >
> > > > For additional background information, please see
> > > > https://security.googleblog.com/2019/05/titan-keys-update.html
> > > > ---
> > > >
> > > >  src/adapter.c | 140 +++++++++++++++++++++++++++++++++++++++++++++++---
> > > >  1 file changed, 134 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/src/adapter.c b/src/adapter.c
> > > > index cef25616f..9c41ebe86 100644
> > > > --- a/src/adapter.c
> > > > +++ b/src/adapter.c
> > > > @@ -99,10 +99,27 @@
> > > >  #define DISTANCE_VAL_INVALID   0x7FFF
> > > >  #define PATHLOSS_MAX           137
> > > >
> > > > +/*
> > > > + * These are known security keys that have been compromised.
> > > > + * If this grows or there are needs to be platform specific, it is
> > > > + * conceivable that these could be read from a config file.
> > > > + */
> > > > +static const struct mgmt_blocked_key_info blocked_keys[] = {
> > > > +       /* Google Titan Security Keys */
> > > > +       { HCI_BLOCKED_KEY_TYPE_LTK,
> > > > +               {0xbf, 0x01, 0xfb, 0x9d, 0x4e, 0xf3, 0xbc, 0x36,
> > > > +                0xd8, 0x74, 0xf5, 0x39, 0x41, 0x38, 0x68, 0x4c}},
> > > > +       { HCI_BLOCKED_KEY_TYPE_IRK,
> > > > +               {0xa5, 0x99, 0xba, 0xe4, 0xe1, 0x7c, 0xa6, 0x18,
> > > > +                0x22, 0x8e, 0x07, 0x56, 0xb4, 0xe8, 0x5f, 0x01}},
> > > > +};
> > > > +
> > > >  static DBusConnection *dbus_conn = NULL;
> > > >
> > > >  static bool kernel_conn_control = false;
> > > >
> > > > +static bool kernel_blocked_keys_supported = false;
> > > > +
> > > >  static GList *adapter_list = NULL;
> > > >  static unsigned int adapter_remaining = 0;
> > > >  static bool powering_down = false;
> > > > @@ -124,6 +141,7 @@ struct link_key_info {
> > > >         unsigned char key[16];
> > > >         uint8_t type;
> > > >         uint8_t pin_len;
> > > > +       bool is_blocked;
> > > >  };
> > > >
> > > >  struct smp_ltk_info {
> > > > @@ -135,12 +153,14 @@ struct smp_ltk_info {
> > > >         uint16_t ediv;
> > > >         uint64_t rand;
> > > >         uint8_t val[16];
> > > > +       bool is_blocked;
> > > >  };
> > > >
> > > >  struct irk_info {
> > > >         bdaddr_t bdaddr;
> > > >         uint8_t bdaddr_type;
> > > >         uint8_t val[16];
> > > > +       bool is_blocked;
> > > >  };
> > > >
> > > >  struct conn_param {
> > > > @@ -3439,6 +3459,20 @@ static int str2buf(const char *str, uint8_t *buf, size_t blen)
> > > >         return 0;
> > > >  }
> > > >
> > > > +static bool is_blocked_key(uint8_t key_type, uint8_t *key_value)
> > > > +{
> > > > +       uint32_t i = 0;
> > > > +
> > > > +       for (i = 0; i < ARRAY_SIZE(blocked_keys); ++i) {
> > > > +               if (key_type == blocked_keys[i].type &&
> > > > +                               !memcmp(blocked_keys[i].val, key_value,
> > > > +                                               sizeof(blocked_keys[i].val)))
> > > > +                       return true;
> > > > +       }
> > > > +
> > > > +       return false;
> > > > +}
> > > > +
> > > >  static struct link_key_info *get_key_info(GKeyFile *key_file, const char *peer)
> > > >  {
> > > >         struct link_key_info *info = NULL;
> > > > @@ -3461,6 +3495,9 @@ static struct link_key_info *get_key_info(GKeyFile *key_file, const char *peer)
> > > >         info->pin_len = g_key_file_get_integer(key_file, "LinkKey", "PINLength",
> > > >                                                 NULL);
> > > >
> > > > +       info->is_blocked = is_blocked_key(HCI_BLOCKED_KEY_TYPE_LINKKEY,
> > > > +                                                               info->key);
> > > > +
> > > >  failed:
> > > >         g_free(str);
> > > >
> > > > @@ -3534,6 +3571,9 @@ static struct smp_ltk_info *get_ltk(GKeyFile *key_file, const char *peer,
> > > >         else
> > > >                 ltk->master = master;
> > > >
> > > > +       ltk->is_blocked = is_blocked_key(HCI_BLOCKED_KEY_TYPE_LTK,
> > > > +                                                               ltk->val);
> > > > +
> > > >  failed:
> > > >         g_free(key);
> > > >         g_free(rand);
> > > > @@ -3584,6 +3624,9 @@ static struct irk_info *get_irk_info(GKeyFile *key_file, const char *peer,
> > > >         else
> > > >                 str2buf(&str[0], irk->val, sizeof(irk->val));
> > > >
> > > > +       irk->is_blocked = is_blocked_key(HCI_BLOCKED_KEY_TYPE_LINKKEY,
> > > > +                                                               irk->val);
> > > > +
> > > >  failed:
> > > >         g_free(str);
> > > >
> > > > @@ -4142,21 +4185,55 @@ static void load_devices(struct btd_adapter *adapter)
> > > >                 g_key_file_load_from_file(key_file, filename, 0, NULL);
> > > >
> > > >                 key_info = get_key_info(key_file, entry->d_name);
> > > > -               if (key_info)
> > > > -                       keys = g_slist_append(keys, key_info);
> > > >
> > > >                 bdaddr_type = get_le_addr_type(key_file);
> > > >
> > > >                 ltk_info = get_ltk_info(key_file, entry->d_name, bdaddr_type);
> > > > -               if (ltk_info)
> > > > -                       ltks = g_slist_append(ltks, ltk_info);
> > > >
> > > >                 slave_ltk_info = get_slave_ltk_info(key_file, entry->d_name,
> > > >                                                                 bdaddr_type);
> > > > +
> > > > +               irk_info = get_irk_info(key_file, entry->d_name, bdaddr_type);
> > > > +
> > > > +               // If any key for the device is blocked, we discard all.
> > > > +               if ((key_info && key_info->is_blocked) ||
> > > > +                               (ltk_info && ltk_info->is_blocked) ||
> > > > +                               (slave_ltk_info &&
> > > > +                                       slave_ltk_info->is_blocked) ||
> > > > +                               (irk_info && irk_info->is_blocked)) {
> > >
> > > Perhaps it would be more efficient if we don't add is_blocked as a
> > > member of these keys and instead pass bool variable to get_*_info
> > > which just set it in case the key is blocked, that way if is_blocked
> > > is set for get_key_info you don't have to free anything. Also it might
> > > be a good idea to move the handling of loading the keys to another
> > > function i.e. load_keys to make it simpler to bail out, etc. Have you
> > > though about the possibility of just using a the device block API when
> > > you detect it is using compromised keys? That way the application can
> > > detect the device is in fact blocked and can either remove the device,
> > > which would clean up the storage as well (see my comments bellow), or
> > > unblock it in order to continue using the device.
> >
> > My thoughts was to keep the contract simple.  if the return is not
> > null then a key exists, it can be blocked or not blocked.  It feels a
> > bit weird to have a contract return null but a parameter tells you
> > that it's been blocked.  The extra allocation/free doesn't seem like a
> > lot of overhead for what is expected to be a rare case (blocked keys).
>
> Fair enough, I suggested that because the is_block logic seems to
> apply to all of the keys not just the key that was compromised, anyway
> Im probably getting a little too paranoid regarding overhead but I
> don't think we had loose anything by avoiding the extra
> allocation/free
Correct.  The idea is that if any of the keys from the device is
blocked, the device
is simply ignored.

>
> > >
> > > > +                       if (key_info) {
> > > > +                               g_free(key_info);
> > > > +                               key_info = NULL;
> > > > +                       }
> > > > +
> > > > +                       if (ltk_info) {
> > > > +                               g_free(ltk_info);
> > > > +                               ltk_info = NULL;
> > > > +                       }
> > > > +
> > > > +                       if (slave_ltk_info) {
> > > > +                               g_free(slave_ltk_info);
> > > > +                               slave_ltk_info = NULL;
> > > > +                       }
> > > > +
> > > > +                       if (irk_info) {
> > > > +                               g_free(irk_info);
> > > > +                               irk_info = NULL;
> > > > +                       }
> > > > +
> > > > +                       goto free;
> > > > +               }
> > > > +
> > > > +               if (key_info)
> > > > +                       keys = g_slist_append(keys, key_info);
> > > > +
> > > > +               if (ltk_info)
> > > > +                       ltks = g_slist_append(ltks, ltk_info);
> > > > +
> > >
> > > Perhaps I missing something but don't we need to clear these keys form
> > > the storage once we figure they are blocked or there is any reason to
> > > leave them in there so we can unblock?
> > Since these are expected to be rare cases, I didn't go through the
> > extent to clear them from storage.  Having them in storage also can
> > help with diagnosability.
>
> That is an interesting point, but we don't allow new pairing with
> compromised keys with these changes or do we? If we want to allow
> diagnosing in all cases we could actually store the blocked flag into
> the storage so something like a diagnostic tool can fetch the
> information directly.
With these changes, the device is simply dropped from the list
entirely.  The user is free to attempt to pair it again.  If the
device is fixed, pairing will work and the key will be overwritten, if
the device is still broken, the pairing will fail and the user will
see the error.  Given that for now, the keys are hardcoded and a
relatively small list, it feels like overkill to store an additional
flag for it.  This may be something we'd want to do if the list of
blocked keys grows beyond something that is easily manageable.  If
that is the case, I also think we should read the blocked keys from a
configuration file rather than hardcoded in the code as it currently
is.

>
> > >
> > > >                 if (slave_ltk_info)
> > > >                         ltks = g_slist_append(ltks, slave_ltk_info);
> > > >
> > > > -               irk_info = get_irk_info(key_file, entry->d_name, bdaddr_type);
> > > >                 if (irk_info)
> > > >                         irks = g_slist_append(irks, irk_info);
> > > >
> > > > @@ -8568,6 +8645,42 @@ static bool set_static_addr(struct btd_adapter *adapter)
> > > >         return false;
> > > >  }
> > > >
> > > > +static void set_blocked_keys_complete(uint8_t status, uint16_t length,
> > > > +                                       const void *param, void *user_data)
> > > > +{
> > > > +       struct btd_adapter *adapter = user_data;
> > > > +
> > > > +       if (status != MGMT_STATUS_SUCCESS) {
> > > > +               btd_error(adapter->dev_id,
> > > > +                               "Failed to set blocked keys: %s (0x%02x)",
> > > > +                               mgmt_errstr(status), status);
> > > > +               return;
> > > > +       }
> > > > +
> > > > +       DBG("Successfully set blocked keys for index %u", adapter->dev_id);
> > > > +}
> > > > +
> > > > +static bool set_blocked_keys(struct btd_adapter *adapter)
> > > > +{
> > > > +       uint8_t buffer[sizeof(struct mgmt_cp_set_blocked_keys) +
> > > > +                                       sizeof(blocked_keys)] = { 0 };
> > > > +       struct mgmt_cp_set_blocked_keys *cp =
> > > > +                               (struct mgmt_cp_set_blocked_keys *)buffer;
> > > > +       int i;
> > > > +
> > > > +       cp->key_count = ARRAY_SIZE(blocked_keys);
> > > > +       for (i = 0; i < cp->key_count; ++i) {
> > > > +               cp->keys[i].type = blocked_keys[i].type;
> > > > +               memcpy(cp->keys[i].val, blocked_keys[i].val,
> > > > +                                               sizeof(cp->keys[i].val));
> > > > +       }
> > > > +
> > > > +       return mgmt_send(mgmt_master, MGMT_OP_SET_BLOCKED_KEYS, adapter->dev_id,
> > > > +                                               sizeof(buffer), buffer,
> > > > +                                               set_blocked_keys_complete,
> > > > +                                               adapter, NULL);
> > > > +}
> > > > +
> > > >  static void read_info_complete(uint8_t status, uint16_t length,
> > > >                                         const void *param, void *user_data)
> > > >  {
> > > > @@ -8795,6 +8908,13 @@ static void read_info_complete(uint8_t status, uint16_t length,
> > > >
> > > >         set_name(adapter, btd_adapter_get_name(adapter));
> > > >
> > > > +       if (kernel_blocked_keys_supported && !set_blocked_keys(adapter)) {
> > > > +               btd_error(adapter->dev_id,
> > > > +                               "Failed to set blocked keys for index %u",
> > > > +                               adapter->dev_id);
> > > > +               goto failed;
> > > > +       }
> > > > +
> > > >         if (main_opts.pairable &&
> > > >                         !(adapter->current_settings & MGMT_SETTING_BONDABLE))
> > > >                 set_mode(adapter, MGMT_OP_SET_BONDABLE, 0x01);
> > > > @@ -8972,9 +9092,17 @@ static void read_commands_complete(uint8_t status, uint16_t length,
> > > >         for (i = 0; i < num_commands; i++) {
> > > >                 uint16_t op = get_le16(rp->opcodes + i);
> > > >
> > > > -               if (op == MGMT_OP_ADD_DEVICE) {
> > > > +               switch (op) {
> > > > +               case MGMT_OP_ADD_DEVICE:
> > > >                         DBG("enabling kernel-side connection control");
> > > >                         kernel_conn_control = true;
> > > > +                       break;
> > > > +               case MGMT_OP_SET_BLOCKED_KEYS:
> > > > +                       DBG("kernel supports the set_blocked_keys op");
> > > > +                       kernel_blocked_keys_supported = true;
> > > > +                       break;
> > > > +               default:
> > > > +                       break;
> > > >                 }
> > > >         }
> > > >  }
> > > > --
> > > > 2.24.1.735.g03f4e72817-goog
> > > >
> > >
> > >
> > > --
> > > Luiz Augusto von Dentz
>
>
>
> --
> Luiz Augusto von Dentz
