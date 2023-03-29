Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39D5C6CD631
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 Mar 2023 11:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjC2JTA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 29 Mar 2023 05:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbjC2JSv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 29 Mar 2023 05:18:51 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F1D10A
        for <linux-bluetooth@vger.kernel.org>; Wed, 29 Mar 2023 02:18:51 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id fb38so9836307pfb.7
        for <linux-bluetooth@vger.kernel.org>; Wed, 29 Mar 2023 02:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680081531;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKJ9KBgedySRjL3dvLGW6fxF1uoFaulO0VdxYq1EqpM=;
        b=p1r/+Qm2RbcXlVFAadE7B8zA8Q5yZNtv8UCPiXRJJHc1o0lO11eUmjS92wa4AL8DjT
         9YOUGt8vlDtKipyIUdcI5CYKfA3ogK5Chndj+nNkkdvQVAC6cauzjhi14vHOso0ASp3N
         9yKmCmzvnz6LhHPLaObnGLr3WCZOmx7x2rQyMzGkJHpT2RQwK3g1LVgHvJc/yd/FOYqv
         otP1AVflCUdBRZxmO9h8lLuRWcaw2dhwoqwoPvPT/Y7KzPu0dax8UgWTds2lJTVY1Tov
         SIropnacupkltQDx0SefPxoPXx2weYgDfszCH8IX61VEOJ/BweHHVLUWpAS64lFSVtv3
         lB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680081531;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKJ9KBgedySRjL3dvLGW6fxF1uoFaulO0VdxYq1EqpM=;
        b=uDcHf3hHjCLEhQRnbkadQUtIKFyOIKX7VnVYcN+mJXBH4vqBV9PHanbvWofTFxj5aF
         hIfADnoZGlBnL3evloEREG2y7Y2BavY4E2w+6uLYpPO3KjZxQXNwUqJT+lAaMDiQW3Is
         4hFGO7S1msx/BSNIHoGzHgAHGUkn4Y3z3Eeno3M/hDSBe8AUTTlakBE1GqTVBhYld7O6
         byrl0s3SH9XFTHHy6EOGFMqz1cuQabQ8IGYn2/dkVzWohBOdScbOq+6fwXTe3+i+kskY
         7Ou+6OKoEXuWd5Y61huV4H2x/QEPBRcfd5jqX9DIOC6Hd3U9fPvrs2r0N1sJo2K/iYJi
         zv8A==
X-Gm-Message-State: AAQBX9d3LL2zV/TUADyVKBzMhg/C916AOp5rdkaY2QdTPovLv72yRfi6
        sorx//xiSrNvkkpqnkr5hbUnri+Qm/p5ZxrXZGI=
X-Google-Smtp-Source: AKy350aedV/fxrErlpziEmrZmhn2BIu/mMdx87z56vsM6VctgMrJusAq1D5AuMcEXLoxseB2m9MxKjnzQklUmCHPsUA=
X-Received: by 2002:a63:581c:0:b0:503:7bcd:89e9 with SMTP id
 m28-20020a63581c000000b005037bcd89e9mr5235329pgb.1.1680081530869; Wed, 29 Mar
 2023 02:18:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:6617:b0:da:5e11:4e95 with HTTP; Wed, 29 Mar 2023
 02:18:50 -0700 (PDT)
Reply-To: fionahill.2023@outlook.com
From:   Fiona Hill <rogerpakayi@gmail.com>
Date:   Wed, 29 Mar 2023 02:18:50 -0700
Message-ID: <CAL0uRZBhMRgHsrkJ6oJazU=S=BC3SxJsCc7oCVT3t7OVavLbzA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Hi, please with honest did you receive my message ?
