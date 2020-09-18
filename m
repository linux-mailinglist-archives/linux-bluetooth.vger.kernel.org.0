Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A064F2708CE
	for <lists+linux-bluetooth@lfdr.de>; Sat, 19 Sep 2020 00:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgIRWOQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 18 Sep 2020 18:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgIRWOQ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 18 Sep 2020 18:14:16 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 286ACC0613CE
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Sep 2020 15:14:16 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id e13so943131pgk.6
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Sep 2020 15:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=EhaYoylvVc+raL+jy8rDBp1lZa005/zR8HLyRALvsU4=;
        b=Gl67KLo4h5fcUFIE1zsaHBIu1GJ6qv4mVx4f1aDhwxahgApdPBHDuDIcy8RISX23uj
         +iwqXT/3JpHqVHu4RzfPUToyopnTTJbAn8syRhNx2e5PVSKfj2G6sbdaTrjzuyuqPmhb
         ecrp18ED0i4B03qp008sZae/qoa3MVq/BEC4pPRXK988Q9apxBlQXGzoIgbvqstWZZsi
         j+8EpEjVOZPWEsOuFbHN5S4+gYlWTdL5VqJX5oqy889MB4q61r6ZhgV+xELosHXda1JQ
         DRaP8ErEGMlU836b7L5fer9l1LLU8Mk7qJx0IOvZFUdEKoQinpVgR7zRsSWHPypkqhRc
         URDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=EhaYoylvVc+raL+jy8rDBp1lZa005/zR8HLyRALvsU4=;
        b=gVR6w99STzB2Fv8THNvXZxA7A6RuPhPwsZaadk5183ZGZtFw2ImJ9AsV1d4UU8Vafj
         Ewx/qVvESfxCc9xJChjacMIBS9YQhb+WcBT7ZhmjyxLlafNorlIlNUg2c6Cy4Z27R3SW
         oEEYVB1KnD6utrbv8Y8mevS/kg21gEXwjmsoN7OaVxH1lRA3TjBlpuC2afVhFs7a+dup
         IXuHXA68SBKpF/k5hWfTS7jKOohbbhUScjI2oj4XqKZHCjnAjIfiBF/xHEbOW9sA9W+H
         klGmltJRJAhLOM+3o8Wt+wcC3Mguy4ofKJtzAZN3R1zKPsSuB6JqClN4eG25fqPfImhW
         IV2A==
X-Gm-Message-State: AOAM533EZ7hCWw2ZtRjUPneb/BBTEUmRP4z+IEO6EtPlgXvt2SQd0aog
        tliDOet/cm+J0gu+BEPq1In3IxK84ew1FgtEx6Ef
X-Google-Smtp-Source: ABdhPJwWfHIj/rH4a1Z4vuDuSruR43CLulLTtpGQOYEkRnIIgY12CjmMo0O6BOAcYLzH2wW8sqXSgCF13kJ9IwINc3y7
Sender: "danielwinkler via sendgmr" 
        <danielwinkler@danielwinkler-linux.mtv.corp.google.com>
X-Received: from danielwinkler-linux.mtv.corp.google.com ([2620:15c:202:201:f693:9fff:fef4:4e59])
 (user=danielwinkler job=sendgmr) by 2002:a17:90a:bc08:: with SMTP id
 w8mr14614965pjr.168.1600467255667; Fri, 18 Sep 2020 15:14:15 -0700 (PDT)
Date:   Fri, 18 Sep 2020 15:13:51 -0700
In-Reply-To: <20200918221357.3436905-1-danielwinkler@google.com>
Message-Id: <20200918151041.Bluez.v2.4.Ic4a3667da774f5f34477d5168a68a9280657e2da@changeid>
Mime-Version: 1.0
References: <20200918221357.3436905-1-danielwinkler@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [Bluez PATCH v2 04/10] advertising: Parse intervals and tx power from adv
From:   Daniel Winkler <danielwinkler@google.com>
To:     luiz.von.dentz@intel.com
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        linux-bluetooth@vger.kernel.org,
        Daniel Winkler <danielwinkler@google.com>,
        Sonny Sasaka <sonnysasaka@chromium.org>,
        Alain Michaud <alainm@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This change adds parsers for the advertising intervals and tx power
properties of the LEAdvertisement1 object. It validates that each field
adheres to the 5.2 spec, and that min and max intervals are compatible
with each other, i.e. that min interval is less than max interval.

A note here for maintainers: The tx power that is sent in the hci
parameter command is an int8_t, but as far as I can tell, there is no
clean way to use a signed 8-bit integer in dbus. The dbus byte type
seems incompatible with negative values in high-level languages (python)
without awkward usage manipulation on the client side. For this reason,
I chose to use an int16_t type for the tx power dbus field, which is
then downcasted to the int8_t in bluetoothd, which at least makes the
signed-ness of the type crystal clear to the dbus client that uses it.

