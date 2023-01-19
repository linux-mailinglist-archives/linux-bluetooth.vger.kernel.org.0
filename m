Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20761673B0F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Jan 2023 15:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbjASOFK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 19 Jan 2023 09:05:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbjASOFF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 19 Jan 2023 09:05:05 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6663E7CCF0
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Jan 2023 06:05:04 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id u19so5893077ejm.8
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Jan 2023 06:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AV4rd40WVbMFZkIUJcsvF7Mjp/MQlzSIO2ZQCTrdWbo=;
        b=JLT/SpEdU5FZ1izFxY33QRB4ZU0ifb3qFJVFoE5KI2Y497avwyOrNu+04PcTpnHVRB
         qjoBC9/fvnAqKBul9Slu4lQ6redM+2A7AUHjVo6475ed9a8izSsNUefF5oQLyt24wkJ+
         XhQETV9Dbxc4rR4zo7+vpQhNsmgsANkrE7vhN7K8ZNpgiSOBw66GpnkmwoDj7QF8rFf3
         vw2HsJ7rzH3ddn5uxmBvuFtynJyixgEDkYbvPHiW8cxmdcsURJ4IDSZQE5J21qWQI3g/
         RwIO6C+k/jHw94F8/xhpnZ2tNVALkh7DxuJBUTcON7ZEXoyByaOB+LD5x4ZMZ0R+Pchj
         engg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AV4rd40WVbMFZkIUJcsvF7Mjp/MQlzSIO2ZQCTrdWbo=;
        b=S7VOEnCstFfYPQ2PG3Tl4enruz/RvuO6sJ8OvVOHkb/AXsnv/z3Un+XaUs7VrOgnIe
         SXf6fp37Oua863E8yjWU3pwuZAD1/pFtY6s+NnCNrsbb+impppjNRqg2y1R+XPDRUkpx
         M0vpP5y5HQWXZPceXxLEQ+wOA1ra+3bA/fqDv/uqyYZ2r27qBT5ZfiIVK1ntZDEjg9/S
         9daENMlb7Jxwf1uhtm205/mYAji5gZafEz31QBKL4RYE4zbHRAd7GWywjxLJ4tcypY9+
         e4al66V58SJpn3wCte72qYL64atmT1otzv80T+QKv63YPm2ccUAn5nrjwq88mhdHS7o9
         7ZsA==
X-Gm-Message-State: AFqh2krgFbsTHnLgOmSN2gmSPoYc5IycUXms3ybq1SNSvHZPkbkJCPQF
        I/QcAkfG5+fZ/u+KlQuWFQjHl0HpzI5D2e3lFLI=
X-Google-Smtp-Source: AMrXdXvPkNf1+64ei5YGnDWeAUjccr+sK9EF1f6g9oQbXJiei9ULcwVA+wFvVzIxFAo+SNfiT4XRGnHiaAYR7zbA9Cs=
X-Received: by 2002:a17:906:c08e:b0:84d:17e4:61e4 with SMTP id
 f14-20020a170906c08e00b0084d17e461e4mr961043ejz.496.1674137102749; Thu, 19
 Jan 2023 06:05:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:ce2a:b0:84d:feae:677f with HTTP; Thu, 19 Jan 2023
 06:05:02 -0800 (PST)
Reply-To: fiona.hill.usa@outlook.com
From:   Fiona Hill <mr2848830@gmail.com>
Date:   Thu, 19 Jan 2023 06:05:02 -0800
Message-ID: <CABtAzOadDL4tBUTpazELrYg4sGoh8GVBVKeDWkxuQ7qdY0KKoQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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
Hello did you see my messags, I sent to you
