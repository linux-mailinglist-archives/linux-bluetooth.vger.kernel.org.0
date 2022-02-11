Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41AD14B22BF
	for <lists+linux-bluetooth@lfdr.de>; Fri, 11 Feb 2022 11:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235417AbiBKKGI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 11 Feb 2022 05:06:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbiBKKGI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 11 Feb 2022 05:06:08 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD1EE7E
        for <linux-bluetooth@vger.kernel.org>; Fri, 11 Feb 2022 02:06:06 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id p5so23105531ybd.13
        for <linux-bluetooth@vger.kernel.org>; Fri, 11 Feb 2022 02:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=RUm+BHjHjBqeaGuCk1BVfImjY9k8WWn0rEUOHAWVbOo=;
        b=iCj4u7nWOF2IVYuWGnWmFWikNCppbFZlA8dUhWW5yssY0JjQSrPUwIrC+DAHK/Jnx9
         Vt48RquJpRGXBQp86j9NI+sibTviMD/jNenpIUub2vgHg9DaBJflChgd0AA5NyxSNRBN
         UeFVbvA/hYsWtw4TrmHE1fBLq3O+BY47/HvtjlBJSl7xtW3XzOOFmcjDo/K9zXVkxUMz
         zBGoZsn7wNzjuWfqvKifayTZ60dDhjIzBEh6p1FnjQnatItZddzv8skCCUVziqjSku1q
         7Ww0oVIfVSvp+W1DsthaVy8233YKFuUa+JO/AUTxM3vP+nk0nauWUBptGc+r1q0XW0Rs
         WlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=RUm+BHjHjBqeaGuCk1BVfImjY9k8WWn0rEUOHAWVbOo=;
        b=u5F6jT+ciQLEbUs6CFI7DUHwRV/R69y+oAyyfkz7SyNxU6BNq2i4td4AyihrQwsUI6
         wNmtEuRhc/u9891EQFe/9h6KMMolu9mS929usa4Tbp8cuKDW6gkwTyTRXNKT/vF3h+ZA
         F4lbRvIdyi8CEw+HSu+E/Dy0JDz7Z1IK4bTTOzBy02Wc9UGgdy4jP+oEy+B/xX5dsDPI
         3i3OyoAFug9HN4MRcJAJ6gOnqwYL9o46dQSZaBmXxfmxqMM8J238mjSmTtKXVMGXjQkr
         lvoeQLll3MiyPykkoQIqYsatkzQaXMorPzT61sjbukzwD4jF8GGSggqsrp7h67/EhiTd
         aEsg==
X-Gm-Message-State: AOAM530M+Gj2gzcJF8jSpmziGjglhkgwMqdwP7GHWZ6doHgRqE9ZVA2v
        2gfrtUMMt8Dagn2TPF42n7TDEdY4doeOp+Dqm38=
X-Google-Smtp-Source: ABdhPJwFpDrI1FpFvprlkTGIkKQd2/rtRkp78GLJf2ON/+z0gs7Dg2drVSIzQP2Aeg9F3GgWHyJVQ5EDhO3YBvD8Vjw=
X-Received: by 2002:a81:ed10:: with SMTP id k16mr913897ywm.166.1644573965923;
 Fri, 11 Feb 2022 02:06:05 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:1fa9:0:0:0:0 with HTTP; Fri, 11 Feb 2022 02:06:05
 -0800 (PST)
Reply-To: michellegoodman035@gmail.com
From:   Shayma <shaymamarwan08@gmail.com>
Date:   Fri, 11 Feb 2022 10:06:05 +0000
Message-ID: <CA+HOoT3dJD=-Kjf45MXx_U2uhw2bgJRGf5GBUt0SH8_8Fm1kaw@mail.gmail.com>
Subject: Halllo
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b29 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [shaymamarwan08[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [shaymamarwan08[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [michellegoodman035[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hallo, ich hoffe du hast meine Nachricht erhalten.
Ich brauche schnelle Antworten
Danke.
Michelle
