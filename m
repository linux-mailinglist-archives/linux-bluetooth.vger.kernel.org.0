Return-Path: <linux-bluetooth+bounces-287-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A503D7FD0D8
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 Nov 2023 09:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6232B282928
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 Nov 2023 08:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54625125A6;
	Wed, 29 Nov 2023 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ykxj63uN"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1B3268E
	for <linux-bluetooth@vger.kernel.org>; Wed, 29 Nov 2023 00:29:44 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT4rSuR017011;
	Wed, 29 Nov 2023 08:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=96kKdDSK2qP4aCK6j4CMWfy/CYikfN77AJe38L0cZLI=;
 b=Ykxj63uNQbTKa8FbsLwYGhfXC6d359Rqgf+oTiCrkX/wk4orjA2sjAgTHQZFC11CO8Bj
 FKGqOTEMBpbr3hAi7Jp9dNQ7iBVUrvfifjCICmhkRfi6+XI+CCuISn7ZGFCf7xVXQb/2
 wtyzNVNDTn25Aym0WQK6ZeYZ6KjZC6+gcUCGi53VFDalBIDdih+/UG6oO/AZSV8Q5QIx
 PnwfGsg4YAbpFWywq2KZW0b4NPue0MNYzmKESpOjXw1dIcH54QRHu4MjtZj1UiUK3GhN
 mmyzxPOS6NL0g82Wteuor/emivRkdCNA6nUyq1u6wBKuiPKmcoaGz9mOFGAqbHqi9rhP Nw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unnpesng7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 08:29:42 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AT8TfoT029666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 08:29:41 GMT
Received: from zijuhu-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 29 Nov 2023 00:29:39 -0800
From: Zijun Hu <quic_zijuhu@quicinc.com>
To: <luiz.dentz@gmail.com>, <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <linux-bluetooth@vger.kernel.org>, <quic_zijuhu@quicinc.com>,
        Zijun Hu
	<zijuhu@qti.qualcomm.com>
Subject: [PATCH v3 2/2] Bluetooth: qca: Support SCO offload for QCA2066
Date: Wed, 29 Nov 2023 16:29:30 +0800
Message-ID: <1701246570-3564-3-git-send-email-quic_zijuhu@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1701246570-3564-1-git-send-email-quic_zijuhu@quicinc.com>
References: <1701245906-10660-1-git-send-email-quic_zijuhu@quicinc.com>
 <1701246570-3564-1-git-send-email-quic_zijuhu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uVj9aWfeq8pyZNA_GZobOqoKtxKdbqFR
X-Proofpoint-ORIG-GUID: uVj9aWfeq8pyZNA_GZobOqoKtxKdbqFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_06,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311290062

In order to support SCO offload for QCA2066, ALL BTHOST needs to do
is specifying both Input_Data_Path and Output_Data_Path as 0x01 for
HCI_Enhanced_Setup_Synchronous_Connection, and it is implemented by
this change.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 35f74f209d1f..970b1bcf7dde 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1815,6 +1815,26 @@ static void hci_coredump_qca(struct hci_dev *hdev)
 	kfree_skb(skb);
 }
 
+static int qca_get_data_path_id(struct hci_dev *hdev, __u8 *data_path_id)
+{
+	/* QCA uses 1 as non-HCI data path id for HFP */
+	*data_path_id = 1;
+	return 0;
+}
+
+static int qca_configure_sco_offload(struct hci_dev *hdev)
+{
+	bt_dev_info(hdev, "HFP non-HCI data transport is supported");
+	hdev->get_data_path_id = qca_get_data_path_id;
+	/* Do not need to send HCI_Configure_Data_Path to configure QCA non-HCI
+	 * data transport since HCI_Enhanced_Setup_Synchronous_Connection is
+	 * enough for QCA controller to configure HFP data transport, so set
+	 * below field as NULL.
+	 */
+	hdev->get_codec_config_data = NULL;
+	return 0;
+}
+
 static int qca_setup(struct hci_uart *hu)
 {
 	struct hci_dev *hdev = hu->hdev;
@@ -1969,6 +1989,10 @@ static int qca_setup(struct hci_uart *hu)
 		hu->hdev->set_bdaddr = qca_set_bdaddr_rome;
 	else
 		hu->hdev->set_bdaddr = qca_set_bdaddr;
+
+	if (soc_type == QCA_QCA2066)
+		qca_configure_sco_offload(hdev);
+
 	qca->fw_version = le16_to_cpu(ver.patch_ver);
 	qca->controller_id = le16_to_cpu(ver.rom_ver);
 	hci_devcd_register(hdev, hci_coredump_qca, qca_dmp_hdr, NULL);
-- 
The Qualcomm Innovation Center


