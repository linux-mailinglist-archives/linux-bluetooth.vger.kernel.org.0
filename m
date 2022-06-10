Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAFC546F8A
	for <lists+linux-bluetooth@lfdr.de>; Sat, 11 Jun 2022 00:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348702AbiFJWMB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Jun 2022 18:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235334AbiFJWL7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Jun 2022 18:11:59 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A721F7436
        for <linux-bluetooth@vger.kernel.org>; Fri, 10 Jun 2022 15:11:57 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id v7so331373ilo.3
        for <linux-bluetooth@vger.kernel.org>; Fri, 10 Jun 2022 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TL/5CNk4/xLNu1AYL3VB0WHlsVMsKVVRd/qi/qWGI6g=;
        b=XiO4jLWmcdvmvbS3+M9Di+NICZpPUv17Dwg11gOl8DXW6yT4XUtHoa9Y3L2YRgDb8V
         ezXZj5U2fy2DSHEZS9tBa5Hi8tp7AijmiL3Cy0HU5jrF54TVhr8t5KJGgvberG3f/ELj
         9HF6VaKWPbSoAZTFwtwrnvQLHOfB1yeGV0xMu1JpXdI0BsXySKd2gK5WjsKsLhoj62Fl
         GdWH1356L9GFaBqTcpRBSYPdFH8bIv9d5AziMtJKaVN30pH5qewuyKzPJunCHsLvaLcH
         HNcpogcHlc4wq45FGH1j+FEZKYgHInGWnAgsqXUrJpc3+0eDkFxvMNHlnQ1BO8uzerAn
         Xa1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TL/5CNk4/xLNu1AYL3VB0WHlsVMsKVVRd/qi/qWGI6g=;
        b=WiQ1W46ry3swlBmoGhtGJSVYz9ZGvlfsaccHsRiiV38XIkLD05ZyNrUaH4eoNRk9+s
         VXwTz6L857NaBDKFIRIpr5PFwyrcEzvtnB2u/Zhitltpt2nsV5RuiK+6UabkYaL4zJvI
         myHGfWhyEQH+wQEy7gcQinuRrzy2W/JuAxsFSBKsTFUccsGDdPpifydrvKHJ53AkkiMd
         VDzzCfyBTMWKNoo48ZngG3b21YfLx4xSN6kbg9RweoU5pKy5a1bM+2lUQoxoP3Fayafm
         +83OM+8dyN685t0rfsd6/DiBeBC8dMIZB7N+WAmufvJNC2JcADqW90NgOB6+JUBizA7y
         i1Fw==
X-Gm-Message-State: AOAM531q8GtqIM1GsS3QvqXEWXRR4qNnaUmQ8OkzATN8yY0p3R1LvuPL
        S9TbJ0zTrm143i+QfZYGXbddyEf1e2U=
X-Google-Smtp-Source: ABdhPJwEmte1ioRwKK8RcQA9N6rL8C+aBjGlhbiuO65QjGCWui/LRZxeVjjNgLyS09enqJBbEAKuwA==
X-Received: by 2002:a92:280a:0:b0:2d7:7cdc:8426 with SMTP id l10-20020a92280a000000b002d77cdc8426mr3254291ilf.245.1654899116869;
        Fri, 10 Jun 2022 15:11:56 -0700 (PDT)
Received: from localhost.localdomain (c-68-47-51-143.hsd1.mn.comcast.net. [68.47.51.143])
        by smtp.gmail.com with ESMTPSA id k5-20020a026605000000b0032b3a7817b3sm117544jac.119.2022.06.10.15.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 15:11:56 -0700 (PDT)
From:   Michael Brudevold <puffy.taco@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Michael Brudevold <michael.brudevold@veranexsolutions.com>
Subject: [PATCH v2 0/3] LE OOB pairing support
Date:   Fri, 10 Jun 2022 17:11:21 -0500
Message-Id: <20220610221124.18591-1-puffy.taco@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Michael Brudevold <michael.brudevold@veranexsolutions.com>

This patch series implements userspace support for LE OOB pairing. It was
tested against an nRF52 dev kit with Nordic's NFC pairing example. Support
is only for reading a tag; generating and sending back OOB information was
not implemented.

Overall, LE EIR data is not dissimilar to BREDR, but the OOB blob starts
off slightly differently necessitating a different code path before
reaching the EIR parser.

Existing BREDR support was only for P-192 and that remains unchanged,
though enough structure was added for P-256 support for LE. This was the
change from the original patch series, where only the P-192 path existed.

Michael Brudevold (3):
  eir: parse data types for LE OOB pairing
  Accept LE formatted EIR data with neard plugin
  neard: Update D-Bus path and interface

 plugins/neard.c | 94 +++++++++++++++++++++++++++++++++++++++----------
 src/adapter.c   | 19 +++++++---
 src/adapter.h   |  5 +--
 src/eir.c       | 41 +++++++++++++++++----
 src/eir.h       | 10 ++++--
 5 files changed, 135 insertions(+), 34 deletions(-)

-- 
2.25.1

