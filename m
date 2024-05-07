Return-Path: <linux-bluetooth+bounces-4359-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB348BE7A1
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 May 2024 17:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A90201F25DAD
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 May 2024 15:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED4316C42C;
	Tue,  7 May 2024 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eL8BgDVy"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46B7168AFD
	for <linux-bluetooth@vger.kernel.org>; Tue,  7 May 2024 15:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715096567; cv=none; b=hEP+JexSa55K1wVYlG+M1HhvDFIx8bZpt8kRKiS4Jlk/msDJhLcJQVrDb/inrYaLsbnoPrcVlHYdNJxdueWKaXRuD/soOjc2jh2ik9LEms4KVLB99vLfhinPS5Y4RzusKGWMd6zhQNkhYh74EmwVygilUw0ioO3UOHeAsHMeDoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715096567; c=relaxed/simple;
	bh=G9vS7JZvyACUNc6RH5PhXk0ij1v8ZQD44sb2CJII4WQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d7eyf9O+sKEyHVtpEE/OYQGvedRcxhLZIf057B28nuyv7dM5D/g/88v2dNKpvyEiH5x6GKnnz7DQjHFdpEtnGyzaXYCkMSbm0u+CxAvio2vG/Bb8e1aefhWQr6Rm8th8PIw2VH9NoEQLtJ90gIfdlUO+aKRBoA2z0U3SdjBrgNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eL8BgDVy; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715096566; x=1746632566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G9vS7JZvyACUNc6RH5PhXk0ij1v8ZQD44sb2CJII4WQ=;
  b=eL8BgDVyfLlTLhC0VYhjQl1FhXUFaLL06//+zhBlrq8GcE7ozn71LWbh
   pDG0VLWQpQ+Ppu6rsWr1DuvfaW/FV2cqZV3FCZj3OJwf/TtoOv5t9Ci3+
   GasglWayuDnw7QQfLcXHhR9x0HJcDKDUF1jfR6nD8BQtzi4EwGl7v+NVv
   GEbP9+J02vrC55sZRpfBSyvP/Sd5cVJvvlgdgiYI0AJkcbLax/mK6N7IR
   8KyrtiharGkHeJhtgORe8dgmHvjL9eag3Oya7j2JDSrKl5oXsdba53EOU
   59YMDOlAUItrORQcti/tHxpqj3Q8+Ek8NnJhCRvcd8b9uHEW5RKcvG8ft
   g==;
X-CSE-ConnectionGUID: UIalrVusQwe1eyVnLl1jVg==
X-CSE-MsgGUID: b1CgwEepTympQRHwwUpYTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11026647"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="11026647"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 08:42:45 -0700
X-CSE-ConnectionGUID: bnsH4lXlTyaP65FR99jboQ==
X-CSE-MsgGUID: HrETSNySTqOwZUAqUJ9Tiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="28647374"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orviesa009.jf.intel.com with ESMTP; 07 May 2024 08:42:43 -0700
From: Kiran K <kiran.k@intel.com>
To: linux-bluetooth@vger.kernel.org
Cc: ravishankar.srivatsa@intel.com,
	chethan.tumkur.narayan@intel.com,
	chandrashekar.devegowda@intel.com,
	helgaas@kernel.org,
	pmenzel@molgen.mpg.de,
	Kiran K <kiran.k@intel.com>
Subject: [PATCH v2 3/3] Bluetooth: btintel_pcie: Add *setup* function to download firmware
Date: Tue,  7 May 2024 21:26:58 +0530
Message-Id: <20240507155658.294676-3-kiran.k@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240507155658.294676-1-kiran.k@intel.com>
References: <20240507155658.294676-1-kiran.k@intel.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to download firmware.

