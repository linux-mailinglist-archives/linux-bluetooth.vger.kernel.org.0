Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D753F7E00E0
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Nov 2023 11:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233511AbjKCHgv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Nov 2023 03:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233216AbjKCHgu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Nov 2023 03:36:50 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68D8134
        for <linux-bluetooth@vger.kernel.org>; Fri,  3 Nov 2023 00:36:47 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2800f7c8125so2373023a91.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 03 Nov 2023 00:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698997007; x=1699601807; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y94mI20bOU+7az8Ag6EfNTgFeC9f1gCG6sViad1/7v4=;
        b=Xn5GzmuTdZ0wZZn/yZ05gF8HqgBFjrBI/X4NAvRIx6OQTVmMRvf3vEZSln4GrQiUrg
         pGQcMR0IfUT0Nca66/Z8+4/fmuxl77Edf7DEDDSOZk3Kdel7pi/eZNU3olq8oWjqQpJv
         U+dy5vTRsdSppd+K+6/GDsYwYp343edltIdisDkCysAsOGfJAwcWwT/c1p+K7x3l1LiD
         lCAKkkP7TO3LOrTRJfrvg3d4xXQDUjWxn8pPgz4mpaTEakXHjh9REgEaz8m17Cdq7Q3P
         ulpg0BqGocO81MqTFrmdljbRaOvBKGLguvaWkDPfD1jPwK3XWF5AxD7NiqfsgZvNLfoJ
         m/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698997007; x=1699601807;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y94mI20bOU+7az8Ag6EfNTgFeC9f1gCG6sViad1/7v4=;
        b=wwUxgPya2BkP4gfozrXxy3eU9OKzpGcUFmx3csCXnlEf7pV0Na2BjMdEnd7bW2DCLa
         5MtIyUFij82///pIco80ZF6ouyuZtT4Zel1+8UJY4iNItfqH90GJPHTd23C0LRV7g5Ua
         LFfu3HoS4zEyE0nQw7MX5q8iyFAHMPGiml4dDXWxgbXQe2GcQmjNozYDHGsRvBEeM//V
         taiGn8LlBJHmC72wVPjFmVnK+R2KWWpPAWwrnnEt8TwwdS0FqIm1iaQ6Prd9Q47vuAmO
         sEd9rNcZjkxqcRb3h3H+UI86U/722lRk/bRakhdxizUxMeAhu+T8GkVhM+79FmEX51d8
         mF2w==
X-Gm-Message-State: AOJu0Yxi4NJKEHQMekYwhdVwl9BkjmZ0WfU43rPGwIP71BAFF0qhmain
        gu8EPaK1EwVVd6pNJ1hErIgzT+QmKKA=
X-Google-Smtp-Source: AGHT+IFgjlK4sfLORFhEaOpDJOF+18V9ZsRTtmp6B9dW1UT/ztEDZNZtgJ0TkZQhF0l28kes3TkBxw==
X-Received: by 2002:a17:90b:4d12:b0:280:2b48:f264 with SMTP id mw18-20020a17090b4d1200b002802b48f264mr2817968pjb.0.1698997007143;
        Fri, 03 Nov 2023 00:36:47 -0700 (PDT)
Received: from [172.17.0.2] ([4.227.0.225])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a000e00b0027ced921e80sm980739pja.38.2023.11.03.00.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 00:36:46 -0700 (PDT)
Message-ID: <6544a30e.170a0220.60100.2e23@mx.google.com>
Date:   Fri, 03 Nov 2023 00:36:46 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============5981098270388039184=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, quic_zijuhu@quicinc.com
Subject: RE: [v2,1/1] Bluetooth: hci_event: Correct power save marking logic
In-Reply-To: <1698995103-2273-1-git-send-email-quic_zijuhu@quicinc.com>
References: <1698995103-2273-1-git-send-email-quic_zijuhu@quicinc.com>
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

--===============5981098270388039184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=798561

---Test result---

Test Summary:
CheckPatch                    PASS      0.54 seconds
GitLint                       PASS      0.24 seconds
SubjectPrefix                 PASS      0.07 seconds
BuildKernel                   PASS      33.40 seconds
CheckAllWarning               PASS      36.70 seconds
CheckSparse                   WARNING   42.29 seconds
CheckSmatch                   WARNING   117.28 seconds
BuildKernel32                 PASS      33.35 seconds
TestRunnerSetup               PASS      511.11 seconds
TestRunner_l2cap-tester       PASS      29.59 seconds
TestRunner_iso-tester         PASS      51.61 seconds
TestRunner_bnep-tester        PASS      10.03 seconds
TestRunner_mgmt-tester        PASS      211.20 seconds
TestRunner_rfcomm-tester      PASS      15.13 seconds
TestRunner_sco-tester         PASS      18.46 seconds
TestRunner_ioctl-tester       PASS      17.30 seconds
TestRunner_mesh-tester        PASS      12.58 seconds
TestRunner_smp-tester         PASS      13.43 seconds
TestRunner_userchan-tester    PASS      10.34 seconds
IncrementalBuild              PASS      31.13 seconds

Details
##############################
Test: CheckSparse - WARNING
Desc: Run sparse tool with linux kernel
Output:
net/bluetooth/hci_event.c: note: in included file (through include/net/bluetooth/hci_core.h):
##############################
Test: CheckSmatch - WARNING
Desc: Run smatch tool with source
Output:
net/bluetooth/hci_event.c: note: in included file (through include/net/bluetooth/hci_core.h):


---
Regards,
Linux Bluetooth


--===============5981098270388039184==--
