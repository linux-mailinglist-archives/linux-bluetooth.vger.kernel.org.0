Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3783376A150
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 Jul 2023 21:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjGaTck (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 Jul 2023 15:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbjGaTcj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 Jul 2023 15:32:39 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8E7171B
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Jul 2023 12:32:38 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1bb575a6ed3so3801996fac.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 31 Jul 2023 12:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690831958; x=1691436758;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RapVQawOljZ3WkdRWpTvGIEHTklNcouz9V8HkQ49kOY=;
        b=T9WERDddGH8QY3aw3fqHtgpJpxIxpoJWeI/SB5DrmqAw8B3JHuuBv2z6JthzidR/ix
         ckkxybuictq1pHbaFxNA9dSc1DXS+C1/ayLjlbunyIecU7pCrNEt+Eg9o/Qj+Jy+nibZ
         BLkdGKbcvNypDQ0d+G8XKgn28ahVALZu3Ek5P8BHD3v3WUrAORe3AN8opBcuCevR6TUH
         dCQkdnzVwUtZmvvwpS0WTqi0n+lJEf3qlnowSL1IPRytQyXDeW6TalkIKl4la53oOyeW
         n6BFggUMCDZy565cLPWV6nBgjmhIvQUAiX/vhm03y8U0dk0kdS4wiPcSVrKDGpzZBAfZ
         2TBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690831958; x=1691436758;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RapVQawOljZ3WkdRWpTvGIEHTklNcouz9V8HkQ49kOY=;
        b=Nh6KuebQiw47miWsvDOz5S8MN2RhFjHF8kAKd4eAwFwODhIHHhqOtnJZ0HYAG3HZ0P
         krgW9i74BEqzdTtQcOq1RnPgTuos/8LiBAuQozBvYmB8KZWo2r7EoDl1uLDSgKWADrrt
         qBi/s7sHoMEXSteRTytDKnhLOlfa+jgBdkGBzOi1sf26wXmtSwh5UGXM2cVtjUf0yfh8
         Q2SUGUz9Ve+t8AOraXW8jHLCfFoDAXm5HgRsGq5rJWUOGLgVE99wYcg0hSBRYbvHyLla
         00XqRlMjLHbmJ/UJAaIyK9lZcZD3aAb0iKaLkC7xHop8LLuTrKROwFcPkA9Dn/xlVlkU
         PWKQ==
X-Gm-Message-State: ABy/qLY5XibBlMEFqxT6rNNSOfyWv3Px86Ibs9P2ODt8yILY4xmv1cub
        9wWLIOsCz0+wQaKt30b1SFhzIPAVkfKXje4lG5o=
X-Google-Smtp-Source: APBJJlGCWlZL5lOX31vI2ukzQu34YwD7XT+FjabGGFUFzUoLX8jm8Cyn9OKmm+oVRr2bVosElrEgz1ek5ISQu4LQBIM=
X-Received: by 2002:a05:6870:3927:b0:1be:cc5b:6ce with SMTP id
 b39-20020a056870392700b001becc5b06cemr5737215oap.20.1690831957944; Mon, 31
 Jul 2023 12:32:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6870:a691:b0:1b0:340c:8ca5 with HTTP; Mon, 31 Jul 2023
 12:32:37 -0700 (PDT)
Reply-To: Dr.catherine_chan@hotmail.com
From:   catherine chan <issackonovi@gmail.com>
Date:   Mon, 31 Jul 2023 21:32:37 +0200
Message-ID: <CAJpFc5f+cm+36d4FKk0dtezwZ5F=VRr3L06Y=E9q1_1joMaXbQ@mail.gmail.com>
Subject: Re:Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Hello! How are you? Please forgive me if my application is not
acceptable by your kind person, I saw your email and I want to talk to
you directly by mail. I would appreciate it if you could send me an
email when you receive it.

Waiting for your prompt response
Greetings,
