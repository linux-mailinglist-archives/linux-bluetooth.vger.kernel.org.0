Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C031225E77
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 May 2019 09:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbfEVHFq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 May 2019 03:05:46 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:49582 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfEVHFq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 May 2019 03:05:46 -0400
Received: from localhost.localdomain (p5B3D2A37.dip0.t-ipconnect.de [91.61.42.55])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1D6ECCF183;
        Wed, 22 May 2019 09:14:04 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     anarsoul@gmail.com, linux-bluetooth@vger.kernel.org
Subject: [RFC] Bluetooth: Check key sizes only when Secure Simple Pairing is enabled
Date:   Wed, 22 May 2019 09:05:40 +0200
Message-Id: <20190522070540.48895-1-marcel@holtmann.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The encryption is only mandatory to be enforced when both sides are using
Secure Simple Pairing and this means the key size check makes only sense
in that case.

On legacy Bluetooth 2.0 and earlier devices like mice the encryption was
optional and thus causing an issue if the key size check is not bound to
using Secure Simple Pairing.

Fixes: d5bb334a8e17 ("Bluetooth: Align minimum encryption key size for LE and BR/EDR connections")
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Cc: stable@vger.kernel.org
---
 net/bluetooth/hci_conn.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 3cf0764d5793..7516cdde3373 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -1272,8 +1272,13 @@ int hci_conn_check_link_mode(struct hci_conn *conn)
 			return 0;
 	}
 
-	if (hci_conn_ssp_enabled(conn) &&
-	    !test_bit(HCI_CONN_ENCRYPT, &conn->flags))
+	/* If Secure Simple Pairing is not enabled, then legacy connection
+	 * setup is used and no encryption or key sizes can be enforced.
+	 */
+	if (!hci_conn_ssp_enabled(conn))
+		return 1;
+
+	if (!test_bit(HCI_CONN_ENCRYPT, &conn->flags))
 		return 0;
 
 	/* The minimum encryption key size needs to be enforced by the
-- 
2.20.1

