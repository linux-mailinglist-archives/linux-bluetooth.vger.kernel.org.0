Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1377F533BB2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 May 2022 13:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbiEYLZF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 May 2022 07:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiEYLZE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 May 2022 07:25:04 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626C88D6BD
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 May 2022 04:25:03 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id u3so16671669qta.8
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 May 2022 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:subject:reply-to:from:to:in-reply-to
         :references;
        bh=BvUQPAN3r9nG1917h54OsA6p6JDSRnko4USMjnTDnnI=;
        b=eX9oJPRa/vcCf4uJc62X+nZNXKIDzpX0R6k9c1iQaoYCszLN3kE1O4K+YHsDPcG/V7
         VW/eqZOJbldCiBz9l9BN+j0V5+2OLk5vGQtRuFdGxsdAHifU7RIBTt7WKV08EKAlH9Z3
         hRBH8zVVziV8RjY7yu28KQvbDurIuveFaWSr9CHQrzSCqsCBY+1ii4OQ2e3lVTYj9HBX
         BDmeR224w91nQLqlS95tiydug9XGWf/TARfM8VHxD7B1si6swDu18lJK/JBK0YplLYPc
         ViBXttDKuk/kOf/9C72vo8iKwRp5X3iXs382dYUiz6WCFbwP8hj+aWO924LkynvmLCL+
         7GSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:subject:reply-to
         :from:to:in-reply-to:references;
        bh=BvUQPAN3r9nG1917h54OsA6p6JDSRnko4USMjnTDnnI=;
        b=vIV3t2LzPZgnvn7XZ/A5TdevZYIcZXblB5UTWDCQHM3NJJ2e1r35HCPa9qQHeLG0Ju
         F+qRjX/sMsYN6qo/oPdInaVHn0NlylTz9jkyYlNRsbq+ATO6JevgXBR3/NrNyJUoEXzc
         a9iCXx1SKNxY/VADD8O9W0o7mhfMOS7zggL3Bk71mEoH4Aq13DtkgPDZkTzb6p6EiYxg
         Q07UadlwZfiAUcpzXgsk7oBqUMEGBbU2daE940tIGTVNhQs5l27HGeOKO350xgkukG07
         u4Lz1dcact4lT1LXGHUVsrwVD5WoY561v6TyRqXEkRh3UkzX49X7TgBYB/UJnUGySrW0
         UgFA==
X-Gm-Message-State: AOAM5316fvXr4Efu8RH4t9X1biP1j+Wii5PhZBZz/jVb6SodvGN5CAJe
        v00nr14Qb0c+MKK20km49MWjcGQ/s479wg==
X-Google-Smtp-Source: ABdhPJy6iUxAxghzYxBll7a4xEtXpzR0du4QpxkFHdAtwRIes7Aom6uZDoxlwxLmL9BY3X0DmjCDig==
X-Received: by 2002:ac8:7c4d:0:b0:2f9:4113:d509 with SMTP id o13-20020ac87c4d000000b002f94113d509mr6380136qtv.589.1653477901890;
        Wed, 25 May 2022 04:25:01 -0700 (PDT)
Received: from [172.17.0.2] ([23.102.122.92])
        by smtp.gmail.com with ESMTPSA id l11-20020ac84a8b000000b002f39b99f6c4sm1132559qtq.94.2022.05.25.04.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 04:25:01 -0700 (PDT)
Message-ID: <628e120d.1c69fb81.ef39e.5c35@mx.google.com>
Date:   Wed, 25 May 2022 04:25:01 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============5061000651027877207=="
MIME-Version: 1.0
Subject: RE: [BlueZ,v5,1/8] doc: Introduce the quality report command and event
Reply-To: linux-bluetooth@vger.kernel.org
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, josephsih@chromium.org
In-Reply-To: <20220525105015.2315987-1-josephsih@chromium.org>
References: <20220525105015.2315987-1-josephsih@chromium.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============5061000651027877207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is an automated email and please do not reply to this email.

Dear Submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While preparing the CI tests, the patches you submitted couldn't be applied to the current HEAD of the repository.

----- Output -----
error: patch failed: src/adapter.c:9698
error: src/adapter.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch


Please resolve the issue and submit the patches again.


---
Regards,
Linux Bluetooth


--===============5061000651027877207==--
