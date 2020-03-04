Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2AE179BDE
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Mar 2020 23:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388371AbgCDWlC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 4 Mar 2020 17:41:02 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:38682 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387931AbgCDWlC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 4 Mar 2020 17:41:02 -0500
Received: by mail-ot1-f51.google.com with SMTP id i14so3756737otp.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 Mar 2020 14:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SOZvMmwxMqPsF/62oCUyTvkyR9DrzBv9d4nkrEfeqn8=;
        b=PYxAA8fVNCcxPKHvGWXZRa1EUBJmE0JiRl+YOAcnFOwcU8YZMvNoEPgV0fWm6vh9Cg
         Lu0AA/zi8/+GrLfd6NI+TZ36Sx8vOa9dE525npDoSu3krCw+53lbSKwlXLv4I/ARwEGK
         W2eJwLr8nosVyrxHY7iKMF2EzKbqmmcPAHcmWoKFgajlCXGvatZj/m15/jI6Nft+Orv6
         J4uRvmBLo/Ya1CAaoxxnrLLh2oT9RBjSf2ZkGdyJAwlOf+Sy5XJFMF5MbbsqEP0UzECr
         zbUzFKhbxmXgduUXJ5tm1iCFrTxslhAcDURsHp5nLPhaH1WKz6DTCPlY2itz1wXrHNor
         is9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SOZvMmwxMqPsF/62oCUyTvkyR9DrzBv9d4nkrEfeqn8=;
        b=tMsNNiBQOykOg5he1XisbJvdRRNGkZclnxDSmI9H18fScyccIcQmq7X/v87InslmVK
         tP/ObOwAfqUoxGsA3K6FRpVc1VCA0/SvznlWVeBG/cSJueqcib6gTwKgBBzKhozwrZRU
         bODObLe+mNO2/wmzX/nGB5Wq6v72KX8sWtb20DiIVk2Jb2WW5SqHYYZCvC0CMcPzC46O
         0jRDai8GbQJW6pKasTDnwLH0PdCeWoFIGt5w1KSOqYMFfjvPc7UesO+4eqSLClAOdnU7
         eig/XO4/vgw+QGsmlLx+2l7PwfAH3q3gAinGWMjSc2hbinZuJu/LUN5pHqcRYCfD6J5n
         GEFg==
X-Gm-Message-State: ANhLgQ3vhNyUlUK5B/0UaT3D5r8Guic9+253NhXUKqc814PjgFvtLgNA
        64DSOxW01I41gFeLCIZfh00hjaa8yFje+h2B2f8=
X-Google-Smtp-Source: ADFU+vtYjmzlSHoMVVRb4hg5Me7g4X9D274nH4BI0QlksUrJTs61/MAkSj5X9m3ELq1OUqn8IuFrx+MMOIL+4rAtrrw=
X-Received: by 2002:a9d:da5:: with SMTP id 34mr3920837ots.226.1583361661440;
 Wed, 04 Mar 2020 14:41:01 -0800 (PST)
MIME-Version: 1.0
References: <CAO1O6sdGJeAKTHBVyDSUa7-Hp_ULYmfOHJEbb6=-B6xuPHvffQ@mail.gmail.com>
 <CABBYNZKtxPmTUn2fw9-dy1V9M_Pb996O6VmHkg4NrAr-=t+-4A@mail.gmail.com>
 <CAO1O6sdke-2J=eYHS2SoG83v-hMJDBu-gasufJYDyHK+1R+w5g@mail.gmail.com>
 <CH2PR14MB3658759A2701FB52A2D6573BE6E50@CH2PR14MB3658.namprd14.prod.outlook.com>
 <CAO1O6sfwcEswTkuuntoBM_S5oFkQv7mCP1GH8Z0S0vgHk2Bp5A@mail.gmail.com>
 <CABBYNZ+2v5Z05dSD+TrzioGYVWugZJGpBnq+2M=MO-smuVgXbA@mail.gmail.com>
 <CAO1O6sfWgqnduM8_UuO_1W8KjnEvoetbk6bcaA_ATFUaXLtB0w@mail.gmail.com> <CABBYNZJrWBVEY7ZUxqFShfPne2b=6ahDOd3srJF6NAJwQLWQpQ@mail.gmail.com>
In-Reply-To: <CABBYNZJrWBVEY7ZUxqFShfPne2b=6ahDOd3srJF6NAJwQLWQpQ@mail.gmail.com>
From:   Emil Lenngren <emil.lenngren@gmail.com>
Date:   Wed, 4 Mar 2020 22:40:51 +0000
Message-ID: <CAO1O6sfp2ikCkAY3UGvxe-+F-L-nG=cdTqjzthrv4ddrADxWnw@mail.gmail.com>
Subject: Re: Get negotiated ATT MTU?
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Jamie Mccrae <Jamie.Mccrae@lairdconnect.com>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

Den ons 4 mars 2020 kl 20:44 skrev Luiz Augusto von Dentz
<luiz.dentz@gmail.com>:
> > > It completely transparent to D-Bus, so if we do expose the MTU it
> > > should probably be reporting the biggest MTU of all connected channel,
> >
> > Is there ever any reason for one application to have more than one ATT
> > bearer? I thought the idea of EATT was to allow one ATT bearer per
> > application.
>
> EATT is meant to allow multiple outstanding requests, it probably
> would not escale if we would add an API to have a bearer per
> application so we just use the extra bearers as a pool.

I just read the 5.2 overview and 5.2 specification again and I see now
that the overview suggests that a pool of bearers should be used, as
you mentioned. So yes in that case the maximum ATT_MTU of the bearers
seems reasonable to report (if they for some reason would differ). But
by having a pool like this, I hope implementations will make sure that
multiple Write Without Response values or notifications from the same
application are sent on a single bearer, to avoid reorderings.

/Emil
