Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22CDC257FB0
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 Aug 2020 19:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgHaRhA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 Aug 2020 13:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbgHaRg7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 Aug 2020 13:36:59 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBD2C061575
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Aug 2020 10:36:58 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id u126so332113oif.13
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Aug 2020 10:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zbf92dZlH3/7ED8fn+BCMplp9D+b1oAEmWrpMrO/yy4=;
        b=rIRSSgnywAFi6jSB/48FKd4VjhckhDEvnr86SRPG9A2yxljJsYZd4u+D9hYge/4kTk
         Y5t1JNb5LakG9isGUST4qMEoNO6xrWcX7WpszgPJ5wyD8o6SujFKLmu6EhUOhDPXcvc8
         pNCXUqrR94rF9un9jf645m6tgpRGh7saEnxbkUL3O8dxpxnuxIPdsVmI4fryb/iW6I9a
         dNVrhB3gjR+6SF6I88jFQt7CftBdKAK2IGdrjk3G8xV5plUTpsUauXhjFVQiR1rXx1bl
         bJdCZtZGxRhWTScjZTGckIhzZ9tWGsO94xYLmeaTFq6O4mRYAj4zNHTA9iaqjZrTO4d6
         kPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zbf92dZlH3/7ED8fn+BCMplp9D+b1oAEmWrpMrO/yy4=;
        b=NS9SoSO+uMjJB2hU4gxZIqNaDIQ0SeeQrgxBf8oHceaKjTmF9FgO3uhO9+1sC4Ulpm
         0Wykg0dfLxHjyZPmRd+BmgPbrSTViH5sTOVlAqZwj+7N6T4wmNmYF/uaHoQFyGPrRAVF
         2RKPbL6ogQXEM0QHKy0MY01bliUsWVjJG3YyXFdYgivyrqrsPgved1SIWmNFnmspvfxg
         xCjTJVEMjJ54/2HKVFu846jYTiRFy/C2SeDrq0c+cG7uT/nATJ04xLtW2BWGWvaoODoY
         M6U8U2U9ddkSewo8Spv3L1WUDA4DzJfobfwKD5c2ktbZPVRkFU37WWBeJGGY2QXeIBL8
         MVig==
X-Gm-Message-State: AOAM531+QCAaAy1UshJAkCvZJNrnuuW4CWzhJW6dHlDrq6EIl72kJ4Ib
        UuJ1dQY1ypEv62kudfy9RlQ1dYWExXPRy3DQMGs=
X-Google-Smtp-Source: ABdhPJwKIe3rTpxJjotpg2TcjkqdFlTpTurdtWAcTCBEaWNfO6Yb0JR9s0CloHwBYUuDnoaAvrmV2SxSs2Yq//ixKFg=
X-Received: by 2002:a05:6808:913:: with SMTP id w19mr270455oih.48.1598895417630;
 Mon, 31 Aug 2020 10:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200829010210.871471-1-abhishekpandit@chromium.org> <20200828180157.Bluez.v3.1.I14a96397d181666c124e1c413b834428faf3db7a@changeid>
In-Reply-To: <20200828180157.Bluez.v3.1.I14a96397d181666c124e1c413b834428faf3db7a@changeid>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Mon, 31 Aug 2020 10:36:47 -0700
Message-ID: <CABBYNZJTr13-XK9KuXOD+UzB6_oSwefvpJ9ptPRf0dygdAhKHw@mail.gmail.com>
Subject: Re: [Bluez PATCH v3 1/3] mgmt: Add controller suspend and resume events
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        ChromeOS Bluetooth Upstreaming 
        <chromeos-bluetooth-upstreaming@chromium.org>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Sonny Sasaka <sonnysasaka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Abhishek,

On Fri, Aug 28, 2020 at 6:02 PM Abhishek Pandit-Subedi
<abhishekpandit@chromium.org> wrote:
>
> Add the controller suspend and resume events.
>
> Reviewed-by: Sonny Sasaka <sonnysasaka@chromium.org>
> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  lib/mgmt.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/lib/mgmt.h b/lib/mgmt.h
> index a800bcab4..46d894ae9 100644
> --- a/lib/mgmt.h
> +++ b/lib/mgmt.h
> @@ -772,6 +772,7 @@ struct mgmt_ev_device_connected {
>  #define MGMT_DEV_DISCONN_TIMEOUT       0x01
>  #define MGMT_DEV_DISCONN_LOCAL_HOST    0x02
>  #define MGMT_DEV_DISCONN_REMOTE                0x03
> +#define MGMT_DEV_DISCONN_LOCAL_HOST_SUSPEND    0x05
>
>  #define MGMT_EV_DEVICE_DISCONNECTED    0x000C
>  struct mgmt_ev_device_disconnected {
> @@ -959,6 +960,17 @@ struct mgmt_ev_adv_monitor_removed {
>         uint16_t monitor_handle;
>  }  __packed;
>
> +#define MGMT_EV_CONTROLLER_SUSPEND             0x002d
> +struct mgmt_ev_controller_suspend {
> +       uint8_t suspend_state;
> +} __packed;
> +
> +#define MGMT_EV_CONTROLLER_RESUME              0x002e
> +struct mgmt_ev_controller_resume {
> +       struct mgmt_addr_info addr;
> +       uint8_t wake_reason;
> +} __packed;
> +
>  static const char *mgmt_op[] = {
>         "<0x0000>",
>         "Read Version",
> @@ -1088,6 +1100,8 @@ static const char *mgmt_ev[] = {
>         "Device Flags Changed",
>         "Advertisement Monitor Added",                  /* 0x002b */
>         "Advertisement Monitor Removed",
> +       "Controller Suspend",
> +       "Controller Resume",
>  };
>
>  static const char *mgmt_status[] = {
> --
> 2.28.0.402.g5ffc5be6b7-goog

Patches 1 and 2 of this series were applied, thanks.

-- 
Luiz Augusto von Dentz
