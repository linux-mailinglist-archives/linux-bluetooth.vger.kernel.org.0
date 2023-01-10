Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5BA66411B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Jan 2023 14:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238165AbjAJNCt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Jan 2023 08:02:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233452AbjAJNCq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Jan 2023 08:02:46 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DB15370C
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Jan 2023 05:02:45 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4bf16baa865so152059907b3.13
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Jan 2023 05:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FoRX2f/YZd1ew3w9a7uXRMrccel34cHi9ReaKIRWJg=;
        b=ln6PR+yGe6pNxxE0brMnBfQ2YDyThfWDqmxR3la9cJiCQ2auc1WITSvS68FuwNEPw6
         fAzKCb3YJ5lNfQoV/JBAIJyxenUcUb/JuVwRJst1tj8SuPH4k4SpKgpKz11cyu+8Or2A
         +Q+rc0wcp7NKZyiBmcTiMpanZk7rXOO0XaUOEoLOrJPXlI8Qs5ERfz27sFRm55XsARJ4
         ncU932PvH6sfvw4Y8BQwzbWdpQFUUb5DhUmtT6ZQw03lxynm1gzkWmjDAquYYVU/lW3X
         tZvcsVRazBj9EYchgs6DjCP+a7E0CE/stzAm7yhwlZMhhRDylX2wLdwWGNl4eL/HaNQk
         V4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3FoRX2f/YZd1ew3w9a7uXRMrccel34cHi9ReaKIRWJg=;
        b=Y8ssbjY3O/3e4VNTzEoAb1LcgmcPhwwpkVTPBnf+pmuSN2d8HukgY59UHRLChLGzj6
         D/XYFvChRjOKIA5J7DCOJRxq/ZAuN9GYidc80DY823JY1QcoAFwvhWE3LWRLxs0AdILa
         hBl03qQF+LmDiv5E+QaRfb9rjZKOALJm6xvU8l0wF1zMj+R901GJIRR0/LGixnNuDTar
         xf8fjmCibUaYbJtVLfZzsdsegDJqPSzWg99bYwcqSOXzk1ArqfpPw1+HCRS+HIMeeoPL
         g7gi63y8/B0PNDAoN6fUdycSmdBVzcjZr5iA+fqbMmx0a65jyHdAmxSixsZ8r4KfMx/R
         28XA==
X-Gm-Message-State: AFqh2kpM4SUc5cw9xTzZ+4vn9kuiMq8zh9II5s0CPCfi/9MuRS/+S+qT
        bgvuAFNrIFoaZHyNBgJzIH1FhYFPe0NXs7rxbPI=
X-Google-Smtp-Source: AMrXdXs6oxzpnoxsBeqKHNrGCLp1jEU5Yz31Pw2+PB2uJ/Q1JQKH4Sm8jO7/fRA06U7IyUVDP7iyYc1t75KZW52bt+w=
X-Received: by 2002:a81:6f57:0:b0:475:9f2c:899 with SMTP id
 k84-20020a816f57000000b004759f2c0899mr842408ywc.290.1673355764537; Tue, 10
 Jan 2023 05:02:44 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:c810:b0:3de:4254:e85e with HTTP; Tue, 10 Jan 2023
 05:02:44 -0800 (PST)
Reply-To: ab8111977@gmail.com
From:   MS NADAGE LASSOU <ibrahimdanzabilyaminu@gmail.com>
Date:   Tue, 10 Jan 2023 14:02:44 +0100
Message-ID: <CAKG2jqhDsquG8dFNZummg=yxtueZeGvMR14sTq-FPgfOap8MTQ@mail.gmail.com>
Subject: REPLY FOR DETAILS.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1136 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [ab8111977[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ibrahimdanzabilyaminu[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Greetings.

I am Ms Nadage lassou,I have a business for our benefit.
Thanks, i will send you the details once i hear from you.
Regards.
Ms Nadage Lassou
