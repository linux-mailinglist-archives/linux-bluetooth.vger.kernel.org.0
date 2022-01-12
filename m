Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9495348CE84
	for <lists+linux-bluetooth@lfdr.de>; Wed, 12 Jan 2022 23:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234585AbiALWsp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 12 Jan 2022 17:48:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbiALWsp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 12 Jan 2022 17:48:45 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C423EC06173F
        for <linux-bluetooth@vger.kernel.org>; Wed, 12 Jan 2022 14:48:44 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id k14so1880483ion.7
        for <linux-bluetooth@vger.kernel.org>; Wed, 12 Jan 2022 14:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TiNQHMBGtojKYIkXkAofrBuHGnbfx1rxcjHRB1chJMo=;
        b=o5OT8n/1krFXike9DaFDGd8QZWeRtOxIeNebdJT0ISNiJiAoGlNsLMde/U2WD9rpvX
         SJFUXqUfVvKpIMrZI/oLzGyd2UC0xPkfeydo7DEfMbiIfxXLRZBpzW/iBM2xgrwT18A2
         V+XdtLaYxBxk5HYjMfk3Qsb+M4vhTC4vczVrJNd2G4qY6OG/G8jMNGEMDV2ylKWcgRO7
         fqiv7n0pUV4Rmos0eVtCmcxOXCI+vWF03ESrCpy4ZNEul03/Pq+0oVZOy7klv7NpNqOh
         zUZ2MMqUS3gL0pNM5yh94zw1Xn2G5bhLx5reVxHuikJ/RK95pTiepgRFYZl3IytrWgXO
         Wt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TiNQHMBGtojKYIkXkAofrBuHGnbfx1rxcjHRB1chJMo=;
        b=QgoT3sotj8NrNgkrxdw4bf19HbGfhxuLJiqYzPbBOpUdUjZ+bQLFeEI0wZfuZc4WCj
         n7Yk8jjSHlF5f8M7XwggcM9emxEm8oDwhiNuQ2uTG3bsNbFju+s3HwS1q4ZuCS014rHZ
         WK5M0MwsY5+nAKu7YywfHan/wQbJA8LbaSYZBr5nFdA8qu+dxpRwbhSg9pzq+tCZ4ROn
         g5C0LrtQGX/bVQBl1ifnHnYu7qFsis1y79dJ/egna2q4DLNRS2yQyUp8VoRdvw/szxiN
         WdGeymtBNzLMoEpkmICaVwZVPFUi70GSg0CX952zpWssItElV60rEAlKDNCbm3WSWOG7
         9lxA==
X-Gm-Message-State: AOAM53011QCKcEY4/JGxlw2FsY33DIvXopyDCCzLW6ph/EGkrZsShWgF
        oePAfkoSZ76GbDI85T7nCPJ+7wzJfN8=
X-Google-Smtp-Source: ABdhPJw8Zcm2zdmBJAbWXOv/ayet/58viD9y47S2oX3Jkr3r1wE9Pftw2CSQhHSl2anpIpNwknqu/A==
X-Received: by 2002:a05:6602:2f08:: with SMTP id q8mr934589iow.77.1642027723614;
        Wed, 12 Jan 2022 14:48:43 -0800 (PST)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id o12sm777209ilu.86.2022.01.12.14.48.43
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 14:48:43 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 1/2] hog: Fix read order of attributes
Date:   Wed, 12 Jan 2022 14:48:41 -0800
Message-Id: <20220112224842.519814-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

The Report Map must be read after all other attributes otherwise the
Kernel driver may start using UHID_SET_REPORT which requires the
report->id to be known in order to resolve the attribute to send to.

Fixes: https://github.com/bluez/bluez/issues/220
---
v2: Move reading of report map to be the last one after there are nothing
else pending.

 profiles/input/hog-lib.c | 191 ++++++++++++++++++++++++---------------
 1 file changed, 119 insertions(+), 72 deletions(-)

