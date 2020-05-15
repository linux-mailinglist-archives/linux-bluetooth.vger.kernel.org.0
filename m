Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3651D5CA4
	for <lists+linux-bluetooth@lfdr.de>; Sat, 16 May 2020 01:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgEOXI6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 15 May 2020 19:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgEOXI6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 15 May 2020 19:08:58 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A4DC061A0C
        for <linux-bluetooth@vger.kernel.org>; Fri, 15 May 2020 16:08:58 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id g22so806286oop.13
        for <linux-bluetooth@vger.kernel.org>; Fri, 15 May 2020 16:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3hPlie+VkEbVkyInHkGOESjBn3qqTzyA2/cYUQQHIoY=;
        b=ZPdEjdmAg4qsrexezNaWpBlOndw4cyrCynnSzSXsVyhrf3rSbd9Iuzry4UWi+jrDni
         RkZb+jVOxxeWxNw0adpAjwsQXzcsI9avKwRPH5VpQVni7x6vrWMKuJ6MnVlTG+cyIvL5
         5ITpNzEIHLUG/urJUO6l76HkWxZaNekDFS22pPfg0JuylkMEWuBcx/b5Oi1Hm/f9FUMH
         ptY41mBlgQViZXUITiVYY2EMcd7SNiCu6N3FoTTyl+turb8NAsWk6k8wN2RKYeGZKI4T
         Id9yYFZpB+J0pRC8KU4kEVCl5yg6MxIwVR8k9GOh3wnO7LnUMncOPz1lja5fZ2aqeLtg
         VURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3hPlie+VkEbVkyInHkGOESjBn3qqTzyA2/cYUQQHIoY=;
        b=ESG8ByUp8f18/8MZvm5BKvIWfmoPs4od7QwPbXeeFyMonAzJbQMMbV5kb3kRR9Z2nn
         f+rMCPWLWbicqSGYL99dUTOEIEQTUQj7EM7zULpkccTk1T77rKLOcxdp1fTfrX41mE1e
         KwNtOqWOcZS15Z9LUY9cjH+KH1cm0EIgzASKMqkmh/dLxGh+784F27Uv5xB6pkfcZgaq
         VWNPP+7U+Xpeqa74og2oQMI+IOcSkGtX9yG5/w/4FkRLoE7et4DMqAbLMs/6DcuZipZN
         Xg9ZN2C44KbW86oEpWULl3TjFj1ZofmwtNvb8G140n+PjacqmjRhBZp2ipUWItmgdfCI
         NSIQ==
X-Gm-Message-State: AOAM533Dc0KybAsxssef9sd+ch8PkJwxBDrYuM+5Ik9j7EZ5OWMgMwhh
        HBMIAIqhWdMkpCKhfCxtMmDUnBKxnFfXfjvK7Cs=
X-Google-Smtp-Source: ABdhPJzog0zAZq+GufvAVbhvu3V2T+j4V4TJn36waiWoGDqu+YfMU04lOpPgnPH44tqFSq6SocYSTHMa8KWRV/9h/ws=
X-Received: by 2002:a4a:3b04:: with SMTP id s4mr4424739oos.35.1589584137242;
 Fri, 15 May 2020 16:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <B6A143FD-717D-44F9-B62F-17CF357961A1@holtmann.org>
 <20200219120940.1509224-1-david@ixit.cz> <20200419234937.4zozkqgpt557m3o6@pali>
 <177c5794-1cd7-8f76-b66f-e9473ed37a31@redhat.com> <CAB5wbS97WQTduY9sKgiLjAnpsmka+9hGQOBDdbAEHgkcwnze1w@mail.gmail.com>
In-Reply-To: <CAB5wbS97WQTduY9sKgiLjAnpsmka+9hGQOBDdbAEHgkcwnze1w@mail.gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Fri, 15 May 2020 16:08:45 -0700
Message-ID: <CABBYNZ+TQ+oSYgL1wGsC0rs9faecd0RtQkFE9fbnV89D1r=LOg@mail.gmail.com>
Subject: Re: Bluetooth: Allow to use configure SCO socket codec parameters
To:     Andrew Fuller <mactalla.obair@gmail.com>
Cc:     Aleksandar Kostadinov <akostadi@redhat.com>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Andrew, Aleksandar,

On Fri, May 15, 2020 at 3:46 PM Andrew Fuller <mactalla.obair@gmail.com> wr=
ote:
>
> On Thu, 14 May 2020 at 13:09, Aleksandar Kostadinov <akostadi@redhat.com>=
 wrote:
> >
> > Pali Roh=C3=A1r wrote on 20.04.20 =D0=B3. 2:49 =D1=87.:
> > <...>
> > > Please let me know what do you think about it. Thanks
> >
> > <...>
> > Thus I and I assume all headphones users will appreciate very much any
> > support to get things moving forward.
>
> To add to what Aleksandar said, a number of us would be more than
> willing to help out in any way we can.  Certainly myself, but I expect
> a number of others, too.  We have bluetooth cards in our computers
> with wideband speech support.  We have bluetooth headsets with
> wideband speech support.  Many of the links in the chain are in place.
> If we can continue building that chain then we can have a higher
> quality experience in this era of teleconferencing in particular.
>
> So if there's anything we can lend a hand with, then please let us
> know and we can see this through.

Just to be clear here, WBS is already supported what is not supported
is hardware based codecs, we spend a lot of time enabling WBS on oFono
but it looks like people are now trying to come with their own
solutions and complaining about lack of WBS is not really justified
since the combination of BlueZ + oFono has been in use by the car
industry for years but desktop folks has not been interested in a
proper HFP solution so instead we have modem manager, network manager,
etc, which doesn't even cover all desktop use cases properly as you
are experience first hand here.


--=20
Luiz Augusto von Dentz
