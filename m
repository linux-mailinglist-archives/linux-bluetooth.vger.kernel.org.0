Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E61CD11BABB
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Dec 2019 18:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729616AbfLKRzq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Dec 2019 12:55:46 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37869 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbfLKRzp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Dec 2019 12:55:45 -0500
Received: by mail-ot1-f66.google.com with SMTP id k14so650162otn.4
        for <linux-bluetooth@vger.kernel.org>; Wed, 11 Dec 2019 09:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lNLC+HRGMJjty9o9N8T3h0d4ZDDPJYxV/zXw/in/L1s=;
        b=TKiG/PWfE9HtUAsWLWKQ6p2XH82428fP0rJF/q99LAAj4Ssb+g1Lzxi+KwRN8RLY/X
         5hy5vOoDd1/02pBgK40U17mnDyQXFThwzXDgkpvzp4hc22clgz9x/76IapWLp1xcyjqN
         Ag5uDtg5wWihPH8U0CAJHLYaR/vETCUKdRFXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lNLC+HRGMJjty9o9N8T3h0d4ZDDPJYxV/zXw/in/L1s=;
        b=IGA0xCE2KHT1MN3Jpwa9K8aPv6moNlEcmEiWZaSRaZVBMSZ9UmnjQaqW5Lrb5148a5
         pIAnb54VAc/xARzGx7aHb/rfG078aV5t5KPIV+38BdeUAqIIuYxnvjCyLYrIYBh7vW1e
         pRwdrRneUTFJdUBhx7L7P1mwEz9LLjCKx5zGbcehou5rsO76LwlT3iJYYl69k+44IVsP
         d2G595/IwgrxsxdCZ0N3La4YzRDAo01iUYlE+CkzppRXR22+/JT58uTbPSBaVhj5i1HL
         iOfuc6xZXIi6b6ZlXNZemTn880ny9N/wh8OWQPoppdKshJ4b8yChVMY8lyaWZv4OlKH4
         dlqA==
X-Gm-Message-State: APjAAAXFypNOrCAclXPvv9qxh9gFrK1uhIrkzUJThve+cb17I4DcoI8O
        7odCCDaIV6QbVPuqFi/0qr/z+tCIAnVLBeuELNpLMA==
X-Google-Smtp-Source: APXvYqxal7XY/bFdVJ0o2l8uG9nXKq0a1b/9kTp+muu0VQiDWdLah2ta5Dl9VvXQ/2ElZtDq62//PngUC1cz/leGJ6A=
X-Received: by 2002:a05:6830:236a:: with SMTP id r10mr2984743oth.329.1576086944182;
 Wed, 11 Dec 2019 09:55:44 -0800 (PST)
