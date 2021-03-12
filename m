Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7BC338C26
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 Mar 2021 13:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhCLMAO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 12 Mar 2021 07:00:14 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53246 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbhCLL7v (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 12 Mar 2021 06:59:51 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: fdanis)
        with ESMTPSA id 30D271F41738
From:   =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH Bluez v2] adapter: Fix discovery trigger for 0 second delay
Date:   Fri, 12 Mar 2021 12:59:42 +0100
Message-Id: <20210312115942.15049-1-user@fdanis-XPS-13-9370>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Frédéric Danis <frederic.danis@collabora.com>

When calling `StartDiscovery` the effective start can take around 10 ms or
up to 700 ms.
g_timeout_add_seconds() call doesn't ensure the time for the first call of
the timer if the delay is less or equal to 1 second.
---
v2: Fix issue founs by CI

 src/adapter.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/src/adapter.c b/src/adapter.c
index cc0849f99..3078ce1a8 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -1797,6 +1797,13 @@ static void trigger_start_discovery(struct btd_adapter *adapter, guint delay)
 	if (!btd_adapter_get_powered(adapter))
 		return;
 
+	if (!delay) {
+		adapter->discovery_idle_timeout = g_idle_add(
+						start_discovery_timeout,
+						adapter);
+		return;
+	}
+
 	adapter->discovery_idle_timeout = g_timeout_add_seconds(delay,
 					start_discovery_timeout, adapter);
 }
-- 
2.18.0

