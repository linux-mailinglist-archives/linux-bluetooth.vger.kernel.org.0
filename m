Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C72426277D6
	for <lists+linux-bluetooth@lfdr.de>; Mon, 14 Nov 2022 09:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236555AbiKNIgV (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 14 Nov 2022 03:36:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236544AbiKNIgS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 14 Nov 2022 03:36:18 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DD01BEBE
        for <linux-bluetooth@vger.kernel.org>; Mon, 14 Nov 2022 00:36:17 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id l11so16198032edb.4
        for <linux-bluetooth@vger.kernel.org>; Mon, 14 Nov 2022 00:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0+TUOsPnDycx17yT5y3SaYxN2lSmtxkJKGL2zeQTOy8=;
        b=lpuEL0SAdbfl2l2hHzmR7EhnvUkZaff4nN8LofP56JdlJcqr63Fb/EIuxWu8NN8dki
         FqVM/8iNc/s8ckD16OzQIx7FZC759SP6Ry82AmdATEJwCfvEg2d65U4Ibe8Pe95b6eBq
         1BBCN1FKo+G4DnBkambEh/4KE30Xsyo0Vx6YZ0Lv0ll1A7bLEF1ZgD70XIoQx16rB9el
         y5mU+N8vzIAs4tr5CpuNiAYgKJ6tJc/3595jDl+2jNC//ijIk/BqIOb0R19tptF1G1cs
         nczHCdPeSDwk/P4gj4gy/1ZWB0X+pMty5zAa93oEpkCD5ZeJ5L5QQmAI/3OZChRuguuu
         wZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+TUOsPnDycx17yT5y3SaYxN2lSmtxkJKGL2zeQTOy8=;
        b=bj7u7L2zawvbsDyLr5PSqUnwnJXS6yyhpx/mReMxvOn2MBsvBb4OcrCFwByDD8frxB
         7HiXeQW97f4Zp/1YPppCslvqgmg55rjjAZWmtDZOP19o9fSWR90tcK5I/8g4YYSrm8dW
         g/qPbkpLoRtkUI0J01uB3hyFtqE5c3ZRSqUPz6txvcykxRxzJ5aWreofen0u8Ie7RK3n
         4t2StOPchwFLqrxx12lO2C6H6x/M2ij7aAwEgdc+ZZnoVfIAbg0W4VaYgw7ZRVU7hIFN
         ZqGq00JdXIhaRwOd8N1vRm6PLEJnVSy4n4r/AoiAZzLFXXbcrAZZPJNO6vidpstMBBkS
         MqiA==
X-Gm-Message-State: ANoB5pk0r6I55wJ/UJJQqU0tzSe9iZj45MsiUJGFbAS8RGv1qtmHWniD
        Aim16RzPnjlT7pj26z/1nlJ+x0j0EvpIhUonJho=
X-Google-Smtp-Source: AA0mqf4KUdmGdkoKfAyxrR3HKUh0H6CVeftR9AXwzwnON7Jor2j79oIC2G5lbeqstZu9eo0U+OADkYv04RPOUOj+HdI=
X-Received: by 2002:aa7:ccd5:0:b0:458:211d:cbe4 with SMTP id
 y21-20020aa7ccd5000000b00458211dcbe4mr10517218edt.11.1668414975425; Mon, 14
 Nov 2022 00:36:15 -0800 (PST)
MIME-Version: 1.0
Sender: janewangeci1963@gmail.com
Received: by 2002:a05:640c:1cc9:b0:183:f138:b354 with HTTP; Mon, 14 Nov 2022
 00:36:14 -0800 (PST)
From:   Richard Wahl <richardwahls16@gmail.com>
Date:   Mon, 14 Nov 2022 00:36:14 -0800
X-Google-Sender-Auth: Xr9srnlhSGRAHA1E_rtdr5q1cCw
Message-ID: <CAJ7zPRC0EVeoYA8SbPtovuvU7zJ1mkERZY4hEXeVP_fTMRB9=Q@mail.gmail.com>
Subject: 1.200.000 Euro werden Ihnen zugesprochen
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--=20
Gute Nachrichten,

Es wird erwartet, dass Sie Ihren Preis in K=C3=BCrze einl=C3=B6sen. Ich bin
"Herr Richard Wahl". Ich habe in der Power Ball-Lotterie ein Verm=C3=B6gen
gewonnen und spende einen Teil davon an zehn
Wohlt=C3=A4tigkeitsorganisationen und zehn gl=C3=BCckliche Menschen. Zum Gl=
=C3=BCck
stehen Sie auf meiner Liste, um dieses freiwillige Spendenangebot zu
erhalten. Antworten Sie jetzt f=C3=BCr weitere Informationen
