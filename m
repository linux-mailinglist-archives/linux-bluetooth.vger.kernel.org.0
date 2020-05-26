Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFDE1B51A5
	for <lists+linux-bluetooth@lfdr.de>; Thu, 23 Apr 2020 03:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgDWBLe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Apr 2020 21:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725846AbgDWBLd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Apr 2020 21:11:33 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BFFC03C1AA
        for <linux-bluetooth@vger.kernel.org>; Wed, 22 Apr 2020 18:11:33 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h69so2025033pgc.8
        for <linux-bluetooth@vger.kernel.org>; Wed, 22 Apr 2020 18:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8r4B4QfH6JsmLMSc/RDjYDviSQ8QJBaUnJFCgEAW1Hg=;
        b=gkl9XHzUz9r+Zzv7ocrKFKJ1j3thLR+HCSF9z2MWmJI7nql51vK7u6ohVJ61dCZwkq
         USf0gqZL5/Y85XZnHgPG4oKUlK8qgVV2OdzMNe7HqPHBmTgPuVSi1O2qHHuqZINS7Rmp
         O+fI0ef7jJnwOMDsPLbZ5aplA4nMkWEgWBCu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8r4B4QfH6JsmLMSc/RDjYDviSQ8QJBaUnJFCgEAW1Hg=;
        b=MWgmaGYG9W2wkHIjZoOPeF7UHU73MTBAAa9COrCk+OEjPUzAdxeH15BaAl3Onvw0zs
         e96zOhxuXCNMpVTbKsi/NjEq9VVTBBl3O+b9x7pQtlIJp7aEX3nBjguNw6L4YqvGoRmg
         D/CEmtG40eLZD3zglOjqhnXWcqKH2OaKkmaI8LT8ChsJPFr/Y2kWJ1o9XGDL396AIOZm
         hH6Ai3LqNzUWKcITtwczDMdmnwH7LgQ0hSkbLyw5VbZl9KOwsWnY0HgQIgMaFA/h3BgQ
         eJZxSXMtaMTk0DTq3PZ6vZniVWaoCp9MTZ7NVSrAg0bwwuAjRr7vP5ECQt3WJP4pORNF
         PaCQ==
X-Gm-Message-State: AGi0PuaJYEalabK9KIhPBKdT2UqPwhPRGtxicJBtUgLXpfrY2lsUwu46
        VXFWjEdafjT1rzgPbnUq1m+Sow9hiCw=
X-Google-Smtp-Source: APiQypJO3awqkfVPJYPqflVRryEXQaa6yHZSdNJxyvInbjDzmNqik4pkL6Nzk+HdqDoH8tGe4jgRTw==
X-Received: by 2002:aa7:8dc1:: with SMTP id j1mr1308686pfr.285.1587604292761;
        Wed, 22 Apr 2020 18:11:32 -0700 (PDT)
Received: from mcchou0.mtv.corp.google.com ([2620:15c:202:201:b46:ac84:1014:9555])
        by smtp.gmail.com with ESMTPSA id g43sm447442pje.22.2020.04.22.18.11.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2020 18:11:32 -0700 (PDT)
From:   Miao-chen Chou <mcchou@chromium.org>
To:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>
Cc:     Yoni Shavit <yshavit@chromium.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Alain Michaud <alainm@chromium.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Michael Sun <michaelfsun@google.com>,
        Miao-chen Chou <mcchou@chromium.org>
Subject: [BlueZ PATCH v3] doc: Describe the new Advertisement Monitor support
Date:   Wed, 22 Apr 2020 18:11:28 -0700
Message-Id: <20200422181118.BlueZ.v3.1.If9f6be992cbaeaa35423de29da6db28675b35fcc@changeid>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This describes the following commands and event.
- Read Advertisement Monitor Features command
- Add Advertisement Patterns Monitor command
- Remove Advertisement Monitor command
- Advertisement Monitor Added event
- Advertisement Monitor Removed event
Note that the content of a monitor can differ based on its type. For now we
introduce only pattern-based monitor, so you may find that unlike the
command of removing monitor(s), the Add command is tied to a specific type.
---

Changes in v3:
- Remove Advertisement Monitor can perform the removal of one monitor
or all monitors.
- Add Read Advertisement Monitor Features command.
- Add Advertisement Monitor Added event and dvertisement Monitor Removed
event.

