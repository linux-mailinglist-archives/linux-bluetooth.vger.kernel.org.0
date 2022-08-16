Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C41B595FBD
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Aug 2022 17:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235991AbiHPP7H (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 16 Aug 2022 11:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236025AbiHPP6i (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 16 Aug 2022 11:58:38 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 358A6F590
        for <linux-bluetooth@vger.kernel.org>; Tue, 16 Aug 2022 08:56:02 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id o2so8516370iof.8
        for <linux-bluetooth@vger.kernel.org>; Tue, 16 Aug 2022 08:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:to:from:reply-to:subject:mime-version:date
         :message-id:from:to:cc;
        bh=VDWcb8XRKIxB9Y0Rg9LiVx/tZDH5X4h0oxOhW6Z4NkM=;
        b=j73nuWxrj8fSLsS+NFCZKdr5Lwj/hqeLOKhnJidyN2Q8HwQd20KMZ7y3JUxlt4BGZB
         +NCO3KP9+QH3TsHWZzxZD0iTfiYbYua8qmSZqCNI8xh8SgqFuC4yn4g+LWrKcsfuZP2q
         TnYWH4NcZvVmhfPcN6Yt+J6HxT2Vv+ZFXPP2f191uY3+4GUJ/2a6lHhh/djFVUumEORr
         cxBp6lGMkHvJvv1R0F00t1n7gbGlkFBOEH0M5on1JkDBIESWa5Tnj2ZzDZhAA7/h9XV1
         rGVGKkIvvR/kB+i8glR2Uy7Xo7yhz8tFvUx4Igf18jv9RkvISzQspTIhEFYtMQeAqeuN
         KTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:to:from:reply-to:subject:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=VDWcb8XRKIxB9Y0Rg9LiVx/tZDH5X4h0oxOhW6Z4NkM=;
        b=tZiAsWhsUUicyizzEc0hNq0JE2OWRMmSRbQ4LjXSNIdSJGxSozc1yltaEhgHgGLI9J
         gbsfpj/otAx6IcTSNgrXA6iausk/LjtLo902Nw/v3UnTdW5f0foQxt6Bok7CY0xw9s9y
         /Y67hlec9iMxW65Qrse5lk8U084KmmZYQvfTq1+91eISfbi2czqlKPD55HElytDtZesl
         a5RDyulJE5qqk1bAFsnOTeikeUQa95e8p+hkmPGLRnvUX1LfbHVmSwL6jtnI2wuR6AkD
         f/zOhWQYBONlmkJRn11w4RxeaqB/52SIM3ZwafoRfoQ0bBe7ECCdtq/5Dp5H8563mSAr
         CtxA==
X-Gm-Message-State: ACgBeo20hVpD0I1BRuugP9stY5AMdcl/dyAHGb6gLskwA95bOyk0Jg7Q
        jPJwgos1QhNHEKpN48DlvoCEP+8rQUI=
X-Google-Smtp-Source: AA6agR4RRh76ZiXm0rfLQBssADESzGcHRjOMPh5i9lWT4VqCRrXdTreQDc+tp8zTY4wC2cfJEvx4XA==
X-Received: by 2002:a05:6638:2195:b0:342:9d4c:b598 with SMTP id s21-20020a056638219500b003429d4cb598mr9353549jaj.61.1660665361440;
        Tue, 16 Aug 2022 08:56:01 -0700 (PDT)
Received: from [172.17.0.2] ([40.122.125.225])
        by smtp.gmail.com with ESMTPSA id r19-20020a056638301300b003434bced7a2sm4530949jak.39.2022.08.16.08.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 08:56:00 -0700 (PDT)
Message-ID: <62fbbe10.050a0220.2e174.42b1@mx.google.com>
Date:   Tue, 16 Aug 2022 08:56:00 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============0483232238716551308=="
MIME-Version: 1.0
Subject: RE: [v2] Bluetooth: Move hci_abort_conn to hci_conn.c
Reply-To: linux-bluetooth@vger.kernel.org
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, brian.gix@intel.com
In-Reply-To: <20220816152606.973841-1-brian.gix@intel.com>
References: <20220816152606.973841-1-brian.gix@intel.com>
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============0483232238716551308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is an automated email and please do not reply to this email.

Dear Submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While preparing the CI tests, the patches you submitted couldn't be applied to the current HEAD of the repository.

----- Output -----
error: patch failed: net/bluetooth/hci_request.c:909
error: net/bluetooth/hci_request.c: patch does not apply
error: patch failed: net/bluetooth/hci_request.h:73
error: net/bluetooth/hci_request.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch


Please resolve the issue and submit the patches again.


---
Regards,
Linux Bluetooth


--===============0483232238716551308==--
