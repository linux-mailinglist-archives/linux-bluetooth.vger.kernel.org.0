Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E42352EB7D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 May 2022 14:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241234AbiETMDW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 May 2022 08:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348990AbiETMDN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 May 2022 08:03:13 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 499F114D7BC
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 May 2022 05:03:13 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id h186so7565675pgc.3
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 May 2022 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=QTCWBzEezgLv+Z2QZNvCkKQgrxXaSDur4w34RcJaRzY=;
        b=fzsq3/U4ZCRYRvKdLqarf8mUBA96kTcn6i+Hw7JA3JxUuhXu/dGZ6Ixmaek6gc/9GJ
         u5sauDgc4dSefdgF1yeHzXUVliz1saCxoWx9RW+23y89c+7t/laE4NjT+oGniYkirLG3
         HJzsEPcX2uDOHLxmFTirtUT97iAPK6QNt3A9b7Lt1NBu+B9M01WZRffjg7YOmEqv5q77
         jrfXgXD1PnFsOl4qoYbB/CEMIkd2zgJ0zvpwl/GGNLCIazS2QBsREwuzdT800/amBHr8
         CxBaV41mSjk3dtt9ptv3i6DBy62z08g58WlhnzoryGA5UIop1HktzZbpYb3hUTPostRN
         MIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=QTCWBzEezgLv+Z2QZNvCkKQgrxXaSDur4w34RcJaRzY=;
        b=uJ0sebDThoVkC3SB2tNLuNHTehJdAdLHgmLKK9pgk9Ydw1ieLsp7gB30H5nfLVzUym
         yoXr32n3gXJNkGNWGeJRrDXe2bb3wB8SV03Dx/l0b/TEFH6E3BJfyUBHaZcUFlUPDkGg
         aAj3Tf5b7WKcpzqE5v0NodosZG9B8sZFa9GWWQj364SP6hhd5xkBiqRLJEDnCj5cozDr
         24pCVoXL7JlKC4e2caujumhDFEoiS+OgzIRSTdjtGswf0ttgunuv21Y0lGvP4DlogR5l
         AUe0LVguzlx9aR12TUYrChf3ibfMM7lH2hYcfjX7jyp0AtIbpMR3m0C6BenuyjoLnl7t
         d9Lw==
X-Gm-Message-State: AOAM5321I63lRAunKrwPpdTvxTl0e/9CGXmsZOcrpYu+c8IRK5ldwPgh
        A6qGbytqYIQTVhrc2x1fo6GX+r0AiASORsl0amM=
X-Google-Smtp-Source: ABdhPJx1+aOzBobB7QbpDJO0TeLnQIqMbruyEHb40yHugiEZrS71tvxZqdo+FxnhTf6z2ToEBByiUXequkcVcWAX7z4=
X-Received: by 2002:a63:444a:0:b0:3f2:6670:d7b6 with SMTP id
 t10-20020a63444a000000b003f26670d7b6mr8192973pgk.309.1653048192808; Fri, 20
 May 2022 05:03:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:4f8a:0:0:0:0 with HTTP; Fri, 20 May 2022 05:03:12
 -0700 (PDT)
Reply-To: illuminatifame157@gmail.com
From:   illuminati <ikporay@gmail.com>
Date:   Fri, 20 May 2022 05:03:12 -0700
Message-ID: <CA+u7m03z91Bf6zY0WQVeG+s18LzeVL1H6XR=2UbYw7EGc9V7RQ@mail.gmail.com>
Subject: illuminati
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:543 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ikporay[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [illuminatifame157[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.4 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--=20
WILLKOMMEN BEI DER ILLUMINATI BROTHERHOOD ORGANISATION, einem Club der
Reichen und Ber=C3=BChmten, ist die =C3=A4lteste und gr=C3=B6=C3=9Fte Brude=
rschaft der
Welt und besteht aus 3 Millionen Mitgliedern. Wir sind eine gro=C3=9Fe
Familie unter einem Vater, der das h=C3=B6chste Wesen ist. GOTT
. Ich glaube, wir alle haben einen Traum, einen Traum, etwas Gro=C3=9Fes im
Leben zu werden, so viele Menschen sterben heute, ohne ihre Tr=C3=A4ume zu
verwirklichen. Einige von uns sind dazu bestimmt, Pr=C3=A4sident unserer
verschiedenen L=C3=A4nder zu werden oder zu werden. einer der weltbesten
Musiker, Fu=C3=9Fballer, Politiker, Gesch=C3=A4ftsmann, Komiker oder ein He=
lfer
f=C3=BCr andere Menschen zu sein, die in Not sind E.T.C. M=C3=B6chten Sie
Mitglied dieser gro=C3=9Fartigen Organisation werden und Ihren ersten
Vorteil von 1.000.000 Euro erhalten? Wenn JA, antworten Sie bitte auf
diese E-Mail: illuminatifame157@gmail.com oder WhatsApp the great
Grandmaster mit +12312246136
