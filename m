Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 599B27293A6
	for <lists+linux-bluetooth@lfdr.de>; Fri,  9 Jun 2023 10:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239689AbjFIIuP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 9 Jun 2023 04:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241041AbjFIItx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 9 Jun 2023 04:49:53 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492452D48
        for <linux-bluetooth@vger.kernel.org>; Fri,  9 Jun 2023 01:49:49 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f7378a75c0so10501065e9.3
        for <linux-bluetooth@vger.kernel.org>; Fri, 09 Jun 2023 01:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686300588; x=1688892588;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POzqMJPnZ8n/AxRgRpXufq5bH3zdXADjXwcrF1+uW7Q=;
        b=F6yPject0T5tdORvZi8DClYD3f+hOywHhn3KEoRxWT1/UkJQNlCDePl5tYT513T66V
         rPBGjMn4IVbdqu+rYmUFxUCMUsPZVvyhls/CKtwHDYSHALkruiE1i6k4qiy7ucDnWXND
         +VYc1DorOGHpkj6XhGmU7NxyLStDwNq4rSH16u5haja+sJ+Dbin/HY0hCxUNXvrmdjZX
         5jCK+GQarbEfX3rYzFEWbo9TMpLK2geqVQEB1DZkjZN81lnrdKJR3CaBoBbN1jsVceil
         BwB36IvHW8i3ldh0k5YmSNbdrF86qjt+FVmLRDSP+/0yLCl3oSK7d3nX6OIenHLeYGY+
         FvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686300588; x=1688892588;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=POzqMJPnZ8n/AxRgRpXufq5bH3zdXADjXwcrF1+uW7Q=;
        b=YfLn/8UUmiVKl0k2vmQh3OXGCQwalMzHdWf4lzjEiQ26vstCg97Zq106m94/69VdkN
         26n52bg1Gec9zKX6prz43l1zxrGAueqxLbDEmNo2mRaeQ/NDNXyE8RJqAAM7BS5cPpyI
         AzYPDTrYfquSkoy8cbQQyYmVNuIWoXsY8NBNoUJUyJwCuwXAl9udLLWYFqqWRtbFMhyp
         KTr2wNacCGNMbOevgeMLK9Clp03pqiFDzp+yOmkSQ8vhYb7vYol2WNgIXlCNjm5Zfyjz
         m7w4Fb8EbkbpOWQe6c4S1YlNZDmsyhuRTRxvaFF/9EgbjEWFqyaiFrQUO48irJ3+Hrhc
         iVkw==
X-Gm-Message-State: AC+VfDzqI59vHcgGQ74u9hsLmPJ4jWGNyPmMJL/x+nka9M6t+eKxtrwq
        ofKTNTbKbIoKeTdSEmplqvg+um9t5CKHc5duOJA=
X-Google-Smtp-Source: ACHHUZ65k5rOU51+urNcIsJHE2/x23LLoo2UJnHHuyoK9+6OP/41RPAG9gZR70KtSxS2QYRmRLOPy1Gv3rEZMPE61Fw=
X-Received: by 2002:adf:e68e:0:b0:30a:d246:32c2 with SMTP id
 r14-20020adfe68e000000b0030ad24632c2mr402703wrm.23.1686300587478; Fri, 09 Jun
 2023 01:49:47 -0700 (PDT)
MIME-Version: 1.0
Sender: luccaromeo832@gmail.com
Received: by 2002:a5d:5351:0:b0:309:63f1:6348 with HTTP; Fri, 9 Jun 2023
 01:49:47 -0700 (PDT)
From:   United Nation <turkey.un.info@gmail.com>
Date:   Fri, 9 Jun 2023 01:49:47 -0700
X-Google-Sender-Auth: NE3k3JQf2QDOrvBtEBQFn7Wl1e0
Message-ID: <CAFzAf6qTyV1kEhp9pNzO7XuhpWAHAOS02mg0NM+f9_FvtLHHqA@mail.gmail.com>
Subject: United Nation Compensation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear friend, my name is Mr. Kenny Frank. from United Nations
 kindly get back to us as soon as possible
official Email:(turkey.un.info@gmail.com)
