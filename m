Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C77F679DD2
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Jan 2023 16:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbjAXPpG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 24 Jan 2023 10:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234372AbjAXPpF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 24 Jan 2023 10:45:05 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC856A45
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Jan 2023 07:45:04 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id v5so18727697edc.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Jan 2023 07:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FocuR5aXn3z28LzYD0rCmA/t4By4lcIW0G986gs+i74=;
        b=hyoQf1NqvicBaHDrkam2iWDKVrn0yGYM+CNoZrUCki0kg5/9s1EW86dA+g2HDKhaAd
         vLUOpIrs6bBNRaXVGHtNWWVpPhFkfIrz+dd2mxfqNXB1BGUztU41fiCMlGG4N+Z0yujJ
         UV62nJCPyAq4XvB5Zl69oBYxCyMZanJ24ysip0zKbe5adLK/XFSbtp/3yOBtA4H+jKwG
         TKjUoE9NgnzBsQC6w1VmO02Ac3yBTrSXZEaAOknWJhAMJNWjpLrRkevAEA/Xdo1N/WWf
         nT2A2vCtA4OyeMis0h0z2vk+AB+sh/zjJK6IRHhpHRMwvr6KCX/zEdHSbKv7ZbkCahF1
         jjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FocuR5aXn3z28LzYD0rCmA/t4By4lcIW0G986gs+i74=;
        b=L+fZylpfQ6jXLK5CD7UINr6ElkI81+/8WfJDwKQpPH+a7crxWohW28hsYOY31n8yfG
         ZscP580B3D4wpMwLPEEOhgh57b6itbE+YNztJRdC1LLVDAKKnK12pbLTLcFu938wAdkU
         hy+vrFqtljR+G51OxWCtW95LvO4Sa6CiAIH7bKMK+2I+Oahdq14YYxsy2C7YoYWj5lh5
         3RBMKUaZG1/ptlCp2hXjBIql/Z+hJ1MVmTLAtwXHNwmUysZB7D3EZ2w+y0zPn2c9Hrwz
         XKYT0t8UGHaIBx1rWOBQW1FUO6EFYsaUHPq5lZUC8qmamB3vXHd8nTacOnGZZmtr8/Lr
         c4CQ==
X-Gm-Message-State: AFqh2kpRqRKXYXQSvq9IWJxIq11L0q43z0byOKDidcGncwCr+aP+jrDq
        bbY1125QTUtXjLntbvTMgXpY9VPNsFTBI1Ynpwo=
X-Google-Smtp-Source: AMrXdXu3szy4JrWMLeyErxTwFEZ2qARZ/eeo7LVfP9XWjBGrhlnec2y8DGdRpXpNhfQVR63fYlxxfjcuEWDmSqLycAo=
X-Received: by 2002:a05:6402:21a:b0:468:f142:3040 with SMTP id
 t26-20020a056402021a00b00468f1423040mr3746200edv.107.1674575102296; Tue, 24
 Jan 2023 07:45:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:640c:945:b0:1a0:3fc7:c47b with HTTP; Tue, 24 Jan 2023
 07:45:01 -0800 (PST)
Reply-To: khalil588577@gmail.com
From:   Abdul Latif <anthoniushermanus1969@gmail.com>
Date:   Tue, 24 Jan 2023 15:45:01 +0000
Message-ID: <CAA=EwkL_cXXb+Y4f409zBjKQTsxPMSAAdnFAMqcKMKbOHQwi5w@mail.gmail.com>
Subject: GET BACK TO ME
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:533 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [anthoniushermanus1969[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [khalil588577[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [anthoniushermanus1969[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

I am Mr.Abdul Latif i have something to discuss with you
