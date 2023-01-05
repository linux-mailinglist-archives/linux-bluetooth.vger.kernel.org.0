Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA8E665F01F
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Jan 2023 16:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbjAEPcE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Jan 2023 10:32:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230477AbjAEPcD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Jan 2023 10:32:03 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6186201A
        for <linux-bluetooth@vger.kernel.org>; Thu,  5 Jan 2023 07:32:02 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id m129so32627007vsc.11
        for <linux-bluetooth@vger.kernel.org>; Thu, 05 Jan 2023 07:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JT2Gt7y/M3YLHVCyMzZwNsFe1p6EOvnpVpu2gl496w=;
        b=cF9cw0qN66erQX2jewuVfWNEaE3dPIBuOVmM+FJrm53EpvafwS4BjB0/pAzif6SlGs
         0aqnVDAdZ4zJ1eci9oATMpV4VPRm7ih/vmDI0BBZDaIQP69dYxINqT7ZurQb9oFnj6ex
         U7dtUl7z2kgDMruIC6rFltadu4EBCQuNoHjRPz4/+tYswTC1e9YSWY8QMlyd8nTABx3F
         avVW3DmQDsm10D2TOFvEEB+oRo9d1vnSE8YbN3HTUZjr0cBP4xKxauFrxP0WSkppHT9J
         vyYODluG1jTsTa3YpOOwcdcnz8CEBH0Q4aG1wgoIToyEZtGZv6cORqUxu5K6NDRbzy8I
         PVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7JT2Gt7y/M3YLHVCyMzZwNsFe1p6EOvnpVpu2gl496w=;
        b=Sc1oSSBsz9WIIKwL2HaQ43pjyZp1IMmbXrzH7KqcPuE0MTJ+cx6W5zzdOJwjNNi632
         QG69kUKvm77PAwnuL/yW1LmUbjcdUj6ahrDDI+1Qy5n1PQQ47BLMGSKwQDHN1w5QQlGu
         yCGZkxN224B5bxjp5ro1lnlXj6IDgiTSMYdrTUVJCl+hrGfnslbRKd8xczODahrOTezk
         DQybVtz33U0569egCUUYqb6RVAdn+6g+pKX8oMpmigBD/L3e5dck6IBPQGdEdDKYM3Rl
         R+Eyi39FFTsLibbFVzKmUcB9stknyX93pKqG5Se2JogoV5SEzBdW7UucBCzc8K1kRd88
         Ca0Q==
X-Gm-Message-State: AFqh2kq6KXbMKLZo3zAm3YlhjtWLMzKZ0RzX6OK2J0kvouqQ/nP5PhFU
        xRoJsEoCPUnMJOymxMLbAGe5g6mnR2KBEvuBoAI=
X-Google-Smtp-Source: AMrXdXuq6pXpJgDMitDdxrBc6pFsteDWtbOFWqF8eXGfvdjaQALjzDAXmHZUH4RTrSDGcCxWfQC/OOzsu2zqCSYpVeo=
X-Received: by 2002:a67:ec47:0:b0:3c1:55fb:3850 with SMTP id
 z7-20020a67ec47000000b003c155fb3850mr6967616vso.10.1672932721845; Thu, 05 Jan
 2023 07:32:01 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a67:f49a:0:b0:3cb:1c63:2054 with HTTP; Thu, 5 Jan 2023
 07:32:01 -0800 (PST)
Reply-To: westernuniontransfer277@gmail.com
From:   Western Union Agent <samaachille98@gmail.com>
Date:   Thu, 5 Jan 2023 07:32:01 -0800
Message-ID: <CAGvvqD-poKCnMTs1CwCODXY-GTkNS7+XousVDNGa2A-fCTkEbg@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Good day dear,

This is to let you know that your payment is ready now, but we need
your details now so we can complete your transfer today without
no error, so please try to send us your information now
so we can continue.

We hope to confirm your information now.

Cheers,
Western Union Agent.
