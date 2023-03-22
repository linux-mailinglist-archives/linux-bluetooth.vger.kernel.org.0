Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37C66C5042
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Mar 2023 17:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjCVQLj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Mar 2023 12:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbjCVQLh (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Mar 2023 12:11:37 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F548423A
        for <linux-bluetooth@vger.kernel.org>; Wed, 22 Mar 2023 09:11:34 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-17aaa51a911so19925677fac.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 22 Mar 2023 09:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679501494;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZeK4ZJ1o6tGrUVsDjmi+mms9O6S9hGyBZoeD/hC1EM=;
        b=NXFTHcYwYADJqgS9gOgCNhCnYNabhiSmL8dvut82eS/gMAzpicRmLjw6UGpsEVsbTq
         pf9FTZBXEJJBtAIXj4K6lLl7xwL3+O+yHiIF/AOgTXkIBR89DrtGHMoGmbz8dVDj8J5C
         3+boSaQY+rBrjElzkHBIjs8nD3dz4ShqsU0sL1MEKUVn4caqnWYi6XIKEaEz37MgzY9J
         my9Eq7IniLZcsDSuqejAE6w8onfNdSmTBWOIih4lo+JfEdVg7GYCtXdzJG21TW2yxIUU
         17i4SXcx9bj8mxFF0DAMHvKHwA6P43jnq4jTJLd4RGTBI/RHfhPcrlCWr43oOB1xFUOE
         1vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679501494;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZeK4ZJ1o6tGrUVsDjmi+mms9O6S9hGyBZoeD/hC1EM=;
        b=pLK1f0/Tl67SploLppQMt9PguDuI6YCcPR8HQwIR+0gZnTOLbHZIjcKa7IGknct37T
         ufssJevZYLCDMtY0KUGJXz5UVAJGJLGvArakO/0Zof5370dKKoSGit7qYL5DPWSgXOBm
         HMDfTUKEQkboiucOKs2pIXj+s+5ErNK0vujnF86GyuFD3aksFyELHC+T9sRRDCvLHuxO
         RN100VwwM2HfxEsa1Ho342nidtU6qsmyqvlsyGojQjq8Z4VJxlUmvQfjvCqQbOTsdtrL
         GD4kzgvjY7wI+GB5hpKP+4Q6himUU62za49nYA3D+PiDiyaLl59uUkdmZxzF59VSDBtz
         pDBw==
X-Gm-Message-State: AAQBX9ePmwJQYosyQz339+XTsc73RqYbHyaXHU/qqaJqVWdG4/EVaO/j
        q0XbWmk14pUKbimcINyal1zFCyWaKYAEurwM6/I=
X-Google-Smtp-Source: AKy350b5tkur1ft23P/OlJ5ywmhqTOYOaZDmi5t20o5UuPPda+LgxmHtw6qCtVNtcUa9h3kQf0zbc2QyYQSRkabSHuA=
X-Received: by 2002:a05:6870:b015:b0:172:7220:6905 with SMTP id
 y21-20020a056870b01500b0017272206905mr108144oae.0.1679501493844; Wed, 22 Mar
 2023 09:11:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:3d45:b0:111:8854:d0e7 with HTTP; Wed, 22 Mar 2023
 09:11:33 -0700 (PDT)
Reply-To: fionahill.2023@outlook.com
From:   Fion Hill <youngm8819@gmail.com>
Date:   Wed, 22 Mar 2023 09:11:33 -0700
Message-ID: <CAKE2LTYy-xKA4gwpCryYS9AN0TFNgQ6sTv_bNs8x-0zs3Dguwg@mail.gmail.com>
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
Hello friend did you receive my message i send to you? please get back to me
