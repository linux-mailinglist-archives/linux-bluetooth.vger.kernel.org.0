Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD72FB6FE
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 Nov 2019 19:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbfKMSDf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 13 Nov 2019 13:03:35 -0500
Received: from mail-yb1-f182.google.com ([209.85.219.182]:36615 "EHLO
        mail-yb1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbfKMSDf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 13 Nov 2019 13:03:35 -0500
Received: by mail-yb1-f182.google.com with SMTP id v2so1169907ybo.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Nov 2019 10:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ml1hiojI1gf6hYFusJhz7vgIPv+M2G0Hb9P85pw1kMU=;
        b=KAhvaa5rDCdgeLSbrGLJ98ncbNg50j0jMJ6Sb1NsI1Ol4nT3xd+uBeinW21Z3aJUK6
         fp4mKXIwIijyYPlD+KHGMjdt+DvGVSkOMovmGb8v6hJlZfzUOC/epZUlqfhxFh4+imvE
         GRF71fzc1VdJKw1thjG7K/G9FUebCa4upOSMnlrs+lEuUFcPw4eIuz90ue6I4biHNrDx
         LKpCam4FeUUV3j5Zo8Qpj9JXzkp1LgPwn/prG+OBSD6dZ8k6kaMdRoiuUcwD06CBSy9p
         nA02pUzzeK4K2c0uj3BwEgWdSohxx6NrPanT4AocJXT4hcHy70bxR0VVJ2gRSg85Uvu2
         PEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=ml1hiojI1gf6hYFusJhz7vgIPv+M2G0Hb9P85pw1kMU=;
        b=eqCukPAjeXppltMcFUpQ66pSYF/6hzJ+ql/1fHgc/uWBd9sN8nJDffINmB3XMu6UFw
         UcIVQqkmIx/SQ33jbLOxllrgi6N9ILnSde6J0OpuBgVWcJc0FDo6i4vlghwHtc/yioD5
         JttKi8pKVDcHgRSKdg8dAzSuHx+XQRY6lF7jBqd0O4c2mdECRFOfV6MWrfu0gyo7VTFh
         QabewEy2jrys8ukbuLYWrE19+Tlt9BN7VGxbzVdC/x6bDdpnyd8590FbZfy9cKeycYzH
         iADk2Srx/nNh6bBg5RbKOsNEGdeXd6ruphKgRKqliE7ayilLoajh7j4WPJE6GUHAhdhl
         JziA==
X-Gm-Message-State: APjAAAV4ediRZZZ2jgAy586hcnxp2LDsVW312QCMohL4FhYOV8NO+BjD
        2pQ+4MI6v/rDkatCySbAmcuVjuqtzlBgMmM7fEKmaA2A
X-Google-Smtp-Source: APXvYqyhqcSPlT+vf7Ra2HQ77+EFaXFEzTw/XfgEAchgrtbslKAh3FxzjHcOeFt1GwyUxRt6foP4kOHHNp6rH9zPvXY=
X-Received: by 2002:a25:8482:: with SMTP id v2mr2520669ybk.374.1573668212922;
 Wed, 13 Nov 2019 10:03:32 -0800 (PST)
MIME-Version: 1.0
References: <CAMGddftdorPGAzJbQzwLbaKNjfSrbayzGzKFb7iMBSwNQvsf7g@mail.gmail.com>
 <5852113.xjoqjODIPz@ix> <CAMGddfvgDWrdVCXb=YgL-nYpyapW+4MAusrqD6=6ZdsbPGW+DQ@mail.gmail.com>
In-Reply-To: <CAMGddfvgDWrdVCXb=YgL-nYpyapW+4MAusrqD6=6ZdsbPGW+DQ@mail.gmail.com>
From:   Barry Byford <31baz66@gmail.com>
Date:   Wed, 13 Nov 2019 18:03:21 +0000
Message-ID: <CAAu3APZjMHP3y_H1OCR2OArhjGqH1ifpZf3VV9EHn1nWhcAZBQ@mail.gmail.com>
Subject: Re: Simple SDP and RFCOMM example
To:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, 13 Nov 2019 at 17:29, Krist=C3=B3f Horv=C3=A1th
<horvath.kristof.attila@gmail.com> wrote:
>
> Hi,
>
> > There is test/test-profile and test/test-hfp in BlueZ source code.
> With the test-profile code, I could register a service, and I could
> discover it from another device. However, a connection couldn't build
> up. The function NewConnection didn't call at all. (By the way, I
> didn't find any line of code to receive the data, how is it possible?)

Here is an example of receiving data with a Serial Port Profile:
https://gist.github.com/ukBaz/217875c83c2535d22a16ba38fc8f2a91

Going back to your original question, you might find it easier to use
a Python library like Blue Dot on your project as it presents a higher
level interface:
https://bluedot.readthedocs.io/en/latest/btcommapi.html

Regards,
Barry
