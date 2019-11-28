Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3318910CE8A
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 Nov 2019 19:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfK1S2T (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 28 Nov 2019 13:28:19 -0500
Received: from mail-il1-f169.google.com ([209.85.166.169]:35939 "EHLO
        mail-il1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1S2T (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 28 Nov 2019 13:28:19 -0500
Received: by mail-il1-f169.google.com with SMTP id b15so4806260iln.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 28 Nov 2019 10:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=aCpmQJz9c5rUtAUN5T3Fo45mGfQcyNH6zD4mUTPK1CI=;
        b=ESiQw7f8jr2uMxswx2sMGgD91PPsG91H64xlS5fXhJgmvrUgeYd+bav5I1EzU0Jd0k
         YKknxHYcNPwbFOr48DZYDSm+XqC8kQgJ5dCTiZfpU+3/vhZqiPyUTyDdI0CyNwwQSvva
         EcCIrLmuIrPXaNZUsU6mmYBDy/uN3LhHEEMJjQMQDvCTg0yaxBwCVwRH1zgMTd83vSkf
         Idn+O/4K8VantUoMJduJRo82PFZsU+J9gvUSjTLNq3v9YrhLnY7UatPmZwpc0PpaZFmC
         8G95PC8VscriDobHvrwMTnju380yBXmj2a8DsjkZuicGUGRXt0NyaozLlTRTYnowqLZk
         ctAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=aCpmQJz9c5rUtAUN5T3Fo45mGfQcyNH6zD4mUTPK1CI=;
        b=iZn4AROnu99pGoNKmCiZyB3CsFqIS5zSYeOmYs991kuq174NtECUnHSZlltYtCpF/t
         +9g5cRqd5aBzfux3zpvJKJkCWtj0JcigzWgUbekU0JMwXMkZ5arh8aAGMSALTtHO4Psk
         +iR7vCkzT+ubojfsy0v7dDRQfm8tfNGbKcccOda7uG6zmoXq7TGvXft1h6IabTfAQWjq
         bHUrtPBHe2Mi8ZC6Nn9l8hhsg1pdX/A155GYLYKi+bBEI3iz8DUL2/ehrlnGoFA+zWBV
         +dn1mT4eqeKqaVmQW/5cAwJjcEVpBFDYAwJukwdF16JIsr3+n1r2yCtb5UNXhlt5TR1+
         dN3A==
X-Gm-Message-State: APjAAAWovItrB2614mUJRyJhWb/IBmWGYGv7NdNwcYbYsAp3VdIAga/J
        FVT9eYTBh2PpWPsaDjN1qEEE8zkGOIO4KiV0lx2v2zD1
X-Google-Smtp-Source: APXvYqwsILnc2qSi7pohjT3L7HP4hll6EFtbMPO35tOuS6Vs9yVVsmYainuxAq2Q61V12ZwIDOd74GhxF5FEhiO0heE=
X-Received: by 2002:a92:4010:: with SMTP id n16mr53788205ila.260.1574965698434;
 Thu, 28 Nov 2019 10:28:18 -0800 (PST)
MIME-Version: 1.0
From:   Abhi Arora <engr.abhiarora@gmail.com>
Date:   Thu, 28 Nov 2019 23:58:07 +0530
Message-ID: <CADqM=-wgFoxbnuBb1XwSyueg=cTCN=9tCrSDxRp-Pq8HnLo-zQ@mail.gmail.com>
Subject: Using Bluez as Peripheral and connect to multiple Central simultaneously.
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,
I got to know that BLE v4.1 supports peripherals being connected to
multiple central simultaneously (I know there could be some limit on
the number of connections). I want to know if it doable in BlueZ and
if it requires some support from the BLE Chipset/IC, please specify
the HCI commands to look for it in the datasheet of the chipset.

If it supports, is it stable in the current Bluez stack?

I also want to advertise (being peripheral) while connected to other central.

Please help.
