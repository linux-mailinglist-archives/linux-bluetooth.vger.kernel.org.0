Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69882AE4F5
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Nov 2020 01:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732282AbgKKAhs (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Nov 2020 19:37:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732209AbgKKAhr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Nov 2020 19:37:47 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3B1C0613D1
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Nov 2020 16:37:45 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id m13so212500pgl.7
        for <linux-bluetooth@vger.kernel.org>; Tue, 10 Nov 2020 16:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dQ+EnXZ2kdnBZmC8x3MiuHzZ0854bTxxkZnBN1oy2g0=;
        b=ByRkWcJ2M6mnumiHHtsZPh/BM9jQIfAEeJ7uU8FNajgdBiiq248LzYrpiMkUoOyO3i
         v0D0VJUMCBhUtFdm7aQft/8ncC8IQN0D4QgwpXnSLy5ylRs2Rwxu3goAdifR3SQd74Aq
         9b+dfUaY34vnnhTVqFee9nnIbgISREhXFz80U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQ+EnXZ2kdnBZmC8x3MiuHzZ0854bTxxkZnBN1oy2g0=;
        b=Qu5LOez6qOt+HP2eu9qaJeshhV8aitRuhytIRL7Y/VaNLpqklJzDC3uA7QAhXzDr75
         X5GFJuLEVGMdk18+Y0IlzLRbmDAn0Ggq3D8pA8N8uPRNrLNoPw37AxcJEWyQ0Ke9xEfK
         pHcjiTvVh3fOE83uPc1omtqwdTKnAiJ0/4hblTaUQmVH9TsXRXn2IfmGlQqLVyI4jTkP
         AfG/rtJKpZOYPV0MhxmhbtQzw8gOAylZ2mWUontmcKUjAQJ/ZflB7u3DPVesMVqxT3Ou
         ua7LMJi9gKVHX7ow/eNlJLhe3M17SmB1jpjz87bv6xPDdFZrMBImxmoDEwoyhPTjtHoB
         klOQ==
X-Gm-Message-State: AOAM530SycQXSQluwakhnoltDR3Cn5cIkQIa/7tXxyehxrnd9PJy4pB8
        Z7bqR7yKsf/2vY0ixpKuWOTImCQtmONxdA==
X-Google-Smtp-Source: ABdhPJwtOGrV9DNNZTK5g9nxl7jgKK7NY8knfm3rEzv8wRrnuYrw55egZBWhLEmq1LV84rI3MKJsUQ==
X-Received: by 2002:a17:90a:4749:: with SMTP id y9mr896541pjg.229.1605055065045;
        Tue, 10 Nov 2020 16:37:45 -0800 (PST)
Received: from sonnysasaka-chrome.mtv.corp.google.com ([2620:15c:202:201:4a0f:cfff:fe66:e60c])
        by smtp.gmail.com with ESMTPSA id b16sm180655pju.16.2020.11.10.16.37.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2020 16:37:44 -0800 (PST)
From:   Sonny Sasaka <sonnysasaka@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sonny Sasaka <sonnysasaka@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>
Subject: [PATCH BlueZ 4/7] doc: Add Battery Provider API doc
Date:   Tue, 10 Nov 2020 16:37:17 -0800
Message-Id: <20201111003720.1727-5-sonnysasaka@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111003720.1727-1-sonnysasaka@chromium.org>
References: <20201111003720.1727-1-sonnysasaka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch add the documentation of the Battery Provider which lets
external clients feed battery information to BlueZ if they are able to
decode battery reporting via any profile. BlueZ UI clients can then use
the org.bluez.Battery1 API as a single source of battery information
coming from many different profiles.

Reviewed-by: Miao-chen Chou <mcchou@chromium.org>

---
 doc/battery-api.txt | 55 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/doc/battery-api.txt b/doc/battery-api.txt
index dc7dbeda2..058bf0c6e 100644
--- a/doc/battery-api.txt
+++ b/doc/battery-api.txt
@@ -12,3 +12,58 @@ Object path	[variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX
 Properties	byte Percentage [readonly]
 
 			The percentage of battery left as an unsigned 8-bit integer.
+
+		string Source [readonly, optional, experimental]
+
+			Describes where the battery information comes from
+			(e.g. "HFP 1.7", "HID").
+			This property is informational only and may be useful
+			for debugging purposes.
+
+
+Battery Provider Manager hierarchy
+==================================
+A battery provider starts by registering itself as a battery provider with the
+RegisterBatteryProvider method passing an object path as the provider ID. Then,
+it can start exposing org.bluez.BatteryProvider1 objects having the path
+starting with the given provider ID. It can also remove objects at any time.
+BlueZ will stop monitoring these exposed and removed objects after
+UnregisterBatteryProvider is called for that provider ID.
+
+Service		org.bluez
+Interface	org.bluez.BatteryProviderManager1 [experimental]
+Object path	/org/bluez/{hci0,hci1,...}
+
+Methods		void RegisterBatteryProvider(object provider)
+
+			This registers a battery provider. A registered
+			battery provider can then expose objects with
+			org.bluez.BatteryProvider1 interface described below.
+
+		void UnregisterBatteryProvider(object provider)
+
+			This unregisters a battery provider. After
+			unregistration, the BatteryProvider1 objects provided
+			by this client are ignored by BlueZ.
+
+
+Battery Provider hierarchy
+==========================
+
+Service		<client D-Bus address>
+Interface	org.bluez.BatteryProvider1 [experimental]
+Object path	{provider_root}/org/bluez/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX
+
+Properties	byte Percentage [readonly]
+
+			The percentage of battery left as an unsigned 8-bit
+			integer.
+
+		string Source [readonly, optional]
+
+			Describes where the battery information comes from
+			(e.g. "HFP 1.7", "HID").
+			This property is informational only and may be useful
+			for debugging purposes. The content of this property is
+			a free string, but it is recommended to include the
+			profile name and version to be useful.
-- 
2.26.2

