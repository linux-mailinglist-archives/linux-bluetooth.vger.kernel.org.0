Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB8C4C0EB8
	for <lists+linux-bluetooth@lfdr.de>; Wed, 23 Feb 2022 10:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239141AbiBWJBf (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 23 Feb 2022 04:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237086AbiBWJBf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 23 Feb 2022 04:01:35 -0500
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845757CDF2
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Feb 2022 01:01:04 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id E5691200014
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Feb 2022 09:00:59 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] adapter-api: Document per-client discovery sessions
Date:   Wed, 23 Feb 2022 10:00:59 +0100
Message-Id: <20220223090059.310361-1-hadess@hadess.net>
X-Mailer: git-send-email 2.35.1
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

The fact that each client can start its own discovery wasn't clear from
the documentation and only becomes obvious when reading the sources.
---
 doc/adapter-api.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/doc/adapter-api.txt b/doc/adapter-api.txt
index 490608e8d..48466ab75 100644
--- a/doc/adapter-api.txt
+++ b/doc/adapter-api.txt
@@ -21,6 +21,9 @@ Methods		void StartDiscovery()
 
 			During discovery RSSI delta-threshold is imposed.
 
+			Each client can request a single device discovery session
+			per adapter.
+
 			Possible errors: org.bluez.Error.NotReady
 					 org.bluez.Error.Failed
 					 org.bluez.Error.InProgress
@@ -32,7 +35,8 @@ Methods		void StartDiscovery()
 
 			Note that a discovery procedure is shared between all
 			discovery sessions thus calling StopDiscovery will only
-			release a single session.
+			release a single session and discovery will stop when
+			all sessions from all clients have finished.
 
 			Possible errors: org.bluez.Error.NotReady
 					 org.bluez.Error.Failed
-- 
2.35.1

