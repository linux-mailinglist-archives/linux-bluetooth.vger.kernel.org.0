Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D734309CFD
	for <lists+linux-bluetooth@lfdr.de>; Sun, 31 Jan 2021 15:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhAaOd2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 31 Jan 2021 09:33:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbhAaO0B (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 31 Jan 2021 09:26:01 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCD4C061573
        for <linux-bluetooth@vger.kernel.org>; Sun, 31 Jan 2021 06:25:21 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id h11so7624048vsa.10
        for <linux-bluetooth@vger.kernel.org>; Sun, 31 Jan 2021 06:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=JsMDPw4VG5X3Nhvx43f1G5jZxkWoHHztM/y9YV8AmfA=;
        b=A4jXJGbVqciE3gtTqqHsDDt5hyRJpAD7q5JpeW0SsC9nryk0xoF3+uTJa+sYFMCBug
         AlPQYKgiQ24hF1HLaTB/N63CqkhUaGKi6RADG6hQh9ORIxnl3n+ABDfXvbm8J76mLQOt
         NDHdU/0jZOb5Y5SzF28Vx6NHZzs0e/JF4p5HxEyFRwwQDc2OUPcfQNAzhVm7wKYEigfs
         OYUa0MmVwQc72ymwtOq48Y4xXlHeQDaXgsRMu23RI4IURSkG7G/zsKknB9MPMqFRagFA
         KpD0jAZm/I4xsU6jat41tg8zUtiu2Ad2oI44TqaeO7zrfd3Pru8Hnld86U5/tlFgT+9M
         Y1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=JsMDPw4VG5X3Nhvx43f1G5jZxkWoHHztM/y9YV8AmfA=;
        b=HvtKDFHH9rTx5e2JnvW+OoJnj61/riMzXhVrLl+ev/HVDnYY6erdxFt8bYu09Z+eGJ
         5qzQqmh5d37NCoPchzAGMIdAmGonRf5+Yr/fkzMesC/StG/sOHQl8F8IPUs341Zfcq69
         kbsRz2rfeQ4FK8pXpPrH1RBb4N7PEt2CuXpMCZVBJbZg8XbPfXh4o3ho5s4+k6ii+QFD
         l5qjM/C8wKnDEehaFFvPLs3F7qQaSFXGUVOfStt6uM5odq9ekb/jbS0sfyOpa3yJSGXJ
         svogRLxvZOQngcl03S2tSQ9R5pngHdytqKctmxaAXKaxbn1FPYhG5O59Vav5ng3Fnsgt
         FJEw==
X-Gm-Message-State: AOAM5323gp78lDQPwti1Z1jFMYuXh65HQYN3+E/UdEyYyJeE9G80GJn7
        1FfM274qEWXOJEv8b9G38TS4y8tUaupZY0Sx9P7ju9JsDM3fJg==
X-Google-Smtp-Source: ABdhPJxb/VZcr65DYUNz9iMa+X4p23DkK9Ox68VvlDkotT2BXg/wKqF9v/yCGVdTWhqMH6Nv2BnJsv+wAiwwYfnJZyg=
X-Received: by 2002:a67:eb06:: with SMTP id a6mr7215095vso.30.1612103119616;
 Sun, 31 Jan 2021 06:25:19 -0800 (PST)
MIME-Version: 1.0
From:   Steeve McCauley <steeve.mccauley@gmail.com>
Date:   Sun, 31 Jan 2021 09:24:42 -0500
Message-ID: <CA+MRLqnTTuaJGiqXAfZ1M8=XU2W9Of_uLP3AxbuXPHJyEngdfg@mail.gmail.com>
Subject: Bluetooth do't support firmwawre rome ...
To:     rjliao@codeaurora.org
Cc:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Rocky,

I'm writing to inform you of a problem with a change related to a
commit of yours from 29-09-2020 to drivers/bluetooth/btusb.c.  It
seems that you removed one important check that breaks many bluetooth
usb atheros devices, specifically this line,

- /* Don't care about high ROM versions */
- if (ver_rom & ~0xffffU)
- return 0;

The issue is discussed here,

https://bugzilla.kernel.org/show_bug.cgi?id=210681

The commit log here,

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/bluetooth/btusb.c?h=v5.10&id=b40f58b973865ee98ead884d2bdc7880b896ddb8

I can confirm that adding that check back fixes the problem for my
bluetooth adaptor.

Regards,

steeve

-- 
:wq
