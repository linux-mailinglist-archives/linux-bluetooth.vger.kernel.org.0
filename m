Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0D06F0ECB
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Apr 2023 01:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344396AbjD0XN7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 Apr 2023 19:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjD0XN5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 Apr 2023 19:13:57 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70F12728
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 Apr 2023 16:13:56 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b4dfead1bso7544154b3a.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 Apr 2023 16:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682637235; x=1685229235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5PZrWIw9wJtuIkYP9O2VU+XSk2bbMScan7h1oDUe4c=;
        b=fD98UNrGVnUOStAHNsRFI4ocEt9N8+GJ0roKMNIkbdiNcNAnGTKJBUnkZyK/gEROHC
         yZBsutVwBdrAQNyOQFTqGAUEjq9Q3YZJeDBNWCIetuk32Yz15XbzBZh037+HinEKwj+3
         ahYyuxQuvT7Doho1PaIFIVPqGaciY6ijLs0ooaCeUwsMReBTcPojKfGXZ5hgsUS6mk3Y
         9xx/RD+T/62iv/9Lp4Zi1JAHu1Xbl0HSyHfFClYmEAViioj/sBTG37+4W3oEQKdyj3ie
         ILgBwMN04LW4z+xo5FRtCDRC4zTcPDFQVfN2Fwz6zK1dkdjRjApuH8ORkYgjhWFai8cf
         d4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682637235; x=1685229235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5PZrWIw9wJtuIkYP9O2VU+XSk2bbMScan7h1oDUe4c=;
        b=UanokI+pCUAj9/PGVrd5iDzM06qy6b9HO7XHgdBASelOMzs/vLfrJlufZCvlCym8PN
         61PC8mk02FAvLzXDjyv/V7G4X551OsKy8G46Dle9Tz9c0cHKZtA9vdR8Lmq4BUEVNJt9
         TRzSCYtKF6CS8PqCngSxrTfJCft3rt4CbhwsZDFvOMiDYYQj/zE2it8G/TnMzkxBumq3
         4V5VVlKuDCC5TNEKAxIXcm+xIsZeJwRE+LMcH1flJ+uAKNyKUk9Vcl+RW7sHroRVS7bJ
         SE6kJyIKaq2XBWASxQ4be1YzXP63kv4r1Js/GaKwJjhGMxbX/C9Sr+pW5KsRVYzWUrw8
         WcFQ==
X-Gm-Message-State: AC+VfDxu1d8Kp55hTLCboGCNAFf5cvGTw+emCd/kDTa3DK7Ztzcs+r98
        1GVdruAnoneNSAu/kaZhmBlpPj1HoW0=
X-Google-Smtp-Source: ACHHUZ66pbIUfdsFfc/i4PVo6F1xmrPBh+mU1/jwMkD01n6BBtThtY/m5Wyk9SJ5D360pCbgsocKWQ==
X-Received: by 2002:a17:902:e414:b0:1a2:87a2:c910 with SMTP id m20-20020a170902e41400b001a287a2c910mr2419676ple.53.1682637234695;
        Thu, 27 Apr 2023 16:13:54 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-59-129-171.hsd1.or.comcast.net. [71.59.129.171])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902aa4500b001a24cded097sm12112369plr.236.2023.04.27.16.13.53
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 16:13:53 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [BlueZ PATCH v3 1/9] media: Fix not storing Preferred Delay properly
Date:   Thu, 27 Apr 2023 16:13:44 -0700
Message-Id: <20230427231352.576337-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.40.0
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

Preferred Delay properties were being stored as qos->pd_* instead of
qos->ppd_*.
---
 profiles/audio/media.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/profiles/audio/media.c b/profiles/audio/media.c
index 52c4bd80a94c..6ce668e31303 100644
--- a/profiles/audio/media.c
+++ b/profiles/audio/media.c
@@ -1483,11 +1483,11 @@ static int parse_properties(DBusMessageIter *props, const char **uuid,
 		} else if (strcasecmp(key, "PreferredMinimumDelay") == 0) {
 			if (var != DBUS_TYPE_UINT16)
 				return -EINVAL;
-			dbus_message_iter_get_basic(&value, &qos->pd_min);
+			dbus_message_iter_get_basic(&value, &qos->ppd_min);
 		} else if (strcasecmp(key, "PreferredMaximumDelay") == 0) {
 			if (var != DBUS_TYPE_UINT16)
 				return -EINVAL;
-			dbus_message_iter_get_basic(&value, &qos->pd_max);
+			dbus_message_iter_get_basic(&value, &qos->ppd_max);
 		}
 
 		dbus_message_iter_next(props);
-- 
2.40.0

