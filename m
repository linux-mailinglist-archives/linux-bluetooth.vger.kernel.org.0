Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D513EE525
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Aug 2021 05:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbhHQDjr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 16 Aug 2021 23:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234051AbhHQDjp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 16 Aug 2021 23:39:45 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5209BC0613C1
        for <linux-bluetooth@vger.kernel.org>; Mon, 16 Aug 2021 20:39:12 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id m21so3712427qkm.13
        for <linux-bluetooth@vger.kernel.org>; Mon, 16 Aug 2021 20:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=lDr5rJkylhakgsLiShLS00A/sWly0IZYM4Sf8Nqd63U=;
        b=gkigQDbiQiB2KQ3Qs0u2msscqfhyntiaZlOuQW3GiagKJdpwN0Q+yXK76psrzPeimr
         gRkH3Cd0IBUFvUqeetCH346b/s1HmbcK6ZfIRZYH5BslwKthNS4z5GWq91LemWOuoyPK
         t2glhwVCKeNPPhl0EzOTZ0jE7vweifjJK75QBuwP0wcyM+3RSuW/3PePlbSZwi2Uat09
         EE9vT0serXXUgAbW21kUVNG/y3OEFhmwV58bUkZRkxJhjd5bCX/bBQ6Ctfg9uRn1qNoO
         vGkNgVM3etdpsB0UMFIopQ2Mv4NYdWOB4AqtWkX6rstLFsn9cjUSJu2UxqMGHMU/PvGC
         al4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=lDr5rJkylhakgsLiShLS00A/sWly0IZYM4Sf8Nqd63U=;
        b=INW3gSuae6xo2vv6oI7RbaFeJqk2339lN6W9eYPTJNmK8EgWnmiaDsJul4gEihFwW0
         qTVjUYWLgsag1D60Vr+Riq9CiC4RuwI8TdvEFO3KYLG1ILdgYMeidOBiCWOFXUn0Mx3D
         /X704g5KcIhWqWfg48+JFPPsEMUSU/Rv0qNTKws19bDEwPcyvTErRZ4cZHP0kEXHu034
         /a0RzKHWCrn5IeojWRCZlWO74w0+z/b3Yy4ctnl1KjuBwgZwLPDaohKh/xaxpC/bYaHe
         W1ivbMMrFA0wGNYFzMob1rObUtxV/69eK8eu8RbZDvM9VWmChXWb9YbkJUVGgMEXN/eh
         8vOg==
X-Gm-Message-State: AOAM531CosdKQ4KdArQ17i1cRUfBb7a+T3H6PtSPpAzxmH4uart1iTAa
        EDiqOgPdQd4SC2qrNtigRRE0ufpba15k8w==
X-Google-Smtp-Source: ABdhPJx+K+xN9cHWHXpxO8wY+seSMfweqoUWrUJePYD9pE4FAdmvbx9hRKjscrEZevWfASkOwK1ncw==
X-Received: by 2002:a05:620a:1913:: with SMTP id bj19mr1688175qkb.341.1629171551333;
        Mon, 16 Aug 2021 20:39:11 -0700 (PDT)
Received: from [172.17.0.2] ([20.110.25.92])
        by smtp.gmail.com with ESMTPSA id w14sm560793qkm.81.2021.08.16.20.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 20:39:10 -0700 (PDT)
Message-ID: <611b2f5e.1c69fb81.2ec4b.365e@mx.google.com>
Date:   Mon, 16 Aug 2021 20:39:10 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============6617269992212770856=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, kiran.k@intel.com
Subject: RE: [v2] mgmt: Set offload codec mgmt feature
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20210817030930.9211-1-kiran.k@intel.com>
References: <20210817030930.9211-1-kiran.k@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============6617269992212770856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=532441

---Test result---

Test Summary:
CheckPatch                    PASS      0.35 seconds
GitLint                       PASS      0.12 seconds
Prep - Setup ELL              PASS      48.10 seconds
Build - Prep                  PASS      0.11 seconds
Build - Configure             PASS      8.40 seconds
Build - Make                  PASS      208.49 seconds
Make Check                    PASS      9.26 seconds
Make Distcheck                PASS      246.27 seconds
Build w/ext ELL - Configure   PASS      8.42 seconds
Build w/ext ELL - Make        PASS      194.12 seconds

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


--===============6617269992212770856==--
