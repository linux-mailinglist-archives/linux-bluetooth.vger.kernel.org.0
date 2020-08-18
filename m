Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE745249176
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 Aug 2020 01:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgHRXea (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 18 Aug 2020 19:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgHRXea (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 18 Aug 2020 19:34:30 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8ACFC061342
        for <linux-bluetooth@vger.kernel.org>; Tue, 18 Aug 2020 16:34:29 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id a1so11043202vsp.4
        for <linux-bluetooth@vger.kernel.org>; Tue, 18 Aug 2020 16:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cB70dETR/NyGQeHCHTARFj9L+SQvd7OlAWQERQoCVII=;
        b=VH/aoSyZVjORXv3NGcpvObwwphjJTPh8Teb99rTAe6HRr/0164LWsOX0ahj5q7dRDH
         5XIXK3BbjyjgmjpUwj+nAZSn4w6cRWSM6sGsH3NJe0BMbCbtUqKkHOyOIsqpouIwIB9O
         4HAUlPnDMdu4VX491vMC+FOMEBW2rpYRT6IV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cB70dETR/NyGQeHCHTARFj9L+SQvd7OlAWQERQoCVII=;
        b=nqWKrnCSAnmem4Z4zprGMyAxYcNkjPjzj5olVIMmSYStX2ldDFwnrXm+bKBlAO65p2
         mLDxJ0k+O8NBIwOQ/qi+0MLCJ9BZ0ymJQ6BhIVys9eRaWaX8VcZcxoy2tf75mWGw7oe8
         m0Ry08nbFOHY6ZBtGDgESHo8ABKCfDHL84/ahKCtHdhY+tHpvrq2Rwq9YBxrSgm2hb/3
         xJ/ZFqzBt7FOj6du4GG8phkBICUro1Zw/gYAHvrxMVdSJdrkwu4Uvhai/ThGoTSRfalW
         qi+zgopxQ1bi7DHAJWVDtcky7/BM6aS//DBfJPFgVmYoGY9mPkWDVMGZRtZMZXvtVMMV
         t4Ag==
X-Gm-Message-State: AOAM532b9/becparWHgDrlz+L3MPztwZAq+xcgaF1rBId0dBnvWEzvXh
        gXPq0hAR8yCROVnRdvakHayR5OBhU1hoJjfdQTFfRg==
X-Google-Smtp-Source: ABdhPJzHyqzCkUdY55haN8OFBGZb0CYfaDh2JhndlSCGSs7EgCkjOFsKH6Ao88fQ+4pSMDiQMP+cyYhtv/6vgWxYkag=
X-Received: by 2002:a05:6102:311a:: with SMTP id e26mr13531599vsh.86.1597793668644;
 Tue, 18 Aug 2020 16:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200729014225.1842177-1-abhishekpandit@chromium.org> <CANFp7mV0TP-WbBWGSpduERaf9-KBXevhG7xKvjkMrqrtWWkZ5w@mail.gmail.com>
In-Reply-To: <CANFp7mV0TP-WbBWGSpduERaf9-KBXevhG7xKvjkMrqrtWWkZ5w@mail.gmail.com>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Tue, 18 Aug 2020 16:34:17 -0700
Message-ID: <CANFp7mW3jXf1Djp=j3nYRzzoJAptJ8Z2JJCP+N6pMHGWXx=9cg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Bluetooth: Emit events for suspend/resume
To:     Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     ChromeOS Bluetooth Upstreaming 
        <chromeos-bluetooth-upstreaming@chromium.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,

Please review this patch. A newer series for how the controller resume
event will be used is available at
https://patchwork.kernel.org/project/bluetooth/list/?series=334811

Besides usage in bluez, these events will also make debugging and
testing suspend/resume for Bluez easier (i.e. finding spurious wakes
due to BT in suspend stress tests, asserting that wakeup from peers
occurred as expected in tests)

Abhishek

On Tue, Aug 4, 2020 at 10:11 AM Abhishek Pandit-Subedi
<abhishekpandit@chromium.org> wrote:
>
> Hi,
>
> Gentle reminder that this is waiting for feedback. Related userspace
> changes are here to see how we plan on using it:
> https://patchwork.kernel.org/project/bluetooth/list/?series=325777
>
> Thanks
> Abhishek
>
> On Tue, Jul 28, 2020 at 6:42 PM Abhishek Pandit-Subedi
> <abhishekpandit@chromium.org> wrote:
> >
> >
> > Hi Marcel,
> >
> > This series adds the suspend/resume events suggested in
> > https://patchwork.kernel.org/patch/11663455/.
> >
> > I have tested it with some userspace changes that monitors the
> > controller resumed event to trigger audio device reconnection and
> > verified that the events are correctly emitted.
> >
> > Please take a look.
> > Abhishek
> >
> >
> > Abhishek Pandit-Subedi (3):
> >   Bluetooth: Add mgmt suspend and resume events
> >   Bluetooth: Add suspend reason for device disconnect
> >   Bluetooth: Emit controller suspend and resume events
> >
> >  include/net/bluetooth/hci_core.h |  6 +++
> >  include/net/bluetooth/mgmt.h     | 16 +++++++
> >  net/bluetooth/hci_core.c         | 26 +++++++++++-
> >  net/bluetooth/hci_event.c        | 73 ++++++++++++++++++++++++++++++++
> >  net/bluetooth/mgmt.c             | 28 ++++++++++++
> >  5 files changed, 148 insertions(+), 1 deletion(-)
> >
> > --
> > 2.28.0.rc0.142.g3c755180ce-goog
> >
