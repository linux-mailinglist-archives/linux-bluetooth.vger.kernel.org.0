Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11290536931
	for <lists+linux-bluetooth@lfdr.de>; Sat, 28 May 2022 01:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244378AbiE0XlJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 27 May 2022 19:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbiE0XlI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 27 May 2022 19:41:08 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB7560AB3
        for <linux-bluetooth@vger.kernel.org>; Fri, 27 May 2022 16:41:08 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id e144so2668289vke.9
        for <linux-bluetooth@vger.kernel.org>; Fri, 27 May 2022 16:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=Id1rMHdPecnS4UjpLlfB2qCcgp3IIOYjcjLByMaW/fH0kdXrV0F8LWZO4AKAqPpdNo
         t5Q12Cbyqtfu1ADSM2NLj1TC++x9EeWnH1l0y7zNicaai9/jgSH1ehX23LYG33cEwdM1
         X2zTEMcpPBDqUg/AXQDFLZFlQC0AkMCRf5EAPJ9MSXfSaLkWq04bkeoRzGP7FkpCBuS6
         tl9OuH+Syyd1oyk4MXbYJL1xt/72sJxgNSygOlHpwPLRPTTaqKH+P2wpqKqcqfhqvs7J
         WEARw32pQA1g+yIdJ2HgqDhCA9LaakNW0jKZKhVZWW2Vc4ojVsQV7lf786VM0kwv8t0K
         22ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=jBWp+X6kYuJOBzs3yKxULPm5Qi6expCVyzsn4W3i1eLl1MqMatHuomr2JJPG2gqLKb
         XOtIoROgRV5Jn0sbR4nNUO8N/BrPvZF2zYyvUZAZYa/m3pTOWC5D3/bvBJl0ErwCojX6
         P/kPtsgIh3Fk/dgHyvkx8HqnzVvFElLkjR2rbl5YWP/Ttb8E8gTbTYBG1MSAnK4UkqVl
         Q0uKjyIbhQVuVIiKveIAbp0sF7cC9MgFxNyktskG6OZzkHnojdoAXJ5kiQeN54vwj2s1
         dX5vqzE5F1bZUydkqowcthqAuKNK3QoxxcweL4RUZ9J6JZVaTuitQyDChQUCTfC2ubgz
         E7hw==
X-Gm-Message-State: AOAM530n6RBtUs733xd3HRh1snmYkUJQCHX5bqBjnZJMRp3QKqzTWmrJ
        9TrdevIfjoU8dg9DbpDd+hpvB3Juce1Yw4fqkXo=
X-Google-Smtp-Source: ABdhPJz6ywwRAs/diRMRf+Uw5Vd4vBousKVZjqkZ/HV7ID6FG2/vcTzPxvGuaWmo1rgxwte+dDW6iFd+keNCSFBXX1k=
X-Received: by 2002:a1f:9b53:0:b0:357:a3e8:e9af with SMTP id
 d80-20020a1f9b53000000b00357a3e8e9afmr10940373vke.7.1653694867255; Fri, 27
 May 2022 16:41:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:67c6:0:0:0:0:0 with HTTP; Fri, 27 May 2022 16:41:06
 -0700 (PDT)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <kundah7@gmail.com>
Date:   Fri, 27 May 2022 16:41:06 -0700
Message-ID: <CAFuRN-R9TOCPafhNjF5FSRN=jnJyUicM9i1ssfe-EvB2vD4HKw@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a2b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5787]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [kundah7[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kundah7[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
