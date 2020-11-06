Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B486B2AA083
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Nov 2020 23:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbgKFWru (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 6 Nov 2020 17:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728408AbgKFWrt (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 6 Nov 2020 17:47:49 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5519C0613CF
        for <linux-bluetooth@vger.kernel.org>; Fri,  6 Nov 2020 14:47:49 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id k9so2641897qki.6
        for <linux-bluetooth@vger.kernel.org>; Fri, 06 Nov 2020 14:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=ov0VFT5o6a6vJ2Yxzqt4N8XitirCcT6cFhCrBBbOUrs=;
        b=fZeG0UVbDgXbMFj1dlIr+4j2beFpF4lLF0D2xR42/Gk3PelQ2WI5yoInd9ISs67BHV
         IfBs1ycVMJWAcq611hRbFuH+bBZ0SHNd4T8WuxtcaZRhkmj+fy91ulGCGMcUeQAMLgv7
         c84KmcMG8vrPmf0MVfhOoOfKR136pL7uwDPQbOG6lqC1WrYi9BxmsplIY3UCOx+TkW0+
         0U2a7j79zCTuJNbqSRo/uBXNh98Rfgro5Sg6spWM7Quc5ZZrdfRpgP4PKZNvamWzDkoy
         BgtWwrB6hoePeeeHERY0gbxo+lNCO4PO2FHYkTFFKhY6Cna67TX6/Xviek2vEzdVbHtf
         e/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=ov0VFT5o6a6vJ2Yxzqt4N8XitirCcT6cFhCrBBbOUrs=;
        b=aRHIktIiKygCk28O0koZcrTVvdSQq94CSS6sabG3LrIXKKz9CN5pw2ehvLS63qe8Jw
         u7gTXkqnBKboyjRFGkRuqYCjBHiH/PnXSiAV4+6IBZ3Po1DopBYFIZZtay9ftDWrgorn
         hmTQsbIXueZZ6tAFiaKnfhRNrfOrmJlpOZEWQKLHiYE6GHsnvFyEB5R/KxJnHgMq5RvU
         TSGdl+Gw3n6A8NFzGO1szRUWYm9wlIGOGdeCFuZJN4faY7TnJp0YMXIn4dtFvJqE7TlP
         ujs9vso8iRQpRX4IpGlsj9FFtTDTGLm3RYk7jufjnLRHYYmtjAzYr0a0WoCAz19Fkax/
         oLFw==
X-Gm-Message-State: AOAM531CrEqQBffIUSGAXMvD83+CFqtHbeC4w8WAwAdM/7LsXLTVFVWe
        2RKZVEfoQID64FqKK+TxCr/Ae7P9/zqobw==
X-Google-Smtp-Source: ABdhPJyiQO34GRaFLF+H9/VJD/WPBWlh52zA3CvD5TfVH5l/DFvNf7vuhOmpUHnuom/V9Awmd3X5BA==
X-Received: by 2002:a05:620a:1181:: with SMTP id b1mr4050489qkk.45.1604702868847;
        Fri, 06 Nov 2020 14:47:48 -0800 (PST)
Received: from [172.17.0.2] ([13.68.111.254])
        by smtp.gmail.com with ESMTPSA id h10sm1428152qkl.127.2020.11.06.14.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 14:47:48 -0800 (PST)
Message-ID: <5fa5d294.1c69fb81.c37f4.a1c1@mx.google.com>
Date:   Fri, 06 Nov 2020 14:47:48 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============2178850106898980326=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, inga.stotland@intel.com
Subject: RE: [BlueZ] mesh/mesh-config-json: Fix errors found by static analysis
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20201106222245.137189-1-inga.stotland@intel.com>
References: <20201106222245.137189-1-inga.stotland@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============2178850106898980326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=379373

---Test result---

##############################
Test: CheckPatch - PASS

##############################
Test: CheckGitLint - PASS

##############################
Test: CheckBuild - PASS

##############################
Test: MakeCheck - PASS



---
Regards,
Linux Bluetooth


--===============2178850106898980326==--
