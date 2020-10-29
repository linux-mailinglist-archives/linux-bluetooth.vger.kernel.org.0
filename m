Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4431D29F8D7
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Oct 2020 00:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgJ2XGg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 29 Oct 2020 19:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgJ2XGg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 29 Oct 2020 19:06:36 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E87C0613CF
        for <linux-bluetooth@vger.kernel.org>; Thu, 29 Oct 2020 16:06:36 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id u24so3331081pfh.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 29 Oct 2020 16:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=HlqSQeD8AIpwZUKCMJZvUHiRV+aJ1Y5aA2LRmypwPzQ=;
        b=DKjeZSnJfFpJrNas2mh2blseyWpKigVVTTsQ01MULuwDzrKNFBHXkRTtlqAbKGYRwp
         w30i4gzxB6ZwSwjxo7GwjImgKNHvHVXov1AIha7lL8PHhGJVSf/SFdlkI2DHH6DUsAl4
         xYUGb9Nz58h7X6dxPGZxkiaL61phSutOHLuFqMcw7jzgnqRhdf074inP+GwoSAaxg6P9
         jMockRSM7SKNMF/AVaykfBSxPi/kCN6b/wq4QQGC0956LRILF/Zi88EuFn4DSaCoe5Eo
         eSUozQzl6wuzqhiTC/onGAiogyIkOxeuDaacfjc/WebjJOkBpVymOVDXP5kjDUgOCQMB
         VLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=HlqSQeD8AIpwZUKCMJZvUHiRV+aJ1Y5aA2LRmypwPzQ=;
        b=DECs+Sbamoh76h4LkHcskv0TL/UtY8h7Q1QIR310WYoOgwpnyvWcmJZ341QfJwa24I
         +3GVADSkQpKLUR+6wnOi/+Tlr1/OefTfpSK77ePYJx9XyKTr9OrdAFol/sdKHNBpC0r0
         OMbvevMEbfnxFVxhL+OTh6tq8k0l9mhm3Y5qtsQeQD0wjPcT8upiDlxIFSQnxpZs2aUp
         jwg6agXTe/Rw7bLnF+lWi1IrG0fxpKjOH+FwRwLzMqLSKYq+WlhCdG2zK1Mhko9P7m2H
         uiwsoBfb7p5zOPcMsaQg5WVQzOhSopabGdDTChx0tR4GRjQePDXlpBVIheNVrV2iAG6u
         tHyw==
X-Gm-Message-State: AOAM531gPpfOjVZYHT4Jpk1IbNgT73Q5qwz33KvHY2AdPlbEplLDhGu4
        D9OlR8hOd8Pyz2IbxIhnUyXsAHu9fyx8MtaiaeqA
X-Google-Smtp-Source: ABdhPJy+qVMX3O3KmJ8qMbdeEIZ8feE9MWLln1xgCchF3VrnARudVes3vM4B9ccExPSFbvpAp79hKyrpQZy0jCWz0lbf
Sender: "danielwinkler via sendgmr" 
        <danielwinkler@danielwinkler-linux.mtv.corp.google.com>
X-Received: from danielwinkler-linux.mtv.corp.google.com ([2620:15c:202:201:f693:9fff:fef4:4e59])
 (user=danielwinkler job=sendgmr) by 2002:a62:17cb:0:b029:163:e718:8502 with
 SMTP id 194-20020a6217cb0000b0290163e7188502mr6295406pfx.23.1604012795507;
 Thu, 29 Oct 2020 16:06:35 -0700 (PDT)
Date:   Thu, 29 Oct 2020 16:06:15 -0700
In-Reply-To: <20201029230623.3630069-1-danielwinkler@google.com>
Message-Id: <20201029160317.Bluez.v6.3.Iabfcf7ec8ac293130a7d903ee8094414256799b3@changeid>
Mime-Version: 1.0
References: <20201029230623.3630069-1-danielwinkler@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [Bluez PATCH v6 03/10] doc/mgmt-api: Update controller capabilities
 MGMT command in mgmt-api
From:   Daniel Winkler <danielwinkler@google.com>
To:     luiz.von.dentz@intel.com
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Daniel Winkler <danielwinkler@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch changes Read Security Info MGMT to be called Read Controller
Capabilities Command

---

Changes in v6: None
Changes in v5: None
Changes in v4:
- mgmt-api: Move Controller Capabilities MGMT doc into new patch
- mgmt-api: Tx Power range put into single capabilities entry

Changes in v3: None
Changes in v2: None

 doc/mgmt-api.txt | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/doc/mgmt-api.txt b/doc/mgmt-api.txt
index 7c899a8fe..1aa43d6c3 100644
--- a/doc/mgmt-api.txt
+++ b/doc/mgmt-api.txt
@@ -3110,19 +3110,19 @@ Set Wideband Speech Command
 				Invalid Index
 
 
-Read Security Information Command
-=================================
+Read Controller Capabilities Command
+====================================
 
 	Command Code:		0x0048
 	Controller Index:	<controller id>
 	Command Parameters:
-	Return Parameters:	Security_Data_Length (2 Octets)
-				Security_Data (0-65535 Octets)
+	Return Parameters:	Capabilities_Data_Length (2 Octets)
+				Capabilities_Data (0-65535 Octets)
 
-	This command is used to retrieve the supported security features
+	This command is used to retrieve the supported capabilities
 	by the controller or the host stack.
 
-	The Security_Data_Length and Security_Data parameters provide
+	The Capabilities_Data_Length and Capabilities_Data parameters provide
 	a list of security settings, features and information. It uses
 	the same format as EIR_Data, but with the namespace defined here.
 
@@ -3131,6 +3131,7 @@ Read Security Information Command
 		0x01		Flags
 		0x02		Max Encryption Key Size (BR/EDR)
 		0x03		Max Encryption Key Size (LE)
+		0x04		Supported Tx Power (LE)
 
 	Flags (data type 0x01)
 
@@ -3146,6 +3147,14 @@ Read Security Information Command
 		present, then it is unknown what the max encryption key
 		size of the controller or host is in use.
 
+	Supported LE Tx Power (data type 0x04)
+
+		When present, this 2-octet field provides the min and max
+		LE Tx power supported by the controller, respectively, as
+		reported by the LE Read Transmit Power HCI command. If this
+		field is not available, it indicates that the LE Read
+		Transmit Power HCI command was not available.
+
 	This command generates a Command Complete event on success or
 	a Command Status event on failure.
 
-- 
2.29.1.341.ge80a0c044ae-goog

