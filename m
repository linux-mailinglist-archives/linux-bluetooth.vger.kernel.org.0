Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF96B70A1C5
	for <lists+linux-bluetooth@lfdr.de>; Fri, 19 May 2023 23:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjESVba (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 19 May 2023 17:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjESVb3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 19 May 2023 17:31:29 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6D9F2
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 May 2023 14:31:28 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-3f38b7ca98aso33359081cf.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 19 May 2023 14:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684531887; x=1687123887;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8A+3uLOtTIxl9vbat4z4eFbaq5x1fRBSqcOJtGv5Si0=;
        b=XGOeoYTMKyvwjZd0nEc2Tx5I6BdzlIUZdmFV/nrlvoiWgum1DkGd/ELb0jOeWATxPW
         /IFfKwFQrPZG6euOE4S/BR3BfamGwBgS4UeiMp7wuP0fszh4pO9NjREvsiGCm624nxr8
         kigT1KqpHT1oolpaK1VKGXyUUS952pVhiF65ZbqM5ZVjcAvkpU9wlsADwwrFuTd6g2FK
         SU6jnzoNCJpXYvcbLMVVMHTQpC1cl3sKKMii62Uo6SyR6d+97FrJ//hg/gy9DfNKgdMF
         3BJSyDPq+yc2s+gW7FjkNHaH7lveInZjpqqZ1daLaAyEVXsFJbg738gBsee+rdLWeRpi
         VBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684531887; x=1687123887;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8A+3uLOtTIxl9vbat4z4eFbaq5x1fRBSqcOJtGv5Si0=;
        b=daUbNU4kkE7swmxlKCmTsruqCDoWb3GxLlMKNghSeeb4lmG6nhjeuNzHW0iBfweDby
         ZILJtbMTFCRhuYw3AAO7HwyYf92nvQWMa743v75VKS82MXDQtna36d2zzzKDorL5RCYE
         jvve9W2M//PlxVzFK/x2m+kyjUwVe6wXrMG9ozB7JC7NydnEAlwqjF+cNU0WzAuQGrzn
         PMZCSF58ZNNHi99KRaDN2ZeUn/3PQvx2RH2+7Ntn0O+Smj+0SRD2tUF3RtXtdlY3q42t
         nImDmNnf+Y7hxAXpOICa5dS8IxwMxlpmzY/EuBF+sa67y9xRTTkzQLWD10P2QzOmKr0v
         RqoA==
X-Gm-Message-State: AC+VfDzVsyW3HRz7z3eVP1b221i+3ftRnSAQodQJMtDwHYtcEClydKg/
        LMIav8IOUS5NO5HyGPRpM88YQZlIVPI=
X-Google-Smtp-Source: ACHHUZ5XiyuyOQIyAbaxqVXXcRZwcwPWe0xoDPPt9nkkSKw7maXxnJMeLNNhyLrJyQUVF29mQdM/sA==
X-Received: by 2002:a05:622a:164f:b0:3f5:371e:5ff2 with SMTP id y15-20020a05622a164f00b003f5371e5ff2mr5918022qtj.67.1684531887154;
        Fri, 19 May 2023 14:31:27 -0700 (PDT)
Received: from [172.17.0.2] ([52.226.113.40])
        by smtp.gmail.com with ESMTPSA id w13-20020a05620a128d00b0074df20fb43dsm1381008qki.97.2023.05.19.14.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 14:31:26 -0700 (PDT)
Message-ID: <6467eaae.050a0220.b7172.8585@mx.google.com>
Date:   Fri, 19 May 2023 14:31:26 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============0320139221320323548=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, Larry.Finger@lwfinger.net
Subject: RE: [V2] Bluetooth: Add device 0bda:b85e to device tables
In-Reply-To: <20230519205151.9659-1-Larry.Finger@lwfinger.net>
References: <20230519205151.9659-1-Larry.Finger@lwfinger.net>
Reply-To: linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============0320139221320323548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=749379

---Test result---

Test Summary:
CheckPatch                    PASS      0.70 seconds
GitLint                       PASS      0.34 seconds
SubjectPrefix                 PASS      0.13 seconds
BuildKernel                   PASS      31.66 seconds
CheckAllWarning               PASS      34.63 seconds
CheckSparse                   PASS      39.63 seconds
CheckSmatch                   PASS      108.31 seconds
BuildKernel32                 PASS      30.82 seconds
TestRunnerSetup               PASS      442.06 seconds
TestRunner_l2cap-tester       PASS      17.21 seconds
TestRunner_iso-tester         PASS      21.20 seconds
TestRunner_bnep-tester        PASS      5.64 seconds
TestRunner_mgmt-tester        PASS      115.33 seconds
TestRunner_rfcomm-tester      PASS      9.00 seconds
TestRunner_sco-tester         PASS      8.37 seconds
TestRunner_ioctl-tester       PASS      9.75 seconds
TestRunner_mesh-tester        PASS      7.21 seconds
TestRunner_smp-tester         PASS      8.26 seconds
TestRunner_userchan-tester    PASS      5.91 seconds
IncrementalBuild              PASS      28.93 seconds



---
Regards,
Linux Bluetooth


--===============0320139221320323548==--
