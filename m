Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540F0232F71
	for <lists+linux-bluetooth@lfdr.de>; Thu, 30 Jul 2020 11:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgG3JXy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 30 Jul 2020 05:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgG3JXx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 30 Jul 2020 05:23:53 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1659C061794
        for <linux-bluetooth@vger.kernel.org>; Thu, 30 Jul 2020 02:23:52 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id l17so27514898iok.7
        for <linux-bluetooth@vger.kernel.org>; Thu, 30 Jul 2020 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z7iOKki394HYHSjYxJseFmBbtv9pKfq6xXxqX0cqic8=;
        b=akssUkca0WT2jsr6JpHNQShrEGfViRLM8iWxgfI+Hi5aMnjiuyfeuhwMRXNucqLj/O
         F6PigCnaQhsn2a84MDw52Q5IQxIKnVC3CcRdH65LdBWyjXxE3FjMdJh2Hv0P0IRNgPNT
         OPOupXMbhj4szn8xC4ArXKguWNb2f+CRT5FfnKcVTXj3mEUzRKtflEWqulr2UQHhZQk2
         dk3EX4pg6mv8v0JzD4L+9dbM5OVIiY7hJyyFl9Kr5kYXhi4hs3+B9cVp8Dgn4GofYi5F
         bGeCGlByKvilJ3CGS9hCNaoJ0xlqrhtAjNzCtUlj0utgPdpcKhItFpaimg+aScZzW9oj
         m2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z7iOKki394HYHSjYxJseFmBbtv9pKfq6xXxqX0cqic8=;
        b=tr+Rh/8sgNkBCS61rnWOiclw0nAEfBIL/t0H0R6Ow249C8e7j4VoM/gVnXkQ9viJ+F
         8yd5vMirAsyw3p6IqfG1s8uNmrRbWpwMPEqDkKq+Z7wyrSXxyOzrJNBRimrfMJwNC3jS
         E9iqg9hfcrpD9/Bg6ch+jxEl+b+f22X1j5Jztr6ttci7iFWHBJ0Kkpotae2PZRbLilMb
         m6CnvdQycNU7wksUR2/AwPtngbn3t71nZ9WvyE8J0cw9aTXxoA9H4t/0KrrIz3e9uJQq
         E5ljGCN9Rlla41TPJ6VmacjBY7Q6Ic7oP8M+fYgSYgF/lYnGYZknqsNnGO8kxOn1sUb/
         YGTA==
X-Gm-Message-State: AOAM5317Qb9KWd+EGEQSpOUSrH0HxSKboc7l9csWuBWCfazHe13/1H54
        PEkflS73H+b9lon22MZ0M6eMH5fiHXLoJweZcMYU1yF2
X-Google-Smtp-Source: ABdhPJwasN/rddnoVn1WVrIHtIgL2NEBGusiXF2Kc4gVxtZhSPaStuo1g0uTT+iPdEW/gl41a7bm3yXx8TnhWc6eAVQ=
X-Received: by 2002:a5e:9247:: with SMTP id z7mr28958242iop.1.1596101031923;
 Thu, 30 Jul 2020 02:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200730091421.48847-8-marcel@holtmann.org>
In-Reply-To: <20200730091421.48847-8-marcel@holtmann.org>
From:   Sathish Narasimman <nsathish41@gmail.com>
Date:   Thu, 30 Jul 2020 14:53:40 +0530
Message-ID: <CAOVXEJ+hz7j9MnYU1hWrvM5itg_xumjWgyYTTYOQazEG9Y17gQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] Bluetooth: Enable controller RPA resolution using
 Experimental feature
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel

I am ok with your changes.
Including all the patches

