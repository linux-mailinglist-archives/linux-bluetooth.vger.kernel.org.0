Return-Path: <linux-bluetooth+bounces-226-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CABB7F9C59
	for <lists+linux-bluetooth@lfdr.de>; Mon, 27 Nov 2023 10:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C4F71C20C93
	for <lists+linux-bluetooth@lfdr.de>; Mon, 27 Nov 2023 09:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993C9134AA;
	Mon, 27 Nov 2023 09:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="b9wqtFO9"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id B290D189;
	Mon, 27 Nov 2023 01:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=npYZV
	p1l2EsYQNhZNL9bBvpl1f+MnYqTy0c63AC36Dc=; b=b9wqtFO9hk8K6fEX3Kbz1
	0wgpX883Y8IsiuwdtFyUI6KRl35OQHUlDYvYJFPwB/wN1i1qISeXgsCtR1nn3MOI
	rAgRBqIqYwi7h+EI50Q2utlb6L4KXDtoyhuAhZqlHq0RTNmDK8tspQVrmXi+33H2
	pYdZ7qyVI2W2JjAg2UB5F8=
Received: from WH-D-007635B.QUECTEL.COM (unknown [223.76.229.213])
	by zwqz-smtp-mta-g3-4 (Coremail) with SMTP id _____wA3f0DsW2RlvYB3BA--.3758S2;
	Mon, 27 Nov 2023 17:05:49 +0800 (CST)
From: 15013537245@163.com
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"clancy.shang" <clancy.shang@quectel.com>
Subject: [PATCH] Bluetooth: hci_sync: fix BR/EDR wakeup bug
Date: Mon, 27 Nov 2023 17:05:45 +0800
Message-Id: <20231127090545.117162-1-15013537245@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3f0DsW2RlvYB3BA--.3758S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw1UZF48XrWDuF18AF1fZwb_yoWkCFXEvF
	n3ua9rXrW7WryIvasFyFs5Zr1UZ395ua1xuwnFgFy0gF98Gr4DWrykXF15AF4xWan7AFW3
	Crn8GFyFqw17ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnH8BUUUUUU==
X-CM-SenderInfo: rprviiitvtljiuv6il2tof0z/xtbBnBg111ghlpFu8gAAsE

From: "clancy.shang" <clancy.shang@quectel.com>

Steam deck in suspending state, but bt controller send hci
mode change event to host. cause Steam Deck can't into sleep.

Signed-off-by: clancy.shang <clancy.shang@quectel.com>
---
 net/bluetooth/hci_sync.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index a15ab0b874a9..a26a58cb2c38 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -3800,12 +3800,14 @@ static int hci_set_event_mask_sync(struct hci_dev *hdev)
 	if (lmp_bredr_capable(hdev)) {
 		events[4] |= 0x01; /* Flow Specification Complete */
 
-		/* Don't set Disconnect Complete when suspended as that
-		 * would wakeup the host when disconnecting due to
-		 * suspend.
+		/* Don't set Disconnect Complete and mode change when
+		 * suspended as that would wakeup the host when disconnecting
+		 * due to suspend.
 		 */
-		if (hdev->suspended)
+		if (hdev->suspended) {
 			events[0] &= 0xef;
+			events[2] &= 0xf7;
+		}
 	} else {
 		/* Use a different default for LE-only devices */
 		memset(events, 0, sizeof(events));
-- 
2.25.1


