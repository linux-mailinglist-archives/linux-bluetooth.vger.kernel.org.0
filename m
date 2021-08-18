Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301143EF626
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Aug 2021 01:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbhHQXgS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 17 Aug 2021 19:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229466AbhHQXgR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 17 Aug 2021 19:36:17 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC06C061764
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Aug 2021 16:35:44 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id o123so851702qkf.12
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Aug 2021 16:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=GMlwJDclKhf2eFD83J/1xRqXaGC50/AqTT+5oo4SjMk=;
        b=I8vU1we8fhSlIJYYhiV6TJ3u2ot54rzNbYdOjpXIvkk/WxJnwZxaXUrg1yB/EcUvFy
         z6Xan6rao76TQ1rId1Jfd/H4dT97pKFRVPcRng4zWHc9zoz0Iy4YCtl1HoAUquj+W9k9
         wizl3NrA5T18BLg5YWSf+aAnnZL/S5eCcBGmCdIqBmoxOH1DZq4KG7fe26M+nwqhNqg3
         O9eb1Q8TDeM7v6OX1J6pNhbRQH3r68eoTOZA5hF9H1yRe7/5bs8DGIr9rv9ZfpsbDfKp
         NFLvE3M0Mm2IOFJrkyCfiotg+1CHlNTAZ9Cxk/eWMzoOSihYEsV04UJ0COsoz0xA8tmM
         Kyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=GMlwJDclKhf2eFD83J/1xRqXaGC50/AqTT+5oo4SjMk=;
        b=qvC4w2hiZJE8ewpLZvG2IyMrPxW13ukZxmltJJ9oOALt73NVi93jZk1ggSlfu92vFK
         19j1yEUNbql6GN2jTFHsJhvSB6P5exWVWsOahlMshLIXfjv2BppPb4BFoHctihLcF7Xz
         db2ChzL1SPfpYeLWwP+GYqtNjuipkyhlhsoLiE26ZaOkUWSkc9Q43GJxCNcDnsqVr4iG
         hn7twiIlmrdtdoH9dBHGsruJMYR7muI4betkqzf4le5nPIXys0+HDZ7zUSDKCn1ldgOl
         eNHwncFkZjoNGRq6kBP6nRfLkllv5xPfzSba/R4ZX85lgkSM5tzWUmXuhCrcTLwBhywR
         GEUA==
X-Gm-Message-State: AOAM530N/km1m9kSdjvNQrZNkjN7XbB8d08neaXH2CibItSO8Zx+ITKM
        z9YwIY11uZi0I0IJUrQJSYNgeLM0750Fjg==
X-Google-Smtp-Source: ABdhPJxZhFNYlcTievWdgc4v8eW4+9jm8LuXYp+3CaWIF0914B0pZAWK9yGU2nHKIqJKxmPgkH+DHg==
X-Received: by 2002:a37:a80c:: with SMTP id r12mr6369703qke.299.1629243343159;
        Tue, 17 Aug 2021 16:35:43 -0700 (PDT)
Received: from [172.17.0.2] ([20.110.0.202])
        by smtp.gmail.com with ESMTPSA id u189sm2477688qkh.14.2021.08.17.16.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 16:35:42 -0700 (PDT)
Message-ID: <611c47ce.1c69fb81.d78e6.20e8@mx.google.com>
Date:   Tue, 17 Aug 2021 16:35:42 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============6747793400651557996=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, hj.tedd.an@gmail.com
Subject: RE: [BlueZ,DNM] Build: Test patch - Do Not Merge
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20210817224643.412566-1-hj.tedd.an@gmail.com>
References: <20210817224643.412566-1-hj.tedd.an@gmail.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============6747793400651557996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=533015

---Test result---

Test Summary:
CheckPatch                    PASS      0.25 seconds
GitLint                       PASS      0.11 seconds
Prep - Setup ELL              PASS      40.89 seconds
Build - Prep                  PASS      0.10 seconds
Build - Configure             PASS      7.19 seconds
Build - Make                  PASS      178.77 seconds
Make Check                    PASS      8.63 seconds
Make Distcheck                PASS      212.87 seconds
Build w/ext ELL - Configure   PASS      7.26 seconds
Build w/ext ELL - Make        PASS      167.68 seconds

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


--===============6747793400651557996==--
