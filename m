Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC394371625
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 May 2021 15:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234399AbhECNqv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 3 May 2021 09:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhECNqu (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 3 May 2021 09:46:50 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA88DC06174A
        for <linux-bluetooth@vger.kernel.org>; Mon,  3 May 2021 06:45:57 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id s20so2799116plr.13
        for <linux-bluetooth@vger.kernel.org>; Mon, 03 May 2021 06:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=Uw5EJHrsw+/5Lv4LbLYL9R02jDG58VMFrKGO7N1bYcw=;
        b=N/tbSfZGdyM2Sny/j+ONEtBkHvAfZKLxq1Asm9tl/NJAnxsbqWxb0JF+uMniH3syoN
         c42K2LE3pVWT1lp8evkAkJtvHJ2/vFrk2+FYkcTdXZz9dHhgs7dW5qdv6l0wpcOe2VFp
         ItflwmN4bjvZ1zhYbM3v8TrFUm0xrpht8kJcEAy11+qyEwC/7Q5R4d5EQInYhfmgiCEy
         LA6xBnEcfWL1tK6L2jDcYRO9bKxxsRhNsE6aVXwbv8YopkMbtGpHD60d+DpVK8Hl+XKI
         d58XjTCZvJzc6+MxVh7mBQnCyUVUoEMvxDRq/4qs3ThjMX6Zski4JU8c0+DD8aIoSQJd
         iRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=Uw5EJHrsw+/5Lv4LbLYL9R02jDG58VMFrKGO7N1bYcw=;
        b=P0gW76JM/4pNDV85EaYG4E0uzCLmP0Er9XAxMAmK5OBXxHKnEw41bJJ1Yyi2TDnmpS
         kt98bnDyLaoqZNQceZ5nGlmKp30nryVo4SfULmYuu9TUqXuWagKjNHvjsUZrno0oy2hB
         pyOdS8tXHULcT4ImTvJ4PwAFwz+ItKhJhb/06ibv4eIBGsGGX0AJzV9Us8lE2b+Fy5l2
         IIPVBGJVCoM56TDKV3JdiiRWsmG/59Kth5eKrjMvSqEDe2HoISGXt35OQnm/pukvQBPC
         Vkg0bG+zeVZXUdTGnAUyLQHKV8e8WSEvX3GuMlcaWCZcTvhD3cT476rH0qeCkyDjyozb
         DhjQ==
X-Gm-Message-State: AOAM532IUQDjOOYeoq//JBJDwoOR/Lmq3Jq2smjIMVRIJR64QOM0d81q
        Q8uf7IIEOyuGEymQkMa43HuYHz+vxhI=
X-Google-Smtp-Source: ABdhPJwAW8nHDzeGPt2M6Ds9z9GgAADoQciW9WV6qdM91pW6vNUSzIOTraMb0u8sSacGi2/AUgeVcg==
X-Received: by 2002:a17:902:6b81:b029:ea:dcc5:b841 with SMTP id p1-20020a1709026b81b02900eadcc5b841mr20376555plk.29.1620049556866;
        Mon, 03 May 2021 06:45:56 -0700 (PDT)
Received: from [172.17.0.2] ([20.98.90.73])
        by smtp.gmail.com with ESMTPSA id w1sm10304146pgh.26.2021.05.03.06.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 06:45:56 -0700 (PDT)
Message-ID: <608ffe94.1c69fb81.cacb4.bd07@mx.google.com>
Date:   Mon, 03 May 2021 06:45:56 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============0633293652853900573=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, benjamin@sipsolutions.net
Subject: RE: rfkill: Fix reading from rfkill socket
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20210503131210.90066-1-benjamin@sipsolutions.net>
References: <20210503131210.90066-1-benjamin@sipsolutions.net>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============0633293652853900573==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=476383

---Test result---

Test Summary:
CheckPatch                    PASS      0.56 seconds
GitLint                       PASS      0.12 seconds
Prep - Setup ELL              PASS      45.13 seconds
Build - Prep                  PASS      0.15 seconds
Build - Configure             PASS      7.93 seconds
Build - Make                  PASS      191.25 seconds
Make Check                    PASS      8.55 seconds
Make Dist                     PASS      11.38 seconds
Make Dist - Configure         PASS      4.79 seconds
Make Dist - Make              PASS      77.65 seconds
Build w/ext ELL - Configure   PASS      7.91 seconds
Build w/ext ELL - Make        PASS      179.36 seconds

Details
##############################
Test: CheckPatch - PASS
Desc: Run checkpatch.pl script with rule in .checkpatch.conf

##############################
Test: GitLint - PASS
Desc: Run gitlint with rule in .gitlint

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
Test: Make Dist - PASS
Desc: Run 'make dist' and build the distribution tarball

##############################
Test: Make Dist - Configure - PASS
Desc: Configure the source from distribution tarball

##############################
Test: Make Dist - Make - PASS
Desc: Build the source from distribution tarball

##############################
Test: Build w/ext ELL - Configure - PASS
Desc: Configure BlueZ source with '--enable-external-ell' configuration

##############################
Test: Build w/ext ELL - Make - PASS
Desc: Build BlueZ source with '--enable-external-ell' configuration



---
Regards,
Linux Bluetooth


--===============0633293652853900573==--