dmesg:
[4.407464] Bluetooth: Core ver 2.22
[4.407467] Bluetooth: Starting self testing
[4.409093] Bluetooth: ECDH test passed in 1587 usecs
[4.420737] Bluetooth: SMP test passed in 526 usecs
[4.420745] Bluetooth: Finished self testing
[4.420760] Bluetooth: HCI device and connection manager initialized
[4.420764] Bluetooth: HCI socket layer initialized
[4.420766] Bluetooth: L2CAP socket layer initialized
[4.420769] Bluetooth: SCO socket layer initialized
[4.437976] Bluetooth: hci0: Device revision is 0
[4.437979] Bluetooth: hci0: Secure boot is disabled
[4.437980] Bluetooth: hci0: OTP lock is disabled
[4.437980] Bluetooth: hci0: API lock is disabled
[4.437981] Bluetooth: hci0: Debug lock is disabled
[4.437981] Bluetooth: hci0: Minimum firmware build 0 week 0 2000
[4.437982] Bluetooth: hci0: Bootloader timestamp 2023.33 buildtype 1 build 45995
[4.439461] Bluetooth: hci0: Found device firmware: intel/ibt-0190-0291-iml.sfi
[4.439467] Bluetooth: hci0: Boot Address: 0x30099000
[4.439468] Bluetooth: hci0: Firmware Version: 92-19.24
[4.486773] Bluetooth: hci0: Waiting for firmware download to complete
[4.486784] Bluetooth: hci0: Firmware loaded in 46209 usecs
[4.486845] Bluetooth: hci0: Waiting for device to boot
[4.491984] Bluetooth: hci0: Malformed MSFT vendor event: 0x02
[4.491987] Bluetooth: hci0: Device booted in 5074 usecs
[4.496657] Bluetooth: hci0: Found device firmware: intel/ibt-0190-0291.sfi
[4.496703] Bluetooth: hci0: Boot Address: 0x10000800
[4.496704] Bluetooth: hci0: Firmware Version: 92-19.24
[4.687338] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[4.687342] Bluetooth: BNEP filters: protocol multicast
[4.687345] Bluetooth: BNEP socket layer initialized
[4.922589] Bluetooth: hci0: Waiting for firmware download to complete
[4.922608] Bluetooth: hci0: Firmware loaded in 415962 usecs
[4.922664] Bluetooth: hci0: Waiting for device to boot
[4.956185] Bluetooth: hci0: Malformed MSFT vendor event: 0x02
[4.956188] Bluetooth: hci0: Device booted in 32770 usecs
[4.963167] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-0190-0291.ddc
[4.963440] Bluetooth: hci0: Applying Intel DDC parameters completed
[4.963684] Bluetooth: hci0: Firmware timestamp 2024.18 buildtype 3 build 62300
[4.963687] Bluetooth: hci0: Firmware SHA1: 0x8201a4cd
[5.003020] Bluetooth: MGMT ver 1.22
[5.003084] Bluetooth: ISO socket layer initialized
[5.057844] Bluetooth: RFCOMM TTY layer initialized
[5.057858] Bluetooth: RFCOMM socket layer initialized
[5.057865] Bluetooth: RFCOMM ver 1.11

hciconfig -a:
hci0:   Type: Primary  Bus: PCI
        BD Address: A0:D3:65:48:F5:7F  ACL MTU: 1021:5  SCO MTU: 240:8
        UP RUNNING PSCAN
        RX bytes:23603 acl:0 sco:0 events:3792 errors:0
        TX bytes:949804 acl:0 sco:0 commands:3788 errors:0
        Features: 0xbf 0xfe 0x0f 0xfe 0xdb 0xff 0x7b 0x87
        Packet type: DM1 DM3 DM5 DH1 DH3 DH5 HV1 HV2 HV3
        Link policy: RSWITCH SNIFF
        Link mode: PERIPHERAL ACCEPT
        Name: 'LNLM620'
        Class: 0x20010c
        Service Classes: Audio
        Device Class: Computer, Laptop
        HCI Version: 5.4 (0xd)  Revision: 0x4b5c
        LMP Version: 5.4 (0xd)  Subversion: 0x4b5c
        Manufacturer: Intel Corp. (2)

Signed-off-by: Chandrashekar <chandrashekar.devegowda@intel.com>
Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Kiran K <kiran.k@intel.com>
---
 drivers/bluetooth/btintel_pcie.c | 313 ++++++++++++++++++++++++++++++-
 drivers/bluetooth/btintel_pcie.h |   5 +
 2 files changed, 315 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index 911bb50d7ce7..664cc08b0b4f 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -42,6 +42,7 @@ MODULE_DEVICE_TABLE(pci, btintel_pcie_table);
 
 /* Intel PCIe uses 4 bytes of HCI type instead of 1 byte BT SIG HCI type */
 #define BTINTEL_PCIE_HCI_TYPE_LEN	4
+#define BTINTEL_PCIE_HCI_CMD_PKT	0x00000001
 #define BTINTEL_PCIE_HCI_ACL_PKT	0x00000002
 #define BTINTEL_PCIE_HCI_SCO_PKT	0x00000003
 #define BTINTEL_PCIE_HCI_EVT_PKT	0x00000004
