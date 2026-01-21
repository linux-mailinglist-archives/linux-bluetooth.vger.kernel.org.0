Return-Path: <linux-bluetooth+bounces-18286-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNqOKnxkcGkVXwAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18286-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 06:30:36 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9335189B
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 06:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E2F4542E34D
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 05:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674393ECBF2;
	Wed, 21 Jan 2026 05:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="YpEf0HwM"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4913EDAAD;
	Wed, 21 Jan 2026 05:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.178.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768973390; cv=none; b=Wqy4XnNcCOVGX2PbDdXtuaAkmZjtPgpz3M5XnwYc6KNaxas/v6h61dom4tYMZKveJNhdJ0bFUTn6Fktyu4R+wXQomXW/Mc9NdhessQz4drju8KnFtWIrKUyRWOkBFSFYoCF5kNib3JW97+IATtzU9q19ExvBF/+tC57Q/HDK1LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768973390; c=relaxed/simple;
	bh=/7SHdAnM3S4zvVkjhi7p7fPbpjLJGvWkxZ+RFiMqY5E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PmsNjTnJc2u4yikAuwhHgt4Lls3pENFUHb9EsaUf+sE1VEYktjB1a67yddVMc4TleemCjhyYLlosG7i43gJVNc87j7x6B2AeaQ2DYQSh6UAeA2ebPr4V1vfreqKx1g7D7R7P38qkpzFV+xitXYsgd0lHb0jFiYHLLn1aFVQUhl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=unknown smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=YpEf0HwM; arc=none smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L1i8EO858772;
	Wed, 21 Jan 2026 05:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=MHjDdlHLi
	JJZi0rsECR5ZRPoQCpIjGyqp5BiZjg2XS8=; b=YpEf0HwMdLQh7UBwTTgznWlGh
	OyJ162BcVYgsw5xVL8WwkCf4UFWrwowD/Ja+eBqzRo8bF0vCnX6kctFpOu9v6FX7
	3ceUfH5h/wNcFu31H1YGD6iOBGybUCJFYa3bb9d7jSx60aL0Jn92bIUaII/WKj21
	f8fschaI1KmMvt25l8Spe1HtJ62eITDkiwXSVaCrqOUjDlxEmBMrdoowpLZsIEm8
	NrwNG0RaSb3+MJMoMOrPqUKEbbGb/DX0v6t2QsbpuruHkLnayREF/88f4uKrNNgM
	amGsrSjrL1iXdDlKaJLZjNchJ+110oOd3Vin+cWH41ER7fIOt5dtuoRbMypNQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btncwg55e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 Jan 2026 05:29:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 20 Jan 2026 21:29:29 -0800
Received: from pek-lpggp9.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 20 Jan 2026 21:29:27 -0800
From: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <luiz.dentz@gmail.com>
CC: <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jianpeng Chang <jianpeng.chang.cn@windriver.com>
Subject: [PATCH] Bluetooth: MGMT: Fix memory leak in set_ssp_complete
Date: Wed, 21 Jan 2026 13:29:26 +0800
Message-ID: <20260121052926.3539017-1-jianpeng.chang.cn@windriver.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mfoWZqa4AdVbI_Q-3XWwzoLpPp_Edcmj
X-Authority-Analysis: v=2.4 cv=ecwwvrEH c=1 sm=1 tr=0 ts=6970643a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=X5WNk52k9AoXz13tMA8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA0MyBTYWx0ZWRfX+Jc7SYp0wdH8
 tqa9CNf4lpqVJ/YZ4axou2YmomaLBw5JvBH3gvZNe0GdpNrswFEQzhMXmYf753NYE3Z9XBf/24Q
 N2wnldsGYd2k4Y1mbWk4YjyY4kuG9oXNbEgbiIdkijiJe3d7rttm2nzds4yoRpcQzGotjOFVHHD
 WW1nIhC4xgOVvpDjdItv+yWjPkxXjehRavv0w8CK8LUVecwlMsBcPrFMPWJ8XJYGbiYF+Vx0vyA
 QuZhGedRoJgJc63wthdhjslzk6hM4q6KGTPfWJ/I/zU2fK8CdQAXisUUp7W81aEkHqvYRZ82u/i
 1scYu7nIXyA6oBY8Q2QqZYOSNUAL+3B0rac9ShgKcCw/UQmjaEGsXzpk+WegUSJWebuast37Ceb
 5yi+lY3T11widcVWgy8x91+h+NN3/jgFY3rYzcEi8HDv+q99rLQEkp3D12wx8+Eq9RG+rjLW5zL
 CQHxy7Rd4K3Q9jovxBQ==
X-Proofpoint-ORIG-GUID: mfoWZqa4AdVbI_Q-3XWwzoLpPp_Edcmj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1011 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210043
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-18286-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[windriver.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jianpeng.chang.cn@windriver.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	R_SPF_SOFTFAIL(0.00)[~all];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,match.sk:url,windriver.com:email,windriver.com:dkim,windriver.com:mid];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C9335189B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix memory leak in set_ssp_complete() where mgmt_pending_cmd structures
are not freed after being removed from the pending list.

Commit 302a1f674c00 ("Bluetooth: MGMT: Fix possible UAFs") replaced
mgmt_pending_foreach() calls with individual command handling but missed
adding mgmt_pending_free() calls in both error and success paths of
set_ssp_complete(). Other completion functions like set_le_complete()
were fixed correctly in the same commit.

This causes a memory leak of the mgmt_pending_cmd structure and its
associated parameter data for each SSP command that completes.

Add the missing mgmt_pending_free(cmd) calls in both code paths to fix
the memory leak. Also fix the same issue in set_advertising_complete().

Fixes: 302a1f674c00 ("Bluetooth: MGMT: Fix possible UAFs")
Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
---
 net/bluetooth/mgmt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 5be9b8c91949..0e46f9e08b10 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -1966,6 +1966,7 @@ static void set_ssp_complete(struct hci_dev *hdev, void *data, int err)
 		}
 
 		mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_err);
+		mgmt_pending_free(cmd);
 		return;
 	}
 
@@ -1984,6 +1985,7 @@ static void set_ssp_complete(struct hci_dev *hdev, void *data, int err)
 		sock_put(match.sk);
 
 	hci_update_eir_sync(hdev);
+	mgmt_pending_free(cmd);
 }
 
 static int set_ssp_sync(struct hci_dev *hdev, void *data)
@@ -6438,6 +6440,7 @@ static void set_advertising_complete(struct hci_dev *hdev, void *data, int err)
 		hci_dev_clear_flag(hdev, HCI_ADVERTISING);
 
 	settings_rsp(cmd, &match);
+	mgmt_pending_free(cmd);
 
 	new_settings(hdev, match.sk);
 
-- 
2.52.0


