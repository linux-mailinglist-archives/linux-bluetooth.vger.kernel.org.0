Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CAB27B0E61
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Sep 2023 23:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjI0VyS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Sep 2023 17:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjI0VyR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Sep 2023 17:54:17 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B82122
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Sep 2023 14:54:16 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-79f96f83270so385563439f.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Sep 2023 14:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695851655; x=1696456455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KV4ZorwYJLjRQxEs+/Y5/kmw2P0hzFQxubwf3sPfIIU=;
        b=DL91ruhWgJynaLuvElgFms9K1KO+55ds4OuHecFVTRgBq+kts2/XwTChDYseKoWfAx
         FJ7DYb+QLfSY5UxrOC2n2iapLGI1ZMBkFXNBuhYUaQXipP+0O2HD94DJCcZiWDBFh8TU
         qGtZYCgzF5+zziueWfD1GzaLmcFX5OFUVKAI/p3mtMC13RgdEw8zeCF66ziRYnbeNbUb
         AbDcdmhTsov8w8D0k479gIQgaxs97Rglvhf6cbc/2LjBBbhbxNJxmj5USMI5bqDpYNIR
         i0ka/zWe64so8BrAm5YAyhe0NDTdj5jWpAVE3UXNNlBhFHgRo4MG8JrkynlyC3fDQWaL
         CAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695851655; x=1696456455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KV4ZorwYJLjRQxEs+/Y5/kmw2P0hzFQxubwf3sPfIIU=;
        b=sui/JuLFiTy4cWWUrFs88gbt18muuc/L10cnRD7e32xaiFp5iVLD8JUeKRkAFwkqNM
         9F/V8SXbyfTBumr6EBX1HHFGtu0SqCxY9kp/oATYR2qXjIrOhUafJsawTA8QRfBUHr6b
         X19tb+LiF9pcmwyGSQTluDhT+AR2R/dEErYyQyWcDdT/nU2JIdjK9dIVvAAV95pYt3SJ
         TmO2S3KxPgYxSXPdlFHukUoEzNax+0J5YqHBrHCeYFRSskBstaojPkksCoV+s5xILH0G
         tSaRYbDPEdVRjSvln13QUaykCyAMnuPELKEO0R5zbsFgLhU10l+Itxtyzc9XrqAoSFcU
         H+Jw==
X-Gm-Message-State: AOJu0YxucrL5TrVgBnr8T5dzR7/QQmYKlshRXFP/OuHHH0zwXFT5cQW/
        ARCaGFbPfN9lry7zs1ljXkZxVuEXrM3Xx430
X-Google-Smtp-Source: AGHT+IHoHgDu0OZU86v/X/y7eb8Rj7MD9+RheCk90krqYQ62cx/jRBuRHWjmMnt5ySpl0Qi1ENraWQ==
X-Received: by 2002:a05:6e02:b4a:b0:34f:234d:4b5a with SMTP id f10-20020a056e020b4a00b0034f234d4b5amr4141721ilu.29.1695851655261;
        Wed, 27 Sep 2023 14:54:15 -0700 (PDT)
Received: from lvondent-mobl4.. (c-98-232-221-87.hsd1.or.comcast.net. [98.232.221.87])
        by smtp.gmail.com with ESMTPSA id g15-20020a02cd0f000000b0042bbfe3dc42sm4225331jaq.173.2023.09.27.14.54.13
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 14:54:14 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v4 11/12] client: Make endpoint.show print ISO specific capabilities
Date:   Wed, 27 Sep 2023 14:53:53 -0700
Message-ID: <20230927215354.1874835-11-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927215354.1874835-1-luiz.dentz@gmail.com>
References: <20230927215354.1874835-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This makes endpoint.show print Locations, SupportedContext, Context and
Qos capabilities.
---
 client/player.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/client/player.c b/client/player.c
index 6953eff28543..d1809f24fd27 100644
--- a/client/player.c
+++ b/client/player.c
@@ -2142,6 +2142,10 @@ static void cmd_show_endpoint(int argc, char *argv[])
 	print_property(proxy, "Capabilities");
 	print_property(proxy, "Device");
 	print_property(proxy, "DelayReporting");
+	print_property(proxy, "Locations");
+	print_property(proxy, "SupportedContext");
+	print_property(proxy, "Context");
+	print_property(proxy, "QoS");
 
 	return bt_shell_noninteractive_quit(EXIT_SUCCESS);
 }
-- 
2.41.0

