Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294A45A58E5
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Aug 2022 03:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiH3B34 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 29 Aug 2022 21:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiH3B3z (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 29 Aug 2022 21:29:55 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B0FDF89
        for <linux-bluetooth@vger.kernel.org>; Mon, 29 Aug 2022 18:29:53 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id o123so10095583vsc.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 29 Aug 2022 18:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc;
        bh=9fa1GYV3QmLGctNUAu4175gwHd9ofL8Wt0rZxeMqRd0=;
        b=DCAuQT94j2eTWrIPtF4URYK+HQjgmYqtw2mNgesPUWKjQCfRFVaLfv8YFluZwCtvmF
         YVUhfm77pP8ZqpOWtMbmzHOwbtojTcon9xAN1utjHF/O3kPJPWlQU+smlVkriaAu8C8j
         xHcvm246jOpUbzLk4mkZ1h7UE4gSnDPipbT/Jx7Hi29zD8+I4exSdJelVVnNmSsUXuKZ
         D9SIjasewCWe6dSkLsXFfvwN3EUXDp8gSqP9koB09lvOjFbO4pCU/ZNtLCnbxIn7qbZv
         fgow7NTm/PI0PGX3Ps4J3Ep2NmGtQPLyS+NuWkHzbhFjp17H2s6RJ5fpv8psOiegyaQU
         vkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc;
        bh=9fa1GYV3QmLGctNUAu4175gwHd9ofL8Wt0rZxeMqRd0=;
        b=tUpBJmqKD13nA6S+aKMDnmJc9npwG8avdhf7WOD1PzdnnlgXrLcZ/5Ee4coGRK56la
         wOhPewBu4HW26JHWdoGVaTII//mZPKFuEAvrJ+ndH+j858A/X08HfgPV9Fi8mzrY5Y+9
         BlGCC6DSjJw3R+M0YCeTZX5sRYD4jK3drjX+TlGBl27yZtAdkXhB5InvkKNfsEfEUomJ
         zXHKE62aJPyR7okORCmiHm75z/y0lXNbzeCFzzw7LM27rgRXLr6M/mlIBrZa9XLMZiBM
         VUBXrRemA3dUYYjMO7PIejxq8VrKMpUpcx1bSuZFwOQQCVnI2UmyX28Y/ReV4gYgqakE
         mIXw==
X-Gm-Message-State: ACgBeo0/Zjm2RnNvvTIIJmmD+HNyHwXaO+WLaaShgkrHb1M/mY4rlei0
        s6RSrRQpt7LcOYhpfLZY5TBSkzu2x7VRaaiDlNY=
X-Google-Smtp-Source: AA6agR60/9ca9izACK7ZS/j46lryPMhQsVGz5Z/uGeHoMfCYID1vTQhkhwxDWpQ7b2izjxSo7gWQfksirZYr9ev0QHM=
X-Received: by 2002:a67:d712:0:b0:390:d3b8:3e97 with SMTP id
 p18-20020a67d712000000b00390d3b83e97mr3010406vsj.13.1661822992982; Mon, 29
 Aug 2022 18:29:52 -0700 (PDT)
MIME-Version: 1.0
Sender: hj2294752@gmail.com
Received: by 2002:a05:612c:a88:b0:2da:784e:3b34 with HTTP; Mon, 29 Aug 2022
 18:29:52 -0700 (PDT)
From:   Jessica Daniel <jessicadaniel7833@gmail.com>
Date:   Tue, 30 Aug 2022 01:29:52 +0000
X-Google-Sender-Auth: sQCyVDuTLGXps5HMiRmV12UTrkQ
Message-ID: <CACgdSp4FXGH0T4UL8f7YFUcLiAsiEfJdjtESbUVjg82Luazvgg@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Dear Good Day
Did you receive my mail
??
