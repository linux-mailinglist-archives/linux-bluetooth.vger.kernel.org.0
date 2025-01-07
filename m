Return-Path: <linux-bluetooth+bounces-9573-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CE9A03E11
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Jan 2025 12:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED9403A3B6D
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Jan 2025 11:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D36E1E1044;
	Tue,  7 Jan 2025 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JIp842Pv"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B22F14AD2D
	for <linux-bluetooth@vger.kernel.org>; Tue,  7 Jan 2025 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736250275; cv=none; b=O0EdTKNV7c3qos6d42Fj0PqNiWul3jjGZ37EIesXjCVve/sf1CFEzrd9RyD/8dqaY0EQOLGjqPkV5ul12Cacd5vAxmyJ2cztT/+9jlrxnM/gCg2O3EKr4oLE+lF8sYiz108iAgmR+VsxrLq0GPygTcG5SuAPYyQmMcZmYbOG4ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736250275; c=relaxed/simple;
	bh=+2muwJq5MrLajAqyB1eGJ5qU8SfjnzLlD7wvmpi8z+c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rMgp8oOe75MMuMIygsW/SsULLvLGMtPgxvYlP6Y3ztrGbdp3A879qiBLtcAKjG0Aenoq1rK8kAXIPwfqCJdO2LWojBs0r/GSsN7z6RwTPdwhzyyVxolf6bl7XwmeKJytOjBQvqb0cJTJfmV8dy2E9tFZd3gmmpBXIou+UVCkQyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JIp842Pv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5079oUFY002526
	for <linux-bluetooth@vger.kernel.org>; Tue, 7 Jan 2025 11:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nj37RD3nNBlxposqnjz1ny
	N+IINTwVrnrc/3LRoBCLY=; b=JIp842PvIP+MRLyer0TbXjuI8t+ULOr06UA5zm
	YQXnanLgb9Mt8CyCr3t77R+e5WDZoV2sTVDJV8DWhBkA0327eyVHT9gjfirng0FO
	8P6pgk7+Gi7bwXeUvnWzyQfSwoS5MFcJ0OGHi26DOPUQeqCQTPERJ9xGPIOSkXD8
	IlKDV0ETcty7/UZ3CEQxxZVpwFeHBE4X3UW+lYB5O2WAvKaYemVUvNpIKhp1zdz9
	BFigJB5zTW/ar7wdGtQyZxsiutPak85B18fapTqNEB5ws2URxHYo4tDZO4iX8OqQ
	8yD+wZWd01k4YNoYqYHpcVxJe6G4EDVzQT9Is/G0QI26qq1g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44120909ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-bluetooth@vger.kernel.org>; Tue, 07 Jan 2025 11:44:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507BiV9f009822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-bluetooth@vger.kernel.org>; Tue, 7 Jan 2025 11:44:31 GMT
Received: from hu-amisjain-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 03:44:29 -0800
From: Amisha Jain <quic_amisjain@quicinc.com>
To: <linux-bluetooth@vger.kernel.org>
CC: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        <quic_anubhavg@quicinc.com>
Subject: [PATCH v1] obex: Implement support for message listing format version 1.1 for MCE
Date: Tue, 7 Jan 2025 17:14:05 +0530
Message-ID: <20250107114405.3593680-1-quic_amisjain@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JiYg1rG3BJMtSHzTYlUPMsVMI8FI-4YL
X-Proofpoint-ORIG-GUID: JiYg1rG3BJMtSHzTYlUPMsVMI8FI-4YL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501070097

As per spec, Messages-Listing Format Version 1.1 is being marked
mandatory feature to be supported in MAP 1.3 & above versions.
This change is added for MAP client role.

This change is required for passing below testcases-
1) MAP/MCE/MFB/BV-01-C
Verify that the MCE correctly advertises the correct feature bits
in the MNS SDP record.
2) MAP/MCE/MFB/BV-03-C
Verify that the MCE correctly advertises the correct MapSupportedFeatures
bits in the MNS SDP record during MAS connection.

