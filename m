Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7DB5347AC
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 May 2022 02:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241521AbiEZAqP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 May 2022 20:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242220AbiEZAqN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 May 2022 20:46:13 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D76713D;
        Wed, 25 May 2022 17:46:10 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id l9-20020a056830268900b006054381dd35so68801otu.4;
        Wed, 25 May 2022 17:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=30bg4htc+GqeVawYTVf2uP3UU/3aL7/8QbHqn1X0cFA=;
        b=F8K8u1irb3tsWKbvW/NRT8if7RznVwcwltZUHNhA7Qh1joteGdVEdTLCAbu7bwUKaE
         2v34Z4ARa8Yitz4D6s7fTRJAe9C/8HUG56jBGSt4PwIMZOM6vqnqVO3TyaE0kFYIjjK5
         RHPbmRy3IdukleSVeEM66XUZTQDgNUDfcR4zeKYkaa1uu+acImoQxivZDJDjeJp0MgLQ
         GS3Op78r8qXHSOzD59agjgl8WjKZUknmU4OaN1NcG3pWWOQeOHKuj4s9BvYf9nGuRxXv
         8BZ1KCi9oxnuu3We0I7t7dateh6n8URXeLgMbds5cH20m6HnP5pMI0aCy75M16xiYtBx
         OnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=30bg4htc+GqeVawYTVf2uP3UU/3aL7/8QbHqn1X0cFA=;
        b=aOhqaf8hBnlj5Ko8twQj6Qf+idLtfH8v/HbOU5l6Dqctzub2d/aRnsO1RmLqikBSEx
         58rl3kS93/W2F8JY5oiT82KI/so5IB5+15NpT45ajVv/a/YvKyFKGBHaBeeJSFSO0YLm
         AMfJDeaXi3o2Nzh9RLE4CC52u0VNpS28etQOlSpYWtiAocMflyJyPddDpQPAaqHujA/u
         hsg+/NPn6FEKdBmhzwPZQLwxmNt7TKgiCOAWD4Nre3Mu9/XGYRzL35IjLx3PTjbjfMfW
         az5kKIIFr7rdkbFGMv1cGugZKqCmZkyI8jomBucsYRUekMwytwETUnUE2kXw2PE1hY6o
         Y1qA==
X-Gm-Message-State: AOAM530x6taTG4jsgyz0qsey/xqRY8zXt2MI7svkCm5mTChIwwRr5YLa
        e4URkIKtow4B5XLk0ZdWC/yvlsWRFIDEnmY2i1k=
X-Google-Smtp-Source: ABdhPJzavCLAfO/RpAsY/gUw9wphiQ00Lo81kRgipFgb5Fv1EuVxY+R7IOo4dc1HSWfV7tIB/FZVVaFP6u1tYf4wRcw=
X-Received: by 2002:a05:6830:2647:b0:60b:22cc:a9c2 with SMTP id
 f7-20020a056830264700b0060b22cca9c2mr4451483otu.324.1653525969668; Wed, 25
 May 2022 17:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220524131406.1.If745ed1d05d98c002fc84ba60cef99eb786b7caa@changeid>
In-Reply-To: <20220524131406.1.If745ed1d05d98c002fc84ba60cef99eb786b7caa@changeid>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 25 May 2022 17:45:56 -0700
Message-ID: <CABBYNZ+Z7j0VjNQitBRwpJDTGv=sJoj9jgKECtGEcQA2h3FUWg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Bluetooth: hci_sync: Refactor add Adv Monitor
To:     Manish Mandlik <mmandlik@google.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        ChromeOS Bluetooth Upstreaming 
        <chromeos-bluetooth-upstreaming@chromium.org>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Miao-chen Chou <mcchou@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Manish,

On Tue, May 24, 2022 at 1:14 PM Manish Mandlik <mmandlik@google.com> wrote:
>
> Make use of hci_cmd_sync_queue for adding an advertisement monitor.

Im a little lost here, it seems you end up not really using
hci_cmd_sync_queue are you assuming these functions are already run
from a safe context?