@@ -88,6 +89,75 @@ static struct btintel_pcie_data *btintel_pcie_get_data(struct msix_entry *entry)
 	return container_of(entries, struct btintel_pcie_data, msix_entries[0]);
 }
 
+/* Set the doorbell for TXQ to notify the device that @index (actually index-1)
+ * of the TFD is updated and ready to transmit.
+ */
+static void btintel_pcie_set_tx_db(struct btintel_pcie_data *data, u16 index)
+{
+	u32 val;
+
+	val = index;
+	val |= (BTINTEL_PCIE_TX_DB_VEC << 16);
+
+	btintel_pcie_wr_reg32(data, BTINTEL_PCIE_CSR_HBUS_TARG_WRPTR, val);
+}
+
+/* Copy the data to next(@tfd_index) data buffer and update the TFD(transfer
+ * descriptor) with the data length and the DMA address of the data buffer.
+ */
+static void btintel_pcie_prepare_tx(struct txq *txq, u16 tfd_index,
+				    struct sk_buff *skb)
+{
+	struct data_buf *buf;
+	struct tfd *tfd;
+
+	tfd = &txq->tfds[tfd_index];
+	memset(tfd, 0, sizeof(*tfd));
+
+	buf = &txq->bufs[tfd_index];
+
+	tfd->size = skb->len;
+	tfd->addr = buf->data_p_addr;
+
+	/* Copy the outgoing data to DMA buffer */
+	memcpy(buf->data, skb->data, tfd->size);
+}
+
+static int btintel_pcie_send_sync(struct btintel_pcie_data *data,
+				  struct sk_buff *skb)
+{
+	int ret;
+	u16 tfd_index;
+	struct txq *txq = &data->txq;
+
+	tfd_index = data->ia.tr_hia[BTINTEL_PCIE_TXQ_NUM];
+
+	if (tfd_index > txq->count)
+		return -ERANGE;
+
+	/* Prepare for TX. It updates the TFD with the length of data and
+	 * address of the DMA buffer, and copy the data to the DMA buffer
+	 */
+	btintel_pcie_prepare_tx(txq, tfd_index, skb);
+
+	tfd_index = (tfd_index + 1) % txq->count;
+	data->ia.tr_hia[BTINTEL_PCIE_TXQ_NUM] = tfd_index;
+
+	/* Arm wait event condition */
+	data->tx_wait_done = false;
+
+	/* Set the doorbell to notify the device */
+	btintel_pcie_set_tx_db(data, tfd_index);
+
+	/* Wait for the complete interrupt - URBD0 */
+	ret = wait_event_timeout(data->tx_wait_q, data->tx_wait_done,
+				 msecs_to_jiffies(TX_WAIT_TIMEOUT_MS));
+	if (!ret)
+		return -ETIME;
+
+	return 0;
+}
+
 /* Set the doorbell for RXQ to notify the device that @index (actually index-1)
  * is available to receive the data
  */
@@ -933,15 +1003,252 @@ static int btintel_pcie_alloc(struct btintel_pcie_data *data)
 	return err;
 }
 
