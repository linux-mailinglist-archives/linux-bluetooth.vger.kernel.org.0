Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC407B0E39
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Sep 2023 23:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbjI0VkW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Sep 2023 17:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjI0VkU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Sep 2023 17:40:20 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E6AD6
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Sep 2023 14:40:17 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-57b67c84999so6537796eaf.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Sep 2023 14:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695850816; x=1696455616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7LYirlf9dOaUzJulMGXdd1bw4TsoU8BSK/GBa/WWho8=;
        b=GxtfODHNB/bguWj9/QTTWrcV3cZfSeitcus7CL3bfIE6Rqfb8gSBoIkyrtMjGKAc/s
         i2iMRabdk992ExBSbRbwUOyBBOgaae7clKyV4x+hxqY/ShfpxgTCiIcYUjGTBTCx/o8f
         wEck2c1RYhFcRktKKad+OWTcmZigVOOFGTM2aojahLP6tbKIMoVlrZA+NLxQv2nD2nEs
         7LYBlXUaIy3narNPmisVO02g+fhkH/q9g9pL9MjhuVgWKgPCFJ2JvsblSrcbuWdnWftf
         BGWxAUR7Zdkzl/kIOm/c0W3Xku9AS/wBkgtPU/ho5/ONHsF4NtGQKau4Sjr2fxloopjg
         H7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695850816; x=1696455616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LYirlf9dOaUzJulMGXdd1bw4TsoU8BSK/GBa/WWho8=;
        b=TmvJw7aCqBf/ryraYUSjou6Gv9u4Z6Y9mnJFcfYWoVdoGbiSC1wpjCiH3C9ZuKgyTl
         SirIpxH+rE7ex0VypT4ZfWnyYvKH3Q9O5OWftpFstFVOi1W4iAROxRGTVDU6d60gCNiC
         gwhU1ciU+sxHtr+mZThw8k3NbRNIQU7OF8BXcHdC7V6mfkRJs2653yUCJ/9TiPLhcjXg
         deGpOtn/1b/p5Qp0Jilbg22TooXWXdpR1OeARqu1K6l4MaaKfH+khyV0ehxtarz8seG1
         bz4tccr5PkcLlyTkRk7qDURXxnRTC5/vcWsOd9VY1DyTEDl1MOTCGnJMCJBfyi6Ea1rs
         YvGA==
X-Gm-Message-State: AOJu0Yzdb3K5v2Rqj9ntvuKqES5LAxtNspRNyj5WJP0utuvl15HXAnyI
        SKqCczb6o+uof2pjrTslNYNlkPoHGOUuESAz
X-Google-Smtp-Source: AGHT+IFqdokrHf8lrbSFTrxxzbqIzTWI8m+2S043ylXzTNE/s0YC0cwWAme4K9mRIjyjaKHR34zvJQ==
X-Received: by 2002:a05:6358:5913:b0:143:9425:e2b6 with SMTP id g19-20020a056358591300b001439425e2b6mr4823155rwf.2.1695850815621;
        Wed, 27 Sep 2023 14:40:15 -0700 (PDT)
Received: from lvondent-mobl4.. (c-98-232-221-87.hsd1.or.comcast.net. [98.232.221.87])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b00672ea40b8a9sm12546004pfe.170.2023.09.27.14.40.14
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 14:40:14 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 05/12] client: Make Endpoint.SelectProperties reply properly
Date:   Wed, 27 Sep 2023 14:39:56 -0700
Message-ID: <20230927214003.1873224-6-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927214003.1873224-1-luiz.dentz@gmail.com>
References: <20230927214003.1873224-1-luiz.dentz@gmail.com>
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

This makes Endpoint.SelectProperties reply with QoS property since it
is now a single property.
---
 client/player.c | 316 +++++++++++++++++++++++++++---------------------
 client/print.c  |  16 ++-
 2 files changed, 188 insertions(+), 144 deletions(-)

