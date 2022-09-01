Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12D585A94EF
	for <lists+linux-bluetooth@lfdr.de>; Thu,  1 Sep 2022 12:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234065AbiIAKnx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 1 Sep 2022 06:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234355AbiIAKnp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 1 Sep 2022 06:43:45 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC2212BF7C
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 03:43:40 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id DA567240013
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 10:43:38 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v6 3/6] client: Print the PowerState property
Date:   Thu,  1 Sep 2022 12:43:28 +0200
Message-Id: <20220901104331.174588-3-hadess@hadess.net>
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
 client/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/client/main.c b/client/main.c
index 6773d5262..2816e880f 100644
--- a/client/main.c
+++ b/client/main.c
@@ -981,6 +981,7 @@ static void cmd_show(int argc, char *argv[])
 	print_property(adapter->proxy, "Alias");
 	print_property(adapter->proxy, "Class");
 	print_property(adapter->proxy, "Powered");
+	print_property(adapter->proxy, "PowerState");
 	print_property(adapter->proxy, "Discoverable");
 	print_property(adapter->proxy, "DiscoverableTimeout");
 	print_property(adapter->proxy, "Pairable");
-- 
2.37.2

