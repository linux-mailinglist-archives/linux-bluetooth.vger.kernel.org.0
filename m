Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC494131B8B
	for <lists+linux-bluetooth@lfdr.de>; Mon,  6 Jan 2020 23:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgAFWgK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 6 Jan 2020 17:36:10 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34359 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgAFWgJ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 6 Jan 2020 17:36:09 -0500
Received: by mail-lf1-f65.google.com with SMTP id l18so29298306lfc.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 06 Jan 2020 14:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YcJ5S8kKMDpavEL5eSFAUkuZ8wknQnQdbSfB1XR2kO0=;
        b=jRyt32EBGTDvElAhy4BYmkNhwhl3E7KcYqJ8ha5PeS7z0TCpyM5wtylqoc48tf7UcA
         1qoLlseNKonSvFuqxoEUsa6d48E4od7+4LFFgTGPIPNVDLAhMlP6ExFNIzgV5Ug7K6Ib
         jCkhOcywB2bIh+EXuXeXuAyEwXaoVmBFBWbdRfnuGX2KTwenK7Sx2bSeChCcY4IFtWZA
         pTs81/QKImK7G9zFlkWxXi1i/EbNM+fgncL6Z/ZGHFmHr+x6HNVgm7REke/Zq2xzjtR2
         VdCF7EuwA7PK97YrrQsJ0JibfKK5I8ek9ek9GfMq5+iwgO8ptFEilYQYSohgfLY8932L
         OWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YcJ5S8kKMDpavEL5eSFAUkuZ8wknQnQdbSfB1XR2kO0=;
        b=n7IZNWriIs3p50OcdcAnTELWkHuM9C0JwHrdgkmJQtrkUSWc9cn96j0vgOj8JrcDWf
         ZaEbaMUWG5GHalihdbl6q2RR5rkoaORJENW1EQXQHSYskuN93NO6zz+pD1tunOTg1haJ
         v3gH+spsHOYm9rY64ZemHxfBrUS3jiqtQjWst2xn5K9/P9Jd/DGnER5CG/PIMNp/4nGz
         IRPo1Wo3qV5i02I5QsH6NItQLQ6iAw/QBMqpdLDMU3S2ny+kW8QXFtiZ4us5OZG6XexM
         Ytk1+2w0Qb6WyG3b8AkFQiQ8pMillk8/WZB+6Cidnd5aUpN4JgNpf/2RVl/NTDGmddF/
         expQ==
X-Gm-Message-State: APjAAAXh+0OzQYGpRHANOmKUlsaVZZEVfFE6dcXwdO0BsA1n4pWZgAkO
        cYmRCjw3SY3ClGjZTG28HXIBM5EuVK3lcHD74YMLMw==
X-Google-Smtp-Source: APXvYqxn/SgWu73e7LvwwPhQ1cHP91a06bIMpenMSzVjdMvuQoDAj5kDvg+KCe4wjzy5WF69lB0J7feo783v44S3j5k=
X-Received: by 2002:a19:114:: with SMTP id 20mr56833962lfb.25.1578350165636;
 Mon, 06 Jan 2020 14:36:05 -0800 (PST)
MIME-Version: 1.0
References: <20191211154556.120555-1-alainm@chromium.org> <CAOxioNngriC+_ZbGm5-OwV-wp80+ZHv_kR2dcp9XbsgVuXunJg@mail.gmail.com>
 <CAOxioNkoncJ+f7kYzD0uaisnfg6bV30M+JbhP9+3YLv_HDqmrA@mail.gmail.com>
 <CALWDO_Ua0rs95N9rSetM+U27_dc9Kd_w5jgCWeE1Ut-+8q5f_Q@mail.gmail.com>
 <CAO271mnM8T4sEP8M_nVLeh3np8Dy8PtzFKcLa19rshamDowzbw@mail.gmail.com>
 <CALWDO_V_q6575qOTcXcT+MN69OUhsaJZrPLvNk9wJvP33nbLjQ@mail.gmail.com> <CALWDO_XuzfO9J+uv-xC89ig3Dw9U_W=jYOa-bD-ahMzgxfrKeg@mail.gmail.com>
In-Reply-To: <CALWDO_XuzfO9J+uv-xC89ig3Dw9U_W=jYOa-bD-ahMzgxfrKeg@mail.gmail.com>
From:   Alain Michaud <alainmichaud@google.com>
Date:   Mon, 6 Jan 2020 17:35:53 -0500
Message-ID: <CALWDO_XW61hZZevkwmqrgnmyriWtXMnUdfh9GVi2wXyJRuKrmA@mail.gmail.com>
Subject: Re: [PATCH v4] Implementation of MGMT_OP_SET_BLOCKED_KEYS.
To:     Sonny Sasaka <sonnysasaka@chromium.org>
Cc:     Alain Michaud <alainm@chromium.org>,
        BlueZ <linux-bluetooth@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Post holiday follow-up on this topic.