Also add the Messages-Listing Format Version 1.1 as supported
in mns sdp record.

---
 obexd/client/map.c | 169 +++++++++++++++++++++++++++++++++++++++++++++
 src/profile.c      |   2 +-
 2 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/obexd/client/map.c b/obexd/client/map.c
index 29b0ed96e..c6f3dd342 100644
--- a/obexd/client/map.c
+++ b/obexd/client/map.c
@@ -123,6 +123,11 @@ struct map_msg {
 	uint64_t attachment_size;
 	uint8_t flags;
 	char *folder;
+	char *delivery_status;
+	uint64_t conversation_id;
+	char *conversation_name;
+	char *direction;
+	char *attachment_mime_types;
 	GDBusPendingPropertySet pending;
 };
 
@@ -418,6 +423,10 @@ static void map_msg_free(void *data)
 	g_free(msg->recipient_address);
 	g_free(msg->type);
 	g_free(msg->status);
+	g_free(msg->delivery_status);
+	g_free(msg->conversation_name);
+	g_free(msg->direction);
+	g_free(msg->attachment_mime_types);
 	g_free(msg);
 }
 
@@ -778,6 +787,93 @@ static void set_deleted(const GDBusPropertyTable *property,
 	set_status(property, iter, id, STATUS_DELETE, data);
 }
 
