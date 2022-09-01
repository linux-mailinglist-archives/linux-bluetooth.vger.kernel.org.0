Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB4045A94EC
	for <lists+linux-bluetooth@lfdr.de>; Thu,  1 Sep 2022 12:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbiIAKnw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 1 Sep 2022 06:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234339AbiIAKno (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 1 Sep 2022 06:43:44 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D25F12CB20
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 03:43:41 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 9CB14240016
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 10:43:39 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v6 5/6] adapter: Fix typo in function name
Date:   Thu,  1 Sep 2022 12:43:30 +0200
Message-Id: <20220901104331.174588-5-hadess@hadess.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901104331.174588-1-hadess@hadess.net>
References: <20220901104331.174588-1-hadess@hadess.net>
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
index 11fde03b8..dc96b9718 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -3508,7 +3508,7 @@ static gboolean property_get_experimental(const GDBusPropertyTable *property,
 	return TRUE;
 }
 
-static gboolean property_experimental_exits(const GDBusPropertyTable *property,
+static gboolean property_experimental_exists(const GDBusPropertyTable *property,
 								void *data)
 {
 	struct btd_adapter *adapter = data;
@@ -3876,7 +3876,7 @@ static const GDBusPropertyTable adapter_properties[] = {
 					property_exists_modalias },
 	{ "Roles", "as", property_get_roles },
 	{ "ExperimentalFeatures", "as", property_get_experimental, NULL,
-					property_experimental_exits },
+					property_experimental_exists },
 	{ }
 };
 
-- 
2.37.2

