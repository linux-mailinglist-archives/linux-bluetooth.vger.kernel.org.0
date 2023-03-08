Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC6F6B1529
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Mar 2023 23:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjCHWed (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 Mar 2023 17:34:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjCHWec (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 Mar 2023 17:34:32 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE506CB65F
        for <linux-bluetooth@vger.kernel.org>; Wed,  8 Mar 2023 14:34:31 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id t4so143366ybg.11
        for <linux-bluetooth@vger.kernel.org>; Wed, 08 Mar 2023 14:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678314871;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEf+AExShPx1OxizK74Vck7+V+R0v3E0oj9U3JcETH0=;
        b=HOxhdxM3T16PZLI/qJtfDaLfpZ7mNpRwb4fDM+4fbLbc+KDoDXbSCT/ziscgyP4bmz
         U+TzdFyG0zCThPqMf40958iGIpKqubN4HGHhG388L83OL4N4EpsEVQ8yU0YdbPFnfCWt
         uaYcOGOOCDfMkgYT34TZr4gb+IJPYMRVjmzoEVgtmIOkCqNq7UZwcXFx+dAld/mHKEex
         yzTjyd1V9hTud1M5hMRvSiVw8IOUMPsQ+X8w3sA9Q4vrdKkHkLCdgigWwxwmFmyzj4/5
         gKF5aGXLtyNia4+J/8eWxRlsuQddloRTKJl8ACWMI4VvyOuxtz65iK0qfU9HQZ/2Bsxe
         K2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678314871;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEf+AExShPx1OxizK74Vck7+V+R0v3E0oj9U3JcETH0=;
        b=bgEuifySpA6Pbm+roqKpABbnqTx3le5ihqgfX3liLzcBAXxMxZs7KPZ/4QqmgADi4W
         38peSZ44j1HQvvvopOw9fYl8mqp1STOkdiTZnEplIsHyoMJDiIeA0ITxxqW0s6/8Y+b7
         vEAEwFmUfRWbXzfACO3cNzYLu8tlzubChD8rT6D8Bs2aChGnOArKjEuoIrterLqzw/eQ
         U6z4cltICjhOBnRLb+Eoj9hm79064gClNA9pk7vLwzTykikgQnyXjccR8OxpwtqJxXrk
         z1+adeCK4UljlwyjchT+qLwixYz5ak1osX2O9zacAt1Wirgd0/IGgRpaBw/GWr26WmFv
         MqEw==
X-Gm-Message-State: AO0yUKWxFBmW+qrnODU3wglBZ8L0cyQ3K/NVVe8AMMbiWgAl1nzE0SQ6
        a/9U4y1n0TBTyaP2hSjvhntzQqBlPVLv4ChlHGM=
X-Google-Smtp-Source: AK7set+WBzQ7f7bVG2g2o55kjryOn39uvFGIZW3kCMDtBsvePLI+VHO+HGDBMBxWR3q3URTlMRoK1amCTJsJz66kyts=
X-Received: by 2002:a25:2f0c:0:b0:b27:70e1:4649 with SMTP id
 v12-20020a252f0c000000b00b2770e14649mr215374ybv.6.1678314871017; Wed, 08 Mar
 2023 14:34:31 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:419:b0:1d0:5a4e:a083 with HTTP; Wed, 8 Mar 2023
 14:34:30 -0800 (PST)
Reply-To: thajxoa@gmail.com
From:   Thaj Xoa <nambiemagrang@gmail.com>
Date:   Wed, 8 Mar 2023 22:34:30 +0000
Message-ID: <CACrRiTEBhXk2fsWzvkqjCfHJ5mc9j8rpfZ_+5YM7g_zB4N4cDA@mail.gmail.com>
Subject: re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Dear Friend,

How are you today? I have an important message for you just reply to
me and I will send you more details.

Regards
Mr Thaj Xoa
