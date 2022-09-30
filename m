Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E555F098D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Sep 2022 13:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbiI3LJ1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 30 Sep 2022 07:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbiI3LJJ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 30 Sep 2022 07:09:09 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1EB11CB19
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Sep 2022 03:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664534752; x=1696070752;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wG77UBcsKMXbhl5s3rmxAWqlXVk8WnM6p4upH/aHEaM=;
  b=nS2BFSmjcsfppsjfp/R4pb438PMNMNNOSIPc9bhHaNrBfmSewfScg1aB
   QWKhDuUsCtY7s1OXuLBrTUN0Syx208YFQ2FOpvSwHyqRStzu9GsYwQoX8
   ZYPHoeor83+qXQhxYGoG+HEX74PxdE9C/hVoidkbIwoNdzWLSpjNDcCYz
   ZPlI/Uhr9c7nhq63nmI/taSy/ov56l7DVX+NQOGuL5l5ZqaeFVv2jWV7U
   sM9E1OLUp1h4g+MYCv9IhZTiUIfiL5IwUtSL8g7D1uKYBCve40/BZSPA9
   /64wsxeFVADPor+mCljI0kM+t6Ld80+3iKlGBFxeoeVSGNjWVvXJ6Iblz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="364005036"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="364005036"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2022 03:44:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="573825039"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; 
   d="scan'208";a="573825039"
Received: from intel-latitude-e5450.iind.intel.com ([10.224.186.32])
  by orsmga003.jf.intel.com with ESMTP; 30 Sep 2022 03:44:39 -0700
From:   Sathish Narasimman <sathish.narasimman@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sathish Narasimman <sathish.narasimman@intel.com>
Subject: [PATCH 1/3] audio/transport: seperate a2dp and bap transport to update volume
Date:   Fri, 30 Sep 2022 16:15:21 +0530
Message-Id: <20220930104523.2572-1-sathish.narasimman@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Identify BAP and a2dp transport to update the transport volume.
Also add properties volume for bap_transport.
---
 profiles/audio/media.c     |   2 +-
 profiles/audio/transport.c | 120 ++++++++++++++++++++++++++++++++++---
 profiles/audio/transport.h |   7 ++-
 3 files changed, 117 insertions(+), 12 deletions(-)

