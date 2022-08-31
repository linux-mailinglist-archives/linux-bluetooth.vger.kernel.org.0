Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE1775A7C45
	for <lists+linux-bluetooth@lfdr.de>; Wed, 31 Aug 2022 13:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbiHaLgy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 31 Aug 2022 07:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiHaLgw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 31 Aug 2022 07:36:52 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64274AB4C1
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 Aug 2022 04:36:51 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id C47481C0015
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 Aug 2022 11:36:49 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v5 5/6] adapter: Fix typo in function name
Date:   Wed, 31 Aug 2022 13:36:46 +0200
Message-Id: <20220831113647.85110-5-hadess@hadess.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831113647.85110-1-hadess@hadess.net>
References: <20220831113647.85110-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 src/adapter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/adapter.c b/src/adapter.c
index 2e9e321e8..c4d6ca2d4 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -3464,7 +3464,7 @@ static gboolean property_get_experimental(const GDBusPropertyTable *property,
 	return TRUE;
 }
 
-static gboolean property_experimental_exits(const GDBusPropertyTable *property,
+static gboolean property_experimental_exists(const GDBusPropertyTable *property,
 								void *data)
 {
 	struct btd_adapter *adapter = data;
@@ -3832,7 +3832,7 @@ static const GDBusPropertyTable adapter_properties[] = {
 					property_exists_modalias },
 	{ "Roles", "as", property_get_roles },
 	{ "ExperimentalFeatures", "as", property_get_experimental, NULL,
-					property_experimental_exits },
+					property_experimental_exists },
 	{ }
 };
 
-- 
2.37.2

