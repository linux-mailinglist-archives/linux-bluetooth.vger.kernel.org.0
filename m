Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C956462995E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Nov 2022 13:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238291AbiKOMy4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 15 Nov 2022 07:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238372AbiKOMyj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 15 Nov 2022 07:54:39 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A752A40C
        for <linux-bluetooth@vger.kernel.org>; Tue, 15 Nov 2022 04:54:35 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id s8so7120851lfc.8
        for <linux-bluetooth@vger.kernel.org>; Tue, 15 Nov 2022 04:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YzgGX4AwSt860hhHaRgKsA8hx2m0I67dk0IZRTCbtjk=;
        b=R8/6l9mT5f9SQKdT4cGWJYnkxRRFSJIQsac5Qvn42TiX+UBSx9eCPJZ3jZd6u66PdA
         PSFug2HsL+3Ti2E6ocDEk4SLoXilpYapKrU6wrTrqbtCTXUFoARgiWM75Rnzl/vEfLBP
         42Yec1hOlAqhu7wO34koxxdBvWmOoojTjW3nlRemEwCYbwi7zV6b0UCZByuu4Uxf+vkr
         dMfHvUGoNNu/+dGwPZABibgi+qUcKB5ULOefeZAPVm3bBmbMefnj9XQld+KTUd2exy6o
         q2BReSNG2xuu1v9YMwsUVgk8NryOBjThVIlXf/S9XWr0LacvcoUvI3ysG56l9twoufmk
         Wbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzgGX4AwSt860hhHaRgKsA8hx2m0I67dk0IZRTCbtjk=;
        b=aEdSytr8jE1L6Q1fNqdqD2PGVs4EO8WrMm2EeW4zxKkBXA3vgOuOtuCkUpds+2OpXN
         8PjUPhWoNWJ9sVmNkcWbzpBe0JFNtGsSaqdjYmgaVInT13Hqju/1q3hZeeV2WWXCUCZp
         pUn29OyXcKIq4Gnd6OXL7lGqohv+lr8dcxqECIubL/2jZZqGX2TBbPo+dGjEZ4h/CK1O
         oOtxIJN+0H8uM4JXVxnrgUYg5qpDABy9UJVcAghPEgaaZpSe/WWF/au/zgBcLnbdDepJ
         td5NYHXKpPUQgapAWlHv++XWXlAjR414kgD7aNF0iekNMruPU+9btJ+pznFzGcEBQZEp
         q+EA==
X-Gm-Message-State: ANoB5plcJpa0fYEbSsKC7CTTy4PMA+Y2u+Rl+36H8XHBOd48FhcM6gYs
        No2S4lYVguFBrcMJwA+eVlL+xNibXmT0HICnnCA=
X-Google-Smtp-Source: AA0mqf7FJHS2VmM4ADmGTYikGT9okn9eTzzzSd7ZU4PN2Ysqrqe5DNP5Gsd91TQTePyCOx4n/Bn7TDVSd+IfgXUXLEg=
X-Received: by 2002:a19:6d02:0:b0:4ab:5d1f:9325 with SMTP id
 i2-20020a196d02000000b004ab5d1f9325mr5665131lfc.438.1668516874151; Tue, 15
 Nov 2022 04:54:34 -0800 (PST)
MIME-Version: 1.0
Sender: moneyman235472@gmail.com
Received: by 2002:aa6:c0c8:0:b0:1f8:fcd4:1daa with HTTP; Tue, 15 Nov 2022
 04:54:33 -0800 (PST)
From:   Richard Wahl <richardwahlii18@gmail.com>
Date:   Tue, 15 Nov 2022 12:54:33 +0000
X-Google-Sender-Auth: vLFsAJjBzwYQdUhfNh6gVj8xfzI
Message-ID: <CAE4rAXH_9mOi4fHFs5JWBJbbTbqYv3GSot1wnbuso_+dR66nNQ@mail.gmail.com>
Subject: =?UTF-8?Q?Sie_haben_eine_Spende_von_=E2=82=AC_1=2E200=2E000=2C00?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--=20
Hallo. Ihre E-Mail wurde f=C3=BCr eine Spende in einer bestimmten H=C3=B6he
vergeben. Antworten Sie mit Ihrem Namen und Ihrer Adresse,
Telefonnummer, um Ihnen dieses Geld zukommen zu lassen.

 Ignorieren Sie diese Nachricht nicht, da sie direkt an Sie gerichtet ist.

Rigards
Richard Wahl