diff --git a/profiles/audio/media.c b/profiles/audio/media.c
index c9328ab9bd6e..0e3c7cbbaf2c 100644
--- a/profiles/audio/media.c
+++ b/profiles/audio/media.c
@@ -523,7 +523,7 @@ static gboolean set_configuration(struct media_endpoint *endpoint,
 		return FALSE;
 
 	init_volume = media_player_get_device_volume(device);
-	media_transport_update_volume(transport, init_volume);
+	media_a2dp_transport_update_volume(transport, init_volume);
 
 	msg = dbus_message_new_method_call(endpoint->sender, endpoint->path,
 						MEDIA_ENDPOINT_INTERFACE,
diff --git a/profiles/audio/transport.c b/profiles/audio/transport.c
index 41339da51e17..a606d45eb628 100644
--- a/profiles/audio/transport.c
+++ b/profiles/audio/transport.c
@@ -91,6 +91,7 @@ struct bap_transport {
 	uint8_t			rtn;
 	uint16_t		latency;
 	uint32_t		delay;
+	int8_t			volume;
 };
 
 struct media_transport {
@@ -709,7 +710,8 @@ static gboolean get_delay_reporting(const GDBusPropertyTable *property,
 	return TRUE;
 }
 
-static gboolean volume_exists(const GDBusPropertyTable *property, void *data)
+static gboolean volume_a2dp_exists(const GDBusPropertyTable *property,
+					void *data)
 {
 	struct media_transport *transport = data;
 	struct a2dp_transport *a2dp = transport->data;
@@ -717,7 +719,8 @@ static gboolean volume_exists(const GDBusPropertyTable *property, void *data)
 	return a2dp->volume >= 0;
 }
 
-static gboolean get_volume(const GDBusPropertyTable *property,
+
+static gboolean get_a2dp_volume(const GDBusPropertyTable *property,
 					DBusMessageIter *iter, void *data)
 {
 	struct media_transport *transport = data;
@@ -729,7 +732,7 @@ static gboolean get_volume(const GDBusPropertyTable *property,
 	return TRUE;
 }
 
-static void set_volume(const GDBusPropertyTable *property,
+static void set_a2dp_volume(const GDBusPropertyTable *property,
 			DBusMessageIter *iter, GDBusPendingPropertySet id,
 			void *data)
 {
@@ -769,6 +772,58 @@ error:
 					"Invalid arguments in method call");
 }
 
+static gboolean volume_bap_exists(const GDBusPropertyTable *property,
+					void *data)
+{
+	struct media_transport *transport = data;
+	struct bap_transport *bap = transport->data;
+
+	return bap->volume >= 0;
+}
+
+static gboolean get_bap_volume(const GDBusPropertyTable *property,
+					DBusMessageIter *iter, void *data)
+{
+	struct media_transport *transport = data;
+	struct bap_transport *bap = transport->data;
+	uint16_t volume = (uint16_t)bap->volume;
+
+	dbus_message_iter_append_basic(iter, DBUS_TYPE_UINT16, &volume);
+
+	return TRUE;
+}
+
+static void set_bap_volume(const GDBusPropertyTable *property,
+			   DBusMessageIter *iter, GDBusPendingPropertySet id,
+			   void *data)
+{
+	struct media_transport *transport = data;
+	struct bap_transport *bap = transport->data;
+	uint16_t arg;
+	int8_t volume;
+
+	if (dbus_message_iter_get_arg_type(iter) != DBUS_TYPE_UINT16)
+		goto error;
+
+	dbus_message_iter_get_basic(iter, &arg);
+	if (arg > INT8_MAX)
+		goto error;
+
+	g_dbus_pending_property_success(id);
+
+	volume = (int8_t)arg;
+	if (bap->volume == volume)
+		return;
+
+	/*TODO vcp_send_volume */
+	return;
+
+error:
+	g_dbus_pending_property_error(id, ERROR_INTERFACE ".InvalidArguments",
+					"Invalid arguments in method call");
+}
+
+
 static gboolean endpoint_exists(const GDBusPropertyTable *property, void *data)
 {
 	struct media_transport *transport = data;
@@ -809,7 +864,8 @@ static const GDBusPropertyTable a2dp_properties[] = {
 	{ "Configuration", "ay", get_configuration },
 	{ "State", "s", get_state },
 	{ "Delay", "q", get_delay_reporting, NULL, delay_reporting_exists },
-	{ "Volume", "q", get_volume, set_volume, volume_exists },
+	{ "Volume", "q", get_a2dp_volume, set_a2dp_volume,
+					volume_a2dp_exists },
 	{ "Endpoint", "o", get_endpoint, NULL, endpoint_exists,
 				G_DBUS_PROPERTY_FLAG_EXPERIMENTAL },
 	{ }
@@ -970,6 +1026,7 @@ static const GDBusPropertyTable bap_properties[] = {
 	{ "Retransmissions", "y", get_retransmissions },
 	{ "Latency", "q", get_latency },
 	{ "Delay", "u", get_delay },
+	{ "Volume", "q", get_bap_volume, set_bap_volume, volume_bap_exists },
 	{ "Endpoint", "o", get_endpoint, NULL, endpoint_exists },
 	{ "Location", "u", get_location },
 	{ "Metadata", "ay", get_metadata },
@@ -1403,6 +1460,7 @@ static int media_transport_init_bap(struct media_transport *transport,
 	bap->rtn = qos->rtn;
 	bap->latency = qos->latency;
 	bap->delay = qos->delay;
+	bap->volume = 127;
 	bap->state_id = bt_bap_state_register(bt_bap_stream_get_session(stream),
 						bap_state_changed,
 						bap_connecting,
@@ -1502,14 +1560,22 @@ struct btd_device *media_transport_get_dev(struct media_transport *transport)
 	return transport->device;
 }
 
-int8_t media_transport_get_volume(struct media_transport *transport)
+int8_t media_a2dp_transport_get_volume(struct media_transport *transport)
 {
 	struct a2dp_transport *a2dp = transport->data;
+
 	return a2dp->volume;
 }
 
-void media_transport_update_volume(struct media_transport *transport,
-								int8_t volume)
+int8_t media_bap_transport_get_volume(struct media_transport *transport)
+{
+	struct bap_transport *bap = transport->data;
+
+	return bap->volume;
+}
+
+void media_a2dp_transport_update_volume(struct media_transport *transport,
+					int8_t volume)
 {
 	struct a2dp_transport *a2dp = transport->data;
 
@@ -1527,6 +1593,25 @@ void media_transport_update_volume(struct media_transport *transport,
 					MEDIA_TRANSPORT_INTERFACE, "Volume");
 }
 
+void media_bap_transport_update_volume(struct media_transport *transport,
+								int8_t volume)
+{
+	struct bap_transport *bap = transport->data;
+
+	if (volume < 0)
+		return;
+
+	/* Check if volume really changed */
+	if (bap->volume == volume)
+		return;
+
+	bap->volume = volume;
+
+	g_dbus_emit_property_changed(btd_get_dbus_connection(),
+					transport->path,
+					MEDIA_TRANSPORT_INTERFACE, "Volume");
+}
+
 int8_t media_transport_get_device_volume(struct btd_device *dev)
 {
 	GSList *l;
@@ -1537,12 +1622,21 @@ int8_t media_transport_get_device_volume(struct btd_device *dev)
 	/* Attempt to locate the transport to get its volume */
 	for (l = transports; l; l = l->next) {
 		struct media_transport *transport = l->data;
+		const char *uuid = media_endpoint_get_uuid(transport->endpoint);
+
+		/* Locate BAP Transport */
+		if (!strcasecmp(uuid, PAC_SINK_UUID) &&
+				!strcasecmp(uuid, PAC_SOURCE_UUID)) {
+
+			return media_bap_transport_get_volume(transport);
+		}
+
 		if (transport->device != dev)
 			continue;
 
 		/* Volume is A2DP only */
 		if (media_endpoint_get_sep(transport->endpoint))
-			return media_transport_get_volume(transport);
+			return media_a2dp_transport_get_volume(transport);
 	}
 
 	/* If transport volume doesn't exists use device_volume */
@@ -1560,12 +1654,20 @@ void media_transport_update_device_volume(struct btd_device *dev,
 	/* Attempt to locate the transport to set its volume */
 	for (l = transports; l; l = l->next) {
 		struct media_transport *transport = l->data;
+		const char *uuid = media_endpoint_get_uuid(transport->endpoint);
+
+		/* Locate BAP Transport */
+		if (!strcasecmp(uuid, PAC_SINK_UUID)) {
+			media_bap_transport_update_volume(transport, volume);
+			return;
+		}
+
 		if (transport->device != dev)
 			continue;
 
 		/* Volume is A2DP only */
 		if (media_endpoint_get_sep(transport->endpoint)) {
-			media_transport_update_volume(transport, volume);
+			media_a2dp_transport_update_volume(transport, volume);
 			return;
 		}
 	}
diff --git a/profiles/audio/transport.h b/profiles/audio/transport.h
index 102fc3cf1153..3cbefa5d7bee 100644
--- a/profiles/audio/transport.h
+++ b/profiles/audio/transport.h
@@ -20,10 +20,13 @@ struct media_transport *media_transport_create(struct btd_device *device,
 void media_transport_destroy(struct media_transport *transport);
 const char *media_transport_get_path(struct media_transport *transport);
 struct btd_device *media_transport_get_dev(struct media_transport *transport);
-int8_t media_transport_get_volume(struct media_transport *transport);
+int8_t media_a2dp_transport_get_volume(struct media_transport *transport);
+int8_t media_bap_transport_get_volume(struct media_transport *transport);
 void media_transport_update_delay(struct media_transport *transport,
 							uint16_t delay);
-void media_transport_update_volume(struct media_transport *transport,
+void media_a2dp_transport_update_volume(struct media_transport *transport,
+								int8_t volume);
+void media_bap_transport_update_volume(struct media_transport *transport,
 								int8_t volume);
 void transport_get_properties(struct media_transport *transport,
 							DBusMessageIter *iter);
-- 
2.25.1

