Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20633F68E1
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Aug 2021 20:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhHXSLy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 24 Aug 2021 14:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhHXSLy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 24 Aug 2021 14:11:54 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D239BC061757
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Aug 2021 11:11:09 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id i9so47306226lfg.10
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Aug 2021 11:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=SoTCeBl18+kmMWb+1rGxGMrfQWAXMz60KCb0E/nD4sU=;
        b=qZkaJuJ5ZG87BM5N6qhFH7G/+sW/sjEqq6HZejrftMw3x4ChxkcFNRU+0h3Erg7QU8
         81bCIssa8lGGfY0Vlk5s1PT1zYme9f2CzR+RZz3pUyCT8Ytw6HFBpLCvnaIYv4yEnHFs
         HLTR0DXm2oiIY4nOepku5gPJxEEY7D6UZQHiu85126tJSMTTAURVAB3SmQGg8pT6eAjL
         pObJzTXzWuAcYbmIIxPW1MsAXVL5RjY3GCMSXlzWI5P9uDxggFv+K1RIoXBdSO07UQ5i
         HtlDRFInzbLEEA4vMvO3WnkRqngvKuczkRuRQXpTLR4YppjsGw/yu9cSZd8GDeMo/bDZ
         kCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=SoTCeBl18+kmMWb+1rGxGMrfQWAXMz60KCb0E/nD4sU=;
        b=gy433w+FaT2hToGJNWjG5pkcwi0lTQ9i1s7hx/+l9FFNHxoqIY+IkUYY/eS1kWjoES
         Drj9q1rj6OGdFM30K0FTQCiMJmHEvtymrRc4E8s584PvKOR720L2eUGxQX+UYDxCgMHx
         J0Kl6AcKVFGSV2/n/vDaJp/Z2Ps0AQ1UNDc3M70Z0bRFRcmHrhqpd+C4Rqwka4tPjYyL
         cyabk3EttzE9gpukW/BhUqi33PVeBoQkWIkmzZAKMlSwc9Q3AbX+IIx/8eu7fTGqjJqs
         WAJyF6qgWbheu0ZDlDYNYDKhwtjlEAUPe7//WmpCr1Qx2LjTX4TGp8BbFP66CKm41vGj
         zOeg==
X-Gm-Message-State: AOAM532+t8xRCHuqbdyR5calggmv5ItQoajErfIr0/J8rkbejQTjlzGj
        isaNPZ+7aVg5MGHyF/CMFomWV/iQK78s5Hjgg7kJvrwE
X-Google-Smtp-Source: ABdhPJxxNJZpN6pZTAeOQhte4mSTDmnFYonWph7zYc4bm0d3yiKkxxgYOCohb/WZesAjzlrocv9lQHe3LoUtra0fcek=
X-Received: by 2002:a19:e214:: with SMTP id z20mr29991882lfg.37.1629828668159;
 Tue, 24 Aug 2021 11:11:08 -0700 (PDT)
MIME-Version: 1.0
From:   Raul Piper <raulpblooper@gmail.com>
Date:   Tue, 24 Aug 2021 23:40:55 +0530
Message-ID: <CAEwN+MAuLad-9jh0fb7-ZDN6kSGORf7Rd1HffGV4VpThkP=Rng@mail.gmail.com>
Subject: Which tool to use for Mesh Testing
To:     kernelnewbies <kernelnewbies@kernelnewbies.org>
Cc:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello ,
Which tool I can use for Ble Mesh testing, meshctl or gatt-mesh or any
other ? I followed few mails and came to know meshctl is not fit for
use. Please advice.
I want to test both PB-ADV and PB-GATT.
Thanks in advance !
Regards,
Rp
