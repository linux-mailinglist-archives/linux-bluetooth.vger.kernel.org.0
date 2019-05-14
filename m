Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D40001D061
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 May 2019 22:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfENUPp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 May 2019 16:15:45 -0400
Received: from mga05.intel.com ([192.55.52.43]:13417 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726036AbfENUPp (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 May 2019 16:15:45 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 May 2019 13:15:45 -0700
X-ExtLoop1: 1
Received: from bgix-dell-lap.sea.intel.com ([10.251.7.218])
  by fmsmga007.fm.intel.com with ESMTP; 14 May 2019 13:15:44 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com, brian.gix@intel.com,
        michal.lowas-rzechonek@silvair.com
Subject: [PATCH BlueZ 2/3] mesh: Fix file open error checking and permissions
Date:   Tue, 14 May 2019 13:15:24 -0700
Message-Id: <20190514201525.16067-3-brian.gix@intel.com>
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20190514201525.16067-1-brian.gix@intel.com>
References: <20190514201525.16067-1-brian.gix@intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 mesh/keyring.c | 8 +++++---
 mesh/storage.c | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/mesh/keyring.c b/mesh/keyring.c
index 59aa1eaf4..4b1460aa8 100644
--- a/mesh/keyring.c
+++ b/mesh/keyring.c
@@ -67,7 +67,7 @@ bool keyring_put_net_key(struct mesh_node *node, uint16_t net_idx,
 								net_idx);
 	l_debug("Put Net Key %s", key_file);
 
-	fd = open(key_file, O_WRONLY | O_CREAT | O_TRUNC);
+	fd = open(key_file, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
 	if (fd >= 0) {
 		if (write(fd, key, sizeof(*key)) == sizeof(*key))
 			result = true;
@@ -112,7 +112,8 @@ bool keyring_put_app_key(struct mesh_node *node, uint16_t app_idx,
 		}
 		lseek(fd, 0, SEEK_SET);
 	} else
-		fd = open(key_file, O_WRONLY | O_CREAT | O_TRUNC);
+		fd = open(key_file, O_WRONLY | O_CREAT | O_TRUNC,
+							S_IRUSR | S_IWUSR);
 
 	if (fd >= 0) {
 		if (write(fd, key, sizeof(*key)) == sizeof(*key))
@@ -148,7 +149,8 @@ bool keyring_put_remote_dev_key(struct mesh_node *node, uint16_t unicast,
 						dev_key_dir, unicast + i);
 		l_debug("Put Dev Key %s", key_file);
 
-		fd = open(key_file, O_WRONLY | O_CREAT | O_TRUNC);
+		fd = open(key_file, O_WRONLY | O_CREAT | O_TRUNC,
+							S_IRUSR | S_IWUSR);
 		if (fd >= 0) {
 			if (write(fd, dev_key, 16) != 16)
 				result = false;
diff --git a/mesh/storage.c b/mesh/storage.c
index f4e23bf49..8893b93cb 100644
--- a/mesh/storage.c
+++ b/mesh/storage.c
@@ -197,7 +197,7 @@ static bool parse_config(char *in_file, char *out_dir, const uint8_t uuid[16])
 	l_info("Loading configuration from %s", in_file);
 
 	fd = open(in_file, O_RDONLY);
-	if (!fd)
+	if (fd < 0)
 		return false;
 
 	if (fstat(fd, &st) == -1) {
-- 
2.14.5

