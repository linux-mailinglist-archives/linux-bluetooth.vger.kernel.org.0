Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46FD557E7E3
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Jul 2022 22:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235780AbiGVUGz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 Jul 2022 16:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbiGVUGy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 Jul 2022 16:06:54 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1D182458;
        Fri, 22 Jul 2022 13:06:53 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id t3so7103818edd.0;
        Fri, 22 Jul 2022 13:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h33DWScFh1QkhKn65ZUvRBc/+pGJas3tHhgGg8g80EI=;
        b=TwFacgt3OP9WJbWGCz6zXbqT7bCuUqvg06XeugEYxCpoDUYdgo6XwU3b+sUkHRdd5H
         QegH269y56x1RbIZs4ENVQ8z9TJiZz7+D/kp29/xK6fi7eGhUQWPU3GeFUUSNgOwdQLJ
         +KstxkF9DB+YUtMRe4fipYTtp/DjJsSCnGTTqRweAkHgkS8xyieScWML2F3vVG/MFhjN
         R3zbACpXNKsCz4HiXoDqBkGqzVPBXr8B9nfv9KRVgh4cg9QRHX8aodo5MZF3lr+DJv5B
         AQ/QgCj30BNd/u32IJRInPx5AOzUb1HPyQ0rDVn5tL1PrITK+uOq510+Oj+MP1KUPg8b
         5jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h33DWScFh1QkhKn65ZUvRBc/+pGJas3tHhgGg8g80EI=;
        b=Xjk8DqSoeeE6U40WIZElmoExH7vxU/PUbSbd9zKPBZJXoIOtqAL7YZY7w+dfTrfmk9
         6j/T49oarmsnO0zqwDA3S2FQ3tynp6JeLR1rper6RKZHPJ6OKaxIUKIrti0VnALUC0mm
         wtbO1eohAEdYgwQUZznHmGXJXCZvSfVzAnEqpHqbh0EI0LNIcEHz8l6XPXgDXkVI8zeV
         MK0W3USmTVCFERjIvEutJwzI/aAe2olFPvu8XPWVp2aiNVScwhw+E9i3mNoB2/qi7LG6
         COXGiDSS3qZF8ptlWuNicMUIJnB1TdhV5BCqEsvyxPh+b7d0gxNFgCyWXGHANWmi9F0u
         dReA==
X-Gm-Message-State: AJIora+Mqex3qnutbbLB7rRun+CXd8VVesdguRv2NqdfuWXEShaQ5m2z
        XlEOrxWFtg82N0BOnoQ0F+WrGTn7FSU6e/3WWxQ=
X-Google-Smtp-Source: AGRyM1uYiWj9N+oodUPaygwJ4iG5NmI+sT6zcxsmIZrn0ZfmcyMrWuptJNIP7tGrIjE9CiT2JoNpIezRYbWSNjjwA10=
X-Received: by 2002:a05:6402:4390:b0:43a:bc4b:8ab4 with SMTP id
 o16-20020a056402439000b0043abc4b8ab4mr1413933edc.283.1658520411297; Fri, 22
 Jul 2022 13:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220722182248.1.I20e96c839200bb75cd6af80384f16c8c01498f57@changeid>
In-Reply-To: <20220722182248.1.I20e96c839200bb75cd6af80384f16c8c01498f57@changeid>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Fri, 22 Jul 2022 13:06:39 -0700
Message-ID: <CABBYNZ+k+ZOVNi+GYgdiK+B+tqKQXTWYp1QG4JSE_7EwZHNBMw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_sync: Use safe loop when adding accept list
To:     Archie Pusaka <apusaka@google.com>
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>,
        Zhengping Jiang <jiangzp@google.com>,
        Michael Sun <michaelfsun@google.com>,
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Archie,

