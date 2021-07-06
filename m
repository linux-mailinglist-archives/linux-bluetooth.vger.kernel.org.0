Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480133BD328
	for <lists+linux-bluetooth@lfdr.de>; Tue,  6 Jul 2021 13:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238470AbhGFLs7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Jul 2021 07:48:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:47570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236919AbhGFLfr (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Jul 2021 07:35:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2951361C37;
        Tue,  6 Jul 2021 11:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625570683;
        bh=cfQLf0CNjvX9usKRmNl6F+fRQFClk36DT6igCS92lEQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VsAfsZHCXWjl8E1+UvjGwFUjvE8zFIu1K2I0MBPrz8MGw781rr/pgcJXXTfHK2HRu
         D0hxWOxIKcIv4+lcTm7pIrP4aYRVk2fznL2fijpc20NVvKr0cbEsvk8uVZFt1Xlz4R
         I+1Fu9x0lpQbXqxZ8mOl4jP3tmojU3D36MqiV36swkQ772dhg+aD+Tqqca6xFYDkes
         9S9i+izUquqkqb1GDVPUGhOrQw5inlgYsM803lBYIHmH9rhXczzQC9MYXNU2HniCdS
         N/CNuvPCmwDBQDgtzLBGswLzLBvUjxTU6v+IxIXxTFVMLDgcg6NfwlFttBXO6C7gPY
         RMa9KW76xU0tg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Kiran K <kiran.k@intel.com>,
        Lokendra Singh <lokendra.singh@intel.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 123/137] Bluetooth: Fix alt settings for incoming SCO with transparent coding format
Date:   Tue,  6 Jul 2021 07:21:49 -0400
Message-Id: <20210706112203.2062605-123-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112203.2062605-1-sashal@kernel.org>
References: <20210706112203.2062605-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Kiran K <kiran.k@intel.com>

[ Upstream commit 06d213d8a89a6f55b708422c3dda2b22add10748 ]

For incoming SCO connection with transparent coding format, alt setting
of CVSD is getting applied instead of Transparent.

Before fix:
< HCI Command: Accept Synchron.. (0x01|0x0029) plen 21  #2196 [hci0] 321.342548
        Address: 1C:CC:D6:E2:EA:80 (Xiaomi Communications Co Ltd)
        Transmit bandwidth: 8000
        Receive bandwidth: 8000
        Max latency: 13
        Setting: 0x0003
          Input Coding: Linear
          Input Data Format: 1's complement
          Input Sample Size: 8-bit
          # of bits padding at MSB: 0
          Air Coding Format: Transparent Data
        Retransmission effort: Optimize for link quality (0x02)
        Packet type: 0x003f
          HV1 may be used
          HV2 may be used
          HV3 may be used
          EV3 may be used
          EV4 may be used
          EV5 may be used
> HCI Event: Command Status (0x0f) plen 4               #2197 [hci0] 321.343585
      Accept Synchronous Connection Request (0x01|0x0029) ncmd 1
        Status: Success (0x00)
> HCI Event: Synchronous Connect Comp.. (0x2c) plen 17  #2198 [hci0] 321.351666
        Status: Success (0x00)
        Handle: 257
        Address: 1C:CC:D6:E2:EA:80 (Xiaomi Communications Co Ltd)
        Link type: eSCO (0x02)
        Transmission interval: 0x0c
        Retransmission window: 0x04
        RX packet length: 60
        TX packet length: 60
        Air mode: Transparent (0x03)
........
> SCO Data RX: Handle 257 flags 0x00 dlen 48            #2336 [hci0] 321.383655
< SCO Data TX: Handle 257 flags 0x00 dlen 60            #2337 [hci0] 321.389558
> SCO Data RX: Handle 257 flags 0x00 dlen 48            #2338 [hci0] 321.393615
> SCO Data RX: Handle 257 flags 0x00 dlen 48            #2339 [hci0] 321.393618
> SCO Data RX: Handle 257 flags 0x00 dlen 48            #2340 [hci0] 321.393618
< SCO Data TX: Handle 257 flags 0x00 dlen 60            #2341 [hci0] 321.397070
> SCO Data RX: Handle 257 flags 0x00 dlen 48            #2342 [hci0] 321.403622
> SCO Data RX: Handle 257 flags 0x00 dlen 48            #2343 [hci0] 321.403625
> SCO Data RX: Handle 257 flags 0x00 dlen 48            #2344 [hci0] 321.403625
> SCO Data RX: Handle 257 flags 0x00 dlen 48            #2345 [hci0] 321.403625
< SCO Data TX: Handle 257 flags 0x00 dlen 60            #2346 [hci0] 321.404569
< SCO Data TX: Handle 257 flags 0x00 dlen 60            #2347 [hci0] 321.412091
> SCO Data RX: Handle 257 flags 0x00 dlen 48            #2348 [hci0] 321.413626
> SCO Data RX: Handle 257 flags 0x00 dlen 48            #2349 [hci0] 321.413630
> SCO Data RX: Handle 257 flags 0x00 dlen 48            #2350 [hci0] 321.413630
< SCO Data TX: Handle 257 flags 0x00 dlen 60            #2351 [hci0] 321.419674

