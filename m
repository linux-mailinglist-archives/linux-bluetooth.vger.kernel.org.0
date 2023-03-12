Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 543736B62D7
	for <lists+linux-bluetooth@lfdr.de>; Sun, 12 Mar 2023 03:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjCLCQB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 11 Mar 2023 21:16:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCLCP7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 11 Mar 2023 21:15:59 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B4838B61
        for <linux-bluetooth@vger.kernel.org>; Sat, 11 Mar 2023 18:15:58 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id kb15so8849945pjb.1
        for <linux-bluetooth@vger.kernel.org>; Sat, 11 Mar 2023 18:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678587358;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=shDMCRc+SLE+tBvEWwBjnCkSUK+DM4p3HyT3kOGDboE=;
        b=jpAhNbm+B7gZihRnX/pEmkZqJW15fr0h+i+nKaSv8FDqya3TOVJ7LSJ2HC5FhBWhnx
         hrQaLQLesXWM9wBnpahALex+vt26uYoj7DLcbAHe5e1nVIOx7hB4rNFcPXY687j5we4S
         gJRq1hNt1HljW/a+swUA5q97Z3DM/byqt3ybywceQPUINU/nerAZRJIPZPo6UfZw0mte
         GPwTZfmSwm69TMWCaABTrKlfjEjpMWy+wAABAtw34IVVJ02+eIehn1AIirMer3L7Ob3X
         FjK02JYgFDCwt+OgV609x7+N6np7LvoTLBIHNhvfCqHF6Cy8ALYieXDgJHkvEZJjBgLm
         qIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678587358;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shDMCRc+SLE+tBvEWwBjnCkSUK+DM4p3HyT3kOGDboE=;
        b=mYrIdLDW/N5ZYEqcFkmLUvERjJ/6pEjTZRHrSQtLfpqqinNSzdpDT6aPVpJdhOM+ex
         lU+R8gurKQkvrHftb9uYu/bPnCbEZxtK60LPuieatD/YFtGEe+0JppU5Mx8oGzn5K4Go
         bqJEH+x5oNHGDW4T3dAg/zs11AspoanMj6IDoybq75a5Mfc+yuRYAV5zvC53WkdsqzYs
         uKswO1gGmpn2Coa+9MPeXA4NOLdmal+vaalQ+kNMg7sCoqj3N/o13cs5Bq4nFAwH0Tvd
         R+ecJ2aGfSc/Qt5xwzOw+jL/0sS1QJiFxAyBhgbNZnL7AAWdxKJT+eKiXudXJ6HHm3ng
         Tt8Q==
X-Gm-Message-State: AO0yUKX/IBOP4dF/r7kzDTMxB5y61tvj0ZbXvKJImunYLbvD8NluzXoi
        ttXR19Vo88O8zdnJoWfsa1QbOtty5nY=
X-Google-Smtp-Source: AK7set/X+jeQ6T7Thwf+PG2IATidxCPzP5uFm/j7IwYxhDMYOIqZZUdq8BytpfKTFEIMik/yENAWMQ==
X-Received: by 2002:a17:903:40d0:b0:19c:aa17:6660 with SMTP id t16-20020a17090340d000b0019caa176660mr29829604pld.23.1678587357900;
        Sat, 11 Mar 2023 18:15:57 -0800 (PST)
Received: from [172.17.0.2] ([20.171.70.71])
        by smtp.gmail.com with ESMTPSA id m3-20020a1709026bc300b0019896d29197sm2128980plt.46.2023.03.11.18.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 18:15:57 -0800 (PST)
Message-ID: <640d35dd.170a0220.8ac3a.3ebc@mx.google.com>
Date:   Sat, 11 Mar 2023 18:15:57 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============1879941212882512368=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, lukasz.rymanowski@codecoup.pl
Subject: RE: Btmon: Fix handling not complete packets
In-Reply-To: <20230311233640.103858-2-lukasz.rymanowski@codecoup.pl>
References: <20230311233640.103858-2-lukasz.rymanowski@codecoup.pl>
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

--===============1879941212882512368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=729126

---Test result---

Test Summary:
CheckPatch                    PASS      0.37 seconds
GitLint                       PASS      0.24 seconds
BuildEll                      PASS      27.08 seconds
BluezMake                     PASS      982.87 seconds
MakeCheck                     PASS      11.40 seconds
MakeDistcheck                 PASS      150.81 seconds
CheckValgrind                 PASS      247.53 seconds
CheckSmatch                   PASS      330.11 seconds
bluezmakeextell               PASS      99.16 seconds
IncrementalBuild              PASS      843.22 seconds
ScanBuild                     PASS      1040.12 seconds



---
Regards,
Linux Bluetooth


--===============1879941212882512368==--
