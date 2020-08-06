Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6155E23E099
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Aug 2020 20:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbgHFSgM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 6 Aug 2020 14:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728445AbgHFSfd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 6 Aug 2020 14:35:33 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EC5C06179E
        for <linux-bluetooth@vger.kernel.org>; Thu,  6 Aug 2020 11:17:16 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 17so5192132pfw.9
        for <linux-bluetooth@vger.kernel.org>; Thu, 06 Aug 2020 11:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFzx4UzRGdTUTCbe4nHo78+TYdF+MApzZHrO9nCgmQs=;
        b=qrj/DQ6Rh4AxUN5uxlW5tuZM0KijDFBeZ1Q8MfcQlJdCa8Xw54PWHXRZ3DX/c6tvDR
         cKcmsW5d5NR9ksF2RCsYn6CbTB1m3mxbNX5Pxqil4SkH0d6xACLetc8AwxVx+fhVib7I
         PE/Pf068KIim6hidydigZ8NApkcV6PoXTWn/0FbFn2YToxU8Ro1sHnw4EpzhwPU2YjYo
         v4xWOs7o28IxuF6buCTTuI0ujUWE3Bn+y9QrzO+znZPK5u0MJdvghaYHub94VS/opBPW
         J1SR6JeIBiToIEgi71i1D6CDUe2P/MkWGj7SfigQlRYZK97xVHm/s+ICWynns4LMPCdm
         XjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFzx4UzRGdTUTCbe4nHo78+TYdF+MApzZHrO9nCgmQs=;
        b=cIDZve8eicHIeSmeVZtjKytxuHzc2+jhm2Zxo3D3Lsg8navlIPi5JEHus+1qzuUSAA
         BZPCrm6fxyw+RtQ6vq3I9gLVu2gkm/NPVQaNNF6plnRodcpDaavErdI28LM4n4f0O1yF
         Zy8Yg10tl898SN0OLFD5GRmvflWOkYOiZH2ilv4gCytQjpdsc9ztTjmYMcVuqNEO+bx2
         uJn71EDTVYXC/U8A38UyZ6OAX1y7YUojo9OGMEVJaunX0d5RT7uRAlp+P8OUTYbi65nh
         q1r1VZJHjlZDR9KrjsKaxQ3bBY2BOJLCf59pAYtGZ51irBlKFFzDb49mfcbM8S0Xtui7
         MqrA==
X-Gm-Message-State: AOAM532dRguQAzKJd5SEP2YeZhqEqo+3npJWFKbDA21jfBBXPa/b3U+R
        gMtbwZixAj6ZxEH7uLtSfw2gVwWc
