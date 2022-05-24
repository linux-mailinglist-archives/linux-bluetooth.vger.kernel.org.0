Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 969DC53235D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 May 2022 08:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233741AbiEXGkJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 24 May 2022 02:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233564AbiEXGkG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 24 May 2022 02:40:06 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA9E972B7
        for <linux-bluetooth@vger.kernel.org>; Mon, 23 May 2022 23:40:03 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id fw21-20020a17090b129500b001df9f62edd6so1434870pjb.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 23 May 2022 23:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=+/ObZQdcudoKPi9EHyxehxS+g8fV78JSk4u1MMEObnU=;
        b=WjhXP28oJoHL8ogK3QG2RjFsV+hZ0iHpDmHg3yHT9N9bXf7854LhjBAfm3oGVJALGd
         M7H8Bjp0+Bdc+Q92SCenH6At1XNJLnJd5Bjq4WwpOceAoiwIRfNs5ZSbupn5dTnKEcnr
         fOZ+f2oQJqTRA28I5lMuKe/x0++U/0W3Hc2WakkqcNBPho1bfjOFIRDymU4OOeSwHyBW
         Iv9gsxC2DJHeNU0b9lfx/90AdYhgVbrYlD7fqNiQLAepJr2ppLa4AuD6fFlB5P2hPSrO
         S0eQSBjSxsbDvgDrsSY8vg8sLP6V3R1ZA2DqS9KxoyDyMh6FPugCp4rOdaRvIzk5z+WE
         aihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=+/ObZQdcudoKPi9EHyxehxS+g8fV78JSk4u1MMEObnU=;
        b=gxDESgTU0ST4C4ws6fbPRNY0K7COXdnTd7Phm+tBUJjN1WjdqVgRjOaCzmRf787weQ
         6eCKU0Q//zvCYZpc6qCzcQMFSNQ3OI3CzyVr5L3u7UlvThLkQXCpybgjHkcreHpXc/H/
         oU8a2fAcXxeVzcZVroU77IVV1ngNR7M8D/tjISGauCoIaSNS4vjbgjUPPbHhE4ZiGf8i
         SKBGWMGdQZ3SZOtKAoa5RANjfpESkwXpXm09VkQXgUtRIfi1Ow0Zu0ZkuqjwxL+BPB/6
         BBfTvgw18Mj3bH4JcRE++2x6zZdlOuNmnvH5JzUONYwO8s8cr74bAZiTJ3LlnPqwHol0
         vy9w==
X-Gm-Message-State: AOAM530S2WZAbyAgR2+VivbRKwKD89mEHOO+OlngQAghxqhct9bonCxG
        ONus5Hxb/aGx1OC/O2qdMXTlnqCpXWRIyI9FkQM=
X-Google-Smtp-Source: ABdhPJy9SV7m95QH+sEk4ynypsYPVPmGmjim6I4qUEF7RYJ4Hd3+oNUZe4cC7E8YpwEe17Im0ZXd9Ep/uPw0HweaEVU=
X-Received: by 2002:a17:90b:3884:b0:1df:db8a:1fcf with SMTP id
 mu4-20020a17090b388400b001dfdb8a1fcfmr2996886pjb.217.1653374402873; Mon, 23
 May 2022 23:40:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:e7ce:0:0:0:0 with HTTP; Mon, 23 May 2022 23:40:02
 -0700 (PDT)
Reply-To: BAkermarrtin@gmail.com
From:   Martin Baker <davidabula9077@gmail.com>
Date:   Tue, 24 May 2022 06:40:02 +0000
Message-ID: <CABMMw35sTRzV6m3nzaLUzdUjbLUybf3iWcw=0_g0m-J8gMaXFw@mail.gmail.com>
Subject: Morning Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1031 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4577]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidabula9077[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidabula9077[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
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

Morning Dear,

How are you, Please my previous mail you did not reply it
