Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE866207B3F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Jun 2020 20:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405732AbgFXSLw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 24 Jun 2020 14:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405191AbgFXSLv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 24 Jun 2020 14:11:51 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49133C0613ED
        for <linux-bluetooth@vger.kernel.org>; Wed, 24 Jun 2020 11:11:51 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id 35so1372077ple.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 24 Jun 2020 11:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=422RvCVMwHIgJq8oJttIGIf/8JjnkP+mRkDXzBdPXT8=;
        b=WZQlmjlWEQ1UkJeisUgXi12IFZ6FlsnfN2wqfWi8/FVPnx/OJBTsDqSDl+FXmzFiyM
         6oBl5B6cOoZ/WjlUjxWskPl5yHIn3rERO++NtLEvpKmIYyhhUX4CiOwXhw7PhBLBIR0s
         lxwGO1QQCRUN+VZdtOEsTPYmlCio5gvwj+m4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=422RvCVMwHIgJq8oJttIGIf/8JjnkP+mRkDXzBdPXT8=;
        b=hftDhmN4M1Zo0gZzkHdSRUNV2U9afyZppFeZWZsY86ZFwCWYftyV9Hc43qGC5kwolA
         Bq2+uj32Jb+yXbbG3C+1BBil7Mt2rDXKH1eF7eq9HNK90V847zk6PbQfHVTaFUOSyDD/
         J6U7CgGqcEAML4MFYRHibF6qJLm4VZ9uVBhUzjSybdFxiYGqQTLYPBvyM54eyR+KgFZ/
         tKWI8S8YPWu4sSr80sce8wAoiposkkVm6cmtRmIGm/I1Qq068GV8Cfey9Ej48LvNFDo+
         h30VRfv1tWBJiJBBmQ8TqBfScfHGo5MDjl402IrLlJ26CcK5Z2/u2Y8jlYlVgUlkwNIL
         uiZA==
X-Gm-Message-State: AOAM533xbMcJaKYhCfZJvNfAsfeO74aT7DXkYh2BT0r5MIL0XDrLt87B
        0+eGvaBwDmxlczogo4bh5DlFpQ==
X-Google-Smtp-Source: ABdhPJz+C8v2cqUkkqdWQZydV3m7DEZkJpn2jSEDdMHcd1UHdmHWT6WqILDp+mDGYZS9oz6BpIb3yQ==
X-Received: by 2002:a17:90b:1087:: with SMTP id gj7mr30297077pjb.124.1593022310574;
        Wed, 24 Jun 2020 11:11:50 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id 127sm16139674pgf.5.2020.06.24.11.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 11:11:50 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     rjliao@codeaurora.org, marcel@holtmann.org,
        linux-bluetooth@vger.kernel.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] Bluetooth: btusb: Reset port on cmd timeout
Date:   Wed, 24 Jun 2020 11:11:44 -0700
Message-Id: <20200624111128.v2.1.Ibae403db54245c458d14297f1892c77c5055da41@changeid>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

QCA_ROME sometimes gets into a state where it is unresponsive to
commands. Since it doesn't have support for a reset gpio, reset the usb
port when this occurs instead.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
On Chromebooks with this chipset, we encountered cmd_timeout after
running suspend stress test for hundreds of iterations. Without
a recovery mechanism, continued cmd_timeout failures eventually caused
the suspend stress test to fail.

This change will just reset the port that the Bluetooth chip is on when
cmd_timeout is encountered. At the very least, the driver will unload
and stop affecting suspend. It doesn't seem to restore the BT controller
to a good state however (this still requires a power cycle).

Changes in v2:
- Renamed btusb_generic_usb_cmd_timeout to btusb_qca_cmd_timeout
- Updated commit note

 drivers/bluetooth/btusb.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index e42fdd625eb023..df46b2a34c1803 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -573,6 +573,22 @@ static void btusb_rtl_cmd_timeout(struct hci_dev *hdev)
 	gpiod_set_value_cansleep(reset_gpio, 0);
 }
 
+static void btusb_qca_cmd_timeout(struct hci_dev *hdev)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	int err;
+
+	if (++data->cmd_timeout_cnt < 5)
+		return;
+
+	bt_dev_err(hdev, "Multiple cmd timeouts seen. Resetting usb device.");
+	err = usb_autopm_get_interface(data->intf);
+	if (!err)
+		usb_queue_reset_device(data->intf);
+	else
+		bt_dev_err(hdev, "Failed usb_autopm_get_interface with %d", err);
+}
+
 static inline void btusb_free_frags(struct btusb_data *data)
 {
 	unsigned long flags;
@@ -3964,6 +3980,7 @@ static int btusb_probe(struct usb_interface *intf,
 	if (id->driver_info & BTUSB_QCA_ROME) {
 		data->setup_on_usb = btusb_setup_qca;
 		hdev->set_bdaddr = btusb_set_bdaddr_ath3012;
+		hdev->cmd_timeout = btusb_qca_cmd_timeout;
 		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
 		btusb_check_needs_reset_resume(intf);
 	}
-- 
2.27.0.111.gc72c7da667-goog