X-Google-Smtp-Source: ABdhPJyaAgbLBEwLqkIwOy0PdsDJpXU79KMZU4vP+LaobVuRyYv7og6oM7Mnfiq5QlQP6b0Wq7yFoQ==
X-Received: by 2002:a62:17c1:: with SMTP id 184mr9430654pfx.136.1596737834525;
        Thu, 06 Aug 2020 11:17:14 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id o16sm10341078pfu.188.2020.08.06.11.17.13
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 11:17:14 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 1/4] Bluetooth: A2MP: Fix not initializing all members
Date:   Thu,  6 Aug 2020 11:17:11 -0700
Message-Id: <20200806181714.3216076-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This fixes various places where a stack variable is used uninitialized.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/a2mp.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/a2mp.c b/net/bluetooth/a2mp.c
index 26526be579c7..da7fd7c8c2dc 100644
--- a/net/bluetooth/a2mp.c
+++ b/net/bluetooth/a2mp.c
@@ -226,6 +226,9 @@ static int a2mp_discover_rsp(struct amp_mgr *mgr, struct sk_buff *skb,
 			struct a2mp_info_req req;
 
 			found = true;
+
+			memset(&req, 0, sizeof(req));
+
 			req.id = cl->id;
 			a2mp_send(mgr, A2MP_GETINFO_REQ, __next_ident(mgr),
 				  sizeof(req), &req);
@@ -305,6 +308,8 @@ static int a2mp_getinfo_req(struct amp_mgr *mgr, struct sk_buff *skb,
 	if (!hdev || hdev->dev_type != HCI_AMP) {
 		struct a2mp_info_rsp rsp;
 
+		memset(&rsp, 0, sizeof(rsp));
+
 		rsp.id = req->id;
 		rsp.status = A2MP_STATUS_INVALID_CTRL_ID;
 
@@ -348,6 +353,8 @@ static int a2mp_getinfo_rsp(struct amp_mgr *mgr, struct sk_buff *skb,
 	if (!ctrl)
 		return -ENOMEM;
 
+	memset(&req, 0, sizeof(req));
+
 	req.id = rsp->id;
 	a2mp_send(mgr, A2MP_GETAMPASSOC_REQ, __next_ident(mgr), sizeof(req),
 		  &req);
@@ -376,6 +383,8 @@ static int a2mp_getampassoc_req(struct amp_mgr *mgr, struct sk_buff *skb,
 		struct a2mp_amp_assoc_rsp rsp;
 		rsp.id = req->id;
 
+		memset(&rsp, 0, sizeof(rsp));
+
 		if (tmp) {
 			rsp.status = A2MP_STATUS_COLLISION_OCCURED;
 			amp_mgr_put(tmp);
@@ -464,7 +473,6 @@ static int a2mp_createphyslink_req(struct amp_mgr *mgr, struct sk_buff *skb,
 				   struct a2mp_cmd *hdr)
 {
 	struct a2mp_physlink_req *req = (void *) skb->data;
-
 	struct a2mp_physlink_rsp rsp;
 	struct hci_dev *hdev;
 	struct hci_conn *hcon;
@@ -475,6 +483,8 @@ static int a2mp_createphyslink_req(struct amp_mgr *mgr, struct sk_buff *skb,
 
 	BT_DBG("local_id %d, remote_id %d", req->local_id, req->remote_id);
 
+	memset(&rsp, 0, sizeof(rsp));
+
 	rsp.local_id = req->remote_id;
 	rsp.remote_id = req->local_id;
 
@@ -553,6 +563,8 @@ static int a2mp_discphyslink_req(struct amp_mgr *mgr, struct sk_buff *skb,
 
 	BT_DBG("local_id %d remote_id %d", req->local_id, req->remote_id);
 
+	memset(&rsp, 0, sizeof(rsp));
+
 	rsp.local_id = req->remote_id;
 	rsp.remote_id = req->local_id;
 	rsp.status = A2MP_STATUS_SUCCESS;
@@ -675,6 +687,8 @@ static int a2mp_chan_recv_cb(struct l2cap_chan *chan, struct sk_buff *skb)
 	if (err) {
 		struct a2mp_cmd_rej rej;
 
+		memset(&rej, 0, sizeof(rej));
+
 		rej.reason = cpu_to_le16(0);
 		hdr = (void *) skb->data;
 
@@ -898,6 +912,8 @@ void a2mp_send_getinfo_rsp(struct hci_dev *hdev)
 
 	BT_DBG("%s mgr %p", hdev->name, mgr);
 
+	memset(&rsp, 0, sizeof(rsp));
+
 	rsp.id = hdev->id;
 	rsp.status = A2MP_STATUS_INVALID_CTRL_ID;
 
@@ -995,6 +1011,8 @@ void a2mp_send_create_phy_link_rsp(struct hci_dev *hdev, u8 status)
 	if (!mgr)
 		return;
 
+	memset(&rsp, 0, sizeof(rsp));
+
 	hs_hcon = hci_conn_hash_lookup_state(hdev, AMP_LINK, BT_CONNECT);
 	if (!hs_hcon) {
 		rsp.status = A2MP_STATUS_UNABLE_START_LINK_CREATION;
@@ -1027,6 +1045,8 @@ void a2mp_discover_amp(struct l2cap_chan *chan)
 
 	mgr->bredr_chan = chan;
 
+	memset(&req, 0, sizeof(req));
+
 	req.mtu = cpu_to_le16(L2CAP_A2MP_DEFAULT_MTU);
 	req.ext_feat = 0;
 	a2mp_send(mgr, A2MP_DISCOVER_REQ, 1, sizeof(req), &req);
-- 
2.26.2

