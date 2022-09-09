Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9D95B4148
	for <lists+linux-bluetooth@lfdr.de>; Fri,  9 Sep 2022 23:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbiIIVIY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 9 Sep 2022 17:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbiIIVIG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 9 Sep 2022 17:08:06 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CD931174B4
        for <linux-bluetooth@vger.kernel.org>; Fri,  9 Sep 2022 14:08:05 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id k12so2132629qkj.8
        for <linux-bluetooth@vger.kernel.org>; Fri, 09 Sep 2022 14:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=A/jeDw4kx4RlPYVSsfOfNE5tapDZP1Y3vt1pOF5iG74=;
        b=AfLoPu2fBibLPWJuEblU+i1gPMWbRH3lbvniq+lbGStuOXl8CWFACqMlAhg1kPulsM
         /gQTT1nT0CylhyUG4GwDd30yEBlKrp4A1l3MRgDdObLML+5gkiAAL8lRwIsvsgsvkIxw
         5vCcIEqqxCKeHWqrjY5+wnF/7gCeU7v+wdCDWm4EcSm0Xin7G+R8ROZbOIXE6kaRewAs
         u6KlG27YTF+VVskwKzxwB6hr8TWHlWnpiy3d1NosdEUax5LthPP+2Na0iQEx7mQ3r7zM
         v/m0ov7SMkw5rqKBLFYjQnA8rAcSnhoRu3itQqaryIZnn1aLG6tkBPF3I+4QbjkTo4UO
         mCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=A/jeDw4kx4RlPYVSsfOfNE5tapDZP1Y3vt1pOF5iG74=;
        b=Ibz+BBYRbsz8qGSkFJw1WQdfyjNbO46dPQ3T6ZZbUQ1tPe4UA4f7wL7xtSiIwCnuVM
         7Cq+6vtOmU6fVMj7+KH/3B0n/uBrk8xS+tzvCRcGUOvxB3Y/t3DRTfz0kDJYJMPEuz/2
         VXAFVhhOXmF2/XSR/lt9PttkmIxFsrjPvM8R8OpthMOeyoBtkJGkqQ/y5o2Jhas8NAMI
         UK2SLW1Ba1hL2dhH+8ssNsD1VA7zhmKILeGLzOBQ8ab3lzOJglv4PQ/SfMkCw5VNznIQ
         +H4lf4a8J4n8WUHAzay7ErSBODF0YfjTTvhab2hIOF8vOMtrVPGvS1ScgSjPLACCBrCe
         JQpg==
X-Gm-Message-State: ACgBeo1jb4goiaSsciYUQZb3R5EmFW+wje062fqgn6HRzlDVTuL9AGRQ
        OIudALGZRM2B6BtnSTcUQCQdG4TSW88=
X-Google-Smtp-Source: AA6agR7IxsCI2VNkKLswsCDlhpGEEfkF71imxD5o64uVllxlfn0eoiH16Q/RcTgrhM03tUtPd+MhYA==
X-Received: by 2002:a05:620a:688:b0:6bb:29aa:4ce4 with SMTP id f8-20020a05620a068800b006bb29aa4ce4mr11384542qkh.18.1662757684242;
        Fri, 09 Sep 2022 14:08:04 -0700 (PDT)
Received: from [172.17.0.2] ([20.10.164.52])
        by smtp.gmail.com with ESMTPSA id o11-20020ac8698b000000b00342f844e30fsm1103791qtq.31.2022.09.09.14.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 14:08:04 -0700 (PDT)
Message-ID: <631bab34.c80a0220.43445.4a3f@mx.google.com>
Date:   Fri, 09 Sep 2022 14:08:04 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============0712633291295958029=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, daniel@makrotopia.org
Subject: RE: Bluetooth: btusb: Add a new VID/PID 0e8d/0608 for MT7921
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <YxubXl/fxmBBDjVp@makrotopia.org>
References: <YxubXl/fxmBBDjVp@makrotopia.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============0712633291295958029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=675821

---Test result---

Test Summary:
CheckPatch                    PASS      1.61 seconds
GitLint                       PASS      1.00 seconds
SubjectPrefix                 PASS      0.92 seconds
BuildKernel                   PASS      34.54 seconds
BuildKernel32                 PASS      29.62 seconds
Incremental Build with patchesPASS      44.26 seconds
TestRunner: Setup             PASS      499.49 seconds
TestRunner: l2cap-tester      PASS      16.86 seconds
TestRunner: iso-tester        PASS      15.66 seconds
TestRunner: bnep-tester       PASS      6.32 seconds
TestRunner: mgmt-tester       PASS      99.11 seconds
TestRunner: rfcomm-tester     PASS      9.87 seconds
TestRunner: sco-tester        PASS      9.39 seconds
TestRunner: smp-tester        PASS      9.44 seconds
TestRunner: userchan-tester   PASS      6.47 seconds



---
Regards,
Linux Bluetooth


--===============0712633291295958029==--
