Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3734C78CD0D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 29 Aug 2023 21:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233417AbjH2Tfy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 29 Aug 2023 15:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235414AbjH2TfY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 29 Aug 2023 15:35:24 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E263ACE2
        for <linux-bluetooth@vger.kernel.org>; Tue, 29 Aug 2023 12:35:14 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id 3f1490d57ef6-d7b91422da8so493483276.2
        for <linux-bluetooth@vger.kernel.org>; Tue, 29 Aug 2023 12:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693337714; x=1693942514; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvhaGZOk6FnPl06sm3mW0Yfmju/nBEVwpPi4Wu+dVVs=;
        b=h3oE50G/9kXAMtmIEVvQdGqQRQWZ+Q62/fnednuSr2O2rBdd4YrRfBXQCrRPK/2VBP
         83TgcOTBWktFatXL6UiCdZN0dBqJ04bVIgoJ3ZIELyRc1yUKR3Xht8ZPafhAl15SNoWc
         TfjA8/D+Xsq/vG0yE33aJhe6rWlnI4WAaXQPvzrRSjiyRAk+nWJQcSDligbVZJwTJnIL
         BWkBhYQOATUHCCkPr9vSS3mkyamUV1z/pmsdjb5I7XWRdpvZaVf22DmV7/r6skHjCvYl
         sT9E9o/ASvsyWGV5tDQH13eiuxKOSNCNShLB6P1xTprxzP/sfvqz8WHSjPYz0sZLOPue
         BEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693337714; x=1693942514;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvhaGZOk6FnPl06sm3mW0Yfmju/nBEVwpPi4Wu+dVVs=;
        b=kqtAl3R9c9a7VFq+iALqQ0sR2KBUa5wx4ZErPCzQtm5DkKAhR7KgnwUu3TxKlltNBi
         LodJcM2C2AaV30E21iZVA0A1Z9v90L/k6oTRqNmi4jJi0I2kCVh8OT3jqkYFn9RUgVY2
         4F++Y1pJ+/kRBuPFeyFbVhphl8QfV1xeHKM+gk7F8FeTTF3kb53NMPgbdPybjRNRSp9N
         D0n1kL1Gl0gb4toMU12CKskiRcIMPam76yphPOVm7uHyd/Hh8/uYIWJXMuk9Ltvmc0mT
         4N45qqrZEnLVVZAQahf81I4xVNJieZ9XgH3RfcxyuqZUs3AxI7OGmlhwFQY01sXf2fta
         tyhw==
X-Gm-Message-State: AOJu0Yw0Hd75mJ3skOh14nh4AIc6BMN+DDG/eWq9kS1VQndFuLh1AWCX
        MTEWiM0iOXaghU2kcW1DSkZ3nTaN7E09/Q/9u68=
X-Google-Smtp-Source: AGHT+IFCISo4U6On6cEVOmd90ipmCsDgfoiclz6stkxpBnuEA9FBq9UfH11ObWnwil2N2JuYuwwAeJBBqzmupM+RXv4=
X-Received: by 2002:a5b:60a:0:b0:d7a:c493:ef35 with SMTP id
 d10-20020a5b060a000000b00d7ac493ef35mr81644ybq.58.1693337713805; Tue, 29 Aug
 2023 12:35:13 -0700 (PDT)
MIME-Version: 1.0
Sender: mrsanahbruun1@gmail.com
Received: by 2002:a05:7010:671a:b0:377:d83a:baf6 with HTTP; Tue, 29 Aug 2023
 12:35:13 -0700 (PDT)
From:   Dr Lisa Williams <lw4666555@gmail.com>
Date:   Tue, 29 Aug 2023 12:35:13 -0700
X-Google-Sender-Auth: EG-LigwUfCJu4o4zItRGukFoa2s
Message-ID: <CAELFs-==oVnGzL1MJErs3g0D3iXzo9tcunu9XSs3m4rY6cL8LQ@mail.gmail.com>
Subject: Hi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

 Hi,

My name is Dr. Lisa Williams, from the United States, currently living
in the United Kingdom.

I hope you consider my friend request. I will share some of my photos
and more details about me when I get your reply.

With love
Lisa
