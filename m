Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B64D14C03F3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 22 Feb 2022 22:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235766AbiBVVj1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 22 Feb 2022 16:39:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235800AbiBVVj0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 22 Feb 2022 16:39:26 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D021390EE
        for <linux-bluetooth@vger.kernel.org>; Tue, 22 Feb 2022 13:39:00 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id w2so1204739pfu.11
        for <linux-bluetooth@vger.kernel.org>; Tue, 22 Feb 2022 13:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=YatsP8z2A3P1aRyKVUP/LvVpk3M+F8Yq7WpI5/J0Tf4=;
        b=ITyRDwORY1jncHIwXJ97aZJ8xNuWMKM2aNpE8qFDs/ev1pmZIduFgKd/UxIuWKECfb
         6EuzdKhikrocktFgqwicM8VbJOlm4tUJl12vFbCuE7pL1PKHhVneqRpcWnIfMsxWd2WG
         4oRFpJySKeBQuAtWzOEDIqAS93S7IbTM1nqqTO4h39/MrwoPoUrgPy7H1hRyQ02A2MA5
         RIOI3ULVjQbzggpIET3puwIj5ZN8psdLMaQe7eWhY5OpD5Ul/Vkz0PngfKcQ5Dq+bhua
         1qzMaOCgf9li16gfl0g0tAwvXYEbVq1AGtlZWa3wPb8CY38h1O8zTPsuezs2AuCRtFn3
         MGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=YatsP8z2A3P1aRyKVUP/LvVpk3M+F8Yq7WpI5/J0Tf4=;
        b=td13CXriv4INCRXQnbYueOMxqy6VFYzAvocTBn1Au0XOM5jr0z/6kGlG28ZAZfjI3J
         XsPm8jPhtHSDTTvbH+fBaco/58+ImxU8798PrH/B09nNCGqspDHnXfk981IASwjA0qd1
         u9VcErbVvT87wtHwGvs3KzDT7VkiN6+DeYMy6QzSSUcUNRZRs4tQhN/4AYpt/5Iso+A0
         MC0FgTV9yx4Hgefv6LAroTfP0+Y5hPE3EwF+aOya/VUoQIW98QwsiAUZPqo8zj9DQQrj
         0UttGyJtB3MzCo/lgwcJIaOy6GdxIVGIx930/AUGYgIKH0Gr9OD+g+Q6o8OREYDyCbrx
         6CAw==
X-Gm-Message-State: AOAM533LLFkMRdbld/mEm5HfVZkFO7aUlQx2wZzrLGRMicaZIuLZIavN
        ACIyI0vKPsIDLF8eXQCRs0KrN+ODtXs=
X-Google-Smtp-Source: ABdhPJyRAlk2PcEmTxf3NCe9pZQuq4hFUwHLwGrJ8e8DulTjpwTG44UZlpqaj1adf6i30e+YqIYjlQ==
X-Received: by 2002:a63:d0d:0:b0:34e:34b:fc17 with SMTP id c13-20020a630d0d000000b0034e034bfc17mr20827247pgl.501.1645565939796;
        Tue, 22 Feb 2022 13:38:59 -0800 (PST)
Received: from [172.17.0.2] ([20.190.57.254])
        by smtp.gmail.com with ESMTPSA id v1sm501483pje.18.2022.02.22.13.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 13:38:59 -0800 (PST)
Message-ID: <621557f3.1c69fb81.41410.1fff@mx.google.com>
Date:   Tue, 22 Feb 2022 13:38:59 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============4281762703018124244=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [v4,BlueZ] player: Fix Track being emitted with empty metadata
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20220222193855.301757-1-luiz.dentz@gmail.com>
References: <20220222193855.301757-1-luiz.dentz@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============4281762703018124244==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=616863

---Test result---

Test Summary:
CheckPatch                    PASS      0.70 seconds
GitLint                       PASS      0.38 seconds
Prep - Setup ELL              PASS      50.46 seconds
Build - Prep                  PASS      0.61 seconds
Build - Configure             PASS      9.83 seconds
Build - Make                  PASS      1752.78 seconds
Make Check                    PASS      12.36 seconds
Make Check w/Valgrind         PASS      533.80 seconds
Make Distcheck                PASS      276.34 seconds
Build w/ext ELL - Configure   PASS      10.04 seconds
Build w/ext ELL - Make        PASS      1725.46 seconds
Incremental Build with patchesPASS      0.00 seconds



---
Regards,
Linux Bluetooth


--===============4281762703018124244==--
