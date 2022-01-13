Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2352B48E075
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 Jan 2022 23:39:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238020AbiAMWjx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 13 Jan 2022 17:39:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235281AbiAMWjv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 13 Jan 2022 17:39:51 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D398C061574
        for <linux-bluetooth@vger.kernel.org>; Thu, 13 Jan 2022 14:39:51 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id l16-20020a17090a409000b001b2e9628c9cso12419064pjg.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 13 Jan 2022 14:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=fp+3NMsXHR7mkUPMv9Oq5QJTga7zxBy7HwgOkWsi+HVJ4o7jOOleg00j30S+o8p9ZX
         EAJbUkR+vuQPdilpYm3udesLTQb3UN5F8R3M8lxeETl+86pn91433+negjNBeOtoKT1a
         3LE8yt4p++wcIfIKnzG6dhJi8ZwubgTPCCNU8W4fTz3mO9fbs65RqsTBxUrfsEahPPY7
         7CFNMNXhiHHUZnXgny5qZMO3kpdve9LMfBWZrx1fdGDeTjHr3StmZoyMJbpH5scyOEUU
         riGJg2Voi3URrIHFOcBZhLS7QeqDsDtaER6qT1b0d/pUOSreYXt0mzdD8MSWsXGD+eDw
         +xOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=AcGgx9QIZJz0SPj8xFCwrXOM/okP/Y+ZW9sxAKaoy2UrUq9C8qTFOqkdg+YzA/d0yA
         kfP/kJwVuanlx2Fb2gv/PIZK76yC8kAJUuej+smmB8eLPT5KIwgWpmwz9GI+eKP3aL8y
         Cf9EiDumQ26gBbL7FO84Yz6uAVrjxk+Kvh1aeTA0NJY2YaGTl62SK236BTzOO3PNSZBp
         WDVgg5Z6hn1ivr5SvbNWV+8dpeMi8n5TPZfOV3gRRb4XJ37GBH1m4NXnPyNZrBx4f0R4
         BohPunR2kBhKyO0mQi34/oj6/AWZiyJrH69HDjQxWsoEGLPrnniymNOmODr5ZoGnstMV
         ODyA==
X-Gm-Message-State: AOAM532SmOZ4w4Kc8FKUQ5wVFAncto6sVzk+IGnKP3KmfUBpOpFdd1g+
        ljrol1nvRYR6zcXherWkGMsO9wGZxcabcG6kuLs=
X-Google-Smtp-Source: ABdhPJxK739at2BMpLC/r6WrtqAYj/WJWzPBM/WVQa0qXFMTP70LZye9o/B0R8xHpiyG5lYj6P7RVn1D/YSSUOvYWEY=
X-Received: by 2002:a17:90b:4c89:: with SMTP id my9mr7502494pjb.152.1642113590715;
 Thu, 13 Jan 2022 14:39:50 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:f38c:0:0:0:0 with HTTP; Thu, 13 Jan 2022 14:39:50
 -0800 (PST)
Reply-To: mchristophdaniel@gmail.com
From:   Marcus Galois <marcus.galois@gmail.com>
Date:   Thu, 13 Jan 2022 23:39:50 +0100
Message-ID: <CANqBaXVyJMpGTC-Zyw6_L71P46EwyvSVt8jgPwF7rEtmRUZ_ZA@mail.gmail.com>
Subject: Good News Finally.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello friend.

You might find it so difficult to remember me, though it is indeed a
very long time, I am much delighted to contact you again after a long
period of time, I remember you despite circumstances that made things
not worked out as we projected then. I want to inform you that the
transaction we're doing together then finally worked out and I decided
to contact you and to let you know because of your tremendous effort
to make things work out then.

Meanwhile I must inform you that I'm presently in Caribbean Island for
numerous business negotiation with some partners. with my sincere
heart i have decided to compensate you with USD$900,000 for your
dedication then on our transaction, you tried so much that period and
I appreciated your effort. I wrote a cheque/check on your name, as
soon as you receive it, you let me know.

Contact my secretary now on his email: mchristophdaniel@gmail.com
Name: Mr. Christoph Daniel

You are to forward to him your Name........ Address.......,Phone
number......for shipment/dispatch of the cheque/Check to you

Regards,
Mr. Marcus Galois