Changes in v2:
- Combine commands to remove one monitor and remove all monitors. The
refined command takes multiple handles and an extra field to indicate
whether to remove all monitors.

 doc/mgmt-api.txt | 118 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/doc/mgmt-api.txt b/doc/mgmt-api.txt
index 39f23c456..3cef3edbf 100644
--- a/doc/mgmt-api.txt
+++ b/doc/mgmt-api.txt
@@ -3138,6 +3138,102 @@ Read Security Information Command
 				Invalid Index
 
 
+Read Advertisement Monitor Features Command
+===========================================
+
+	Command Code:		0x0049
+	Controller Index:	<controller id>
+	Command Parameters:
+	Return Parameters:	Supported_Features (4 octets)
+				Adopted_Features (4 octets)
+
+	This command is used to read the advertisement monitor features supported
+	by the controller and stack. Supported_Features lists all related
+	features supported by the controller while Adopted_Features lists the
+	ones currently adopted by the stack.
+
+	Supported_Features and Adopted_Features are bitmasks with currently the
+	following available bits:
+
+		1	Advertisement content monitoring based on Microsoft HCI
+			extension.
+
+
+Add Advertisement Patterns Monitor Command
+=========================================
+
+	Command Code:		0x004A
+	Controller Index:	<controller id>
+	Command Parameters:	Pattern_count (1 Octets)
+				Pattern1 {
+					AD_Data_Type (1 Octet)
+					Offset (1 Octet)
+					Length (1 Octet)
+					Value (variable length)
+				}
+				Pattern2 { }
+				...
+	Return Parameters:	Monitor_Handle (4 Octets)
+
+	This command is used to add an advertisement monitor whose filtering
+	conditions are patterns. The kernel would track the number of registered
+	monitors to determine whether to perform LE scanning while there is
+	ongoing LE scanning for other intentions, such as auto-reconnection and
+	discovery session. If the controller supports advertisement filtering,
+	the kernel would offload the content filtering to the controller in
+	order to reduce power consumption; otherwise the kernel ignore the
+	content of the monitor. Note that if the there are more than one
+	patterns, OR logic would applied among patterns during filtering. In
+	other words, any advertisement matching at least one pattern in a given
+	monitor would be considered as a match.
+
+	A pattern contain the following fields.
+		AD_Data_Type	Advertising Data Type. The possible values are
+				defined in Core Specification Supplement.
+		Offset		The start index where pattern matching shall be
+				performed with in the AD data.
+		Length		The length of the pattern value in bytes.
+		Value		The value of the pattern in bytes.
+
+	Here is an example of a pattern.
+		{
+			0x16, // Service Data - 16-bit UUID
+			0x02, // Skip the UUID part.
+			0x04,
+			{0x11, 0x22, 0x33, 0x44},
+		}
+
+	Possible errors:	Failed
+				Busy
+				Invalid Parameters
+
+
+Remove Advertisement Monitor Command
+====================================
+
+	Command Code:		0x004B
+	Controller Index:	<controller id>
+	Command Parameters:	Monitor_Handle (4 Octets)
+	Return Parameters:
+
+	This command is used to remove advertisement monitor(s). The kernel
+	would remove the monitor(s) with Monitor_Index and update the LE
+	scanning. If the controller supports advertisement filtering and the
+	monitor(s) has been offloaded, the kernel would cancel the offloading;
+	otherwise the kernel takes no further actions other than removing the
+	monitor(s) from the list.
+
+	Monitor_Handle can be the following values.
+		Value		Operation
+		-------------------------
+		0x00000000		Removes all existing monitor(s)
+		0x00000001 or greater	Removes the monitor with that handle
+
+	Possible errors:	Failed
+				Busy
+				Invalid Index
+
+
 Command Complete Event
 ======================
 
@@ -4020,3 +4116,25 @@ PHY Configuration Changed Event
 	one through which the change was triggered.
 
 	Refer Get PHY Configuration command for PHYs parameter.
+
+
+Advertisement Monitor Added Event
+=================================
+
+	Event Code:		0x0027
+	Controller Index:	<controller id>
+	Event Parameters:	Monitor_Handle (4 Octets)
+
+	This event indicates that an advertisement monitor has been added using
+	the Add Advertisement Monitor command.
+
+
+Advertisement Monitor Removed Event
+===================================
+
+	Event Code:		0x0028
+	Controller Index:	<controller id>
+	Event Parameters:	Monitor_Handle (4 Octets)
+
+	This event indicates that an advertisement monitor has been removed
+	using the Remove Advertisement Monitor command.
-- 
2.24.1

