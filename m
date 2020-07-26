Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38D022E2B4
	for <lists+linux-bluetooth@lfdr.de>; Sun, 26 Jul 2020 23:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgGZVMd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 26 Jul 2020 17:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgGZVMc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 26 Jul 2020 17:12:32 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A8CC0619D2
        for <linux-bluetooth@vger.kernel.org>; Sun, 26 Jul 2020 14:12:32 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a15so12903706wrh.10
        for <linux-bluetooth@vger.kernel.org>; Sun, 26 Jul 2020 14:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=8tWWy7CL8KthsmlZ1i0YYOB5ajQt3yNa3kK4+sda0s8=;
        b=RtCnhYOdbtuBmbO4gwfaai9jlnPizsipIW3kpEjFBWX4fs7cC8gJWxwOskPxjyVMX1
         VMehiTLw61yYEYqJ0vLokcOLz6pxxvuG643dQFauiitk7oGGMKoOahNweoqjkHg7fIyi
         68xyPdc3VVl8MOCmtxFWdXF6m2Gjo6rQ5oQ4fnnBuZZLV259KZhwhC05gARR9DJy3bnW
         kb84qDPyiJyvnTm25dxhPwOv/ghhkvA9nIp+tQ9pUhL+FEIL0HkHX35iXeKTDdcEhMVc
         5Zl1LcsXnFbSrkJxYmL6a0N9E5lIdaRXmkH/bz30ab8ourNR5J39RoJR0ioY/ufoJMvO
         CQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=8tWWy7CL8KthsmlZ1i0YYOB5ajQt3yNa3kK4+sda0s8=;
        b=n/2OVdtEB2KG7GVHpUTHydiYGLzE9xX37u7xpRUPRvqp/cN32nV6eEO3+nFFZW2WKc
         GGffo5aQtwKLDYDpfAqeO6dOaobGzH42lZC/LIuNSBFzBnecmZw+I8btB5/lJ+ZAx0bc
         iCV9NsDMOZAAOqZPUtikeTENa4MWBB+1F7Xjry3jzYv/3fwfVqG0598UuSovW98ypLdk
         R9RdgqLEEfXzp/TluwfIZQIQ8Ih09nlNiGENlZ6pRK8p67VtmmIe4BDjkKKI/XyiOQmB
         4FED8KhcBZ4/D3wHstHV8x0Dco7ouQD2uFMI9mTrOeQMRU5aErtHxOIJ/dFMN+OSbar3
         Qw+Q==
X-Gm-Message-State: AOAM531pEaPGCnuK7LMT0GC2EmZk1DlHalBndIEdsbqG22acTahi5O2s
        ecdZrSumR8U1nu5cnYTYaBE=
X-Google-Smtp-Source: ABdhPJylt9f1JrMRK5lrnONN2Hp6n30lXdpTs4PdmWUIZQfLR0+e1yhe4T7W8crbzC5//qoby0k38w==
X-Received: by 2002:adf:f812:: with SMTP id s18mr8292300wrp.96.1595797950983;
        Sun, 26 Jul 2020 14:12:30 -0700 (PDT)
Received: from 168.52.45.77 (201.ip-51-68-45.eu. [51.68.45.201])
        by smtp.gmail.com with ESMTPSA id p15sm9138173wrj.61.2020.07.26.14.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2020 14:12:30 -0700 (PDT)
From:   Ismael Ferreras Morezuelas <swyterzone@gmail.com>
Subject: [PATCH v4] Bluetooth: btusb: Fix and detect most of the Chinese
 Bluetooth controllers
To:     BlueZ <linux-bluetooth@vger.kernel.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Message-ID: <0bba3f22-a232-3c07-1b05-73e6d38dab8a@gmail.com>
Date:   Sun, 26 Jul 2020 23:12:28 +0200
User-Agent: nano 6.4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

For some reason they tend to squat on the very first CSR/
Cambridge Silicon Radio VID/PID instead of paying fees.

