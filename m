Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0D064BE57
	for <lists+linux-bluetooth@lfdr.de>; Tue, 13 Dec 2022 22:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236523AbiLMV02 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 13 Dec 2022 16:26:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236538AbiLMV00 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 13 Dec 2022 16:26:26 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684FF218AF
        for <linux-bluetooth@vger.kernel.org>; Tue, 13 Dec 2022 13:26:25 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id x28so7120342lfn.6
        for <linux-bluetooth@vger.kernel.org>; Tue, 13 Dec 2022 13:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6c6RloR1f1meVJL/BrGR4Y0ez6uzlYlKHhaiRNYhs0=;
        b=Nzldj35wwWEDLeL1iY23uRTMvZDMBc78JHdv/4kEvFb7+KbUERFFQf1L16p/WHoduF
         aq+NKTJpMRi1DXoz8v22eVuZyvPXKJ55ZsxGN3loDTCqg2DIveIdaOD1Jsmsfj2rkIw5
         qFIeL1Ko/ezL1iyKcuISz+twrUU2R85bEy3IjaRFdS1Kx9x4ffmnA1QZAtfXtEZCIXjP
         Tan9cljtLAwOOoTbC94f7TVFdkp31aorZVsQAobzPFaTQpCxqyKALWfvEIUszqC3IdXB
         iboBNxdGIuIWOmkmzv5nXEd9IyQ1HUaOaM0dceF0Gtvb2eE7StOA8i7GmEyY26sM818B
         GabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j6c6RloR1f1meVJL/BrGR4Y0ez6uzlYlKHhaiRNYhs0=;
        b=Pu7fyC+ScMJY2aShFH1/r7vvlIqh0KcA9z04Avpznsz2NlyORn04s7dduFwn21xIb5
         Fb0dZRjUc+soQxbh7sv6vqpzfwKs4ZlaQgPL86HTKEvqejGsY/PNfJpNO+c2ZsnMxN7w
         YgguPuYqOuoBewlme5zaPlko/rWUFqleQ0xiVOo/I72BzvOl6Gx/Fo99GlIXQ3tycY1T
         WXYYOAIh8KbNroBkbOQg5KpeDwvSmhvjTtRoWKCCq/QR+dyXkwyhXYuPcNUSjaf5SmsE
         hMaGnx1Wz4XiD4YGVguWS+6Md47BY0ir+zqD/XufbjHYBpnHvJyQXM+omThRS2TVc8gf
         Ni9Q==
X-Gm-Message-State: ANoB5pk3LAWFLrCGYzsuc5y0eECSOb35m7JXDpl8PyjhbXrMPYpqzONe
        7qepmVqIUFMR02fKoFr/aU4ex/o8hUbXMQsGJMg=
X-Google-Smtp-Source: AA0mqf4nZtWPH015BwSotQHRky3DKadpTFP2vma27l2ZF0Z/fsD4dqg6YvSKzoG5K7zr8/PNWJGpJVeMBhv8Ns1qhxA=
X-Received: by 2002:a19:e008:0:b0:4b6:e32b:469d with SMTP id
 x8-20020a19e008000000b004b6e32b469dmr1260732lfg.616.1670966783535; Tue, 13
 Dec 2022 13:26:23 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab3:5a82:0:0:0:0:0 with HTTP; Tue, 13 Dec 2022 13:26:22
 -0800 (PST)
Reply-To: mmrstephen16@gmail.com
From:   "Mr. Stephen Melvin" <hugcinsm@gmail.com>
Date:   Tue, 13 Dec 2022 13:26:22 -0800
Message-ID: <CAMk51sCRw7r6_ew9JaXf9AJ_AyeNzf3d=AE21Xrp+BNZyR6B_g@mail.gmail.com>
Subject: Reply and let me know if you received this email!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello Dear, How are you today and your family? Want to believe you are
all doing great.

Please reply to me as fast as possible. I have important information for you.

Kind Regards,
Mr. Stephen Melvin.
