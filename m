Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2A635EA714
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Sep 2022 15:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233535AbiIZN0I (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 26 Sep 2022 09:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234222AbiIZNZV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 26 Sep 2022 09:25:21 -0400
Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB17753A2
        for <linux-bluetooth@vger.kernel.org>; Mon, 26 Sep 2022 04:50:43 -0700 (PDT)
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-3450a7358baso65185117b3.13
        for <linux-bluetooth@vger.kernel.org>; Mon, 26 Sep 2022 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=YeEFrOpnueqp49lpSsCtkyhW66cD5QzqZPU5hyS5TkM=;
        b=gxgPYqMBX0nR+iKzUnNtpUSOBn8ieFDaTHmmheEPHIGEphmDuiwhI9fI6GnfzWZmif
         BXa+ygt661myWUlb3quBsgw2PxVOAPvU6M9aGpP7M8CX8K1q5rN8lEIO3gt+xFqfIA3V
         FnqD99r3Hw8/UUzO7dgAD3AGXYskn73CY07UBp4BPr/s0v9+eJ9oyikOg0xDacTnJagO
         WoE8wi6Dp4c7Q4zhTTpS0jhmFENtJUB7lV7B5gqzQeJQs3fX5EBBLQWWdzSiCTUnvM7d
         7iNOvTgPe2xqw8lcZTwSUwwvHqvOUCljJ+pLCWd6qilRCbjIWN1DlBrBhzM5ZvmUg9Pm
         P6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YeEFrOpnueqp49lpSsCtkyhW66cD5QzqZPU5hyS5TkM=;
        b=oUFT+q+P9SyxrjeXBuOemk2GaQXhKCmNt2iCHaimrNLysTPtf7v01rzwrXomMJa/D1
         WVa9KwcX2wVEiSxnKRS1E3c33q/VH/y+5LGKhCcZVo94gc65PGrUMTpQaxYD04dZH6LQ
         Z5zK2kcmeJceytdGmy5RrzXokT6IzBjpYf91Si1PApofjc2sdurIlHKMGjOQO2/ZBiwl
         A8bVH3XXW/bT123U4xCBIlFLR6efb1Wuiy8otygCN3yXyEZYMqdDQlfeZeRN8KS6Tz6B
         UHWbwwZXxD0VtpviJKSgfU3bOZ0WY/Q08TPJMtExHUZWaL28ip92iSSTyHAENJIqYith
         pFyQ==
X-Gm-Message-State: ACrzQf3YJxsgAi28DDdcC4QVpblfsR6iOeT+Qi1nAdIqWa3rXl1uKMQO
        1D2QKJlS7eMXo7GMexVEuJnLqU1lRVSzQtltQxU=
X-Google-Smtp-Source: AMsMyM4HrVMj9QbyA6RL2lwzkPHaMztRJEKxRj7UuFxFGmaMMZ/4NAJuuyq7lOxPcIYVA8Iu7lyhdMn3d9xBX7r7cZI=
X-Received: by 2002:a0d:d501:0:b0:345:74cf:965f with SMTP id
 x1-20020a0dd501000000b0034574cf965fmr20511522ywd.93.1664192881315; Mon, 26
 Sep 2022 04:48:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:289:b0:2f0:1279:d56 with HTTP; Mon, 26 Sep 2022
 04:48:00 -0700 (PDT)
Reply-To: lisawilliams46655@yahoo.com
From:   Dr Lisa Williams <daouda76104963@gmail.com>
Date:   Mon, 26 Sep 2022 04:48:00 -0700
Message-ID: <CACGepZVqm11z=ac7=HWYVJZfPH5ajjHLDom6fGTjf5-CH81uhA@mail.gmail.com>
Subject: Hi Dear!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5013]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [209.85.128.195 listed in list.dnswl.org]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lisawilliams46655[at]yahoo.com]
        * -0.0 RCVD_IN_MSPIKE_H2 RBL: Average reputation (+2)
        *      [209.85.128.195 listed in wl.mailspike.net]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [daouda76104963[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [daouda76104963[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Dear,

My name is Dr Lisa Williams from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lisa
