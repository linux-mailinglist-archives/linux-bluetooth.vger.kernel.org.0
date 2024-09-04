Return-Path: <linux-bluetooth+bounces-7169-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D95BF96BF91
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Sep 2024 16:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09BFC1C21534
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Sep 2024 14:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3661DB537;
	Wed,  4 Sep 2024 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R7QGOtdc"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC151D9D6B
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Sep 2024 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725458675; cv=none; b=U73XabLsk+z7swV+aEd3VqJn55ksI+q+bXPKEjcHvZzvFj7919dp8R4S1iE1WPGw0+xzWv1XQKyOxhERqxXYPw+k2CCW+UTRmGxi81pSxfjSgC0hCvjgZsbqBfMdphQue2qw5RJzscI24c3sCRSeyC/pQxBo22HC9t/6lohL7OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725458675; c=relaxed/simple;
	bh=dJ2CIKoOfEZnIal4LXo/iDQ5TpUhbgQ0EaoL5fSEqzM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tKytltXkq8hFe11XyU61l31PnNNjwsK1EokVDQrWGAuNNNM+srlFz+uNoqP6QgqeydMC4lYqYe2BUT6majGHU/0IB271816btnZsDn6RsD3InZ7TkCAwEQeQlqtgUrUqq19arrIgyimQdP+DaLtfgczMlIg5B2g6Vk8qS9GWb0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R7QGOtdc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725458669;
	bh=dJ2CIKoOfEZnIal4LXo/iDQ5TpUhbgQ0EaoL5fSEqzM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R7QGOtdcTB1T2Phs1foXoI7ICQqMFQV0wpAG3LM1gR7YCYIgqsI40PcZnYWUtUraX
	 /yxlysnuLaQluSuSRR8gAqV0wV6KmQegMQ/YI5ZYyROyEdzSivrBt5YW553UE3aLCp
	 DbtQo08fnf9SIn6Jh5qhmNINCIg6wSASBPNwfp0zmMcYEQljr5n/mudu3wPxoT7E6H
	 7dzJ6sFWtxyuTS+PvdjblLjs9PGJkMgzMOoClfjhSHpUXEZbfyPZHJCTXC2amhpcGW
	 IcSLwNs2hA1TYv7EycMA2F3F0SMrz6RhLyPgOM+PQy4ecqj5pBjR67ZvwCqSsjnQ8M
	 zCUYE4JYch6lg==
Received: from fdanis-XPS-13-9370.. (67.227.121.78.rev.sfr.net [78.121.227.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: fdanis)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8FC1717E1165
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Sep 2024 16:04:29 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 6/7] obexd: Add GetImage to bip-avrcp
Date: Wed,  4 Sep 2024 16:04:20 +0200
Message-Id: <20240904140421.283166-7-frederic.danis@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904140421.283166-1-frederic.danis@collabora.com>
References: <20240904140421.283166-1-frederic.danis@collabora.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Retrieves the image corresponding to the handle and the description,
as one of the descriptions retrieved by GetImageProperties, and store
it in a local file.

If the "transform" property description exists it should be set
to one of the value listed by GetImageProperties for this
description.
---
 obexd/client/bip-avrcp.c  | 149 ++++++++++++++++++++++++++++++++++++++
 obexd/client/bip-common.c |  23 +++++-
 obexd/client/bip-common.h |   6 ++
 profiles/audio/avrcp.c    |  10 ++-
 4 files changed, 182 insertions(+), 6 deletions(-)

diff --git a/obexd/client/bip-avrcp.c b/obexd/client/bip-avrcp.c
index fe699cddf..3f8c6fb87 100644
--- a/obexd/client/bip-avrcp.c
+++ b/obexd/client/bip-avrcp.c
@@ -32,6 +32,14 @@
 #define BIP_AVRCP_UUID "0000111A-0000-1000-8000-00805f9b34fb"
 
 #define IMG_HANDLE_TAG  0x30
+#define IMG_DESC_TAG    0x71
+
+#define EOL_CHARS "\n"
+#define IMG_DESC_BEGIN "<image-descriptor version=\"1.0\">" EOL_CHARS
+#define IMG_BEGIN "<image encoding=\"%s\" pixel=\"%s\""
+#define IMG_TRANSFORM " transformation=\"%s\""
+#define IMG_END "/>" EOL_CHARS
+#define IMG_DESC_END "</image-descriptor>" EOL_CHARS
 
 static DBusConnection *conn;
 
@@ -175,11 +183,152 @@ fail:
 	return reply;
 }
 
