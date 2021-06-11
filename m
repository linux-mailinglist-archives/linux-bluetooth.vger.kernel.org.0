Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80B9A3A4270
	for <lists+linux-bluetooth@lfdr.de>; Fri, 11 Jun 2021 14:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhFKM43 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 11 Jun 2021 08:56:29 -0400
Received: from mail-pj1-f47.google.com ([209.85.216.47]:40595 "EHLO
        mail-pj1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhFKM42 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 11 Jun 2021 08:56:28 -0400
Received: by mail-pj1-f47.google.com with SMTP id mp5-20020a17090b1905b029016dd057935fso5781788pjb.5
        for <linux-bluetooth@vger.kernel.org>; Fri, 11 Jun 2021 05:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=j8JPqmmT7L6G/GfkgD/wBLR8q4vAEW4ovclELO5NDDk=;
        b=lW5W03CSazPqc2PNFaU0lHh1SUaG/ifWOGJb1NFhlOCBggaza80Mb0qAIDplqqImPl
         WEHos71qpuMk4ycw3fvfRm85BduVi8sonPLfY6STmHqibVGWrURAYgcv9X1uoPAI8k0f
         GpX535foZ9/lWpq1wT1Jqi4UqeUOBejtVvzOrRBlV4KpEqCVI7NSH0ZKWY8P+U960qLe
         50+hVZkgt10xRCBBGGBmvK4BV45Jt5aIp6GukiT7JFYRuEFdrJWvrWh46tvXClONulj+
         YZpwam0UjztpDLrer4xB+3OS2SrYVNvDjsutRyTSN2G5hSyESySJpsrlNBZrZR0xlw+R
         FcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=j8JPqmmT7L6G/GfkgD/wBLR8q4vAEW4ovclELO5NDDk=;
        b=tuLESDcmB7wfYFyb5k15u0UmdAiXhSJ0Ms5c8vacaTEQmwX/n0hEJYs2WZsQn3cD5S
         uRFqScoQE5C8Vs7xHcwizB83AwDFw0ljxl2+oUa28dd2CJEqyRHU/LTbiVyRPQP5MG0U
         Bz31MSYbsc3cqLA5E3pqJFPJmwlNmWh249oZUdSO4TgBivTrsWEwwM1eLqhj9Tc7qCN7
         9gKxsWWMyUdfJvfpAHvO1Cj3t2XTbVyhe1TkJwnWyesJ+mj12SnKK71Loik8ET98YskL
         jo8uOGJVueoXiWohwb97mXuaKGZxneJWDkpQay2t6eBnd1Gvr+SQKVAaNT64uAk4R1A3
         r9mw==
X-Gm-Message-State: AOAM5314eNwm9Op/lGpXis0QTZu3DDjGxK84MUb8DtllOneSG5Ab3juo
        8zElE7DEaCSCR2V3nThdYyofcR1PC/U=
X-Google-Smtp-Source: ABdhPJzJMWJjUB0p3m6RfpLQk+Di1voc+HJSkwW+iJP3ZCfX9R+SnQLh9ReSP6paSX3YnrqwHM6RkA==
X-Received: by 2002:a17:90a:4205:: with SMTP id o5mr4473861pjg.140.1623416000115;
        Fri, 11 Jun 2021 05:53:20 -0700 (PDT)
Received: from [172.17.0.2] ([40.65.110.206])
        by smtp.gmail.com with ESMTPSA id o1sm5266046pfk.102.2021.06.11.05.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 05:53:19 -0700 (PDT)
Message-ID: <60c35cbf.1c69fb81.4ee39.fc1c@mx.google.com>
Date:   Fri, 11 Jun 2021 05:53:19 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============5283296095915417129=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, surban@surban.net
Subject: RE: [BlueZ] gatt-client: Check length of notify multiple op
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20210611123021.21211-1-surban@surban.net>
References: <20210611123021.21211-1-surban@surban.net>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============5283296095915417129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=498859

---Test result---

Test Summary:
CheckPatch                    PASS      0.62 seconds
GitLint                       PASS      0.14 seconds
Prep - Setup ELL              PASS      47.26 seconds
Build - Prep                  PASS      0.14 seconds
Build - Configure             PASS      8.36 seconds
Build - Make                  PASS      207.71 seconds
Make Check                    PASS      9.15 seconds
Make Distcheck                PASS      243.46 seconds
Build w/ext ELL - Configure   PASS      8.38 seconds
Build w/ext ELL - Make        PASS      195.76 seconds

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


--===============5283296095915417129==--
