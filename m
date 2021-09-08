Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B2940313A
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Sep 2021 00:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344579AbhIGW5f (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Sep 2021 18:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhIGW5f (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Sep 2021 18:57:35 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B0DC061575
        for <linux-bluetooth@vger.kernel.org>; Tue,  7 Sep 2021 15:56:28 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id p17so303760qvo.8
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 Sep 2021 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=kAGBFS4hMlty8yOQan6kv5L6UEW4ugt5pk4rBJLCGpU=;
        b=pZzxdYvoQejkbvzNmwyMxQYwTrpOZGRZFSNKFPpQPghyIgpMxaN8uczTA+LiaeEA23
         h9Z5lFqfB0cQS7yRPjaeYx57edOc13Wggd/7vWZSbbB10OmOeML7GqsGOUrH5ucl7Im+
         YzGCCa2wPDvSCdY1x4ikkH/bC8u7BazLNdTL6DIvumof3QgbgQY5FANOWzKZKAI0RgBD
         MatlccGBy3NMkuPvEvMHnhs1kvabvG4hLPF40tmkqCNn5Yi2iP/quugQpi9jSs7kfRIU
         TCoTDW7d7+UsZMkrqgdhyW8C7BPsCLocz6EQnqxk0eZ83kT0JRKAdA9WfQQl3fYjJDXK
         4Tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=kAGBFS4hMlty8yOQan6kv5L6UEW4ugt5pk4rBJLCGpU=;
        b=INmWxWJxkfqUovSGvX8STMWKIJleyIi1DdBK6ltfJ2E4VrNq0nOgcY7PjUA0vOCAlr
         dW5auh4r9YT3etJiDl3f9+deiIUEzM0TwgsvRaJRx4Fn2aIivGatQOd4548JagSh7J6n
         mFK+aIpXmwQSeH3DH2D7i6GkW64cJlFmRAOu1aekfzacYx8TE2WYVX+jnM/Ovi0FB/FH
         a62BLpKDeSb8OPQHrK176W825OWLkoLRuRCFknbSFrIjpZGw9vvFV/R4ia58VhXbc6rw
         MzD1QamoBLTpg+bMnceNTgjG5LbownPNmCyrJgwVr81fe6ekrjngH32Nm8f3a1+zS5sH
         +/Tg==
X-Gm-Message-State: AOAM5301mjIBds+WCiJEX+jRJSSBxLaMtW+ZqRn6lGn3IlQ9wgYpVg3P
        fS89vRSEp71kF0DY51sg8IyrGOQCXVE=
X-Google-Smtp-Source: ABdhPJyQa81p/mrVzovfDzL1Tk2+M4nvyTQS7CNTuGEzHkgsaTxm80pU47UTgfPCqaL6RaQUYB+JAg==
X-Received: by 2002:a0c:e509:: with SMTP id l9mr708743qvm.36.1631055387232;
        Tue, 07 Sep 2021 15:56:27 -0700 (PDT)
Received: from [172.17.0.2] ([20.65.36.48])
        by smtp.gmail.com with ESMTPSA id x2sm344853qtr.6.2021.09.07.15.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 15:56:26 -0700 (PDT)
Message-ID: <6137ee1a.1c69fb81.2d1e8.27ab@mx.google.com>
Date:   Tue, 07 Sep 2021 15:56:26 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============0667068881168960362=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,1/5] adapter-api: Add Experimental property
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20210907223008.2322035-1-luiz.dentz@gmail.com>
References: <20210907223008.2322035-1-luiz.dentz@gmail.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============0667068881168960362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=543375

---Test result---

Test Summary:
CheckPatch                    FAIL      2.03 seconds
GitLint                       FAIL      0.62 seconds
Prep - Setup ELL              PASS      48.33 seconds
Build - Prep                  PASS      0.11 seconds
Build - Configure             PASS      8.39 seconds
Build - Make                  PASS      208.28 seconds
Make Check                    PASS      9.35 seconds
Make Distcheck                PASS      246.88 seconds
Build w/ext ELL - Configure   PASS      8.45 seconds
Build w/ext ELL - Make        PASS      196.29 seconds

Details
##############################
Test: CheckPatch - FAIL
Desc: Run checkpatch.pl script with rule in .checkpatch.conf
Output:
client: Add support for printing ExperimentalFeatures property
WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#11: 
	Experimental: BlueZ Experimental LL p.. (15c0a148-c273-11ea-b3de-0242ac130004)

- total: 0 errors, 1 warnings, 64 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

"[PATCH] client: Add support for printing ExperimentalFeatures" has style problems, please review.

NOTE: Ignored message types: COMMIT_MESSAGE COMPLEX_MACRO CONST_STRUCT FILE_PATH_CHANGES MISSING_SIGN_OFF PREFER_PACKED SPDX_LICENSE_TAG SPLIT_STRING SSCANF_TO_KSTRTO

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

main.conf: Allow passing a list of UUIDs to Experimental
WARNING:STATIC_CONST_CHAR_ARRAY: static const char * array should probably be static const char * const
#267: FILE: src/main.c:568:
+static const char *valid_uuids[] = {

- total: 0 errors, 1 warnings, 375 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

"[PATCH] main.conf: Allow passing a list of UUIDs to Experimental" has style problems, please review.

NOTE: Ignored message types: COMMIT_MESSAGE COMPLEX_MACRO CONST_STRUCT FILE_PATH_CHANGES MISSING_SIGN_OFF PREFER_PACKED SPDX_LICENSE_TAG SPLIT_STRING SSCANF_TO_KSTRTO

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.


##############################
Test: GitLint - FAIL
Desc: Run gitlint with rule in .gitlint
Output:
client: Add support for printing ExperimentalFeatures property
7: B3 Line contains hard tab characters (\t): "	Experimental: BlueZ Experimental LL p.. (15c0a148-c273-11ea-b3de-0242ac130004)"


##############################
Test: Prep - Setup ELL - PASS
Desc: Clone, build, and install ELL

##############################
Test: Build - Prep - PASS
Desc: Prepare environment for build

##############################
Test: Build - Configure - PASS
Desc: Configure the BlueZ source tree

##############################
Test: Build - Make - PASS
Desc: Build the BlueZ source tree

##############################
Test: Make Check - PASS
Desc: Run 'make check'

##############################
Test: Make Distcheck - PASS
Desc: Run distcheck to check the distribution

##############################
Test: Build w/ext ELL - Configure - PASS
Desc: Configure BlueZ source with '--enable-external-ell' configuration

##############################
Test: Build w/ext ELL - Make - PASS
Desc: Build BlueZ source with '--enable-external-ell' configuration



---
Regards,
Linux Bluetooth


--===============0667068881168960362==--
