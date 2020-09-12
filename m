Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A51267866
	for <lists+linux-bluetooth@lfdr.de>; Sat, 12 Sep 2020 08:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgILGxo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 12 Sep 2020 02:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgILGxn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 12 Sep 2020 02:53:43 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CEF6C061573
        for <linux-bluetooth@vger.kernel.org>; Fri, 11 Sep 2020 23:53:43 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id g21so630015plq.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 11 Sep 2020 23:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OwcQPbWK9wBBKShQmm51i7xxWQDNt4zUBesrzpNnDCQ=;
        b=VUAa6hsso6AxvZIAOLvHCOTOGf49bGrrlP8lT0AAYhKo3lBtBu9/wFkhEsurDPv9yG
         /fiouEnhWVJQtA7um9S5oIGwFr69DFyrNzgzkVqMbL7TdL1haF2fP4j1i+ubZM7fX2Zh
         uPggCleCAQVvcWxkiCvU1hr7PQ1r1TQ/fdA8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OwcQPbWK9wBBKShQmm51i7xxWQDNt4zUBesrzpNnDCQ=;
        b=tLT8Cb3ITTGyA5ey8jKWgCKMtZDII6o/CkIw+kbPaYRUnUxKcTMvGkn3bnb3wJrayI
         RwcYw6PytnD46xQZp9zbZvTOfLcnJPnvmAgtYuBFZWb1+EvqF+RyOibEwEVxOCdyWX4H
         6V+4hN0s7em/nAzC2cpKQpbuF3Mj6kgACOj1hhtg7rLjALTExkJ1devFQhYo1yv/JrNi
         b9Z5Hi/Vtj7FfN3QxLrtaGQmVEMtvjrFxjcv4K+DZTeF7iI9wzaCjeRiehZ0UfbfdBAL
         wSCRIdzGMHa0X007Jgy9g+ZIn4ZONiODbYywBARdOL8/3wMk4htc/mm4naYkJLQh2nBd
         iQtw==
X-Gm-Message-State: AOAM532Zq1c5pAx7qZsk89zDQw4d0oJPh7n7fQp+R4W47j0XTJ4nYiUp
        As4S3ARNj+P7VRq4+PZLR6z4kBsKSCr4pw==
X-Google-Smtp-Source: ABdhPJx1kXgjv2O53os36lS2ZXvgPiEfssZ0hPqH+xwLJiPSOwaznEhzQGf798yGdiXfeNIrLtl7GA==
X-Received: by 2002:a17:90b:1098:: with SMTP id gj24mr5576621pjb.55.1599893620619;
        Fri, 11 Sep 2020 23:53:40 -0700 (PDT)
Received: from mcchou0.mtv.corp.google.com ([2620:15c:202:201:de4a:3eff:fe75:1314])
        by smtp.gmail.com with ESMTPSA id hg16sm3440913pjb.37.2020.09.11.23.53.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2020 23:53:39 -0700 (PDT)
From:   Miao-chen Chou <mcchou@chromium.org>
To:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>
Cc:     Manish Mandlik <mmandlik@chromium.org>,
        Howard Chung <howardchung@google.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Alain Michaud <alainm@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>
Subject: [BlueZ PATCH v5 8/8] doc: Update Advertisement Monitor API description
Date:   Fri, 11 Sep 2020 23:51:33 -0700
Message-Id: <20200911235104.BlueZ.v5.8.Iee7e9d13c78dd02c5b283a203dea11a4a4ffa7cc@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200911235104.BlueZ.v5.1.Iaa9dc2a66de5fbfa97627e1dbeb800116d3aa91e@changeid>
References: <20200911235104.BlueZ.v5.1.Iaa9dc2a66de5fbfa97627e1dbeb800116d3aa91e@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This modifies the following description to Advertisement Monitor API.
- Add org.bluez.Error.Failed to RegisterMonitor() method.
- Add more description about the usage of RegisterMonitor() and
UnregisterMonitor() methods.
- Add description about the ranges for the fields in property
RSSIThresholdsAndTimers.

Reviewed-by: Yun-Hao Chung <howardchung@google.com>
Reviewed-by: Manish Mandlik <mmandlik@chromium.org>
---

(no changes since v1)

 doc/advertisement-monitor-api.txt | 34 +++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/doc/advertisement-monitor-api.txt b/doc/advertisement-monitor-api.txt
index 74adbfae9..e09b6fd25 100644
--- a/doc/advertisement-monitor-api.txt
+++ b/doc/advertisement-monitor-api.txt
@@ -49,7 +49,7 @@ Properties	string Type [read-only]
 			org.bluez.AdvertisementMonitorManager1 for the available
 			options.
 
-		(Int16, Uint16, Int16, Uint16) RSSIThreshholdsAndTimers [read-only, optional]
+		(Int16, Uint16, Int16, Uint16) RSSIThresholdsAndTimers [read-only, optional]
 
 			This contains HighRSSIThreshold, HighRSSIThresholdTimer,
 			LowRSSIThreshold, LowRSSIThresholdTimer in order. The
@@ -66,7 +66,11 @@ Properties	string Type [read-only]
 			RSSIs of the received advertisement(s) during
 			LowRSSIThresholdTimer do not reach LowRSSIThreshold.
 
-		array{(uint8, uint8, string)} Patterns [read-only, optional]
+			The valid range of a RSSI is -127 to +20 dBm while 127
+			dBm indicates unset. The valid range of a timer is 1 to
+			300 seconds while 0 indicates unset.
+
+		array{(uint8, uint8, array{byte})} Patterns [read-only, optional]
 
 			If Type is set to 0x01, this must exist and has at least
 			one entry in the array.
@@ -80,8 +84,9 @@ Properties	string Type [read-only]
 				See https://www.bluetooth.com/specifications/
 				assigned-numbers/generic-access-profile/ for
 				the possible allowed value.
-			string content_of_pattern
-				This is the value of the pattern.
+			array{byte} content_of_pattern
+				This is the value of the pattern. The maximum
+				length of the bytes is 31.
 
 Advertisement Monitor Manager hierarchy
 =======================================
@@ -91,20 +96,31 @@ Object path	/org/bluez/{hci0,hci1,...}
 
 Methods		void RegisterMonitor(object application)
 
-			This registers a hierarchy of advertisement monitors.
+			This registers the root path of a hierarchy of
+			advertisement monitors.
 			The application object path together with the D-Bus
 			system bus connection ID define the identification of
 			the application registering advertisement monitors.
+			Once a root path is registered by a client via this
+			method, the client can freely expose/unexpose
+			advertisement monitors without re-registering the root
+			path again. After use, the client should call
+			UnregisterMonitor() method to invalidate the
+			advertisement monitors.
 
 			Possible errors: org.bluez.Error.InvalidArguments
 					 org.bluez.Error.AlreadyExists
+					 org.bluez.Error.Failed
 
 		void UnregisterMonitor(object application)
 
-			This unregisters advertisement monitors that have been
-			previously registered. The object path parameter must
-			match the same value that has been used on
-			registration.
+			This unregisters a hierarchy of advertisement monitors
+			that has been previously registered. The object path
+			parameter must match the same value that has been used
+			on registration. Upon unregistration, the advertisement
+			monitor(s) should expect to receive Release() method as
+			the signal that the advertisement monitor(s) has been
+			deactivated.
 
 			Possible errors: org.bluez.Error.InvalidArguments
 					 org.bluez.Error.DoesNotExist
-- 
2.26.2

