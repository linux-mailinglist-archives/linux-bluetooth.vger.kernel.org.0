Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B5372B08E
	for <lists+linux-bluetooth@lfdr.de>; Sun, 11 Jun 2023 09:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbjFKHDp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 11 Jun 2023 03:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjFKHDm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 11 Jun 2023 03:03:42 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBDB1B6
        for <linux-bluetooth@vger.kernel.org>; Sun, 11 Jun 2023 00:03:40 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-652dd220d67so3402334b3a.3
        for <linux-bluetooth@vger.kernel.org>; Sun, 11 Jun 2023 00:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686467020; x=1689059020;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9tx8kC/8j+neQWh3zjZzP7T7wepF2C59HEzKGRDHQJc=;
        b=a/e2BFJLxG+k3pAQFQeh74cchAtGQ05HqXFTiQxY1+uJ8UOrs+vgeQwD36MKohQ2z5
         5JPzs598NZHSRqL1cmwn0rOg+yu/MeGu9VLQHynMsVCMWbyJSE9+JVT623wjvFy+PwtK
         T/wBUGsv4R6IPR+mtMGT06OcK6OAY4Qsx/Imn4Vfq5PyS5zCw2UfBwMUNokOisKWyznC
         qu/orMgJgzQoVyb++pdtlMZy0Ym0Vc3wX1Av9bnjyWnyZSw01/TG1Jzxdk50sMThf8tL
         5X8E8G85SdALGmJpquR/i5Nw3WZh52Sgg8unEh8OWZBwWemIYvscXxnbNKQfQThIIxnd
         EGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686467020; x=1689059020;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tx8kC/8j+neQWh3zjZzP7T7wepF2C59HEzKGRDHQJc=;
        b=gYuVrDRgPuvNBT3Qw0etl3Y6EOKw0kTXgLnwVa8I5bUGML5vdFX/7ngFJZ/tjGUu8b
         Z98jK0EXMwUFbg+4NADz+dqjZM5For73I1g3QqkixInB4E2U1kVPYKc8+9w/pqGKRMhY
         juF2jx3xCQQPFURB+8Ha2ULFipxsxPdnnsKht3B5eyuz+EqhOOdLCEP0nQ5jIIlCGKni
         oYNQY2mD9Y995Ph8gIXPkW1v2o7LRP7fv9obCGph9Iyx0/ZsevMbmfL7SjPOfQhaY/Wd
         6Qs/Ga3QAxF6f/rw9lcD+3tSGyuEFSl7xye4JfgtqdFZOmXx186hdmtASrt2tai7p2ca
         AEcQ==
X-Gm-Message-State: AC+VfDzwNakTqTrIjgGOTP2UVt6spV9veLeHlaQQr9dVbxl/WMnTKVNC
        RufUdnWv66sp1uSuwBznGnmNC2dT9PA=
X-Google-Smtp-Source: ACHHUZ7ebt+dAbyLbGCKpDoiiqfGmQsAaHtaH+NBABhC3Ahgt8ATxrsLJydezOkar4J7dpf5Jkm4dQ==
X-Received: by 2002:a05:6a00:b87:b0:650:2660:1bcc with SMTP id g7-20020a056a000b8700b0065026601bccmr8618833pfj.8.1686467019814;
        Sun, 11 Jun 2023 00:03:39 -0700 (PDT)
Received: from [172.17.0.2] ([13.88.98.127])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b0065446092699sm5096424pff.141.2023.06.11.00.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 00:03:39 -0700 (PDT)
Message-ID: <648571cb.620a0220.cdf94.a0c1@mx.google.com>
Date:   Sun, 11 Jun 2023 00:03:39 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============1154850095167164925=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, kiran.k@intel.com
Subject: RE: [RESEND,v3] Bluetooth: btintel: Add support to reset bluetooth via ACPI DSM
In-Reply-To: <20230611064342.1587278-1-kiran.k@intel.com>
References: <20230611064342.1587278-1-kiran.k@intel.com>
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

--===============1154850095167164925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=756042

---Test result---

Test Summary:
CheckPatch                    PASS      1.36 seconds
GitLint                       PASS      0.27 seconds
SubjectPrefix                 PASS      0.07 seconds
BuildKernel                   PASS      45.98 seconds
CheckAllWarning               PASS      50.33 seconds
CheckSparse                   PASS      56.27 seconds
CheckSmatch                   PASS      152.06 seconds
BuildKernel32                 PASS      44.53 seconds
TestRunnerSetup               PASS      627.65 seconds
TestRunner_l2cap-tester       PASS      21.93 seconds
TestRunner_iso-tester         PASS      32.39 seconds
TestRunner_bnep-tester        PASS      7.78 seconds
TestRunner_mgmt-tester        PASS      149.93 seconds
TestRunner_rfcomm-tester      PASS      12.25 seconds
TestRunner_sco-tester         PASS      11.30 seconds
TestRunner_ioctl-tester       PASS      13.60 seconds
TestRunner_mesh-tester        PASS      9.98 seconds
TestRunner_smp-tester         PASS      11.07 seconds
TestRunner_userchan-tester    PASS      8.27 seconds
IncrementalBuild              PASS      41.65 seconds



---
Regards,
Linux Bluetooth


--===============1154850095167164925==--
