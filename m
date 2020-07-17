Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50759224550
	for <lists+linux-bluetooth@lfdr.de>; Fri, 17 Jul 2020 22:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728620AbgGQUp0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 17 Jul 2020 16:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgGQUp0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 17 Jul 2020 16:45:26 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D37C0619D2
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jul 2020 13:45:26 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id e90so7830136ote.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jul 2020 13:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RiBb+mdLL6rzhG0+D8n+DKEw2YOa8UurDsxESXSu3Ac=;
        b=uTtb245Ug6NNNy7NXe2I+OInAdayH7r5u7+Bx9Y+TnqAOI9ybumsqVdfJ7BKnA4w1y
         ZOtG0lwOnLYVQTTNWLeS8DwfbMJBtL6nPfgp5ZZUms7kWjtO0nskfdI+3rZl4IfbTC+P
         jIb2XRrB4NXjNmyEAhcrQ4tOqNtYUvb5eq+KtKqpx42hKB5BtUr3oSpGxxk2saoQB+u9
         ecAZtpG0D1urf9tL8aKLrWiTyvP4nc9v61/qZ8qJ/NUey9N4Co+fz0QdizwOcg+UueqL
         +Fk8cMYnPsxRaTbOeI58Eb6/lxr8RK35WrTBhDCTaL8cp6qOdrrCKnUQIw5B/7jSiNEF
         ftiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RiBb+mdLL6rzhG0+D8n+DKEw2YOa8UurDsxESXSu3Ac=;
        b=R65Geq03m4P6uoAQDFGCwrgY5PTfxqplZbnzYdrbN7vpYf7osNjHsiYt32cFvwJgrJ
         O39qNcbn912HYykjloxlwzFoFKLYODqf2O1M/59Xaq5csyrmGKgzaGhiTAddcvud1END
         u1ajnavA2Y6RNeY82COg0qZGKcbzYy6/XsIdmZVAyBgIv+otQmxyn7hQ130KHCRrnIpc
         DWmksuNfCj6WTsmZ9UgI/DEEBKMq1v9wYv4iI4T3wMUHNZQPzD/E4U4q4QSEvmfj9oEg
         y3vzlMh+2KTlfxwK6WpGExCx1Blh+J5S5hwvOdMRXUue00WAnpaaPtD/lOeFbv01/7JZ
         BBnQ==
X-Gm-Message-State: AOAM532gTXRgVTaTG+RlGEGI7Y6wnBVhVkbzpRzHV0Njs2i5TgH4IncM
        ET/MV3PTiUWbgr6SZ7SB1kBFLBZgT1y8jTFQ0DU=
X-Google-Smtp-Source: ABdhPJxEn3kSFfy/OgdCJyKOStq9do2MDt23v7y6taXeUpPw+vDDt0iBiekxI0X6RkvusVjgSjzN/7H4FUCWzQnw3Ls=
X-Received: by 2002:a9d:5e18:: with SMTP id d24mr10146226oti.88.1595018725153;
 Fri, 17 Jul 2020 13:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200717191515.220621-1-luiz.dentz@gmail.com> <5f11facb.1c69fb81.6f815.57f7@mx.google.com>
 <dac373c76940dbf30302a1420fceaf7a01e00397.camel@linux.intel.com>
In-Reply-To: <dac373c76940dbf30302a1420fceaf7a01e00397.camel@linux.intel.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Fri, 17 Jul 2020 13:45:14 -0700
Message-ID: <CABBYNZKNBRT-3t_SSh8dHWVZk6S7NBU9rY2X-miE6bKwLOqQnw@mail.gmail.com>
Subject: Re: [BlueZ,1/5] shared/att: Fix possible crash on disconnect
To:     Tedd Ho-Jeong An <tedd.an@linux.intel.com>
Cc:     "Von Dentz, Luiz" <luiz.von.dentz@intel.com>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Tedd,

On Fri, Jul 17, 2020 at 1:35 PM Tedd Ho-Jeong An
<tedd.an@linux.intel.com> wrote:
>
> Hi Luiz,
>
> The failure is from test-gatt
>
> DEBUG   :FAIL: unit/test-gatt
>
> I will update the CI to include the test result.
>
> Regards,
> Tedd
>
> On Fri, 2020-07-17 at 12:23 -0700, bluez.test.bot@gmail.com wrote:
> > This is automated email and please do not reply to this email!
> >
> > Dear submitter,
> >
> > Thank you for submitting the patches to the linux bluetooth mailing list.
> > While we are preparing for reviewing the patches, we found the following
> > issue/warning.
> >
> > Test Result:
> > makecheck Failed
> >
> > Outputs:
> > ./test-driver: line 107: 14830 Bus error               (core dumped) "$@" >
> > $log_file 2>&1
> > make[3]: *** [Makefile:9726: test-suite.log] Error 1
> > make[2]: *** [Makefile:9834: check-TESTS] Error 2
> > make[1]: *** [Makefile:10228: check-am] Error 2
> > make: *** [Makefile:10230: check] Error 2

Weird, it start failing for me as well but it doesn't seems to be
causing any test to fail:

Total: 192, Passed: 192 (100.0%), Failed: 0, Not Run: 0
Overall execution time: 0.849 seconds
FAIL unit/test-gatt (exit status: 1)


> >
> >
> >
> > ---
> > Regards,
> > Linux Bluetooth
>


-- 
Luiz Augusto von Dentz
