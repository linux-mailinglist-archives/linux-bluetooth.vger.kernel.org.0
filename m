Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 136734B7FE9
	for <lists+linux-bluetooth@lfdr.de>; Wed, 16 Feb 2022 06:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241596AbiBPFOC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 16 Feb 2022 00:14:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234289AbiBPFOC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 16 Feb 2022 00:14:02 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B62C27B2D
        for <linux-bluetooth@vger.kernel.org>; Tue, 15 Feb 2022 21:13:51 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id a11-20020a17090a740b00b001b8b506c42fso5474045pjg.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 15 Feb 2022 21:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=RYupViMi8L0yVClW1vJ4gVeavnx155e8HDArg95QPJ8=;
        b=jgNeIDq3Yi9/iCB5C6xfth2iGnbLKw831DGLvmPrMsEd8NZo8+BQ/exYpkreHNNp6e
         fBQ0XgyNyc17pEMWNvsdAtqnkJHZxMK02wqOWhpjPLR/jhC+zzuOveDcrh2cETqZbsQG
         fteS/SfBXxhSiDhME9/SdMUxJc5LuIgVk2JUq2P1MMmm0xcXOae3ZG+qXuHAds2i3F1R
         ZDAdJu2iKC+CjLeP1Vp7JVimjEatjW3WQt9pU1/yJPVnz5YfDlDQ6MFuyBU64Ix8FgH0
         jFVi4e10wXuydasdMFMgbmMu53YJaCv4f3VVgdqi8nIRnH9HWP29iHOTLHKTU8s9oZEY
         2I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=RYupViMi8L0yVClW1vJ4gVeavnx155e8HDArg95QPJ8=;
        b=4sZV6BTsZQC0quvN24KK+wcky24SAeRHTDYWmJHFcfmw42GxZ2UHuxhaoGhJZos5gv
         +kj+RJO12uK709OBqs+/92LnENeFUIzxN827UJAP8xigG/iR2zzPM+Vu4CvMGAlby962
         IS/lQBH7GXl62e7xmjcOaBuEBKo5ppw2Jw/qbO1FCu721u20SnDsgi2UzHv+S5ten4Jd
         x72W5itSkkLrOg33RnX4P3dmUax93ElKw8mZkvoWCc6KV2GAiSrKt+ycGhigwuE99NvY
         aq6OxmtDoJUfwwMsNnhwi49sFwhe2vQmrAnTnpa2THOyHlnNDwB7alJXUo7byHL1Mbkp
         J5NA==
X-Gm-Message-State: AOAM53275dl1R9VpQBPsaFAfKXPOhUk9ysIwEU5oHy6chsoQWwlXy0vf
        8r1CAq522UxUi8yGi+GXYXkH0B3G//s=
X-Google-Smtp-Source: ABdhPJwOE4ChdZxl2ap0TOZzqdGtVUgAuHJk99HCDigRQQyxccW4a9dyMcdOD3uEITHiFOI8GQsDbg==
X-Received: by 2002:a17:902:d886:b0:14d:5b6f:5bbe with SMTP id b6-20020a170902d88600b0014d5b6f5bbemr905328plz.127.1644988430416;
        Tue, 15 Feb 2022 21:13:50 -0800 (PST)
Received: from [172.17.0.2] ([52.183.100.121])
        by smtp.gmail.com with ESMTPSA id d16sm35112984pfj.1.2022.02.15.21.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 21:13:50 -0800 (PST)
Message-ID: <620c880e.1c69fb81.65c34.6c39@mx.google.com>
Date:   Tue, 15 Feb 2022 21:13:50 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============6033543071441233027=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, linma@zju.edu.cn
Subject: RE: [v1] Bluetooth: fix data races in smp_unregister(), smp_del_chan()
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20220216043714.22011-1-linma@zju.edu.cn>
References: <20220216043714.22011-1-linma@zju.edu.cn>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============6033543071441233027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=614795

---Test result---

Test Summary:
CheckPatch                    PASS      0.77 seconds
GitLint                       PASS      0.42 seconds
SubjectPrefix                 PASS      0.24 seconds
BuildKernel                   PASS      36.72 seconds
BuildKernel32                 PASS      31.95 seconds
Incremental Build with patchesPASS      43.85 seconds
TestRunner: Setup             PASS      576.01 seconds
TestRunner: l2cap-tester      PASS      15.71 seconds
TestRunner: bnep-tester       PASS      7.06 seconds
TestRunner: mgmt-tester       PASS      122.73 seconds
TestRunner: rfcomm-tester     FAIL      8.94 seconds
TestRunner: sco-tester        PASS      9.15 seconds
TestRunner: smp-tester        PASS      9.07 seconds
TestRunner: userchan-tester   PASS      7.41 seconds

Details
##############################
Test: TestRunner: rfcomm-tester - FAIL - 8.94 seconds
Run test-runner with rfcomm-tester
Total: 10, Passed: 9 (90.0%), Failed: 1, Not Run: 0

Failed Test Cases
Basic RFCOMM Socket Client - Write 32k Success       Failed       0.192 seconds



---
Regards,
Linux Bluetooth


--===============6033543071441233027==--
