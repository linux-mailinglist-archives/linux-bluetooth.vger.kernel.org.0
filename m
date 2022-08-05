Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7E3758AA3E
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Aug 2022 13:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240603AbiHELkj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 5 Aug 2022 07:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240622AbiHELki (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 5 Aug 2022 07:40:38 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D57613E15
        for <linux-bluetooth@vger.kernel.org>; Fri,  5 Aug 2022 04:40:37 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id c24so4500273ejd.11
        for <linux-bluetooth@vger.kernel.org>; Fri, 05 Aug 2022 04:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=pSKuz9BJS/Qwel4yBJUKsJP++c1z8gtIosTtEbMtN5I=;
        b=hYJJ9KY/aPObD+f4j6RTVwGsV8TvRxE67wdZ2GU15G6b1rt/IEJKmTSVxoDvDZhPqW
         SQqzvKQNSvW1Fes+bgY4Vorrgd97I0bBiI+hGqogHii7+kAu5xiCursRhnFeOBDqJwZl
         IjXC547LaDvuO0DgN6dfrWO7wgv1Jv+uPxrIzXfbNFBpD2ZNTn4xBcuqKeFHL7teRKiA
         T7SNxRi31hixwkxIOSanO+aQdjrjr060/rRRr6uWxh85d9nuYOsKcKMrZ1s4JHjct2rc
         rp/NrzpgDq7lrWz3NvVrjzoFACi1iUIN8x8pE69Ru9uTKqBpIuGqQr+zoV9xx1dhqoXV
         WEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=pSKuz9BJS/Qwel4yBJUKsJP++c1z8gtIosTtEbMtN5I=;
        b=l5UfNUUN4TuynVgxM9ue5arQk83bHQUkVUxLAWhCqKaV+9VVAUX+6UrGUDhWwBypef
         vWtyPXQB2n52h6QoFEuIr7yZQq2H4oLoQmAGcP20+qsmqN6M2xQ6a56UHRnuwODVHtbM
         Ac3TzIVNDgeGbAujvOPHlmsgzRXxf+F3k6QDl0CKuswjZXRMqxsKlsNca9AxBgzeLl1t
         7S2l63bzwnCthgLXudtEPD9lpt531cPn1I65F//3SbpD89ldEDeDriX4l1C8K5aFF3pV
         PtE3hrIAO4KuIgotoA03LRUFGi8XhjeZTU1KW6tJrfZ5QlXA2N76+VNxbbyP1jcXJ6gu
         JWXA==
X-Gm-Message-State: ACgBeo2iJlmBRlMsbi+i7J2/95yFs6+ibUC0WRC6xICgoIURSJ6SnnGP
        Rlc/CcVp+a9xbBO9xPPV35JsROUCG+BqVywFHAA=
X-Google-Smtp-Source: AA6agR4chJCd9Vv9V1RxNQd0aHRZ5dIIxA6DZRIfB+5HQp0WbIrTAi6nmhgL6Pf89IVX1Xg+aw77OtoMcR3ARyqgFCI=
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr5030681ejc.64.1659699635819; Fri, 05
 Aug 2022 04:40:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:209b:b0:20:9820:bb64 with HTTP; Fri, 5 Aug 2022
 04:40:34 -0700 (PDT)
Reply-To: davidnelson7702626@gmail.com
From:   Alio Baare <aliobaare1990@gmail.com>
Date:   Fri, 5 Aug 2022 12:40:34 +0100
Message-ID: <CAEqq5Sv6gJGqVsdhZn-hp6kP3zFxbNLA_TXUeyk9DHYQtgEvhA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5003]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [aliobaare1990[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [aliobaare1990[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [davidnelson7702626[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello friend, I want to send money to you to enable me invest in your
country get back to me if you are interested.
