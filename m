Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9AD44401A5
	for <lists+linux-bluetooth@lfdr.de>; Fri, 29 Oct 2021 20:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbhJ2SEq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 29 Oct 2021 14:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhJ2SEp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 29 Oct 2021 14:04:45 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B0AC061570
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 Oct 2021 11:02:16 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id d3so17567548wrh.8
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 Oct 2021 11:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:cc;
        bh=AT2vVSkbs5Z2AlPH3lVSxISBm4g33VFLgVGD3BjUf+w=;
        b=p9JDnWKfV3YBWTnCdKT8HI2WICDAcWgS617gRp6iDGj/WUAb4qALTQV/s2LYGBP2rR
         Y522NOF9Mq+E7cmE2wOTKoD+hOYNJTQQVyvRRQa889+atMEk5UBPatzasVLlZ1bgqm3K
         /lzXReV7MQZ2Tj2nJIzdmou+udL87d3zXjqmeljutbjHTj2+qYWZyeeamTXlds0dO7ZK
         z73UYTZl2zH9EHUu0gE4Ynlu1HFpgkOMcA/txDWLCHwNLKRjrCOxf86c4lOfSvDYeUIW
         vAY+Diz1pg1JXVhW95KOgMgiWfD3vAaVQXKaydl8pu+aC7JpKUHC3dT7wX5i/iK+tZB5
         lt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:cc;
        bh=AT2vVSkbs5Z2AlPH3lVSxISBm4g33VFLgVGD3BjUf+w=;
        b=RmAL6dfE0T4Ks1ZGl7k1ABEE608903KsXEyHYWTAwxCVPpOqKAGE60OnzY7nbYXEgE
         wOd0xfvm4g49+pHxWALnYr5aiv3Zx7+195v7VY9644lEbu47QBLq4lf5+fw/OmfOH3l/
         Lp5h9uj8i/1mR+d4dvP4yFBpDgHMgY5yZz6Y0jFnRyscME17DD9HavmhaeyoQjoSv6cR
         GtPsGfKSfCOIPHrsgynD3f+CyXImzHzogmgdm1iML1/cYiLHCwrFnbPDAftc2a4Ygzfk
         /sVDeKxOru5BryIJZC4kKz+z9Z7bgmNaMvS3hgc4I/NoviaXef9HEgWn1mYnGiPaZvm2
         wUDg==
X-Gm-Message-State: AOAM530OLRdxvh7yN3vqWcPiI9Zn1vkpZQruy+T6bJyGsGOUB1wW2KBT
        y4jme8IrK3gbK4TsPIrCCu3z7n9ug2tscbh7K7g=
X-Received: by 2002:a1c:158:: with SMTP id 85mt8315001wmb.182.1635530535286;
 Fri, 29 Oct 2021 11:02:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:c407:0:0:0:0:0 with HTTP; Fri, 29 Oct 2021 11:02:14
 -0700 (PDT)
Reply-To: israelbarney287@gmail.com
In-Reply-To: <CAO8vqiuNYfioim45C9vHvGaHRnJ1Mg5RTtzUbUCokOwZbp0wUA@mail.gmail.com>
References: <CAO8vqivBULYrRLfz+MQDPOSYPt0TMkfs-Ddu5MbPpqCFQaD_Cw@mail.gmail.com>
 <CAO8vqisBZGTKQTwXjh8cf7CW8197_HVUMp9ZBSM-5ipvyzW0mw@mail.gmail.com>
 <CAO8vqiuJpqC5Yp61QKHp898eG2f9jBFbGO88r-xfqQV3RbyNQw@mail.gmail.com> <CAO8vqiuNYfioim45C9vHvGaHRnJ1Mg5RTtzUbUCokOwZbp0wUA@mail.gmail.com>
From:   israel barney <lmuna521@gmail.com>
Date:   Fri, 29 Oct 2021 19:02:14 +0100
Message-ID: <CAO8vqiu7wmHqwVN-zsxK8yg1opXcbSNVLd-dFMtmWyEWugEP_Q@mail.gmail.com>
Subject: Greetings
Cc:     israelbarney287@gmail.com
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

do you receive my massage
