Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F21D3FEC6E
	for <lists+linux-bluetooth@lfdr.de>; Thu,  2 Sep 2021 12:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245337AbhIBKwK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 2 Sep 2021 06:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244817AbhIBKvV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 2 Sep 2021 06:51:21 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65E7C061575
        for <linux-bluetooth@vger.kernel.org>; Thu,  2 Sep 2021 03:50:23 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id p7-20020a17090a2c4700b0018d4e028ee6so952231pjm.6
        for <linux-bluetooth@vger.kernel.org>; Thu, 02 Sep 2021 03:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Yjsw3W80yRHotwwnMCice0ZSAQAf5UaE7uGDF1DypHo=;
        b=rmiEtGm7M2usZgOi0QRw+YGn6KVcYgen7p5/a58g0HR9SFcInZFbcGYYmcL7o7PZDE
         EEaV/nZfrSCDSY9Lm5zpR2sO95+fOTvIqT64VinI23GeL1+3SuKKR78q8cPK69LAUeOU
         MA6IuCNkcCBMVspctQ90j06ipGkJlsS3gOHpxRNWkoSCvZSO9Mj8OdDI3oMIaf3vOUP3
         9StJaINropfIkKvxhjKpzpBXzHAcWCKOzg8lMVd9ah/+NZ4nupyYGXMUaguembsNBneH
         AmNCtzvLGllm2Z8/HK73xUeG1gLCGkZrAzseSrV7dSpaKvtQfE72L+jNkjqEIUc9TEgW
         JkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Yjsw3W80yRHotwwnMCice0ZSAQAf5UaE7uGDF1DypHo=;
        b=Oxz0JrnDr+JVptg7z9blzbX+hXGUcjjhazipLsK7znNl6IryYMKHMFtOnsXFTMDlqJ
         CvwuieEgnnJ/wjJTM/IiG15+/jaN03MfqiQSOJc0HdfXLP/TN1iOQh4b7CzAXa9T22Bx
         f37kPxihhKDG1NObzDA0r65h5/Yw5LHDtnVRDZDsVQCXNmTZF+e0aixIZXNtyn/rn+iE
         mYHhLaQJtcZRXsvd8XwrnY8Rbak7I1BCJmM9G/jUxLZJqg4//2lHG21uHwUgAgfc/YCR
         2GeP5vXd4VoiUnx805wfWpktqFCM7nlQ6Zv7ejPV5uOe5z0fsbEIO7gPI8sshCLnT5Gu
         /25g==
X-Gm-Message-State: AOAM533JfwkNUT5eJHwwX4l6lziAx09gQEZUycp23CljVsnaLRZKxTsm
        EDqmZ6pw6GMlPU7V1aVOSoANBMNeGDmDmZyx3oxpBJkTX7u0lVeWcvHdYoSOm2UvuEl7FAwE4UF
        FqHPxH2bv/C4Jq7zZIgUi8IagNESUxH6WfHqeljzNUwikL2i/GKpbfB/wd7Mt9ew9lht5T64Cr0
        za
X-Google-Smtp-Source: ABdhPJwegE0l8nFUQSlESzRlEavx0fC7HbsQNWNZY97Hj09QIiDm61i35x5ea5ebreOc6STXrVgRmwbXlX+A
X-Received: from apusaka-p920.tpe.corp.google.com ([2401:fa00:1:10:5249:e81c:3ce6:f50c])
 (user=apusaka job=sendgmr) by 2002:aa7:9e4d:0:b0:3f8:6326:a038 with SMTP id
 z13-20020aa79e4d000000b003f86326a038mr2822163pfq.73.1630579823165; Thu, 02
 Sep 2021 03:50:23 -0700 (PDT)