+static gboolean delivery_status_exists(const GDBusPropertyTable *property,
+								void *data)
+{
+	struct map_msg *msg = data;
+
+	return msg->delivery_status != NULL;
+}
+
+static gboolean get_delivery_status(const GDBusPropertyTable *property,
+					DBusMessageIter *iter, void *data)
+{
+	struct map_msg *msg = data;
+
+	dbus_message_iter_append_basic(iter, DBUS_TYPE_STRING,
+						&msg->delivery_status);
+
+	return TRUE;
+}
+
+static gboolean get_conversation_id(const GDBusPropertyTable *property,
+					DBusMessageIter *iter, void *data)
+{
+	struct map_msg *msg = data;
+
+	dbus_message_iter_append_basic(iter, DBUS_TYPE_UINT64,
+						&msg->conversation_id);
+
+	return TRUE;
+}
+
+static gboolean conversation_name_exists(const GDBusPropertyTable *property,
+								void *data)
+{
+	struct map_msg *msg = data;
+
+	return msg->conversation_name != NULL;
+}
+
+static gboolean get_conversation_name(const GDBusPropertyTable *property,
+					DBusMessageIter *iter, void *data)
+{
+	struct map_msg *msg = data;
+
+	dbus_message_iter_append_basic(iter, DBUS_TYPE_STRING,
+						&msg->conversation_name);
+
+	return TRUE;
+}
+
+static gboolean direction_exists(const GDBusPropertyTable *property,
+								void *data)
+{
+	struct map_msg *msg = data;
+
+	return msg->direction != NULL;
+}
+
+static gboolean get_direction(const GDBusPropertyTable *property,
+					DBusMessageIter *iter, void *data)
+{
+	struct map_msg *msg = data;
+
+	dbus_message_iter_append_basic(iter, DBUS_TYPE_STRING,
+							&msg->direction);
+
+	return TRUE;
+}
+
+static gboolean attachment_mime_exists(const GDBusPropertyTable *property,
+								void *data)
+{
+	struct map_msg *msg = data;
+
+	return msg->attachment_mime_types != NULL;
+}
+
+static gboolean get_attachment_mime_types(const GDBusPropertyTable *property,
+					DBusMessageIter *iter, void *data)
+{
+	struct map_msg *msg = data;
+
+	dbus_message_iter_append_basic(iter, DBUS_TYPE_STRING,
+						&msg->attachment_mime_types);
+
+	return TRUE;
+}
+
 static const GDBusMethodTable map_msg_methods[] = {
 	{ GDBUS_METHOD("Get",
 			GDBUS_ARGS({ "targetfile", "s" },
@@ -809,6 +905,13 @@ static const GDBusPropertyTable map_msg_properties[] = {
 	{ "Sent", "b", get_sent },
 	{ "Protected", "b", get_protected },
 	{ "Deleted", "b", NULL, set_deleted },
+	{ "DeliveryStatus", "s", get_delivery_status, NULL, delivery_status_exists },
+	{ "ConversationId", "t", get_conversation_id },
+	{ "ConversationName", "s", get_conversation_name, NULL,
+						conversation_name_exists },
+	{ "Direction", "s", get_direction, NULL, direction_exists },
+	{ "AttachmentMimeTypes", "s", get_attachment_mime_types, NULL,
+							attachment_mime_exists },
 	{ }
 };
 
@@ -1061,6 +1164,67 @@ static void parse_protected(struct map_msg *msg, const char *value)
 						MAP_MSG_INTERFACE, "Protected");
 }
 
+static void parse_delivery_status(struct map_msg *msg, const char *value)
+{
+	if (g_strcmp0(msg->delivery_status, value) == 0)
+		return;
+
+	g_free(msg->delivery_status);
+	msg->delivery_status = g_strdup(value);
+
+	g_dbus_emit_property_changed(conn, msg->path,
+					MAP_MSG_INTERFACE, "DeliveryStatus");
+}
+
+static void parse_conversation_id(struct map_msg *msg, const char *value)
+{
+	uint64_t conversation_id = strtoull(value, NULL, 16);
+
+	if (msg->conversation_id == conversation_id)
+		return;
+
+	msg->conversation_id = conversation_id;
+
+	g_dbus_emit_property_changed(conn, msg->path,
+					MAP_MSG_INTERFACE, "ConversationId");
+}
+
+static void parse_conversation_name(struct map_msg *msg, const char *value)
+{
+	if (g_strcmp0(msg->conversation_name, value) == 0)
+		return;
+
+	g_free(msg->conversation_name);
+	msg->conversation_name = g_strdup(value);
+
+	g_dbus_emit_property_changed(conn, msg->path,
+						MAP_MSG_INTERFACE, "ConversationName");
+}
+
+static void parse_direction(struct map_msg *msg, const char *value)
+{
+	if (g_strcmp0(msg->direction, value) == 0)
+		return;
+
+	g_free(msg->direction);
+	msg->direction = g_strdup(value);
+
+	g_dbus_emit_property_changed(conn, msg->path,
+						MAP_MSG_INTERFACE, "Direction");
+}
+
+static void parse_mime_types(struct map_msg *msg, const char *value)
+{
+	if (g_strcmp0(msg->attachment_mime_types, value) == 0)
+		return;
+
+	g_free(msg->attachment_mime_types);
+	msg->attachment_mime_types = g_strdup(value);
+
+	g_dbus_emit_property_changed(conn, msg->path,
+						MAP_MSG_INTERFACE, "AttachmentMimeTypes");
+}
+
 static const struct map_msg_parser {
 	const char *name;
 	void (*func) (struct map_msg *msg, const char *value);
@@ -1081,6 +1245,11 @@ static const struct map_msg_parser {
 		{ "read", parse_read },
 		{ "sent", parse_sent },
 		{ "protected", parse_protected },
+		{ "delivery_status", parse_delivery_status},
+		{ "conversation_id", parse_conversation_id},
+		{ "conversation_name", parse_conversation_name},
+		{ "direction", parse_direction},
+		{ "attachment_mime_types", parse_mime_types},
 		{ }
 };
 
diff --git a/src/profile.c b/src/profile.c
index 6bc6778de..70ac058f4 100644
--- a/src/profile.c
+++ b/src/profile.c
@@ -563,7 +563,7 @@
 			<text value=\"%s\"/>				\
 		</attribute>						\
 		<attribute id=\"0x0317\">				\
-			<uint32 value=\"0x0000007f\"/>			\
+			<uint32 value=\"0x0000027f\"/>			\
 		</attribute>						\
 		<attribute id=\"0x0200\">				\
 			<uint16 value=\"%u\" name=\"psm\"/>		\
-- 
2.34.1