> Signed-off-by: Manish Mandlik <mmandlik@google.com>
> Reviewed-by: Miao-chen Chou <mcchou@google.com>
> ---
>
>  include/net/bluetooth/hci_core.h |   5 +-
>  net/bluetooth/hci_core.c         |  47 ++++-----
>  net/bluetooth/mgmt.c             | 121 +++++++----------------
>  net/bluetooth/msft.c             | 161 ++++++++-----------------------
>  4 files changed, 98 insertions(+), 236 deletions(-)
>
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
> index 5a52a2018b56..59953a7a6328 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -1410,10 +1410,8 @@ bool hci_adv_instance_is_scannable(struct hci_dev *hdev, u8 instance);
>
>  void hci_adv_monitors_clear(struct hci_dev *hdev);
>  void hci_free_adv_monitor(struct hci_dev *hdev, struct adv_monitor *monitor);
> -int hci_add_adv_patterns_monitor_complete(struct hci_dev *hdev, u8 status);
>  int hci_remove_adv_monitor_complete(struct hci_dev *hdev, u8 status);
> -bool hci_add_adv_monitor(struct hci_dev *hdev, struct adv_monitor *monitor,
> -                       int *err);
> +int hci_add_adv_monitor(struct hci_dev *hdev, struct adv_monitor *monitor);
>  bool hci_remove_single_adv_monitor(struct hci_dev *hdev, u16 handle, int *err);
>  bool hci_remove_all_adv_monitor(struct hci_dev *hdev, int *err);
>  bool hci_is_adv_monitoring(struct hci_dev *hdev);
> @@ -1875,7 +1873,6 @@ void mgmt_advertising_removed(struct sock *sk, struct hci_dev *hdev,
>                               u8 instance);
>  void mgmt_adv_monitor_removed(struct hci_dev *hdev, u16 handle);
>  int mgmt_phy_configuration_changed(struct hci_dev *hdev, struct sock *skip);
> -int mgmt_add_adv_patterns_monitor_complete(struct hci_dev *hdev, u8 status);
>  int mgmt_remove_adv_monitor_complete(struct hci_dev *hdev, u8 status);
>  void mgmt_adv_monitor_device_lost(struct hci_dev *hdev, u16 handle,
>                                   bdaddr_t *bdaddr, u8 addr_type);
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 5abb2ca5b129..bbbbe3203130 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -1873,11 +1873,6 @@ void hci_free_adv_monitor(struct hci_dev *hdev, struct adv_monitor *monitor)
>         kfree(monitor);
>  }
>
> -int hci_add_adv_patterns_monitor_complete(struct hci_dev *hdev, u8 status)
> -{
> -       return mgmt_add_adv_patterns_monitor_complete(hdev, status);
> -}
> -
>  int hci_remove_adv_monitor_complete(struct hci_dev *hdev, u8 status)
>  {
>         return mgmt_remove_adv_monitor_complete(hdev, status);
> @@ -1885,49 +1880,49 @@ int hci_remove_adv_monitor_complete(struct hci_dev *hdev, u8 status)
>
>  /* Assigns handle to a monitor, and if offloading is supported and power is on,
>   * also attempts to forward the request to the controller.
> - * Returns true if request is forwarded (result is pending), false otherwise.
> - * This function requires the caller holds hdev->lock.
>   */
> -bool hci_add_adv_monitor(struct hci_dev *hdev, struct adv_monitor *monitor,
> -                        int *err)
> +int hci_add_adv_monitor(struct hci_dev *hdev, struct adv_monitor *monitor)
>  {
>         int min, max, handle;
> +       int status = 0;
>
> -       *err = 0;
> +       if (!monitor)
> +               return -EINVAL;
>
> -       if (!monitor) {
> -               *err = -EINVAL;
> -               return false;
> -       }
> +       hci_dev_lock(hdev);
>
>         min = HCI_MIN_ADV_MONITOR_HANDLE;
>         max = HCI_MIN_ADV_MONITOR_HANDLE + HCI_MAX_ADV_MONITOR_NUM_HANDLES;
>         handle = idr_alloc(&hdev->adv_monitors_idr, monitor, min, max,
>                            GFP_KERNEL);
> -       if (handle < 0) {
> -               *err = handle;
> -               return false;
> -       }
> +
> +       hci_dev_unlock(hdev);
> +
> +       if (handle < 0)
> +               return handle;
>
>         monitor->handle = handle;
>
>         if (!hdev_is_powered(hdev))
> -               return false;
> +               return status;
>
>         switch (hci_get_adv_monitor_offload_ext(hdev)) {
>         case HCI_ADV_MONITOR_EXT_NONE:
> -               hci_update_passive_scan(hdev);
> -               bt_dev_dbg(hdev, "%s add monitor status %d", hdev->name, *err);
> +               bt_dev_dbg(hdev, "%s add monitor %d status %d", hdev->name,
> +                          monitor->handle, status);
>                 /* Message was not forwarded to controller - not an error */
> -               return false;
> +               break;
> +
>         case HCI_ADV_MONITOR_EXT_MSFT:
> -               *err = msft_add_monitor_pattern(hdev, monitor);
> -               bt_dev_dbg(hdev, "%s add monitor msft status %d", hdev->name,
> -                          *err);
> +               hci_req_sync_lock(hdev);
> +               status = msft_add_monitor_pattern(hdev, monitor);
> +               hci_req_sync_unlock(hdev);
> +               bt_dev_dbg(hdev, "%s add monitor %d msft status %d", hdev->name,
> +                          monitor->handle, status);
>                 break;
>         }
>
> -       return (*err == 0);
> +       return status;
>  }
>
>  /* Attempts to tell the controller and free the monitor. If somehow the
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 74937a834648..d04f90698a87 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -4653,75 +4653,21 @@ static int read_adv_mon_features(struct sock *sk, struct hci_dev *hdev,
>         return err;
>  }
>
> -int mgmt_add_adv_patterns_monitor_complete(struct hci_dev *hdev, u8 status)
> -{
> -       struct mgmt_rp_add_adv_patterns_monitor rp;
> -       struct mgmt_pending_cmd *cmd;
> -       struct adv_monitor *monitor;
> -       int err = 0;
> -
> -       hci_dev_lock(hdev);
> -
> -       cmd = pending_find(MGMT_OP_ADD_ADV_PATTERNS_MONITOR_RSSI, hdev);
> -       if (!cmd) {
> -               cmd = pending_find(MGMT_OP_ADD_ADV_PATTERNS_MONITOR, hdev);
> -               if (!cmd)
> -                       goto done;
> -       }
> -
> -       monitor = cmd->user_data;
> -       rp.monitor_handle = cpu_to_le16(monitor->handle);
> -
> -       if (!status) {
> -               mgmt_adv_monitor_added(cmd->sk, hdev, monitor->handle);
> -               hdev->adv_monitors_cnt++;
> -               if (monitor->state == ADV_MONITOR_STATE_NOT_REGISTERED)
> -                       monitor->state = ADV_MONITOR_STATE_REGISTERED;
> -               hci_update_passive_scan(hdev);
> -       }
> -
> -       err = mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> -                               mgmt_status(status), &rp, sizeof(rp));
> -       mgmt_pending_remove(cmd);
> -
> -done:
> -       hci_dev_unlock(hdev);
> -       bt_dev_dbg(hdev, "add monitor %d complete, status %u",
> -                  rp.monitor_handle, status);
> -
> -       return err;
> -}
> -
>  static int __add_adv_patterns_monitor(struct sock *sk, struct hci_dev *hdev,
> -                                     struct adv_monitor *m, u8 status,
> -                                     void *data, u16 len, u16 op)
> +                                     struct adv_monitor *m, void *data,
> +                                     u16 len, u16 op)
>  {
>         struct mgmt_rp_add_adv_patterns_monitor rp;
> -       struct mgmt_pending_cmd *cmd;
> +       u8 status = MGMT_STATUS_SUCCESS;
>         int err;
> -       bool pending;
> -
> -       hci_dev_lock(hdev);
> -
> -       if (status)
> -               goto unlock;
>
>         if (pending_find(MGMT_OP_SET_LE, hdev) ||
> -           pending_find(MGMT_OP_ADD_ADV_PATTERNS_MONITOR, hdev) ||
> -           pending_find(MGMT_OP_ADD_ADV_PATTERNS_MONITOR_RSSI, hdev) ||
>             pending_find(MGMT_OP_REMOVE_ADV_MONITOR, hdev)) {
>                 status = MGMT_STATUS_BUSY;
> -               goto unlock;
> -       }
> -
> -       cmd = mgmt_pending_add(sk, op, hdev, data, len);
> -       if (!cmd) {
> -               status = MGMT_STATUS_NO_RESOURCES;
> -               goto unlock;
> +               goto done;
>         }
>
> -       cmd->user_data = m;
> -       pending = hci_add_adv_monitor(hdev, m, &err);
> +       err = hci_add_adv_monitor(hdev, m);
>         if (err) {
>                 if (err == -ENOSPC || err == -ENOMEM)
>                         status = MGMT_STATUS_NO_RESOURCES;
> @@ -4730,30 +4676,29 @@ static int __add_adv_patterns_monitor(struct sock *sk, struct hci_dev *hdev,
>                 else
>                         status = MGMT_STATUS_FAILED;
>
> -               mgmt_pending_remove(cmd);
> -               goto unlock;
> +               goto done;
>         }
>
> -       if (!pending) {
> -               mgmt_pending_remove(cmd);
> -               rp.monitor_handle = cpu_to_le16(m->handle);
> -               mgmt_adv_monitor_added(sk, hdev, m->handle);
> -               m->state = ADV_MONITOR_STATE_REGISTERED;
> -               hdev->adv_monitors_cnt++;
> +       hci_dev_lock(hdev);
>
> -               hci_dev_unlock(hdev);
> -               return mgmt_cmd_complete(sk, hdev->id, op, MGMT_STATUS_SUCCESS,
> -                                        &rp, sizeof(rp));
> -       }
> +       rp.monitor_handle = cpu_to_le16(m->handle);
> +       mgmt_adv_monitor_added(sk, hdev, m->handle);
> +       if (m->state == ADV_MONITOR_STATE_NOT_REGISTERED)
> +               m->state = ADV_MONITOR_STATE_REGISTERED;
> +       hdev->adv_monitors_cnt++;
> +       hci_update_passive_scan(hdev);
>
>         hci_dev_unlock(hdev);
>
> -       return 0;
> +done:
> +       bt_dev_dbg(hdev, "add monitor %d complete, status %u", m->handle,
> +                  status);
>
> -unlock:
> -       hci_free_adv_monitor(hdev, m);
> -       hci_dev_unlock(hdev);
> -       return mgmt_cmd_status(sk, hdev->id, op, status);
> +       if (status)
> +               return mgmt_cmd_status(sk, hdev->id, op, status);
> +
> +       return mgmt_cmd_complete(sk, hdev->id, op, MGMT_STATUS_SUCCESS, &rp,
> +                                sizeof(rp));
>  }
>
>  static void parse_adv_monitor_rssi(struct adv_monitor *m,
> @@ -4817,7 +4762,7 @@ static int add_adv_patterns_monitor(struct sock *sk, struct hci_dev *hdev,
>  {
>         struct mgmt_cp_add_adv_patterns_monitor *cp = data;
>         struct adv_monitor *m = NULL;
> -       u8 status = MGMT_STATUS_SUCCESS;
> +       int status = MGMT_STATUS_SUCCESS;
>         size_t expected_size = sizeof(*cp);
>
>         BT_DBG("request for %s", hdev->name);
> @@ -4843,10 +4788,14 @@ static int add_adv_patterns_monitor(struct sock *sk, struct hci_dev *hdev,
>
>         parse_adv_monitor_rssi(m, NULL);
>         status = parse_adv_monitor_pattern(m, cp->pattern_count, cp->patterns);
> +       if (status)
> +               goto done;
> +
> +       status = __add_adv_patterns_monitor(sk, hdev, m, data, len,
> +                                           MGMT_OP_ADD_ADV_PATTERNS_MONITOR);
>
>  done:
> -       return __add_adv_patterns_monitor(sk, hdev, m, status, data, len,
> -                                         MGMT_OP_ADD_ADV_PATTERNS_MONITOR);
> +       return status;
>  }
>
>  static int add_adv_patterns_monitor_rssi(struct sock *sk, struct hci_dev *hdev,
> @@ -4854,7 +4803,7 @@ static int add_adv_patterns_monitor_rssi(struct sock *sk, struct hci_dev *hdev,
>  {
>         struct mgmt_cp_add_adv_patterns_monitor_rssi *cp = data;
>         struct adv_monitor *m = NULL;
> -       u8 status = MGMT_STATUS_SUCCESS;
> +       int status = MGMT_STATUS_SUCCESS;
>         size_t expected_size = sizeof(*cp);
>
>         BT_DBG("request for %s", hdev->name);
> @@ -4880,10 +4829,14 @@ static int add_adv_patterns_monitor_rssi(struct sock *sk, struct hci_dev *hdev,
>
>         parse_adv_monitor_rssi(m, &cp->rssi);
>         status = parse_adv_monitor_pattern(m, cp->pattern_count, cp->patterns);
> +       if (status)
> +               goto done;
>
> -done:
> -       return __add_adv_patterns_monitor(sk, hdev, m, status, data, len,
> +       status = __add_adv_patterns_monitor(sk, hdev, m, data, len,
>                                          MGMT_OP_ADD_ADV_PATTERNS_MONITOR_RSSI);
> +
> +done:
> +       return status;
>  }
>
>  int mgmt_remove_adv_monitor_complete(struct hci_dev *hdev, u8 status)
> @@ -4933,9 +4886,7 @@ static int remove_adv_monitor(struct sock *sk, struct hci_dev *hdev,
>         hci_dev_lock(hdev);
>
>         if (pending_find(MGMT_OP_SET_LE, hdev) ||
> -           pending_find(MGMT_OP_REMOVE_ADV_MONITOR, hdev) ||
> -           pending_find(MGMT_OP_ADD_ADV_PATTERNS_MONITOR, hdev) ||
> -           pending_find(MGMT_OP_ADD_ADV_PATTERNS_MONITOR_RSSI, hdev)) {
> +           pending_find(MGMT_OP_REMOVE_ADV_MONITOR, hdev)) {
>                 status = MGMT_STATUS_BUSY;
>                 goto unlock;
>         }
> diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
> index f43994523b1f..9abea16c4305 100644
> --- a/net/bluetooth/msft.c
> +++ b/net/bluetooth/msft.c
> @@ -106,8 +106,6 @@ struct msft_data {
>         __u8 filter_enabled;
>  };
>
> -static int __msft_add_monitor_pattern(struct hci_dev *hdev,
> -                                     struct adv_monitor *monitor);
>  static int __msft_remove_monitor(struct hci_dev *hdev,
>                                  struct adv_monitor *monitor, u16 handle);
>
> @@ -164,34 +162,6 @@ static bool read_supported_features(struct hci_dev *hdev,
>         return false;
>  }
>
> -static void reregister_monitor(struct hci_dev *hdev, int handle)
> -{
> -       struct adv_monitor *monitor;
> -       struct msft_data *msft = hdev->msft_data;
> -       int err;
> -
> -       while (1) {
> -               monitor = idr_get_next(&hdev->adv_monitors_idr, &handle);
> -               if (!monitor) {
> -                       /* All monitors have been resumed */
> -                       msft->resuming = false;
> -                       hci_update_passive_scan(hdev);
> -                       return;
> -               }
> -
> -               msft->pending_add_handle = (u16)handle;
> -               err = __msft_add_monitor_pattern(hdev, monitor);
> -
> -               /* If success, we return and wait for monitor added callback */
> -               if (!err)
> -                       return;
> -
> -               /* Otherwise remove the monitor and keep registering */
> -               hci_free_adv_monitor(hdev, monitor);
> -               handle++;
> -       }
> -}
> -
>  /* is_mgmt = true matches the handle exposed to userspace via mgmt.
>   * is_mgmt = false matches the handle used by the msft controller.
>   * This function requires the caller holds hdev->lock
> @@ -243,14 +213,14 @@ static int msft_monitor_device_del(struct hci_dev *hdev, __u16 mgmt_handle,
>         return count;
>  }
>
> -static void msft_le_monitor_advertisement_cb(struct hci_dev *hdev,
> -                                            u8 status, u16 opcode,
> -                                            struct sk_buff *skb)
> +static int msft_le_monitor_advertisement_cb(struct hci_dev *hdev, u16 opcode,
> +                                           struct sk_buff *skb)
>  {
>         struct msft_rp_le_monitor_advertisement *rp;
>         struct adv_monitor *monitor;
>         struct msft_monitor_advertisement_handle_data *handle_data;
>         struct msft_data *msft = hdev->msft_data;
> +       int status = 0;
>
>         hci_dev_lock(hdev);
>
> @@ -262,15 +232,16 @@ static void msft_le_monitor_advertisement_cb(struct hci_dev *hdev,
>                 goto unlock;
>         }
>
> -       if (status)
> -               goto unlock;
> -
>         rp = (struct msft_rp_le_monitor_advertisement *)skb->data;
>         if (skb->len < sizeof(*rp)) {
>                 status = HCI_ERROR_UNSPECIFIED;
>                 goto unlock;
>         }
>
> +       status = rp->status;
> +       if (status)
> +               goto unlock;
> +
>         handle_data = kmalloc(sizeof(*handle_data), GFP_KERNEL);
>         if (!handle_data) {
>                 status = HCI_ERROR_UNSPECIFIED;
> @@ -290,8 +261,7 @@ static void msft_le_monitor_advertisement_cb(struct hci_dev *hdev,
>
>         hci_dev_unlock(hdev);
>
> -       if (!msft->resuming)
> -               hci_add_adv_patterns_monitor_complete(hdev, status);
> +       return status;
>  }
>
>  static void msft_le_cancel_monitor_advertisement_cb(struct hci_dev *hdev,
> @@ -463,7 +433,7 @@ static int msft_add_monitor_sync(struct hci_dev *hdev,
>         ptrdiff_t offset = 0;
>         u8 pattern_count = 0;
>         struct sk_buff *skb;
> -       u8 status;
> +       struct msft_data *msft = hdev->msft_data;
>
>         if (!msft_monitor_pattern_valid(monitor))
>                 return -EINVAL;
> @@ -505,20 +475,40 @@ static int msft_add_monitor_sync(struct hci_dev *hdev,
>         if (IS_ERR(skb))
>                 return PTR_ERR(skb);
>
> -       status = skb->data[0];
> -       skb_pull(skb, 1);
> +       msft->pending_add_handle = monitor->handle;
>
> -       msft_le_monitor_advertisement_cb(hdev, status, hdev->msft_opcode, skb);
> +       return msft_le_monitor_advertisement_cb(hdev, hdev->msft_opcode, skb);
> +}
>
> -       return status;
> +static void reregister_monitor(struct hci_dev *hdev)
> +{
> +       struct adv_monitor *monitor;
> +       struct msft_data *msft = hdev->msft_data;
> +       int handle = 0;
> +
> +       if (!msft)
> +               return;
> +
> +       msft->resuming = true;
> +
> +       while (1) {
> +               monitor = idr_get_next(&hdev->adv_monitors_idr, &handle);
> +               if (!monitor)
> +                       break;
> +
> +               msft_add_monitor_sync(hdev, monitor);
> +
> +               handle++;
> +       }
> +
> +       /* All monitors have been reregistered */
> +       msft->resuming = false;
>  }
>
>  /* This function requires the caller holds hci_req_sync_lock */
>  int msft_resume_sync(struct hci_dev *hdev)
>  {
>         struct msft_data *msft = hdev->msft_data;
> -       struct adv_monitor *monitor;
> -       int handle = 0;
>
>         if (!msft || !msft_monitor_supported(hdev))
>                 return 0;
> @@ -533,24 +523,12 @@ int msft_resume_sync(struct hci_dev *hdev)
>
>         hci_dev_unlock(hdev);
>
> -       msft->resuming = true;
> -
> -       while (1) {
> -               monitor = idr_get_next(&hdev->adv_monitors_idr, &handle);
> -               if (!monitor)
> -                       break;
> -
> -               msft_add_monitor_sync(hdev, monitor);
> -
> -               handle++;
> -       }
> -
> -       /* All monitors have been resumed */
> -       msft->resuming = false;
> +       reregister_monitor(hdev);
>
>         return 0;
>  }
>
> +/* This function requires the caller holds hci_req_sync_lock */
>  void msft_do_open(struct hci_dev *hdev)
>  {
>         struct msft_data *msft = hdev->msft_data;
> @@ -583,7 +561,7 @@ void msft_do_open(struct hci_dev *hdev)
>                 /* Monitors get removed on power off, so we need to explicitly
>                  * tell the controller to re-monitor.
>                  */
> -               reregister_monitor(hdev, 0);
> +               reregister_monitor(hdev);
>         }
>  }
>
> @@ -829,66 +807,7 @@ static void msft_le_set_advertisement_filter_enable_cb(struct hci_dev *hdev,
>         hci_dev_unlock(hdev);
>  }
>
> -/* This function requires the caller holds hdev->lock */
> -static int __msft_add_monitor_pattern(struct hci_dev *hdev,
> -                                     struct adv_monitor *monitor)
> -{
> -       struct msft_cp_le_monitor_advertisement *cp;
> -       struct msft_le_monitor_advertisement_pattern_data *pattern_data;
> -       struct msft_le_monitor_advertisement_pattern *pattern;
> -       struct adv_pattern *entry;
> -       struct hci_request req;
> -       struct msft_data *msft = hdev->msft_data;
> -       size_t total_size = sizeof(*cp) + sizeof(*pattern_data);
> -       ptrdiff_t offset = 0;
> -       u8 pattern_count = 0;
> -       int err = 0;
> -
> -       if (!msft_monitor_pattern_valid(monitor))
> -               return -EINVAL;
> -
> -       list_for_each_entry(entry, &monitor->patterns, list) {
> -               pattern_count++;
> -               total_size += sizeof(*pattern) + entry->length;
> -       }
> -
> -       cp = kmalloc(total_size, GFP_KERNEL);
> -       if (!cp)
> -               return -ENOMEM;
> -
> -       cp->sub_opcode = MSFT_OP_LE_MONITOR_ADVERTISEMENT;
> -       cp->rssi_high = monitor->rssi.high_threshold;
> -       cp->rssi_low = monitor->rssi.low_threshold;
> -       cp->rssi_low_interval = (u8)monitor->rssi.low_threshold_timeout;
> -       cp->rssi_sampling_period = monitor->rssi.sampling_period;
> -
> -       cp->cond_type = MSFT_MONITOR_ADVERTISEMENT_TYPE_PATTERN;
> -
> -       pattern_data = (void *)cp->data;
> -       pattern_data->count = pattern_count;
> -
> -       list_for_each_entry(entry, &monitor->patterns, list) {
> -               pattern = (void *)(pattern_data->data + offset);
> -               /* the length also includes data_type and offset */
> -               pattern->length = entry->length + 2;
> -               pattern->data_type = entry->ad_type;
> -               pattern->start_byte = entry->offset;
> -               memcpy(pattern->pattern, entry->value, entry->length);
> -               offset += sizeof(*pattern) + entry->length;
> -       }
> -
> -       hci_req_init(&req, hdev);
> -       hci_req_add(&req, hdev->msft_opcode, total_size, cp);
> -       err = hci_req_run_skb(&req, msft_le_monitor_advertisement_cb);
> -       kfree(cp);
> -
> -       if (!err)
> -               msft->pending_add_handle = monitor->handle;
> -
> -       return err;
> -}
> -
> -/* This function requires the caller holds hdev->lock */
> +/* This function requires the caller holds hci_req_sync_lock */
>  int msft_add_monitor_pattern(struct hci_dev *hdev, struct adv_monitor *monitor)
>  {
>         struct msft_data *msft = hdev->msft_data;
> @@ -899,7 +818,7 @@ int msft_add_monitor_pattern(struct hci_dev *hdev, struct adv_monitor *monitor)
>         if (msft->resuming || msft->suspending)
>                 return -EBUSY;
>
> -       return __msft_add_monitor_pattern(hdev, monitor);
> +       return msft_add_monitor_sync(hdev, monitor);
>  }
>
>  /* This function requires the caller holds hdev->lock */
> --
> 2.36.1.124.g0e6072fb45-goog
>


-- 
Luiz Augusto von Dentz
