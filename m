Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC80B5B439D
	for <lists+linux-bluetooth@lfdr.de>; Sat, 10 Sep 2022 03:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiIJBXc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 9 Sep 2022 21:23:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiIJBXb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 9 Sep 2022 21:23:31 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F7B103010
        for <linux-bluetooth@vger.kernel.org>; Fri,  9 Sep 2022 18:23:29 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id d2so5863471wrn.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 09 Sep 2022 18:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=B/bzVap7w2nbpPLUVaGrgo7Id2TJpqaHDpbbBhcEalA=;
        b=Hs3Ce5iW8U7LZjX2ZUiQfhjvge1bOEh6ZRRlcrM27kn4dIK4mA2qE8uPSMJF9zfHKa
         08jZDQiXrFjJyTl6YShL4ceGtXpweP/Gvi7qAjz89sBxgPlISM6IGmrX5NCIVOh2BE+Q
         FJWNde6Xp4QVjpMJQoPhFR3c9tsKenlu/0VMsP0USQ0c9zRMsC6pWh+Xv9gUlRA4AV2a
         VcbFTj4mtD+DnK06ueRY8H/qaY0T7UeZunrtalT7mwc3LtE4dO5pwV4OfxlZUBnYBmpO
         1MoMmhWtKunqA5mRWGEMBjsnqwO6Q1uru6+4VgE438sREp+On/B6BkOr/dF0+bporGxQ
         vQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=B/bzVap7w2nbpPLUVaGrgo7Id2TJpqaHDpbbBhcEalA=;
        b=Lk5igYB20EGXPGRoNv0b3mLzcuIiMz0e89xKUjx/8Yme82MothOlOKi1fsfQiNwOYX
         qoXeuae/UZ5kS3v1ZOcEQVm/38R791AWwi47TVWkLqAoeKiW6DVA/cUVcY2yTeu62sg1
         i6Z4qoAjeC2Q0nSrlfaLm/rRmCyMpIi2udCXvFF/Pr+gPrgFrMBqKgCrLfgW159ZR0jo
         28XYb8jVkvZuGDYeRvoScQQuihX6n1vCyt7mPW/6UyO0CvI1Q1rxQiGIHe3cwt2q+UDu
         CX8uBdx+ak/HI1/GvbDuIqZfgxrAzXIIxq9Ng/2BJo5NdzNbhBfiuZQ7V54fIEwycvRP
         px5A==
X-Gm-Message-State: ACgBeo2LW+8mt7toIpTm7FcmkVVIh5h07eYAqSiVghqmJPLHLhJShAdB
        qOcBJHVqX6LwFBVozjyXAeLG8Xha2Gi8MhaI5i4=
X-Google-Smtp-Source: AA6agR74JFkcY/V+733yYxAM/23DDVD/Z6CL39jEiHoY+xLoHuu9qSUtXMHYSDShOkYW9NF9OoBS9ACaB7eCx/bk1qE=
X-Received: by 2002:adf:dfcd:0:b0:228:d923:873a with SMTP id
 q13-20020adfdfcd000000b00228d923873amr9618132wrn.256.1662773008415; Fri, 09
 Sep 2022 18:23:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:e914:0:0:0:0:0 with HTTP; Fri, 9 Sep 2022 18:23:27 -0700 (PDT)
Reply-To: daviesmarian100@gmail.com
From:   Marian <kl576521@gmail.com>
Date:   Sat, 10 Sep 2022 01:23:27 +0000
Message-ID: <CAN2bDzk8Am8Sj9gdjCgpMMJ8Ryb=Eervq2nz5XT7ybob6Dy1=A@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4905]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [kl576521[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kl576521[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [daviesmarian100[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:434 listed in]
        [list.dnswl.org]
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Hello
