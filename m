Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC9D654C559
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Jun 2022 12:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344854AbiFOKDu (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Jun 2022 06:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343985AbiFOKDt (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Jun 2022 06:03:49 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687EF35869
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Jun 2022 03:03:48 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a29so18129059lfk.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Jun 2022 03:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=F6Txoo1eGLlBur0lbXNXpieHqi5w3yUW1vOTMbpFB5g=;
        b=og9LG/+pniXhQsgJ/oYmhLAjxU/HbgdTCMahNAIKYiEYT95mLwuF83DPhSz3+W2iSq
         ecnLrxMH4Dh+8oJofwFHtctmZiVtoIe84b0rI7mQ3UFxD8xxCm64MIAFr5iucD2SeaE1
         MoFGVWwNiyUUdrC4KXYKz7QdRlJGST2Pc/z2uWCwsChJJSfoK30X09O/4ck0MMqWjeZK
         uW3yR3L+CvSTnX2DL+3jv4O1GkoeaF1eAv4C5/apSuyfJXI38+TYTgKHwnSDJzuDqViX
         WK8J9AiyOxcYoCQzawtXJ28if/2AFEnINTa1djxKGVQUOWXpVmMYL7ZjcoUCVUkR9mWt
         JUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=F6Txoo1eGLlBur0lbXNXpieHqi5w3yUW1vOTMbpFB5g=;
        b=Jrvr8o9oAfpdd3MzQWousIPD4qi9bvTWwW+caWubWFlmIzzUnH6dyPOs6ye50IpA0E
         75UgSovehjiXli41Dh4LQWYWSBW+mM2fDZ8SHXxau6gDycYED6eOLF/ClZInIY+alNwI
         4h3GskV7All1KNEo7G43BdexhhktMBQH7IvtpK5ZrHVL8DamGmqAtgunDeDHNCDU78Up
         qmGINaBz4TbFLuXKsWv/B5aVxUhTN9xtcbkwu7x9tNfSwJ+i34f4gr8d+pwUEY5MOX39
         hgwSoIZdduisTaF1QoAH0HQ+wPwt/CnZjFIA0wXxExsOCqEqXytTBIreNUPFqKHP9f0v
         YMyQ==
X-Gm-Message-State: AJIora+pnhoYVlbrRrFSstNFRSZzo6WhwjztfKllZI6P6H5EiMxk8LGK
        V3VwJgkhWxNwzCesjr9/RyMg62vnj4NZVCfDaA4=
X-Google-Smtp-Source: AGRyM1sjQtreltdFKA5w//he8nGcQtD3JA5opensvW9ATnCQ7qOKSZBbWHEHE8iqHCAQ7uaatF15RbF95zqLVNt+VLA=
X-Received: by 2002:a05:6512:c07:b0:479:2e0f:9a06 with SMTP id
 z7-20020a0565120c0700b004792e0f9a06mr5618386lfu.687.1655287426593; Wed, 15
 Jun 2022 03:03:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:5d0f:0:0:0:0:0 with HTTP; Wed, 15 Jun 2022 03:03:45
 -0700 (PDT)
Reply-To: tescobank093.de@gmail.com
From:   Tesco Bank <ahmadg66334@gmail.com>
Date:   Wed, 15 Jun 2022 11:03:45 +0100
Message-ID: <CAPg_g08ehQAhS4a=2pfQZv=0=bayeQZAoFXnxjpPD3_6CRVf5Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--=20
Ben=C3=B6tigen Sie heute dringend einen Kredit, um eine Investition zu
t=C3=A4tigen? Ein neues Unternehmen gr=C3=BCnden oder Rechnungen bezahlen? =
Und
uns auf Wunsch in Raten zur=C3=BCckzahlen? Wir bieten Kredite zu einem sehr
niedrigen Zinssatz von 2% an. Wie viel Kredit m=C3=B6chten Sie ???
