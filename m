Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA8C69E005
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Feb 2023 13:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233753AbjBUMOj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 21 Feb 2023 07:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234675AbjBUMOi (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 21 Feb 2023 07:14:38 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5731513A
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 Feb 2023 04:14:12 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id ee7so1234777edb.2
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 Feb 2023 04:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tCnQYkQRNYKhCffGuGJjYkip6x1uFotNA8/ojuqPm4Y=;
        b=kWMUKTQxE8WCBtMcVM5PC58UPKWuxB1Q717bkUpqEjh1mgMw9Nj36qxw2eCgyG4lBW
         /Hs/lBS6xVn77V16xLUGIL9+pwpWJgg7+dst0OUBH5fokHQdpb/cqJ/SOFOGcyyFBGuZ
         yws2bgbnjoHLxSEf2BSR6uIFwSntEvJjodxXJ+Hw9SQDZmUfvzc4G8HJNJtbpI3EyJ+J
         mBDCHil4xHhLrpDCsTTH6GO2K9TV3wJEyOHR6L6DC4IiOIx4jXmtqc+NNxLVr9oSs9cZ
         W5gMc3UdzhZYeCng3tFp2JG6ufrcbOi9jQA8387ULHhVTcETHNJ9VfTfjdqw4k0e5eU7
         x3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCnQYkQRNYKhCffGuGJjYkip6x1uFotNA8/ojuqPm4Y=;
        b=F2LeuHS3OG8PjejId1FR8/j+pg6RPTpYMA3uvqd5bwCfOFsQANYJ0dnCUs5De28Bzk
         aTCyqBEm1fGGwfLauShSmJQQTyA1OGQd4ITvPV9Pnp8lcGb7c2O5zGqBeCRsjxC4TbvA
         hB7eKx/dmRRiXrAV3apXjAHObs3/NUMKloBECl5Ns5M2R3oLSbk+39+e4vwL0YIk59xn
         Ck4839mFbj2Udo0eKS9WwMO8cUMl0vxeiiEA64DyE2yoMGYTeIA8EP5juKj/0uMIss6k
         z24vj3pZunrcHwQa6H3u8hQcYQIFNFyeq15RsSn2CpXqMa80jwtBMxE7WMaysvalWJWL
         yL2Q==
X-Gm-Message-State: AO0yUKWGZcWpEZMJa3FzE9E0evqJHVdS1qUrxujnvolkx/VDkAOCbdGk
        WMZZYJSQ66W0L2qK4uwaDOwpaGE6lqNoJ9A74Q==
X-Google-Smtp-Source: AK7set8SWb2U7nEkpCOS6skd8EDKWmvdFpEgQSjFmKlf4YNype+mAYrWrn66sln06QOMGzYgHAGUcz3c51DJPtl0CP8=
X-Received: by 2002:a17:906:80d7:b0:877:747d:f121 with SMTP id
 a23-20020a17090680d700b00877747df121mr5841124ejx.9.1676981606249; Tue, 21 Feb
 2023 04:13:26 -0800 (PST)
MIME-Version: 1.0
Reply-To: intfund@yandex.com
Sender: michealangle233@gmail.com
Received: by 2002:a17:907:6d89:b0:87b:55cb:ebaf with HTTP; Tue, 21 Feb 2023
 04:13:25 -0800 (PST)
From:   Alyona Degrik <iam1546780@gmail.com>
Date:   Tue, 21 Feb 2023 04:13:25 -0800
X-Google-Sender-Auth: h32A0s7SizqP3EVL66aU5tuDuUU
Message-ID: <CACM6Vsz3Mt8sSgfn=yty_ZY00P3YKc+Ja=3hAoOG6DYEr2gR=Q@mail.gmail.com>
Subject: eu preciso de sua ajuda por favor
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Prezado bom dia,

  Por favor, n=C3=A3o tenha vergonha de contat=C3=A1-lo atrav=C3=A9s deste =
meio;
Peguei seu contato na busca do pessoal do Google e resolvi entrar em
contato com voc=C3=AA devido a situa=C3=A7=C3=A3o em meu pa=C3=ADs ser muit=
o din=C3=A2mica.

  Sou a Sra. Alyona Degrik, de Kiev- (Ucr=C3=A2nia); Eu era o propriet=C3=
=A1rio
e CEO da LEOGAMING, antes da invas=C3=A3o russa do meu pa=C3=ADs. Devido =
=C3=A0
invas=C3=A3o da R=C3=BAssia em meu pa=C3=ADs, a Ucr=C3=A2nia, considero nec=
ess=C3=A1rio
diversificar meu projeto de neg=C3=B3cios em seu pa=C3=ADs para proteger o
futuro de minha fam=C3=ADlia.

Estou em busca de uma pessoa honesta e confi=C3=A1vel que me ajude a
investir meus fundos depositados na Ind=C3=BAstria Imobili=C3=A1ria, Setore=
s
Agr=C3=ADcolas e Ind=C3=BAstria Cosm=C3=A9tica e outros projetos de investi=
mento em
seu pa=C3=ADs. Depois que meu neg=C3=B3cio foi destru=C3=ADdo pelas tropas =
militares
russas, n=C3=A3o h=C3=A1 atividades econ=C3=B4micas significativas acontece=
ndo em meu
pa=C3=ADs.

Estou realmente interessado em fazer um investimento an=C3=B4nimo de Quinze
Milh=C3=B5es de Euros (=E2=82=AC 15.000.000,00 } que depositei em uma empre=
sa
financeira em Berlim, Alemanha com um plano de neg=C3=B3cios muito bom e
confian=C3=A7a porque =C3=A9 o =C3=BAnico dinheiro que resta para mim e min=
ha
fam=C3=ADlia,

Por favor, gostaria de discutir com voc=C3=AA a possibilidade de como
podemos trabalhar juntos como parceiros de neg=C3=B3cios e investir em seu
pa=C3=ADs por meio de sua assist=C3=AAncia, se voc=C3=AA puder me ajudar. P=
or favor,
se voc=C3=AA estiver interessado em fazer parceria comigo, responda com
urg=C3=AAncia para obter mais informa=C3=A7=C3=B5es.

"Com toda a minha sinceridade
Sra. Alyona Degrik.
CEO na LEOGAMING
Com sede em Kiev, Kiev, Ucr=C3=A2nia.