On Thu, Jul 30, 2020 at 2:48 PM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> From: Sathish Narasimman <nsathish41@gmail.com>
>
> This patch adds support to enable the use of RPA Address resolution
> using expermental feature mgmt command.
>
> Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
>  include/net/bluetooth/hci.h |   1 +
>  net/bluetooth/hci_event.c   |   1 +
>  net/bluetooth/hci_request.c |   7 +-
>  net/bluetooth/mgmt.c        | 142 +++++++++++++++++++++++++++++++++++-
>  4 files changed, 148 insertions(+), 3 deletions(-)
>
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index dd82cce77a7a..c8e67042a3b1 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -318,6 +318,7 @@ enum {
>         HCI_FORCE_BREDR_SMP,
>         HCI_FORCE_STATIC_ADDR,
>         HCI_LL_RPA_RESOLUTION,
> +       HCI_ENABLE_LL_PRIVACY,
>         HCI_CMD_PENDING,
>         HCI_FORCE_NO_MITM,
>
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 628831b15c0a..33d8458fdd4a 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -5230,6 +5230,7 @@ static void hci_le_enh_conn_complete_evt(struct hci_dev *hdev,
>                              le16_to_cpu(ev->supervision_timeout));
>
>         if (use_ll_privacy(hdev) &&
> +           hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
>             hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION))
>                 hci_req_disable_address_resolution(hdev);
>  }
> diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
> index 70e077cc7dfa..435400a43a78 100644
> --- a/net/bluetooth/hci_request.c
> +++ b/net/bluetooth/hci_request.c
> @@ -678,8 +678,10 @@ void hci_req_add_le_scan_disable(struct hci_request *req, bool rpa_le_conn)
>
>         /* Disable address resolution */
>         if (use_ll_privacy(hdev) &&
> +           hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
>             hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION) && !rpa_le_conn) {
>                 __u8 enable = 0x00;
> +
>                 hci_req_add(req, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE, 1, &enable);
>         }
>  }
> @@ -870,8 +872,11 @@ static void hci_req_start_scan(struct hci_request *req, u8 type, u16 interval,
>                 return;
>         }
>
> -       if (use_ll_privacy(hdev) && addr_resolv) {
> +       if (use_ll_privacy(hdev) &&
> +           hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY) &&
> +           addr_resolv) {
>                 u8 enable = 0x01;
> +
>                 hci_req_add(req, HCI_OP_LE_SET_ADDR_RESOLV_ENABLE, 1, &enable);
>         }
>
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 47bcfe2fb14c..4ec0fee80344 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -795,10 +795,15 @@ static u32 get_supported_settings(struct hci_dev *hdev)
>
>         if (lmp_le_capable(hdev)) {
>                 settings |= MGMT_SETTING_LE;
> -               settings |= MGMT_SETTING_ADVERTISING;
>                 settings |= MGMT_SETTING_SECURE_CONN;
>                 settings |= MGMT_SETTING_PRIVACY;
>                 settings |= MGMT_SETTING_STATIC_ADDRESS;
> +
> +               /* When the experimental feature for LL Privacy support is
> +                * enabled, then advertising is no longer supported.
> +                */
> +               if (!hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
> +                       settings |= MGMT_SETTING_ADVERTISING;
>         }
>
>         if (test_bit(HCI_QUIRK_EXTERNAL_CONFIG, &hdev->quirks) ||
> @@ -3759,10 +3764,16 @@ static const u8 simult_central_periph_uuid[16] = {
>         0x96, 0x46, 0xc0, 0x42, 0xb5, 0x10, 0x1b, 0x67,
>  };
>
> +/* 15c0a148-c273-11ea-b3de-0242ac130004 */
> +static const u8 rpa_resolution_uuid[16] = {
> +       0x04, 0x00, 0x13, 0xac, 0x42, 0x02, 0xde, 0xb3,
> +       0xea, 0x11, 0x73, 0xc2, 0x48, 0xa1, 0xc0, 0x15,
> +};
> +
>  static int read_exp_features_info(struct sock *sk, struct hci_dev *hdev,
>                                   void *data, u16 data_len)
>  {
> -       char buf[44];
> +       char buf[62];   /* Enough space for 3 features */
>         struct mgmt_rp_read_exp_features_info *rp = (void *)buf;
>         u16 idx = 0;
>         u32 flags;
> @@ -3795,6 +3806,17 @@ static int read_exp_features_info(struct sock *sk, struct hci_dev *hdev,
>                 idx++;
>         }
>
> +       if (hdev && use_ll_privacy(hdev)) {
> +               if (hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
> +                       flags = BIT(0) | BIT(1);
> +               else
> +                       flags = BIT(1);
> +
> +               memcpy(rp->features[idx].uuid, rpa_resolution_uuid, 16);
> +               rp->features[idx].flags = cpu_to_le32(flags);
> +               idx++;
> +       }
> +
>         rp->feature_count = cpu_to_le16(idx);
>
>         /* After reading the experimental features information, enable
> @@ -3807,6 +3829,21 @@ static int read_exp_features_info(struct sock *sk, struct hci_dev *hdev,
>                                  0, rp, sizeof(*rp) + (20 * idx));
>  }
>
> +static int exp_ll_privacy_feature_changed(bool enabled, struct hci_dev *hdev,
> +                                         struct sock *skip)
> +{
> +       struct mgmt_ev_exp_feature_changed ev;
> +
> +       memset(&ev, 0, sizeof(ev));
> +       memcpy(ev.uuid, rpa_resolution_uuid, 16);
> +       ev.flags = cpu_to_le32((enabled ? BIT(0) : 0) | BIT(1));
> +
> +       return mgmt_limited_event(MGMT_EV_EXP_FEATURE_CHANGED, hdev,
> +                                 &ev, sizeof(ev),
> +                                 HCI_MGMT_EXP_FEATURE_EVENTS, skip);
> +
> +}
> +
>  #ifdef CONFIG_BT_FEATURE_DEBUG
>  static int exp_debug_feature_changed(bool enabled, struct sock *skip)
>  {
> @@ -3845,6 +3882,16 @@ static int set_exp_feature(struct sock *sk, struct hci_dev *hdev,
>                 }
>  #endif
>
> +               if (hdev && use_ll_privacy(hdev) && !hdev_is_powered(hdev)) {
> +                       bool changed = hci_dev_test_flag(hdev,
> +                                                        HCI_ENABLE_LL_PRIVACY);
> +
> +                       hci_dev_clear_flag(hdev, HCI_ENABLE_LL_PRIVACY);
> +
> +                       if (changed)
> +                               exp_ll_privacy_feature_changed(false, hdev, sk);
> +               }
> +
>                 hci_sock_set_flag(sk, HCI_MGMT_EXP_FEATURE_EVENTS);
>
>                 return mgmt_cmd_complete(sk, hdev ? hdev->id : MGMT_INDEX_NONE,
> @@ -3895,6 +3942,69 @@ static int set_exp_feature(struct sock *sk, struct hci_dev *hdev,
>         }
>  #endif
>
> +       if (!memcmp(cp->uuid, rpa_resolution_uuid, 16)) {
> +               bool val, changed;
> +               int err;
> +               u32 flags;
> +
> +               /* Command requires to use the controller index */
> +               if (!hdev)
> +                       return mgmt_cmd_status(sk, MGMT_INDEX_NONE,
> +                                              MGMT_OP_SET_EXP_FEATURE,
> +                                              MGMT_STATUS_INVALID_INDEX);
> +
> +               /* Changes can only be made when controller is powered down */
> +               if (hdev_is_powered(hdev))
> +                       return mgmt_cmd_status(sk, hdev->id,
> +                                              MGMT_OP_SET_EXP_FEATURE,
> +                                              MGMT_STATUS_NOT_POWERED);
> +
> +               /* Parameters are limited to a single octet */
> +               if (data_len != MGMT_SET_EXP_FEATURE_SIZE + 1)
> +                       return mgmt_cmd_status(sk, hdev->id,
> +                                              MGMT_OP_SET_EXP_FEATURE,
> +                                              MGMT_STATUS_INVALID_PARAMS);
> +
> +               /* Only boolean on/off is supported */
> +               if (cp->param[0] != 0x00 && cp->param[0] != 0x01)
> +                       return mgmt_cmd_status(sk, hdev->id,
> +                                              MGMT_OP_SET_EXP_FEATURE,
> +                                              MGMT_STATUS_INVALID_PARAMS);
> +
> +               val = !!cp->param[0];
> +
> +               if (val) {
> +                       changed = !hci_dev_test_flag(hdev,
> +                                                    HCI_ENABLE_LL_PRIVACY);
> +                       hci_dev_set_flag(hdev, HCI_ENABLE_LL_PRIVACY);
> +                       hci_dev_clear_flag(hdev, HCI_ADVERTISING);
> +
> +                       /* Enable LL privacy + supported settings changed */
> +                       flags = BIT(0) | BIT(1);
> +               } else {
> +                       changed = hci_dev_test_flag(hdev,
> +                                                   HCI_ENABLE_LL_PRIVACY);
> +                       hci_dev_clear_flag(hdev, HCI_ENABLE_LL_PRIVACY);
> +
> +                       /* Disable LL privacy + supported settings changed */
> +                       flags = BIT(1);
> +               }
> +
> +               memcpy(rp.uuid, rpa_resolution_uuid, 16);
> +               rp.flags = cpu_to_le32(flags);
> +
> +               hci_sock_set_flag(sk, HCI_MGMT_EXP_FEATURE_EVENTS);
> +
> +               err = mgmt_cmd_complete(sk, hdev->id,
> +                                       MGMT_OP_SET_EXP_FEATURE, 0,
> +                                       &rp, sizeof(rp));
> +
> +               if (changed)
> +                       exp_ll_privacy_feature_changed(val, hdev, sk);
> +
> +               return err;
> +       }
> +
>         return mgmt_cmd_status(sk, hdev ? hdev->id : MGMT_INDEX_NONE,
>                                MGMT_OP_SET_EXP_FEATURE,
>                                MGMT_STATUS_NOT_SUPPORTED);
> @@ -5040,6 +5150,13 @@ static int set_advertising(struct sock *sk, struct hci_dev *hdev, void *data,
>                 return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_ADVERTISING,
>                                        status);
>
> +       /* Enabling the experimental LL Privay support disables support for
> +        * advertising.
> +        */
> +       if (hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
> +               return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_ADVERTISING,
> +                                      MGMT_STATUS_NOT_SUPPORTED);
> +
>         if (cp->val != 0x00 && cp->val != 0x01 && cp->val != 0x02)
>                 return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_ADVERTISING,
>                                        MGMT_STATUS_INVALID_PARAMS);
> @@ -7112,6 +7229,13 @@ static int read_adv_features(struct sock *sk, struct hci_dev *hdev,
>                 return mgmt_cmd_status(sk, hdev->id, MGMT_OP_READ_ADV_FEATURES,
>                                        MGMT_STATUS_REJECTED);
>
> +       /* Enabling the experimental LL Privay support disables support for
> +        * advertising.
> +        */
> +       if (hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
> +               return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_ADVERTISING,
> +                                      MGMT_STATUS_NOT_SUPPORTED);
> +
>         hci_dev_lock(hdev);
>
>         rp_len = sizeof(*rp) + hdev->adv_instance_cnt;
> @@ -7315,6 +7439,13 @@ static int add_advertising(struct sock *sk, struct hci_dev *hdev,
>                 return mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_ADVERTISING,
>                                        status);
>
> +       /* Enabling the experimental LL Privay support disables support for
> +        * advertising.
> +        */
> +       if (hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
> +               return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_ADVERTISING,
> +                                      MGMT_STATUS_NOT_SUPPORTED);
> +
>         if (cp->instance < 1 || cp->instance > HCI_MAX_ADV_INSTANCES)
>                 return mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_ADVERTISING,
>                                        MGMT_STATUS_INVALID_PARAMS);
> @@ -7479,6 +7610,13 @@ static int remove_advertising(struct sock *sk, struct hci_dev *hdev,
>
>         bt_dev_dbg(hdev, "sock %p", sk);
>
> +       /* Enabling the experimental LL Privay support disables support for
> +        * advertising.
> +        */
> +       if (hci_dev_test_flag(hdev, HCI_ENABLE_LL_PRIVACY))
> +               return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_ADVERTISING,
> +                                      MGMT_STATUS_NOT_SUPPORTED);
> +
>         hci_dev_lock(hdev);
>
>         if (cp->instance && !hci_find_adv_instance(hdev, cp->instance)) {
> --
> 2.26.2
>

Regards
Sathish N
