Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C9E57A8C8
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 Jul 2022 23:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiGSVMT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 19 Jul 2022 17:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiGSVMS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 19 Jul 2022 17:12:18 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7FD5E33D
        for <linux-bluetooth@vger.kernel.org>; Tue, 19 Jul 2022 14:12:17 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-10c0119dd16so33696244fac.6
        for <linux-bluetooth@vger.kernel.org>; Tue, 19 Jul 2022 14:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=8dOen3G6OK91V9/3+cjlDCAlTkQ6jsZcVYAsV3H8gLQ=;
        b=WlVWdb9m53or4IWMepu14MgKWAEv7TjgMb9QvTqqkbxFHL29NyYA4GcLxq08mC3rJR
         GvuxxuVxg9r4AA8P6/vXFRKJq7mAdXjWQP49LtwR8W/up3wbLfL6s1lRLZYYd4D5/3QA
         dLQz0/8N/Yedj7jT2UTUkLWoC7BW2/7ECCt9c5pu/77yzsa9SyMzvF65Jxd2hl9QLkuf
         kkFyj22fMlKN1S8FwUbiW7th+Rr1HK6vWp/E7mdzscRIDejiTxlE6LFbkt87AF8n20Qc
         S5iAS6/v2yqxLWQGJBC+F0mThPjKExAvGKEN5d+awmKE9XPteY3pwemXNOrQkg36Nflq
         MrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=8dOen3G6OK91V9/3+cjlDCAlTkQ6jsZcVYAsV3H8gLQ=;
        b=tviwJdGWo5MBRQoCPM82LeiLaZJOgBXaASHPjes3q3I+F3LE7uNLWIeO0q4MVUne9I
         LvElxMeK4H5bReNDuIHG/libomkTH3z2S8T7ersQtJ5gUJ6kQleIw9jU1ngpA7BfVlOe
         Y4PdoTiluuIzgKHeheuSVf3Zy1q33IThGFI5X4Ew7nt6WCUHGsnTc2NAEKpi0IzTTF+L
         dq4eMlFOzy8zoLwYpUjaTa1UFMUcFAJ86BkEs+yonaOg5QtJu+lbcujxecLJIjD/fI6r
         URmm3Lu/5uWnCLgYzKC9YDgpttzE75kzeLLVAfmOCGStssK+JTJznydVQ/REW41y2gBj
         UayQ==
X-Gm-Message-State: AJIora/xo3KwULx72VfEyOGtgCDn+blWj6ZxdVcJUwFUXXRPWCt2Gj/r
        jBJgVASAbIc6OuzvuRk92zPNHUaAyb7uaPDARIE=
X-Google-Smtp-Source: AGRyM1tKYlHk1zccTpsmsMaAfdHy4FJRr34oF2F3zITaOYgiPkBMqk/PHMhp+j3B3FyYVJpT0z1N51A0rkVycU4btlE=
X-Received: by 2002:a05:6870:ac14:b0:10c:59bf:fc19 with SMTP id
 kw20-20020a056870ac1400b0010c59bffc19mr772470oab.270.1658265136262; Tue, 19
 Jul 2022 14:12:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:751:0:0:0:0:0 with HTTP; Tue, 19 Jul 2022 14:12:15 -0700 (PDT)
Reply-To: mrslerynnewest6@gmail.com
From:   heard office <chinelomma6@gmail.com>
Date:   Tue, 19 Jul 2022 14:12:15 -0700
Message-ID: <CAMuY+aZQ5JOnW=Zx-1KoWQUO2tx8KarSjxaOjS1AzYF+zFMTdw@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:34 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrslerynnewest6[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [chinelomma6[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [chinelomma6[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--=20
My Dear Beneficial
I Have A Very Big Good News For You Which Is
A donation of =E2=82=AC5.8Million has been donated for you.
Please reply to this Email {mrslerynnewest6@gmail.com} to Contact
The Donor (MRS LERYNNE WEST) for
more details about donated funds that belong to you and receive your
Money peaceful.
Best wishes
Alexandra karuska.
