Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8DFD3F7F34
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 Aug 2021 02:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234178AbhHZADf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 Aug 2021 20:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbhHZADe (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 Aug 2021 20:03:34 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82621C061757
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 Aug 2021 17:02:48 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id a4so660868uae.6
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 Aug 2021 17:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P8cOUl5rJxM/M6K+Ul9Q4rIt9qo6Y2wKzGmCZaFJPoc=;
        b=sD7FCD+IT6itdxXRgw91DIGcVEXm41Qtrp+JANS68b+vwOMvpNFNsz+yTHMZ4OLsXx
         SMCvPhMyrHGpTNT45lVlnCrCfaQPRd89OGZ2uecHBPSba0rr/4wIR0wZ1m20uO9tUfTb
         PNVGKD9l7J+SVYZtEyNlcBPGuvn7tK6s93zWPv4FZFRE4xOaCgV49AEjrP9nzmyIScCV
         hT247gqzIM/XOk2u2OQofDbQZnpapz0DvXPEKGG7G13FiWVW3ziPshOeNsV9rEc5F34Q
         gc6ffFTFOLOMssNfotT4vCWyvS4/cbCdT6qK4VrI13DO2ncZ+C8PSkaYWw5B+I0pvvpw
         HeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P8cOUl5rJxM/M6K+Ul9Q4rIt9qo6Y2wKzGmCZaFJPoc=;
        b=mdLDxcvffDs0BVcrU9kY7+8fTOTgUF9ccY4x2rrEu8md36wqZcaFFp4LWzy9aF50Cq
         Xll04Lpiy047Vt78kwZ9YTUgbWL2WTrY5D0J7Jsu4Ia9dgxXEDNUjmuRh+NY4kbRZX2h
         Yr/GbQZHpdHD1PBoYY+JGLcFwhCrc/mqxQ/gB6mEcBEf9kzO6f8cGqiIbLb3NPXYXE7K
         jQ0mOGTH4r0FVx7pO3yAPZeT8Fci+hpzWbo2awfDRWZ4bS5lgDu58YI/RGF/YB3I1Yqq
         /6eih4YNMOwJKuR8xgG7dvKIk3b/mc0bwfD4GtHVitIvzparEnEgGHAtah9kk23D3wrf
         nSlg==
X-Gm-Message-State: AOAM531j8icplXly1Li5P1jQVKyppVemUdm+QD6/h4hHT94zsz3LtShD
        AZUomMFOO0/bZKVsdTsgkjL+7z+Ofs2FUz/8Wsh6XpqSp4U5Eg==
X-Google-Smtp-Source: ABdhPJyQiTNcwxjC5DhxTAfrXsw1ARAdKy6mtpU228CB3x2Iw8bLE8/fbGsYr73BXMeDafMgZJTJV0UwrVjPX/3Qie4=
X-Received: by 2002:ab0:56c3:: with SMTP id c3mr586658uab.61.1629936166073;
 Wed, 25 Aug 2021 17:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210815201611.v9.1.I41aec59e65ffd3226d368dabeb084af13cc133c8@changeid>
 <61191554.1c69fb81.89ead.b7d9@mx.google.com> <CABBYNZLcEctR6=ovTK_CABqkKgU8UCKQQ30VsVsAJkdEA+xY0A@mail.gmail.com>
 <CAHFy418ZxGDjGvr9RBkKAk1FJa9Lq6jB1D1esnJmX99eKadJbw@mail.gmail.com>
 <CAHFy418sMhHOc1SAZ01P0qOAcWVfUGo3=0TC_9KSqs-2xscNUw@mail.gmail.com>
 <CABBYNZJZrVv-kNFaV7RbEH8i3TGzuXMkcRU1Lt6tngs_qoAvFA@mail.gmail.com> <CAHFy419xvgeU7KUhXj7xDvOJ30KMJTWx7rc3d9uidNZFmEg6Eg@mail.gmail.com>
In-Reply-To: <CAHFy419xvgeU7KUhXj7xDvOJ30KMJTWx7rc3d9uidNZFmEg6Eg@mail.gmail.com>
From:   Joseph Hwang <josephsih@google.com>
Date:   Thu, 26 Aug 2021 08:02:34 +0800
Message-ID: <CAHFy41_mKZ+qaXbUoVgwCBQ9E-kmZabcn3hnVoswf1MOZ3CQnA@mail.gmail.com>
Subject: Re: [v9,1/5] Bluetooth: btusb: disable Intel link statistics
 telemetry events
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Miao-chen Chou <mcchou@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

(Resent in plaintext mode)

Hi Luiz:

  I have fixed the mgmt-tester on the bluez side. The "Read Exp
Feature - Success" test passed on my local test setup.

  Please let me know if there are any issues.

Thanks and regards,
Joseph


On Fri, Aug 20, 2021 at 1:27 PM Joseph Hwang <josephsih@google.com> wrote:
>
> Hi Luiz:
>
> The mgmt-tester change to add the UUID of the new exp feature is just
> sent for review:
>
> https://patchwork.kernel.org/project/bluetooth/patch/20210820131751.BlueZ.v1.1.I165b6fc2b20d80c8d18946434005f0269d92f489@changeid/
>
>   The tester checks the exp features UUIDs and FLAGs. As the FLAG
> values depend on how the test is set up. I set the flags to be all
> 0x00 which passed the mgmt-tester in my local test setup. If that is
> not the case upstream, please let me know.
>
> Thanks and regards,
> Joseph
>
> On Fri, Aug 20, 2021 at 2:04 AM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > Hi Joseph,
> >
> > On Tue, Aug 17, 2021 at 10:49 PM Joseph Hwang <josephsih@google.com> wrote:
> > >
> > > Hi Luiz:
> > >
> > >   I am wondering if it is possible to merge these kernel patches
> > > before fixing the mgmt-tester?
> > >
> > >   The mgmt-tester failed due to its checking against the fixed exp
> > > feature count and the corresponding exp UUIDs and flags. A more
> > > flexible tester may be required so that the tester would not be broken
> > > whenever a new exp feature is added.
> >
> > I would prefer to have the mgmt-tester changes applied as well so we
> > don't have false positives for other patches causing mgmt-tester to
> > fail, in fact we include CI is useful to validate this changes so we
> > can check the feature is correctly exposed to userspace and UUID is
> > properly formatted, etc, it shouldn't be a big change to mgmt-tester
> > thought if you just include the new UUID later on we can think about
> > how we could make it more extensible so it doesn't break when a new
> > feature is added.
> >
> > > On Tue, Aug 17, 2021 at 5:54 PM Joseph Hwang <josephsih@google.com> wrote:
> > > >
> > > > (Resent this email to contain only plaintext.)
> > > >
> > > > Hi Luiz:
> > > >
> > > >   It seems that mgmt-tester currently uses a fixed feature count.
> > > > Every time a new exp feature is added, the mgmt-tester would  be
> > > > broken. By checking the kernel, it seems that there are currently 2 or
> > > > 3 exp features, i.e., debug uuid, simultaneous central peripheral
> > > > uuid, and LL privacy uuid. Note that the debug exp feature is guarded
> > > > by CONFIG_BT_FEATURE_DEBUG. So I am not sure how the kernel is
> > > > configured and made on your test setup.
> > > >
> > > >   If we fix the mgmt-tester in bluez to have 3 or 4 (which one?)
> > > > features before merging the kernel changes here that adds a new
> > > > quality exp feature, it would not match the existing kernel which has
> > > > only 2 or 3 features.
> > > >
> > > >   Do you have any preference about how to fix the mgmt-tester?
> > > >
> > > >   My suggestion is to remove the checking of the feature count from
> > > > the mgmt-tester. The feature count changes over time. It is possible
> > > > to implement a customized exp_feat_check function which can be more
> > > > flexible. If a uuid is found in the MGMT response, its associated
> > > > flags are checked against.
> > > >
> > > >   The data currently used in the mgmt-tester:
> > > >
> > > > static const uint8_t read_exp_feat_param_success[] = {
> > > > 0x02, 0x00, /* Feature Count */
> > > > 0xd6, 0x49, 0xb0, 0xd1, 0x28, 0xeb, /* UUID - Simultaneous */
> > > > 0x27, 0x92, 0x96, 0x46, 0xc0, 0x42, /* Central Peripheral */
> > > > 0xb5, 0x10, 0x1b, 0x67,
> > > > 0x00, 0x00, 0x00, 0x00, /* Flags */
> > > > 0x04, 0x00, 0x13, 0xac, 0x42, 0x02, /* UUID - LL Privacy */
> > > > 0xde, 0xb3, 0xea, 0x11, 0x73, 0xc2,
> > > > 0x48, 0xa1, 0xc0, 0x15,
> > > > 0x02, 0x00, 0x00, 0x00, /* Flags */
> > > > };
> > > >
> > > >
> > > >   Please let me know what you think.
> > > >
> > > > Thanks and regards,
> > > > Joseph
> > > >
> > > >
> > > > On Tue, Aug 17, 2021 at 1:49 AM Luiz Augusto von Dentz
> > > > <luiz.dentz@gmail.com> wrote:
> > > > >
> > > > > Hi Joseph,
> > > > >
> > > > > On Sun, Aug 15, 2021 at 6:25 AM <bluez.test.bot@gmail.com> wrote:
> > > > > >
> > > > > > This is automated email and please do not reply to this email!
> > > > > >
> > > > > > Dear submitter,
> > > > > >
> > > > > > Thank you for submitting the patches to the linux bluetooth mailing list.
> > > > > > This is a CI test results with your patch series:
> > > > > > PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=531683
> > > > > >
> > > > > > ---Test result---
> > > > > >
> > > > > > Test Summary:
> > > > > > CheckPatch                    PASS      2.92 seconds
> > > > > > GitLint                       PASS      0.61 seconds
> > > > > > BuildKernel                   PASS      598.41 seconds
> > > > > > TestRunner: Setup             PASS      394.12 seconds
> > > > > > TestRunner: l2cap-tester      PASS      2.89 seconds
> > > > > > TestRunner: bnep-tester       PASS      2.07 seconds
> > > > > > TestRunner: mgmt-tester       FAIL      30.94 seconds
> > > > > > TestRunner: rfcomm-tester     PASS      2.31 seconds
> > > > > > TestRunner: sco-tester        PASS      2.20 seconds
> > > > > > TestRunner: smp-tester        FAIL      2.27 seconds
> > > > > > TestRunner: userchan-tester   PASS      2.09 seconds
> > > > > >
> > > > > > Details
> > > > > > ##############################
> > > > > > Test: CheckPatch - PASS - 2.92 seconds
> > > > > > Run checkpatch.pl script with rule in .checkpatch.conf
> > > > > >
> > > > > >
> > > > > > ##############################
> > > > > > Test: GitLint - PASS - 0.61 seconds
> > > > > > Run gitlint with rule in .gitlint
> > > > > >
> > > > > >
> > > > > > ##############################
> > > > > > Test: BuildKernel - PASS - 598.41 seconds
> > > > > > Build Kernel with minimal configuration supports Bluetooth
> > > > > >
> > > > > >
> > > > > > ##############################
> > > > > > Test: TestRunner: Setup - PASS - 394.12 seconds
> > > > > > Setup environment for running Test Runner
> > > > > >
> > > > > >
> > > > > > ##############################
> > > > > > Test: TestRunner: l2cap-tester - PASS - 2.89 seconds
> > > > > > Run test-runner with l2cap-tester
> > > > > > Total: 40, Passed: 40 (100.0%), Failed: 0, Not Run: 0
> > > > > >
> > > > > > ##############################
> > > > > > Test: TestRunner: bnep-tester - PASS - 2.07 seconds
> > > > > > Run test-runner with bnep-tester
> > > > > > Total: 1, Passed: 1 (100.0%), Failed: 0, Not Run: 0
> > > > > >
> > > > > > ##############################
> > > > > > Test: TestRunner: mgmt-tester - FAIL - 30.94 seconds
> > > > > > Run test-runner with mgmt-tester
> > > > > > Total: 448, Passed: 444 (99.1%), Failed: 1, Not Run: 3
> > > > > >
> > > > > > Failed Test Cases
> > > > > > Read Exp Feature - Success                           Failed       0.012 seconds
> > > > >
> > > > > Looks like there is a regression on mgmt-tester:
> > > > >
> > > > > Read Exp Feature - Success - run
> > > > >   Sending Read Experimental Features Information (0x0049)
> > > > >   Test condition added, total 1
> > > > >   Read Experimental Features Information (0x0049): Success (0x00)
> > > > >   Invalid cmd response parameter size
> > > > > Read Exp Feature - Success - test failed
> > > > >
> > > > > >
> > > > > > ##############################
> > > > > > Test: TestRunner: rfcomm-tester - PASS - 2.31 seconds
> > > > > > Run test-runner with rfcomm-tester
> > > > > > Total: 9, Passed: 9 (100.0%), Failed: 0, Not Run: 0
> > > > > >
> > > > > > ##############################
> > > > > > Test: TestRunner: sco-tester - PASS - 2.20 seconds
> > > > > > Run test-runner with sco-tester
> > > > > > Total: 8, Passed: 8 (100.0%), Failed: 0, Not Run: 0
> > > > > >
> > > > > > ##############################
> > > > > > Test: TestRunner: smp-tester - FAIL - 2.27 seconds
> > > > > > Run test-runner with smp-tester
> > > > > > Total: 8, Passed: 7 (87.5%), Failed: 1, Not Run: 0
> > > > > >
> > > > > > Failed Test Cases
> > > > > > SMP Client - SC Request 2                            Failed       0.024 seconds
> > > > > >
> > > > > > ##############################
> > > > > > Test: TestRunner: userchan-tester - PASS - 2.09 seconds
> > > > > > Run test-runner with userchan-tester
> > > > > > Total: 3, Passed: 3 (100.0%), Failed: 0, Not Run: 0
> > > > > >
> > > > > >
> > > > > >
> > > > > > ---
> > > > > > Regards,
> > > > > > Linux Bluetooth
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Luiz Augusto von Dentz
> > > >
> > > >
> > > >
> > > > --
> > > >
> > > > Joseph Shyh-In Hwang
> > > > Email: josephsih@google.com
> > >
> > >
> > >
> > > --
> > >
> > > Joseph Shyh-In Hwang
> > > Email: josephsih@google.com
> >
> >
> >
> > --
> > Luiz Augusto von Dentz
>
>
>
> --
>
> Joseph Shyh-In Hwang
> Email: josephsih@google.com



-- 

Joseph Shyh-In Hwang
Email: josephsih@google.com
