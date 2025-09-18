Return-Path: <linux-bluetooth+bounces-14622-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F8EB226DD
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Aug 2025 14:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC6ED1B66684
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Aug 2025 12:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1056D23C8D5;
	Tue, 12 Aug 2025 12:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ROYO7pCc"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8D4222591;
	Tue, 12 Aug 2025 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755001778; cv=none; b=gv3VljiUHuLdigKd328eu3Lk1HxLKDPqvnPukjoAQ63zP0iOd+2LctlGJxx6ojBLPdEVinXLq3SmwdcMr6br9IRqNhMr1DkSnWBJ3nW5YdHDvUPPaZ4nUPyRoWljVEu8zW3mjVoJv7CwtfJZvo/Fkd2iyAczylHjoJ1Nbd4N3Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755001778; c=relaxed/simple;
	bh=/oP2+a2aEzOIXE/jalTy5HvnQWWnZG07n635j/5ri3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F7MWkHoiXN+Fkj2oQk1vympdDvBLMkaR+qZlbF/F361SvRtqkXw74uolcq4HWwpU3FCpbs00rr886nM8Ye89h700/ATCI6JVOeHZ5DBHcWYsMhU5rvHA0aLMWqhjwG3yIPyXV26k3Tl1SgEMe73r3vRdJPDKPYT80uLRTmlPIKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ROYO7pCc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvhO2012388;
	Tue, 12 Aug 2025 12:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E2Db8sgz1JO
	npK0C/euhkpHXxph8RB5WRTnzKyVIrrA=; b=ROYO7pCcdTV3awPC5PYfhWPKySv
	9+Agzqn5pfNHkvaB7BA5ASwzIFDHCFWTSWRwQYMANJBNF1wSh7SMC3UA9V2MM95N
	khc4Fj0vRWiJshIFShUnOYUKVHmf61R1N3+gGHMIcH7ZujGbfMFzfQd/kh/volrb
	kPTikGjaBHsLOfy1f50L2yisnmeoadxNvHOJ5NxndyARtDHK6+DiPrs8Wztuf9RL
	aX42gAnOnySs73aA+KFAZNsh7fc6h4RyEdM7WcIbpteICUu04y8KEqz+BPFe8E2J
	Y9o22ZgzCurm7Zpy8r/qEJ3TsOT0cW0dtLy5G38iOqjcggYzOAbr3Pvb3Fg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv03uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:35 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CCTWhj026176;
	Tue, 12 Aug 2025 12:29:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 48dydm4yca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:32 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57CCTWEf026172;
	Tue, 12 Aug 2025 12:29:32 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 57CCTWiW026171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 12:29:32 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467449)
	id B982022B1E; Tue, 12 Aug 2025 20:29:31 +0800 (CST)
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: quic_bt@quicinc.com, Shuai Zhang <quic_shuaz@quicinc.com>
Subject: [PATCH 3/4] driver: bluetooth: hci_qca: Multiple triggers of SSR only generate one coredump file
Date: Tue, 12 Aug 2025 20:29:26 +0800
Message-Id: <20250812122927.3183257-4-quic_shuaz@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812122927.3183257-1-quic_shuaz@quicinc.com>
References: <20250812122927.3183257-1-quic_shuaz@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689b33af cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Z2vcJYTkWAVNmr-hFscA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NW5nfEq4XSQOqmD0V_xgRyRNgjzwi6Wh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXwvGC1Ru8KxUC
 qvyk1V8DEBQDFhtzCYxV2rZtFl8MzrUtjDGkobdJfBwUCgfQ5/gRk4N/z1LoZs//8CxQ2Tk9PR6
 oM+bPV1olaJgvK4hHURNoImdzD0zsfVpsTJ9eIt4mhl2m0WNtb/R2k+MLFFMQfJYTIgumsD9Zk+
 vg4pwWC9sDfG1gSanaHo16QdSwemTTNeB/NPw4GrJi1IKzH+gmgRB7gh9bLiaDEtBNn7t9zVzlN
 2+uEgRGy3eQlZS6p/vOMCQ5M7OAX/Y0U/f5js2XwH2QeTukhDUdF6zr0ohuckNUILfy5IEVZiD/
 UZUa61395wUl/s17nKzqu5HQTd86e2zV/NSu5BK5ufjqcr3L+UQuyfYkMRaCX4CTNe/WRdzRJwX
 NhxN0MOH
X-Proofpoint-GUID: NW5nfEq4XSQOqmD0V_xgRyRNgjzwi6Wh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

Multiple triggers of SSR only first generate coredump file,
duo to memcoredump_flag no clear.

add clear coredump flag when ssr completed.

Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
---
 drivers/bluetooth/hci_qca.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 50ec9b155..33c2dd7b8 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1662,11 +1662,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
 	 *
 	 * Host will not download the firmware after SSR, controller to remain
 	 * in the IBS_WAKE state, and the host needs to synchronize with it
+	 *
+	 * clear memcoredump_flag to ensure next submission of coredump date.
 	 */
 	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
 		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
 		clear_bit(QCA_IBS_DISABLED, &qca->flags);
 		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
+		qca->memdump_state = QCA_MEMDUMP_IDLE;
 		msleep(50);
 	}
 
-- 
2.34.1


