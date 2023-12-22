Return-Path: <linux-bluetooth+bounces-700-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF9781C349
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Dec 2023 04:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E23311F258D0
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Dec 2023 03:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB589211C;
	Fri, 22 Dec 2023 03:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fSjfIsgy"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0ED1C01
	for <linux-bluetooth@vger.kernel.org>; Fri, 22 Dec 2023 03:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vLPf6
	T49GKFwVGt2SiqhaydYhz9ZN+LYaF5OJXcT55s=; b=fSjfIsgyXcmqG0x7OR7W9
	tKYHAcgTeVQrG7NXtragim4xg4zwUvZB6L7OTNdfBFzpuZDCa22RcOZFS/43fDZ6
	C9T9TfmkV13nsNT/nwUhLmXZuEKSk6D9a3zkw2v/1xF6sZkgOuBJj2wwCwB4yU9u
	0A9tSJPUNJOxfN3mWrEhGc=
Received: from WH-D-007635B.QUECTEL.COM (unknown [223.76.229.213])
	by zwqz-smtp-mta-g2-3 (Coremail) with SMTP id _____wBXH7xC_oRlkVJwGQ--.33717S2;
	Fri, 22 Dec 2023 11:10:59 +0800 (CST)
From: 15013537245@163.com
To: linux-bluetooth@vger.kernel.org
Cc: zhongjun.yu@quectel.com,
	clancy shang <clancy.shang@quectel.com>
Subject: [PATCH] [BlueZ] adapter: Fix airpod device pair fail
Date: Fri, 22 Dec 2023 11:10:56 +0800
Message-Id: <20231222031056.1253528-1-15013537245@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXH7xC_oRlkVJwGQ--.33717S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrykKFWfKrWftF1kurWxZwb_yoW8WryDpr
	Z8Was5Gr4jg3Wag3ZxWFy7Wr13Cw4ku34jqFWSyan5CFy7XrWkX3y3tw18ta1UJFyDXa47
	JF1DXa4DGw4UGaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jkzVbUUUUU=
X-CM-SenderInfo: rprviiitvtljiuv6il2tof0z/xtbBEAdO12VOBGd65QAAsZ

From: clancy shang <clancy.shang@quectel.com>

Airpod is performing inquiry scans in BR/EDR and advertising in a unconnectabl
mode whit the same public address at the same time. with this featrue, when
found airpod device, set the bredr support, fix it pair fail bug.

Signed-off-by: clancy shang <clancy.shang@quectel.com>
---
 src/adapter.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/src/adapter.c b/src/adapter.c
index 022390f0d..79ca75315 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -7066,6 +7066,24 @@ static void adapter_msd_notify(struct btd_adapter *adapter,
 	}
 }
 
+#define APPLE_INC_VENDOR_ID 0x004c
+static bool eir_msd_is_apple_inc(GSList *msd_list)
+{
+	GSList *msd_l, *msd_next;
+
+	for (msd_l = msd_list; msd_l != NULL; msd_l = msd_next) 
+	{
+		const struct eir_msd *msd = msd_l->data;
+
+		msd_next = g_slist_next(msd_l);
+
+		if(msd->company == APPLE_INC_VENDOR_ID)
+			return true;
+	}
+
+	return false;
+}
+
 static bool is_filter_match(GSList *discovery_filter, struct eir_data *eir_data,
 								int8_t rssi)
 {
@@ -7281,6 +7299,12 @@ void btd_adapter_device_found(struct btd_adapter *adapter,
 		device_update_last_seen(dev, BDADDR_BREDR, !not_connectable);
 	}
 
+	if(eir_msd_is_apple_inc(eir_data.msd_list) && 
+		(not_connectable == true) && (bdaddr_type == BDADDR_LE_PUBLIC)){
+		device_set_bredr_support(dev);
+		device_update_last_seen(dev, BDADDR_BREDR, true);
+	}
+
 	if (eir_data.name != NULL && eir_data.name_complete)
 		device_store_cached_name(dev, eir_data.name);
 
-- 
2.25.1


