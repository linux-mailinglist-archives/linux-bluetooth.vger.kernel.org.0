Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 511E95EC45
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Jul 2019 21:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbfGCTIw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Jul 2019 15:08:52 -0400
Received: from mail-lj1-f172.google.com ([209.85.208.172]:40587 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfGCTIv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Jul 2019 15:08:51 -0400
Received: by mail-lj1-f172.google.com with SMTP id a21so3637818ljh.7
        for <linux-bluetooth@vger.kernel.org>; Wed, 03 Jul 2019 12:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aoEXYtCpaKYFu4HRzFOS+tAV4d5Uib4DQX6NqoSy0Io=;
        b=B8zFC+8EN3wSvH4LlkoB9jRFeQvlbx4ByRO7RfU4jwAbYzxuI6cKigTDy2Dvd0XKLo
         QbzA08lDJAx10h9JqTJ9cpd16R9R0JHGx+iVvzAeGiYv6/CpaeOLJOTHLHat9mPKDmPa
         6WXL+Aie+++zP32yWc/p+WUYPd1ZrVwnGv758x6oP5RpFhjPutOmECIMUvUjwTU9jcNX
         8AmNHRlyCgj/oYiW0zsYVF0p+tFZ8ZWzpTiG9KTfltGTOFdARhzmfEUSJAuXPxAo8Zaz
         G2T9hb/wJnq6rOGe4Oyxu3kffIFMiyQYNYok+Ma/5cWzPdtekA0hvej92D+6nUS30XYQ
         0J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aoEXYtCpaKYFu4HRzFOS+tAV4d5Uib4DQX6NqoSy0Io=;
        b=SfL7qikj3OZ+8AlT+ov3GWLFvqcG5HEEtfhG8ecBTaI8cIZsGanrncpQ9slNU3gBWK
         cgpUg7HJaQWZFKbJM42Jv2exlAPNo8EG5d0cgJnOQo1WJT5W2ZwhlWCu7Y54UpNG6q+/
         wpBdUXQRx9Na4ZNoLgspnaibKkUMqMILZtvpGWP9IF2YoFpSGD2gZ3Z59SnLb07Ac/Oo
         SOPLIMPMGrjqKcbgx3V7whcdg3Vzo7PMV0t0VKhTA5n+MbMqFPXa4K+njv+PI64HziQX
         +Qp7QGMOM4Hs9f02BNHU2JSu6/OIDGMTd4gkbJn5mVTybc7C3yGa4yarPCzqA7gE67Gc
         +UjQ==
X-Gm-Message-State: APjAAAWrCwsvyWVVip3X+WFLD5RnwV0kPF9rBR+zcZxnJhM+VRyc8FJS
        LFFSjg8J+p5GIGurlSMMWTDq6ZM0z+4=
X-Google-Smtp-Source: APXvYqwcNVtGmBA0GFjCSY31kRILYKoavSxSNsLwQAW8skCFR0nkTCnWiDcXW9eXt7LjXZKIRzufFw==
X-Received: by 2002:a2e:8559:: with SMTP id u25mr22127653ljj.224.1562180927878;
        Wed, 03 Jul 2019 12:08:47 -0700 (PDT)
Received: from kynes.internet.domowy (apn-77-112-37-101.dynamic.gprs.plus.pl. [77.112.37.101])
        by smtp.gmail.com with ESMTPSA id z12sm516946lfe.2.2019.07.03.12.08.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 12:08:47 -0700 (PDT)
From:   =?UTF-8?q?Micha=C5=82=20Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     =?UTF-8?q?Micha=C5=82=20=27Khorne=27=20Lowas-Rzechonek?= 
        <michal@rzechonek.net>
Subject: [PATCH BlueZ] mesh: Fix stack overflow in get_element_properties
Date:   Wed,  3 Jul 2019 21:08:33 +0200
Message-Id: <20190703190833.22039-1-michal.lowas-rzechonek@silvair.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Michał 'Khorne' Lowas-Rzechonek <michal@rzechonek.net>

D-Bus type 'q' denotes uint16, not uint8.
---
 mesh/node.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mesh/node.c b/mesh/node.c
index c73ba541f..f9be96cbd 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -1200,7 +1200,7 @@ static bool get_element_properties(struct mesh_node *node, const char *path,
 
 	while (l_dbus_message_iter_next_entry(properties, &key, &var)) {
 		if (!strcmp(key, "Location")) {
-			uint8_t loc;
+			uint16_t loc;
 
 			l_dbus_message_iter_get_variant(&var, "q", &loc);
 
-- 
2.20.1

