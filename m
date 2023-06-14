Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72209730661
	for <lists+linux-bluetooth@lfdr.de>; Wed, 14 Jun 2023 19:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234721AbjFNRz1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 14 Jun 2023 13:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233908AbjFNRzZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 14 Jun 2023 13:55:25 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583FE2126
        for <linux-bluetooth@vger.kernel.org>; Wed, 14 Jun 2023 10:55:23 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-55b38fc0c70so842141eaf.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 14 Jun 2023 10:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765322; x=1689357322;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=VCXPNCraZYaTu7G2pWl4+xMj1l4Y4mQDL11K9iSvgOdGsNAHfuHyLjj8V4vW+9sJAI
         SajL1EFpxLSNeAT8tjhoryQ1i59otgLUMIBl+0+3JLfNTMWsbDYdrYhpKA5/30UpKxBX
         n2D+t/3BTp0GMr9jxVUNLq/yPERe9miXMvD/00bADfgA6Zp9zSEqSpGr19t/vJAIki9X
         +OjVADPsqB1VbM2+YxqMIL4yWp+s/JnCACZMmTS2sqPqHEMBu8rvw4ZDkBwzUIZOR7fx
         H8StQD2KLRvvEREMDSiuq6H53efasEwySKeAQtwg1zgWmreDb1sgoQGNuU0rUdtcCCvy
         jpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765322; x=1689357322;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=S+EEFTU0xXijixOuq1IjyAHztSD52Y/aFB0otP3AMeTGE/dLbZXWDf3HUehPgUgBxx
         Axk9yFQhNSHbPkMdqArMEdC7wdCvnflyGpsyNSaXLso91/TR1VXKXBLGL5ZmvC2BeaSN
         JFlGoBLn+iFf5cFPA+NvAfHBHbcHv2pj6wrF3r7jBSZXEimd81ubvin245uxEoNmOWrO
         v4chYXAdmE1nBVBke1UJSFdJyjhORVyE3Q2h4xu50i2mgvBfbpiRSmDz3tss7AjpxuCT
         mxfMUx82kCcKCF3auY8PN3Q9dm5OdvVv3Z7Ln7t3EMJ0sLu4szn092soX4qiZ8o1Gwdd
         gE2A==
X-Gm-Message-State: AC+VfDyTXQHT0+Gc2RGuaH8nmfg2n+qSmbQTF/9YLTfGlfTh40d5eHX7
        u23UteN8SfaOP0+tqchIP+VBenWApGj6MUsQN3A=
X-Google-Smtp-Source: ACHHUZ6UGFPXXI784rUSMFAGSLlxpr84ES9mILD3wsvvfuIbRnHm7KT7cxnaUJ1SUuE4Jyebch3b6+kaQDNHuerCAbM=
X-Received: by 2002:a4a:bb05:0:b0:558:b78d:8d1e with SMTP id
 f5-20020a4abb05000000b00558b78d8d1emr10506190oop.7.1686765322435; Wed, 14 Jun
 2023 10:55:22 -0700 (PDT)
MIME-Version: 1.0
Sender: mrsthereseninna@gmail.com
Received: by 2002:a05:6358:998a:b0:f1:be9a:c0c5 with HTTP; Wed, 14 Jun 2023
 10:55:21 -0700 (PDT)
From:   Dr Lisa Williams <lw4666555@gmail.com>
Date:   Wed, 14 Jun 2023 10:55:21 -0700
X-Google-Sender-Auth: vmAb2NVlphKo8pDPEyDrOAbbRyw
Message-ID: <CAKVHDg9QnTTM9BZ=iEMEOq+CKt3056rmJg2mz1VtnN8BO1D1tQ@mail.gmail.com>
Subject: Hi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