Date:   Thu,  2 Sep 2021 18:49:34 +0800
In-Reply-To: <20210902104938.824737-1-apusaka@google.com>
Message-Id: <20210902184744.Bluez.v3.8.I42dbaec328499fe2c304308bd098c08535e4e93b@changeid>
Mime-Version: 1.0
References: <20210902104938.824737-1-apusaka@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [Bluez PATCH v3 08/12] src: Inclusive language changes
From:   Archie Pusaka <apusaka@google.com>
To:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Archie Pusaka <apusaka@chromium.org>

BT core spec 5.3 promotes the usage of inclusive languages.
This CL replaces some terms with the more appropriate counterparts,
such as "central", "peripheral", "accept list", and "reject list".
Note that some suggestions come from
https://specificationrefs.bluetooth.com/language-mapping/Appropriate_Language_Mapping_Table.pdf

Also use "primary" to refer the global mgmt struct.
---

(no changes since v2)

Changes in v2:
* Merging several patches from the same directory into one

 android/handsfree-client.c |   2 +-
 src/adapter.c              | 111 +++++++++++++++++++------------------
 src/adapter.h              |   4 +-
 src/device.c               |   6 +-
 src/sdpd-server.c          |   8 +--
 src/sdpd.h                 |   2 +-
 src/shared/ad.c            |   8 +--
 src/shared/ad.h            |   2 +-
 src/shared/hfp.c           |   4 +-
 src/shared/hfp.h           |   2 +-
 10 files changed, 76 insertions(+), 73 deletions(-)

