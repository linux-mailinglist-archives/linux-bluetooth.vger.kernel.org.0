Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE996B557D
	for <lists+linux-bluetooth@lfdr.de>; Sat, 11 Mar 2023 00:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbjCJXUB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Mar 2023 18:20:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbjCJXTk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Mar 2023 18:19:40 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BCCFDDB2E
        for <linux-bluetooth@vger.kernel.org>; Fri, 10 Mar 2023 15:19:20 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id bf15so2679608iob.7
        for <linux-bluetooth@vger.kernel.org>; Fri, 10 Mar 2023 15:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678490359;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VgxGDKytYB5TEBnrfThGNFSsD57P3bRpHMy2unjDeY8=;
        b=OUukDHPscub9iIjaLPSMCNWtqeKYvrBNIaUkKFUoEftvOGfn13QCg0agNjQw9WE4g5
         xAZfGjzUNX4Q6lBGHJsd1vb1ijMwVaPiw6Hv9uSS3Kizebx6zb+B5Qm39LUQ6Hu2gtHv
         wUZIgLcSoEExe0KI72c7LWy/5Q89SpfUQ6VfTyvnsf616sV0zZAmJZLgcQzeyTuSx0/z
         jEI2yUG0G5rK7VDcJGEopgrYgGQtrDyg4IP3QzRiy1r/jI7Hd2tr1k7hk8XCHrl7KOFs
         +zjHxFVITac7FPM23aRF8NlpIqeT/mcr8PWogaMt5sNLKhKKwrY4sgUvunt9+wvZUCKf
         1WPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678490359;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgxGDKytYB5TEBnrfThGNFSsD57P3bRpHMy2unjDeY8=;
        b=x2GTiuvdPWLOWQ2KiG+F+5DBNDKP0n9SjioVbiPeCcJZWtP9grl1L6pbjWg13wfyUB
         KzvWop1ycDBCN6ZKcd7WpOp4iqwHvJHI02QTINZLOvy6JH4Oe4fJNp47gfjEf6fgk/GQ
         wloU7i7dSHUczgiOsyDIgNw9FDswyMcAT9pCnL/qWMjIz51cVB6XsLuT5RsH67ffZ63g
         lYM8RmhS3fBCkzPu1lmsOgDRp7o2q30aEi0/HHCEP42m2zdRl9AthORcnj6oHkRhYafS
         qg4cq6cyi8tnfOuCTzEeqtp4wzU/5KJYWs44+A+0628QRTFeB5yF0hBQCXU/xGblaQWG
         1x4g==
X-Gm-Message-State: AO0yUKUe6W9RbTQlvjDxjDrS4ebHrX4qxLzEGOf/mXYnol/nxm/zjTrk
        Uo0F1Pd41LnA3qtRHyaKmHiPSKwEekU=
X-Google-Smtp-Source: AK7set8TNNhzE61AJNLghwMS66VX6KGwz6O2U2EtCMImxenxJntwniTyNXwAQwlEHHFysU3nH/1XaQ==
X-Received: by 2002:a5e:dd48:0:b0:74c:923c:7d84 with SMTP id u8-20020a5edd48000000b0074c923c7d84mr16345647iop.7.1678490359261;
        Fri, 10 Mar 2023 15:19:19 -0800 (PST)
Received: from [172.17.0.2] ([40.77.125.166])
        by smtp.gmail.com with ESMTPSA id a14-20020a6b660e000000b0073fe9d412fasm296548ioc.33.2023.03.10.15.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 15:19:18 -0800 (PST)
Message-ID: <640bbaf6.6b0a0220.c9fb6.09b8@mx.google.com>
Date:   Fri, 10 Mar 2023 15:19:18 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============6520139949669049708=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [v2,1/2] iso-tester: Update High Reliability presets
In-Reply-To: <20230310214001.3891437-1-luiz.dentz@gmail.com>
References: <20230310214001.3891437-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============6520139949669049708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=728899

---Test result---

Test Summary:
CheckPatch                    PASS      0.81 seconds
GitLint                       PASS      0.55 seconds
BuildEll                      PASS      26.66 seconds
BluezMake                     PASS      776.84 seconds
MakeCheck                     PASS      10.77 seconds
MakeDistcheck                 PASS      151.48 seconds
CheckValgrind                 PASS      242.28 seconds
CheckSmatch                   PASS      322.44 seconds
bluezmakeextell               PASS      96.77 seconds
IncrementalBuild              PASS      1246.78 seconds
ScanBuild                     PASS      988.68 seconds



---
Regards,
Linux Bluetooth


--===============6520139949669049708==--
