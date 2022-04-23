Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBDB850CD5D
	for <lists+linux-bluetooth@lfdr.de>; Sat, 23 Apr 2022 22:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237001AbiDWUVk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 23 Apr 2022 16:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236995AbiDWUVj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 23 Apr 2022 16:21:39 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAFF96D391
        for <linux-bluetooth@vger.kernel.org>; Sat, 23 Apr 2022 13:18:41 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y32so19863377lfa.6
        for <linux-bluetooth@vger.kernel.org>; Sat, 23 Apr 2022 13:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=YUD4Mq/6KcXDja+MeOmBEABeXdZtqxLuJ7zwWNeU3q8=;
        b=OnYx0hD2abzbZra039+PGd9FNrmo0b3nVLSuf73l1EwfV9kThXpg0h+qSHmSI/PGSm
         xCsuz7hQgYA4vW48FkvSyyHN9XGkwReif0ofc8eW/9UuRB2+BkRoWjfQ1z5Qdcelbbn9
         Effuty+XF3ZLCARdLpIo/XKn31ZqhncdaOAfXgFG5E8u3xYaluvdu5IEOdJUUBUzog5i
         OfUptBcaYEW6ArOAhdUfCxhzJ13Vv549PNLAH+RkSYE2tApB3UJd2JECx2/2Vw0SKo1S
         eBQgsYjTexSflRmCc9cpMTCqU8Un7HGKKKRfrIK2DIlgrmhJfDAV3tt7/exdQPUOOYkk
         qXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=YUD4Mq/6KcXDja+MeOmBEABeXdZtqxLuJ7zwWNeU3q8=;
        b=TNq3F0zZkBHDJVdco/5rAZ8Wahz32cKMRq4dsMFa4qLg2Ky/JMfOc9vq48w4XX36Z0
         MXM3qYFO50LbQLMUKB/unGNWUxBn7mb77GCbgPS8Tl0Wk9CO/X1wtPP77dVOtJnIPur+
         okw4NUQOEE8+T7fSbaGkDhHbvnl+N3FNEwbS8Dz+ghb9Zd3kecXq+OTQNuQ4tLkexWMZ
         FoySY3QmBuOTTM4wCR/2YE8SZoXAuCKy20l6Xd8LP/WOT/V6S6pQH+vDHkY44G6mBLiE
         bEwnbTug8IOa4lgwBs6AJoVZq31S7A8RQJYpS2R9hiewyXwedhX9UcFYXCP50oh5FGmF
         qbwg==
X-Gm-Message-State: AOAM5306i4KoED4ZWjb3M6or+Ni0Gc7RUz5FScgoDwarFq9uTP7q/ojr
        K2AM7UgZWfE9d/PMoK3k7bA5pyETK3vSrBhDyJg=
X-Google-Smtp-Source: ABdhPJxG7ZFr2V0lZ4EROILZBbx6imB1nf/0atrEzMXJbbNsTPmYeoCTZW7TQPVmzkGmXXbowXza9neuESwZ5ux3sh4=
X-Received: by 2002:a05:6512:214c:b0:46b:b4d6:989f with SMTP id
 s12-20020a056512214c00b0046bb4d6989fmr7658463lfr.572.1650745120154; Sat, 23
 Apr 2022 13:18:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6512:b1c:0:0:0:0 with HTTP; Sat, 23 Apr 2022 13:18:39
 -0700 (PDT)
Reply-To: marianadavies68@hotmail.com
From:   Marian Davies <kl576521@gmail.com>
Date:   Sat, 23 Apr 2022 20:18:39 +0000
Message-ID: <CAN2bDz=Q7CV9DOLDObzqypBdvYep4X=goe0JNoGahfhxDed6pA@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:12d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4927]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kl576521[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [marianadavies68[at]hotmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [kl576521[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--=20
Dobr=C3=BD Den, Drah=C3=A1....Jsem Marian jm=C3=A9nem, dostal jsi mou prvn=
=C3=AD zpr=C3=A1vu,
opravdu m=C3=A1m n=C4=9Bco tak p=C5=99=C3=ADjemn=C3=A9ho, abych s tebou dis=
kutoval a douf=C3=A1m, =C5=BEe
se brzy ozve=C5=A1

D=C4=9Bkuji