On Fri, Jul 22, 2022 at 3:23 AM Archie Pusaka <apusaka@google.com> wrote:
>
> From: Archie Pusaka <apusaka@chromium.org>
>
> When in the middle of adding accept list, the userspace can still
> remove devices, therefore causing crash if the removed device is
> the one being processed.
>
> Use a safe loop mechanism to guard against deletion while iterating
> the pending items.
>
> Below is a sample btsnoop log when user enters wrong passkey when
> pairing a LE keyboard and the corresponding stacktrace.
> @ MGMT Event: Command Complete (0x0001) plen 10
>       Add Device (0x0033) plen 7
>         Status: Success (0x00)
>         LE Address: CA:CA:BD:78:37:F9 (Static)
> < HCI Command: LE Add Device To Accept List (0x08|0x0011) plen 7
>         Address type: Random (0x01)
>         Address: CA:CA:BD:78:37:F9 (Static)
> @ MGMT Event: Device Removed (0x001b) plen 7
>         LE Address: CA:CA:BD:78:37:F9 (Static)
> > HCI Event: Command Complete (0x0e) plen 4
>       LE Add Device To Accept List (0x08|0x0011) ncmd 1
>         Status: Success (0x00)
>
> [  167.409813] Call trace:
> [  167.409983]  hci_le_add_accept_list_sync+0x64/0x26c
> [  167.410150]  hci_update_passive_scan_sync+0x5f0/0x6dc
> [  167.410318]  add_device_sync+0x18/0x24
> [  167.410486]  hci_cmd_sync_work+0xe8/0x150
> [  167.410509]  process_one_work+0x140/0x4d0
> [  167.410526]  worker_thread+0x134/0x2e4
> [  167.410544]  kthread+0x148/0x160
> [  167.410562]  ret_from_fork+0x10/0x30
>
> Signed-off-by: Archie Pusaka <apusaka@chromium.org>
> Reviewed-by: Zhengping Jiang <jiangzp@google.com>
> Reviewed-by: Michael Sun <michaelfsun@google.com>
>
> ---
>
>  net/bluetooth/hci_sync.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 3067d94e7a8e..8e843d34f7de 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -1863,7 +1863,7 @@ struct sk_buff *hci_read_local_oob_data_sync(struct hci_dev *hdev,
>   */
>  static u8 hci_update_accept_list_sync(struct hci_dev *hdev)
>  {
> -       struct hci_conn_params *params;
> +       struct hci_conn_params *params, *tmp;
>         struct bdaddr_list *b, *t;
>         u8 num_entries = 0;
>         bool pend_conn, pend_report;
> @@ -1930,7 +1930,7 @@ static u8 hci_update_accept_list_sync(struct hci_dev *hdev)
>          * just abort and return filer policy value to not use the
>          * accept list.
>          */
> -       list_for_each_entry(params, &hdev->pend_le_conns, action) {
> +       list_for_each_entry_safe(params, tmp, &hdev->pend_le_conns, action) {
>                 err = hci_le_add_accept_list_sync(hdev, params, &num_entries);
>                 if (err)
>                         goto done;
> @@ -1940,7 +1940,7 @@ static u8 hci_update_accept_list_sync(struct hci_dev *hdev)
>          * the list of pending reports and also add these to the
>          * accept list if there is still space. Abort if space runs out.
>          */
> -       list_for_each_entry(params, &hdev->pend_le_reports, action) {
> +       list_for_each_entry_safe(params, tmp, &hdev->pend_le_reports, action) {
>                 err = hci_le_add_accept_list_sync(hdev, params, &num_entries);
>                 if (err)
>                         goto done;

Hmm if this happens it means other threads are actually interfering
with cmd_sync queue which is something that is probably a bug since
the whole point of cmd_sync is to serialize the commands making it
easier to do more complex state updates (such accept+resolve list
updates), we could perhaps still apply this change as a workaround but
ultimately I think it would be better to add a mgmt-tester reproducing
the issue and have a proper fix of the code updating the list from a
different thread.

> --
> 2.37.1.359.gd136c6c3e2-goog
>


-- 
Luiz Augusto von Dentz
