Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8578A630F98
	for <lists+linux-bluetooth@lfdr.de>; Sat, 19 Nov 2022 17:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233986AbiKSQtz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 19 Nov 2022 11:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbiKSQty (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 19 Nov 2022 11:49:54 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAC11C3
        for <linux-bluetooth@vger.kernel.org>; Sat, 19 Nov 2022 08:49:53 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id e13so11051780edj.7
        for <linux-bluetooth@vger.kernel.org>; Sat, 19 Nov 2022 08:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLuxvrtTwLpjQCdZkBOlAPtT4PuOt7o3XUb4SWGRYeY=;
        b=qeplFr2aYM374QyrzbHVtfvDvqLKaNB1njAZ8MujhE16rOe7xzjnSHjg3ehlDRl29g
         cUVni4TRdyZnz9fGgG2YjpVevR/XYpndogewfJtk1KU8K9fKFkP4gVnRmTYA9iXmp6us
         KGdN7zKeVo+MZ+PwNHjHpLXw/05y+OuQpY+zpgjlyxhcM8/I7viWwgltc3oNzuOchplb
         8uCpBPcMB+/MnpQTkHR3W7z8F6X8SY1Ag1JrwcGwvya/Vl6DKvfWkGOf7TZpCDaArSJc
         TtlGlTEo74JDV/p/9nZO+juicQnxGLl/mf7FR9N9uLq2Igg9v4VUOPIK0n7S6IqDxGEo
         xDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLuxvrtTwLpjQCdZkBOlAPtT4PuOt7o3XUb4SWGRYeY=;
        b=AuzzDNeixM3CxT5zSE3sQZM8newo98vYLKWmEL081TWrHlcdZAB9fX4ZuX6GIvxMVx
         LBH4jhYzkz8SfpsvfkrEOZ6ncF/8b0aMCA6ZoFoHKN/T5aXMnbbIgZvIOtqFT3lmBZzj
         e3zHjgwNZbX5HhPxXfMbiyOC1UUTPcvNcsqtkMX0fY8mFUszWq6IHjwrCNL6Wp9m6rmv
         0bOtE168TwxveJLfkKhzgal7Tzos/xNqMj+zGRQpUw0ZqXZYCad7SRfqnmmUqskKRss9
         YiTnWh3+pq8A08ZL93IIWiXxc5o1kpM+DASP0+4k5rUite4J+xB6I9huAsFbACBbXGxQ
         OqWg==
X-Gm-Message-State: ANoB5pl0K3bNZrs4oNbm7FTtYwEuS1IGbJeO+4Ol8tNUcLs+P5u9lzPq
        XMnzUXaM8AfLVgAWYaqowHAjyyp/2OMdXMSQST8=
X-Google-Smtp-Source: AA0mqf58rrLaDRYvSlsSeVUV6bTo2lCWQksx04Fl0krPaKAQl9aoUezF89Mub42dm1tJPUQcTnXlcH4UoK5y6VFZpw4=
X-Received: by 2002:a05:6402:48e:b0:463:ab06:f338 with SMTP id
 k14-20020a056402048e00b00463ab06f338mr10124699edv.371.1668876591522; Sat, 19
 Nov 2022 08:49:51 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:2ad2:b0:7ad:9f03:fd1c with HTTP; Sat, 19 Nov 2022
 08:49:50 -0800 (PST)
Reply-To: thajxoa@gmail.com
From:   Thaj Xoa <milleymilley83@gmail.com>
Date:   Sat, 19 Nov 2022 16:49:50 +0000
Message-ID: <CAEuePDHCq4RkmJHX8YzL8JYayBpfN5CuPjeirU+31o4BMT_1vg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Dear Friend,

I have an important message for you.

Sincerely,

Mr thaj xoa
Deputy Financial State Securities Commission (SSC)
Hanoi-Vietnam