After fix:

< HCI Command: Accept Synchronou.. (0x01|0x0029) plen 21  #309 [hci0] 49.439693
        Address: 1C:CC:D6:E2:EA:80 (Xiaomi Communications Co Ltd)
        Transmit bandwidth: 8000
        Receive bandwidth: 8000
        Max latency: 13
        Setting: 0x0003
          Input Coding: Linear
          Input Data Format: 1's complement
          Input Sample Size: 8-bit
          # of bits padding at MSB: 0
          Air Coding Format: Transparent Data
        Retransmission effort: Optimize for link quality (0x02)
        Packet type: 0x003f
          HV1 may be used
          HV2 may be used
          HV3 may be used
          EV3 may be used
          EV4 may be used
          EV5 may be used
> HCI Event: Command Status (0x0f) plen 4                 #310 [hci0] 49.440308
      Accept Synchronous Connection Request (0x01|0x0029) ncmd 1
        Status: Success (0x00)
> HCI Event: Synchronous Connect Complete (0x2c) plen 17  #311 [hci0] 49.449308
        Status: Success (0x00)
        Handle: 257
        Address: 1C:CC:D6:E2:EA:80 (Xiaomi Communications Co Ltd)
        Link type: eSCO (0x02)
        Transmission interval: 0x0c
        Retransmission window: 0x04
        RX packet length: 60
        TX packet length: 60
        Air mode: Transparent (0x03)
< SCO Data TX: Handle 257 flags 0x00 dlen 60              #312 [hci0] 49.450421
< SCO Data TX: Handle 257 flags 0x00 dlen 60              #313 [hci0] 49.457927
> HCI Event: Max Slots Change (0x1b) plen 3               #314 [hci0] 49.460345
        Handle: 256
        Max slots: 5
< SCO Data TX: Handle 257 flags 0x00 dlen 60              #315 [hci0] 49.465453
> SCO Data RX: Handle 257 flags 0x00 dlen 60              #316 [hci0] 49.470502
> SCO Data RX: Handle 257 flags 0x00 dlen 60              #317 [hci0] 49.470519
< SCO Data TX: Handle 257 flags 0x00 dlen 60              #318 [hci0] 49.472996
> SCO Data RX: Handle 257 flags 0x00 dlen 60              #319 [hci0] 49.480412
< SCO Data TX: Handle 257 flags 0x00 dlen 60              #320 [hci0] 49.480492
< SCO Data TX: Handle 257 flags 0x00 dlen 60              #321 [hci0] 49.487989
> SCO Data RX: Handle 257 flags 0x00 dlen 60              #322 [hci0] 49.490303
< SCO Data TX: Handle 257 flags 0x00 dlen 60              #323 [hci0] 49.495496
> SCO Data RX: Handle 257 flags 0x00 dlen 60              #324 [hci0] 49.500304
> SCO Data RX: Handle 257 flags 0x00 dlen 60              #325 [hci0] 49.500311

Signed-off-by: Kiran K <kiran.k@intel.com>
Signed-off-by: Lokendra Singh <lokendra.singh@intel.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/bluetooth/hci_event.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 4676e4b0be2b..3bb7308e3eca 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4360,12 +4360,12 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev,
 
 	bt_dev_dbg(hdev, "SCO connected with air mode: %02x", ev->air_mode);
 
-	switch (conn->setting & SCO_AIRMODE_MASK) {
-	case SCO_AIRMODE_CVSD:
+	switch (ev->air_mode) {
+	case 0x02:
 		if (hdev->notify)
 			hdev->notify(hdev, HCI_NOTIFY_ENABLE_SCO_CVSD);
 		break;
-	case SCO_AIRMODE_TRANSP:
+	case 0x03:
 		if (hdev->notify)
 			hdev->notify(hdev, HCI_NOTIFY_ENABLE_SCO_TRANSP);
 		break;
-- 
2.30.2

