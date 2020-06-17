Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8991FCFD4
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Jun 2020 16:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgFQOjg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 17 Jun 2020 10:39:36 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58788 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbgFQOj2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 17 Jun 2020 10:39:28 -0400
Received: from localhost.localdomain (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 68562CECDF
        for <linux-bluetooth@vger.kernel.org>; Wed, 17 Jun 2020 16:49:17 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 10/14] Bluetooth: Notify adv monitor added event
Date:   Wed, 17 Jun 2020 16:39:16 +0200
Message-Id: <fdb52b467869fa9d3d125a2439d0d7a4c59f0143.1592404644.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1592404644.git.marcel@holtmann.org>
References: <cover.1592404644.git.marcel@holtmann.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Miao-chen Chou <mcchou@chromium.org>

This notifies management sockets on MGMT_EV_ADV_MONITOR_ADDED event.

The following test was performed.
- Start two btmgmt consoles, issue a btmgmt advmon-add command on one
console and observe a MGMT_EV_ADV_MONITOR_ADDED event on the other

Signed-off-by: Miao-chen Chou <mcchou@chromium.org>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
---
 net/bluetooth/mgmt.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index cff24fde72d2..3268d9a00608 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -191,6 +191,7 @@ static const u16 mgmt_untrusted_events[] = {
 	MGMT_EV_EXT_INDEX_REMOVED,
 	MGMT_EV_EXT_INFO_CHANGED,
 	MGMT_EV_EXP_FEATURE_CHANGED,
+	MGMT_EV_ADV_MONITOR_ADDED,
 };
 
 #define CACHE_TIMEOUT	msecs_to_jiffies(2 * 1000)
@@ -3977,6 +3978,16 @@ static int set_device_flags(struct sock *sk, struct hci_dev *hdev, void *data,
 				 &cp->addr, sizeof(cp->addr));
 }
 
+static void mgmt_adv_monitor_added(struct sock *sk, struct hci_dev *hdev,
+				   u16 handle)
+{
+	struct mgmt_ev_adv_monitor_added ev;
+
+	ev.monitor_handle = cpu_to_le16(handle);
+
+	mgmt_event(MGMT_EV_ADV_MONITOR_ADDED, hdev, &ev, sizeof(ev), sk);
+}
+
 static int read_adv_mon_features(struct sock *sk, struct hci_dev *hdev,
 				 void *data, u16 len)
 {
@@ -4029,8 +4040,8 @@ static int add_adv_patterns_monitor(struct sock *sk, struct hci_dev *hdev,
 	struct mgmt_rp_add_adv_patterns_monitor rp;
 	struct adv_monitor *m = NULL;
 	struct adv_pattern *p = NULL;
+	unsigned int mp_cnt = 0, prev_adv_monitors_cnt;
 	__u8 cp_ofst = 0, cp_len = 0;
-	unsigned int mp_cnt = 0;
 	int err, i;
 
 	BT_DBG("request for %s", hdev->name);
@@ -4094,6 +4105,8 @@ static int add_adv_patterns_monitor(struct sock *sk, struct hci_dev *hdev,
 
 	hci_dev_lock(hdev);
 
+	prev_adv_monitors_cnt = hdev->adv_monitors_cnt;
+
 	err = hci_add_adv_monitor(hdev, m);
 	if (err) {
 		if (err == -ENOSPC) {
@@ -4104,6 +4117,9 @@ static int add_adv_patterns_monitor(struct sock *sk, struct hci_dev *hdev,
 		goto unlock;
 	}
 
+	if (hdev->adv_monitors_cnt > prev_adv_monitors_cnt)
+		mgmt_adv_monitor_added(sk, hdev, m->handle);
+
 	hci_dev_unlock(hdev);
 
 	rp.monitor_handle = cpu_to_le16(m->handle);
-- 
2.26.2

