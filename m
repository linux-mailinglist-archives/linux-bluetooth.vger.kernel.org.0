Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2F41C201A
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 May 2020 23:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgEAVyN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 1 May 2020 17:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgEAVyN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 1 May 2020 17:54:13 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291D1C061A0C
        for <linux-bluetooth@vger.kernel.org>; Fri,  1 May 2020 14:54:13 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id n16so5115739pgb.7
        for <linux-bluetooth@vger.kernel.org>; Fri, 01 May 2020 14:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=25KrmZLstr4uO9UYmK+Uj+qFv1V099RFeJXjquRrZhw=;
        b=cvLqE54IsXgkOjzo06Li65jtMq+hL63YSZbwNc8zEjzMM5aqLsBMLXGJJ66OXPiy8J
         cu/Cs/vpkkc8TL0Pt5RdArJw8/CvnIOdLShDY4OKEgTChKnC8J7aRjOK38bD9+HcBj1N
         xm6a2p79tmFxaF5nCY68pf9T3CCWJr6qBapuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=25KrmZLstr4uO9UYmK+Uj+qFv1V099RFeJXjquRrZhw=;
        b=AhbZubAYntVzMHRTcGI/v8aq6GrCsxjavDigpZYiB3xrdM/+J+NAWgljZ4Rg6ealhv
         rneVLtwmNvdOAGrCAbPI9uQ8WNR4Txm1JcBaOovD65HJxA3POLPOhEW+vB3+NeMqS+bK
         L6002oJ/2lUP5yHC1efVut1Z1vKOjGd2hHCWjD6B+wWRra2gzTSO5sTzjGudEuD/9eSA
         UMDT4rywbtUXuBPgC5e389tfNVwCiRn4e/3aVutSMdHUhjsUV2BeokjS6MujTjKXZpyx
         2RqvuQTr6g3epQc/7bqXS5b844bfcSdDodwdvy29nk71IiiHOeerAhMfWUa80ebZJd70
         lROw==
X-Gm-Message-State: AGi0PuZaVfcJIdU2j8vqwr7CDNRryDmCMbtrF44K05MDybTRmGvZveCb
        Isf60WWSLeBNla7T9Y548clrhs9Yznc=
X-Google-Smtp-Source: APiQypJDcRveY2tbE+rGI9WVakxjweD7FmWeEKdXz5cyVYaPBya2ssoRZcwSB17kY0MXjNqwnkqtpw==
X-Received: by 2002:a63:c70e:: with SMTP id n14mr5941756pgg.249.1588370052453;
        Fri, 01 May 2020 14:54:12 -0700 (PDT)
Received: from localhost.localdomain (c-73-231-41-185.hsd1.ca.comcast.net. [73.231.41.185])
        by smtp.googlemail.com with ESMTPSA id z5sm2034729pfz.109.2020.05.01.14.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 14:54:11 -0700 (PDT)
From:   Sonny Sasaka <sonnysasaka@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sonny Sasaka <sonnysasaka@chromium.org>
Subject: [PATCH] build: Add option to disable battery profile
Date:   Fri,  1 May 2020 14:53:52 -0700
Message-Id: <20200501215352.23858-1-sonnysasaka@chromium.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Some clients may want to handle battery profile through the generic GATT
interface rather than BlueZ's internal Battery interface.
---
 Makefile.plugins | 2 ++
 configure.ac     | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Makefile.plugins b/Makefile.plugins
index 98eee9ec8..b9733d31c 100644
--- a/Makefile.plugins
+++ b/Makefile.plugins
@@ -101,8 +101,10 @@ builtin_cppflags += $(ALSA_CFLAGS)
 builtin_ldadd += $(ALSA_LIBS)
 endif
 
+if BATTERY
 builtin_modules += battery
 builtin_sources += profiles/battery/battery.c
+endif
 
 if SIXAXIS
 plugin_LTLIBRARIES += plugins/sixaxis.la
diff --git a/configure.ac b/configure.ac
index 1433ace4a..d4fa862b5 100644
--- a/configure.ac
+++ b/configure.ac
@@ -181,6 +181,10 @@ AC_ARG_ENABLE(hog, AC_HELP_STRING([--disable-hog],
 		[disable HoG profile]), [enable_hog=${enableval}])
 AM_CONDITIONAL(HOG, test "${enable_hog}" != "no")
 
+AC_ARG_ENABLE(battery, AC_HELP_STRING([--disable-battery],
+		[disable battery profile]), [enable_battery=${enableval}])
+AM_CONDITIONAL(BATTERY, test "${enable_battery}" != "no")
+
 AC_ARG_ENABLE(health, AC_HELP_STRING([--enable-health],
 		[enable health profiles]), [enable_health=${enableval}])
 AM_CONDITIONAL(HEALTH, test "${enable_health}" = "yes")
-- 
2.17.1