+static gboolean parse_get_image_dict(DBusMessage *msg, char **path,
+					char **handle, char **pixel,
+					char **encoding, char **maxsize,
+							char **transform)
+{
+	DBusMessageIter iter, array;
+
+	DBG("");
+
+	*path = NULL;
+	*handle = NULL;
+	*pixel = NULL;
+	*encoding = NULL;
+	*maxsize = NULL;
+	*transform = NULL;
+
+	dbus_message_iter_init(msg, &iter);
+
+	if (dbus_message_iter_get_arg_type(&iter) != DBUS_TYPE_STRING)
+		goto failed;
+	dbus_message_iter_get_basic(&iter, path);
+	*path = g_strdup(*path);
+	if (dbus_message_iter_get_arg_type(&iter) != DBUS_TYPE_STRING)
+		goto failed;
+	dbus_message_iter_next(&iter);
+	dbus_message_iter_get_basic(&iter, handle);
+	*handle = g_strdup(*handle);
+	dbus_message_iter_next(&iter);
+	if (dbus_message_iter_get_arg_type(&iter) != DBUS_TYPE_ARRAY)
+		goto failed;
+
+	dbus_message_iter_recurse(&iter, &array);
+
+	while (dbus_message_iter_get_arg_type(&array) == DBUS_TYPE_DICT_ENTRY) {
+		DBusMessageIter entry;
+		const char *key, *val;
+
+		dbus_message_iter_recurse(&array, &entry);
+
+		if (dbus_message_iter_get_arg_type(&entry) != DBUS_TYPE_STRING)
+			return FALSE;
+		dbus_message_iter_get_basic(&entry, &key);
+		dbus_message_iter_next(&entry);
+		dbus_message_iter_get_basic(&entry, &val);
+
+		if (g_str_equal(key, "pixel")) {
+			if (!parse_pixel_range(val, NULL, NULL, NULL))
+				goto failed;
+			*pixel = g_strdup(val);
+		} else if (g_str_equal(key, "encoding")) {
+			if (!verify_encoding(val))
+				goto failed;
+			*encoding = g_strdup(val);
+			if (*encoding == NULL)
+				goto failed;
+		} else if (g_str_equal(key, "maxsize")) {
+			*maxsize = parse_unsignednumber(val);
+			if (*maxsize == NULL)
+				goto failed;
+		} else if (g_str_equal(key, "transformation")) {
+			*transform = parse_transform(val);
+			if (*transform == NULL)
+				goto failed;
+		}
+		dbus_message_iter_next(&array);
+	}
+
+	if (*pixel == NULL)
+		*pixel = strdup("");
+	if (*encoding == NULL)
+		*encoding = strdup("");
+
+	DBG("pixel: '%s' encoding: '%s' maxsize: '%s' transform: '%s'",
+			*pixel, *encoding, *maxsize, *transform
+	);
+
+	return TRUE;
+failed:
+	g_free(*path);
+	g_free(*handle);
+	g_free(*pixel);
+	g_free(*encoding);
+	g_free(*maxsize);
+	g_free(*transform);
+	return FALSE;
+}
+
+static DBusMessage *get_image(DBusConnection *connection,
+					DBusMessage *message, void *user_data)
+{
+	struct bip_avrcp_data *bip_avrcp = user_data;
+	char *handle = NULL, *image_path = NULL, *transform = NULL,
+		*encoding = NULL, *pixel = NULL, *maxsize = NULL;
+	struct obc_transfer *transfer;
+	GObexHeader *header;
+	DBusMessage *reply = NULL;
+	GString *descriptor = NULL;
+	GError *err = NULL;
+
+	DBG("");
+
+	if (!parse_get_image_dict(message, &image_path, &handle, &pixel,
+					&encoding, &maxsize, &transform))
+		return g_dbus_create_error(message,
+				ERROR_INTERFACE ".InvalidArguments", NULL);
+
+	transfer = obc_transfer_get("x-bt/img-img", NULL, image_path, &err);
+	if (transfer == NULL)
+		goto fail;
+
+	header = g_obex_header_new_unicode(IMG_HANDLE_TAG, handle);
+	obc_transfer_add_header(transfer, header);
+
+	descriptor = g_string_new(IMG_DESC_BEGIN);
+	g_string_append_printf(descriptor, IMG_BEGIN, encoding, pixel);
+	if (transform != NULL)
+		g_string_append_printf(descriptor, IMG_TRANSFORM, transform);
+	g_string_append(descriptor, IMG_END);
+	descriptor = g_string_append(descriptor, IMG_DESC_END);
+	header = g_obex_header_new_bytes(IMG_DESC_TAG, descriptor->str,
+						descriptor->len);
+	obc_transfer_add_header(transfer, header);
+	g_string_free(descriptor, TRUE);
+
+	if (!obc_session_queue(bip_avrcp->session, transfer, NULL, NULL, &err))
+		goto fail;
+
+	return obc_transfer_create_dbus_reply(transfer, message);
+
+fail:
+	reply = g_dbus_create_error(message, ERROR_INTERFACE ".Failed", "%s",
+								err->message);
+	g_error_free(err);
+	return reply;
+}
+
 static const GDBusMethodTable bip_avrcp_methods[] = {
 	{ GDBUS_ASYNC_METHOD("GetImageProperties",
 		GDBUS_ARGS({ "handle", "s"}),
 		GDBUS_ARGS({ "properties", "aa{ss}" }),
 		get_image_properties) },
+	{ GDBUS_ASYNC_METHOD("GetImage",
+		GDBUS_ARGS({ "file", "s" }, { "handle", "s"},
+				{"properties", "a{ss}"}),
+		GDBUS_ARGS({ "transfer", "o" }, { "properties", "a{sv}" }),
+		get_image) },
 	{ GDBUS_ASYNC_METHOD("GetImageThumbnail",
 		GDBUS_ARGS({ "file", "s" }, { "handle", "s"}),
 		GDBUS_ARGS({ "transfer", "o" }, { "properties", "a{sv}" }),
diff --git a/obexd/client/bip-common.c b/obexd/client/bip-common.c
index f1ef39ab8..40955acc0 100644
--- a/obexd/client/bip-common.c
+++ b/obexd/client/bip-common.c
@@ -47,7 +47,7 @@ static const gchar *convBIP2IM(const gchar *encoding)
 	return NULL;
 }
 
-static gboolean parse_pixel_range(const gchar *dim, unsigned int *lower_ret,
+gboolean parse_pixel_range(const gchar *dim, unsigned int *lower_ret,
 						unsigned int *upper_ret,
 						gboolean *fixed_ratio_ret)
 {
@@ -122,7 +122,7 @@ static gboolean verify_unsignednumber(const char *size)
 	return TRUE;
 }
 
-static char *parse_unsignednumber(const char *size)
+char *parse_unsignednumber(const char *size)
 {
 	if (!verify_unsignednumber(size))
 		return NULL;
@@ -137,6 +137,18 @@ char *transforms[] = {
 	NULL
 };
 
+gboolean verify_encoding(const char *encoding)
+{
+	struct encconv_pair *et = encconv_table;
+
+	while (et->bip) {
+		if (g_strcmp0(encoding, et->bip) == 0)
+			return TRUE;
+		et++;
+	}
+	return FALSE;
+}
+
 static gboolean verify_transform(const char *transform)
 {
 	char **str = transforms;
@@ -149,6 +161,13 @@ static gboolean verify_transform(const char *transform)
 	return FALSE;
 }
 
+char *parse_transform(const char *transform)
+{
+	if (!verify_transform(transform))
+		return NULL;
+	return g_strdup(transform);
+}
+
 static char *parse_transform_list(const char *transform)
 {
 	char **args = NULL, **arg = NULL;
diff --git a/obexd/client/bip-common.h b/obexd/client/bip-common.h
index 0fee54636..13b0d897a 100644
--- a/obexd/client/bip-common.h
+++ b/obexd/client/bip-common.h
@@ -13,6 +13,12 @@
 
 struct prop_object;
 
+gboolean parse_pixel_range(const gchar *dim, unsigned int *lower_ret,
+						unsigned int *upper_ret,
+						gboolean *fixed_ratio_ret);
+char *parse_unsignednumber(const char *size);
+gboolean verify_encoding(const char *encoding);
+char *parse_transform(const char *transform);
 struct prop_object *parse_properties(char *data, unsigned int length,
 							int *err);
 gboolean verify_properties(struct prop_object *obj);
diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
index fe24b5a92..ee750f50b 100644
--- a/profiles/audio/avrcp.c
+++ b/profiles/audio/avrcp.c
@@ -415,10 +415,12 @@ static sdp_record_t *avrcp_ct_record(bool browsing)
 	uint16_t lp = AVCTP_CONTROL_PSM;
 	uint16_t avctp_ver = 0x0103;
 	uint16_t feat = ( AVRCP_FEATURE_CATEGORY_1 |
-						AVRCP_FEATURE_CATEGORY_2 |
-						AVRCP_FEATURE_CATEGORY_3 |
-						AVRCP_FEATURE_CATEGORY_4 |
-						AVRCP_FEATURE_CT_GET_THUMBNAIL);
+					AVRCP_FEATURE_CATEGORY_2 |
+					AVRCP_FEATURE_CATEGORY_3 |
+					AVRCP_FEATURE_CATEGORY_4 |
+					AVRCP_FEATURE_CT_GET_IMAGE_PROP |
+					AVRCP_FEATURE_CT_GET_IMAGE |
+					AVRCP_FEATURE_CT_GET_THUMBNAIL);
 
 	record = sdp_record_alloc();
 	if (!record)
-- 
2.34.1


