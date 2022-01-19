Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979E14931C8
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 Jan 2022 01:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350420AbiASAXB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 18 Jan 2022 19:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244782AbiASAXA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 18 Jan 2022 19:23:00 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A93C061574
        for <linux-bluetooth@vger.kernel.org>; Tue, 18 Jan 2022 16:23:00 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id a1-20020a17090a688100b001b3fd52338eso916660pjd.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 18 Jan 2022 16:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GRDwgTXnUeWu9NJYbRx10z0bpmsxSDvZ3gBZ9Wl+Gus=;
        b=PfZV7d5PF9vfXWpsMxxITFr2JGfvVgJRjPpInY1PKcp/WwyvWlgWIpi06+QTkbPjxQ
         nKRhf910o6cKUsj2Ar1rVViWHuemyiNDSQR7ubm3WxILvCD7xOwpfLLDs53Wuxoiy5Dd
         FXkhushy6g2Zj4AO8b5gqeZnQeKYLajlsKKLQrBk9kWaLd6epcPsrQEC8gB0LX4+8Uv0
         eDZEnpyGq3WtdArZK59HHh/oHkCEgW9tjbrnclbpLfR0/35jJkU5INN86blB8/oJ+mBK
         QThbW0iMfAs7z9uVnQvA8vQzInGGSY6CBqKc0irlaLcQpYfJfQY5fd+7S1Sr5iWguhPA
         w9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GRDwgTXnUeWu9NJYbRx10z0bpmsxSDvZ3gBZ9Wl+Gus=;
        b=2gsH6WkviBG7PdbNtzVL8k8WjgTtVeoajt8aNF3ehnJstie84JJT38eIUehTPrVNgX
         H2V6Q6j4efaM62pA3JmDDpTeAhQNZOd4qmz79wVYm2POOLVIbQZpDgVN+j7KZ0nLdLVF
         YYsUYEyD0KxX6TG8arHTI0psJQOHitugjiRWEaLfOA9b61vqbsGabxyl0WEmsK23KAnV
         TUh2VgSIy2rwP6VZZ1jwCo0q0nJAdwtwk4Kw8cOrKf7ZwNK9weTKEGfdEH/CIiwVtJCT
         oZdAuvClQ5IJYtlCjLXjGREbGXGS5L/Z6Q8F3N/CThecPuC+v9f0O0gtbumg0+wLWyBC
         MkbQ==
X-Gm-Message-State: AOAM5311z+O71OtnFpmDKbLLY3/S3dA4OuWVAF1ofweNYdOaFCTUnUT0
        9qG4Pv07YiRQQ/TRxq+/62xXU8bXNz0=
X-Google-Smtp-Source: ABdhPJxm/hXDgwOdrGiT5cDymrSiW0Wubrd7TCMiG237xvjrF1aMSsab+Gl1idJT9ZPm/5DBn6FTLw==
X-Received: by 2002:a17:90b:912:: with SMTP id bo18mr1245330pjb.21.1642551779079;
        Tue, 18 Jan 2022 16:22:59 -0800 (PST)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id v7sm4032675pfu.218.2022.01.18.16.22.58
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 16:22:58 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ] hog-lib: Make use of UHID_CREATE2
Date:   Tue, 18 Jan 2022 16:22:57 -0800
Message-Id: <20220119002257.1428841-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This convert the use of UHID_CREATE to UHID_CREATE2 which gives back
the information of reports being numbered or not thus avoiding the need
to parse the report map in order to check if there are a report number
on them since UHID_START gives that information:

UHID_START:
  This is sent when the HID device is started. Consider this as an
  answer to UHID_CREATE2. This is always the first event that is sent.
  Note that this event might not be available immediately after
  write(UHID_CREATE2) returns.
  Device drivers might require delayed setups.
  This event contains a payload of type uhid_start_req. The "dev_flags"
  field describes special behaviors of a device. The following flags
  are defined:

      - UHID_DEV_NUMBERED_FEATURE_REPORTS
      - UHID_DEV_NUMBERED_OUTPUT_REPORTS
      - UHID_DEV_NUMBERED_INPUT_REPORTS

  Each of these flags defines whether a given report-type uses numbered
  reports. If numbered reports are used for a type, all messages from
  the kernel already have the report-number as prefix. Otherwise, no
  prefix is added by the kernel. For messages sent by user-space to the
  kernel, you must adjust the prefixes according to these flags
