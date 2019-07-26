Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C83CB75F1F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Jul 2019 08:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfGZGgT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 26 Jul 2019 02:36:19 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:36089 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbfGZGgT (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 26 Jul 2019 02:36:19 -0400
Received: by mail-lj1-f182.google.com with SMTP id i21so50395507ljj.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 25 Jul 2019 23:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=silvair-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=A1Z1UV9mlfiF8sj4lLQhtSzzTTzbBaSF4KFoRTiQTAE=;
        b=F2Rylbo7fyEzZiOXsZSRU9STfbhrIsv7JuHfUB2kBv2YRJdkr5s4ISnAP5ydYiMMJT
         nEFZuuDDUVeh/xTXw2eZC2IE1XOYGlCCwwhUd8QYstZ+UEnPpRbvAxiVU6As1PuBiYkw
         57+OUfirdXETGqQsz/mZ7iAD8Hkkj1xHZDyAMm9nkpvWYwGI0Tb3wwox72ex3Xc5eCsG
         p1dv+ZD7WCiJPaIM+9SAdNR11K+Qeoehhd7W4IdumBjA5FLRGfuRfhGizbrIQVAOAlGH
         LrAorL0fx2tbOlKvs6Q26nT3KXCtiLJ9GONaL76yeaXqKzzTHiXqlYZfhhuWUv45HMJL
         8VzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A1Z1UV9mlfiF8sj4lLQhtSzzTTzbBaSF4KFoRTiQTAE=;
        b=PILT/IQhWXVP/ztPsUSGpW65YetdbGt3GOag092/bI7YqABMQuLe3sctYP/WpmH+0I
         +OdOH4KB14h9DuIYD+tx+nj32+F1YkjnTdnxslgIj77VMdLHX9v5Nfy/Lyd9l1BzfBso
         8gjSY1xrufpQ+I2YofUJV/wCwjb9LlNjPVeB6AYMkqo+xvVoLe1sDEvHNlExnVbUZi/G
         45EFAlphIRLA96ZO9jUBkxJ/Vlbx+P8n2SvBX6auAKeO7cEjORhMKwivdoGm2FAu62x3
         alkQqadDEuPzqVOk0A6MLEYE0AnI4iyYcTbR38bv0+1DvT8jbms5hfhVEAtJJJBpT3yO
         PWgg==
X-Gm-Message-State: APjAAAWxIBGXpgqLJTLIUVnEwqdakJidNWhCrX3b6pMzZDCe+X9afcyx
        DUHma/ubCXA56Tt/615sOch9m3BBY14=
X-Google-Smtp-Source: APXvYqwYQLf+UxZza1QTcSv0C6EsTVP+gKHDuh0uQTDVHc3sRVVqPvXm4M98+0E24v/qxm9ljasy3g==
X-Received: by 2002:a2e:860d:: with SMTP id a13mr49004481lji.215.1564122976397;
        Thu, 25 Jul 2019 23:36:16 -0700 (PDT)
Received: from mlowasrzechonek2133.silvair.lan ([217.153.94.18])
        by smtp.gmail.com with ESMTPSA id d15sm8039109lfq.76.2019.07.25.23.36.15
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 23:36:15 -0700 (PDT)
From:   =?UTF-8?q?Micha=C5=82=20Lowas-Rzechonek?= 
        <michal.lowas-rzechonek@silvair.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v6 3/5] mesh: Keep element and model lists sorted and unique
Date:   Fri, 26 Jul 2019 08:36:04 +0200
Message-Id: <20190726063606.19359-4-michal.lowas-rzechonek@silvair.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190726063606.19359-1-michal.lowas-rzechonek@silvair.com>
References: <20190726063606.19359-1-michal.lowas-rzechonek@silvair.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This keeps composition data unchanged even if elements or models are
registered in a different order.
---
 mesh/node.c | 80 ++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 67 insertions(+), 13 deletions(-)

diff --git a/mesh/node.c b/mesh/node.c
index 857d0d03a..5eb2e6665 100644
--- a/mesh/node.c
+++ b/mesh/node.c
@@ -160,6 +160,20 @@ static bool match_element_idx(const void *a, const void *b)
 	return (element->idx == index);
 }
 
+static int compare_element_idx(const void *a, const void *b, void *user_data)
+{
+	uint32_t a_idx = ((const struct node_element *)a)->idx;
+	uint32_t b_idx = ((const struct node_element *)b)->idx;
+
+	if (a_idx < b_idx)
+		return -1;
+
+	if (a_idx > b_idx)
+		return 1;
+
+	return 0;
+}
+
 static bool match_element_path(const void *a, const void *b)
 {
 	const struct node_element *element = a;
@@ -171,6 +185,29 @@ static bool match_element_path(const void *a, const void *b)
 	return (!strcmp(element->path, path));
 }
 
