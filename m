Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E00A51586C
	for <lists+linux-bluetooth@lfdr.de>; Sat, 30 Apr 2022 00:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239832AbiD2WeO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 29 Apr 2022 18:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236164AbiD2WeN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 29 Apr 2022 18:34:13 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA661193F3
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 Apr 2022 15:30:52 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id w1so16377519lfa.4
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 Apr 2022 15:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Z+pyFNU6snjMjw/FLYMKI3q/g7XbJ3oZ/ZJDrSwFDYI=;
        b=fyC4aYbhWgJs8bsQHmEuHlJJ5F5J8WuAZdshM91UGOIZHAckYqgEMWZ+h0kozCw+xZ
         DRbwoWIn36lPPkp64JSEisW4MMZzE+M+Hka2o/qcJgObYVIXhkJOR3KIBE+0pkftzsQ3
         bUqOVsiDDFv1LMPr43gyADQHfvvUb0sxC/jLLwjYeTWMuioZNyKXiKzZkjoinozyZ7I2
         Q5goKtdCw+OPdZF9K88jMtQvmLtR6HBvgd5Po7EoBkyLhChdCvmzdjSr63G1DG7hGo4h
         EkxOuF19fU1f35v3keJV2Ry75WrQXhzVijYMBzJvHg9G9wRGo8F9BM6Dmpb8lYehk/O8
         V+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Z+pyFNU6snjMjw/FLYMKI3q/g7XbJ3oZ/ZJDrSwFDYI=;
        b=n1VsUJNna6KVHB7MhzewKV5Oj/FSDFTnoW+TJT5I24zGoKRVW4HwasnO5JxFwTT7xa
         f/5Z4Pf3GgXBOKiZ3VLoHC9x/ppHlsMOh9KTIw0DvrzRHs+ViJMC3mXDNXKupw4dubIf
         ViJ1VaqEIYNNvfFrqMq5G5wBhjXygUbNG356uWMU3nFgj8qJTIGqfV73juGn5xThvrpf
         DiW3rWCRwNeJ7Ww+AzlmVmJCnO+Fd5Y1zZrJmQ/CI5uj3YRMPVYOwy06+Grb8qv8izwC
         ub61O6VutiJSxc3iZEqejpoXShy3s4o1G8Sq4NgRurJcuhg+qUN0QH3kzrCC7o73A6O8
         2kfA==
X-Gm-Message-State: AOAM532OBHQIPjyW6uHRis1cWZWyZ0/1Ac8ALxsu2zzsWWK4vx5NgLxN
        dZWm31GAcsN6i2c5RJb4bB9VH9NQa+6GCXtczyQ=
X-Google-Smtp-Source: ABdhPJw/o5NJExs75doeTHZXhpgZ/vxt8z8k/mMsYhojNmVLD7jkJLmPU1FiuA1co2tsRYWHvFt6yXLs4vsjA4jgNqw=
X-Received: by 2002:a19:8c13:0:b0:472:1237:c04f with SMTP id
 o19-20020a198c13000000b004721237c04fmr998246lfd.97.1651271451248; Fri, 29 Apr
 2022 15:30:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9e0c:0:0:0:0:0 with HTTP; Fri, 29 Apr 2022 15:30:50
 -0700 (PDT)
Reply-To: illuminatiworld152@gmail.com
From:   illuminati <goodengineer592@gmail.com>
Date:   Fri, 29 Apr 2022 23:30:50 +0100
Message-ID: <CAC3UrrnihBcrvgRFRifvcOrxRsSDAB9RMk22hFxKT+CSF3bp3Q@mail.gmail.com>
Subject: RE
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
        *      [2a00:1450:4864:20:0:0:0:131 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [goodengineer592[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [goodengineer592[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [illuminatiworld152[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
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
Gr=C3=BC=C3=9Fe! Willkommen in der Illuminati-Welt. Die Armen, Bed=C3=BCrft=
igen und
Talentierten ins Rampenlicht von Ruhm und Reichtum bringen. Holen Sie
sich Geld, Ruhm, Macht, grenzenlosen Reichtum und Sicherheit. Erhalten
Sie Anerkennung in Wirtschaft oder Politik. Steigen Sie bei allem, was
Sie tun, an die Spitze und seien Sie geistig und k=C3=B6rperlich gesch=C3=
=BCtzt!
All dies werden Sie im Handumdrehen erreichen, wenn Sie in das GREAT
ILLUMINATI EMPIRE eingeweiht werden, werden Sie zahlreiche Vorteile
haben.
Wird dieses Angebot angenommen? F=C3=BCr weitere Informationen antworten
Sie bitte auf diese E-Mail: illuminatiworld152@gmail.com oder WhatsApp
the Grandmaster mit +13159682193