---
 profiles/input/hog-lib.c | 211 +++++++++++++++++----------------------
 1 file changed, 92 insertions(+), 119 deletions(-)

diff --git a/profiles/input/hog-lib.c b/profiles/input/hog-lib.c
index 0b375feb8..5af99fcda 100644
--- a/profiles/input/hog-lib.c
+++ b/profiles/input/hog-lib.c
@@ -23,6 +23,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
+#include <inttypes.h>
 
 #include <glib.h>
 
@@ -80,7 +81,7 @@ struct bt_hog {
 	struct bt_uhid		*uhid;
 	int			uhid_fd;
 	bool			uhid_created;
-	gboolean		has_report_id;
+	uint64_t		uhid_flags;
 	uint16_t		bcdhid;
 	uint8_t			bcountrycode;
 	uint16_t		proto_mode_handle;
@@ -108,6 +109,7 @@ struct report_map {
 
 struct report {
 	struct bt_hog		*hog;
+	bool			numbered;
 	uint8_t			id;
 	uint8_t			type;
 	uint16_t		handle;
@@ -345,7 +347,7 @@ static void report_value_cb(const guint8 *pdu, guint16 len, gpointer user_data)
 	ev.type = UHID_INPUT;
 	buf = ev.u.input.data;
 
-	if (hog->has_report_id) {
+	if (report->numbered) {
 		buf[0] = report->id;
 		len = MIN(len, sizeof(ev.u.input.data) - 1);
 		memcpy(buf + 1, pdu, len);
@@ -682,8 +684,8 @@ static int report_cmp(gconstpointer a, gconstpointer b)
 	if (ra->type != rb->type)
 		return ra->type - rb->type;
 
-	/* skip id check in case of report id 0 */
-	if (!rb->id)
+	/* skip id check in case of reports not being numbered  */
+	if (!ra->numbered && !rb->numbered)
 		return 0;
 
 	/* ..then by id */
@@ -695,8 +697,24 @@ static struct report *find_report(struct bt_hog *hog, uint8_t type, uint8_t id)
 	struct report cmp;
 	GSList *l;
 
+	memset(&cmp, 0, sizeof(cmp));
 	cmp.type = type;
-	cmp.id = hog->has_report_id ? id : 0;
+	cmp.id = id;
+
+	switch (type) {
+	case HOG_REPORT_TYPE_FEATURE:
+		if (hog->flags & UHID_DEV_NUMBERED_FEATURE_REPORTS)
+			cmp.numbered = true;
+		break;
+	case HOG_REPORT_TYPE_OUTPUT:
+		if (hog->flags & UHID_DEV_NUMBERED_OUTPUT_REPORTS)
+			cmp.numbered = true;
+		break;
+	case HOG_REPORT_TYPE_INPUT:
+		if (hog->flags & UHID_DEV_NUMBERED_INPUT_REPORTS)
+			cmp.numbered = true;
+		break;
+	}
 
 	l = g_slist_find_custom(hog->reports, &cmp, report_cmp);
 
@@ -750,7 +768,8 @@ static void forward_report(struct uhid_event *ev, void *user_data)
 
 	data = ev->u.output.data;
 	size = ev->u.output.size;
-	if (hog->has_report_id && size > 0) {
+
+	if (report->numbered && size > 0) {
 		data++;
 		--size;
 	}
@@ -769,6 +788,39 @@ static void forward_report(struct uhid_event *ev, void *user_data)
 						data, size, NULL, NULL);
 }
 
+static void set_numbered(void *data, void *user_data)
+{
+	struct report *report = data;
+	struct bt_hog *hog = user_data;
+
+	switch (report->type) {
+	case HOG_REPORT_TYPE_INPUT:
+		if (hog->uhid_flags & UHID_DEV_NUMBERED_INPUT_REPORTS)
+			report->numbered = true;
+		break;
+	case HOG_REPORT_TYPE_OUTPUT:
+		if (hog->uhid_flags & UHID_DEV_NUMBERED_OUTPUT_REPORTS)
+			report->numbered = true;
+		break;
+	case HOG_REPORT_TYPE_FEATURE:
+		if (hog->uhid_flags & UHID_DEV_NUMBERED_FEATURE_REPORTS)
+			report->numbered = true;
+		break;
+	}
+}
+
+static void start_flags(struct uhid_event *ev, void *user_data)
+{
+	struct bt_hog *hog = user_data;
+
+	hog->uhid_flags = ev->u.start.dev_flags;
+
+	DBG("uHID device flags: 0x%16" PRIx64, hog->uhid_flags);
+
+	if (hog->uhid_flags)
+		g_slist_foreach(hog->reports, set_numbered, hog);
+}
+
 static void set_report_cb(guint8 status, const guint8 *pdu,
 					guint16 plen, gpointer user_data)
 {
@@ -816,7 +868,8 @@ static void set_report(struct uhid_event *ev, void *user_data)
 
 	data = ev->u.set_report.data;
 	size = ev->u.set_report.size;
-	if (hog->has_report_id && size > 0) {
+
+	if (report->numbered && size > 0) {
 		data++;
 		--size;
 	}
@@ -843,7 +896,7 @@ fail:
 }
 
 static void report_reply(struct bt_hog *hog, uint8_t status, uint8_t id,
-				 uint16_t len, const uint8_t *data)
+			bool numbered, uint16_t len, const uint8_t *data)
 {
 	struct uhid_event rsp;
 	int err;
@@ -857,7 +910,7 @@ static void report_reply(struct bt_hog *hog, uint8_t status, uint8_t id,
 	if (status)
 		goto done;
 
-	if (hog->has_report_id && len > 0) {
+	if (numbered && len > 0) {
 		rsp.u.get_report_reply.size = len + 1;
 		rsp.u.get_report_reply.data[0] = id;
 		memcpy(&rsp.u.get_report_reply.data[1], data, len);
@@ -900,7 +953,7 @@ static void get_report_cb(guint8 status, const guint8 *pdu, guint16 len,
 	++pdu;
 
 exit:
-	report_reply(hog, status, report->id, len, pdu);
+	report_reply(hog, status, report->id, report->numbered, len, pdu);
 }
 
 static void get_report(struct uhid_event *ev, void *user_data)
@@ -936,69 +989,7 @@ static void get_report(struct uhid_event *ev, void *user_data)
 
 fail:
 	/* reply with an error on failure */
-	report_reply(hog, err, 0, 0, NULL);
-}
-
-static bool get_descriptor_item_info(uint8_t *buf, ssize_t blen, ssize_t *len,
-								bool *is_long)
-{
-	if (!blen)
-		return false;
-
-	*is_long = (buf[0] == 0xfe);
-
-	if (*is_long) {
-		if (blen < 3)
-			return false;
-
-		/*
-		 * long item:
-		 * byte 0 -> 0xFE
-		 * byte 1 -> data size
-		 * byte 2 -> tag
-		 * + data
-		 */
-
-		*len = buf[1] + 3;
-	} else {
-		uint8_t b_size;
-
-		/*
-		 * short item:
-		 * byte 0[1..0] -> data size (=0, 1, 2, 4)
-		 * byte 0[3..2] -> type
-		 * byte 0[7..4] -> tag
-		 * + data
-		 */
-
-		b_size = buf[0] & 0x03;
-		*len = (b_size ? 1 << (b_size - 1) : 0) + 1;
-	}
-
-	/* item length should be no more than input buffer length */
-	return *len <= blen;
-}
-
-static char *item2string(char *str, uint8_t *buf, uint8_t len)
-{
-	char *p = str;
-	int i;
-
-	/*
-	 * Since long item tags are not defined except for vendor ones, we
-	 * just ensure that short items are printed properly (up to 5 bytes).
-	 */
-	for (i = 0; i < 6 && i < len; i++)
-		p += sprintf(p, " %02x", buf[i]);
-
-	/*
-	 * If there are some data left, just add continuation mark to indicate
-	 * this.
-	 */
-	if (i < len)
-		sprintf(p, " ...");
-
-	return str;
+	report_reply(hog, err, 0, false, 0, NULL);
 }
 
 static bool input_dequeue(const void *data, const void *match_data)
@@ -1017,70 +1008,53 @@ static bool input_dequeue(const void *data, const void *match_data)
 }
 
 static void uhid_create(struct bt_hog *hog, uint8_t *report_map,
-							ssize_t report_map_len)
+							size_t report_map_len)
 {
 	uint8_t *value = report_map;
 	struct uhid_event ev;
-	ssize_t vlen = report_map_len;
-	char itemstr[20]; /* 5x3 (data) + 4 (continuation) + 1 (null) */
+	size_t vlen = report_map_len;
 	int i, err;
 	GError *gerr = NULL;
 
-	DBG("Report MAP:");
-	for (i = 0; i < vlen;) {
-		ssize_t ilen = 0;
-		bool long_item = false;
-
-		if (get_descriptor_item_info(&value[i], vlen - i, &ilen,
-								&long_item)) {
-			/* Report ID is short item with prefix 100001xx */
-			if (!long_item && (value[i] & 0xfc) == 0x84)
-				hog->has_report_id = TRUE;
-
-			DBG("\t%s", item2string(itemstr, &value[i], ilen));
-
-			i += ilen;
-		} else {
-			error("Report Map parsing failed at %d", i);
-
-			/* Just print remaining items at once and break */
-			DBG("\t%s", item2string(itemstr, &value[i], vlen - i));
-			break;
-		}
+	if (vlen > sizeof(ev.u.create2.rd_data)) {
+		error("Report MAP too big: %zu > %zu", vlen,
+					sizeof(ev.u.create2.rd_data));
+		return;
 	}
 
 	/* create uHID device */
 	memset(&ev, 0, sizeof(ev));
-	ev.type = UHID_CREATE;
+	ev.type = UHID_CREATE2;
 
 	bt_io_get(g_attrib_get_channel(hog->attrib), &gerr,
-			BT_IO_OPT_SOURCE, ev.u.create.phys,
-			BT_IO_OPT_DEST, ev.u.create.uniq,
+			BT_IO_OPT_SOURCE, ev.u.create2.phys,
+			BT_IO_OPT_DEST, ev.u.create2.uniq,
 			BT_IO_OPT_INVALID);
 
-	/* Phys + uniq are the same size (hw address type) */
-	for (i = 0;
-	    i < (int)sizeof(ev.u.create.phys) && ev.u.create.phys[i] != 0;
-	    ++i) {
-		ev.u.create.phys[i] = tolower(ev.u.create.phys[i]);
-		ev.u.create.uniq[i] = tolower(ev.u.create.uniq[i]);
-	}
-
 	if (gerr) {
 		error("Failed to connection details: %s", gerr->message);
 		g_error_free(gerr);
 		return;
 	}
 
-	strncpy((char *) ev.u.create.name, hog->name,
-						sizeof(ev.u.create.name) - 1);
-	ev.u.create.vendor = hog->vendor;
-	ev.u.create.product = hog->product;
-	ev.u.create.version = hog->version;
-	ev.u.create.country = hog->bcountrycode;
-	ev.u.create.bus = BUS_BLUETOOTH;
-	ev.u.create.rd_data = value;
-	ev.u.create.rd_size = vlen;
+	/* Phys + uniq are the same size (hw address type) */
+	for (i = 0;
+	    i < (int)sizeof(ev.u.create2.phys) && ev.u.create2.phys[i] != 0;
+	    ++i) {
+		ev.u.create2.phys[i] = tolower(ev.u.create2.phys[i]);
+		ev.u.create2.uniq[i] = tolower(ev.u.create2.uniq[i]);
+	}
+
+	strncpy((char *) ev.u.create2.name, hog->name,
+						sizeof(ev.u.create2.name) - 1);
+	ev.u.create2.vendor = hog->vendor;
+	ev.u.create2.product = hog->product;
+	ev.u.create2.version = hog->version;
+	ev.u.create2.country = hog->bcountrycode;
+	ev.u.create2.bus = BUS_BLUETOOTH;
+	ev.u.create2.rd_size = vlen;
+
+	memcpy(ev.u.create2.rd_data, value, vlen);
 
 	err = bt_uhid_send(hog->uhid, &ev);
 	if (err < 0) {
@@ -1088,6 +1062,7 @@ static void uhid_create(struct bt_hog *hog, uint8_t *report_map,
 		return;
 	}
 
+	bt_uhid_register(hog->uhid, UHID_START, start_flags, hog);
 	bt_uhid_register(hog->uhid, UHID_OUTPUT, forward_report, hog);
 	bt_uhid_register(hog->uhid, UHID_GET_REPORT, get_report, hog);
 	bt_uhid_register(hog->uhid, UHID_SET_REPORT, set_report, hog);
@@ -1116,8 +1091,6 @@ static void report_map_read_cb(guint8 status, const guint8 *pdu, guint16 plen,
 
 	remove_gatt_req(req, status);
 
-	DBG("HoG inspecting report map");
-
 	if (status != 0) {
 		error("Report Map read failed: %s", att_ecode2str(status));
 		return;
-- 
2.33.1

