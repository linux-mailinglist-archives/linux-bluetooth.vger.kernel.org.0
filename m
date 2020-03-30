Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 859271974D6
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Mar 2020 09:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729309AbgC3HF3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Mar 2020 03:05:29 -0400
Received: from mail-qv1-f74.google.com ([209.85.219.74]:56173 "EHLO
        mail-qv1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728489AbgC3HF3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Mar 2020 03:05:29 -0400
Received: by mail-qv1-f74.google.com with SMTP id j7so13601434qvy.22
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Mar 2020 00:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=4N9Dp9kTeuqxUzbxjytSqdNoFslKRE9NnJSL/k7VjB0=;
        b=U2mhUasDps8kDbeKwefXcMyE0bei2tbRBns15g30Hv1lg4ST2TjqRJzoZo5bBuTUht
         pnrITyWfbFUa91RsgRNzOpCpQ4NLnbRDMdIT7YVct1TEZ918lzzKBnYkQebSAaUkhtC7
         Dmcw68hp7nBT46iHFso988jLOcmUCPl1e3GynWTvKqhkeM4uLHNZkPaxJuUUTdGDE6wh
         FkdBFu/qqrPOgQqUUCFNJ5CU4UpLF4K0kQDMcBmgQXB+ifjPCSMda7hcduJ3w3RqMFgV
         9idAk/37nKHzO7kXq0ydZtkPVXs/8VuTZysdleGBwWk53fUe6GJyEhi9i3bhIVTEXW/l
         g68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=4N9Dp9kTeuqxUzbxjytSqdNoFslKRE9NnJSL/k7VjB0=;
        b=KLhG44QbiVqTrOThJL8Kq6QkzrVa2bZGE4GzxmFN+ZcWJJTfzeflrn+gIJ44Uw8FR/
         ZCQikJ20Pbqlo6a8nanXNQcRP6OF2v53LVTgTEJIUOAhPWjn/XRvgTZ3ORlKVDsc/fWP
         TmCSTBQpMVFvQeKNtUUpv6y3dHvx2ljE0QfcqdvwCnhtlCYrkeo8EmsfuYmd12H2sjaX
         mjgkw7aSn6OLG5Gru8twxXd/Biz6h4Iw0tIdhlxp5hzNPc9yV3P2qE9UgtK4vWWOVaRb
         j1Habs4wZ5rWd9Vc3FZbwVuwDyNlqDNBSGCy7ZZK7l1tiI2iIpnLVJG2Q0BF4TQtKp7t
         eiAg==
X-Gm-Message-State: ANhLgQ0KNnb/yYhmBgNOqyHwuRJt3iBgFmr0aoTrLnnTpxMKr8ZYCJHR
        H+8eeHNd7UFbRd5WeXJfLWrt9h5Mw+oNE9KRwIZt9fsag2VTUqgHILlpH4Gof4Dq1KN1h+Es3iX
        DquhrsEsoL0Og27fYL5FssAP+Hx4m1/Zz0GEj/mc1tkyraNKt+AnF6QCDa1iNS6kh3M9GB6kWT8
        pLVYmi+TrlmUg=
X-Google-Smtp-Source: ADFU+vvONcmpMbDRDdrdc0vZ3/th0gMH7+/ZJDtlb8kz+E36WIJA5sLEuPTO+5yVIg/eh3Wewkl7MocKwD2VrXAf/w==
X-Received: by 2002:aed:3c4b:: with SMTP id u11mr10393773qte.208.1585551927866;
 Mon, 30 Mar 2020 00:05:27 -0700 (PDT)
Date:   Mon, 30 Mar 2020 15:04:35 +0800
In-Reply-To: <20200330070438.37316-1-howardchung@google.com>
Message-Id: <20200330150424.Bluez.v1.3.Ia74c1ab0a71d90f46f10b4e32743cab722a97bbb@changeid>
Mime-Version: 1.0
References: <20200330070438.37316-1-howardchung@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [Bluez PATCH v1 3/6] doc: Add documentation for LE Set Advertising Interval
From:   Howard Chung <howardchung@google.com>
To:     linux-bluetooth@vger.kernel.org, luiz.von.dentz@intel.com
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        Howard Chung <howardchung@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Signed-off-by: Howard Chung <howardchung@google.com>
---

 doc/advertising-api.txt | 13 +++++++++++++
 doc/mgmt-api.txt        | 25 +++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/doc/advertising-api.txt b/doc/advertising-api.txt
index b0565eab2..9264cdb27 100644
--- a/doc/advertising-api.txt
+++ b/doc/advertising-api.txt
@@ -209,3 +209,16 @@ Properties	byte ActiveInstances
 			Possible values: "1M"
 					 "2M"
 					 "Coded"
+
+		void SetAdvertisingIntervals(uint16 min_interval_ms,
+					     uint16 max_interval_ms)
+
+			This method sets the advertising intervals.
+
+			The parameters min_interval_ms and max_interval_ms
+			are specified in milli-seconds. Valid values of
+			the intervals must fall between 20 ms and 10,240 ms.
+
+			Possible errors: org.bluez.Error.Failed
+					 org.bluez.Error.InProgress
+					 org.bluez.Error.InvalidArguments
diff --git a/doc/mgmt-api.txt b/doc/mgmt-api.txt
index 27a41f334..5eff87e24 100644
--- a/doc/mgmt-api.txt
+++ b/doc/mgmt-api.txt
@@ -2925,6 +2925,31 @@ Read Extended Controller Information Command
 				Invalid Index
 
 
+Set Advertising Intervals Command
+=================================
+
+	Command Code:		0x0101
+	Controller Index:	<controller id>
+	Command Parameters:	Min_Interval     (2 Octets)
+				Max_Interval     (2 Octets)
+	Return Parameters:	Current_Settings (4 Octets)
+
+	This command is used to set advertising intervals. The intervals
+	are expressed in multiples of 0.625 ms. The default values of
+	both intervals are 0x0800. Valid Min_Interval and Max_Interval
+	values must fall between 0x0020 and 0x4000.
+
+	The advertising intervals are first kept in hdev struct. The values
+	would be sent to the controller and take effect when advertising is
+	actually enabled. If the advertising intervals are set when
+	advertising is already on, the advertising would be disabled and
+	re-enabled to make the intervals take effect.
+
+	Possible errors:	Busy
+				Rejected
+				Invalid Parameters
+
+
 Set Appearance Command
 ======================
 
-- 
2.26.0.rc2.310.g2932bb562d-goog

