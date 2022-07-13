Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F12F57402B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 14 Jul 2022 01:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbiGMXq7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 13 Jul 2022 19:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiGMXq6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 13 Jul 2022 19:46:58 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181494D4D3
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Jul 2022 16:46:58 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id j3so362182pfb.6
        for <linux-bluetooth@vger.kernel.org>; Wed, 13 Jul 2022 16:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HdixbbZvtGlXGP8eHFKNvYUlG3YTInq1yE7M+Npu2xY=;
        b=eDAJIi9FXsyhpC9+CeiGVn1x9Itn1R4MyD6X+kYtilpcsgMIvUXzYKmTPS54KQw4kt
         IqX+NhRrNe5V3l9DAPiaqt9P3IL792kdn+mCANXEKcsym4l5HOKca2GfbGn99dphtB4b
         X6hhmhi79SQbn8TlbLKPHsFHK0wR7kG/u/TePDVxzX2oFo2D65CyS3jAEqwCbMPfP/R9
         vW0OezKishIwaSTiaeYEJszqiMa6c6ZClNL4rgadb4eYw8eVr0Gk0zMe0Vw1q4bLKX69
         5drAWNGJOF1soKCENuu6hGF+8wgQEFL0pk3twxTUkEawjAA7rfgzScbZ9714aXO8lt6+
         c50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HdixbbZvtGlXGP8eHFKNvYUlG3YTInq1yE7M+Npu2xY=;
        b=qEqXVUHikf6307sHyHCwDxNDNRlmXmQ8846gdlDbp0BEYl5uOUpbZsX5nRE4YIBd3C
         GIuD3UeXSfCi8HdomZ8irz4IRSBf5voC9+9imsz2dDYTUP2Cmbw7rtuzm0mP3kMc55mG
         qJmTvmuBlyw5AQefWnuakhBkuZlkmP0doMDXd/Hi9KgXNQIElkHY7YEiEhil9dRGgXlh
         p24i7MnWfpjuqZNu0mjahbL4Zqp3TIv4md1XyRYb9zSlHnFCFJ3IgmIyXxaJleHpfWdy
         71f5fHdhfWN0TSJZG1Z2PWEo2SZTmT5/AAp1Bf1J8CAXiqVy4MquABYOpqkmVRbdKs9s
         SiNg==
X-Gm-Message-State: AJIora9GpdFzYVm1VhxdnuUSd8igDRJTjAGXpQLOGsve4dWzelcJK/qu
        mklTEc7PzwDiCMeMB2SROjVn8XlxGQg=
X-Google-Smtp-Source: AGRyM1vHyFexTL/tXR44AlN5SuBncvO/Tf8qODiNO7e38+8cEBN38nT6xDyWUnOO7twtyfIr/QWJrA==
X-Received: by 2002:a05:6a00:1aca:b0:528:1f7d:4ffe with SMTP id f10-20020a056a001aca00b005281f7d4ffemr5753830pfv.16.1657756017090;
        Wed, 13 Jul 2022 16:46:57 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id s5-20020a170902ea0500b0016a058b7547sm9534770plg.294.2022.07.13.16.46.56
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 16:46:56 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ] main: Default device_privacy to true
Date:   Wed, 13 Jul 2022 16:46:55 -0700
Message-Id: <20220713234655.3524356-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.35.3
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

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

If privacy mode is not strictly set to network set it to device
otherwise network mode would prevent reconnections if the the identity
address is used:

BLUETOOTH CORE SPECIFICATION Version 5.3 | Vol 6, Part B page 2837-2838

 'The Host specifies the privacy mode to be used with each peer
 identity on the resolving list. If it specifies that device privacy
 mode is to be used, then the Controller shall accept both the peer's
 device Identity Address and a resolvable private address generated by
 the peer device using its distributed IRK. Otherwise, network privacy
 mode is used: the Controller shall only accept resolvable private
 addresses generated by the peer device using its distributed IRK.'
---
 src/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/main.c b/src/main.c
index 34a54d43f..4ee96bc6a 100644
--- a/src/main.c
+++ b/src/main.c
@@ -699,6 +699,7 @@ static void parse_config(GKeyFile *config)
 		DBG("%s", err->message);
 		g_clear_error(&err);
 		btd_opts.privacy = 0x00;
+		btd_opts.device_privacy = true;
 	} else {
 		DBG("privacy=%s", str);
 
@@ -722,6 +723,7 @@ static void parse_config(GKeyFile *config)
 			btd_opts.device_privacy = true;
 		} else if (!strcmp(str, "off")) {
 			btd_opts.privacy = 0x00;
+			btd_opts.device_privacy = true;
 		} else {
 			DBG("Invalid privacy option: %s", str);
 			btd_opts.privacy = 0x00;
-- 
2.35.3