+static bool match_model_id(const void *a, const void *b)
+{
+	const struct mesh_model *mod = a;
+	uint32_t mod_id = L_PTR_TO_UINT(b);
+
+	return mesh_model_get_model_id(mod) == mod_id;
+}
+
+static int compare_model_id(const void *a, const void *b, void *user_data)
+{
+	uint32_t a_id = mesh_model_get_model_id(a);
+	uint32_t b_id = mesh_model_get_model_id(b);
+
+	if (a_id < b_id)
+		return -1;
+
+	if (a_id > b_id)
+		return 1;
+
+	return 0;
+}
+
+
 struct mesh_node *node_find_by_addr(uint16_t addr)
 {
 	if (!IS_UNICAST(addr))
@@ -287,6 +324,17 @@ void node_remove(struct mesh_node *node)
 	free_node_resources(node);
 }
 
+static bool element_add_model(struct node_element *ele, struct mesh_model *mod)
+{
+	uint32_t mod_id = mesh_model_get_model_id(mod);
+
+	if (l_queue_find(ele->models, match_model_id, L_UINT_TO_PTR(mod_id)))
+		return false;
+
+	l_queue_insert(ele->models, mod, compare_model_id, NULL);
+	return true;
+}
+
 static bool add_models(struct mesh_node *node, struct node_element *ele,
 					struct mesh_config_element *db_ele)
 {
@@ -305,7 +353,10 @@ static bool add_models(struct mesh_node *node, struct node_element *ele,
 		if (!mod)
 			return false;
 
-		l_queue_push_tail(ele->models, mod);
+		if (!element_add_model(ele, mod)) {
+			mesh_model_free(mod);
+			return false;
+		}
 	}
 
 	return true;
@@ -334,7 +385,8 @@ static void add_internal_model(struct mesh_node *node, uint32_t mod_id,
 	if (!ele->models)
 		ele->models = l_queue_new();
 
-	l_queue_push_tail(ele->models, mod);
+	if (!element_add_model(ele, mod))
+		mesh_model_free(mod);
 }
 
 static bool add_element(struct mesh_node *node,
@@ -1026,12 +1078,12 @@ bool node_parse_composition(struct mesh_node *node, uint8_t *data,
 		while (len >= 2 && m--) {
 			mod_id = l_get_le16(data);
 			mod = mesh_model_new(ele->idx, mod_id);
-			if (!mod) {
+			if (!mod || !element_add_model(ele, mod)) {
+				mesh_model_free(mod);
 				element_free(ele);
 				goto fail;
 			}
 
-			l_queue_push_tail(ele->models, mod);
 			data += 2;
 			len -= 2;
 		}
@@ -1048,12 +1100,12 @@ bool node_parse_composition(struct mesh_node *node, uint8_t *data,
 			mod_id |= (vendor_id << 16);
 			mod = mesh_model_vendor_new(ele->idx, vendor_id,
 									mod_id);
-			if (!mod) {
+			if (!mod || !element_add_model(ele, mod)) {
+				mesh_model_free(mod);
 				element_free(ele);
 				goto fail;
 			}
 
-			l_queue_push_tail(ele->models, mod);
 			data += 4;
 			len -= 4;
 		}
@@ -1151,12 +1203,9 @@ static void get_models_from_properties(struct node_element *ele,
 		while (l_dbus_message_iter_next_entry(&ids, &mod_id)) {
 			struct mesh_model *mod;
 
-			/* Skip internally implemented models */
-			if ((VENDOR_ID_MASK | mod_id) == CONFIG_SRV_MODEL)
-				continue;
-
 			mod = mesh_model_new(ele->idx, mod_id);
-			l_queue_push_tail(ele->models, mod);
+			if (!element_add_model(ele, mod))
+				mesh_model_free(mod);
 		}
 		return;
 	}
@@ -1166,7 +1215,8 @@ static void get_models_from_properties(struct node_element *ele,
 		struct mesh_model *mod;
 
 		mod = mesh_model_vendor_new(ele->idx, vendor_id, mod_id);
-		l_queue_push_tail(ele->models, mod);
+		if (!element_add_model(ele, mod))
+			mesh_model_free(mod);
 	}
 }
 
@@ -1216,7 +1266,11 @@ static bool get_element_properties(struct mesh_node *node, const char *path,
 	if (!idx || !mods || !vendor_mods)
 		goto fail;
 
-	l_queue_push_tail(node->elements, ele);
+	if (l_queue_find(node->elements, match_element_idx,
+						L_UINT_TO_PTR(ele->idx)))
+		goto fail;
+
+	l_queue_insert(node->elements, ele, compare_element_idx, NULL);
 
 	ele->path = l_strdup(path);
 
-- 
2.19.1