This is an extremely common problem; the issue goes as back as 2013
and these devices are only getting more popular, even rebranded by
reputable vendors and sold by retailers everywhere.

So, at this point in time there are hundreds of modern dongles reusing
the ID of what originally was an early Bluetooth 1.1 controller.

Linux is the only place where they don't work due to spotty checks
in our detection code. It only covered a minimum subset.

So what's the big idea? Take advantage of the fact that all CSR
chips report the same internal version as both the LMP sub-version and
HCI revision number. It always matches, couple that with the manufacturer
code, that rarely lies, and we now have a good idea of who is who.

Additionally, by compiling a list of user-reported HCI/lsusb dumps, and
searching around for legit CSR dongles in similar product ranges we can
find what CSR BlueCore firmware supported which Bluetooth versions.

That way we can narrow down ranges of fakes for each of them.

e.g. Real CSR dongles with LMP subversion 0x73 are old enough that
     support BT 1.1 only; so it's a dead giveaway when some
     third-party BT 4.0 dongle reuses it.

So, to sum things up; there are multiple classes of fake controllers
reusing the same 0A12:0001 VID/PID. This has been broken for a while.

Known 'fake' bcdDevices: 0x0100, 0x0134, 0x1915, 0x2520, 0x7558, 0x8891
  IC markings on 0x7558: FR3191AHAL 749H15143 (???)

https://bugzilla.kernel.org/show_bug.cgi?id=60824

Fixes: 81cac64ba258ae (Deal with USB devices that are faking CSR vendor)
Reported-by: Michał Wiśniewski <brylozketrzyn@gmail.com>
Tested-by: Mike Johnson <yuyuyak@gmail.com>
Tested-by: Ricardo Rodrigues <ekatonb@gmail.com>
Tested-by: M.Hanny Sabbagh <mhsabbagh@outlook.com>
Tested-by: Oussama BEN BRAHIM <b.brahim.oussama@gmail.com>
Tested-by: Ismael Ferreras Morezuelas <swyterzone@gmail.com>
Signed-off-by: Ismael Ferreras Morezuelas <swyterzone@gmail.com>
---

Changes in v4:
* Chain the is_fake conditions with else ifs.
* Properly use le16_to_cpu() when needed.

Changes in v3:
* Find an even better-er way of detecting which type is which; use the
  best parts of v1 and v2 and combine them with previous feedback.
* Additionally, detect fakes by comparing against real BlueCore
  firmware numbers and their supported protocol versions.
* Introduce HCI_QUIRK_BROKEN_ERR_DATA_REPORTING and use it on all
  fake chips. It doesn't seem to cause any drawback, and if we
  make it too specific a lot of these chips won't work at all,
  so it's probably better than nothing. Other user reported
  being able to finally pair with their stereo A2DP speaker
  with this fix.
* Limit the use of btusb_setup_csr() only to cover 0A12:0001.
* Use bt_dev_warn for the fake detection notice.
* Remove all other noisy bt_dev_info() calls.

Changes in v2:
* Find a better way of detecting which type is which; scrap the wonky
  >=Bluetooth 1.2 protocol check and instead do what's described above.
* Move all the quirk logic to btusb_setup_csr(), simplify it a bit.
* Use a switch statement and list all the known broken bcdDevice
  instead of trying to penalize the real CSR devices.
* Add two bt_dev_info() prints because this may be important in the
  future, given the amount of variables we are playing with here.
* Try to keep my comments within a 80-column limit.

Now I'm able to pair with Android devices, A2DP headphones,
DS4 controllers and more; whereas previously set up failed
and userland software couldn't even scan with it.

This patch probably uncovers other quirks in some of these
previously *unusable* dongles, so it's probably a good start
point so that other fixes can be implemented on top.

