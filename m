Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75BB25344F2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 May 2022 22:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345047AbiEYUet (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 May 2022 16:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345007AbiEYUeq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 May 2022 16:34:46 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43255002E
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 May 2022 13:34:45 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id fd25so28477010edb.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 May 2022 13:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=jF4MxsPSKKSAh34A0y7fWqFeFSCCDQ9NCjS0um7aELU=;
        b=X68Cxn2843PB9I6d9pEa//pNxYvS2bcenMq2Wr8/xkEc/D19YSwetEmEiLt2Z+fnaE
         ktsznLsw7E6gqu9puvW0Kpz9Yb8/GtQkFA7fqyH+i+HuX3ImqoXR2t+0u9S/on9hN3wk
         D17cKGIXkXYqDpvSn0j/osag9Vy0qeGjLaX4TDTTm97JVr34prF3OJYZlut5oW734iYe
         w+sxtenJU6uN0ftblF0Me7WFvPiW3xb0a8it4/d47ALOabGsZeM/R7zoiRSfVu39jwed
         BcJ0hFZhd8/JMA2JxNhwfJXLCykvQeXJXdgc03R522fWldVj6oKBrs6mqaJmEQiDPKqh
         CfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=jF4MxsPSKKSAh34A0y7fWqFeFSCCDQ9NCjS0um7aELU=;
        b=s7O383dwoMbTN6l+HMNPPPvxlZOt50v5urLYBOXhSzdnt21jmhGYSRNFL1V7O/iK5S
         P3t80zEHISW7FBqTYy2mF7wVbDokElIkeda/01bdRpz2Y0l6iHm0flcjkDIYMk9QeyVS
         AcHLDJDdyoq2YciJFXbR0kwU/pP5E1MuIal2pAwNgNpnH8stDQoIo8Zd5NGFuGrZTbCH
         HNpFYdO7Ubh22Fv2n2Lq8qYm3t7yUb4cWW12KrHxF5dcIHKCpxf0BTQw/q1APPDg9odU
         YHEhUXlMYViR5LMqB5QDNHoP2h8Mi5Si+rh5FcvwSrs144XBTMNIVzgSWGOVBkt3lGDh
         u3/Q==
X-Gm-Message-State: AOAM533aQT6K6hUs8f3Drf1phzsBFdt/2xOu97eTj/yW/DbhmT0obCmi
        hUSm7P8Z9ud0M16CCnmczCocXlD2nsPRM/B7t9o=
X-Google-Smtp-Source: ABdhPJzUDEuYqL7ON/c0SPYJZJCZo4/uD1jSGFAq+sgUdW91X9rtL+ujOPt9rPwAxk4W2oKAmyRYOSNXGPIWaHvpfuU=
X-Received: by 2002:aa7:c595:0:b0:42a:b571:2726 with SMTP id
 g21-20020aa7c595000000b0042ab5712726mr36972401edq.48.1653510884419; Wed, 25
 May 2022 13:34:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab4:a26b:0:0:0:0:0 with HTTP; Wed, 25 May 2022 13:34:44
 -0700 (PDT)
From:   Luisa Donstin <luisadonstin@gmail.com>
Date:   Wed, 25 May 2022 22:34:44 +0200
Message-ID: <CA+QBM2pnyDzoMp_ifXdVwW7YHONbjVkYF-3v95votVVMsK+E9A@mail.gmail.com>
Subject: Bitte kontaktaufnahme Erforderlich !!! Please Contact Required !!!
To:     contact@firstdiamondbk.com
Cc:     info@firstdiamondbk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Guten Tag,

Ich habe mich nur gefragt, ob Sie meine vorherige E-Mail bekommen

haben ?

Ich habe versucht, Sie per E-Mail zu erreichen.

Kommen Sie bitte schnell zu mir zur=C3=BCck, es ist sehr wichtig.

Danke

Luisa Donstin

luisadonstin@gmail.com









----------------------------------




Good Afternoon,

I was just wondering if you got my Previous E-mail
have ?

I tried to reach you by E-mail.

Please come back to me quickly, it is very Important.

Thanks

Luisa Donstin

luisadonstin@gmail.com
