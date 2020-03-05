Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B86317A30C
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Mar 2020 11:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgCEKZX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Mar 2020 05:25:23 -0500
Received: from mail-lj1-f178.google.com ([209.85.208.178]:37574 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbgCEKZX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Mar 2020 05:25:23 -0500
Received: by mail-lj1-f178.google.com with SMTP id q23so5448108ljm.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 05 Mar 2020 02:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=7v2qakqZLXTnR2+lwRs7AvWKSbDWJBDIvfkxAASUMSY=;
        b=DfXIgglAOKC4B/icphXgNJsSQuiEkt/2sj7J1lqgrv+St/5FX7/VNm90UCWVwGrpb7
         5o0VPiDMGUsSCXLYMVrTOD9XjDWPvL4BjZyXCkF1vZX9U+VWokvkqOAxZv/ZyHZI3McI
         2GgXd8aoPv5nj2JfXx/4L5gaVm1TaW+MZ63q/2vuTVC2usSh0IohUs8AotOK6lX79cGQ
         4rIj3445hvEr3mUoLpz/0wF0xy1RWf0VddmWq93q/SWPhGnFSjGcmQifSVANN59HPZC1
         cKTMZFY0GXdrTciQgTFyR/lHI3zTFat3MOuOPNN4viD1LrFp8dZDKbcKHo/m2qAR64s8
         SOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7v2qakqZLXTnR2+lwRs7AvWKSbDWJBDIvfkxAASUMSY=;
        b=DahmOTCP7D0YzJkqPj+2DOOjARNUvac9afuCrEQjdT/s3fQxGHWrt7C2DfsJGog3v5
         ezpNIKFsUjnRqv/JC6wAC1MRxaiBX3nqAHAxoYyUJt0uoEvvxqfTjCM78JTidfNcET52
         AHgcM3kROhWlFTsqhwTo3kzmq/7rFFzF6K+8v+UYMxus7snTti9l0QkTS5ofrTDObcMG
         kys2V8oROpeIePe16OFV32Wq6hFxqVAmhZB4H0CSW1TSWOpRKlW/2X6WE9z9J1B+UDVC
         W+kjHr6WF0H9ocIJulh3wUaewh00AlO/uc3UgOvV5ZAD+6O7wBWwzzPgw/XInkiYLcmn
         m/6A==
X-Gm-Message-State: ANhLgQ0W6o9ya4tXecPxIHAOQaeiVjhPaEHbfDEtI3GoeM5L0gor1DI4
        tfT9lemon+CVs8cz+gmzzg5s51mTcR6Q+wTvEqxR7nZiH2w=
X-Google-Smtp-Source: ADFU+vuAoyto8poC2X5y7qxwwa84dslxDFgqlTP7dbn2NKoMI3jROSkRakZ3WlzIu3PdqcG1K/rkHTR810to4TTEPnU=
X-Received: by 2002:a2e:9dc8:: with SMTP id x8mr4843455ljj.38.1583403921103;
 Thu, 05 Mar 2020 02:25:21 -0800 (PST)
MIME-Version: 1.0
From:   Anatoly Trosinenko <anatoly.trosinenko@gmail.com>
Date:   Thu, 5 Mar 2020 13:25:10 +0300
Message-ID: <CAE5jQCeQfyPu7T4mHutYwUjK04P8MyYS8NmTC8pm4sZkHQRRNA@mail.gmail.com>
Subject: On reporting issues with potential security implications
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,

Many projects have some private mail list or some other policies for
reporting issues with possible security implications. I mean some bugs
that the reporter cannot qualify for sure as a "safe to publicly
disclose" (still, they can turn out to be not security-related after
review).

BlueZ, on the other hand, has a policy of "never write to them
[developers] directly" and no easily grep-able guidelines on reporting
possibly security-related issues. So, what is the preferred way for
reporting such things?

Best regards
Anatoly