Looking forward to fine-tune these checks in the future.
Let me know what you think.

 drivers/bluetooth/btusb.c         | 74 ++++++++++++++++++++++++++-----
 include/net/bluetooth/bluetooth.h |  2 +
 include/net/bluetooth/hci.h       | 11 +++++
 net/bluetooth/hci_core.c          |  6 ++-
 4 files changed, 81 insertions(+), 12 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 5f022e9cf..5b8cf9ba9 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -1720,6 +1720,7 @@ static int btusb_setup_csr(struct hci_dev *hdev)
 {
 	struct hci_rp_read_local_version *rp;
 	struct sk_buff *skb;
+	bool is_fake = false;
 
 	BT_DBG("%s", hdev->name);
 
@@ -1739,18 +1740,69 @@ static int btusb_setup_csr(struct hci_dev *hdev)
 
 	rp = (struct hci_rp_read_local_version *)skb->data;
 
-	/* Detect controllers which aren't real CSR ones. */
+	/* Detect a wide host of Chinese controllers that aren't CSR.
+	 *
+	 * Known fake bcdDevices: 0x0100, 0x0134, 0x1915, 0x2520, 0x7558, 0x8891
+	 *
+	 * The main thing they have in common is that these are really popular low-cost
+	 * options that support newer Bluetooth versions but rely on heavy VID/PID
+	 * squatting of this poor old Bluetooth 1.1 device. Even sold as such.
+	 *
+	 * We detect actual CSR devices by checking that the HCI manufacturer code
+	 * is Cambridge Silicon Radio (10) and ensuring that LMP sub-version and
+	 * HCI rev values always match. As they both store the firmware number.
+	 */
 	if (le16_to_cpu(rp->manufacturer) != 10 ||
-	    le16_to_cpu(rp->lmp_subver) == 0x0c5c) {
+	    le16_to_cpu(rp->hci_rev) != le16_to_cpu(rp->lmp_subver))
+		is_fake = true;
+
+	/* Known legit CSR firmware build numbers and their supported BT versions:
+	 * - 1.1 (0x1) -> 0x0073, 0x020d, 0x033c, 0x034e
+	 * - 1.2 (0x2) ->                 0x04d9, 0x0529
+	 * - 2.0 (0x3) ->         0x07a6, 0x07ad, 0x0c5c
+	 * - 2.1 (0x4) ->         0x149c, 0x1735, 0x1899 (0x1899 is a BlueCore4-External)
+	 * - 4.0 (0x6) ->         0x1d86, 0x2031, 0x22bb
+	 *
+	 * e.g. Real CSR dongles with LMP subversion 0x73 are old enough that
+	 *      support BT 1.1 only; so it's a dead giveaway when some
+	 *      third-party BT 4.0 dongle reuses it.
+	 */
+	else if (le16_to_cpu(rp->lmp_subver) <= 0x034e &&
+		 le16_to_cpu(rp->hci_ver) > BLUETOOTH_VER_1_1)
+		is_fake = true;
+
+	else if (le16_to_cpu(rp->lmp_subver) <= 0x0529 &&
+		 le16_to_cpu(rp->hci_ver) > BLUETOOTH_VER_1_2)
+		is_fake = true;
+
+	else if (le16_to_cpu(rp->lmp_subver) <= 0x0c5c &&
+		 le16_to_cpu(rp->hci_ver) > BLUETOOTH_VER_2_0)
+		is_fake = true;
+
+	else if (le16_to_cpu(rp->lmp_subver) <= 0x1899 &&
+		 le16_to_cpu(rp->hci_ver) > BLUETOOTH_VER_2_1)
+		is_fake = true;
+
+	else if (le16_to_cpu(rp->lmp_subver) <= 0x22bb &&
+		 le16_to_cpu(rp->hci_ver) > BLUETOOTH_VER_4_0)
+		is_fake = true;
+
+	if (is_fake) {
+		bt_dev_warn(hdev, "CSR: Unbranded CSR clone detected; adding workarounds...");
+
+		/* Generally these clones have big discrepancies between
+		 * advertised features and what's actually supported.
+		 * Probably will need to be expanded in the future;
+		 * without these the controller will lock up.
+		 */
+		set_bit(HCI_QUIRK_BROKEN_STORED_LINK_KEY, &hdev->quirks);
+		set_bit(HCI_QUIRK_BROKEN_ERR_DATA_REPORTING, &hdev->quirks);
+
 		/* Clear the reset quirk since this is not an actual
 		 * early Bluetooth 1.1 device from CSR.
 		 */
 		clear_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks);
-
-		/* These fake CSR controllers have all a broken
-		 * stored link key handling and so just disable it.
-		 */
-		set_bit(HCI_QUIRK_BROKEN_STORED_LINK_KEY, &hdev->quirks);
+		clear_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
 	}
 
 	kfree_skb(skb);
