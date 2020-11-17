Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6589E2B6E96
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Nov 2020 20:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgKQTZV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 17 Nov 2020 14:25:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgKQTZV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 17 Nov 2020 14:25:21 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339BCC0613CF
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Nov 2020 11:25:21 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id q5so21782056qkc.12
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Nov 2020 11:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=VAiNnciFkIw9MmEJ/ynstfVorusmdsYTLQ8e3qlMN7I=;
        b=Qvc9iG0VVz5UNekyPAlZzNbdUp/sq4GIV7ZL2uGLJqhnXGHuMyaEDPJ4KBC17CaYRF
         Qa7zu0NNtCJ9a1ET4ShdGrEAJa5yd8o4ccwHoPx3G2IaHqo8tADTFWV+U5c6/Dm4tKE1
         HEIfmufvNdgSmtrGazhT8ISjulDZbOnb2/BkJ7DvlvP8Um/y/rUOW/8uEgp6GSGYxv3i
         yXhgqRQ4Wr15i5rTNZyCynFTJIIx1ZOp/1bePu9RdG1k5XMt0/nzaE8QQWHtSH7ksKaf
         r4fiDLhxBfjqoCbLg64Kf40++bC7gJOypnbHaslLfCRweSH4V6S9acZ/1lI7WTBz2Knz
         4+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=VAiNnciFkIw9MmEJ/ynstfVorusmdsYTLQ8e3qlMN7I=;
        b=NICx0xLSA3BpvkpIQ/l1tbStzeBAtFpHhlGn1eqOyXOU/BhNXW2SkPH2t4j+c9V6ed
         Em4fbFo/eACCmqcsoOkCHglihrIz1OUAHWaotcLozJQkfOBro9ExRy7ZMlVx6RfLW8fL
         0Ii736/InZ/IHoAGtyrtgY9WxAczoj1xJg9jPrVDLVbO8IV9278+L13K2zFMvJEi3HWx
         tC6fUE/x/G+PvZEFC+DUDK5nxJ8HrOJUMBc+5AL9aPRMUvHi/moW4V0xcsV9/pvf8tr8
         nd8VwsJz4is7dsW/eU0Xahaugph73dampk3zUPpPrEVGQPQJ+YQeusb8V/BCiX9RRunS
         dgHw==
X-Gm-Message-State: AOAM532wwtWVnBBTE06Ju4plPcvirEnZZEBBqmwYLRXmVcmNAk5TXiup
        qkMVPGK7p614dmhij9HT+PSyrvJLowfEKg==
X-Google-Smtp-Source: ABdhPJxm0KLWV4RgbZoH9cjygInv4oY1tA3p/UdQH+VH39f7oruVsKHb0Ee8Z2kgpeRUOmotN8MTZA==
X-Received: by 2002:a37:aa95:: with SMTP id t143mr1133657qke.448.1605641120319;
        Tue, 17 Nov 2020 11:25:20 -0800 (PST)
Received: from [172.17.0.2] ([52.138.82.172])
        by smtp.gmail.com with ESMTPSA id 207sm10237707qki.91.2020.11.17.11.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 11:25:19 -0800 (PST)
Message-ID: <5fb4239f.1c69fb81.cdc9d.38fa@mx.google.com>
Date:   Tue, 17 Nov 2020 11:25:19 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============4701361829907192155=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,1/2] test-runner: Change qemu output
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20201117190607.50483-1-luiz.dentz@gmail.com>
References: <20201117190607.50483-1-luiz.dentz@gmail.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============4701361829907192155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=386271

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


--===============4701361829907192155==--