Sonny and I have worked together offline to address the remaining
issues and validate the change.  I'll be posting a new version of both
the kernel and userspace patch series.

Thanks,
Alain


On Wed, Dec 11, 2019 at 8:32 PM Alain Michaud <alainmichaud@google.com> wrote:
>
> Resending in plain text mode.
>
>
> On Wed, Dec 11, 2019 at 8:26 PM Alain Michaud <alainmichaud@google.com> wrote:
> >
> > Sonny and I sync'd offline. We will work together and will come back with a verified proposal.
> >
> > Thanks
> > Alain
> >
> > On Wed., Dec. 11, 2019, 5:34 p.m. Sonny Sasaka, <sonnysasaka@chromium.org> wrote:
> >>
> >> On Wed, Dec 11, 2019 at 2:06 PM Alain Michaud <alainmichaud@google.com> wrote:
> >> >
> >> > On Wed, Dec 11, 2019 at 12:55 PM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
> >> > >
> >> > > On Wed, Dec 11, 2019 at 9:48 AM Sonny Sasaka <sonnysasaka@chromium.org> wrote:
> >> > > >
> >> > > > Hi Alain, Marcel,
> >> > > >
> >> > > > I tried to verify this patch together with its corresponding
> >> > > > user-space (bluetoothd) change. I found two major attack vectors of
> >> > > > the security issue (CVE-2019-2102) are not covered:
> >> > > >
> >> > > > Attack scenario 1:
> >> > > > a. An LE device (say device X) is paired with BlueZ.
> >> > > > b. It becomes known that device X uses a hardcoded LTK, therefore X's
> >> > > > LTK must be blocked.
> >> > > > c. Add X's LTK to bluetoothd's blocked LTK list. Rebuild and restart bluetoothd.
> >> > > > d. An attacker tries to undermine the situation by having a malicious
> >> > > > device (say device M) pretending to be X, by using X's address and
> >> > > > also knowing the X's hardcoded LTK.
> >> > > > e. When X is not connected to BlueZ and device M is around and
> >> > > > advertising, BlueZ will automatically connect to Y (due to BlueZ's
> >> > > [sonny] sorry for typo, I meant "M" not "Y"
> >> > > > auto-reconnection to paired devices)
> >> > > > f. This connection triggers BlueZ to initiate pairing to device M. The
> >> > > > user is presented with a UI dialog (planned as a separate fix) such as
> >> > > > "Alain's Logitech Mouse wants to pair, yes or no". The user, as a
> >> > > > non-Bluetooth engineer, is likely to accept the pairing.
> >> > > > g. Malicious device M has succeeded in becoming a trusted device with
> >> > > > BlueZ, and now is able to do the bad things it wants such as HID
> >> > > > injection (pretending to be a mouse/keyboard injecting inputs that
> >> > > > could compromise the privacy and security of the BlueZ device).
> >> > [alain] I think you are conflicting two issues, in one case, a valid
> >> > key is being dumped/overwritten and in this case a key has been marked
> >> > as invalid and is being tossed.  Marcel did provide the feedback that
> >> > we should filter out the LTK from being loaded if they are part of the
> >> > filtered list.  I was planning on creating a seperate user land patch
> >> > for this.  I don't think this needs to be addressed in this kernel
> >> > patch.
> >> [sonny] I am talking about the fix as a whole (kernel + userspace), so
> >> I am not suggesting that the fix is done in the kernel patch. As long
> >> as it's fixed somewhere and the goal is such that the attack scenario
> >> isn't possible to be done.
> >> >
> >> >
> >> > > >
> >> > > > Attack scenario 2:
> >> > > > a. It becomes known that product X uses a hardcoded LTK, therefore
> >> > > > this bad LTK must be blocked.
> >> > > > b. Add X's LTK to bluetoothd. Rebuild and restart bluetoothd.
> >> > > > c. A user uses product X and have BlueZ pair with it.
> >> > > > d. Since product X uses its hardcoded LTK, this LTK is rejected by
> >> > > > BlueZ and BlueZ lets X know by sending SMP_INVALID_PARAMS. Device X
> >> > > > may just ignore the error and not do re-pairing.
> >> > > > e. Therefore BlueZ is in a state where it records device X's info but
> >> > > > not having LTK. Turns out that BlueZ still considers this device to
> >> > > > need auto-reconnection even without "paired" status nor LTK.
> >> > [alain] This is definitely a problem that should be addressed in this
> >> > patch.  If you have a repro I'd love traces if you have them.
> >> [sonny] You can repro easily by blocking every key. I used a Microsoft
> >> Designer mouse as the peer device.
> >> >
> >> > > > f. An attacker tries to undermine the situation by having a malicious
> >> > > > device (say device M) pretending to be X, by using 's address and also
> >> > > > knowing the X's hardcoded LTK.
> >> > > > g. When X is not connected to BlueZ and device M is around and
> >> > > > advertising, BlueZ will automatically connect to M (due to BlueZ's
> >> > > > auto-reconnection to paired devices)
> >> > [alain] This seems slightly incorrect since the device is not
> >> > considered paired (no LTK written)
> >> [sonny] I didn't expect that either. But experiment shows that BlueZ
> >> does reconnect automatically. I didn't try to find out why or how.
> >> >
> >> > > > h. After BlueZ is auto-connected to M, this doesn't trigger pairing at
> >> > > > BlueZ side because device X is recorded as "not paired". Therefore
> >> > > > device M can right away pretend to do the bad thing, like
> >> > > > mouse/keyboard HID injection, without needing pairing and therefore
> >> > > > without needing any user interaction.
> >> > [alain] If this is possible, I'd argue that the Hogp implementation
> >> > doesn't have the right security requirements and should likely be
> >> > fixed.  I'd love to see a trace if you were able to get this to work.
> >> > In fact I wouldn't expect Hogp to discover the Gatt DB nor set the
> >> > CCCD on the device if it isn't bonded.
> >> I can't be sure about how HOGP security requirement is implemented in
> >> BlueZ. What I saw was that GATT discovery activity was happening after
> >> auto-reconnection that could result in bad things if connected with a
> >> malicious device. I will find out about HOGP security requirements in
> >> BlueZ. For now, I think the root of the problem is just in the
> >> auto-reconnect part. Experiment shows that BlueZ still auto-reconnects
> >> to this device that failed pairing. As long as BlueZ correctly doesn't
> >> reconnect to the device with failed pairing, there is no more worry
> >> about any attack.
> >> >
> >> > > >
> >> > > > Since the patches haven't addressed the attack vectors caused by
> >> > > > CVE-2019-2102, the patches still need to be revised to address those.
> >> > > > I don't have any particular recommendation how to, but I can help with
> >> > > > verifying.
> >> > > >
> >> > > > I tested those cases with Ubuntu + Alain's patches.
> >> > > >
> >> > > > Also, when trying to verify the patches I realized that I needed to
> >> > > > correct the MGMT_OP_SET_BLOCKED_KEYS_SIZE and mgmt_cp_set_blocked_keys
> >> > > > array. And we likely want to flag the MGMT handler with
> >> > > > HCI_MGMT_VAR_LEN.
> >> > [alain] Thanks for your help, I will fix these.
> >> >
> >> > > >
> >> > > >
> >> > > > On Wed, Dec 11, 2019 at 7:46 AM Alain Michaud <alainm@chromium.org> wrote:
> >> > > > >
> >> > > > > MGMT command is added to receive the list of blocked keys from
> >> > > > > user-space.
> >> > > > >
> >> > > > > The list is used to:
> >> > > > > 1) Block keys from being distributed by the device during
> >> > > > >    the ke distribution phase of SMP.
> >> > > > > 2) Filter out any keys that were previously saved so
> >> > > > >    they are no longer used.
> >> > > > >
> >> > > > > Signed-off-by: Alain Michaud <alainm@chromium.org>
> >> > > > > ---
> >> > > > >
> >> > > > >  include/net/bluetooth/hci_core.h | 10 ++++
> >> > > > >  include/net/bluetooth/mgmt.h     | 17 +++++++
> >> > > > >  net/bluetooth/hci_core.c         | 85 +++++++++++++++++++++++++++++---
> >> > > > >  net/bluetooth/hci_debugfs.c      | 17 +++++++
> >> > > > >  net/bluetooth/mgmt.c             | 51 +++++++++++++++++++
> >> > > > >  net/bluetooth/smp.c              | 18 +++++++
> >> > > > >  6 files changed, 190 insertions(+), 8 deletions(-)
> >> > > > >
> >> > > > > diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
> >> > > > > index b689aceb636b..9020fa3c4d30 100644
> >> > > > > --- a/include/net/bluetooth/hci_core.h
> >> > > > > +++ b/include/net/bluetooth/hci_core.h
> >> > > > > @@ -118,6 +118,13 @@ struct bt_uuid {
> >> > > > >         u8 svc_hint;
> >> > > > >  };
> >> > > > >
> >> > > > > +struct blocked_key {
> >> > > > > +       struct list_head list;
> >> > > > > +       struct rcu_head rcu;
> >> > > > > +       u8 type;
> >> > > > > +       u8 val[16];
> >> > > > > +};
> >> > > > > +
> >> > > > >  struct smp_csrk {
> >> > > > >         bdaddr_t bdaddr;
> >> > > > >         u8 bdaddr_type;
> >> > > > > @@ -397,6 +404,7 @@ struct hci_dev {
> >> > > > >         struct list_head        le_conn_params;
> >> > > > >         struct list_head        pend_le_conns;
> >> > > > >         struct list_head        pend_le_reports;
> >> > > > > +       struct list_head        blocked_keys;
> >> > > > >
> >> > > > >         struct hci_dev_stats    stat;
> >> > > > >
> >> > > > > @@ -1121,6 +1129,8 @@ struct smp_irk *hci_find_irk_by_addr(struct hci_dev *hdev, bdaddr_t *bdaddr,
> >> > > > >  struct smp_irk *hci_add_irk(struct hci_dev *hdev, bdaddr_t *bdaddr,
> >> > > > >                             u8 addr_type, u8 val[16], bdaddr_t *rpa);
> >> > > > >  void hci_remove_irk(struct hci_dev *hdev, bdaddr_t *bdaddr, u8 addr_type);
> >> > > > > +bool hci_is_blocked_key(struct hci_dev *hdev, u8 type, u8 val[16]);
> >> > > > > +void hci_blocked_keys_clear(struct hci_dev *hdev);
> >> > > > >  void hci_smp_irks_clear(struct hci_dev *hdev);
> >> > > > >
> >> > > > >  bool hci_bdaddr_is_paired(struct hci_dev *hdev, bdaddr_t *bdaddr, u8 type);
> >> > > > > diff --git a/include/net/bluetooth/mgmt.h b/include/net/bluetooth/mgmt.h
> >> > > > > index 9cee7ddc6741..c9b1d39d6d6c 100644
> >> > > > > --- a/include/net/bluetooth/mgmt.h
> >> > > > > +++ b/include/net/bluetooth/mgmt.h
> >> > > > > @@ -654,6 +654,23 @@ struct mgmt_cp_set_phy_confguration {
> >> > > > >  } __packed;
> >> > > > >  #define MGMT_SET_PHY_CONFIGURATION_SIZE        4
> >> > > > >
> >> > > > > +#define MGMT_OP_SET_BLOCKED_KEYS       0x0046
> >> > > > > +
> >> > > > > +#define HCI_BLOCKED_KEY_TYPE_LINKKEY   0x00
> >> > > > > +#define HCI_BLOCKED_KEY_TYPE_LTK               0x01
> >> > > > > +#define HCI_BLOCKED_KEY_TYPE_IRK               0x02
> >> > > > > +
> >> > > > > +struct mgmt_blocked_key_info {
> >> > > > > +       __u8 type;
> >> > > > > +       __u8 val[16];
> >> > > > > +} __packed;
> >> > > > > +
> >> > > > > +struct mgmt_cp_set_blocked_keys {
> >> > > > > +       __le16 key_count;
> >> > > > > +       struct mgmt_blocked_key_info keys[0];
> >> > > > > +} __packed;
> >> > > > > +#define MGMT_OP_SET_BLOCKED_KEYS_SIZE 0
> >> > > > > +
> >> > > > >  #define MGMT_EV_CMD_COMPLETE           0x0001
> >> > > > >  struct mgmt_ev_cmd_complete {
> >> > > > >         __le16  opcode;
> >> > > > > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> >> > > > > index 9e19d5a3aac8..f0298db26dc3 100644
> >> > > > > --- a/net/bluetooth/hci_core.c
> >> > > > > +++ b/net/bluetooth/hci_core.c
> >> > > > > @@ -2311,6 +2311,33 @@ void hci_smp_irks_clear(struct hci_dev *hdev)
> >> > > > >         }
> >> > > > >  }
> >> > > > >
> >> > > > > +void hci_blocked_keys_clear(struct hci_dev *hdev)
> >> > > > > +{
> >> > > > > +       struct blocked_key *b;
> >> > > > > +
> >> > > > > +       list_for_each_entry_rcu(b, &hdev->blocked_keys, list) {
> >> > > > > +               list_del_rcu(&b->list);
> >> > > > > +               kfree_rcu(b, rcu);
> >> > > > > +       }
> >> > > > > +}
> >> > > > > +
> >> > > > > +bool hci_is_blocked_key(struct hci_dev *hdev, u8 type, u8 val[16])
> >> > > > > +{
> >> > > > > +       bool blocked = false;
> >> > > > > +       struct blocked_key *b;
> >> > > > > +
> >> > > > > +       rcu_read_lock();
> >> > > > > +       list_for_each_entry(b, &hdev->blocked_keys, list) {
> >> > > > > +               if (b->type == type && !memcmp(b->val, val, sizeof(b->val))) {
> >> > > > > +                       blocked = true;
> >> > > > > +                       break;
> >> > > > > +               }
> >> > > > > +       }
> >> > > > > +
> >> > > > > +       rcu_read_unlock();
> >> > > > > +       return blocked;
> >> > > > > +}
> >> > > > > +
> >> > > > >  struct link_key *hci_find_link_key(struct hci_dev *hdev, bdaddr_t *bdaddr)
> >> > > > >  {
> >> > > > >         struct link_key *k;
> >> > > > > @@ -2319,6 +2346,16 @@ struct link_key *hci_find_link_key(struct hci_dev *hdev, bdaddr_t *bdaddr)
> >> > > > >         list_for_each_entry_rcu(k, &hdev->link_keys, list) {
> >> > > > >                 if (bacmp(bdaddr, &k->bdaddr) == 0) {
> >> > > > >                         rcu_read_unlock();
> >> > > > > +
> >> > > > > +                       if (hci_is_blocked_key(hdev,
> >> > > > > +                                              HCI_BLOCKED_KEY_TYPE_LINKKEY,
> >> > > > > +                                              k->val)) {
> >> > > > > +                               bt_dev_warn_ratelimited(hdev,
> >> > > > > +                                                       "Link key blocked for %pMR",
> >> > > > > +                                                       &k->bdaddr);
> >> > > > > +                               return NULL;
> >> > > > > +                       }
> >> > > > > +
> >> > > > >                         return k;
> >> > > > >                 }
> >> > > > >         }
> >> > > > > @@ -2387,6 +2424,15 @@ struct smp_ltk *hci_find_ltk(struct hci_dev *hdev, bdaddr_t *bdaddr,
> >> > > > >
> >> > > > >                 if (smp_ltk_is_sc(k) || ltk_role(k->type) == role) {
> >> > > > >                         rcu_read_unlock();
> >> > > > > +
> >> > > > > +                       if (hci_is_blocked_key(hdev, HCI_BLOCKED_KEY_TYPE_LTK,
> >> > > > > +                                              k->val)) {
> >> > > > > +                               bt_dev_warn_ratelimited(hdev,
> >> > > > > +                                                       "LTK blocked for %pMR",
> >> > > > > +                                                       &k->bdaddr);
> >> > > > > +                               return NULL;
> >> > > > > +                       }
> >> > > > > +
> >> > > > >                         return k;
> >> > > > >                 }
> >> > > > >         }
> >> > > > > @@ -2397,31 +2443,42 @@ struct smp_ltk *hci_find_ltk(struct hci_dev *hdev, bdaddr_t *bdaddr,
> >> > > > >
> >> > > > >  struct smp_irk *hci_find_irk_by_rpa(struct hci_dev *hdev, bdaddr_t *rpa)
> >> > > > >  {
> >> > > > > +       struct smp_irk *irk_to_return = NULL;
> >> > > > >         struct smp_irk *irk;
> >> > > > >
> >> > > > >         rcu_read_lock();
> >> > > > >         list_for_each_entry_rcu(irk, &hdev->identity_resolving_keys, list) {
> >> > > > >                 if (!bacmp(&irk->rpa, rpa)) {
> >> > > > > -                       rcu_read_unlock();
> >> > > > > -                       return irk;
> >> > > > > +                       irk_to_return = irk;
> >> > > > > +                       goto done;
> >> > > > >                 }
> >> > > > >         }
> >> > > > >
> >> > > > >         list_for_each_entry_rcu(irk, &hdev->identity_resolving_keys, list) {
> >> > > > >                 if (smp_irk_matches(hdev, irk->val, rpa)) {
> >> > > > >                         bacpy(&irk->rpa, rpa);
> >> > > > > -                       rcu_read_unlock();
> >> > > > > -                       return irk;
> >> > > > > +                       irk_to_return = irk;
> >> > > > > +                       goto done;
> >> > > > >                 }
> >> > > > >         }
> >> > > > > +
> >> > > > > +done:
> >> > > > > +       if (irk_to_return && hci_is_blocked_key(hdev, HCI_BLOCKED_KEY_TYPE_IRK,
> >> > > > > +                                               irk_to_return->val)) {
> >> > > > > +               bt_dev_warn_ratelimited(hdev, "Identity key blocked for %pMR",
> >> > > > > +                                       &irk_to_return->bdaddr);
> >> > > > > +               irk_to_return = NULL;
> >> > > > > +       }
> >> > > > > +
> >> > > > >         rcu_read_unlock();
> >> > > > >
> >> > > > > -       return NULL;
> >> > > > > +       return irk_to_return;
> >> > > > >  }
> >> > > > >
> >> > > > >  struct smp_irk *hci_find_irk_by_addr(struct hci_dev *hdev, bdaddr_t *bdaddr,
> >> > > > >                                      u8 addr_type)
> >> > > > >  {
> >> > > > > +       struct smp_irk *irk_to_return = NULL;
> >> > > > >         struct smp_irk *irk;
> >> > > > >
> >> > > > >         /* Identity Address must be public or static random */
> >> > > > > @@ -2432,13 +2489,23 @@ struct smp_irk *hci_find_irk_by_addr(struct hci_dev *hdev, bdaddr_t *bdaddr,
> >> > > > >         list_for_each_entry_rcu(irk, &hdev->identity_resolving_keys, list) {
> >> > > > >                 if (addr_type == irk->addr_type &&
> >> > > > >                     bacmp(bdaddr, &irk->bdaddr) == 0) {
> >> > > > > -                       rcu_read_unlock();
> >> > > > > -                       return irk;
> >> > > > > +                       irk_to_return = irk;
> >> > > > > +                       goto done;
> >> > > > >                 }
> >> > > > >         }
> >> > > > > +
> >> > > > > +done:
> >> > > > > +
> >> > > > > +       if (irk_to_return && hci_is_blocked_key(hdev, HCI_BLOCKED_KEY_TYPE_IRK,
> >> > > > > +                                               irk_to_return->val)) {
> >> > > > > +               bt_dev_warn_ratelimited(hdev, "Identity key blocked for %pMR",
> >> > > > > +                                       &irk_to_return->bdaddr);
> >> > > > > +               irk_to_return = NULL;
> >> > > > > +       }
> >> > > > > +
> >> > > > >         rcu_read_unlock();
> >> > > > >
> >> > > > > -       return NULL;
> >> > > > > +       return irk_to_return;
> >> > > > >  }
> >> > > > >
> >> > > > >  struct link_key *hci_add_link_key(struct hci_dev *hdev, struct hci_conn *conn,
> >> > > > > @@ -3244,6 +3311,7 @@ struct hci_dev *hci_alloc_dev(void)
> >> > > > >         INIT_LIST_HEAD(&hdev->pend_le_reports);
> >> > > > >         INIT_LIST_HEAD(&hdev->conn_hash.list);
> >> > > > >         INIT_LIST_HEAD(&hdev->adv_instances);
> >> > > > > +       INIT_LIST_HEAD(&hdev->blocked_keys);
> >> > > > >
> >> > > > >         INIT_WORK(&hdev->rx_work, hci_rx_work);
> >> > > > >         INIT_WORK(&hdev->cmd_work, hci_cmd_work);
> >> > > > > @@ -3443,6 +3511,7 @@ void hci_unregister_dev(struct hci_dev *hdev)
> >> > > > >         hci_bdaddr_list_clear(&hdev->le_resolv_list);
> >> > > > >         hci_conn_params_clear_all(hdev);
> >> > > > >         hci_discovery_filter_clear(hdev);
> >> > > > > +       hci_blocked_keys_clear(hdev);
> >> > > > >         hci_dev_unlock(hdev);
> >> > > > >
> >> > > > >         hci_dev_put(hdev);
> >> > > > > diff --git a/net/bluetooth/hci_debugfs.c b/net/bluetooth/hci_debugfs.c
> >> > > > > index 402e2cc54044..1c8100bc4e04 100644
> >> > > > > --- a/net/bluetooth/hci_debugfs.c
> >> > > > > +++ b/net/bluetooth/hci_debugfs.c
> >> > > > > @@ -152,6 +152,21 @@ static int blacklist_show(struct seq_file *f, void *p)
> >> > > > >
> >> > > > >  DEFINE_SHOW_ATTRIBUTE(blacklist);
> >> > > > >
> >> > > > > +static int blocked_keys_show(struct seq_file *f, void *p)
> >> > > > > +{
> >> > > > > +       struct hci_dev *hdev = f->private;
> >> > > > > +       struct blocked_key *key;
> >> > > > > +
> >> > > > > +       rcu_read_lock();
> >> > > > > +       list_for_each_entry_rcu(key, &hdev->blocked_keys, list)
> >> > > > > +               seq_printf(f, "%u %*phN\n", key->type, 16, key->val);
> >> > > > > +       rcu_read_unlock();
> >> > > > > +
> >> > > > > +       return 0;
> >> > > > > +}
> >> > > > > +
> >> > > > > +DEFINE_SHOW_ATTRIBUTE(blocked_keys);
> >> > > > > +
> >> > > > >  static int uuids_show(struct seq_file *f, void *p)
> >> > > > >  {
> >> > > > >         struct hci_dev *hdev = f->private;
> >> > > > > @@ -308,6 +323,8 @@ void hci_debugfs_create_common(struct hci_dev *hdev)
> >> > > > >                             &device_list_fops);
> >> > > > >         debugfs_create_file("blacklist", 0444, hdev->debugfs, hdev,
> >> > > > >                             &blacklist_fops);
> >> > > > > +       debugfs_create_file("blocked_keys", 0444, hdev->debugfs, hdev,
> >> > > > > +                           &blocked_keys_fops);
> >> > > > >         debugfs_create_file("uuids", 0444, hdev->debugfs, hdev, &uuids_fops);
> >> > > > >         debugfs_create_file("remote_oob", 0400, hdev->debugfs, hdev,
> >> > > > >                             &remote_oob_fops);
> >> > > > > diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> >> > > > > index acb7c6d5643f..77cba2603e2a 100644
> >> > > > > --- a/net/bluetooth/mgmt.c
> >> > > > > +++ b/net/bluetooth/mgmt.c
> >> > > > > @@ -106,6 +106,7 @@ static const u16 mgmt_commands[] = {
> >> > > > >         MGMT_OP_START_LIMITED_DISCOVERY,
> >> > > > >         MGMT_OP_READ_EXT_INFO,
> >> > > > >         MGMT_OP_SET_APPEARANCE,
> >> > > > > +       MGMT_OP_SET_BLOCKED_KEYS,
> >> > > > >  };
> >> > > > >
> >> > > > >  static const u16 mgmt_events[] = {
> >> > > > > @@ -3531,6 +3532,55 @@ static int set_phy_configuration(struct sock *sk, struct hci_dev *hdev,
> >> > > > >         return err;
> >> > > > >  }
> >> > > > >
> >> > > > > +static int set_blocked_keys(struct sock *sk, struct hci_dev *hdev, void *data,
> >> > > > > +                           u16 len)
> >> > > > > +{
> >> > > > > +       int err = MGMT_STATUS_SUCCESS;
> >> > > > > +       struct mgmt_cp_set_blocked_keys *keys = data;
> >> > > > > +       const u16 max_key_count = ((U16_MAX - sizeof(*keys)) /
> >> > > > > +                                  sizeof(struct mgmt_blocked_key_info));
> >> > > > > +       u16 key_count, expected_len;
> >> > > > > +       int i;
> >> > > > > +
> >> > > > > +       BT_DBG("request for %s", hdev->name);
> >> > > > > +
> >> > > > > +       key_count = __le16_to_cpu(keys->key_count);
> >> > > > > +       if (key_count > max_key_count) {
> >> > > > > +               bt_dev_err(hdev, "too big key_count value %u", key_count);
> >> > > > > +               return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_BLOCKED_KEYS,
> >> > > > > +                                      MGMT_STATUS_INVALID_PARAMS);
> >> > > > > +       }
> >> > > > > +
> >> > > > > +       expected_len = struct_size(keys, keys, key_count);
> >> > > > > +       if (expected_len != len) {
> >> > > > > +               bt_dev_err(hdev, "expected %u bytes, got %u bytes",
> >> > > > > +                          expected_len, len);
> >> > > > > +               return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_BLOCKED_KEYS,
> >> > > > > +                                      MGMT_STATUS_INVALID_PARAMS);
> >> > > > > +       }
> >> > > > > +
> >> > > > > +       hci_dev_lock(hdev);
> >> > > > > +
> >> > > > > +       hci_blocked_keys_clear(hdev);
> >> > > > > +
> >> > > > > +       for (i = 0; i < keys->key_count; ++i) {
> >> > > > > +               struct blocked_key *b = kzalloc(sizeof(*b), GFP_KERNEL);
> >> > > > > +
> >> > > > > +               if (!b) {
> >> > > > > +                       err = MGMT_STATUS_NO_RESOURCES;
> >> > > > > +                       break;
> >> > > > > +               }
> >> > > > > +
> >> > > > > +               b->type = keys->keys[i].type;
> >> > > > > +               memcpy(b->val, keys->keys[i].val, sizeof(b->val));
> >> > > > > +               list_add_rcu(&b->list, &hdev->blocked_keys);
> >> > > > > +       }
> >> > > > > +       hci_dev_unlock(hdev);
> >> > > > > +
> >> > > > > +       return mgmt_cmd_complete(sk, hdev->id, MGMT_OP_SET_BLOCKED_KEYS,
> >> > > > > +                               err, NULL, 0);
> >> > > > > +}
> >> > > > > +
> >> > > > >  static void read_local_oob_data_complete(struct hci_dev *hdev, u8 status,
> >> > > > >                                          u16 opcode, struct sk_buff *skb)
> >> > > > >  {
> >> > > > > @@ -6914,6 +6964,7 @@ static const struct hci_mgmt_handler mgmt_handlers[] = {
> >> > > > >         { set_appearance,          MGMT_SET_APPEARANCE_SIZE },
> >> > > > >         { get_phy_configuration,   MGMT_GET_PHY_CONFIGURATION_SIZE },
> >> > > > >         { set_phy_configuration,   MGMT_SET_PHY_CONFIGURATION_SIZE },
> >> > > > > +       { set_blocked_keys,        MGMT_OP_SET_BLOCKED_KEYS_SIZE },
> >> > > > >  };
> >> > > > >
> >> > > > >  void mgmt_index_added(struct hci_dev *hdev)
> >> > > > > diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
> >> > > > > index 6b42be4b5861..4ece170c518e 100644
> >> > > > > --- a/net/bluetooth/smp.c
> >> > > > > +++ b/net/bluetooth/smp.c
> >> > > > > @@ -2453,6 +2453,15 @@ static int smp_cmd_encrypt_info(struct l2cap_conn *conn, struct sk_buff *skb)
> >> > > > >         if (skb->len < sizeof(*rp))
> >> > > > >                 return SMP_INVALID_PARAMS;
> >> > > > >
> >> > > > > +       /* Pairing is aborted if any blocked keys are distributed */
> >> > > > > +       if (hci_is_blocked_key(conn->hcon->hdev, HCI_BLOCKED_KEY_TYPE_LTK,
> >> > > > > +                              rp->ltk)) {
> >> > > > > +               bt_dev_warn_ratelimited(conn->hcon->hdev,
> >> > > > > +                                       "LTK blocked for %pMR",
> >> > > > > +                                       &conn->hcon->dst);
> >> > > > > +               return SMP_INVALID_PARAMS;
> >> > > > > +       }
> >> > > > > +
> >> > > > >         SMP_ALLOW_CMD(smp, SMP_CMD_MASTER_IDENT);
> >> > > > >
> >> > > > >         skb_pull(skb, sizeof(*rp));
> >> > > > > @@ -2509,6 +2518,15 @@ static int smp_cmd_ident_info(struct l2cap_conn *conn, struct sk_buff *skb)
> >> > > > >         if (skb->len < sizeof(*info))
> >> > > > >                 return SMP_INVALID_PARAMS;
> >> > > > >
> >> > > > > +       /* Pairing is aborted if any blocked keys are distributed */
> >> > > > > +       if (hci_is_blocked_key(conn->hcon->hdev, HCI_BLOCKED_KEY_TYPE_IRK,
> >> > > > > +                              info->irk)) {
> >> > > > > +               bt_dev_warn_ratelimited(conn->hcon->hdev,
> >> > > > > +                                       "Identity key blocked for %pMR",
> >> > > > > +                                       &conn->hcon->dst);
> >> > > > > +               return SMP_INVALID_PARAMS;
> >> > > > > +       }
> >> > > > > +
> >> > > > >         SMP_ALLOW_CMD(smp, SMP_CMD_IDENT_ADDR_INFO);
> >> > > > >
> >> > > > >         skb_pull(skb, sizeof(*info));
> >> > > > > --
> >> > > > > 2.24.0.525.g8f36a354ae-goog
> >> > > > >
