Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7780D587443
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Aug 2022 01:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234979AbiHAXIX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 1 Aug 2022 19:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbiHAXIW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 1 Aug 2022 19:08:22 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 263F929C95
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 Aug 2022 16:08:21 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id f14so9580828qkm.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 01 Aug 2022 16:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc;
        bh=667j7TyA2hUJE2EKZAOOCdDHnl9bGEeTeeoxBSHyqvY=;
        b=nf8ixW8MDkI/ns/gUi2iuXbd0jZ+bf9FerbYWlrmoBScGwv2w/RJWFbtxgG1QC4iPi
         +e59JAJj3hRauoegeiX2a/NjxsIt72lYgQ7S/oW5CCDemtAvlVhqkH+MBk/uT2Trxbfb
         n7kstfZbJfkm+8h1TIWh0HbndFgeFkJBexhvS+QdWfe68bc86lReE1m2Y6siWQnfuqXJ
         k7mJzQjXsbcc2j46yvsVFGWdpVReSYHWDj9OroagZAy9cSKJbSOjQy20lJDsIaeGBEl/
         pBlc+GqIMwZnaMR/hj+tahzcnCf6kmqOdMzJRpUYnDRHpfinJf1wQRtFQRg6b/NG5If8
         1lmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=667j7TyA2hUJE2EKZAOOCdDHnl9bGEeTeeoxBSHyqvY=;
        b=FvLESqDF2E+61Mw1nTHdvLMzj52sFsJd8DZ8jSJ97Lddanv4m13LAcuuZI8wG0r5DW
         NFrqSpP5IJ6Sb1g9aIt4Y2BiGeKBOYgfHSs+VDMcNDhJciKAfm/+qzE0OFIIIi6eE9y6
         JVN6BCCnhS0uIYrv2U9c8n3oGZnwJaYrPvFlOCeFA1u/RmJyOPoIZ6Ndf//5yCOYGBXj
         iA+Yplnf/IE6+MkH94wFAUBcREGODzExW7JheFYXl8nkTlPDcZW4rPD370gya8shBe64
         RJka3YtiEa3ZOjuJuzLRHYj0iPLyg7aS9AeroQuNAt+fKnZg3MeLHr3DMslPm/u+ZfG1
         ftQg==
X-Gm-Message-State: AJIora9lX7pdQ4wcG0DT8KTXXFGwjwR3Aig9Ky7Fx3Q3+V34vttERsXl
        B+/O9PnU1Hzt5BhxzkwPYlzacSjzqP3FVQ==
X-Google-Smtp-Source: AGRyM1vkGEMC5e+aFF+yKE9rJIIs4PqZlPqahiQwVsEumSrAoiuoufikSzhX2iTt+PN6TmEALFnoAg==
X-Received: by 2002:a05:620a:470c:b0:6b5:f03f:dd96 with SMTP id bs12-20020a05620a470c00b006b5f03fdd96mr13537414qkb.46.1659395299918;
        Mon, 01 Aug 2022 16:08:19 -0700 (PDT)
Received: from [172.17.0.2] ([20.124.31.129])
        by smtp.gmail.com with ESMTPSA id w18-20020a05622a135200b0031eb393aa45sm8094036qtk.40.2022.08.01.16.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 16:08:19 -0700 (PDT)
Message-ID: <62e85ce3.050a0220.f6083.66e7@mx.google.com>
Date:   Mon, 01 Aug 2022 16:08:19 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============5690828458159030489=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ] device: Fix not auto-connecting profile
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20220801222113.2269509-1-luiz.dentz@gmail.com>
References: <20220801222113.2269509-1-luiz.dentz@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============5690828458159030489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=664633

---Test result---

Test Summary:
CheckPatch                    PASS      1.42 seconds
GitLint                       PASS      0.98 seconds
Prep - Setup ELL              PASS      27.75 seconds
Build - Prep                  PASS      0.87 seconds
Build - Configure             PASS      8.83 seconds
Build - Make                  PASS      998.27 seconds
Make Check                    PASS      12.19 seconds
Make Check w/Valgrind         PASS      290.64 seconds
Make Distcheck                PASS      243.01 seconds
Build w/ext ELL - Configure   PASS      8.97 seconds
Build w/ext ELL - Make        PASS      83.75 seconds
Incremental Build w/ patches  PASS      101.40 seconds
Scan Build                    PASS      527.25 seconds



---
Regards,
Linux Bluetooth


--===============5690828458159030489==--
