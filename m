Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03591513DAC
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 Apr 2022 23:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352359AbiD1Vg7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 28 Apr 2022 17:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349402AbiD1Vg6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 28 Apr 2022 17:36:58 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C2BBF53A
        for <linux-bluetooth@vger.kernel.org>; Thu, 28 Apr 2022 14:33:43 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id jt15so4123226qvb.13
        for <linux-bluetooth@vger.kernel.org>; Thu, 28 Apr 2022 14:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=jQBH00eoFeRIGk6bJQ0w5YU9NrXjgc4Yqdh1SbAprpc=;
        b=cB2eJIoUoz7/AtQw9Jc1ZM5TCrs9F6TPf+pryEMwQI9HeKSns+AWSMu3Fnm+lJ9wq4
         Z+FkvKW+b96ALd9KI3zMo4gddRKgqPR/tdDk5oQbe/sPUKSi73IsmUWceMlWb347yEEY
         l54YXC5MVoVBCygivJFspVx08lF/FMvz7pPvPOEGUkUD160IcnnrY3t6PT5XyKwkHQgx
         Q3pXrLsZ3rRcy70gAahDM/u79hC7H/31b+cRslhstqqs1ZtGopkjn9sTVQmKv1JTxFtl
         9WLDWsyx5mSKcbPK1Rtd0Zor9Z9l3QJv7yW280FEpq0Q1MicQ6jLvTba/tDPmSNGHT85
         3hNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=jQBH00eoFeRIGk6bJQ0w5YU9NrXjgc4Yqdh1SbAprpc=;
        b=7vQr1sza2CeA0cEUhFe4+oNk4i7yOnSjGKLTdOf4hmY5W3k5MHQNpuW4r4EzmCSLZN
         qlAfVyL41e9S7JzpwQjVRWAiaPtrrT3bV1xc7DSgkJvz7loVObrKJa9Qe+kQ6Zm/Q/ia
         ayQcCITsm5FaE+hCP9W2mziTfd5iEXUsR4NeaHl9whq4dKARU3MjsYXSpFbbfNNWVfGq
         kQZncswmEId1IY+gzE5oz8OvR7/OP0uWIuqL9fcsvLpI1jktA9qkjspg1PejciAqSpCH
         1lMWc/3ANDqd4v3PDLZdX6WVahWSlEHlMqmPqak6HOVF/zi9s3f1RKT6mVx2IloMepxl
         v3qw==
X-Gm-Message-State: AOAM531O55UzdYEPD5zxRJzOAHEmrhURAZFxtZAdqb16K/JdqUYX0tp2
        tmIbfDazh+9p0fqSFRa+LC5WSpwZIfM=
X-Google-Smtp-Source: ABdhPJxLEVmoqLZB5sPg17kEBoFUVMa64KVtzlOxoyEaYPuVsQtEpzHdSKfrsZNsITF25xgma+azNw==
X-Received: by 2002:a0c:8d07:0:b0:443:a6be:7774 with SMTP id r7-20020a0c8d07000000b00443a6be7774mr25676969qvb.51.1651181622227;
        Thu, 28 Apr 2022 14:33:42 -0700 (PDT)
Received: from [172.17.0.2] ([20.115.118.8])
        by smtp.gmail.com with ESMTPSA id c10-20020ae9e20a000000b0069f88d14596sm508582qkc.97.2022.04.28.14.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 14:33:41 -0700 (PDT)
Message-ID: <626b0835.1c69fb81.16b8.4283@mx.google.com>
Date:   Thu, 28 Apr 2022 14:33:41 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============3933249287324142056=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [v2] transport: Fix not being able to initialize volume properly
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20220428200520.1429133-1-luiz.dentz@gmail.com>
References: <20220428200520.1429133-1-luiz.dentz@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============3933249287324142056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=636708

---Test result---

Test Summary:
CheckPatch                    PASS      1.64 seconds
GitLint                       PASS      1.03 seconds
Prep - Setup ELL              PASS      53.69 seconds
Build - Prep                  PASS      0.72 seconds
Build - Configure             PASS      10.65 seconds
Build - Make                  PASS      1500.21 seconds
Make Check                    PASS      13.10 seconds
Make Check w/Valgrind         PASS      543.56 seconds
Make Distcheck                PASS      284.26 seconds
Build w/ext ELL - Configure   PASS      10.81 seconds
Build w/ext ELL - Make        PASS      1464.59 seconds
Incremental Build with patchesPASS      0.00 seconds



---
Regards,
Linux Bluetooth


--===============3933249287324142056==--
