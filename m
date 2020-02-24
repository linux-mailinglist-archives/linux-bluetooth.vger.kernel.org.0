Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E981169DC9
	for <lists+linux-bluetooth@lfdr.de>; Mon, 24 Feb 2020 06:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgBXFas (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 24 Feb 2020 00:30:48 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:51740 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726455AbgBXFas (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 24 Feb 2020 00:30:48 -0500
Received: by mail-pj1-f66.google.com with SMTP id fa20so3654077pjb.1
        for <linux-bluetooth@vger.kernel.org>; Sun, 23 Feb 2020 21:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=kU/uwFw5m8yZNzhmgLHvo5xEN+O2R92zq6BXYA1mPKM=;
        b=Q+QeQLD5XzMfD3qE+HoKICbHgz8wHxCCrhw7eokEsn+MpIVsl6s7cRfrhZ6B3FB939
         YQZt5hwYim2WqijEVXE5rwCBswyDlkp5Ec9M3+eY7QqUso50cWgeYX8pzWPMLKUP1qcc
         zXdbrnXAwNTxCjAryc9xrm16FFwTenAyMd2LTKDF54IE4x1uZtXfT3kz/gnQYSbMZ/Jw
         VidG05fgjH1YgmACzbumQnX4032u0N51NPIGwhsC0McPbVAYxzLGPU3urEYKHJNwG2yG
         twyPhhUzLrOc52nlPc82v31QmKvZzH0R0iDaXF+2wuI+TOMlBLELd3zLSlsBS1Ri3N/g
         oYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kU/uwFw5m8yZNzhmgLHvo5xEN+O2R92zq6BXYA1mPKM=;
        b=nKFKL/qXEU60gOy/d5nD4WNChnqzdzUIuRrgizPmkTUKvIgijhunmRFaS5TaJURy8k
         D3EJDWuGfcpBgn8grn7NUVB9PQ6Oe6thiRJMZPew5XHSpJ6LZg/4wxdjLS9AnkjvdTuP
         gqvn74mySnTvV7ng1o3zAUQXmmWWeHraOTqxjmfr0rEJZ+d38KpKEJ9RSx/l9KE9m1c3
         9P+tZgRi0LAKDbzPITe4B4W/EvBbRQYuWmcLDbs2RsuExxBIMohWyjTa6hDAwoG8qux0
         lXCRV7Zrx82wAO3gQwOMs1j5lK+Z5xCDBzKc2lmvB3RmqeNPX/Vq4G/sF5YcuRQXvDOt
         lBgg==
X-Gm-Message-State: APjAAAWR2BqVT0/rey5S5dvhF/dVPO/avivgTua6j2QbCQFmh4uZn4aD
        JPuyuOQf4tKqxcnwCe4mWQ2lp7fTQQbPRw==
X-Google-Smtp-Source: APXvYqz7aL0U42+N2FBpDxT0MKr0m63jKksAdzOdqqaRwwkbfQ4Jhb4HX3cL5jAmfhU7r+JjAvt5Sg==
X-Received: by 2002:a17:90a:3ae5:: with SMTP id b92mr17368879pjc.26.1582522246247;
        Sun, 23 Feb 2020 21:30:46 -0800 (PST)
Received: from nsathish-Latitude-7480.iind.intel.com ([192.55.55.45])
        by smtp.gmail.com with ESMTPSA id k63sm10669587pjb.10.2020.02.23.21.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2020 21:30:45 -0800 (PST)
From:   Sathish Narsimman <nsathish41@gmail.com>
X-Google-Original-From: Sathish Narsimman <sathish.narasimman@intel.com>
To:     linux-bluetooth@vger.kernel.org, nsathish41@gmail.com
Cc:     Sathish Narsimman <sathish.narasimman@intel.com>
Subject: [PATCH v2] Bluetooth: Fix - Remove adv set for directed advertising
Date:   Mon, 24 Feb 2020 11:02:24 +0530
Message-Id: <20200224053224.9349-1-sathish.narasimman@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Extended advertising Data is set during bluetooth initialization
by default which causes InvalidHCICommandParameters when setting
Extended advertising parameters.

As per Core Spec 5.2 Vol 2, PART E, Sec 7.8.53, for
advertising_event_property LE_LEGACY_ADV_DIRECT_IND does not
supports advertising data when the advertising set already
contains some, the controller shall return erroc code
'InvalidHCICommandParameters(0x12).

So it is required to remove adv set for handle 0x00. since we use
instance 0 for directed adv.

Signed-off-by: Sathish Narsimman <sathish.narasimman@intel.com>
---
 include/net/bluetooth/hci.h |  2 ++
 net/bluetooth/hci_conn.c    | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 6293bdd7d862..0d7e36c54733 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -1724,6 +1724,8 @@ struct hci_cp_le_set_ext_scan_rsp_data {
 
 #define LE_SET_ADV_DATA_NO_FRAG		0x01
 
+#define HCI_OP_LE_REMOVE_ADV_SET	0x203c
+
 #define HCI_OP_LE_CLEAR_ADV_SETS	0x203d
 
 #define HCI_OP_LE_SET_ADV_SET_RAND_ADDR	0x2035
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index a582c676e584..2731f0ad2a90 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -898,6 +898,16 @@ static void hci_req_directed_advertising(struct hci_request *req,
 		cp.peer_addr_type = conn->dst_type;
 		bacpy(&cp.peer_addr, &conn->dst);
 
+		/* As per Core Spec 5.2 Vol 2, PART E, Sec 7.8.53, for
+		 * advertising_event_property LE_LEGACY_ADV_DIRECT_IND
+		 * does not supports advertising data when the advertising set already
+		 * contains some, the controller shall return erroc code 'Invalid
+		 * HCI Command Parameters(0x12).
+		 * So it is required to remove adv set for handle 0x00. since we use
+		 * instance 0 for directed adv.
+		 */
+		hci_req_add(req, HCI_OP_LE_REMOVE_ADV_SET, sizeof(cp.handle), &cp.handle);
+
 		hci_req_add(req, HCI_OP_LE_SET_EXT_ADV_PARAMS, sizeof(cp), &cp);
 
 		if (own_addr_type == ADDR_LE_DEV_RANDOM &&
-- 
2.17.1

