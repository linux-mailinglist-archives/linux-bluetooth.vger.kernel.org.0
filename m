Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9463458B595
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Aug 2022 14:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbiHFMhk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Aug 2022 08:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbiHFMhi (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Aug 2022 08:37:38 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A8E2DFD9
        for <linux-bluetooth@vger.kernel.org>; Sat,  6 Aug 2022 05:37:37 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id e127so7398456yba.12
        for <linux-bluetooth@vger.kernel.org>; Sat, 06 Aug 2022 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc;
        bh=vvtS89Fk2u1S3Szl4rrCs3KSXNS797GmNVbZS9fGKtQ=;
        b=cGU74KiXsAWmQo7b5ysRSoTJRblN3ee4wgEMwnQJaeTqfpkxgciQwz0vtEvP92SF0f
         ngFj1/2FpRRX3frbkZsz7lDMb6zo4qeCaGSuNr4yCLI8gZ+qTNfEl1imBTVpUT7tnEfL
         neBjnx5+sho0JANks4/w4vbOCvVGnD4YFeysBzh07yO/93srUVnQgHEfy6IYeYR8I0pW
         Yr0jTvVESXYuL3QmuGPgi5j1AjDRRCeGJ8Lvwf42RdlKJid2TjcFoj8CzcjibU2qKMVN
         6iPh7MxJEBD6qMg1i3KaaeEw3Vxu2/3Yzd8wtpFyKN6elqQb0WqAlODZQqU3UMZyLH73
         boPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=vvtS89Fk2u1S3Szl4rrCs3KSXNS797GmNVbZS9fGKtQ=;
        b=4ha941ETVxOZIrPGF3siCWUW1NTuNr+n15S1VurXbEEy+sflvjgWCY9hKTnvYTW9h5
         zJ4TIjykVw4lvxdGtiEuqrzD6M/PkCPsF070aoaZqax93H9Wci/EzPOodwZEsT23THjN
         r3w+3N7wj4VrDeJSdC2gVoxOzj8WPlWt2Xu6c/fYRMYQhRr4Ja+Ll5IEuUmNLguK//dx
         Tt37L+6U0tAjhzXe8m6XN9+73SIFc/X0REIjvi85s5XEmcK+bX6OGzFO/ZbSgaHOBbyE
         zAeruLLaO2XLAhqeXVCSP9pPiZZ4LXqRR+E2uUhg9oaV3uViyms7UKQmsvfx4VQ0kyTU
         ZNmw==
X-Gm-Message-State: ACgBeo3l9vvCJjR1MCNocHA1s/DvE0Nj5WZqslAfrPVimLnq/iJxrEDL
        BbBXPzjOF1bWRxqRPb4caFjeAbW+x9Pb20e8HJQ=
X-Google-Smtp-Source: AA6agR5hkATzdZPN/YPqLjADrVClmMPPZvtGf2464aBkeESIM4bE6oQFqNjfCNox0SoWEvdjFPySIDkSQfJ7h8ua+Yo=
X-Received: by 2002:a05:6902:251:b0:676:e907:c782 with SMTP id
 k17-20020a056902025100b00676e907c782mr9723314ybs.439.1659789456314; Sat, 06
 Aug 2022 05:37:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:14a0:b0:18d:90d8:2a81 with HTTP; Sat, 6 Aug 2022
 05:37:35 -0700 (PDT)
Reply-To: cfc.ubagroup09@gmail.com
From:   Kristalina Georgieva <ubabankofafrica989@gmail.com>
Date:   Sat, 6 Aug 2022 05:37:35 -0700
Message-ID: <CAHwXt+y43Cutjyy6X4-1WjS9O4BpTujA7NuZMBnv-wFafx3etQ@mail.gmail.com>
Subject: HEAD UUDISED
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,LOTTO_DEPT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b43 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ubabankofafrica989[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ubabankofafrica989[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [cfc.ubagroup09[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 LOTTO_DEPT Claims Department
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Lugupeetud abisaaja!
Saatsin sulle selle kirja kuu aega tagasi, aga ma pole sinust midagi kuulnu=
d, ei
Olen kindel, et saite selle k=C3=A4tte ja sellep=C3=A4rast saatsin selle te=
ile uuesti.
Esiteks olen pr Kristalina Georgieva, tegevdirektor ja
Rahvusvahelise Valuutafondi president.

Tegelikult oleme l=C3=A4bi vaadanud k=C3=B5ik =C3=BCmbritsevad takistused j=
a probleemid
teie mittet=C3=A4ielik tehing ja teie suutmatus tasuda
=C3=BClekandetasud, mida v=C3=B5etakse teie vastu j=C3=A4rgmiste v=C3=B5ima=
luste eest
varasemate =C3=BClekannete kohta k=C3=BClastage kinnituse saamiseks meie sa=
iti 38
=C2=B0 53=E2=80=B256 =E2=80=B3 N 77 =C2=B0 2 =E2=80=B2 39 =E2=80=B3 W

Oleme direktorite n=C3=B5ukogu, Maailmapank ja Valuutafond
Washingtoni Rahvusvaheline (IMF) koos osakonnaga
Ameerika =C3=9Chendriikide riigikassa ja m=C3=B5ned teised uurimisasutused
asjakohane siin Ameerika =C3=9Chendriikides. on tellinud
meie Overseas Payment Remittance Unit, United Bank of
Africa Lome Togo, et v=C3=A4ljastada teile VISA kaart, kus $
1,5 miljonit teie fondist, et oma fondist rohkem v=C3=A4lja v=C3=B5tta.

Uurimise k=C3=A4igus avastasime koos
kardab, et teie makse on hilinenud korrumpeerunud ametnike poolt
pangast, kes =C3=BCritavad teie raha teie kontodele suunata
privaatne.

Ja t=C3=A4na anname teile teada, et teie raha on kaardile kantud
UBA panga VISA ja see on ka kohaletoimetamiseks valmis. N=C3=BC=C3=BCd
v=C3=B5tke =C3=BChendust UBA panga direktoriga, tema nimi on hr Tony
Elumelu, e-post: (cfc.ubagroup09@gmail.com)
et =C3=B6elda, kuidas ATM VISA kaarti k=C3=A4tte saada.

Lugupidamisega

Proua Kristalina Georgieva
