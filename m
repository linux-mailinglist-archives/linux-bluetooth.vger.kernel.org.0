Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139D92A935A
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Nov 2020 10:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgKFJuE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 6 Nov 2020 04:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgKFJuE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 6 Nov 2020 04:50:04 -0500
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E938C0613CF
        for <linux-bluetooth@vger.kernel.org>; Fri,  6 Nov 2020 01:50:02 -0800 (PST)
Received: by mail-il1-x143.google.com with SMTP id z2so540243ilh.11
        for <linux-bluetooth@vger.kernel.org>; Fri, 06 Nov 2020 01:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=ft9BzUE2R04o0AWHxxHutlEl7Nv5fnW0VsLnLRMzKmU=;
        b=Kq+s9TsPqx0LgkNly/WArgB0eq5Hkz1PWMM0KggVaQwVjURaNegc2fT29X3HH2Rq8X
         OhrlT5KZ7MG2dqsZjrUQTY03TBpfeqXZHoe5OUOyQ6pXq/jaO+mMk5olo9A8vFb4V7XB
         ITeR5FiFL5Dst66VFzacKescaVARgyQMcG1vvdfBo/tyEDm0n7r8S/5KCo2abKpRozxM
         YHy7dGTPIbc4YmZJITPR9H+0/SaE/S3E6en2HfPSitT3hUA45PsKUqiutFBDScSXO0v6
         FjLLV0+74PktwdDzXV/BcawE+aMoiLSJhos0kqZQWIWF+YIAbEna7P70wlBOaPNsRHho
         ampw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=ft9BzUE2R04o0AWHxxHutlEl7Nv5fnW0VsLnLRMzKmU=;
        b=nFm2zJkjDwrgloi4kVquIL6rray/hwnBksNAZ0lfhvTA/Vvtef2xjCt01EKOYMGyrZ
         9zZL2PalgdZ5rK4emUP9SWGg5XKDTZjhdSVY5DWP0WJ03HnWcgivlm4cVZYzf3xfwvge
         8Btrd+E4P91KSnAkBqXaduES2TIy2ALV3+qDDdgzF7FHxmB9EHs3ZR9Xk3dadyudAC5k
         QRhuO1+W4Owns8giPIvhCqBBt7nKllsPLTr6SHp5e3U53ZTAQasj8xMVk4WVqEGGvPJn
         73W9KKGU+2GpaSkGhcHR4ga11DofWdShjoJRimhppKJFdOjY/urNaLmmIV+wOZdHKMoo
         pJPg==
X-Gm-Message-State: AOAM531UYUoZ7/bXpEltT3mHDtjM0KS4+IsN/qT8/6VOFcXndPoWjMDe
        b8LAXNKyvzOhXkouqRTF1xuJJy7Rtcg=
X-Google-Smtp-Source: ABdhPJxTcm199UCaA9mVqPHXYwK2yHmAkNlExU2ets+g+ZIjPn1ZnCdGXaGQkgfscL3j4gDr6QS3Ew==
X-Received: by 2002:a92:d84a:: with SMTP id h10mr828073ilq.39.1604656201704;
        Fri, 06 Nov 2020 01:50:01 -0800 (PST)
Received: from [172.17.0.2] ([104.208.247.236])
        by smtp.gmail.com with ESMTPSA id y2sm524432ioc.46.2020.11.06.01.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 01:50:01 -0800 (PST)
Message-ID: <5fa51c49.1c69fb81.de141.1eec@mx.google.com>
Date:   Fri, 06 Nov 2020 01:50:01 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============5154250308300720963=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, sathish.narasimman@intel.com
Subject: RE: [v3] Bluetooth: btintel parse TLV structure
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20201106092119.20486-1-sathish.narasimman@intel.com>
References: <20201106092119.20486-1-sathish.narasimman@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============5154250308300720963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=378873

---Test result---

##############################
Test: CheckPatch - PASS

##############################
Test: CheckGitLint - PASS

##############################
Test: CheckBuildK - PASS



---
Regards,
Linux Bluetooth


--===============5154250308300720963==--
