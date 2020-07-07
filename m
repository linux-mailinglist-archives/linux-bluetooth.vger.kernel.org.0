Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20EBF217360
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Jul 2020 18:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbgGGQLS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Jul 2020 12:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgGGQLS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Jul 2020 12:11:18 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1174DC061755
        for <linux-bluetooth@vger.kernel.org>; Tue,  7 Jul 2020 09:11:18 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id 64so16578628vsl.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 Jul 2020 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PdkRv62nUyer3utyHGyA4zyawQ7UJwHUu+IzIsdxXbk=;
        b=ZIRm1sCwWG3uRuWaf7gqVsqLFlt4i5nQz7D3SKhQhXqifxYIfsrwV7RYthE1frvidf
         BirGcXuaaJKJ4hYD7MHm32VHftEpvf0G5tFcM7LQkFDNl8cT0WJ0NQdDwx10Ci9aIObS
         OCMwze0DIhf2sgT7WI1QToBUwX4SISOB1G0+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PdkRv62nUyer3utyHGyA4zyawQ7UJwHUu+IzIsdxXbk=;
        b=Xm0aK3GRpu2wqtcfcvsWBzK0Z+/3FJI9+Nz4LCZtROMTBwZY/+EbF4MYU+QLb76ITX
         a68+BvPK8DjJ3h69TgPf12aVjaVbe7vazqGK7O64PM9/e1XD2sGyazr/kW8NLJXMny1D
         hqwp8EK3oXomtFsc+sPBzXkOUQJEApL9gXwFJ/Fr/WKpOEhHAoAbOgwz3GUWW7IxWYoq
         uHdFijuibkotlEnw9ujnTth1QTIDJQPGM3jS2ZDO5D/bybvmaaHjRlORDQ8CO0LPwcI/
         T2gx0kbClRxzCb7l2zxZJ7RBzeLuIZhP7H8KQBzwwKvwNI5gbbYXh8PpTQjG6mwXqqJi
         hh2g==
X-Gm-Message-State: AOAM5312CkE4KK2T5VpBLyTupjpDdTP6Ed9xMP/Z1mZXxVLmFk3kcO3j
        KgwjVP/UHOpc2L7+2dnsbQfvLkn8/qtnjgq/nD/2xw==
X-Google-Smtp-Source: ABdhPJxMj1B4DMC0cpSoOzvOLQGp4qu9v2iXoupdVrCYhGX2pRj4jjKQXOUpCAK37GZcNDrEen+wpsqytTGK7L52DQc=
X-Received: by 2002:a67:6e05:: with SMTP id j5mr32157567vsc.196.1594138277134;
 Tue, 07 Jul 2020 09:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200707154905.2763616-1-abhishekpandit@chromium.org>
 <20200707084857.v3.1.I51f5a0be89595b73c4dc17e6cf4cc6f26dc7f2fc@changeid> <20200707160045.GA118278@kroah.com>
In-Reply-To: <20200707160045.GA118278@kroah.com>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Tue, 7 Jul 2020 09:11:06 -0700
Message-ID: <CANFp7mV_5HtaKo0Q5BRanVhbu618gQS-Xiut7uz+CuGbVmf5EQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] power: Emit changed uevent on wakeup_sysfs_add/remove
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        ChromeOS Bluetooth Upstreaming 
        <chromeos-bluetooth-upstreaming@chromium.org>,
        rafael.j.wysocki@intel.com, Stephen Boyd <swboyd@chromium.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

I admit I didn't test this but I built it with allmodconfig.

Sadly, this only raised a warning instead of an error so I didn't go
look through the build logs (ignore the 5.4, the remote here is the
linux-pm git repo):

/usr/local/google/home/abhishekpandit/chromiumos/src/third_party/kernel/v5.=
4/drivers/base/power/sysfs.c:
In function =E2=80=98wakeup_sysfs_remove=E2=80=99:
/usr/local/google/home/abhishekpandit/chromiumos/src/third_party/kernel/v5.=
4/drivers/base/power/sysfs.c:754:9:
warning: =E2=80=98return=E2=80=99 with a value, in function returning void
[-Wreturn-type]
  754 |  return kobject_uevent(&dev->kobj, KOBJ_CHANGE);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/usr/local/google/home/abhishekpandit/chromiumos/src/third_party/kernel/v5.=
4/drivers/base/power/sysfs.c:751:6:
note: declared here
  751 | void wakeup_sysfs_remove(struct device *dev)


Will send up another fix.

Thanks
Abhishek

On Tue, Jul 7, 2020 at 9:00 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 07, 2020 at 08:49:05AM -0700, Abhishek Pandit-Subedi wrote:
> > Udev rules that depend on the power/wakeup attribute don't get triggere=
d
> > correctly if device_set_wakeup_capable is called after the device is
> > created. This can happen for several reasons (driver sets wakeup after
> > device is created, wakeup is changed on parent device, etc) and it seem=
s
> > reasonable to emit a changed event when adding or removing attributes o=
n
> > the device.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> >
> > Changes in v3:
> > - Simplified error handling
> >
> > Changes in v2:
> > - Add newline at end of bt_dev_err
> >
> >  drivers/base/power/sysfs.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/power/sysfs.c b/drivers/base/power/sysfs.c
> > index 24d25cf8ab1487..04c82373c8f240 100644
> > --- a/drivers/base/power/sysfs.c
> > +++ b/drivers/base/power/sysfs.c
> > @@ -1,6 +1,7 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  /* sysfs entries for device PM */
> >  #include <linux/device.h>
> > +#include <linux/kobject.h>
> >  #include <linux/string.h>
> >  #include <linux/export.h>
> >  #include <linux/pm_qos.h>
> > @@ -739,12 +740,18 @@ int dpm_sysfs_change_owner(struct device *dev, ku=
id_t kuid, kgid_t kgid)
> >
> >  int wakeup_sysfs_add(struct device *dev)
> >  {
> > -     return sysfs_merge_group(&dev->kobj, &pm_wakeup_attr_group);
> > +     int ret =3D sysfs_merge_group(&dev->kobj, &pm_wakeup_attr_group);
> > +
> > +     if (ret)
> > +             return ret;
> > +
> > +     return kobject_uevent(&dev->kobj, KOBJ_CHANGE);
> >  }
> >
> >  void wakeup_sysfs_remove(struct device *dev)
> >  {
> >       sysfs_unmerge_group(&dev->kobj, &pm_wakeup_attr_group);
> > +     return kobject_uevent(&dev->kobj, KOBJ_CHANGE);
>
> Always test build and hopefully actually test, your patches before
> sending them out :(
>
