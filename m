Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50294189DD
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 May 2019 14:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfEIMht (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 May 2019 08:37:49 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:43625 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726438AbfEIMht (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 May 2019 08:37:49 -0400
Received: from classic.redhat.com (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 99243100005;
        Thu,  9 May 2019 12:37:47 +0000 (UTC)
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 1/8] build: Add a few default configure options
Date:   Thu,  9 May 2019 14:37:39 +0200
Message-Id: <20190509123746.8396-1-hadess@hadess.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add 3 optional features that are currently used and distributed in
the Fedora packages to the default build configuration.

The additional build time is minimal, and it ensures that the build
gets maximum coverage.
---
 bootstrap-configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bootstrap-configure b/bootstrap-configure
index cc44ae74f..2d6231f39 100755
--- a/bootstrap-configure
+++ b/bootstrap-configure
@@ -26,4 +26,7 @@ fi
 		--enable-mesh \
 		--enable-btpclient \
 		--enable-logger \
+		--enable-pie \
+		--enable-cups \
+		--enable-library \
 		--disable-datafiles $*
-- 
2.21.0

