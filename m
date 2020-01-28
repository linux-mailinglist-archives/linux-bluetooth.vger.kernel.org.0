Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C37C214ADD7
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 Jan 2020 03:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgA1CFQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 27 Jan 2020 21:05:16 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:53569 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgA1CFQ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 27 Jan 2020 21:05:16 -0500
Received: by mail-pj1-f67.google.com with SMTP id n96so306103pjc.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 27 Jan 2020 18:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oCj9klxCDjWVY/P290XOa9mdXAkPIzZ1ulBexEdhvHw=;
        b=JOH6I4x3sVvf+6Cw9n/XwCqNoTTAwcnQUcAHc1BesN8FeVDZjkh1vjMBo+05Hou4GU
         dq/Pe/3Ari06Y87ZRGDSRFXbfKRRyMDuHd9lRDDNYmFmsl6EI6rK+y8UjkpwTvm/l3JJ
         5J52ZaLsWTb/gjI/XNd3CHtBbsENT8JsuzQPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oCj9klxCDjWVY/P290XOa9mdXAkPIzZ1ulBexEdhvHw=;
        b=MZqkY3qRRWbmSXv1f/yXohyCWZW4B4RZEjNWBClESDvCwZM9+DDEHMC6+hvMb93UH0
         59CG/rQK4+iinBUVtU8uMIcbwgedRqOz6ssrHt+70htFgbqD0+KGMxz2GadZXB+0NrLo
         nOUqyIce8uDFiw8/Ro0xgnGJjNM3odnAMd5QszOTOjaAvPta7aLWXfFrgCIavt3ZdT91
         HDz9zaGRsLtM8JJf37lJS1IutW1b9Y4+Qp+75UwL1wLP1YuZwUbOs1dfTO2OFV2vQSfZ
         +y0gTHPa3JcugfgRfJ5xvxVzAB9jsMLE2PjC9W4O6UV8GgYe3jdYJhrEoalN5gRpHXLl
         h11g==
X-Gm-Message-State: APjAAAXo7x9ehSgol4z/QTk7gZ5By1DZmTQOnznwHoz9I/wHv0uwr8AQ
        NKjr35Mu/P7M8clTM5HspVdsKg==
X-Google-Smtp-Source: APXvYqwigN0vKyX29gbup42gGbUEYTe7ua7BZP5WkqFwXdXtNDfvvUfkfTbJiUY5TEh7BS4GWAOPcQ==
X-Received: by 2002:a17:902:b212:: with SMTP id t18mr20078223plr.135.1580177115553;
        Mon, 27 Jan 2020 18:05:15 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id z19sm17119015pfn.49.2020.01.27.18.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 18:05:15 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     luiz.dentz@gmail.com, marcel@holtmann.org, alainm@chromium.org
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Subject: [BlueZ PATCH v3 5/5] input: Make HID devices wake capable
Date:   Mon, 27 Jan 2020 18:05:05 -0800
Message-Id: <20200127180433.BlueZ.v3.5.Ie24be91b472c0a274606191bc4d14df030fe3598@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200128020505.239349-1-abhishekpandit@chromium.org>
References: <20200128020505.239349-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

HID devices can wake the host from a suspended state. Mark the profiles
to support wake when they are accepted.

---

Changes in v3:
* Mark HID device to support wake from suspend

Changes in v2: None

 profiles/input/device.c | 1 +
 profiles/input/hog.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/profiles/input/device.c b/profiles/input/device.c
index 2cb3811c8..e5865d098 100644
--- a/profiles/input/device.c
+++ b/profiles/input/device.c
@@ -1381,6 +1381,7 @@ int input_device_register(struct btd_service *service)
 	}
 
 	btd_service_set_user_data(service, idev);
+	device_set_profile_wake_support(device, true);
 
 	return 0;
 }
diff --git a/profiles/input/hog.c b/profiles/input/hog.c
index 83c017dcb..227facf97 100644
--- a/profiles/input/hog.c
+++ b/profiles/input/hog.c
@@ -159,6 +159,7 @@ static int hog_probe(struct btd_service *service)
 		return -EINVAL;
 
 	btd_service_set_user_data(service, dev);
+	device_set_profile_wake_support(device, true);
 	return 0;
 }
 
-- 
2.25.0.341.g760bfbb309-goog

