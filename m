Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABAFA6D2031
	for <lists+linux-bluetooth@lfdr.de>; Fri, 31 Mar 2023 14:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbjCaM0R (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 31 Mar 2023 08:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbjCaM0Q (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 31 Mar 2023 08:26:16 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D7C01FD31
        for <linux-bluetooth@vger.kernel.org>; Fri, 31 Mar 2023 05:25:59 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id n14so5204769plc.8
        for <linux-bluetooth@vger.kernel.org>; Fri, 31 Mar 2023 05:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680265559;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ps43Ql5Tjnd+rS8BdUE8H1PpwwGazEWm6mc1DzBYYUo=;
        b=A4FBhCYgWwn9FWTMN3XU+qF3OTbptG6BdHPynUBRj/W35LtXwdXJqHI/JxI0/3XQbV
         HXnZr6ps9uyAYuyL9cHKfRuyWK1fDPIIdE+M3Ie6/dTjSdkuTXnZ56r0vt+KOLzR2McV
         xhGSmdqVJoBjagXMJByToj+wSy/ayvTjyKiYFeJ0Cj/Sd6JJiUxBBEWM1yYLrkHT4Sex
         n+u1eHkR6xGgDsE5qmbzTzxEyrT4346i8dFS61/ZO65hqZLG21vR2mLFsnp58f5gWwuN
         0T+sy494k5+ozGcmqMF6ioo4FyewjHctPud39aFQoI/7FR1gbwmvQwJv9QdyGt3AFeql
         PHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680265559;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ps43Ql5Tjnd+rS8BdUE8H1PpwwGazEWm6mc1DzBYYUo=;
        b=clXYp2i05mH38K3ZmiYitcdCoK7KCfF0X6q6pJcscM/PKReRqrJ146aZOMRYV+7Xnh
         UOapKbp/GdO2Y1oFsMU6N2zUiTpsMQnYEhX7Hp7DpXXDM8OIuxjegjx57DHdR5aSWiWR
         948YGmWnDigb+RrlzQs59v2DamfMtcrkbu2LPuEtqHmYwqFdu53iu2k98uftBd4fLc04
         YCXU04S7lJOvxleIrmkMAMyRnV0PLQ+jWgnXFsu/M4+wRnPcUJZAtYVrbtD3iiAo2fTB
         slaLTmUKchISJfOu2z1nFm8gFslOGJs5jT//qqH954m3qdRXPSL2YnSC0jZaUTsp9ZUv
         dgnw==
X-Gm-Message-State: AAQBX9dGtnS8m2iUJdQjMdH/8ySlgv0BbumN3pGl5tqEHw5gkq0COP7N
        AXuYXj/9DqnfzQMrENqk3X0qbTfDvTGx67rvUoo=
X-Google-Smtp-Source: AKy350YGOQxxCWaEzq/wub+2pOtzWTnTSNN/USZkbpmgwdtiHbi0IU7BElxbK/DydffW6P5TvJuOfZyQF2tlkml6/LM=
X-Received: by 2002:a17:90a:fb57:b0:23d:30c2:c5b7 with SMTP id
 iq23-20020a17090afb5700b0023d30c2c5b7mr3206057pjb.3.1680265558970; Fri, 31
 Mar 2023 05:25:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:8c92:b0:474:c743:9f91 with HTTP; Fri, 31 Mar 2023
 05:25:58 -0700 (PDT)
Reply-To: fionahill.2023@outlook.com
From:   Fiona Hill <leea4982@gmail.com>
Date:   Fri, 31 Mar 2023 05:25:58 -0700
Message-ID: <CADa=nC1zAsLJ8hS2vb+bDx30QusG4bVT-9vRnaRKhtgY+j+5qg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Hello did you receive my message?
