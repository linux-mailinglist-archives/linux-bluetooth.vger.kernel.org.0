Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFFCD533ADD
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 May 2022 12:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242959AbiEYKqe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 May 2022 06:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242566AbiEYKq1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 May 2022 06:46:27 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58100D9
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 May 2022 03:46:09 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id q4so18212504plr.11
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 May 2022 03:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nfd8GuZibV93hv9RFZEH/5/7YZjQFYEI7fvZmGryy4s=;
        b=TfAvOXi/gD7eAIll7QchzF7Eta8mzPE79DQuQGqufw9MAXxEiSBkUhihxhjy4hVKku
         Ww6UrrdG8O2dEu71e4mxTyAq68P3xddG05R270g4Jq+MiOX6Ty6F43Xii72x4LZkgUS4
         QfN498OGx3DN3QY0WPRX0i9eYTrnyKFkAVBVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nfd8GuZibV93hv9RFZEH/5/7YZjQFYEI7fvZmGryy4s=;
        b=Xo9Jr0mAnOCBlItSPBqxAMGW6cgu+EJYU7INgxHPef+6DvbA02CmzftR+485gEPG9Z
         0zFKG8XbxMhA7Z8FNh3IGuh7Z9wz531DLjHkRUakB2mvzp/N/hkCPkvJXwOK07LZGmbc
         9ILIXr/Hjdi3rIPPFCuY9P7549OnjDaKFEcbrP0KSPX4zLpthteWyjWnLqwxL1lkUMru
         cAWEfvSfOAfYvJs+gIRLFvVV+lF3Khnv8vJCNPrtJSm1saN9OxrOiZ9Ly3eZTgDQ+/rR
         oBIWlZ2MPd9zpj5vudlFYIuTO8Cr2MPIKJkQhEsAeIw+1pUKxvSDzJPHh38Wy2TD3l16
         Sk7A==
X-Gm-Message-State: AOAM532AxCLS52rIhE4101AmaBzg5iCWtQ8ifGDsPZwgWDdtVansqq1f
        8s8/MkEttqz2dE4th7KfJkKqCmwkRUac7w==
X-Google-Smtp-Source: ABdhPJx+kR3HjBYxdXGooCC+ftVmy/otgl5MmgHXHeoEREOhHWmbCkk17kKT61UumNXFsaWtKwwJGw==
X-Received: by 2002:a17:90b:4f81:b0:1e0:7643:36ae with SMTP id qe1-20020a17090b4f8100b001e0764336aemr8297282pjb.124.1653475568108;
        Wed, 25 May 2022 03:46:08 -0700 (PDT)
Received: from localhost (174.71.80.34.bc.googleusercontent.com. [34.80.71.174])
        by smtp.gmail.com with UTF8SMTPSA id a21-20020a637055000000b003c14af505fesm8151397pgn.22.2022.05.25.03.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 03:46:07 -0700 (PDT)
From:   Joseph Hwang <josephsih@chromium.org>
To:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org,
        luiz.dentz@gmail.com, pali@kernel.org
Cc:     josephsih@google.com, chromeos-bluetooth-upstreaming@chromium.org,
        Joseph Hwang <josephsih@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH v5 5/5] Bluetooth: let HCI_QUALITY_REPORT persist over adapter power cycle
Date:   Wed, 25 May 2022 18:45:45 +0800
Message-Id: <20220525104545.2314653-3-josephsih@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220525104545.2314653-1-josephsih@chromium.org>
References: <20220525104545.2314653-1-josephsih@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The quality report specifications, including AOSP Bluetooth Quality
Report and Intel Telemetry Event, do not define what happen when
the adapter is turned off and then on. To be consistent among
different specifications and vendors, the quality report feature is
turned off when the adapter is powered off and is turned on when
the adapter is powered on if the feature has been on before power
cycle.

Signed-off-by: Joseph Hwang <josephsih@chromium.org>
Reviewed-by: Archie Pusaka <apusaka@chromium.org>
---

Changes in v5:
- This is a new patch in this series changes version.

 include/net/bluetooth/hci_core.h |  1 -
 net/bluetooth/hci_sync.c         | 35 +++++++++++++++++++++++++++++++-
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 9e48d606591e..5788350efa68 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -807,7 +807,6 @@ extern struct mutex hci_cb_list_lock;
 		hci_dev_clear_flag(hdev, HCI_LE_ADV);		\
 		hci_dev_clear_flag(hdev, HCI_LL_RPA_RESOLUTION);\
 		hci_dev_clear_flag(hdev, HCI_PERIODIC_INQ);	\
-		hci_dev_clear_flag(hdev, HCI_QUALITY_REPORT);	\
 	} while (0)
 
 #define hci_dev_le_state_simultaneous(hdev) \
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index a6ada9dcede5..12a18d046bb6 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -3849,6 +3849,31 @@ static const struct {
 			 "advertised, but not supported.")
 };
 
+static void suspend_resume_quality_report(struct hci_dev *hdev, bool enable)
+{
+	int err;
+
+	/* Suspend and resume quality report only when the feature has
+	 * already been enabled. The HCI_QUALITY_REPORT flag, as an indicator
+	 * whether to re-enable the feature after resume, is not changed by
+	 * suspend/resume.
+	 */
+	if (!hci_dev_test_flag(hdev, HCI_QUALITY_REPORT))
+		return;
+
+	if (hdev->set_quality_report)
+		err = hdev->set_quality_report(hdev, enable);
+	else
+		err = aosp_set_quality_report(hdev, enable);
+
+	if (err)
+		bt_dev_err(hdev, "%s quality report error %d",
+			   enable ? "resume" : "suspend", err);
+	else
+		bt_dev_info(hdev, "%s quality report",
+			    enable ? "resume" : "suspend");
+}
+
 int hci_dev_open_sync(struct hci_dev *hdev)
 {
 	int ret = 0;
@@ -4013,6 +4038,7 @@ int hci_dev_open_sync(struct hci_dev *hdev)
 	if (!hci_dev_test_flag(hdev, HCI_USER_CHANNEL)) {
 		msft_do_open(hdev);
 		aosp_do_open(hdev);
+		suspend_resume_quality_report(hdev, true);
 	}
 
 	clear_bit(HCI_INIT, &hdev->flags);
@@ -4095,6 +4121,14 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 
 	hci_request_cancel_all(hdev);
 
+	/* Disable quality report and close aosp before shutdown()
+	 * is called. Otherwise, some chips may panic.
+	 */
+	if (!hci_dev_test_flag(hdev, HCI_USER_CHANNEL)) {
+		suspend_resume_quality_report(hdev, false);
+		aosp_do_close(hdev);
+	}
+
 	if (!hci_dev_test_flag(hdev, HCI_UNREGISTER) &&
 	    !hci_dev_test_flag(hdev, HCI_USER_CHANNEL) &&
 	    test_bit(HCI_UP, &hdev->flags)) {
@@ -4158,7 +4192,6 @@ int hci_dev_close_sync(struct hci_dev *hdev)
 	hci_sock_dev_event(hdev, HCI_DEV_DOWN);
 
 	if (!hci_dev_test_flag(hdev, HCI_USER_CHANNEL)) {
-		aosp_do_close(hdev);
 		msft_do_close(hdev);
 	}
 
-- 
2.36.1.124.g0e6072fb45-goog