+static int btintel_pcie_hci_open(struct hci_dev *hdev)
+{
+	bt_dev_dbg(hdev, "btintel_pcie_hci_open");
+
+	return 0;
+}
+
+static int btintel_pcie_hci_close(struct hci_dev *hdev)
+{
+	bt_dev_dbg(hdev, "btintel_pcie_hci_close");
+
+	return 0;
+}
+
+static int btintel_pcie_inject_cmd_complete(struct hci_dev *hdev, __u16 opcode)
+{
+	struct sk_buff *skb;
+	struct hci_event_hdr *hdr;
+	struct hci_ev_cmd_complete *evt;
+
+	skb = bt_skb_alloc(sizeof(*hdr) + sizeof(*evt) + 1, GFP_KERNEL);
+	if (!skb)
+		return -ENOMEM;
+
+	hdr = (struct hci_event_hdr *)skb_put(skb, sizeof(*hdr));
+	hdr->evt = HCI_EV_CMD_COMPLETE;
+	hdr->plen = sizeof(*evt) + 1;
+
+	evt = (struct hci_ev_cmd_complete *)skb_put(skb, sizeof(*evt));
+	evt->ncmd = 0x01;
+	evt->opcode = cpu_to_le16(opcode);
+
+	*(u8 *)skb_put(skb, 1) = 0x00;
+
+	hci_skb_pkt_type(skb) = HCI_EVENT_PKT;
+
+	return hci_recv_frame(hdev, skb);
+}
+
+static int btintel_pcie_hci_send_frame(struct hci_dev *hdev,
+				       struct sk_buff *skb)
+{
+	struct btintel_pcie_data *data = hci_get_drvdata(hdev);
+	int ret;
+	u32 type;
+
+	/* Due to the fw limitation, the type header of the packet should be
+	 * 4 bytes unlike 1 byte for UART. In UART, the firmware can read
+	 * the first byte to get the packet type and redirect the rest of data
+	 * packet to the right handler.
+	 *
+	 * But for PCIe, THF(Transfer Flow Handler) fetches the 4 bytes of data
+	 * from DMA memory and by the time it reads the first 4 bytes, it has
+	 * already consumed some part of packet. Thus the packet type indicator
+	 * for iBT PCIe is 4 bytes.
+	 *
+	 * Luckily, when HCI core creates the skb, it allocates 8 bytes of
+	 * head room for profile and driver use, and before sending the data
+	 * to the device, append the iBT PCIe packet type in the front.
+	 */
+	switch (hci_skb_pkt_type(skb)) {
+	case HCI_COMMAND_PKT:
+		type = BTINTEL_PCIE_HCI_CMD_PKT;
+		if (btintel_test_flag(hdev, INTEL_BOOTLOADER)) {
+			struct hci_command_hdr *cmd = (void *)skb->data;
+			__u16 opcode = le16_to_cpu(cmd->opcode);
+
+			/* When the 0xfc01 command is issued to boot into
+			 * the operational firmware, it will actually not
+			 * send a command complete event. To keep the flow
+			 * control working inject that event here.
+			 */
+			if (opcode == 0xfc01)
+				btintel_pcie_inject_cmd_complete(hdev, opcode);
+		}
+		hdev->stat.cmd_tx++;
+		break;
+	case HCI_ACLDATA_PKT:
+		type = BTINTEL_PCIE_HCI_ACL_PKT;
+		hdev->stat.acl_tx++;
+		break;
+	case HCI_SCODATA_PKT:
+		type = BTINTEL_PCIE_HCI_SCO_PKT;
+		hdev->stat.sco_tx++;
+		break;
+	default:
+		bt_dev_err(hdev, "Unknown HCI packet type");
+		return -EILSEQ;
+	}
+	memcpy(skb_push(skb, BTINTEL_PCIE_HCI_TYPE_LEN), &type,
+	       BTINTEL_PCIE_HCI_TYPE_LEN);
+
+	ret = btintel_pcie_send_sync(data, skb);
+	if (ret) {
+		hdev->stat.err_tx++;
+		bt_dev_err(hdev, "Failed to send frame (%d)", ret);
+		goto exit_error;
+	} else {
+		hdev->stat.byte_tx += skb->len;
+		kfree_skb(skb);
+	}
+
+exit_error:
+	return ret;
+}
+
 static void btintel_pcie_release_hdev(struct btintel_pcie_data *data)
 {
-	/* TODO: Unregister and release hdev */
+	struct hci_dev *hdev;
+
+	hdev = data->hdev;
+	hci_unregister_dev(hdev);
+	hci_free_dev(hdev);
+	data->hdev = NULL;
+}
+
+static int btintel_pcie_setup(struct hci_dev *hdev)
+{
+	const u8 param[1] = { 0xFF };
+	struct intel_version_tlv ver_tlv;
+	struct sk_buff *skb;
+	int err;
+
+	BT_DBG("%s", hdev->name);
+
+	skb = __hci_cmd_sync(hdev, 0xfc05, 1, param, HCI_CMD_TIMEOUT);
+	if (IS_ERR(skb)) {
+		bt_dev_err(hdev, "Reading Intel version command failed (%ld)",
+			   PTR_ERR(skb));
+		return PTR_ERR(skb);
+	}
+
+	/* Check the status */
+	if (skb->data[0]) {
+		bt_dev_err(hdev, "Intel Read Version command failed (%02x)",
+			   skb->data[0]);
+		err = -EIO;
+		goto exit_error;
+	}
+
+	/* Apply the common HCI quirks for Intel device */
+	set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
+	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
+	set_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks);
+
+	/* Set up the quality report callback for Intel devices */
+	hdev->set_quality_report = btintel_set_quality_report;
+
+	memset(&ver_tlv, 0, sizeof(ver_tlv));
+	/* For TLV type device, parse the tlv data */
+	err = btintel_parse_version_tlv(hdev, &ver_tlv, skb);
+	if (err) {
+		bt_dev_err(hdev, "Failed to parse TLV version information");
+		goto exit_error;
+	}
+
+	switch (INTEL_HW_PLATFORM(ver_tlv.cnvi_bt)) {
+	case 0x37:
+		break;
+	default:
+		bt_dev_err(hdev, "Unsupported Intel hardware platform (0x%2x)",
+			   INTEL_HW_PLATFORM(ver_tlv.cnvi_bt));
+		err = -EINVAL;
+		goto exit_error;
+	}
+
+	/* Check for supported iBT hardware variants of this firmware
+	 * loading method.
+	 *
+	 * This check has been put in place to ensure correct forward
+	 * compatibility options when newer hardware variants come
+	 * along.
+	 */
+	switch (INTEL_HW_VARIANT(ver_tlv.cnvi_bt)) {
+	case 0x1e:	/* BzrI */
+		/* Display version information of TLV type */
+		btintel_version_info_tlv(hdev, &ver_tlv);
+
+		/* Apply the device specific HCI quirks for TLV based devices
+		 *
+		 * All TLV based devices support WBS
+		 */
+		set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
+
+		/* Apply LE States quirk from solar onwards */
+		set_bit(HCI_QUIRK_VALID_LE_STATES, &hdev->quirks);
+
+		/* Setup MSFT Extension support */
+		btintel_set_msft_opcode(hdev,
+					INTEL_HW_VARIANT(ver_tlv.cnvi_bt));
+
+		err = btintel_bootloader_setup_tlv(hdev, &ver_tlv);
+		if (err)
+			goto exit_error;
+		break;
+	default:
+		bt_dev_err(hdev, "Unsupported Intel hw variant (%u)",
+			   INTEL_HW_VARIANT(ver_tlv.cnvi_bt));
+		err = -EINVAL;
+		break;
+	}
+
+exit_error:
+	kfree_skb(skb);
+
+	return err;
 }
 
 static int btintel_pcie_setup_hdev(struct btintel_pcie_data *data)
 {
-	/* TODO: initialize hdev and assign the callbacks to hdev */
-	return -ENODEV;
+	int err;
+	struct hci_dev *hdev;
+
+	hdev = hci_alloc_dev();
+	if (!hdev)
+		return -ENOMEM;
+
+	hdev->bus = HCI_PCI;
+	hci_set_drvdata(hdev, data);
+
+	hdev->dev_type = HCI_PRIMARY;
+
+	data->hdev = hdev;
+	SET_HCIDEV_DEV(hdev, &data->pdev->dev);
+
+	hdev->manufacturer = 2;
+	hdev->open = btintel_pcie_hci_open;
+	hdev->close = btintel_pcie_hci_close;
+	hdev->send = btintel_pcie_hci_send_frame;
+	hdev->setup = btintel_pcie_setup;
+	hdev->shutdown = btintel_shutdown_combined;
+	hdev->hw_error = btintel_hw_error;
+	hdev->set_diag = btintel_set_diag;
+	hdev->set_bdaddr = btintel_set_bdaddr;
+
+	err = hci_register_dev(hdev);
+	if (err < 0) {
+		BT_ERR("Failed to register to hdev (%d)", err);
+		goto exit_error;
+	}
+
+	return 0;
+
+exit_error:
+	hci_free_dev(hdev);
+	return err;
 }
 
 static int btintel_pcie_probe(struct pci_dev *pdev,
diff --git a/drivers/bluetooth/btintel_pcie.h b/drivers/bluetooth/btintel_pcie.h
index f925dfb23cfc..0e596e094f80 100644
--- a/drivers/bluetooth/btintel_pcie.h
+++ b/drivers/bluetooth/btintel_pcie.h
@@ -87,6 +87,11 @@ enum {
 /* DMA allocation alignment */
 #define BTINTEL_PCIE_DMA_POOL_ALIGNMENT	256
 
+#define TX_WAIT_TIMEOUT_MS	500
+
+/* Doorbell vector for TFD */
+#define BTINTEL_PCIE_TX_DB_VEC	0
+
 /* Number of pending RX requests for downlink */
 #define BTINTEL_PCIE_RX_MAX_QUEUE	6
 
-- 
2.40.1


