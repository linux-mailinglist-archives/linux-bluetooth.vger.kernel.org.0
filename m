Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5A41FA872
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jun 2020 07:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgFPF7Z (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 16 Jun 2020 01:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgFPF7Y (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 16 Jun 2020 01:59:24 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B40C05BD43
        for <linux-bluetooth@vger.kernel.org>; Mon, 15 Jun 2020 22:59:24 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id i8so4527613lfo.4
        for <linux-bluetooth@vger.kernel.org>; Mon, 15 Jun 2020 22:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=54RQTNuCBLMA78Lbbz3AH3umRu8N4ymULqQZZ0ubiZ0=;
        b=NeoAmEUXt9vhpLg2uWHR5TD1WzKVn/2BZ2LQ7GYDPVsaxbD/Gd5lgBtPqItflZqd5j
         U9HIqHCHu5vZabuys0iRZRNcEKg+/NfcoenhKeAXwZ8ZTowCMFhlDDZCQmYyMAoqHwK4
         lpH2QRPiUp32DSAUxO7iFC101k/f5VdGYu62Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=54RQTNuCBLMA78Lbbz3AH3umRu8N4ymULqQZZ0ubiZ0=;
        b=NwWA+I8Veokm+3k88rKsV2Nc+F9qq3uyBpOhAmGrqTItxYTw/dkbnOYapHh81wShTf
         4O6OQY6rxfce8nZF2swz6m5Lj1SmpF3Hj1A9hoLYvn/mEky8ZUxMRwRJfppGxyMKiehr
         eGaoLNcivf9BFxSv9Rm6pcJCrV91wQ+04v7T7n6L3zx214XqSptSIBySCJZTNaoQrMPS
         Jy5tI+44EuN8elnH8n9guyyDkjUT89XV2Wsb3npziGsFu6gteBvovqcvIG84i/et4j0W
         huhjVCW7TMdIiTtDzMVkOdXIzeD8QaPAWwMnO77nQF8ZueO2OX9P3oZbZmRbaDYCrXNW
         I83A==
X-Gm-Message-State: AOAM533236euTIQHOjjiV+9iCIpGwqooHk3nLWgAN+XGTgwHiqtmUreA
        PEsxjEI4AQncYcacUym4qlbXlDc3OrBqDihZSFCA6w==
X-Google-Smtp-Source: ABdhPJyAkXLY+74IsNtKGGpcJ4bnD0PDCPFwaGFLfSZzB/y0Dq0tUuGcSrNlcELsPKXMGf74Zr8Nj0Wyj/9IELYS7pM=
X-Received: by 2002:a19:ccc5:: with SMTP id c188mr807355lfg.163.1592287162541;
 Mon, 15 Jun 2020 22:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200603160058.v2.1.I636f906bf8122855dfd2ba636352bbdcb50c35ed@changeid>
 <2097432F-C4FA-4166-A221-DAE82B4A0C31@holtmann.org> <CABmPvSHKfS3fCfLzKCLAmf2p_JUYSkRrSfdkePVaHXSrLrXpbA@mail.gmail.com>
 <550BD45A-FE50-48C1-91CB-470D157A728B@holtmann.org> <CABmPvSE=eX_MqAWvgvOo9B6D+5Y0SzedAbRxrKmopvV+DTo5MQ@mail.gmail.com>
 <6E7BEC8E-D158-4990-A499-B38BE21FD80D@holtmann.org>
In-Reply-To: <6E7BEC8E-D158-4990-A499-B38BE21FD80D@holtmann.org>
From:   Miao-chen Chou <mcchou@chromium.org>
Date:   Mon, 15 Jun 2020 22:59:11 -0700
Message-ID: <CABmPvSF3DXwAFRAcBPoWaaUDBjf9AWo11uVRXE3yEA=0AnXukQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] Bluetooth: Add definitions for advertisement
 monitor features
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Alain Michaud <alainm@chromium.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Manish Mandlik <mmandlik@chromium.org>,
        Michael Sun <michaelfsun@google.com>,
        Yoni Shavit <yshavit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,

https://patchwork.kernel.org/patch/11606491/ was uploaded for review.

Thanks,
Miao

On Fri, Jun 12, 2020 at 11:17 PM Marcel Holtmann <marcel@holtmann.org> wrote:
>
> Hi Miao-chen,
>
> > The name in the mgmt-api.txt doc is "Add Advertisement Patterns
> > Monitor Command", and Luiz changed the name from
> > MGMT_OP_ADD_ADV_PATTERNS_MONITOR to MGMT_OP_ADD_ADV_MONITOR before
> > applied. So we either change the doc or change the header file to
> > match. Based on the outcome I may need to change the name in mgmt.h in
> > the kernel patch.
>
> we change the mgmt.h to match the documentation.
>
> Regards
>
> Marcel
>