diff --git a/profiles/input/hog-lib.c b/profiles/input/hog-lib.c
index d37caa1f1..beb19af70 100644
--- a/profiles/input/hog-lib.c
+++ b/profiles/input/hog-lib.c
@@ -90,6 +90,7 @@ struct bt_hog {
 	uint16_t		getrep_id;
 	unsigned int		setrep_att;
 	uint16_t		setrep_id;
+	unsigned int		report_map_id;
 	struct bt_scpp		*scpp;
 	struct bt_dis		*dis;
 	struct queue		*bas;
@@ -146,13 +147,34 @@ static bool set_and_store_gatt_req(struct bt_hog *hog,
 	return queue_push_head(hog->gatt_op, req);
 }
 
-static void destroy_gatt_req(struct gatt_request *req)
+static void destroy_gatt_req(void *data)
 {
-	queue_remove(req->hog->gatt_op, req);
+	struct gatt_request *req = data;
+
 	bt_hog_unref(req->hog);
 	free(req);
 }
 
+static void read_report_map(struct bt_hog *hog);
+
+static void remove_gatt_req(struct gatt_request *req, uint8_t status)
+{
+	struct bt_hog *hog = req->hog;
+
+	queue_remove(hog->gatt_op, req);
+
+	if (!status && queue_isempty(hog->gatt_op)) {
+		/* Report Map must be read last since that can result
+		 * in uhid being created and the driver may start to
+		 * use UHID_SET_REPORT which requires the report->id to
+		 * be known what attribute to send to.
+		 */
+		read_report_map(hog);
+	}
+
+	destroy_gatt_req(req);
+}
+
 static void write_char(struct bt_hog *hog, GAttrib *attrib, uint16_t handle,
 					const uint8_t *value, size_t vlen,
 					GAttribResultFunc func,
@@ -178,27 +200,31 @@ static void write_char(struct bt_hog *hog, GAttrib *attrib, uint16_t handle,
 	}
 }
 
-static void read_char(struct bt_hog *hog, GAttrib *attrib, uint16_t handle,
-				GAttribResultFunc func, gpointer user_data)
+static unsigned int read_char(struct bt_hog *hog, GAttrib *attrib,
+				uint16_t handle, GAttribResultFunc func,
+				gpointer user_data)
 {
 	struct gatt_request *req;
 	unsigned int id;
 
 	req = create_request(hog, user_data);
 	if (!req)
-		return;
+		return 0;
 
 	id = gatt_read_char(attrib, handle, func, req);
 	if (!id) {
 		error("hog: Could not read char");
-		return;
+		return 0;
 	}
 
 	if (!set_and_store_gatt_req(hog, req, id)) {
 		error("hog: Failed to queue read char req");
 		g_attrib_cancel(attrib, id);
 		free(req);
+		return 0;
 	}
+
+	return id;
 }
 
 static void discover_desc(struct bt_hog *hog, GAttrib *attrib,
@@ -343,16 +369,14 @@ static void report_ccc_written_cb(guint8 status, const guint8 *pdu,
 	struct report *report = req->user_data;
 	struct bt_hog *hog = report->hog;
 
-	destroy_gatt_req(req);
-
 	if (status != 0) {
 		error("Write report characteristic descriptor failed: %s",
 							att_ecode2str(status));
-		return;
+		goto remove;
 	}
 
 	if (report->notifyid)
-		return;
+		goto remove;
 
 	report->notifyid = g_attrib_register(hog->attrib,
 					ATT_OP_HANDLE_NOTIFY,
@@ -360,6 +384,9 @@ static void report_ccc_written_cb(guint8 status, const guint8 *pdu,
 					report_value_cb, report, NULL);
 
 	DBG("Report characteristic descriptor written: notifications enabled");
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 static void write_ccc(struct bt_hog *hog, GAttrib *attrib, uint16_t handle,
@@ -379,14 +406,15 @@ static void ccc_read_cb(guint8 status, const guint8 *pdu, guint16 len,
 	struct gatt_request *req = user_data;
 	struct report *report = req->user_data;
 
-	destroy_gatt_req(req);
-
 	if (status != 0) {
 		error("Error reading CCC value: %s", att_ecode2str(status));
-		return;
+		goto remove;
 	}
 
 	write_ccc(report->hog, report->hog->attrib, report->ccc_handle, report);
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 static const char *type_to_string(uint8_t type)
@@ -409,17 +437,15 @@ static void report_reference_cb(guint8 status, const guint8 *pdu,
 	struct gatt_request *req = user_data;
 	struct report *report = req->user_data;
 
-	destroy_gatt_req(req);
-
 	if (status != 0) {
 		error("Read Report Reference descriptor failed: %s",
 							att_ecode2str(status));
-		return;
+		goto remove;
 	}
 
 	if (plen != 3) {
 		error("Malformed ATT read response");
-		return;
+		goto remove;
 	}
 
 	report->id = pdu[1];
@@ -432,6 +458,9 @@ static void report_reference_cb(guint8 status, const guint8 *pdu,
 	if (report->type == HOG_REPORT_TYPE_INPUT)
 		read_char(report->hog, report->hog->attrib, report->ccc_handle,
 							ccc_read_cb, report);
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 static void external_report_reference_cb(guint8 status, const guint8 *pdu,
@@ -442,12 +471,10 @@ static void discover_external_cb(uint8_t status, GSList *descs, void *user_data)
 	struct gatt_request *req = user_data;
 	struct bt_hog *hog = req->user_data;
 
-	destroy_gatt_req(req);
-
 	if (status != 0) {
 		error("Discover external descriptors failed: %s",
 							att_ecode2str(status));
-		return;
+		goto remove;
 	}
 
 	for ( ; descs; descs = descs->next) {
@@ -457,6 +484,9 @@ static void discover_external_cb(uint8_t status, GSList *descs, void *user_data)
 						external_report_reference_cb,
 						hog);
 	}
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 static void discover_external(struct bt_hog *hog, GAttrib *attrib,
@@ -480,12 +510,10 @@ static void discover_report_cb(uint8_t status, GSList *descs, void *user_data)
 	struct report *report = req->user_data;
 	struct bt_hog *hog = report->hog;
 
-	destroy_gatt_req(req);
-
 	if (status != 0) {
 		error("Discover report descriptors failed: %s",
 							att_ecode2str(status));
-		return;
+		goto remove;
 	}
 
 	for ( ; descs; descs = descs->next) {
@@ -501,6 +529,9 @@ static void discover_report_cb(uint8_t status, GSList *descs, void *user_data)
 			break;
 		}
 	}
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 static void discover_report(struct bt_hog *hog, GAttrib *attrib,
@@ -519,11 +550,9 @@ static void report_read_cb(guint8 status, const guint8 *pdu, guint16 len,
 	struct gatt_request *req = user_data;
 	struct report *report = req->user_data;
 
-	destroy_gatt_req(req);
-
 	if (status != 0) {
 		error("Error reading Report value: %s", att_ecode2str(status));
-		return;
+		goto remove;
 	}
 
 	if (report->value)
@@ -531,6 +560,9 @@ static void report_read_cb(guint8 status, const guint8 *pdu, guint16 len,
 
 	report->value = util_memdup(pdu, len);
 	report->len = len;
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 static int report_chrc_cmp(const void *data, const void *user_data)
@@ -572,12 +604,11 @@ static void external_service_char_cb(uint8_t status, GSList *chars,
 	struct report *report;
 	GSList *l;
 
-	destroy_gatt_req(req);
-
 	if (status != 0) {
 		const char *str = att_ecode2str(status);
+
 		DBG("Discover external service characteristic failed: %s", str);
-		return;
+		goto remove;
 	}
 
 	for (l = chars; l; l = g_slist_next(l)) {
@@ -595,6 +626,9 @@ static void external_service_char_cb(uint8_t status, GSList *chars,
 		end = (next ? next->handle - 1 : primary->range.end);
 		discover_report(hog, hog->attrib, start, end, report);
 	}
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 static void external_report_reference_cb(guint8 status, const guint8 *pdu,
@@ -605,17 +639,15 @@ static void external_report_reference_cb(guint8 status, const guint8 *pdu,
 	uint16_t uuid16;
 	bt_uuid_t uuid;
 
-	destroy_gatt_req(req);
-
 	if (status != 0) {
 		error("Read External Report Reference descriptor failed: %s",
 							att_ecode2str(status));
-		return;
+		goto remove;
 	}
 
 	if (plen != 3) {
 		error("Malformed ATT read response");
-		return;
+		goto remove;
 	}
 
 	uuid16 = get_le16(&pdu[1]);
@@ -624,11 +656,14 @@ static void external_report_reference_cb(guint8 status, const guint8 *pdu,
 
 	/* Do not discover if is not a Report */
 	if (uuid16 != HOG_REPORT_UUID)
-		return;
+		goto remove;
 
 	bt_uuid16_create(&uuid, uuid16);
 	discover_char(hog, hog->attrib, 0x0001, 0xffff, &uuid,
 					external_service_char_cb, hog);
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 static int report_cmp(gconstpointer a, gconstpointer b)
@@ -687,12 +722,10 @@ static void output_written_cb(guint8 status, const guint8 *pdu,
 {
 	struct gatt_request *req = user_data;
 
-	destroy_gatt_req(req);
-
-	if (status != 0) {
+	if (status != 0)
 		error("Write output report failed: %s", att_ecode2str(status));
-		return;
-	}
+
+	remove_gatt_req(req, status);
 }
 
 static void forward_report(struct uhid_event *ev, void *user_data)
@@ -1056,7 +1089,7 @@ static void report_map_read_cb(guint8 status, const guint8 *pdu, guint16 plen,
 	uint8_t value[HOG_REPORT_MAP_MAX_SIZE];
 	ssize_t vlen;
 
-	destroy_gatt_req(req);
+	remove_gatt_req(req, status);
 
 	DBG("HoG inspecting report map");
 
@@ -1081,6 +1114,19 @@ static void report_map_read_cb(guint8 status, const guint8 *pdu, guint16 plen,
 	}
 }
 
+static void read_report_map(struct bt_hog *hog)
+{
+	uint16_t handle;
+
+	if (!hog->report_map_attr || hog->uhid_created || hog->report_map_id)
+		return;
+
+	handle = gatt_db_attribute_get_handle(hog->report_map_attr);
+
+	hog->report_map_id = read_char(hog, hog->attrib, handle,
+						report_map_read_cb, hog);
+}
+
 static void info_read_cb(guint8 status, const guint8 *pdu, guint16 plen,
 							gpointer user_data)
 {
@@ -1089,18 +1135,16 @@ static void info_read_cb(guint8 status, const guint8 *pdu, guint16 plen,
 	uint8_t value[HID_INFO_SIZE];
 	ssize_t vlen;
 
-	destroy_gatt_req(req);
-
 	if (status != 0) {
 		error("HID Information read failed: %s",
 						att_ecode2str(status));
-		return;
+		goto remove;
 	}
 
 	vlen = dec_read_resp(pdu, plen, value, sizeof(value));
 	if (vlen != 4) {
 		error("ATT protocol error");
-		return;
+		goto remove;
 	}
 
 	hog->bcdhid = get_le16(&value[0]);
@@ -1109,6 +1153,9 @@ static void info_read_cb(guint8 status, const guint8 *pdu, guint16 plen,
 
 	DBG("bcdHID: 0x%04X bCountryCode: 0x%02X Flags: 0x%02X",
 			hog->bcdhid, hog->bcountrycode, hog->flags);
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 static void proto_mode_read_cb(guint8 status, const guint8 *pdu, guint16 plen,
@@ -1119,18 +1166,16 @@ static void proto_mode_read_cb(guint8 status, const guint8 *pdu, guint16 plen,
 	uint8_t value;
 	ssize_t vlen;
 
-	destroy_gatt_req(req);
-
 	if (status != 0) {
 		error("Protocol Mode characteristic read failed: %s",
 							att_ecode2str(status));
-		return;
+		goto remove;
 	}
 
 	vlen = dec_read_resp(pdu, plen, &value, sizeof(value));
 	if (vlen < 0) {
 		error("ATT protocol error");
-		return;
+		goto remove;
 	}
 
 	if (value == HOG_PROTO_MODE_BOOT) {
@@ -1142,6 +1187,9 @@ static void proto_mode_read_cb(guint8 status, const guint8 *pdu, guint16 plen,
 						sizeof(nval), NULL, NULL);
 	} else if (value == HOG_PROTO_MODE_REPORT)
 		DBG("HoG is operating in Report Protocol Mode");
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 static void char_discovered_cb(uint8_t status, GSList *chars, void *user_data)
@@ -1155,14 +1203,12 @@ static void char_discovered_cb(uint8_t status, GSList *chars, void *user_data)
 	GSList *l;
 	uint16_t info_handle = 0, proto_mode_handle = 0;
 
-	destroy_gatt_req(req);
-
 	DBG("HoG inspecting characteristics");
 
 	if (status != 0) {
-		const char *str = att_ecode2str(status);
-		DBG("Discover all characteristics failed: %s", str);
-		return;
+		DBG("Discover all characteristics failed: %s",
+					att_ecode2str(status));
+		goto remove;
 	}
 
 	bt_uuid16_create(&report_uuid, HOG_REPORT_UUID);
@@ -1211,6 +1257,9 @@ static void char_discovered_cb(uint8_t status, GSList *chars, void *user_data)
 
 	if (info_handle)
 		read_char(hog, hog->attrib, info_handle, info_read_cb, hog);
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 static void report_free(void *data)
@@ -1221,10 +1270,12 @@ static void report_free(void *data)
 	g_free(report);
 }
 
-static void cancel_gatt_req(struct gatt_request *req)
+static bool cancel_gatt_req(const void *data, const void *user_data)
 {
-	if (g_attrib_cancel(req->hog->attrib, req->id))
-		destroy_gatt_req(req);
+	struct gatt_request *req = (void *) data;
+	const struct bt_hog *hog = user_data;
+
+	return g_attrib_cancel(hog->attrib, req->id);
 }
 
 static void hog_free(void *data)
@@ -1386,13 +1437,9 @@ static void foreach_hog_chrc(struct gatt_db_attribute *attr, void *user_data)
 			 * UHID to optimize reconnection.
 			 */
 			uhid_create(hog, report_map.value, report_map.length);
-		} else {
-			read_char(hog, hog->attrib, value_handle,
-						report_map_read_cb, hog);
 		}
 
 		gatt_db_service_foreach_desc(attr, foreach_hog_external, hog);
-		return;
 	}
 
 	bt_uuid16_create(&info_uuid, HOG_INFO_UUID);
@@ -1552,12 +1599,9 @@ static void find_included_cb(uint8_t status, GSList *services, void *user_data)
 
 	DBG("");
 
-	destroy_gatt_req(req);
-
 	if (status) {
-		const char *str = att_ecode2str(status);
-		DBG("Find included failed: %s", str);
-		return;
+		DBG("Find included failed: %s", att_ecode2str(status));
+		goto remove;
 	}
 
 	for (l = services; l; l = l->next) {
@@ -1566,6 +1610,9 @@ static void find_included_cb(uint8_t status, GSList *services, void *user_data)
 		DBG("included: handle %x, uuid %s",
 			include->handle, include->uuid);
 	}
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 static void hog_attach_scpp(struct bt_hog *hog, struct gatt_primary *primary)
@@ -1640,17 +1687,14 @@ static void primary_cb(uint8_t status, GSList *services, void *user_data)
 
 	DBG("");
 
-	destroy_gatt_req(req);
-
 	if (status) {
-		const char *str = att_ecode2str(status);
-		DBG("Discover primary failed: %s", str);
-		return;
+		DBG("Discover primary failed: %s", att_ecode2str(status));
+		goto remove;
 	}
 
 	if (!services) {
 		DBG("No primary service found");
-		return;
+		goto remove;
 	}
 
 	for (l = services; l; l = l->next) {
@@ -1674,6 +1718,9 @@ static void primary_cb(uint8_t status, GSList *services, void *user_data)
 		if (strcmp(primary->uuid, HOG_UUID) == 0)
 			hog_attach_hog(hog, primary);
 	}
+
+remove:
+	remove_gatt_req(req, status);
 }
 
 bool bt_hog_attach(struct bt_hog *hog, void *gatt)
@@ -1790,7 +1837,7 @@ void bt_hog_detach(struct bt_hog *hog)
 	if (hog->dis)
 		bt_dis_detach(hog->dis);
 
-	queue_foreach(hog->gatt_op, (void *) cancel_gatt_req, NULL);
+	queue_remove_all(hog->gatt_op, cancel_gatt_req, hog, destroy_gatt_req);
 	g_attrib_unref(hog->attrib);
 	hog->attrib = NULL;
 	uhid_destroy(hog);
-- 
2.33.1

