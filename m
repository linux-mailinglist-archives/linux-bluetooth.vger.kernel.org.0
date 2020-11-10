Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660FD2AD407
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Nov 2020 11:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgKJKrJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Nov 2020 05:47:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgKJKrI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Nov 2020 05:47:08 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE74AC0613CF
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Nov 2020 02:47:07 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id n129so13424914iod.5
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Nov 2020 02:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=keSaoIVa4m+Eg/QaBH6YNAlA50jQfgsItW76GOOZTBc=;
        b=Ru4GcQq1uCvN3ubW+KQIKeLz0SxR/cBCgP5FH9t2RPzsM+yNmeGuJ4mxpba8GbaAky
         wvS2Bs8tpVWSldu1UmQ2uwU/PNBkrkEjbmfW7xXelenNwHAu3JFtKYtVOByjACCB4jgh
         VV2rJBqYieLi3s10K6GANjYiC2S+4kLmMNPrgI/OFqckqMvfk6LlVMQrFPDGgIG0d8pv
         6D0c/XB9uuv1oFlGNe7DjzJxSMhmpSL916KbFU6kdcht8lzzteo5FktPmQdnVA69zUpN
         BvkoGsA+8U6f2+kdFtb+jLGrnSNHNIa5meNWNOfmxXGSmV8lKskrs2OsDDBJMz/zM2GN
         MumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=keSaoIVa4m+Eg/QaBH6YNAlA50jQfgsItW76GOOZTBc=;
        b=SZP0r6EUgvcQwlzmp/sAc/CVz4Fqj0L+JhcbSx0RajqNm0Mxp8lSGhBCwHWLoaDmox
         xGM02hjUFpam0L3AEeu/Kep+bGvuSNYBL1JXYEfFnQLBwG9mxkWQop/DlFXDe//2QOci
         FEmL4kMf5vsYFGZ8XGHaCm95gDhQNLVkHm+3CsoL/ICPHDYpRHvN27aaREvXqsP6P0CQ
         16EXGM97iPCk0Lu8DdWiDs3+JBbzMKZEeqqdGXe/2kKrKQYeMFj7lD6Q0QdsY476hXC/
         hf8ecuBZAkCnaqrpCaYMJk/0bjseIIj/ajVOWf+GXbInqL1pmVofKw8GYXxJSXmCyqYO
         gCxw==
X-Gm-Message-State: AOAM533WWRAJuwTXJYCPjEAQrbS3D0hPh+JYkgMyMznK1PHLJqcXXpuP
        IQuQbKwHT8G5BWMuSB5xYq4UylSoXJ0=
X-Google-Smtp-Source: ABdhPJyWfTcX7CiXkaCQQMEU8cD8exMtU05cdJblxC90VLGn+++XyNQ/kWI4aZe1oF8PUhaBcozaFA==
X-Received: by 2002:a6b:c043:: with SMTP id q64mr9687469iof.131.1605005227056;
        Tue, 10 Nov 2020 02:47:07 -0800 (PST)
Received: from [172.17.0.2] ([40.79.26.146])
        by smtp.gmail.com with ESMTPSA id f77sm9046048ilf.40.2020.11.10.02.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 02:47:06 -0800 (PST)
Message-ID: <5faa6faa.1c69fb81.2fba1.1f2e@mx.google.com>
Date:   Tue, 10 Nov 2020 02:47:06 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============1568970708826753195=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, xiaolei.wang@windriver.com
Subject: RE: [v2] Bluetooth: hci_ll: add a small delay for wl1271 enable bt_en
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20201110101311.1657220-1-xiaolei.wang@windriver.com>
References: <20201110101311.1657220-1-xiaolei.wang@windriver.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============1568970708826753195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=381061

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


--===============1568970708826753195==--
