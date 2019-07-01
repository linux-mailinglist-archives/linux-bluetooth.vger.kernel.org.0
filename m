Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB005385BA
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 Jun 2019 09:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbfFGHvh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 7 Jun 2019 03:51:37 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:45415 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfFGHvh (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 7 Jun 2019 03:51:37 -0400
X-Originating-IP: 83.155.44.161
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3BB9A1C000C
        for <linux-bluetooth@vger.kernel.org>; Fri,  7 Jun 2019 07:51:34 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Subject: [RFC] tools: Fix build after y2038 changes in glibc
Date:   Fri,  7 Jun 2019 09:51:33 +0200
Message-Id: <20190607075133.11255-1-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The 32-bit SIOCGSTAMP has been deprecated. Use the deprecated name
to fix the build.
---
 tools/l2test.c | 6 +++++-
 tools/rctest.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/l2test.c b/tools/l2test.c
index e755ac881..e787c2ce2 100644
--- a/tools/l2test.c
+++ b/tools/l2test.c
@@ -55,6 +55,10 @@
 #define BREDR_DEFAULT_PSM	0x1011
 #define LE_DEFAULT_PSM		0x0080
 
+#ifndef SIOCGSTAMP_OLD
+#define SIOCGSTAMP_OLD SIOCGSTAMP
+#endif
+
 /* Test modes */
 enum {
 	SEND,
@@ -907,7 +911,7 @@ static void recv_mode(int sk)
 			if (timestamp) {
 				struct timeval tv;
 
-				if (ioctl(sk, SIOCGSTAMP, &tv) < 0) {
+				if (ioctl(sk, SIOCGSTAMP_OLD, &tv) < 0) {
 					timestamp = 0;
 					memset(ts, 0, sizeof(ts));
 				} else {
diff --git a/tools/rctest.c b/tools/rctest.c
index 94490f462..bc8ed875d 100644
--- a/tools/rctest.c
+++ b/tools/rctest.c
@@ -50,6 +50,10 @@
 
 #include "src/shared/util.h"
 
+#ifndef SIOCGSTAMP_OLD
+#define SIOCGSTAMP_OLD SIOCGSTAMP
+#endif
+
 /* Test modes */
 enum {
 	SEND,
@@ -505,7 +509,7 @@ static void recv_mode(int sk)
 			if (timestamp) {
 				struct timeval tv;
 
-				if (ioctl(sk, SIOCGSTAMP, &tv) < 0) {
+				if (ioctl(sk, SIOCGSTAMP_OLD, &tv) < 0) {
 					timestamp = 0;
 					memset(ts, 0, sizeof(ts));
 				} else {
-- 
2.21.0

