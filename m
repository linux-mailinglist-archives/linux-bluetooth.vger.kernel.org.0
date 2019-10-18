Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03EDDC313
	for <lists+linux-bluetooth@lfdr.de>; Fri, 18 Oct 2019 12:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407554AbfJRKxp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 18 Oct 2019 06:53:45 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37043 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392070AbfJRKxo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 18 Oct 2019 06:53:44 -0400
Received: by mail-lj1-f193.google.com with SMTP id l21so5754879lje.4
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Oct 2019 03:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9zwqLAWFvZ+5qGkEdYMahhM0DMFLMnHB0baoXOUOZ5o=;
        b=ZfM7pdUDj/l8Tq9C2zhBth5oVN4F6OM0urXwMeYbzQMJTOvCvTakUGkbQ95bZU+VBL
         vB0VuWZwB++J8jNFAVvELmPihGumTAXvT84k0KfD8Y4arcUYHcQhTZDvchTyWhqV1coU
         QyZ0T2agDV6h9cy23wP2S9c6HKZ6CItdPC0jioCG226mn/WPE7AtEidrvKBaVI8vzr3a
         D34wUm2jzwW3S2NCOYess4bqqlN2+uPonAB6x5M1c1JDaWeVRlxHthdxj5XaxJpkbsK8
         lvv7FUGuEPcGNxdenuWq78Nw6k+/ZeEpBg3LBTWdDEsh6d5/6ZR88WusIAO4ptsOMkkZ
         UJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9zwqLAWFvZ+5qGkEdYMahhM0DMFLMnHB0baoXOUOZ5o=;
        b=NtrDUFqINeiFBYMnVNTMTcwmJ/uV7s7srnijh/dwbTMPtaSbGry8PSNFLoSbEkf4AW
         YGryviChUx99+NocnHQkFGTkuOzF3amB4W5rCfn22uDGuWFaAA0bHUBIBEvQhnz++qOC
         A4VOMil5kVapQ/g/6NET+E76j3RS//e77r2GrOjSlgVeod04yoGmL1jB/l7qTEUsrdAj
         JnIcvateqLlgompeHPcysF7rqAoreWYApCSQcdV3fIzVnh1sUXzXSZ0K5HzTahdWzY8u
         /gTCtpXUiJpoylNp/lLZUyszNH62BzHbK1O1Ln5XQD+bFarWN9EjXGte9HFQcNujMwEm
         mFqA==
X-Gm-Message-State: APjAAAV5GaifnlGDP166AazLlAzIeI0WtFaPHc7AYI+xgUmtvqaa6mlV
        QH/ImgcMPMT3pBWw+IDcbtuI9uyu174=
X-Google-Smtp-Source: APXvYqwZDBjfw/miV731z7Sg9psNjisAdn0UXRGfK36PsJw0IFv1wVwN4VqwwDdXtKTVpH2P4OG8xA==
X-Received: by 2002:a2e:9981:: with SMTP id w1mr5606767lji.205.1571396022125;
        Fri, 18 Oct 2019 03:53:42 -0700 (PDT)
Received: from vudentzs-t460s.www.huaweimobilewifi.com (83-245-240-49-nat-p.elisa-mobile.fi. [83.245.240.49])
        by smtp.gmail.com with ESMTPSA id r19sm2397469ljd.95.2019.10.18.03.53.40
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 03:53:40 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ] a2dp: Remove experimental flag for remote MediaEndpoint
Date:   Fri, 18 Oct 2019 13:53:39 +0300
Message-Id: <20191018105339.1297-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This makes the MediaEndpoint and stable API for remote endpoints which
aligns with RegisterApplication API which is already stable.
---
 profiles/audio/a2dp.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/profiles/audio/a2dp.c b/profiles/audio/a2dp.c
index f98ec8505..e8262cdfe 100644
--- a/profiles/audio/a2dp.c
+++ b/profiles/audio/a2dp.c
@@ -1761,7 +1761,7 @@ static DBusMessage *set_configuration(DBusConnection *conn, DBusMessage *msg,
 }
 
 static const GDBusMethodTable sep_methods[] = {
-	{ GDBUS_EXPERIMENTAL_ASYNC_METHOD("SetConfiguration",
+	{ GDBUS_ASYNC_METHOD("SetConfiguration",
 					GDBUS_ARGS({ "endpoint", "o" },
 						{ "properties", "a{sv}" } ),
 					NULL, set_configuration) },
@@ -1837,14 +1837,10 @@ static gboolean get_device(const GDBusPropertyTable *property,
 }
 
 static const GDBusPropertyTable sep_properties[] = {
-	{ "UUID", "s", get_uuid, NULL, NULL,
-					G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
-	{ "Codec", "y", get_codec, NULL, NULL,
-					G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
-	{ "Capabilities", "ay", get_capabilities, NULL, NULL,
-					G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
-	{ "Device", "o", get_device, NULL, NULL,
-					G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
+	{ "UUID", "s", get_uuid, NULL, NULL },
+	{ "Codec", "y", get_codec, NULL, NULL },
+	{ "Capabilities", "ay", get_capabilities, NULL, NULL },
+	{ "Device", "o", get_device, NULL, NULL },
 	{ }
 };
 
@@ -1862,9 +1858,6 @@ static void register_remote_sep(void *data, void *user_data)
 	sep->chan = chan;
 	sep->sep = rsep;
 
-	if (!(g_dbus_get_flags() & G_DBUS_FLAG_ENABLE_EXPERIMENTAL))
-		goto done;
-
 	if (asprintf(&sep->path, "%s/sep%d",
 				device_get_path(chan->device),
 				avdtp_get_seid(rsep)) < 0) {
-- 
2.21.0

