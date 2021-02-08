Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85708312982
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Feb 2021 04:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhBHDp2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 7 Feb 2021 22:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhBHDp2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 7 Feb 2021 22:45:28 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E14C061756
        for <linux-bluetooth@vger.kernel.org>; Sun,  7 Feb 2021 19:44:47 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id f2so15226424ljp.11
        for <linux-bluetooth@vger.kernel.org>; Sun, 07 Feb 2021 19:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=COvj8MRQSNEK0eEWcSIsAksd4wpT5snAmjR9yvu3b/o=;
        b=rFFtZnCSDkigimCG2puC/CTvZmeFohXPxVeksFrL5o61OUlgyLDDV+jV7D9HMx4WzR
         HLyEIWQCc9PV24LyYBV0q9oglnH8LSSGO52zM+7TgWyT9865uQpvU4bJz3CkupvuCyrS
         otf3hnlThJ1xN6tkBZKOAvlSFY4O41l7ON03XkDWiM+z/rp0tdbxpSmvAp6vNtGPXR4x
         8t8I5/1xsxx+Xd3HQXOrnkHeUQ1Q/xWPFMJ8Y0vlzyfBQAaVAsSwN8bwpA+U0472x3+H
         dVYrdFfc2AVC6tzj4+GK9VIjhG9bZ0w2zNRf0/N4xm7dfx4swj8a330MiF16+cmltL+u
         JBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=COvj8MRQSNEK0eEWcSIsAksd4wpT5snAmjR9yvu3b/o=;
        b=tMCQz0X9JGyJHLOAaZ+/cQyCQ8lUL9rC4nppX8irQxZThe1pMbrcaC4EgJ6aAujTyF
         /dkJyqdH/JL/L2xwjjKtjoKjY8OujvFK86LStpxiUp+Ob9Wj+wrMsjFMjMeR5JTZF1Yq
         A9hmKKtrH6yH5Qaol7gHCm8s90dwY8T+f4dySt3/qA16RteyAof1OmSGYEq1JinEp/Xi
         YmxKTiqZm7632jpR354qNVsKWqg7563Cj/yNtKcPLUCIcof9kc03cKEPaJQ4W+tZhb/M
         YgkTooXmzOnrF5Yu/i2yP+WtwwuOzNi+4MtvO9SgOm//s3IZsqDm8zUQahC3aRFt6jLv
         lAzg==
X-Gm-Message-State: AOAM5305JDFom2q7iiS5tzsW70PM9HTxn95Z5qgwSLEOI16DJKL1szfU
        9I0s7R/nXZia3snqrUz6M8tXvMrjPBuz6O98/R+DhcSBk2c=
X-Google-Smtp-Source: ABdhPJyXP29goMlwFKfxMsqvYwSgX0doDedj4t5QJ6XNODeeEwYgrFLciMPKxwihqnZITcoLI4Okvu6v6H2ra53udUs=
X-Received: by 2002:a2e:9007:: with SMTP id h7mr4583089ljg.26.1612755886212;
 Sun, 07 Feb 2021 19:44:46 -0800 (PST)
MIME-Version: 1.0
From:   Zohan Lin <zohanlin2@gmail.com>
Date:   Mon, 8 Feb 2021 11:44:16 +0800
Message-ID: <CAFFpJBVNqKQyzKLxKd4=4fU6fwQtPvpoPhgnr3+a_KEp0Sb9mQ@mail.gmail.com>
Subject: How to check Bluez SPP profile version?
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello guys,

In the website https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/doc/supported-features.txt?h=5.50
It says BlueZ supports SPP v1.2.

In the other website http://www.bluez.org/profiles/
It says BlueZ provides SPP v1.1 profile.

Could somebody tell me how to check the right SPP version?