MIME-Version: 1.0
References: <20191211154556.120555-1-alainm@chromium.org> <CAOxioNngriC+_ZbGm5-OwV-wp80+ZHv_kR2dcp9XbsgVuXunJg@mail.gmail.com>
In-Reply-To: <CAOxioNngriC+_ZbGm5-OwV-wp80+ZHv_kR2dcp9XbsgVuXunJg@mail.gmail.com>
From:   Sonny Sasaka <sonnysasaka@chromium.org>
Date:   Wed, 11 Dec 2019 09:55:32 -0800
Message-ID: <CAOxioNkoncJ+f7kYzD0uaisnfg6bV30M+JbhP9+3YLv_HDqmrA@mail.gmail.com>
Subject: Re: [PATCH v4] Implementation of MGMT_OP_SET_BLOCKED_KEYS.
To:     Alain Michaud <alainm@chromium.org>
Cc:     BlueZ <linux-bluetooth@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, Dec 11, 2019 at 9:48 AM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
>
> Hi Alain, Marcel,
>
> I tried to verify this patch together with its corresponding
> user-space (bluetoothd) change. I found two major attack vectors of
> the security issue (CVE-2019-2102) are not covered:
>
> Attack scenario 1:
> a. An LE device (say device X) is paired with BlueZ.
> b. It becomes known that device X uses a hardcoded LTK, therefore X's
> LTK must be blocked.
> c. Add X's LTK to bluetoothd's blocked LTK list. Rebuild and restart bluetoothd.
> d. An attacker tries to undermine the situation by having a malicious
> device (say device M) pretending to be X, by using X's address and
> also knowing the X's hardcoded LTK.
> e. When X is not connected to BlueZ and device M is around and
> advertising, BlueZ will automatically connect to Y (due to BlueZ's
[sonny] sorry for typo, I meant "M" not "Y"
> auto-reconnection to paired devices)
> f. This connection triggers BlueZ to initiate pairing to device M. The
> user is presented with a UI dialog (planned as a separate fix) such as
> "Alain's Logitech Mouse wants to pair, yes or no". The user, as a
> non-Bluetooth engineer, is likely to accept the pairing.
> g. Malicious device M has succeeded in becoming a trusted device with
> BlueZ, and now is able to do the bad things it wants such as HID
> injection (pretending to be a mouse/keyboard injecting inputs that
> could compromise the privacy and security of the BlueZ device).
>
> Attack scenario 2:
> a. It becomes known that product X uses a hardcoded LTK, therefore
> this bad LTK must be blocked.
> b. Add X's LTK to bluetoothd. Rebuild and restart bluetoothd.
> c. A user uses product X and have BlueZ pair with it.
> d. Since product X uses its hardcoded LTK, this LTK is rejected by
> BlueZ and BlueZ lets X know by sending SMP_INVALID_PARAMS. Device X
> may just ignore the error and not do re-pairing.
> e. Therefore BlueZ is in a state where it records device X's info but
> not having LTK. Turns out that BlueZ still considers this device to
> need auto-reconnection even without "paired" status nor LTK.
> f. An attacker tries to undermine the situation by having a malicious
> device (say device M) pretending to be X, by using 's address and also
> knowing the X's hardcoded LTK.
> g. When X is not connected to BlueZ and device M is around and
> advertising, BlueZ will automatically connect to M (due to BlueZ's
> auto-reconnection to paired devices)
> h. After BlueZ is auto-connected to M, this doesn't trigger pairing at
> BlueZ side because device X is recorded as "not paired". Therefore
> device M can right away pretend to do the bad thing, like
> mouse/keyboard HID injection, without needing pairing and therefore
> without needing any user interaction.
>
> Since the patches haven't addressed the attack vectors caused by
> CVE-2019-2102, the patches still need to be revised to address those.
> I don't have any particular recommendation how to, but I can help with
> verifying.
>
> I tested those cases with Ubuntu + Alain's patches.
>
> Also, when trying to verify the patches I realized that I needed to
> correct the MGMT_OP_SET_BLOCKED_KEYS_SIZE and mgmt_cp_set_blocked_keys
> array. And we likely want to flag the MGMT handler with
> HCI_MGMT_VAR_LEN.
>
>
> On Wed, Dec 11, 2019 at 7:46 AM Alain Michaud <alainm@chromium.org> wrote:
> >
> > MGMT command is added to receive the list of blocked keys from
> > user-space.
> >
> > The list is used to:
> > 1) Block keys from being distributed by the device during
> >    the ke distribution phase of SMP.
> > 2) Filter out any keys that were previously saved so
> >    they are no longer used.
> >
> > Signed-off-by: Alain Michaud <alainm@chromium.org>
> > ---
> >
> >  include/net/bluetooth/hci_core.h | 10 ++++
> >  include/net/bluetooth/mgmt.h     | 17 +++++++
> >  net/bluetooth/hci_core.c         | 85 +++++++++++++++++++++++++++++---
> >  net/bluetooth/hci_debugfs.c      | 17 +++++++
> >  net/bluetooth/mgmt.c             | 51 +++++++++++++++++++
> >  net/bluetooth/smp.c              | 18 +++++++
> >  6 files changed, 190 insertions(+), 8 deletions(-)
> >
> > diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
> > index b689aceb636b..9020fa3c4d30 100644
> > --- a/include/net/bluetooth/hci_core.h
> > +++ b/include/net/bluetooth/hci_core.h
> > @@ -118,6 +118,13 @@ struct bt_uuid {
> >         u8 svc_hint;
> >  };
> >
> > +struct blocked_key {
> > +       struct list_head list;
> > +       struct rcu_head rcu;
> > +       u8 type;
> > +       u8 val[16];
> > +};
> > +
> >  struct smp_csrk {
> >         bdaddr_t bdaddr;
> >         u8 bdaddr_type;
> > @@ -397,6 +404,7 @@ struct hci_dev {
> >         struct list_head        le_conn_params;
> >         struct list_head        pend_le_conns;
> >         struct list_head        pend_le_reports;
> > +       struct list_head        blocked_keys;
> >
> >         struct hci_dev_stats    stat;
> >
> > @@ -1121,6 +1129,8 @@ struct smp_irk *hci_find_irk_by_addr(struct hci_dev *hdev, bdaddr_t *bdaddr,
> >  struct smp_irk *hci_add_irk(struct hci_dev *hdev, bdaddr_t *bdaddr,
> >                             u8 addr_type, u8 val[16], bdaddr_t *rpa);
> >  void hci_remove_irk(struct hci_dev *hdev, bdaddr_t *bdaddr, u8 addr_type);
> > +bool hci_is_blocked_key(struct hci_dev *hdev, u8 type, u8 val[16]);
> > +void hci_blocked_keys_clear(struct hci_dev *hdev);
> >  void hci_smp_irks_clear(struct hci_dev *hdev);
> >
> >  bool hci_bdaddr_is_paired(struct hci_dev *hdev, bdaddr_t *bdaddr, u8 type);
> > diff --git a/include/net/bluetooth/mgmt.h b/include/net/bluetooth/mgmt.h
> > index 9cee7ddc6741..c9b1d39d6d6c 100644
> > --- a/include/net/bluetooth/mgmt.h
> > +++ b/include/net/bluetooth/mgmt.h
> > @@ -654,6 +654,23 @@ struct mgmt_cp_set_phy_confguration {
> >  } __packed;
> >  #define MGMT_SET_PHY_CONFIGURATION_SIZE        4
> >
> > +#define MGMT_OP_SET_BLOCKED_KEYS       0x0046
> > +
> > +#define HCI_BLOCKED_KEY_TYPE_LINKKEY   0x00
> > +#define HCI_BLOCKED_KEY_TYPE_LTK               0x01
> > +#define HCI_BLOCKED_KEY_TYPE_IRK               0x02
> > +
> > +struct mgmt_blocked_key_info {
> > +       __u8 type;
> > +       __u8 val[16];
> > +} __packed;
> > +
> > +struct mgmt_cp_set_blocked_keys {
> > +       __le16 key_count;
> > +       struct mgmt_blocked_key_info keys[0];
> > +} __packed;
> > +#define MGMT_OP_SET_BLOCKED_KEYS_SIZE 0
> > +
> >  #define MGMT_EV_CMD_COMPLETE           0x0001
> >  struct mgmt_ev_cmd_complete {
> >         __le16  opcode;
> > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > index 9e19d5a3aac8..f0298db26dc3 100644
> > --- a/net/bluetooth/hci_core.c
> > +++ b/net/bluetooth/hci_core.c
> > @@ -2311,6 +2311,33 @@ void hci_smp_irks_clear(struct hci_dev *hdev)
> >         }
> >  }
> >
> > +void hci_blocked_keys_clear(struct hci_dev *hdev)
> > +{
> > +       struct blocked_key *b;
> > +
> > +       list_for_each_entry_rcu(b, &hdev->blocked_keys, list) {
> > +               list_del_rcu(&b->list);
> > +               kfree_rcu(b, rcu);
> > +       }
> > +}
> > +
> > +bool hci_is_blocked_key(struct hci_dev *hdev, u8 type, u8 val[16])
> > +{
> > +       bool blocked = false;
> > +       struct blocked_key *b;
> > +
> > +       rcu_read_lock();
> > +       list_for_each_entry(b, &hdev->blocked_keys, list) {
> > +               if (b->type == type && !memcmp(b->val, val, sizeof(b->val))) {
> > +                       blocked = true;
> > +                       break;
> > +               }
> > +       }
> > +
> > +       rcu_read_unlock();
> > +       return blocked;
> > +}
> > +
> >  struct link_key *hci_find_link_key(struct hci_dev *hdev, bdaddr_t *bdaddr)
> >  {
> >         struct link_key *k;
> > @@ -2319,6 +2346,16 @@ struct link_key *hci_find_link_key(struct hci_dev *hdev, bdaddr_t *bdaddr)
> >         list_for_each_entry_rcu(k, &hdev->link_keys, list) {
> >                 if (bacmp(bdaddr, &k->bdaddr) == 0) {
> >                         rcu_read_unlock();
> > +
> > +                       if (hci_is_blocked_key(hdev,
> > +                                              HCI_BLOCKED_KEY_TYPE_LINKKEY,
> > +                                              k->val)) {
> > +                               bt_dev_warn_ratelimited(hdev,
> > +                                                       "Link key blocked for %pMR",
> > +                                                       &k->bdaddr);
> > +                               return NULL;
> > +                       }
> > +
> >                         return k;
> >                 }
> >         }
> > @@ -2387,6 +2424,15 @@ struct smp_ltk *hci_find_ltk(struct hci_dev *hdev, bdaddr_t *bdaddr,
> >
> >                 if (smp_ltk_is_sc(k) || ltk_role(k->type) == role) {
> >                         rcu_read_unlock();
> > +
> > +                       if (hci_is_blocked_key(hdev, HCI_BLOCKED_KEY_TYPE_LTK,
> > +                                              k->val)) {
> > +                               bt_dev_warn_ratelimited(hdev,
> > +                                                       "LTK blocked for %pMR",
> > +                                                       &k->bdaddr);
> > +                               return NULL;
> > +                       }
> > +
> >                         return k;
> >                 }
> >         }
> > @@ -2397,31 +2443,42 @@ struct smp_ltk *hci_find_ltk(struct hci_dev *hdev, bdaddr_t *bdaddr,
> >
> >  struct smp_irk *hci_find_irk_by_rpa(struct hci_dev *hdev, bdaddr_t *rpa)
> >  {
> > +       struct smp_irk *irk_to_return = NULL;
> >         struct smp_irk *irk;
> >
> >         rcu_read_lock();
> >         list_for_each_entry_rcu(irk, &hdev->identity_resolving_keys, list) {
> >                 if (!bacmp(&irk->rpa, rpa)) {
> > -                       rcu_read_unlock();
> > -                       return irk;
> > +                       irk_to_return = irk;
> > +                       goto done;
> >                 }
> >         }
> >
> >         list_for_each_entry_rcu(irk, &hdev->identity_resolving_keys, list) {
> >                 if (smp_irk_matches(hdev, irk->val, rpa)) {
> >                         bacpy(&irk->rpa, rpa);
> > -                       rcu_read_unlock();
> > -                       return irk;
> > +                       irk_to_return = irk;
> > +                       goto done;
> >                 }
> >         }
> > +
> > +done:
> > +       if (irk_to_return && hci_is_blocked_key(hdev, HCI_BLOCKED_KEY_TYPE_IRK,
> > +                                               irk_to_return->val)) {
> > +               bt_dev_warn_ratelimited(hdev, "Identity key blocked for %pMR",
> > +                                       &irk_to_return->bdaddr);
> > +               irk_to_return = NULL;
> > +       }
> > +
> >         rcu_read_unlock();
> >
> > -       return NULL;
> > +       return irk_to_return;
> >  }
> >
> >  struct smp_irk *hci_find_irk_by_addr(struct hci_dev *hdev, bdaddr_t *bdaddr,
> >                                      u8 addr_type)
> >  {
> > +       struct smp_irk *irk_to_return = NULL;
> >         struct smp_irk *irk;
> >
> >         /* Identity Address must be public or static random */
> > @@ -2432,13 +2489,23 @@ struct smp_irk *hci_find_irk_by_addr(struct hci_dev *hdev, bdaddr_t *bdaddr,
> >         list_for_each_entry_rcu(irk, &hdev->identity_resolving_keys, list) {
> >                 if (addr_type == irk->addr_type &&
> >                     bacmp(bdaddr, &irk->bdaddr) == 0) {
> > -                       rcu_read_unlock();
> > -                       return irk;
> > +                       irk_to_return = irk;
> > +                       goto done;
> >                 }
> >         }
> > +
> > +done:
> > +
> > +       if (irk_to_return && hci_is_blocked_key(hdev, HCI_BLOCKED_KEY_TYPE_IRK,
> > +                                               irk_to_return->val)) {
> > +               bt_dev_warn_ratelimited(hdev, "Identity key blocked for %pMR",
> > +                                       &irk_to_return->bdaddr);
> > +               irk_to_return = NULL;
> > +       }
> > +
> >         rcu_read_unlock();
> >
> > -       return NULL;
> > +       return irk_to_return;
> >  }
> >
> >  struct link_key *hci_add_link_key(struct hci_dev *hdev, struct hci_conn *conn,
> > @@ -3244,6 +3311,7 @@ struct hci_dev *hci_alloc_dev(void)
> >         INIT_LIST_HEAD(&hdev->pend_le_reports);
> >         INIT_LIST_HEAD(&hdev->conn_hash.list);
> >         INIT_LIST_HEAD(&hdev->adv_instances);
> > +       INIT_LIST_HEAD(&hdev->blocked_keys);
> >
> >         INIT_WORK(&hdev->rx_work, hci_rx_work);
> >         INIT_WORK(&hdev->cmd_work, hci_cmd_work);
> > @@ -3443,6 +3511,7 @@ void hci_unregister_dev(struct hci_dev *hdev)
> >         hci_bdaddr_list_clear(&hdev->le_resolv_list);
> >         hci_conn_params_clear_all(hdev);
> >         hci_discovery_filter_clear(hdev);
> > +       hci_blocked_keys_clear(hdev);
> >         hci_dev_unlock(hdev);
> >
> >         hci_dev_put(hdev);
> > diff --git a/net/bluetooth/hci_debugfs.c b/net/bluetooth/hci_debugfs.c
> > index 402e2cc54044..1c8100bc4e04 100644
> > --- a/net/bluetooth/hci_debugfs.c
> > +++ b/net/bluetooth/hci_debugfs.c
> > @@ -152,6 +152,21 @@ static int blacklist_show(struct seq_file *f, void *p)
> >
> >  DEFINE_SHOW_ATTRIBUTE(blacklist);
> >
> > +static int blocked_keys_show(struct seq_file *f, void *p)
> > +{
> > +       struct hci_dev *hdev = f->private;
> > +       struct blocked_key *key;
> > +
> > +       rcu_read_lock();
> > +       list_for_each_entry_rcu(key, &hdev->blocked_keys, list)
> > +               seq_printf(f, "%u %*phN\n", key->type, 16, key->val);
> > +       rcu_read_unlock();
> > +
> > +       return 0;
> > +}
> > +
> > +DEFINE_SHOW_ATTRIBUTE(blocked_keys);
> > +
> >  static int uuids_show(struct seq_file *f, void *p)
> >  {
> >         struct hci_dev *hdev = f->private;
> > @@ -308,6 +323,8 @@ void hci_debugfs_create_common(struct hci_dev *hdev)
> >                             &device_list_fops);
> >         debugfs_create_file("blacklist", 0444, hdev->debugfs, hdev,
> >                             &blacklist_fops);
> > +       debugfs_create_file("blocked_keys", 0444, hdev->debugfs, hdev,
> > +                           &blocked_keys_fops);
> >         debugfs_create_file("uuids", 0444, hdev->debugfs, hdev, &uuids_fops);
> >         debugfs_create_file("remote_oob", 0400, hdev->debugfs, hdev,
> >                             &remote_oob_fops);
> > diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> > index acb7c6d5643f..77cba2603e2a 100644
> > --- a/net/bluetooth/mgmt.c
> > +++ b/net/bluetooth/mgmt.c
> > @@ -106,6 +106,7 @@ static const u16 mgmt_commands[] = {
> >         MGMT_OP_START_LIMITED_DISCOVERY,
> >         MGMT_OP_READ_EXT_INFO,
> >         MGMT_OP_SET_APPEARANCE,
> > +       MGMT_OP_SET_BLOCKED_KEYS,
> >  };
> >
> >  static const u16 mgmt_events[] = {
> > @@ -3531,6 +3532,55 @@ static int set_phy_configuration(struct sock *sk, struct hci_dev *hdev,
> >         return err;
> >  }
> >
> > +static int set_blocked_keys(struct sock *sk, struct hci_dev *hdev, void *data,
> > +                           u16 len)
> > +{
> > +       int err = MGMT_STATUS_SUCCESS;
> > +       struct mgmt_cp_set_blocked_keys *keys = data;
> > +       const u16 max_key_count = ((U16_MAX - sizeof(*keys)) /
> > +                                  sizeof(struct mgmt_blocked_key_info));
> > +       u16 key_count, expected_len;
> > +       int i;
> > +
> > +       BT_DBG("request for %s", hdev->name);
> > +
> > +       key_count = __le16_to_cpu(keys->key_count);
> > +       if (key_count > max_key_count) {
> > +               bt_dev_err(hdev, "too big key_count value %u", key_count);
> > +               return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_BLOCKED_KEYS,
> > +                                      MGMT_STATUS_INVALID_PARAMS);
> > +       }
> > +
> > +       expected_len = struct_size(keys, keys, key_count);
> > +       if (expected_len != len) {
> > +               bt_dev_err(hdev, "expected %u bytes, got %u bytes",
> > +                          expected_len, len);
> > +               return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_BLOCKED_KEYS,
> > +                                      MGMT_STATUS_INVALID_PARAMS);
> > +       }
> > +
> > +       hci_dev_lock(hdev);
> > +
> > +       hci_blocked_keys_clear(hdev);
> > +
> > +       for (i = 0; i < keys->key_count; ++i) {
> > +               struct blocked_key *b = kzalloc(sizeof(*b), GFP_KERNEL);
> > +
> > +               if (!b) {
> > +                       err = MGMT_STATUS_NO_RESOURCES;
> > +                       break;
> > +               }
> > +
> > +               b->type = keys->keys[i].type;
> > +               memcpy(b->val, keys->keys[i].val, sizeof(b->val));
> > +               list_add_rcu(&b->list, &hdev->blocked_keys);
> > +       }
> > +       hci_dev_unlock(hdev);
> > +
> > +       return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_SET_BLOCKED_KEYS,
> > +                               err, NULL, 0);
> > +}
> > +
> >  static void read_local_oob_data_complete(struct hci_dev *hdev, u8 status,
> >                                          u16 opcode, struct sk_buff *skb)
> >  {
> > @@ -6914,6 +6964,7 @@ static const struct hci_mgmt_handler mgmt_handlers[] = {
> >         { set_appearance,          MGMT_SET_APPEARANCE_SIZE },
> >         { get_phy_configuration,   MGMT_GET_PHY_CONFIGURATION_SIZE },
> >         { set_phy_configuration,   MGMT_SET_PHY_CONFIGURATION_SIZE },
> > +       { set_blocked_keys,        MGMT_OP_SET_BLOCKED_KEYS_SIZE },
> >  };
> >
> >  void mgmt_index_added(struct hci_dev *hdev)
> > diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
> > index 6b42be4b5861..4ece170c518e 100644
> > --- a/net/bluetooth/smp.c
> > +++ b/net/bluetooth/smp.c
> > @@ -2453,6 +2453,15 @@ static int smp_cmd_encrypt_info(struct l2cap_conn *conn, struct sk_buff *skb)
> >         if (skb->len < sizeof(*rp))
> >                 return SMP_INVALID_PARAMS;
> >
> > +       /* Pairing is aborted if any blocked keys are distributed */
> > +       if (hci_is_blocked_key(conn->hcon->hdev, HCI_BLOCKED_KEY_TYPE_LTK,
> > +                              rp->ltk)) {
> > +               bt_dev_warn_ratelimited(conn->hcon->hdev,
> > +                                       "LTK blocked for %pMR",
> > +                                       &conn->hcon->dst);
> > +               return SMP_INVALID_PARAMS;
> > +       }
> > +
> >         SMP_ALLOW_CMD(smp, SMP_CMD_MASTER_IDENT);
> >
> >         skb_pull(skb, sizeof(*rp));
> > @@ -2509,6 +2518,15 @@ static int smp_cmd_ident_info(struct l2cap_conn *conn, struct sk_buff *skb)
> >         if (skb->len < sizeof(*info))
> >                 return SMP_INVALID_PARAMS;
> >
> > +       /* Pairing is aborted if any blocked keys are distributed */
> > +       if (hci_is_blocked_key(conn->hcon->hdev, HCI_BLOCKED_KEY_TYPE_IRK,
> > +                              info->irk)) {
> > +               bt_dev_warn_ratelimited(conn->hcon->hdev,
> > +                                       "Identity key blocked for %pMR",
> > +                                       &conn->hcon->dst);
> > +               return SMP_INVALID_PARAMS;
> > +       }
> > +
> >         SMP_ALLOW_CMD(smp, SMP_CMD_IDENT_ADDR_INFO);
> >
> >         skb_pull(skb, sizeof(*info));
> > --
> > 2.24.0.525.g8f36a354ae-goog
> >