This change is manually verified by ensuring the intervals and tx power
parameters are correctly parsed from the LEAdvertisement1 object, and
that the parse fails if the parameters are incorrect or not compatible
with each other.

Reviewed-by: Sonny Sasaka <sonnysasaka@chromium.org>
Reviewed-by: Alain Michaud <alainm@chromium.org>
---

Changes in v2: None

 src/advertising.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/src/advertising.c b/src/advertising.c
index ad2eeefb9..3c173fef0 100644
--- a/src/advertising.c
+++ b/src/advertising.c
@@ -63,6 +63,11 @@ struct btd_adv_manager {
 #define AD_TYPE_BROADCAST 0
 #define AD_TYPE_PERIPHERAL 1
 
+/* BLUETOOTH SPECIFICATION Version 5.2 | Vol 4, Part E, page 2585
+ * defines tx power value indicating no preference
+ */
+#define ADV_TX_POWER_NO_PREFERENCE 0x7F
+
 struct btd_adv_client {
 	struct btd_adv_manager *manager;
 	char *owner;
@@ -83,6 +88,9 @@ struct btd_adv_client {
 	struct bt_ad *data;
 	struct bt_ad *scan;
 	uint8_t instance;
+	uint32_t min_interval;
+	uint32_t max_interval;
+	int8_t tx_power;
 };
 
 struct dbus_obj_match {
@@ -946,6 +954,74 @@ static bool parse_secondary(DBusMessageIter *iter,
 	return false;
 }
 
+static bool parse_min_interval(DBusMessageIter *iter,
+					struct btd_adv_client *client)
+{
+	if (!iter)
+		return false;
+
+	if (dbus_message_iter_get_arg_type(iter) != DBUS_TYPE_UINT32)
+		return false;
+
+	dbus_message_iter_get_basic(iter, &client->min_interval);
+
+	/* BLUETOOTH SPECIFICATION Version 5.2 | Vol 4, Part E, page 2584
+	 * defines acceptable interval range
+	 */
+	if (client->min_interval < 0x20 || client->min_interval > 0xFFFFFF) {
+		client->min_interval = 0;
+		return false;
+	}
+
+	return true;
+}
+
+static bool parse_max_interval(DBusMessageIter *iter,
+					struct btd_adv_client *client)
+{
+	if (!iter)
+		return false;
+
+	if (dbus_message_iter_get_arg_type(iter) != DBUS_TYPE_UINT32)
+		return false;
+
+	dbus_message_iter_get_basic(iter, &client->max_interval);
+
+	/* BLUETOOTH SPECIFICATION Version 5.2 | Vol 4, Part E, page 2584
+	 * defines acceptable interval range
+	 */
+	if (client->max_interval < 0x20 || client->max_interval > 0xFFFFFF) {
+		client->max_interval = 0;
+		return false;
+	}
+
+	return true;
+}
+
+static bool parse_tx_power(DBusMessageIter *iter,
+					struct btd_adv_client *client)
+{
+	int16_t val;
+
+	if (!iter)
+		return false;
+
+	if (dbus_message_iter_get_arg_type(iter) != DBUS_TYPE_INT16)
+		return false;
+
+	dbus_message_iter_get_basic(iter, &val);
+
+	/* BLUETOOTH SPECIFICATION Version 5.2 | Vol 4, Part E, page 2585
+	 * defines acceptable tx power range
+	 */
+	if (val < -127 || val > 20)
+		return false;
+
+	client->tx_power = val;
+
+	return true;
+}
+
 static struct adv_parser {
 	const char *name;
 	bool (*func)(DBusMessageIter *iter, struct btd_adv_client *client);
@@ -964,6 +1040,9 @@ static struct adv_parser {
 	{ "Discoverable", parse_discoverable },
 	{ "DiscoverableTimeout", parse_discoverable_timeout },
 	{ "SecondaryChannel", parse_secondary },
+	{ "MinInterval", parse_min_interval },
+	{ "MaxInterval", parse_max_interval },
+	{ "TxPower", parse_tx_power },
 	{ },
 };
 
@@ -1092,6 +1171,13 @@ static DBusMessage *parse_advertisement(struct btd_adv_client *client)
 		goto fail;
 	}
 
+	if (client->min_interval > client->max_interval) {
+		/* Min interval must not be bigger than max interval */
+		error("MinInterval must be less than MaxInterval (%u > %u)",
+				client->min_interval, client->max_interval);
+		goto fail;
+	}
+
 	err = refresh_adv(client, add_adv_callback, &client->add_adv_id);
 	if (!err)
 		return NULL;
@@ -1167,6 +1253,9 @@ static struct btd_adv_client *client_create(struct btd_adv_manager *manager,
 
 	client->manager = manager;
 	client->appearance = UINT16_MAX;
+	client->tx_power = ADV_TX_POWER_NO_PREFERENCE;
+	client->min_interval = 0;
+	client->max_interval = 0;
 
 	return client;
 
-- 
2.28.0.681.g6f77f65b4e-goog