diff --git a/android/handsfree-client.c b/android/handsfree-client.c
index 4c682fbb8f..c8f9e690ea 100644
--- a/android/handsfree-client.c
+++ b/android/handsfree-client.c
@@ -405,7 +405,7 @@ static void cmd_complete_cb(enum hfp_result result, enum hfp_error cme_err,
 	case HFP_RESULT_DELAYED:
 		ev.type = HAL_HF_CLIENT_CMD_COMP_ERR_DELAYED;
 		break;
-	case HFP_RESULT_BLACKLISTED:
+	case HFP_RESULT_REJECTED:
 		ev.type = HAL_HF_CLIENT_CMD_COMP_ERR_BACKLISTED;
 		break;
 	case HFP_RESULT_CME_ERROR:
diff --git a/src/adapter.c b/src/adapter.c
index ac1e02af6c..4ad53a3a24 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -112,7 +112,7 @@ static bool powering_down = false;
 
 static GSList *adapters = NULL;
 
-static struct mgmt *mgmt_master = NULL;
+static struct mgmt *mgmt_primary = NULL;
 
 static uint8_t mgmt_version = 0;
 static uint8_t mgmt_revision = 0;
@@ -134,7 +134,7 @@ struct smp_ltk_info {
 	bdaddr_t bdaddr;
 	uint8_t bdaddr_type;
 	uint8_t authenticated;
-	bool master;
+	bool central;
 	uint8_t enc_size;
 	uint16_t ediv;
 	uint64_t rand;
@@ -3689,7 +3689,7 @@ static struct smp_ltk_info *get_ltk(GKeyFile *key_file, const char *peer,
 {
 	struct smp_ltk_info *ltk = NULL;
 	GError *gerr = NULL;
-	bool master;
+	bool central;
 	char *key;
 	char *rand = NULL;
 
@@ -3703,8 +3703,8 @@ static struct smp_ltk_info *get_ltk(GKeyFile *key_file, const char *peer,
 
 	ltk = g_new0(struct smp_ltk_info, 1);
 
-	/* Default to assuming a master key */
-	ltk->master = true;
+	/* Default to assuming a central key */
+	ltk->central = true;
 
 	str2ba(peer, &ltk->bdaddr);
 	ltk->bdaddr_type = peer_type;
@@ -3745,11 +3745,11 @@ static struct smp_ltk_info *get_ltk(GKeyFile *key_file, const char *peer,
 									NULL);
 	ltk->ediv = g_key_file_get_integer(key_file, group, "EDiv", NULL);
 
-	master = g_key_file_get_boolean(key_file, group, "Master", &gerr);
+	central = g_key_file_get_boolean(key_file, group, "Master", &gerr);
 	if (gerr)
 		g_error_free(gerr);
 	else
-		ltk->master = master;
+		ltk->central = central;
 
 	ltk->is_blocked = is_blocked_key(HCI_BLOCKED_KEY_TYPE_LTK,
 								ltk->val);
@@ -3769,7 +3769,7 @@ static struct smp_ltk_info *get_ltk_info(GKeyFile *key_file, const char *peer,
 	return get_ltk(key_file, peer, bdaddr_type, "LongTermKey");
 }
 
-static struct smp_ltk_info *get_slave_ltk_info(GKeyFile *key_file,
+static struct smp_ltk_info *get_peripheral_ltk_info(GKeyFile *key_file,
 							const char *peer,
 							uint8_t bdaddr_type)
 {
@@ -3779,7 +3779,7 @@ static struct smp_ltk_info *get_slave_ltk_info(GKeyFile *key_file,
 
 	ltk = get_ltk(key_file, peer, bdaddr_type, "SlaveLongTermKey");
 	if (ltk)
-		ltk->master = false;
+		ltk->central = false;
 
 	return ltk;
 }
@@ -4122,7 +4122,7 @@ static void load_ltks(struct btd_adapter *adapter, GSList *keys)
 		key->rand = cpu_to_le64(info->rand);
 		key->ediv = cpu_to_le16(info->ediv);
 		key->type = info->authenticated;
-		key->central = info->master;
+		key->central = info->central;
 		key->enc_size = info->enc_size;
 	}
 
@@ -4582,7 +4582,7 @@ static void load_devices(struct btd_adapter *adapter)
 		GKeyFile *key_file;
 		struct link_key_info *key_info;
 		struct smp_ltk_info *ltk_info;
-		struct smp_ltk_info *slave_ltk_info;
+		struct smp_ltk_info *peripheral_ltk_info;
 		GSList *list;
 		struct irk_info *irk_info;
 		struct conn_param *param;
@@ -4607,16 +4607,16 @@ static void load_devices(struct btd_adapter *adapter)
 
 		ltk_info = get_ltk_info(key_file, entry->d_name, bdaddr_type);
 
-		slave_ltk_info = get_slave_ltk_info(key_file, entry->d_name,
-								bdaddr_type);
+		peripheral_ltk_info = get_peripheral_ltk_info(key_file,
+						entry->d_name, bdaddr_type);
 
 		irk_info = get_irk_info(key_file, entry->d_name, bdaddr_type);
 
 		// If any key for the device is blocked, we discard all.
 		if ((key_info && key_info->is_blocked) ||
 				(ltk_info && ltk_info->is_blocked) ||
-				(slave_ltk_info &&
-					slave_ltk_info->is_blocked) ||
+				(peripheral_ltk_info &&
+					peripheral_ltk_info->is_blocked) ||
 				(irk_info && irk_info->is_blocked)) {
 
 			if (key_info) {
@@ -4629,9 +4629,9 @@ static void load_devices(struct btd_adapter *adapter)
 				ltk_info = NULL;
 			}
 
-			if (slave_ltk_info) {
-				g_free(slave_ltk_info);
-				slave_ltk_info = NULL;
+			if (peripheral_ltk_info) {
+				g_free(peripheral_ltk_info);
+				peripheral_ltk_info = NULL;
 			}
 
 			if (irk_info) {
@@ -4648,8 +4648,8 @@ static void load_devices(struct btd_adapter *adapter)
 		if (ltk_info)
 			ltks = g_slist_append(ltks, ltk_info);
 
-		if (slave_ltk_info)
-			ltks = g_slist_append(ltks, slave_ltk_info);
+		if (peripheral_ltk_info)
+			ltks = g_slist_append(ltks, peripheral_ltk_info);
 
 		if (irk_info)
 			irks = g_slist_append(irks, irk_info);
@@ -4683,16 +4683,16 @@ device_exist:
 			device_set_bonded(device, BDADDR_BREDR);
 		}
 
-		if (ltk_info || slave_ltk_info) {
+		if (ltk_info || peripheral_ltk_info) {
 			device_set_paired(device, bdaddr_type);
 			device_set_bonded(device, bdaddr_type);
 
 			if (ltk_info)
 				device_set_ltk_enc_size(device,
 							ltk_info->enc_size);
-			else if (slave_ltk_info)
+			else if (peripheral_ltk_info)
 				device_set_ltk_enc_size(device,
-						slave_ltk_info->enc_size);
+						peripheral_ltk_info->enc_size);
 		}
 
 free:
@@ -5108,7 +5108,7 @@ void adapter_connect_list_remove(struct btd_adapter *adapter,
 	trigger_passive_scanning(adapter);
 }
 
-static void add_whitelist_complete(uint8_t status, uint16_t length,
+static void add_accept_list_complete(uint8_t status, uint16_t length,
 					const void *param, void *user_data)
 {
 	const struct mgmt_rp_add_device *rp = param;
@@ -5139,10 +5139,11 @@ static void add_whitelist_complete(uint8_t status, uint16_t length,
 		return;
 	}
 
-	DBG("%s added to kernel whitelist", addr);
+	DBG("%s added to kernel accept list", addr);
 }
 
-void adapter_whitelist_add(struct btd_adapter *adapter, struct btd_device *dev)
+void adapter_accept_list_add(struct btd_adapter *adapter,
+							struct btd_device *dev)
 {
 	struct mgmt_cp_add_device cp;
 
@@ -5156,10 +5157,10 @@ void adapter_whitelist_add(struct btd_adapter *adapter, struct btd_device *dev)
 
 	mgmt_send(adapter->mgmt, MGMT_OP_ADD_DEVICE,
 				adapter->dev_id, sizeof(cp), &cp,
-				add_whitelist_complete, adapter, NULL);
+				add_accept_list_complete, adapter, NULL);
 }
 
-static void remove_whitelist_complete(uint8_t status, uint16_t length,
+static void remove_accept_list_complete(uint8_t status, uint16_t length,
 					const void *param, void *user_data)
 {
 	const struct mgmt_rp_remove_device *rp = param;
@@ -5178,10 +5179,11 @@ static void remove_whitelist_complete(uint8_t status, uint16_t length,
 		return;
 	}
 
-	DBG("%s removed from kernel whitelist", addr);
+	DBG("%s removed from kernel accept list", addr);
 }
 
-void adapter_whitelist_remove(struct btd_adapter *adapter, struct btd_device *dev)
+void adapter_accept_list_remove(struct btd_adapter *adapter,
+							struct btd_device *dev)
 {
 	struct mgmt_cp_remove_device cp;
 
@@ -5194,7 +5196,7 @@ void adapter_whitelist_remove(struct btd_adapter *adapter, struct btd_device *de
 
 	mgmt_send(adapter->mgmt, MGMT_OP_REMOVE_DEVICE,
 				adapter->dev_id, sizeof(cp), &cp,
-				remove_whitelist_complete, adapter, NULL);
+				remove_accept_list_complete, adapter, NULL);
 }
 
 static void add_device_complete(uint8_t status, uint16_t length,
@@ -5751,7 +5753,7 @@ static void convert_ltk_entry(GKeyFile *key_file, void *value)
 {
 	char *auth_str, *rand_str, *str;
 	int i, ret;
-	unsigned char auth, master, enc_size;
+	unsigned char auth, central, enc_size;
 	unsigned short ediv;
 
 	auth_str = strchr(value, ' ');
@@ -5768,7 +5770,7 @@ static void convert_ltk_entry(GKeyFile *key_file, void *value)
 		rand_str++;
 	}
 
-	ret = sscanf(auth_str, " %hhd %hhd %hhd %hd", &auth, &master,
+	ret = sscanf(auth_str, " %hhd %hhd %hhd %hd", &auth, &central,
 							&enc_size, &ediv);
 	if (ret < 4)
 		return;
@@ -5778,7 +5780,7 @@ static void convert_ltk_entry(GKeyFile *key_file, void *value)
 	g_free(str);
 
 	g_key_file_set_integer(key_file, "LongTermKey", "Authenticated", auth);
-	g_key_file_set_integer(key_file, "LongTermKey", "Master", master);
+	g_key_file_set_integer(key_file, "LongTermKey", "Master", central);
 	g_key_file_set_integer(key_file, "LongTermKey", "EncSize", enc_size);
 	g_key_file_set_integer(key_file, "LongTermKey", "EDiv", ediv);
 
@@ -6467,7 +6469,7 @@ static struct btd_adapter *btd_adapter_new(uint16_t index)
 		return NULL;
 
 	adapter->dev_id = index;
-	adapter->mgmt = mgmt_ref(mgmt_master);
+	adapter->mgmt = mgmt_ref(mgmt_primary);
 	adapter->pincode_requested = false;
 
 	/*
@@ -8205,11 +8207,11 @@ static void new_link_key_callback(uint16_t index, uint16_t length,
 
 static void store_longtermkey(struct btd_adapter *adapter, const bdaddr_t *peer,
 				uint8_t bdaddr_type, const unsigned char *key,
-				uint8_t master, uint8_t authenticated,
+				uint8_t central, uint8_t authenticated,
 				uint8_t enc_size, uint16_t ediv,
 				uint64_t rand)
 {
-	const char *group = master ? "LongTermKey" : "SlaveLongTermKey";
+	const char *group = central ? "LongTermKey" : "SlaveLongTermKey";
 	char device_addr[18];
 	char filename[PATH_MAX];
 	GKeyFile *key_file;
@@ -8218,8 +8220,8 @@ static void store_longtermkey(struct btd_adapter *adapter, const bdaddr_t *peer,
 	char *str;
 	int i;
 
-	if (master != 0x00 && master != 0x01) {
-		error("Unsupported LTK type %u", master);
+	if (central != 0x00 && central != 0x01) {
+		error("Unsupported LTK type %u", central);
 		return;
 	}
 
@@ -9382,7 +9384,8 @@ static bool set_blocked_keys(struct btd_adapter *adapter)
 						sizeof(cp->keys[i].val));
 	}
 
-	return mgmt_send(mgmt_master, MGMT_OP_SET_BLOCKED_KEYS, adapter->dev_id,
+	return mgmt_send(mgmt_primary, MGMT_OP_SET_BLOCKED_KEYS,
+						adapter->dev_id,
 						sizeof(buffer),	buffer,
 						set_blocked_keys_complete,
 						adapter, NULL);
@@ -9860,7 +9863,7 @@ static void reset_adv_monitors(uint16_t index)
 
 	/* Handle 0 indicates to remove all */
 	cp.monitor_handle = 0;
-	if (mgmt_send(mgmt_master, MGMT_OP_REMOVE_ADV_MONITOR, index,
+	if (mgmt_send(mgmt_primary, MGMT_OP_REMOVE_ADV_MONITOR, index,
 			sizeof(cp), &cp, reset_adv_monitors_complete, NULL,
 			NULL) > 0) {
 		return;
@@ -9910,7 +9913,7 @@ static void index_added(uint16_t index, uint16_t length, const void *param,
 
 	DBG("sending read info command for index %u", index);
 
-	if (mgmt_send(mgmt_master, MGMT_OP_READ_INFO, index, 0, NULL,
+	if (mgmt_send(mgmt_primary, MGMT_OP_READ_INFO, index, 0, NULL,
 					read_info_complete, adapter, NULL) > 0)
 		return;
 
@@ -10094,18 +10097,18 @@ static void read_version_complete(uint8_t status, uint16_t length,
 	 * It is irrelevant if this command succeeds or fails. In case of
 	 * failure safe settings are assumed.
 	 */
-	mgmt_send(mgmt_master, MGMT_OP_READ_COMMANDS,
+	mgmt_send(mgmt_primary, MGMT_OP_READ_COMMANDS,
 				MGMT_INDEX_NONE, 0, NULL,
 				read_commands_complete, NULL, NULL);
 
-	mgmt_register(mgmt_master, MGMT_EV_INDEX_ADDED, MGMT_INDEX_NONE,
+	mgmt_register(mgmt_primary, MGMT_EV_INDEX_ADDED, MGMT_INDEX_NONE,
 						index_added, NULL, NULL);
-	mgmt_register(mgmt_master, MGMT_EV_INDEX_REMOVED, MGMT_INDEX_NONE,
+	mgmt_register(mgmt_primary, MGMT_EV_INDEX_REMOVED, MGMT_INDEX_NONE,
 						index_removed, NULL, NULL);
 
 	DBG("sending read index list command");
 
-	if (mgmt_send(mgmt_master, MGMT_OP_READ_INDEX_LIST,
+	if (mgmt_send(mgmt_primary, MGMT_OP_READ_INDEX_LIST,
 				MGMT_INDEX_NONE, 0, NULL,
 				read_index_list_complete, NULL, NULL) > 0)
 		return;
@@ -10124,18 +10127,18 @@ int adapter_init(void)
 {
 	dbus_conn = btd_get_dbus_connection();
 
-	mgmt_master = mgmt_new_default();
-	if (!mgmt_master) {
+	mgmt_primary = mgmt_new_default();
+	if (!mgmt_primary) {
 		error("Failed to access management interface");
 		return -EIO;
 	}
 
 	if (getenv("MGMT_DEBUG"))
-		mgmt_set_debug(mgmt_master, mgmt_debug, "mgmt: ", NULL);
+		mgmt_set_debug(mgmt_primary, mgmt_debug, "mgmt: ", NULL);
 
 	DBG("sending read version command");
 
-	if (mgmt_send(mgmt_master, MGMT_OP_READ_VERSION,
+	if (mgmt_send(mgmt_primary, MGMT_OP_READ_VERSION,
 				MGMT_INDEX_NONE, 0, NULL,
 				read_version_complete, NULL, NULL) > 0)
 		return 0;
@@ -10164,7 +10167,7 @@ void adapter_cleanup(void)
 	 * This is just an extra precaution to be safe, and in
 	 * reality should not make a difference.
 	 */
-	mgmt_unregister_index(mgmt_master, MGMT_INDEX_NONE);
+	mgmt_unregister_index(mgmt_primary, MGMT_INDEX_NONE);
 
 	/*
 	 * In case there is another reference active, cancel
@@ -10174,10 +10177,10 @@ void adapter_cleanup(void)
 	 * that potentially then could leak memory or access
 	 * an invalid structure.
 	 */
-	mgmt_cancel_index(mgmt_master, MGMT_INDEX_NONE);
+	mgmt_cancel_index(mgmt_primary, MGMT_INDEX_NONE);
 
-	mgmt_unref(mgmt_master);
-	mgmt_master = NULL;
+	mgmt_unref(mgmt_primary);
+	mgmt_primary = NULL;
 
 	dbus_conn = NULL;
 }
diff --git a/src/adapter.h b/src/adapter.h
index 35fa9fc5fd..db3c17f238 100644
--- a/src/adapter.h
+++ b/src/adapter.h
@@ -225,9 +225,9 @@ void adapter_auto_connect_add(struct btd_adapter *adapter,
 					struct btd_device *device);
 void adapter_auto_connect_remove(struct btd_adapter *adapter,
 					struct btd_device *device);
-void adapter_whitelist_add(struct btd_adapter *adapter,
+void adapter_accept_list_add(struct btd_adapter *adapter,
 						struct btd_device *dev);
-void adapter_whitelist_remove(struct btd_adapter *adapter,
+void adapter_accept_list_remove(struct btd_adapter *adapter,
 						struct btd_device *dev);
 
 void btd_adapter_set_oob_handler(struct btd_adapter *adapter,
diff --git a/src/device.c b/src/device.c
index 26a01612a9..313b5dab15 100644
--- a/src/device.c
+++ b/src/device.c
@@ -1123,7 +1123,7 @@ static void set_blocked(GDBusPendingPropertySet id, gboolean value, void *data)
 		break;
 	case EINVAL:
 		g_dbus_pending_property_error(id, ERROR_INTERFACE ".Failed",
-					"Kernel lacks blacklist support");
+					"Kernel lacks reject list support");
 		break;
 	default:
 		g_dbus_pending_property_error(id, ERROR_INTERFACE ".Failed",
@@ -5789,7 +5789,7 @@ void btd_device_set_temporary(struct btd_device *device, bool temporary)
 
 	if (temporary) {
 		if (device->bredr)
-			adapter_whitelist_remove(device->adapter, device);
+			adapter_accept_list_remove(device->adapter, device);
 		adapter_connect_list_remove(device->adapter, device);
 		if (device->auto_connect) {
 			device->disable_auto_connect = TRUE;
@@ -5801,7 +5801,7 @@ void btd_device_set_temporary(struct btd_device *device, bool temporary)
 		clear_temporary_timer(device);
 
 	if (device->bredr)
-		adapter_whitelist_add(device->adapter, device);
+		adapter_accept_list_add(device->adapter, device);
 
 	store_device_info(device);
 
diff --git a/src/sdpd-server.c b/src/sdpd-server.c
index 306b92a44c..9f4b51dacf 100644
--- a/src/sdpd-server.c
+++ b/src/sdpd-server.c
@@ -41,7 +41,7 @@ static int l2cap_sock = -1, unix_sock = -1;
  * l2cap and unix sockets over which discovery and registration clients
  * access us respectively
  */
-static int init_server(uint16_t mtu, int master, int compat)
+static int init_server(uint16_t mtu, int central, int compat)
 {
 	struct l2cap_options opts;
 	struct sockaddr_l2 l2addr;
@@ -71,7 +71,7 @@ static int init_server(uint16_t mtu, int master, int compat)
 		return -1;
 	}
 
-	if (master) {
+	if (central) {
 		int opt = L2CAP_LM_MASTER;
 		if (setsockopt(l2cap_sock, SOL_L2CAP, L2CAP_LM, &opt, sizeof(opt)) < 0) {
 			error("setsockopt: %s", strerror(errno));
@@ -218,12 +218,12 @@ static gboolean io_accept_event(GIOChannel *chan, GIOCondition cond, gpointer da
 int start_sdp_server(uint16_t mtu, uint32_t flags)
 {
 	int compat = flags & SDP_SERVER_COMPAT;
-	int master = flags & SDP_SERVER_MASTER;
+	int central = flags & SDP_SERVER_CENTRAL;
 	GIOChannel *io;
 
 	info("Starting SDP server");
 
-	if (init_server(mtu, master, compat) < 0) {
+	if (init_server(mtu, central, compat) < 0) {
 		error("Server initialization failed");
 		return -1;
 	}
diff --git a/src/sdpd.h b/src/sdpd.h
index 257411f039..9488535d38 100644
--- a/src/sdpd.h
+++ b/src/sdpd.h
@@ -59,7 +59,7 @@ uint32_t sdp_next_handle(void);
 uint32_t sdp_get_time(void);
 
 #define SDP_SERVER_COMPAT (1 << 0)
-#define SDP_SERVER_MASTER (1 << 1)
+#define SDP_SERVER_CENTRAL (1 << 1)
 
 int start_sdp_server(uint16_t mtu, uint32_t flags);
 void stop_sdp_server(void);
diff --git a/src/shared/ad.c b/src/shared/ad.c
index d40d153316..27b76dc817 100644
--- a/src/shared/ad.c
+++ b/src/shared/ad.c
@@ -959,7 +959,7 @@ void bt_ad_clear_flags(struct bt_ad *ad)
 							data_destroy);
 }
 
-static uint8_t type_blacklist[] = {
+static uint8_t type_reject_list[] = {
 	BT_AD_FLAGS,
 	BT_AD_UUID16_SOME,
 	BT_AD_UUID16_ALL,
@@ -976,7 +976,7 @@ static uint8_t type_blacklist[] = {
 	BT_AD_DEVICE_ID,
 	BT_AD_SMP_TK,
 	BT_AD_SMP_OOB_FLAGS,
-	BT_AD_SLAVE_CONN_INTERVAL,
+	BT_AD_PERIPHERAL_CONN_INTERVAL,
 	BT_AD_SOLICIT16,
 	BT_AD_SOLICIT128,
 	BT_AD_SERVICE_DATA16,
@@ -1012,8 +1012,8 @@ bool bt_ad_add_data(struct bt_ad *ad, uint8_t type, void *data, size_t len)
 	if (len > (BT_AD_MAX_DATA_LEN - 2))
 		return false;
 
-	for (i = 0; i < sizeof(type_blacklist); i++) {
-		if (type == type_blacklist[i])
+	for (i = 0; i < sizeof(type_reject_list); i++) {
+		if (type == type_reject_list[i])
 			return false;
 	}
 
diff --git a/src/shared/ad.h b/src/shared/ad.h
index 84ef9dee9e..feb712f508 100644
--- a/src/shared/ad.h
+++ b/src/shared/ad.h
@@ -32,7 +32,7 @@
 #define BT_AD_DEVICE_ID			0x10
 #define BT_AD_SMP_TK			0x10
 #define BT_AD_SMP_OOB_FLAGS		0x11
-#define BT_AD_SLAVE_CONN_INTERVAL	0x12
+#define BT_AD_PERIPHERAL_CONN_INTERVAL	0x12
 #define BT_AD_SOLICIT16			0x14
 #define BT_AD_SOLICIT128		0x15
 #define BT_AD_SERVICE_DATA16		0x16
diff --git a/src/shared/hfp.c b/src/shared/hfp.c
index f41c70dfec..df6eab35d6 100644
--- a/src/shared/hfp.c
+++ b/src/shared/hfp.c
@@ -721,7 +721,7 @@ bool hfp_gw_send_result(struct hfp_gw *hfp, enum hfp_result result)
 	case HFP_RESULT_BUSY:
 	case HFP_RESULT_NO_ANSWER:
 	case HFP_RESULT_DELAYED:
-	case HFP_RESULT_BLACKLISTED:
+	case HFP_RESULT_REJECTED:
 	case HFP_RESULT_CME_ERROR:
 	case HFP_RESULT_NO_DIALTONE:
 	case HFP_RESULT_CONNECT:
@@ -1018,7 +1018,7 @@ static bool is_response(const char *prefix, enum hfp_result *result,
 	}
 
 	if (strcmp(prefix, "BLACKLISTED") == 0) {
-		*result = HFP_RESULT_BLACKLISTED;
+		*result = HFP_RESULT_REJECTED;
 		*cme_err = 0;
 		return true;
 	}
diff --git a/src/shared/hfp.h b/src/shared/hfp.h
index 1fb3ee8d32..600d084a73 100644
--- a/src/shared/hfp.h
+++ b/src/shared/hfp.h
@@ -20,7 +20,7 @@ enum hfp_result {
 	HFP_RESULT_BUSY		= 7,
 	HFP_RESULT_NO_ANSWER	= 8,
 	HFP_RESULT_DELAYED	= 9,
-	HFP_RESULT_BLACKLISTED	= 10,
+	HFP_RESULT_REJECTED	= 10,
 	HFP_RESULT_CME_ERROR	= 11,
 };
 
-- 
2.33.0.259.gc128427fd7-goog