diff --git a/client/player.c b/client/player.c
index d72ad6a5da01..6953eff28543 100644
--- a/client/player.c
+++ b/client/player.c
@@ -1199,7 +1199,7 @@ static const struct capabilities {
 struct codec_qos {
 	uint32_t interval;
 	uint8_t  framing;
-	char *phy;
+	uint8_t  phy;
 	uint16_t sdu;
 	uint8_t  rtn;
 	uint16_t latency;
@@ -1274,22 +1274,22 @@ static struct codec_preset sbc_presets[] = {
 	QOS_CONFIG(_interval, 0x01, _phy, _sdu, _rtn, _latency, _delay)
 
 #define QOS_UNFRAMED_1M(_interval, _sdu, _rtn, _latency, _delay) \
-	QOS_UNFRAMED(_interval, "1M", _sdu, _rtn, _latency, _delay) \
+	QOS_UNFRAMED(_interval, 0x01, _sdu, _rtn, _latency, _delay) \
 
 #define QOS_FRAMED_1M(_interval, _sdu, _rtn, _latency, _delay) \
-	QOS_FRAMED(_interval, "1M", _sdu, _rtn, _latency, _delay) \
+	QOS_FRAMED(_interval, 0x01, _sdu, _rtn, _latency, _delay) \
 
 #define QOS_UNFRAMED_2M(_interval, _sdu, _rtn, _latency, _delay) \
-	QOS_UNFRAMED(_interval, "2M", _sdu, _rtn, _latency, _delay) \
+	QOS_UNFRAMED(_interval, 0x02, _sdu, _rtn, _latency, _delay) \
 
 #define QOS_FRAMED_2M(_interval, _sdu, _rtn, _latency, _delay) \
-	QOS_FRAMED(_interval, "2M", _sdu, _rtn, _latency, _delay) \
+	QOS_FRAMED(_interval, 0x02, _sdu, _rtn, _latency, _delay) \
 
 #define LC3_7_5_UNFRAMED(_sdu, _rtn, _latency, _delay) \
-	QOS_UNFRAMED(7500u, "2M", _sdu, _rtn, _latency, _delay)
+	QOS_UNFRAMED(7500u, 0x02, _sdu, _rtn, _latency, _delay)
 
 #define LC3_7_5_FRAMED(_sdu, _rtn, _latency, _delay) \
-	QOS_FRAMED(7500u, "2M", _sdu, _rtn, _latency, _delay)
+	QOS_FRAMED(7500u, 0x02, _sdu, _rtn, _latency, _delay)
 
 #define LC3_10_UNFRAMED(_sdu, _rtn, _latency, _delay) \
 	QOS_UNFRAMED_2M(10000u, _sdu, _rtn, _latency, _delay)
@@ -1770,14 +1770,174 @@ static struct bt_iso_qos bcast_qos = {
 	}
 };
 
+static void append_io_qos(DBusMessageIter *iter, struct endpoint_config *cfg)
+{
+	struct codec_qos *qos = (void *)cfg->qos;
+
+	bt_shell_printf("Interval %u\n", qos->interval);
+
+	g_dbus_dict_append_entry(iter, "Interval", DBUS_TYPE_UINT32,
+						&qos->interval);
+
+	bt_shell_printf("PHY 0x%02x\n", qos->phy);
+
+	g_dbus_dict_append_entry(iter, "PHY", DBUS_TYPE_BYTE, &qos->phy);
+
+	bt_shell_printf("SDU %u\n", cfg->qos->sdu);
+
+	g_dbus_dict_append_entry(iter, "SDU", DBUS_TYPE_UINT16, &qos->sdu);
+
+	bt_shell_printf("Retransmissions %u\n", qos->rtn);
+
+	g_dbus_dict_append_entry(iter, "Retransmissions",
+					DBUS_TYPE_BYTE, &qos->rtn);
+
+	bt_shell_printf("Latency %u\n", qos->latency);
+
+	g_dbus_dict_append_entry(iter, "Latency",
+					DBUS_TYPE_UINT16, &qos->latency);
+}
+
+static void append_ucast_qos(DBusMessageIter *iter, struct endpoint_config *cfg)
+{
+	struct codec_qos *qos = (void *)cfg->qos;
+
+	if (cfg->ep->iso_group != BT_ISO_QOS_GROUP_UNSET) {
+		bt_shell_printf("CIG 0x%2.2x\n", cfg->ep->iso_group);
+		g_dbus_dict_append_entry(iter, "CIG", DBUS_TYPE_BYTE,
+							&cfg->ep->iso_group);
+	}
+
+	if (cfg->ep->iso_stream != BT_ISO_QOS_STREAM_UNSET) {
+		bt_shell_printf("CIS 0x%2.2x\n", cfg->ep->iso_stream);
+		g_dbus_dict_append_entry(iter, "CIS", DBUS_TYPE_BYTE,
+							&cfg->ep->iso_stream);
+	}
+
+	bt_shell_printf("Framing 0x%02x\n", qos->framing);
+
+	g_dbus_dict_append_entry(iter, "Framing", DBUS_TYPE_BYTE,
+							&qos->framing);
+
+	bt_shell_printf("PresentationDelay %u\n", qos->delay);
+
+	g_dbus_dict_append_entry(iter, "PresentationDelay",
+					DBUS_TYPE_UINT32, &qos->delay);
+
+	if (cfg->target_latency) {
+		bt_shell_printf("TargetLatency 0x%02x\n", cfg->target_latency);
+		g_dbus_dict_append_entry(iter, "TargetLatency",
+					DBUS_TYPE_BYTE, &cfg->target_latency);
+	}
+
+	append_io_qos(iter, cfg);
+}
+
+static void append_bcast_qos(DBusMessageIter *iter, struct endpoint_config *cfg)
+{
+	if (bcast_qos.bcast.big != BT_ISO_QOS_BIG_UNSET) {
+		bt_shell_printf("BIG 0x%2.2x\n", bcast_qos.bcast.big);
+		g_dbus_dict_append_entry(iter, "BIG", DBUS_TYPE_BYTE,
+							&bcast_qos.bcast.big);
+	}
+
+	if (bcast_qos.bcast.bis != BT_ISO_QOS_BIS_UNSET) {
+		bt_shell_printf("BIS 0x%2.2x\n", bcast_qos.bcast.bis);
+		g_dbus_dict_append_entry(iter, "BIS", DBUS_TYPE_BYTE,
+							&bcast_qos.bcast.bis);
+	}
+
+	bt_shell_printf("Framing 0x%02x\n", bcast_qos.bcast.framing);
+
+	g_dbus_dict_append_entry(iter, "Framing", DBUS_TYPE_BYTE,
+						&bcast_qos.bcast.framing);
+
+	bt_shell_printf("SyncFactor %u\n", bcast_qos.bcast.sync_factor);
+
+	g_dbus_dict_append_entry(iter, "SyncFactor", DBUS_TYPE_BYTE,
+						&bcast_qos.bcast.sync_factor);
+
+	bt_shell_printf("Options %u\n", bcast_qos.bcast.options);
+
+	g_dbus_dict_append_entry(iter, "Options", DBUS_TYPE_BYTE,
+						&bcast_qos.bcast.options);
+
+	bt_shell_printf("Skip %u\n", bcast_qos.bcast.skip);
+
+	g_dbus_dict_append_entry(iter, "Skip", DBUS_TYPE_UINT16,
+						&bcast_qos.bcast.skip);
+
+	bt_shell_printf("SyncTimeout %u\n", bcast_qos.bcast.sync_timeout);
+
+	g_dbus_dict_append_entry(iter, "SyncTimeout", DBUS_TYPE_UINT16,
+						&bcast_qos.bcast.sync_timeout);
+
+	bt_shell_printf("SyncCteType %u\n", bcast_qos.bcast.sync_cte_type);
+
+	g_dbus_dict_append_entry(iter, "SyncType", DBUS_TYPE_BYTE,
+					&bcast_qos.bcast.sync_cte_type);
+
+	bt_shell_printf("MSE %u\n", bcast_qos.bcast.mse);
+
+	g_dbus_dict_append_entry(iter, "MSE", DBUS_TYPE_BYTE,
+						&bcast_qos.bcast.mse);
+
+	bt_shell_printf("Timeout %u\n", bcast_qos.bcast.timeout);
+
+	g_dbus_dict_append_entry(iter, "Timeout", DBUS_TYPE_UINT16,
+						&bcast_qos.bcast.timeout);
+
+	if (cfg->ep->bcode) {
+		const char *key = "BCode";
+
+		bt_shell_printf("BCode:\n");
+		bt_shell_hexdump(cfg->ep->bcode->iov_base,
+				cfg->ep->bcode->iov_len);
+
+		g_dbus_dict_append_basic_array(iter, DBUS_TYPE_STRING,
+						&key, DBUS_TYPE_BYTE,
+						&cfg->ep->bcode->iov_base,
+						cfg->ep->bcode->iov_len);
+	}
+
+	append_io_qos(iter, cfg);
+}
+
+static void append_qos(DBusMessageIter *iter, struct endpoint_config *cfg)
+{
+	DBusMessageIter entry, var, dict;
+	struct codec_qos *qos = (void *)cfg->qos;
+	const char *key = "QoS";
+
+	if (!qos)
+		return;
+
+	dbus_message_iter_open_container(iter, DBUS_TYPE_DICT_ENTRY,
+						NULL, &entry);
+
+	dbus_message_iter_append_basic(&entry, DBUS_TYPE_STRING, &key);
+
+	dbus_message_iter_open_container(&entry, DBUS_TYPE_VARIANT,
+						"a{sv}", &var);
+
+	dbus_message_iter_open_container(&var, DBUS_TYPE_ARRAY, "{sv}",
+					&dict);
+
+	if (cfg->ep->broadcast)
+		append_bcast_qos(&dict, cfg);
+	else
+		append_ucast_qos(&dict, cfg);
+
+	dbus_message_iter_close_container(&var, &dict);
+	dbus_message_iter_close_container(&entry, &var);
+	dbus_message_iter_close_container(iter, &entry);
+}
+
 static void append_properties(DBusMessageIter *iter,
 						struct endpoint_config *cfg)
 {
 	DBusMessageIter dict;
-	struct codec_qos *qos = (void *)cfg->qos;
 	const char *key = "Capabilities";
-	const char *meta = "Metadata";
-	const char *keyBCode = "BroadcastCode";
 
 	dbus_message_iter_open_container(iter, DBUS_TYPE_ARRAY, "{sv}", &dict);
 
@@ -1789,6 +1949,8 @@ static void append_properties(DBusMessageIter *iter,
 					cfg->caps->iov_len);
 
 	if (cfg->meta && cfg->meta->iov_len) {
+		const char *meta = "Metadata";
+
 		g_dbus_dict_append_basic_array(&dict, DBUS_TYPE_STRING, &meta,
 				DBUS_TYPE_BYTE, &cfg->meta->iov_base,
 				cfg->meta->iov_len);
@@ -1797,132 +1959,8 @@ static void append_properties(DBusMessageIter *iter,
 		bt_shell_hexdump(cfg->meta->iov_base, cfg->meta->iov_len);
 	}
 
-	if (!qos)
-		goto done;
+	append_qos(&dict, cfg);
 
-	if (cfg->target_latency) {
-		bt_shell_printf("TargetLatency 0x%02x\n", qos->interval);
-		g_dbus_dict_append_entry(&dict, "TargetLatency",
-					DBUS_TYPE_BYTE, &cfg->target_latency);
-	}
-
-	if ((!cfg->ep->broadcast) &&
-			(cfg->ep->iso_group != BT_ISO_QOS_GROUP_UNSET)) {
-		bt_shell_printf("CIG 0x%2.2x\n", cfg->ep->iso_group);
-		g_dbus_dict_append_entry(&dict, "CIG", DBUS_TYPE_BYTE,
-							&cfg->ep->iso_group);
-	} else {
-		bt_shell_printf("BIG 0x%2.2x\n", bcast_qos.bcast.big);
-		g_dbus_dict_append_entry(&dict, "BIG", DBUS_TYPE_BYTE,
-							&bcast_qos.bcast.big);
-	}
-
-	if ((!cfg->ep->broadcast) &&
-			(cfg->ep->iso_stream != BT_ISO_QOS_STREAM_UNSET)) {
-		bt_shell_printf("CIS 0x%2.2x\n", cfg->ep->iso_stream);
-		g_dbus_dict_append_entry(&dict, "CIS", DBUS_TYPE_BYTE,
-							&cfg->ep->iso_stream);
-
-	} else {
-		bt_shell_printf("BIS 0x%2.2x\n", bcast_qos.bcast.bis);
-		g_dbus_dict_append_entry(&dict, "BIS", DBUS_TYPE_BYTE,
-							&bcast_qos.bcast.bis);
-	}
-
-	bt_shell_printf("Interval %u\n", qos->interval);
-
-	g_dbus_dict_append_entry(&dict, "Interval", DBUS_TYPE_UINT32,
-						&qos->interval);
-
-	if (!cfg->ep->broadcast) {
-		bt_shell_printf("Framing %s\n",
-					qos->framing ? "true" : "false");
-
-		g_dbus_dict_append_entry(&dict, "Framing", DBUS_TYPE_BOOLEAN,
-							&qos->framing);
-	} else {
-		bt_shell_printf("Framing %s\n",
-				bcast_qos.bcast.framing ? "true" : "false");
-
-		g_dbus_dict_append_entry(&dict, "Framing", DBUS_TYPE_BOOLEAN,
-						&bcast_qos.bcast.framing);
-	}
-
-	bt_shell_printf("PHY %s\n", qos->phy);
-
-	g_dbus_dict_append_entry(&dict, "PHY", DBUS_TYPE_STRING, &qos->phy);
-
-	bt_shell_printf("SDU %u\n", cfg->qos->sdu);
-
-	g_dbus_dict_append_entry(&dict, "SDU", DBUS_TYPE_UINT16, &qos->sdu);
-
-	bt_shell_printf("Retransmissions %u\n", qos->rtn);
-
-	g_dbus_dict_append_entry(&dict, "Retransmissions", DBUS_TYPE_BYTE,
-						&qos->rtn);
-
-	bt_shell_printf("Latency %u\n", qos->latency);
-
-	g_dbus_dict_append_entry(&dict, "Latency", DBUS_TYPE_UINT16,
-						&qos->latency);
-
-	bt_shell_printf("Delay %u\n", qos->delay);
-
-	g_dbus_dict_append_entry(&dict, "Delay", DBUS_TYPE_UINT32,
-						&qos->delay);
-
-	if (!cfg->ep->broadcast)
-		goto done;
-
-	bt_shell_printf("SyncInterval %u\n", bcast_qos.bcast.sync_factor);
-
-	g_dbus_dict_append_entry(&dict, "SyncInterval", DBUS_TYPE_BYTE,
-						&bcast_qos.bcast.sync_factor);
-
-	bt_shell_printf("Encryption %u\n", bcast_qos.bcast.encryption);
-
-	g_dbus_dict_append_entry(&dict, "Encryption", DBUS_TYPE_BYTE,
-						&bcast_qos.bcast.encryption);
-
-	bt_shell_printf("Options %u\n", bcast_qos.bcast.options);
-
-	g_dbus_dict_append_entry(&dict, "Options", DBUS_TYPE_BYTE,
-						&bcast_qos.bcast.options);
-
-	bt_shell_printf("Skip %u\n", bcast_qos.bcast.skip);
-
-	g_dbus_dict_append_entry(&dict, "Skip", DBUS_TYPE_UINT16,
-						&bcast_qos.bcast.skip);
-
-	bt_shell_printf("SyncTimeout %u\n", bcast_qos.bcast.sync_timeout);
-
-	g_dbus_dict_append_entry(&dict, "SyncTimeout", DBUS_TYPE_UINT16,
-						&bcast_qos.bcast.sync_timeout);
-
-	bt_shell_printf("SyncCteType %u\n", bcast_qos.bcast.sync_cte_type);
-
-	g_dbus_dict_append_entry(&dict, "SyncCteType", DBUS_TYPE_BYTE,
-					&bcast_qos.bcast.sync_cte_type);
-
-	bt_shell_printf("MSE %u\n", bcast_qos.bcast.mse);
-
-	g_dbus_dict_append_entry(&dict, "MSE", DBUS_TYPE_BYTE,
-						&bcast_qos.bcast.mse);
-
-	bt_shell_printf("Timeout %u\n", bcast_qos.bcast.timeout);
-
-	g_dbus_dict_append_entry(&dict, "Timeout", DBUS_TYPE_UINT16,
-						&bcast_qos.bcast.timeout);
-
-	bt_shell_printf("BroadcastCode:\n");
-	bt_shell_hexdump(cfg->ep->bcode->iov_base, cfg->ep->bcode->iov_len);
-
-	g_dbus_dict_append_basic_array(&dict, DBUS_TYPE_STRING, &keyBCode,
-						DBUS_TYPE_BYTE,
-						&cfg->ep->bcode->iov_base,
-						cfg->ep->bcode->iov_len);
-
-done:
 	dbus_message_iter_close_container(iter, &dict);
 }
 
@@ -2892,9 +2930,9 @@ static void custom_phy(const char *input, void *user_data)
 	struct codec_qos *qos = (void *)&p->qos;
 
 	if (!strcmp(input, "1M"))
-		qos->phy = "1M";
+		qos->phy = 0x01;
 	else if (!strcmp(input, "2M"))
-		qos->phy = "2M";
+		qos->phy = 0x02;
 	else {
 		char *endptr = NULL;
 		uint8_t phy = strtol(input, &endptr, 0);
@@ -2906,10 +2944,8 @@ static void custom_phy(const char *input, void *user_data)
 
 		switch (phy) {
 		case 0x01:
-			qos->phy = "1M";
-			break;
 		case 0x02:
-			qos->phy = "2M";
+			qos->phy = phy;
 			break;
 		default:
 			bt_shell_printf("Invalid argument: %s\n", input);
diff --git a/client/print.c b/client/print.c
index 66439e541307..8d721e21df4b 100644
--- a/client/print.c
+++ b/client/print.c
@@ -165,11 +165,19 @@ void print_iter(const char *label, const char *name, DBusMessageIter *iter)
 		break;
 	case DBUS_TYPE_DICT_ENTRY:
 		dbus_message_iter_recurse(iter, &subiter);
-		entry = g_strconcat(name, " Key", NULL);
-		print_iter(label, entry, &subiter);
-		g_free(entry);
 
-		entry = g_strconcat(name, " Value", NULL);
+		if (dbus_message_iter_get_arg_type(&subiter) ==
+						DBUS_TYPE_STRING) {
+			dbus_message_iter_get_basic(&subiter, &valstr);
+			entry = g_strconcat(name, ".", valstr, NULL);
+		} else {
+			entry = g_strconcat(name, ".Key", NULL);
+			print_iter(label, entry, &subiter);
+			g_free(entry);
+
+			entry = g_strconcat(name, ".Value", NULL);
+		}
+
 		dbus_message_iter_next(&subiter);
 		print_iter(label, entry, &subiter);
 		g_free(entry);
-- 
2.41.0

