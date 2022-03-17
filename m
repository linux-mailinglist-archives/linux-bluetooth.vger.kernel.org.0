Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA5064DC23B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Mar 2022 10:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbiCQJDm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Mar 2022 05:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbiCQJDl (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Mar 2022 05:03:41 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6651D08CB
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Mar 2022 02:02:25 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id eq14so3753631qvb.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Mar 2022 02:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=0M1yGowVDcXb4UWE9Txv4zk/Nw8yJnSAcH4SIOfd97A=;
        b=dlp/BPAJBIiXzGWpGtaFCGZn0ZZPabwDHel2o9dZgky1owKzSAVfHpxj7327GvVGg1
         4aa53Z8fR4+w4rEGk2xbd/MDcVUQRmjTcwUiO2CPrxzQLJzMd3xqfcf+ORd2waFyoS3n
         NnCzfAONpnOK8yH5sVGvukJXLZ3IqhX7bIzM9U/yU1zB3HDiMsvW9SBlECm1DrcfCilu
         kdSzs7dleq7Z0wNxB5scj3T47OT6vEMxRtGbyjG9vBj3qH7JuHm6Qgfw23p8F/e6sHrh
         Q/IZfRS7zdiDnv0ZYvQ//WziP+V4P1x54Rjopiutyp1AnDW2oLu4xtU1kC3ic3D0kggp
         70aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=0M1yGowVDcXb4UWE9Txv4zk/Nw8yJnSAcH4SIOfd97A=;
        b=KttHid0q1BVHcYku0vXOTJyheMn1whhJqRxt/6gJdf3HqZt5UCjlzO6U6hf+DtTPBH
         S3qjvsM+In7qblubQBARHHsF41lnZSPvTiek+blM+cvy5dE5bziBGI1Hjzud/L3qX5Yn
         iCRKaaJjR39vVUpnxyeHjnmkPsy8rieEUoE4hWBQYa9c73V92h0K7pCeogJ3vegmF2xf
         YUmi9grIFKJjHi5AA9fcEy77vrAIx46nWJI45eEIagfUPoAqAILKMkKkQH/uJepdW3Aq
         FdzOywW5iMICGcDLmlu6aB8WS75cTvQtZTVgFL1f7nadovcQIxk/0cG5EHzOJp4UTL4r
         axGg==
X-Gm-Message-State: AOAM532mYBBPJtKV5XA8fiqNLmJQlxybDJ0h7E/yXDd4KTtTrkwAf40t
        L0jXM6fnYCGlxLqB1x5jDbaa1R54/1g=
X-Google-Smtp-Source: ABdhPJwI8o5DlBjp5/1wPLZe2RoqxA0P/uDP4lrqXgeikvp0T+1TuM73OzysJFcgz6ksVjJr3XR4Eg==
X-Received: by 2002:a05:6214:27c9:b0:43c:9a2b:8163 with SMTP id ge9-20020a05621427c900b0043c9a2b8163mr2557270qvb.52.1647507744308;
        Thu, 17 Mar 2022 02:02:24 -0700 (PDT)
Received: from [172.17.0.2] ([52.167.117.105])
        by smtp.gmail.com with ESMTPSA id e7-20020ac85987000000b002e1b7fa2201sm3192656qte.56.2022.03.17.02.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 02:02:24 -0700 (PDT)
Message-ID: <6232f920.1c69fb81.a8e34.2e40@mx.google.com>
Date:   Thu, 17 Mar 2022 02:02:24 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============8113065253557027237=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, dan.carpenter@oracle.com
Subject: RE: Bluetooth: btmtkuart: fix error handling in mtk_hci_wmt_sync()
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20220317075740.GE25237@kili>
References: <20220317075740.GE25237@kili>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============8113065253557027237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=624166

---Test result---

Test Summary:
CheckPatch                    PASS      1.65 seconds
GitLint                       PASS      1.00 seconds
SubjectPrefix                 PASS      0.86 seconds
BuildKernel                   PASS      30.48 seconds
BuildKernel32                 PASS      26.77 seconds
Incremental Build with patchesPASS      36.74 seconds
TestRunner: Setup             PASS      472.88 seconds
TestRunner: l2cap-tester      PASS      15.42 seconds
TestRunner: bnep-tester       PASS      6.11 seconds
TestRunner: mgmt-tester       PASS      101.58 seconds
TestRunner: rfcomm-tester     PASS      7.87 seconds
TestRunner: sco-tester        PASS      7.70 seconds
TestRunner: smp-tester        PASS      7.63 seconds
TestRunner: userchan-tester   PASS      6.42 seconds



---
Regards,
Linux Bluetooth


--===============8113065253557027237==--
