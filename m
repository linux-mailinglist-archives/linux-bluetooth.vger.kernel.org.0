Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF3B661E2D
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Jan 2023 06:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233187AbjAIFKZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 9 Jan 2023 00:10:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234293AbjAIFKL (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 9 Jan 2023 00:10:11 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE23B7DC
        for <linux-bluetooth@vger.kernel.org>; Sun,  8 Jan 2023 21:10:09 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id hw16so5416373ejc.10
        for <linux-bluetooth@vger.kernel.org>; Sun, 08 Jan 2023 21:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RGBJdUhLvGpLg0IkWbTVUsItZJ0ILG7BPRGCq35WdVY=;
        b=Hoc7qR+G5157JnkLphyqSsgKG3SBw3j2L7MDSslBX07alOvk29+yZKdUcYHnwxzPRg
         CfQVFPx5j+728PfjQknqOQpNrHDIaZduvH/0jl+z968tdbmNS3wNBJskrCUpLgM1S1CN
         P+iMBVd3zXXssAfz/zoNMukUTGbAypH1q7djrKaM8pNEnX7M4ou6QkC7VvdNuEaK1nPg
         yYe+sFSNuLDhRb5K4h9LYxOHXj0bVC/3GM0p6GzKJs1N4/aLhFf/8VzVfLtWgippVzDO
         t4vmptbnrPPpW8Gc+OqtT/nXwagoLTWyJDdLFvkE0qBnox6/x/gwh+/9AhR9wn/hIv5t
         WH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RGBJdUhLvGpLg0IkWbTVUsItZJ0ILG7BPRGCq35WdVY=;
        b=ZUJwoRzMjUHnLsBzhIFKc8JwJDeIUHRAoi5COIl/R7/TPJle+e9xxUetJ1HNY1whDX
         9c/dCiSJ/Qt6og68nsxbAj0I8njJKLPni7RV4qF4RvcjX7He5tYUA5fD6L2qLKSiMKPH
         UuQKqG5oXcBi3FCO2uLYzwe1BTwFvERbEcL9/INudgr0f09gecgifJL3NudqbD2fSENR
         7+cXAaVkLasln4o0gDtlZR7kECV9vh28Poe4/yZmcvZ/a2QLyuIvKBqu2BM+gXmeEf+X
         ov2tFmlE8Q8HITGDqXBw4FY8mp5sNPLZaMiUcA8vMioYW4vg9boaMGLW74DQsrO8zMlh
         yyWg==
X-Gm-Message-State: AFqh2kp28CoJXQkqiA8qZgsOCQZkHYLeYH8/y18TOB8m7PQrDiHm+YtZ
        28/+9EzgWk3cHhH5AmSiwFNt6xjoLJNB74hA81Y=
X-Google-Smtp-Source: AMrXdXs3/YXtukhYemXtvDboD2xTTQzaCcs9RLpFNwo7LX+ahiV/YO1WuKqIoCIni/FzUrrDjIlPMHG301+F5E/oNTc=
X-Received: by 2002:a17:906:a383:b0:840:2076:5310 with SMTP id
 k3-20020a170906a38300b0084020765310mr5252005ejz.371.1673241007691; Sun, 08
 Jan 2023 21:10:07 -0800 (PST)
MIME-Version: 1.0
Sender: oldchickenmarket1086@gmail.com
Received: by 2002:a54:258e:0:b0:1eb:b6fd:1153 with HTTP; Sun, 8 Jan 2023
 21:10:06 -0800 (PST)
From:   TOM HUDDLESTON <tomhuddleston1jr@gmail.com>
Date:   Mon, 9 Jan 2023 08:10:06 +0300
X-Google-Sender-Auth: hDg8YnqlkcOz2Zc-iohFpfvph0g
Message-ID: <CAH-Vbumh2qKqQqAJjU2fHHvaV-GhRk-GHkDkzjatf_WYP78YNg@mail.gmail.com>
Subject: Ich habe Ihnen bis zu 3 E-Mails gesendet
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--=20
Ich habe Ihnen 3 E-Mails bez=C3=BCglich Ihrer Spende gesendet, aber keine
Antwort. Bitte melden Sie sich mit Ihrem vollst=C3=A4ndigen Namen und Ihrer
WhatsApp-Nummer bei mir, um dieses Geld an Sie weiterzuleiten.

Ignorieren Sie diese Nachricht nicht, wenn Sie sie in Ihrem Spam oder
Posteingang finden

Gr=C3=BC=C3=9Fe
Tom Huddleston
