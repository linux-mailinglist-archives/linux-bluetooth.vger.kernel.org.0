Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38DDE32BBED
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Mar 2021 22:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358959AbhCCNTe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Mar 2021 08:19:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1843012AbhCCKXt (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Mar 2021 05:23:49 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D705C061788
        for <linux-bluetooth@vger.kernel.org>; Wed,  3 Mar 2021 00:21:53 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id b3so16862302qtj.10
        for <linux-bluetooth@vger.kernel.org>; Wed, 03 Mar 2021 00:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u4NW6pVd55BVysXdGT9j2mN9N0jqN4OssY4y20JP5Tk=;
        b=fkd/r7Nk6TKGUmo21/5ScKGNyY1XZVKDnKh3WzZ5MGyaqRpNGTDS0zz71/2IGFs7+A
         j2RNv6QW821we60GeAaBAzInbkCNC7BnQd6E56vS0I+S47CHqX9vxSyMZQfZNgRHDSTi
         cVL3jknZrlyBDjsDrmeV/kYmXS++qxWtJD0VuiTK0Mu8gS4hUyczmBHYNDzKgB1pMgzW
         beLPBoxPckYpBHn7/BecxYr6EHkRNFdSatH5YHmRM0CQslemaboAxMbefrFm7ZfOxbvY
         MYoyzRW/PEaoJJ1yjlpHZ5dqyclt1JsNj/VCSBRQjyYTFvaiiIbH6CbrpKrGcJqkLGUy
         NINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u4NW6pVd55BVysXdGT9j2mN9N0jqN4OssY4y20JP5Tk=;
        b=AJX4LL2uf7+qlkofQx3RdqShwwxzGkXOXnICY3ewuWZV1AoAIWHoKFca6oCr30hS+A
         y4mkBsM9Zf1jsSt4po2/lc0FLzE5zJHq29i6ewgSYZoSWYMPPGdtSgjTjWCirk3dXhL+
         sDt2DB5zQp9fmQf9Fs3y3a8XANLqDlqPqZ0d3dtgFYmFb+NFeP/JumSnfLLnlxz9C9+e
         JROVNyMHSTL52L9Sgpjs6xC1+2QGqUhW1TtQZdrKunC/4pRuoCEqoXdcPd+ZXPK1LUhr
         so9X0ShBrV64UuJwudTabT3buyQSyYQfZ5Sh4bg6g3l6kEfwJwn1Pcjp4WzMfi5X5tHV
         G19Q==
X-Gm-Message-State: AOAM531CC/ISDqHASem/rHO8ov5JOyhcEpYtbf1PpraJRX6aQlTmbNkb
        JDpVlOkJXpdeub0eAN438yPfG1Hk0oYy/UnIsMKIBw==
X-Google-Smtp-Source: ABdhPJzr/7vquNM3mrxZ3jm9E4gx993nP272v7aKwR6SRzfJgdcxWsvvzwwDgwU0bG514ImSii708d0CzyhXNZVQE+I=
X-Received: by 2002:a05:622a:c9:: with SMTP id p9mr21103012qtw.337.1614759712453;
 Wed, 03 Mar 2021 00:21:52 -0800 (PST)
MIME-Version: 1.0
References: <20200808040440.255578-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200808040440.255578-1-yepeilin.cs@gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 3 Mar 2021 09:21:41 +0100
Message-ID: <CACT4Y+b6m7kRS82iRNcmaEPKN8fbvOUmztuGJSw6OketyxM8Kw@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] Bluetooth: Fix NULL pointer
 dereference in amp_read_loc_assoc_final_data()
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Andrei Emeltchenko <andrei.emeltchenko@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, gtiwari@redhat.com,
        syzbot+f4fb0eaafdb51c32a153@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Sat, Aug 8, 2020 at 6:06 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> Prevent amp_read_loc_assoc_final_data() from dereferencing `mgr` as NULL.
>
> Reported-and-tested-by: syzbot+f4fb0eaafdb51c32a153@syzkaller.appspotmail.com
> Fixes: 9495b2ee757f ("Bluetooth: AMP: Process Chan Selected event")
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
>  net/bluetooth/amp.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/net/bluetooth/amp.c b/net/bluetooth/amp.c
> index 9c711f0dfae3..be2d469d6369 100644
> --- a/net/bluetooth/amp.c
> +++ b/net/bluetooth/amp.c
> @@ -297,6 +297,9 @@ void amp_read_loc_assoc_final_data(struct hci_dev *hdev,
>         struct hci_request req;
>         int err;
>
> +       if (!mgr)
> +               return;
> +
>         cp.phy_handle = hcon->handle;
>         cp.len_so_far = cpu_to_le16(0);
>         cp.max_len = cpu_to_le16(hdev->amp_assoc_size);

Not sure what happened here, but the merged patch somehow has a
different author and no Reported-by tag:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e8bd76ede155fd54d8c41d045dda43cd3174d506
so let's tell syzbot what fixed it manually:
#syz fix:
Bluetooth: Fix null pointer dereference in amp_read_loc_assoc_final_data