@@ -4001,11 +4053,13 @@ static int btusb_probe(struct usb_interface *intf,
 		if (bcdDevice < 0x117)
 			set_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks);
 
+		/* This must be set first in case we disable it for fakes */
+		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
+
 		/* Fake CSR devices with broken commands */
-		if (bcdDevice <= 0x100 || bcdDevice == 0x134)
+		if (le16_to_cpu(udev->descriptor.idVendor)  == 0x0a12 &&
+		    le16_to_cpu(udev->descriptor.idProduct) == 0x0001)
 			hdev->setup = btusb_setup_csr;
-
-		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
 	}
 
 	if (id->driver_info & BTUSB_SNIFFER) {
diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
index 181900553..155019220 100644
--- a/include/net/bluetooth/bluetooth.h
+++ b/include/net/bluetooth/bluetooth.h
@@ -41,6 +41,8 @@
 #define BLUETOOTH_VER_1_1	1
 #define BLUETOOTH_VER_1_2	2
 #define BLUETOOTH_VER_2_0	3
+#define BLUETOOTH_VER_2_1	4
+#define BLUETOOTH_VER_4_0	6
 
 /* Reserv for core and drivers use */
 #define BT_SKB_RESERVE	8
diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 16ab6ce87..1c321b6d1 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -227,6 +227,17 @@ enum {
 	 * supported.
 	 */
 	HCI_QUIRK_VALID_LE_STATES,
+
+	/* When this quirk is set, then erroneous data reporting
+	 * is ignored. This is mainly due to the fact that the HCI
+	 * Read Default Erroneous Data Reporting command is advertised,
+	 * but not supported; these controllers often reply with unknown
+	 * command and tend to lock up randomly. Needing a hard reset.
+	 *
+	 * This quirk can be set before hci_register_dev is called or
+	 * during the hdev->setup vendor callback.
+	 */
+	HCI_QUIRK_BROKEN_ERR_DATA_REPORTING,
 };
 
 /* HCI device flags */
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index dbe2d79f2..48d7c7e23 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -606,7 +606,8 @@ static int hci_init3_req(struct hci_request *req, unsigned long opt)
 	if (hdev->commands[8] & 0x01)
 		hci_req_add(req, HCI_OP_READ_PAGE_SCAN_ACTIVITY, 0, NULL);
 
-	if (hdev->commands[18] & 0x04)
+	if (hdev->commands[18] & 0x04 &&
+	    !test_bit(HCI_QUIRK_BROKEN_ERR_DATA_REPORTING, &hdev->quirks))
 		hci_req_add(req, HCI_OP_READ_DEF_ERR_DATA_REPORTING, 0, NULL);
 
 	/* Some older Broadcom based Bluetooth 1.2 controllers do not
@@ -851,7 +852,8 @@ static int hci_init4_req(struct hci_request *req, unsigned long opt)
 	/* Set erroneous data reporting if supported to the wideband speech
 	 * setting value
 	 */
-	if (hdev->commands[18] & 0x08) {
+	if (hdev->commands[18] & 0x08 &&
+	    !test_bit(HCI_QUIRK_BROKEN_ERR_DATA_REPORTING, &hdev->quirks)) {
 		bool enabled = hci_dev_test_flag(hdev,
 						 HCI_WIDEBAND_SPEECH_ENABLED);
 
-- 
2.22.0

