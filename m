Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6151ED8E3
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Jun 2020 01:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgFCXDx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Jun 2020 19:03:53 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33890 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbgFCXDX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Jun 2020 19:03:23 -0400
Received: by mail-pl1-f196.google.com with SMTP id n9so1361428plk.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 03 Jun 2020 16:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qMbJOzOGPq6qn+vEu+cbZltbVasWy/y0KnviLdcKP5E=;
        b=J3ZjzYMShssX62drVpegc0NtogsLDm+bYvKcT7NTPgfZBGN4g72M/i0x/vlEODxI7q
         lcIsMEiUsuIPiE3ZMRuk3cmTa23GfVQ3s55a2FzCVQCDzXHOyMAmwFNcOn6vGzWqgCEU
         sjRl8NWwoA4lPeIdAeoLoRl0TFVdaUBSxnoBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qMbJOzOGPq6qn+vEu+cbZltbVasWy/y0KnviLdcKP5E=;
        b=RM8CP3NCWQPdADh8IPArSWRGnLHlrBRfEa8SHzxTQ3Q2N2jZNX2p8x0dHXlX6i7Yp4
         EZ1/xe5JD1XsCBTg70tC8VT8nATYKhnajyUfnyB1AXswiCycfqSVU706TW7acLR3XB6g
         m/XtQrIqUSXRq6czpNZcBe/iZMGNKZZuP0C7xFpmiuNfbrUl5UwYhJVgflIb/KgKR+3b
         sNj7K0aDE1ELnoFWQbOORbeOQrACfC0JbYX6BFeuJXKRL4QiN15uANBjY/Tb/6V1zbYt
         OG+9UHbvDq6S0cI9fL7xaIPK7QVoK8q1D55XNj/sIdH+z6u8hJZTrR1IMlrqSn0fbZDW
         oomg==
X-Gm-Message-State: AOAM531ixh5RxM0g2h8q4uLouDKeVN2Ivj2G9M8hO8UpvsLRo7cJVpI9
        wb/3+HRNES2njS2Uw3TtQyiUxnLHK2U=
X-Google-Smtp-Source: ABdhPJzatvf5olLQdyVFoRiAero1hORH5OwGSw/H0MmT6CREsv4h6ha4nDyoLXJdGUexIxaPhhSX6Q==
X-Received: by 2002:a17:902:d70a:: with SMTP id w10mr2001029ply.256.1591225342549;
        Wed, 03 Jun 2020 16:02:22 -0700 (PDT)
Received: from mcchou0.mtv.corp.google.com ([2620:15c:202:201:b46:ac84:1014:9555])
        by smtp.gmail.com with ESMTPSA id b11sm2715999pfd.178.2020.06.03.16.02.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 16:02:21 -0700 (PDT)
From:   Miao-chen Chou <mcchou@chromium.org>
To:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>
Cc:     Alain Michaud <alainm@chromium.org>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Manish Mandlik <mmandlik@chromium.org>,
        Michael Sun <michaelfsun@google.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Yoni Shavit <yshavit@chromium.org>,
        Miao-chen Chou <mcchou@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 6/7] Bluetooth: Notify adv monitor removed event
Date:   Wed,  3 Jun 2020 16:01:49 -0700
Message-Id: <20200603160058.v2.6.If1a82f71eb63f969de3d5a5da03c2908b58a721a@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603160058.v2.1.I636f906bf8122855dfd2ba636352bbdcb50c35ed@changeid>
References: <20200603160058.v2.1.I636f906bf8122855dfd2ba636352bbdcb50c35ed@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This notifies management sockets on MGMT_EV_ADV_MONITOR_REMOVED event.

The following test was performed.
- Start two btmgmt consoles, issue a btmgmt advmon-remove command on one
console and observe a MGMT_EV_ADV_MONITOR_REMOVED event on the other.

Signed-off-by: Miao-chen Chou <mcchou@chromium.org>
---

Changes in v2: None

 net/bluetooth/mgmt.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 59a806f11a494..7c7460b58aa3a 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -156,6 +156,7 @@ static const u16 mgmt_events[] = {
 	MGMT_EV_PHY_CONFIGURATION_CHANGED,
 	MGMT_EV_EXP_FEATURE_CHANGED,
 	MGMT_EV_ADV_MONITOR_ADDED,
+	MGMT_EV_ADV_MONITOR_REMOVED,
 };
 
 static const u16 mgmt_untrusted_commands[] = {
@@ -3864,6 +3865,16 @@ static void mgmt_adv_monitor_added(struct sock *sk, struct hci_dev *hdev,
 	mgmt_event(MGMT_EV_ADV_MONITOR_ADDED, hdev, &ev, sizeof(ev), sk);
 }
 
+static void mgmt_adv_monitor_removed(struct sock *sk, struct hci_dev *hdev,
+				     u16 handle)
+{
+	struct mgmt_ev_adv_monitor_added ev;
+
+	ev.monitor_handle = handle;
+
+	mgmt_event(MGMT_EV_ADV_MONITOR_REMOVED, hdev, &ev, sizeof(ev), sk);
+}
+
 static int read_adv_monitor_features(struct sock *sk, struct hci_dev *hdev,
 				     void *data, u16 len)
 {
@@ -4016,12 +4027,15 @@ static int remove_adv_monitor(struct sock *sk, struct hci_dev *hdev,
 {
 	struct mgmt_cp_remove_adv_monitor *cp = data;
 	struct mgmt_rp_remove_adv_monitor rp;
+	unsigned int prev_adv_monitors_cnt;
 	int err;
 
 	BT_DBG("request for %s", hdev->name);
 
 	hci_dev_lock(hdev);
 
+	prev_adv_monitors_cnt = hdev->adv_monitors_cnt;
+
 	err = hci_remove_adv_monitor(hdev, cp->monitor_handle);
 	if (err == -ENOENT) {
 		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_REMOVE_ADV_MONITOR,
@@ -4029,6 +4043,9 @@ static int remove_adv_monitor(struct sock *sk, struct hci_dev *hdev,
 		goto unlock;
 	}
 
+	if (hdev->adv_monitors_cnt < prev_adv_monitors_cnt)
+		mgmt_adv_monitor_removed(sk, hdev, cp->monitor_handle);
+
 	hci_dev_unlock(hdev);
 
 	rp.monitor_handle = cp->monitor_handle;
-- 
2.26.2

