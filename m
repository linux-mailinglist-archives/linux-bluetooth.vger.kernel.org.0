Return-Path: <linux-bluetooth+bounces-2644-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06862880AFF
	for <lists+linux-bluetooth@lfdr.de>; Wed, 20 Mar 2024 07:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B89EF1F229D2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 20 Mar 2024 06:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CA717999;
	Wed, 20 Mar 2024 06:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YX8crojZ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C650A17548
	for <linux-bluetooth@vger.kernel.org>; Wed, 20 Mar 2024 06:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710914936; cv=none; b=AuEUycIvH4X3mkqBQu0Oia3fzv80raAciWPPr6ZbIPfzcadSWwZaHIWpPql/dKYCPCVA85hc4ZZSBmvO2behl6H9Ce0CgyRr5BzblRYysaS016Wb3t0TaFoKkNmmSugDrs7dEDb+PYH3yneLYAxL2Ah0rFoFVDJN/Cckm9/2WoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710914936; c=relaxed/simple;
	bh=ag2iaUz5SyFKDGb96CpHE231glYQ7B2ej0kk8BkBQEs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HSo2i0R0vFGfFCuXDpdOthVqSimOT0FC9yoTmJO/dJVpVKwyi+sZE3yY25gMwWZdWwQ5y8FKTDd1fQeaj9EibMME/7AAV6xKLGCs4qY4Y8pxn7W0Jx6ygjS5LAVfWBz7o8aJiC3Y1vr0vcKWDPXVeUGf9+jBsuDuFOzuaG3YWxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YX8crojZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42K3gkcG028327;
	Wed, 20 Mar 2024 06:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=WOVlGJaO/KR4hNWc+vz+
	6aTnHRl6NEQxA3Dyv9V64zs=; b=YX8crojZFAOXLgxeZJGPoPJ4mul8Gx0YUSIY
	vHtHHUCEX3zihM/or0Ut96pNu7ovnMFxVMIfA1asv5jSY9+7DWzb7wAiyrjtmN/9
	Fwdnj/kJixxr5nkvWmz8aJGYgzKFXqEzb803OWZm/UuUHjO39GNY40z0v3vqD+aP
	SgMnaRrnmg8HexUE0/OrBn2Cs6+LOyXqJ7UZGNMCvfNqhd4ZXP1jOniF/2fCPSFL
	ALaTIiR8HMOlD+OkkrGuOPJxlZTpV5pQTFN2VfpG67walv/18M59c0sN59ODEge9
	jS24DKoAzI+jQuG85VtWuXSPTXLH9are60ZXWkDaONv/juos5w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wyqh609dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 06:08:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42K68oKm024833
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 06:08:50 GMT
Received: from zijuhu-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 19 Mar 2024 23:08:49 -0700
From: Zijun Hu <quic_zijuhu@quicinc.com>
To: <luiz.dentz@gmail.com>, <marcel@holtmann.org>
CC: <linux-bluetooth@vger.kernel.org>, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: [PATCH v1 1/2] Bluetooth: hci_ldisc: Add a ioctl HCIUARTSETPROTODATA
Date: Wed, 20 Mar 2024 14:08:26 +0800
Message-ID: <1710914907-30012-2-git-send-email-quic_zijuhu@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1710914907-30012-1-git-send-email-quic_zijuhu@quicinc.com>
References: <1710914907-30012-1-git-send-email-quic_zijuhu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i9VHgsQH3k9ljx-sa8VM4sBafse9KIjS
X-Proofpoint-GUID: i9VHgsQH3k9ljx-sa8VM4sBafse9KIjS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_03,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403200046

HCIUARTSETPROTODATA is introduced to specify protocol specific settings
prior to HCIUARTSETPROTO, for protocal QCA, it is used by tool btattch
to specify soc_type.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/bluetooth/hci_ldisc.c | 10 ++++++++++
 drivers/bluetooth/hci_uart.h  |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/bluetooth/hci_ldisc.c b/drivers/bluetooth/hci_ldisc.c
index a26367e9fb19..4be09c61bae5 100644
--- a/drivers/bluetooth/hci_ldisc.c
+++ b/drivers/bluetooth/hci_ldisc.c
@@ -506,6 +506,7 @@ static int hci_uart_tty_open(struct tty_struct *tty)
 	/* disable alignment support by default */
 	hu->alignment = 1;
 	hu->padding = 0;
+	hu->proto_data = 0;
 
 	INIT_WORK(&hu->init_ready, hci_uart_init_work);
 	INIT_WORK(&hu->write_work, hci_uart_write_work);
@@ -795,6 +796,15 @@ static int hci_uart_tty_ioctl(struct tty_struct *tty, unsigned int cmd,
 		err = hu->hdev_flags;
 		break;
 
+	case HCIUARTSETPROTODATA:
+		if (test_bit(HCI_UART_PROTO_SET, &hu->flags)) {
+			err = -EBUSY;
+		} else {
+			hu->proto_data = arg;
+			BT_DBG("HCIUARTSETPROTODATA %lu okay.", arg);
+		}
+		break;
+
 	default:
 		err = n_tty_ioctl_helper(tty, cmd, arg);
 		break;
diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
index 68c8c7e95d64..fc35e9bd4398 100644
--- a/drivers/bluetooth/hci_uart.h
+++ b/drivers/bluetooth/hci_uart.h
@@ -18,6 +18,8 @@
 #define HCIUARTGETDEVICE	_IOR('U', 202, int)
 #define HCIUARTSETFLAGS		_IOW('U', 203, int)
 #define HCIUARTGETFLAGS		_IOR('U', 204, int)
+/* Used prior to HCIUARTSETPROTO */
+#define HCIUARTSETPROTODATA	_IOW('U', 205, unsigned long)
 
 /* UART protocols */
 #define HCI_UART_MAX_PROTO	12
@@ -71,6 +73,7 @@ struct hci_uart {
 	struct work_struct	init_ready;
 	struct work_struct	write_work;
 
+	unsigned long proto_data;
 	const struct hci_uart_proto *proto;
 	struct percpu_rw_semaphore proto_lock;	/* Stop work for proto close */
 	void			*priv;
-- 
2.7.4


