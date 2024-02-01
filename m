Return-Path: <linux-bluetooth+bounces-1550-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E26846275
	for <lists+linux-bluetooth@lfdr.de>; Thu,  1 Feb 2024 22:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15D7A1F26C9B
	for <lists+linux-bluetooth@lfdr.de>; Thu,  1 Feb 2024 21:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AF7405DE;
	Thu,  1 Feb 2024 21:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yv+WarYd"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5597C3FB3E
	for <linux-bluetooth@vger.kernel.org>; Thu,  1 Feb 2024 21:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706821636; cv=none; b=UtyN0UEqze5rpJB3iAY5O0Nj1LRzvq1e4gn1ty1Kjsqw7DtSotZdz9PVSCfdSHYDNzkfoBagQIS48N3eg3nF4yWhnM6BRKaXr9q6sXBI+yanqvEwNKZiWTXWXe6jb8E9trhLg1kdvWhK8Wk9EM2NzSDVfUmDSQ39afuZXRsnkRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706821636; c=relaxed/simple;
	bh=4sl5YYW9Y5qxuqIM2IEG8snJr7FbAJHmGSnRpmb8Bgo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=cHXJbG6/3Xc3ggZn/ZlmWYPMAaJ/SO+Dfvi17Y09FTg9/GnS3DM2okcymAZXhB/ibqhVb7p/SW7/HhtSGbvCdnkUdmR7jtacXwdP2gWn81rgS2xnBruvpn8YgocMX/TkDsceuA3LwY/ZSAGeHAlyb3Qi9TQ3IbITcFh8VFT0uvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yv+WarYd; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-46cfe7ef622so58617137.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 01 Feb 2024 13:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706821630; x=1707426430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n7nQpnXG+nDAU/atF2eciBwIkkFQSNAqUNPkwMZUUdU=;
        b=Yv+WarYdAl7YDagYYBfKjyefj1y3teucHJVGn4b6MDc0a4zC/0m52+jbhHPtR4u2vZ
         FKK0/KEL6Y+mg/mAvnfyTL8ThHvRNY+SbYdzxlAlPggKtFh8sm7P45URa9ih5+p6hE2x
         wihU/xeg1gRxY152cteHxqLr257aFLRbp7J0q2laZQG39qPORJ496c+6CuC91f891cb5
         TbMwy+M8BtWW9cq7I5ITbJ71QV1AzINIeJUjPFAykqSbzKUs4zY6xupyI9aFct5/JKqf
         SVcXmA4xpzZdtvJQVKC1yZYHtVuQ4wR0cTzw9MLR2fAI/g7b2qFuJcsnoTSemtOkJupX
         db2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706821630; x=1707426430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n7nQpnXG+nDAU/atF2eciBwIkkFQSNAqUNPkwMZUUdU=;
        b=YWpgWj2VRqoVEIbiYTfYzdRuiXiloz3rECZ0SYaqucxbvH2ZjUoTET8vz4I0zaFhje
         0/4yZRSLcaDgaFz9X3PLfehZ5LvpMAoD676i4FPxIq4tcnsHNkAvRGvbH9jGPX0Yol63
         TyxUHXmmwO84c+ethOv+5XgL4PoV/AeC5PqQKS+hI23xfVoFAMTNV/EN4ZRDV52dRgBf
         7LwVUhY1G2y+UmEiollCqtMogHQqxXRoQqUpNs/WguNRABevgauAPSnyMSdCpyKizbM8
         sN0+abwvVdev5ogee/q7SICLM+pgtTLdpbyRcVkvAnv92JPxb+VNw9qV9Fwu/BlfOJe6
         9Xyg==
X-Gm-Message-State: AOJu0YwvorOsQ11N3LWwrBm71p8RnH9c9nVcEkJPs9DtyKHX/4+GKGHz
	3kD2Pam4CFVGPRrwfEhjR6nRjdW7ATGNtt8EIkbtCujch+tcJr8+4IKX+kyd
X-Google-Smtp-Source: AGHT+IEUaBd8uXgIdqSwQqP3moqBYW7aHc6O4+YT7Aygqi00xSLKHIM/fCiwobMh3E+1HgrYukmzXA==
X-Received: by 2002:a05:6102:dc9:b0:46c:f36e:7 with SMTP id e9-20020a0561020dc900b0046cf36e0007mr3496842vst.3.1706821629599;
        Thu, 01 Feb 2024 13:07:09 -0800 (PST)
Received: from lvondent-mobl4.. (071-047-239-151.res.spectrum.com. [71.47.239.151])
        by smtp.gmail.com with ESMTPSA id i21-20020a67fa15000000b0046ce9b4402esm36761vsq.8.2024.02.01.13.07.08
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 13:07:08 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH v2] Bluetooth: Remove BT_HS
Date: Thu,  1 Feb 2024 16:07:07 -0500
Message-ID: <20240201210707.1204633-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

High Speed, Alternate MAC and PHY (AMP) extension, has been removed from
Bluetooth Core specification on 5.3:

https://www.bluetooth.com/blog/new-core-specification-v5-3-feature-enhancements/

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci.h   |    1 -
 include/net/bluetooth/l2cap.h |   42 --
 net/bluetooth/Kconfig         |    8 -
 net/bluetooth/Makefile        |    1 -
 net/bluetooth/a2mp.c          | 1054 ---------------------------------
 net/bluetooth/a2mp.h          |  154 -----
 net/bluetooth/amp.c           |  590 ------------------
 net/bluetooth/amp.h           |   60 --
 net/bluetooth/hci_conn.c      |    4 -
 net/bluetooth/hci_event.c     |    2 -
 net/bluetooth/l2cap_core.c    | 1016 +------------------------------
 net/bluetooth/l2cap_sock.c    |   18 +-
 net/bluetooth/mgmt.c          |   73 +--
 13 files changed, 20 insertions(+), 3003 deletions(-)
 delete mode 100644 net/bluetooth/a2mp.c
 delete mode 100644 net/bluetooth/a2mp.h
 delete mode 100644 net/bluetooth/amp.c
 delete mode 100644 net/bluetooth/amp.h

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 1cd212bb3789..aa6c69053d7c 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -394,7 +394,6 @@ enum {
 	HCI_LIMITED_PRIVACY,
 	HCI_RPA_EXPIRED,
 	HCI_RPA_RESOLVING,
-	HCI_HS_ENABLED,
 	HCI_LE_ENABLED,
 	HCI_ADVERTISING,
 	HCI_ADVERTISING_CONNECTABLE,
diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index cf393e72d6ed..92d7197f9a56 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -59,8 +59,6 @@
 #define L2CAP_WAIT_ACK_POLL_PERIOD	msecs_to_jiffies(200)
 #define L2CAP_WAIT_ACK_TIMEOUT		msecs_to_jiffies(10000)
 
-#define L2CAP_A2MP_DEFAULT_MTU		670
-
 /* L2CAP socket address */
 struct sockaddr_l2 {
 	sa_family_t	l2_family;
@@ -109,12 +107,6 @@ struct l2cap_conninfo {
 #define L2CAP_ECHO_RSP		0x09
 #define L2CAP_INFO_REQ		0x0a
 #define L2CAP_INFO_RSP		0x0b
-#define L2CAP_CREATE_CHAN_REQ	0x0c
-#define L2CAP_CREATE_CHAN_RSP	0x0d
-#define L2CAP_MOVE_CHAN_REQ	0x0e
-#define L2CAP_MOVE_CHAN_RSP	0x0f
-#define L2CAP_MOVE_CHAN_CFM	0x10
-#define L2CAP_MOVE_CHAN_CFM_RSP	0x11
 #define L2CAP_CONN_PARAM_UPDATE_REQ	0x12
 #define L2CAP_CONN_PARAM_UPDATE_RSP	0x13
 #define L2CAP_LE_CONN_REQ	0x14
@@ -144,7 +136,6 @@ struct l2cap_conninfo {
 /* L2CAP fixed channels */
 #define L2CAP_FC_SIG_BREDR	0x02
 #define L2CAP_FC_CONNLESS	0x04
-#define L2CAP_FC_A2MP		0x08
 #define L2CAP_FC_ATT		0x10
 #define L2CAP_FC_SIG_LE		0x20
 #define L2CAP_FC_SMP_LE		0x40
@@ -267,7 +258,6 @@ struct l2cap_conn_rsp {
 /* channel identifier */
 #define L2CAP_CID_SIGNALING	0x0001
 #define L2CAP_CID_CONN_LESS	0x0002
-#define L2CAP_CID_A2MP		0x0003
 #define L2CAP_CID_ATT		0x0004
 #define L2CAP_CID_LE_SIGNALING	0x0005
 #define L2CAP_CID_SMP		0x0006
@@ -282,7 +272,6 @@ struct l2cap_conn_rsp {
 #define L2CAP_CR_BAD_PSM	0x0002
 #define L2CAP_CR_SEC_BLOCK	0x0003
 #define L2CAP_CR_NO_MEM		0x0004
-#define L2CAP_CR_BAD_AMP	0x0005
 #define L2CAP_CR_INVALID_SCID	0x0006
 #define L2CAP_CR_SCID_IN_USE	0x0007
 
@@ -404,29 +393,6 @@ struct l2cap_info_rsp {
 	__u8        data[];
 } __packed;
 
-struct l2cap_create_chan_req {
-	__le16      psm;
-	__le16      scid;
-	__u8        amp_id;
-} __packed;
-
-struct l2cap_create_chan_rsp {
-	__le16      dcid;
-	__le16      scid;
-	__le16      result;
-	__le16      status;
-} __packed;
-
-struct l2cap_move_chan_req {
-	__le16      icid;
-	__u8        dest_amp_id;
-} __packed;
-
-struct l2cap_move_chan_rsp {
-	__le16      icid;
-	__le16      result;
-} __packed;
-
 #define L2CAP_MR_SUCCESS	0x0000
 #define L2CAP_MR_PEND		0x0001
 #define L2CAP_MR_BAD_ID		0x0002
@@ -539,8 +505,6 @@ struct l2cap_seq_list {
 
 struct l2cap_chan {
 	struct l2cap_conn	*conn;
-	struct hci_conn		*hs_hcon;
-	struct hci_chan		*hs_hchan;
 	struct kref	kref;
 	atomic_t	nesting;
 
@@ -591,12 +555,6 @@ struct l2cap_chan {
 	unsigned long	conn_state;
 	unsigned long	flags;
 
-	__u8		remote_amp_id;
-	__u8		local_amp_id;
-	__u8		move_id;
-	__u8		move_state;
-	__u8		move_role;
-
 	__u16		next_tx_seq;
 	__u16		expected_ack_seq;
 	__u16		expected_tx_seq;
diff --git a/net/bluetooth/Kconfig b/net/bluetooth/Kconfig
index da7cac0a1b71..6b2b65a66700 100644
--- a/net/bluetooth/Kconfig
+++ b/net/bluetooth/Kconfig
@@ -62,14 +62,6 @@ source "net/bluetooth/cmtp/Kconfig"
 
 source "net/bluetooth/hidp/Kconfig"
 
-config BT_HS
-	bool "Bluetooth High Speed (HS) features"
-	depends on BT_BREDR
-	help
-	  Bluetooth High Speed includes support for off-loading
-	  Bluetooth connections via 802.11 (wifi) physical layer
-	  available with Bluetooth version 3.0 or later.
-
 config BT_LE
 	bool "Bluetooth Low Energy (LE) features"
 	depends on BT
diff --git a/net/bluetooth/Makefile b/net/bluetooth/Makefile
index 141ac1fda0bf..628d448d78be 100644
--- a/net/bluetooth/Makefile
+++ b/net/bluetooth/Makefile
@@ -21,7 +21,6 @@ bluetooth-$(CONFIG_DEV_COREDUMP) += coredump.o
 
 bluetooth-$(CONFIG_BT_BREDR) += sco.o
 bluetooth-$(CONFIG_BT_LE) += iso.o
-bluetooth-$(CONFIG_BT_HS) += a2mp.o amp.o
 bluetooth-$(CONFIG_BT_LEDS) += leds.o
 bluetooth-$(CONFIG_BT_MSFTEXT) += msft.o
 bluetooth-$(CONFIG_BT_AOSPEXT) += aosp.o
diff --git a/net/bluetooth/a2mp.c b/net/bluetooth/a2mp.c
deleted file mode 100644
index e7adb8a98cf9..000000000000
--- a/net/bluetooth/a2mp.c
+++ /dev/null
@@ -1,1054 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
-   Copyright (c) 2010,2011 Code Aurora Forum.  All rights reserved.
-   Copyright (c) 2011,2012 Intel Corp.
-
-*/
-
-#include <net/bluetooth/bluetooth.h>
-#include <net/bluetooth/hci_core.h>
-#include <net/bluetooth/l2cap.h>
-
-#include "hci_request.h"
-#include "a2mp.h"
-#include "amp.h"
-
-#define A2MP_FEAT_EXT	0x8000
-
-/* Global AMP Manager list */
-static LIST_HEAD(amp_mgr_list);
-static DEFINE_MUTEX(amp_mgr_list_lock);
-
-/* A2MP build & send command helper functions */
-static struct a2mp_cmd *__a2mp_build(u8 code, u8 ident, u16 len, void *data)
-{
-	struct a2mp_cmd *cmd;
-	int plen;
-
-	plen = sizeof(*cmd) + len;
-	cmd = kzalloc(plen, GFP_KERNEL);
-	if (!cmd)
-		return NULL;
-
-	cmd->code = code;
-	cmd->ident = ident;
-	cmd->len = cpu_to_le16(len);
-
-	memcpy(cmd->data, data, len);
-
-	return cmd;
-}
-
-static void a2mp_send(struct amp_mgr *mgr, u8 code, u8 ident, u16 len, void *data)
-{
-	struct l2cap_chan *chan = mgr->a2mp_chan;
-	struct a2mp_cmd *cmd;
-	u16 total_len = len + sizeof(*cmd);
-	struct kvec iv;
-	struct msghdr msg;
-
-	cmd = __a2mp_build(code, ident, len, data);
-	if (!cmd)
-		return;
-
-	iv.iov_base = cmd;
-	iv.iov_len = total_len;
-
-	memset(&msg, 0, sizeof(msg));
-
-	iov_iter_kvec(&msg.msg_iter, ITER_SOURCE, &iv, 1, total_len);
-
-	l2cap_chan_send(chan, &msg, total_len);
-
-	kfree(cmd);
-}
-
-static u8 __next_ident(struct amp_mgr *mgr)
-{
-	if (++mgr->ident == 0)
-		mgr->ident = 1;
-
-	return mgr->ident;
-}
-
-static struct amp_mgr *amp_mgr_lookup_by_state(u8 state)
-{
-	struct amp_mgr *mgr;
-
-	mutex_lock(&amp_mgr_list_lock);
-	list_for_each_entry(mgr, &amp_mgr_list, list) {
-		if (test_and_clear_bit(state, &mgr->state)) {
-			amp_mgr_get(mgr);
-			mutex_unlock(&amp_mgr_list_lock);
-			return mgr;
-		}
-	}
-	mutex_unlock(&amp_mgr_list_lock);
-
-	return NULL;
-}
-
-/* hci_dev_list shall be locked */
-static void __a2mp_add_cl(struct amp_mgr *mgr, struct a2mp_cl *cl)
-{
-	struct hci_dev *hdev;
-	int i = 1;
-
-	cl[0].id = AMP_ID_BREDR;
-	cl[0].type = AMP_TYPE_BREDR;
-	cl[0].status = AMP_STATUS_BLUETOOTH_ONLY;
-
-	list_for_each_entry(hdev, &hci_dev_list, list) {
-		if (hdev->dev_type == HCI_AMP) {
-			cl[i].id = hdev->id;
-			cl[i].type = hdev->amp_type;
-			if (test_bit(HCI_UP, &hdev->flags))
-				cl[i].status = hdev->amp_status;
-			else
-				cl[i].status = AMP_STATUS_POWERED_DOWN;
-			i++;
-		}
-	}
-}
-
-/* Processing A2MP messages */
-static int a2mp_command_rej(struct amp_mgr *mgr, struct sk_buff *skb,
-			    struct a2mp_cmd *hdr)
-{
-	struct a2mp_cmd_rej *rej = (void *) skb->data;
-
-	if (le16_to_cpu(hdr->len) < sizeof(*rej))
-		return -EINVAL;
-
-	BT_DBG("ident %u reason %d", hdr->ident, le16_to_cpu(rej->reason));
-
-	skb_pull(skb, sizeof(*rej));
-
-	return 0;
-}
-
-static int a2mp_discover_req(struct amp_mgr *mgr, struct sk_buff *skb,
-			     struct a2mp_cmd *hdr)
-{
-	struct a2mp_discov_req *req = (void *) skb->data;
-	u16 len = le16_to_cpu(hdr->len);
-	struct a2mp_discov_rsp *rsp;
-	u16 ext_feat;
-	u8 num_ctrl;
-	struct hci_dev *hdev;
-
-	if (len < sizeof(*req))
-		return -EINVAL;
-
-	skb_pull(skb, sizeof(*req));
-
-	ext_feat = le16_to_cpu(req->ext_feat);
-
-	BT_DBG("mtu %d efm 0x%4.4x", le16_to_cpu(req->mtu), ext_feat);
-
-	/* check that packet is not broken for now */
-	while (ext_feat & A2MP_FEAT_EXT) {
-		if (len < sizeof(ext_feat))
-			return -EINVAL;
-
-		ext_feat = get_unaligned_le16(skb->data);
-		BT_DBG("efm 0x%4.4x", ext_feat);
-		len -= sizeof(ext_feat);
-		skb_pull(skb, sizeof(ext_feat));
-	}
-
-	read_lock(&hci_dev_list_lock);
-
-	/* at minimum the BR/EDR needs to be listed */
-	num_ctrl = 1;
-
-	list_for_each_entry(hdev, &hci_dev_list, list) {
-		if (hdev->dev_type == HCI_AMP)
-			num_ctrl++;
-	}
-
-	len = struct_size(rsp, cl, num_ctrl);
-	rsp = kmalloc(len, GFP_ATOMIC);
-	if (!rsp) {
-		read_unlock(&hci_dev_list_lock);
-		return -ENOMEM;
-	}
-
-	rsp->mtu = cpu_to_le16(L2CAP_A2MP_DEFAULT_MTU);
-	rsp->ext_feat = 0;
-
-	__a2mp_add_cl(mgr, rsp->cl);
-
-	read_unlock(&hci_dev_list_lock);
-
-	a2mp_send(mgr, A2MP_DISCOVER_RSP, hdr->ident, len, rsp);
-
-	kfree(rsp);
-	return 0;
-}
-
-static int a2mp_discover_rsp(struct amp_mgr *mgr, struct sk_buff *skb,
-			     struct a2mp_cmd *hdr)
-{
-	struct a2mp_discov_rsp *rsp = (void *) skb->data;
-	u16 len = le16_to_cpu(hdr->len);
-	struct a2mp_cl *cl;
-	u16 ext_feat;
-	bool found = false;
-
-	if (len < sizeof(*rsp))
-		return -EINVAL;
-
-	len -= sizeof(*rsp);
-	skb_pull(skb, sizeof(*rsp));
-
-	ext_feat = le16_to_cpu(rsp->ext_feat);
-
-	BT_DBG("mtu %d efm 0x%4.4x", le16_to_cpu(rsp->mtu), ext_feat);
-
-	/* check that packet is not broken for now */
-	while (ext_feat & A2MP_FEAT_EXT) {
-		if (len < sizeof(ext_feat))
-			return -EINVAL;
-
-		ext_feat = get_unaligned_le16(skb->data);
-		BT_DBG("efm 0x%4.4x", ext_feat);
-		len -= sizeof(ext_feat);
-		skb_pull(skb, sizeof(ext_feat));
-	}
-
-	cl = (void *) skb->data;
-	while (len >= sizeof(*cl)) {
-		BT_DBG("Remote AMP id %u type %u status %u", cl->id, cl->type,
-		       cl->status);
-
-		if (cl->id != AMP_ID_BREDR && cl->type != AMP_TYPE_BREDR) {
-			struct a2mp_info_req req;
-
-			found = true;
-
-			memset(&req, 0, sizeof(req));
-
-			req.id = cl->id;
-			a2mp_send(mgr, A2MP_GETINFO_REQ, __next_ident(mgr),
-				  sizeof(req), &req);
-		}
-
-		len -= sizeof(*cl);
-		cl = skb_pull(skb, sizeof(*cl));
-	}
-
-	/* Fall back to L2CAP init sequence */
-	if (!found) {
-		struct l2cap_conn *conn = mgr->l2cap_conn;
-		struct l2cap_chan *chan;
-
-		mutex_lock(&conn->chan_lock);
-
-		list_for_each_entry(chan, &conn->chan_l, list) {
-
-			BT_DBG("chan %p state %s", chan,
-			       state_to_string(chan->state));
-
-			if (chan->scid == L2CAP_CID_A2MP)
-				continue;
-
-			l2cap_chan_lock(chan);
-
-			if (chan->state == BT_CONNECT)
-				l2cap_send_conn_req(chan);
-
-			l2cap_chan_unlock(chan);
-		}
-
-		mutex_unlock(&conn->chan_lock);
-	}
-
-	return 0;
-}
-
-static int a2mp_change_notify(struct amp_mgr *mgr, struct sk_buff *skb,
-			      struct a2mp_cmd *hdr)
-{
-	struct a2mp_cl *cl = (void *) skb->data;
-
-	while (skb->len >= sizeof(*cl)) {
-		BT_DBG("Controller id %u type %u status %u", cl->id, cl->type,
-		       cl->status);
-		cl = skb_pull(skb, sizeof(*cl));
-	}
-
-	/* TODO send A2MP_CHANGE_RSP */
-
-	return 0;
-}
-
-static void read_local_amp_info_complete(struct hci_dev *hdev, u8 status,
-					 u16 opcode)
-{
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
-
-	a2mp_send_getinfo_rsp(hdev);
-}
-
-static int a2mp_getinfo_req(struct amp_mgr *mgr, struct sk_buff *skb,
-			    struct a2mp_cmd *hdr)
-{
-	struct a2mp_info_req *req  = (void *) skb->data;
-	struct hci_dev *hdev;
-	struct hci_request hreq;
-	int err = 0;
-
-	if (le16_to_cpu(hdr->len) < sizeof(*req))
-		return -EINVAL;
-
-	BT_DBG("id %u", req->id);
-
-	hdev = hci_dev_get(req->id);
-	if (!hdev || hdev->dev_type != HCI_AMP) {
-		struct a2mp_info_rsp rsp;
-
-		memset(&rsp, 0, sizeof(rsp));
-
-		rsp.id = req->id;
-		rsp.status = A2MP_STATUS_INVALID_CTRL_ID;
-
-		a2mp_send(mgr, A2MP_GETINFO_RSP, hdr->ident, sizeof(rsp),
-			  &rsp);
-
-		goto done;
-	}
-
-	set_bit(READ_LOC_AMP_INFO, &mgr->state);
-	hci_req_init(&hreq, hdev);
-	hci_req_add(&hreq, HCI_OP_READ_LOCAL_AMP_INFO, 0, NULL);
-	err = hci_req_run(&hreq, read_local_amp_info_complete);
-	if (err < 0)
-		a2mp_send_getinfo_rsp(hdev);
-
-done:
-	if (hdev)
-		hci_dev_put(hdev);
-
-	skb_pull(skb, sizeof(*req));
-	return 0;
-}
-
-static int a2mp_getinfo_rsp(struct amp_mgr *mgr, struct sk_buff *skb,
-			    struct a2mp_cmd *hdr)
-{
-	struct a2mp_info_rsp *rsp = (struct a2mp_info_rsp *) skb->data;
-	struct a2mp_amp_assoc_req req;
-	struct amp_ctrl *ctrl;
-
-	if (le16_to_cpu(hdr->len) < sizeof(*rsp))
-		return -EINVAL;
-
-	BT_DBG("id %u status 0x%2.2x", rsp->id, rsp->status);
-
-	if (rsp->status)
-		return -EINVAL;
-
-	ctrl = amp_ctrl_add(mgr, rsp->id);
-	if (!ctrl)
-		return -ENOMEM;
-
-	memset(&req, 0, sizeof(req));
-
-	req.id = rsp->id;
-	a2mp_send(mgr, A2MP_GETAMPASSOC_REQ, __next_ident(mgr), sizeof(req),
-		  &req);
-
-	skb_pull(skb, sizeof(*rsp));
-	return 0;
-}
-
-static int a2mp_getampassoc_req(struct amp_mgr *mgr, struct sk_buff *skb,
-				struct a2mp_cmd *hdr)
-{
-	struct a2mp_amp_assoc_req *req = (void *) skb->data;
-	struct hci_dev *hdev;
-	struct amp_mgr *tmp;
-
-	if (le16_to_cpu(hdr->len) < sizeof(*req))
-		return -EINVAL;
-
-	BT_DBG("id %u", req->id);
-
-	/* Make sure that other request is not processed */
-	tmp = amp_mgr_lookup_by_state(READ_LOC_AMP_ASSOC);
-
-	hdev = hci_dev_get(req->id);
-	if (!hdev || hdev->amp_type == AMP_TYPE_BREDR || tmp) {
-		struct a2mp_amp_assoc_rsp rsp;
-
-		memset(&rsp, 0, sizeof(rsp));
-		rsp.id = req->id;
-
-		if (tmp) {
-			rsp.status = A2MP_STATUS_COLLISION_OCCURED;
-			amp_mgr_put(tmp);
-		} else {
-			rsp.status = A2MP_STATUS_INVALID_CTRL_ID;
-		}
-
-		a2mp_send(mgr, A2MP_GETAMPASSOC_RSP, hdr->ident, sizeof(rsp),
-			  &rsp);
-
-		goto done;
-	}
-
-	amp_read_loc_assoc(hdev, mgr);
-
-done:
-	if (hdev)
-		hci_dev_put(hdev);
-
-	skb_pull(skb, sizeof(*req));
-	return 0;
-}
-
-static int a2mp_getampassoc_rsp(struct amp_mgr *mgr, struct sk_buff *skb,
-				struct a2mp_cmd *hdr)
-{
-	struct a2mp_amp_assoc_rsp *rsp = (void *) skb->data;
-	u16 len = le16_to_cpu(hdr->len);
-	struct hci_dev *hdev;
-	struct amp_ctrl *ctrl;
-	struct hci_conn *hcon;
-	size_t assoc_len;
-
-	if (len < sizeof(*rsp))
-		return -EINVAL;
-
-	assoc_len = len - sizeof(*rsp);
-
-	BT_DBG("id %u status 0x%2.2x assoc len %zu", rsp->id, rsp->status,
-	       assoc_len);
-
-	if (rsp->status)
-		return -EINVAL;
-
-	/* Save remote ASSOC data */
-	ctrl = amp_ctrl_lookup(mgr, rsp->id);
-	if (ctrl) {
-		u8 *assoc;
-
-		assoc = kmemdup(rsp->amp_assoc, assoc_len, GFP_KERNEL);
-		if (!assoc) {
-			amp_ctrl_put(ctrl);
-			return -ENOMEM;
-		}
-
-		ctrl->assoc = assoc;
-		ctrl->assoc_len = assoc_len;
-		ctrl->assoc_rem_len = assoc_len;
-		ctrl->assoc_len_so_far = 0;
-
-		amp_ctrl_put(ctrl);
-	}
-
-	/* Create Phys Link */
-	hdev = hci_dev_get(rsp->id);
-	if (!hdev)
-		return -EINVAL;
-
-	hcon = phylink_add(hdev, mgr, rsp->id, true);
-	if (!hcon)
-		goto done;
-
-	BT_DBG("Created hcon %p: loc:%u -> rem:%u", hcon, hdev->id, rsp->id);
-
-	mgr->bredr_chan->remote_amp_id = rsp->id;
-
-	amp_create_phylink(hdev, mgr, hcon);
-
-done:
-	hci_dev_put(hdev);
-	skb_pull(skb, len);
-	return 0;
-}
-
-static int a2mp_createphyslink_req(struct amp_mgr *mgr, struct sk_buff *skb,
-				   struct a2mp_cmd *hdr)
-{
-	struct a2mp_physlink_req *req = (void *) skb->data;
-	struct a2mp_physlink_rsp rsp;
-	struct hci_dev *hdev;
-	struct hci_conn *hcon;
-	struct amp_ctrl *ctrl;
-
-	if (le16_to_cpu(hdr->len) < sizeof(*req))
-		return -EINVAL;
-
-	BT_DBG("local_id %u, remote_id %u", req->local_id, req->remote_id);
-
-	memset(&rsp, 0, sizeof(rsp));
-
-	rsp.local_id = req->remote_id;
-	rsp.remote_id = req->local_id;
-
-	hdev = hci_dev_get(req->remote_id);
-	if (!hdev || hdev->amp_type == AMP_TYPE_BREDR) {
-		rsp.status = A2MP_STATUS_INVALID_CTRL_ID;
-		goto send_rsp;
-	}
-
-	ctrl = amp_ctrl_lookup(mgr, rsp.remote_id);
-	if (!ctrl) {
-		ctrl = amp_ctrl_add(mgr, rsp.remote_id);
-		if (ctrl) {
-			amp_ctrl_get(ctrl);
-		} else {
-			rsp.status = A2MP_STATUS_UNABLE_START_LINK_CREATION;
-			goto send_rsp;
-		}
-	}
-
-	if (ctrl) {
-		size_t assoc_len = le16_to_cpu(hdr->len) - sizeof(*req);
-		u8 *assoc;
-
-		assoc = kmemdup(req->amp_assoc, assoc_len, GFP_KERNEL);
-		if (!assoc) {
-			amp_ctrl_put(ctrl);
-			hci_dev_put(hdev);
-			return -ENOMEM;
-		}
-
-		ctrl->assoc = assoc;
-		ctrl->assoc_len = assoc_len;
-		ctrl->assoc_rem_len = assoc_len;
-		ctrl->assoc_len_so_far = 0;
-
-		amp_ctrl_put(ctrl);
-	}
-
-	hcon = phylink_add(hdev, mgr, req->local_id, false);
-	if (hcon) {
-		amp_accept_phylink(hdev, mgr, hcon);
-		rsp.status = A2MP_STATUS_SUCCESS;
-	} else {
-		rsp.status = A2MP_STATUS_UNABLE_START_LINK_CREATION;
-	}
-
-send_rsp:
-	if (hdev)
-		hci_dev_put(hdev);
-
-	/* Reply error now and success after HCI Write Remote AMP Assoc
-	   command complete with success status
-	 */
-	if (rsp.status != A2MP_STATUS_SUCCESS) {
-		a2mp_send(mgr, A2MP_CREATEPHYSLINK_RSP, hdr->ident,
-			  sizeof(rsp), &rsp);
-	} else {
-		set_bit(WRITE_REMOTE_AMP_ASSOC, &mgr->state);
-		mgr->ident = hdr->ident;
-	}
-
-	skb_pull(skb, le16_to_cpu(hdr->len));
-	return 0;
-}
-
-static int a2mp_discphyslink_req(struct amp_mgr *mgr, struct sk_buff *skb,
-				 struct a2mp_cmd *hdr)
-{
-	struct a2mp_physlink_req *req = (void *) skb->data;
-	struct a2mp_physlink_rsp rsp;
-	struct hci_dev *hdev;
-	struct hci_conn *hcon;
-
-	if (le16_to_cpu(hdr->len) < sizeof(*req))
-		return -EINVAL;
-
-	BT_DBG("local_id %u remote_id %u", req->local_id, req->remote_id);
-
-	memset(&rsp, 0, sizeof(rsp));
-
-	rsp.local_id = req->remote_id;
-	rsp.remote_id = req->local_id;
-	rsp.status = A2MP_STATUS_SUCCESS;
-
-	hdev = hci_dev_get(req->remote_id);
-	if (!hdev) {
-		rsp.status = A2MP_STATUS_INVALID_CTRL_ID;
-		goto send_rsp;
-	}
-
-	hcon = hci_conn_hash_lookup_ba(hdev, AMP_LINK,
-				       &mgr->l2cap_conn->hcon->dst);
-	if (!hcon) {
-		bt_dev_err(hdev, "no phys link exist");
-		rsp.status = A2MP_STATUS_NO_PHYSICAL_LINK_EXISTS;
-		goto clean;
-	}
-
-	/* TODO Disconnect Phys Link here */
-
-clean:
-	hci_dev_put(hdev);
-
-send_rsp:
-	a2mp_send(mgr, A2MP_DISCONNPHYSLINK_RSP, hdr->ident, sizeof(rsp), &rsp);
-
-	skb_pull(skb, sizeof(*req));
-	return 0;
-}
-
-static inline int a2mp_cmd_rsp(struct amp_mgr *mgr, struct sk_buff *skb,
-			       struct a2mp_cmd *hdr)
-{
-	BT_DBG("ident %u code 0x%2.2x", hdr->ident, hdr->code);
-
-	skb_pull(skb, le16_to_cpu(hdr->len));
-	return 0;
-}
-
-/* Handle A2MP signalling */
-static int a2mp_chan_recv_cb(struct l2cap_chan *chan, struct sk_buff *skb)
-{
-	struct a2mp_cmd *hdr;
-	struct amp_mgr *mgr = chan->data;
-	int err = 0;
-
-	amp_mgr_get(mgr);
-
-	while (skb->len >= sizeof(*hdr)) {
-		u16 len;
-
-		hdr = (void *) skb->data;
-		len = le16_to_cpu(hdr->len);
-
-		BT_DBG("code 0x%2.2x id %u len %u", hdr->code, hdr->ident, len);
-
-		skb_pull(skb, sizeof(*hdr));
-
-		if (len > skb->len || !hdr->ident) {
-			err = -EINVAL;
-			break;
-		}
-
-		mgr->ident = hdr->ident;
-
-		switch (hdr->code) {
-		case A2MP_COMMAND_REJ:
-			a2mp_command_rej(mgr, skb, hdr);
-			break;
-
-		case A2MP_DISCOVER_REQ:
-			err = a2mp_discover_req(mgr, skb, hdr);
-			break;
-
-		case A2MP_CHANGE_NOTIFY:
-			err = a2mp_change_notify(mgr, skb, hdr);
-			break;
-
-		case A2MP_GETINFO_REQ:
-			err = a2mp_getinfo_req(mgr, skb, hdr);
-			break;
-
-		case A2MP_GETAMPASSOC_REQ:
-			err = a2mp_getampassoc_req(mgr, skb, hdr);
-			break;
-
-		case A2MP_CREATEPHYSLINK_REQ:
-			err = a2mp_createphyslink_req(mgr, skb, hdr);
-			break;
-
-		case A2MP_DISCONNPHYSLINK_REQ:
-			err = a2mp_discphyslink_req(mgr, skb, hdr);
-			break;
-
-		case A2MP_DISCOVER_RSP:
-			err = a2mp_discover_rsp(mgr, skb, hdr);
-			break;
-
-		case A2MP_GETINFO_RSP:
-			err = a2mp_getinfo_rsp(mgr, skb, hdr);
-			break;
-
-		case A2MP_GETAMPASSOC_RSP:
-			err = a2mp_getampassoc_rsp(mgr, skb, hdr);
-			break;
-
-		case A2MP_CHANGE_RSP:
-		case A2MP_CREATEPHYSLINK_RSP:
-		case A2MP_DISCONNPHYSLINK_RSP:
-			err = a2mp_cmd_rsp(mgr, skb, hdr);
-			break;
-
-		default:
-			BT_ERR("Unknown A2MP sig cmd 0x%2.2x", hdr->code);
-			err = -EINVAL;
-			break;
-		}
-	}
-
-	if (err) {
-		struct a2mp_cmd_rej rej;
-
-		memset(&rej, 0, sizeof(rej));
-
-		rej.reason = cpu_to_le16(0);
-		hdr = (void *) skb->data;
-
-		BT_DBG("Send A2MP Rej: cmd 0x%2.2x err %d", hdr->code, err);
-
-		a2mp_send(mgr, A2MP_COMMAND_REJ, hdr->ident, sizeof(rej),
-			  &rej);
-	}
-
-	/* Always free skb and return success error code to prevent
-	   from sending L2CAP Disconnect over A2MP channel */
-	kfree_skb(skb);
-
-	amp_mgr_put(mgr);
-
-	return 0;
-}
-
-static void a2mp_chan_close_cb(struct l2cap_chan *chan)
-{
-	l2cap_chan_put(chan);
-}
-
-static void a2mp_chan_state_change_cb(struct l2cap_chan *chan, int state,
-				      int err)
-{
-	struct amp_mgr *mgr = chan->data;
-
-	if (!mgr)
-		return;
-
-	BT_DBG("chan %p state %s", chan, state_to_string(state));
-
-	chan->state = state;
-
-	switch (state) {
-	case BT_CLOSED:
-		if (mgr)
-			amp_mgr_put(mgr);
-		break;
-	}
-}
-
-static struct sk_buff *a2mp_chan_alloc_skb_cb(struct l2cap_chan *chan,
-					      unsigned long hdr_len,
-					      unsigned long len, int nb)
-{
-	struct sk_buff *skb;
-
-	skb = bt_skb_alloc(hdr_len + len, GFP_KERNEL);
-	if (!skb)
-		return ERR_PTR(-ENOMEM);
-
-	return skb;
-}
-
-static const struct l2cap_ops a2mp_chan_ops = {
-	.name = "L2CAP A2MP channel",
-	.recv = a2mp_chan_recv_cb,
-	.close = a2mp_chan_close_cb,
-	.state_change = a2mp_chan_state_change_cb,
-	.alloc_skb = a2mp_chan_alloc_skb_cb,
-
-	/* Not implemented for A2MP */
-	.new_connection = l2cap_chan_no_new_connection,
-	.teardown = l2cap_chan_no_teardown,
-	.ready = l2cap_chan_no_ready,
-	.defer = l2cap_chan_no_defer,
-	.resume = l2cap_chan_no_resume,
-	.set_shutdown = l2cap_chan_no_set_shutdown,
-	.get_sndtimeo = l2cap_chan_no_get_sndtimeo,
-};
-
-static struct l2cap_chan *a2mp_chan_open(struct l2cap_conn *conn, bool locked)
-{
-	struct l2cap_chan *chan;
-	int err;
-
-	chan = l2cap_chan_create();
-	if (!chan)
-		return NULL;
-
-	BT_DBG("chan %p", chan);
-
-	chan->chan_type = L2CAP_CHAN_FIXED;
-	chan->scid = L2CAP_CID_A2MP;
-	chan->dcid = L2CAP_CID_A2MP;
-	chan->omtu = L2CAP_A2MP_DEFAULT_MTU;
-	chan->imtu = L2CAP_A2MP_DEFAULT_MTU;
-	chan->flush_to = L2CAP_DEFAULT_FLUSH_TO;
-
-	chan->ops = &a2mp_chan_ops;
-
-	l2cap_chan_set_defaults(chan);
-	chan->remote_max_tx = chan->max_tx;
-	chan->remote_tx_win = chan->tx_win;
-
-	chan->retrans_timeout = L2CAP_DEFAULT_RETRANS_TO;
-	chan->monitor_timeout = L2CAP_DEFAULT_MONITOR_TO;
-
-	skb_queue_head_init(&chan->tx_q);
-
-	chan->mode = L2CAP_MODE_ERTM;
-
-	err = l2cap_ertm_init(chan);
-	if (err < 0) {
-		l2cap_chan_del(chan, 0);
-		return NULL;
-	}
-
-	chan->conf_state = 0;
-
-	if (locked)
-		__l2cap_chan_add(conn, chan);
-	else
-		l2cap_chan_add(conn, chan);
-
-	chan->remote_mps = chan->omtu;
-	chan->mps = chan->omtu;
-
-	chan->state = BT_CONNECTED;
-
-	return chan;
-}
-
-/* AMP Manager functions */
-struct amp_mgr *amp_mgr_get(struct amp_mgr *mgr)
-{
-	BT_DBG("mgr %p orig refcnt %d", mgr, kref_read(&mgr->kref));
-
-	kref_get(&mgr->kref);
-
-	return mgr;
-}
-
-static void amp_mgr_destroy(struct kref *kref)
-{
-	struct amp_mgr *mgr = container_of(kref, struct amp_mgr, kref);
-
-	BT_DBG("mgr %p", mgr);
-
-	mutex_lock(&amp_mgr_list_lock);
-	list_del(&mgr->list);
-	mutex_unlock(&amp_mgr_list_lock);
-
-	amp_ctrl_list_flush(mgr);
-	kfree(mgr);
-}
-
-int amp_mgr_put(struct amp_mgr *mgr)
-{
-	BT_DBG("mgr %p orig refcnt %d", mgr, kref_read(&mgr->kref));
-
-	return kref_put(&mgr->kref, &amp_mgr_destroy);
-}
-
-static struct amp_mgr *amp_mgr_create(struct l2cap_conn *conn, bool locked)
-{
-	struct amp_mgr *mgr;
-	struct l2cap_chan *chan;
-
-	mgr = kzalloc(sizeof(*mgr), GFP_KERNEL);
-	if (!mgr)
-		return NULL;
-
-	BT_DBG("conn %p mgr %p", conn, mgr);
-
-	mgr->l2cap_conn = conn;
-
-	chan = a2mp_chan_open(conn, locked);
-	if (!chan) {
-		kfree(mgr);
-		return NULL;
-	}
-
-	mgr->a2mp_chan = chan;
-	chan->data = mgr;
-
-	conn->hcon->amp_mgr = mgr;
-
-	kref_init(&mgr->kref);
-
-	/* Remote AMP ctrl list initialization */
-	INIT_LIST_HEAD(&mgr->amp_ctrls);
-	mutex_init(&mgr->amp_ctrls_lock);
-
-	mutex_lock(&amp_mgr_list_lock);
-	list_add(&mgr->list, &amp_mgr_list);
-	mutex_unlock(&amp_mgr_list_lock);
-
-	return mgr;
-}
-
-struct l2cap_chan *a2mp_channel_create(struct l2cap_conn *conn,
-				       struct sk_buff *skb)
-{
-	struct amp_mgr *mgr;
-
-	if (conn->hcon->type != ACL_LINK)
-		return NULL;
-
-	mgr = amp_mgr_create(conn, false);
-	if (!mgr) {
-		BT_ERR("Could not create AMP manager");
-		return NULL;
-	}
-
-	BT_DBG("mgr: %p chan %p", mgr, mgr->a2mp_chan);
-
-	return mgr->a2mp_chan;
-}
-
-void a2mp_send_getinfo_rsp(struct hci_dev *hdev)
-{
-	struct amp_mgr *mgr;
-	struct a2mp_info_rsp rsp;
-
-	mgr = amp_mgr_lookup_by_state(READ_LOC_AMP_INFO);
-	if (!mgr)
-		return;
-
-	BT_DBG("%s mgr %p", hdev->name, mgr);
-
-	memset(&rsp, 0, sizeof(rsp));
-
-	rsp.id = hdev->id;
-	rsp.status = A2MP_STATUS_INVALID_CTRL_ID;
-
-	if (hdev->amp_type != AMP_TYPE_BREDR) {
-		rsp.status = 0;
-		rsp.total_bw = cpu_to_le32(hdev->amp_total_bw);
-		rsp.max_bw = cpu_to_le32(hdev->amp_max_bw);
-		rsp.min_latency = cpu_to_le32(hdev->amp_min_latency);
-		rsp.pal_cap = cpu_to_le16(hdev->amp_pal_cap);
-		rsp.assoc_size = cpu_to_le16(hdev->amp_assoc_size);
-	}
-
-	a2mp_send(mgr, A2MP_GETINFO_RSP, mgr->ident, sizeof(rsp), &rsp);
-	amp_mgr_put(mgr);
-}
-
-void a2mp_send_getampassoc_rsp(struct hci_dev *hdev, u8 status)
-{
-	struct amp_mgr *mgr;
-	struct amp_assoc *loc_assoc = &hdev->loc_assoc;
-	struct a2mp_amp_assoc_rsp *rsp;
-	size_t len;
-
-	mgr = amp_mgr_lookup_by_state(READ_LOC_AMP_ASSOC);
-	if (!mgr)
-		return;
-
-	BT_DBG("%s mgr %p", hdev->name, mgr);
-
-	len = sizeof(struct a2mp_amp_assoc_rsp) + loc_assoc->len;
-	rsp = kzalloc(len, GFP_KERNEL);
-	if (!rsp) {
-		amp_mgr_put(mgr);
-		return;
-	}
-
-	rsp->id = hdev->id;
-
-	if (status) {
-		rsp->status = A2MP_STATUS_INVALID_CTRL_ID;
-	} else {
-		rsp->status = A2MP_STATUS_SUCCESS;
-		memcpy(rsp->amp_assoc, loc_assoc->data, loc_assoc->len);
-	}
-
-	a2mp_send(mgr, A2MP_GETAMPASSOC_RSP, mgr->ident, len, rsp);
-	amp_mgr_put(mgr);
-	kfree(rsp);
-}
-
-void a2mp_send_create_phy_link_req(struct hci_dev *hdev, u8 status)
-{
-	struct amp_mgr *mgr;
-	struct amp_assoc *loc_assoc = &hdev->loc_assoc;
-	struct a2mp_physlink_req *req;
-	struct l2cap_chan *bredr_chan;
-	size_t len;
-
-	mgr = amp_mgr_lookup_by_state(READ_LOC_AMP_ASSOC_FINAL);
-	if (!mgr)
-		return;
-
-	len = sizeof(*req) + loc_assoc->len;
-
-	BT_DBG("%s mgr %p assoc_len %zu", hdev->name, mgr, len);
-
-	req = kzalloc(len, GFP_KERNEL);
-	if (!req) {
-		amp_mgr_put(mgr);
-		return;
-	}
-
-	bredr_chan = mgr->bredr_chan;
-	if (!bredr_chan)
-		goto clean;
-
-	req->local_id = hdev->id;
-	req->remote_id = bredr_chan->remote_amp_id;
-	memcpy(req->amp_assoc, loc_assoc->data, loc_assoc->len);
-
-	a2mp_send(mgr, A2MP_CREATEPHYSLINK_REQ, __next_ident(mgr), len, req);
-
-clean:
-	amp_mgr_put(mgr);
-	kfree(req);
-}
-
-void a2mp_send_create_phy_link_rsp(struct hci_dev *hdev, u8 status)
-{
-	struct amp_mgr *mgr;
-	struct a2mp_physlink_rsp rsp;
-	struct hci_conn *hs_hcon;
-
-	mgr = amp_mgr_lookup_by_state(WRITE_REMOTE_AMP_ASSOC);
-	if (!mgr)
-		return;
-
-	memset(&rsp, 0, sizeof(rsp));
-
-	hs_hcon = hci_conn_hash_lookup_state(hdev, AMP_LINK, BT_CONNECT);
-	if (!hs_hcon) {
-		rsp.status = A2MP_STATUS_UNABLE_START_LINK_CREATION;
-	} else {
-		rsp.remote_id = hs_hcon->remote_id;
-		rsp.status = A2MP_STATUS_SUCCESS;
-	}
-
-	BT_DBG("%s mgr %p hs_hcon %p status %u", hdev->name, mgr, hs_hcon,
-	       status);
-
-	rsp.local_id = hdev->id;
-	a2mp_send(mgr, A2MP_CREATEPHYSLINK_RSP, mgr->ident, sizeof(rsp), &rsp);
-	amp_mgr_put(mgr);
-}
-
-void a2mp_discover_amp(struct l2cap_chan *chan)
-{
-	struct l2cap_conn *conn = chan->conn;
-	struct amp_mgr *mgr = conn->hcon->amp_mgr;
-	struct a2mp_discov_req req;
-
-	BT_DBG("chan %p conn %p mgr %p", chan, conn, mgr);
-
-	if (!mgr) {
-		mgr = amp_mgr_create(conn, true);
-		if (!mgr)
-			return;
-	}
-
-	mgr->bredr_chan = chan;
-
-	memset(&req, 0, sizeof(req));
-
-	req.mtu = cpu_to_le16(L2CAP_A2MP_DEFAULT_MTU);
-	req.ext_feat = 0;
-	a2mp_send(mgr, A2MP_DISCOVER_REQ, 1, sizeof(req), &req);
-}
diff --git a/net/bluetooth/a2mp.h b/net/bluetooth/a2mp.h
deleted file mode 100644
index 2fd253a61a2a..000000000000
--- a/net/bluetooth/a2mp.h
+++ /dev/null
@@ -1,154 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
-   Copyright (c) 2010,2011 Code Aurora Forum.  All rights reserved.
-   Copyright (c) 2011,2012 Intel Corp.
-
-*/
-
-#ifndef __A2MP_H
-#define __A2MP_H
-
-#include <net/bluetooth/l2cap.h>
-
-enum amp_mgr_state {
-	READ_LOC_AMP_INFO,
-	READ_LOC_AMP_ASSOC,
-	READ_LOC_AMP_ASSOC_FINAL,
-	WRITE_REMOTE_AMP_ASSOC,
-};
-
-struct amp_mgr {
-	struct list_head	list;
-	struct l2cap_conn	*l2cap_conn;
-	struct l2cap_chan	*a2mp_chan;
-	struct l2cap_chan	*bredr_chan;
-	struct kref		kref;
-	__u8			ident;
-	__u8			handle;
-	unsigned long		state;
-	unsigned long		flags;
-
-	struct list_head	amp_ctrls;
-	struct mutex		amp_ctrls_lock;
-};
-
-struct a2mp_cmd {
-	__u8	code;
-	__u8	ident;
-	__le16	len;
-	__u8	data[];
-} __packed;
-
-/* A2MP command codes */
-#define A2MP_COMMAND_REJ         0x01
-struct a2mp_cmd_rej {
-	__le16	reason;
-	__u8	data[];
-} __packed;
-
-#define A2MP_DISCOVER_REQ        0x02
-struct a2mp_discov_req {
-	__le16	mtu;
-	__le16	ext_feat;
-} __packed;
-
-struct a2mp_cl {
-	__u8	id;
-	__u8	type;
-	__u8	status;
-} __packed;
-
-#define A2MP_DISCOVER_RSP        0x03
-struct a2mp_discov_rsp {
-	__le16     mtu;
-	__le16     ext_feat;
-	struct a2mp_cl cl[];
-} __packed;
-
-#define A2MP_CHANGE_NOTIFY       0x04
-#define A2MP_CHANGE_RSP          0x05
-
-#define A2MP_GETINFO_REQ         0x06
-struct a2mp_info_req {
-	__u8       id;
-} __packed;
-
-#define A2MP_GETINFO_RSP         0x07
-struct a2mp_info_rsp {
-	__u8	id;
-	__u8	status;
-	__le32	total_bw;
-	__le32	max_bw;
-	__le32	min_latency;
-	__le16	pal_cap;
-	__le16	assoc_size;
-} __packed;
-
-#define A2MP_GETAMPASSOC_REQ     0x08
-struct a2mp_amp_assoc_req {
-	__u8	id;
-} __packed;
-
-#define A2MP_GETAMPASSOC_RSP     0x09
-struct a2mp_amp_assoc_rsp {
-	__u8	id;
-	__u8	status;
-	__u8	amp_assoc[];
-} __packed;
-
-#define A2MP_CREATEPHYSLINK_REQ  0x0A
-#define A2MP_DISCONNPHYSLINK_REQ 0x0C
-struct a2mp_physlink_req {
-	__u8	local_id;
-	__u8	remote_id;
-	__u8	amp_assoc[];
-} __packed;
-
-#define A2MP_CREATEPHYSLINK_RSP  0x0B
-#define A2MP_DISCONNPHYSLINK_RSP 0x0D
-struct a2mp_physlink_rsp {
-	__u8	local_id;
-	__u8	remote_id;
-	__u8	status;
-} __packed;
-
-/* A2MP response status */
-#define A2MP_STATUS_SUCCESS			0x00
-#define A2MP_STATUS_INVALID_CTRL_ID		0x01
-#define A2MP_STATUS_UNABLE_START_LINK_CREATION	0x02
-#define A2MP_STATUS_NO_PHYSICAL_LINK_EXISTS	0x02
-#define A2MP_STATUS_COLLISION_OCCURED		0x03
-#define A2MP_STATUS_DISCONN_REQ_RECVD		0x04
-#define A2MP_STATUS_PHYS_LINK_EXISTS		0x05
-#define A2MP_STATUS_SECURITY_VIOLATION		0x06
-
-struct amp_mgr *amp_mgr_get(struct amp_mgr *mgr);
-
-#if IS_ENABLED(CONFIG_BT_HS)
-int amp_mgr_put(struct amp_mgr *mgr);
-struct l2cap_chan *a2mp_channel_create(struct l2cap_conn *conn,
-				       struct sk_buff *skb);
-void a2mp_discover_amp(struct l2cap_chan *chan);
-#else
-static inline int amp_mgr_put(struct amp_mgr *mgr)
-{
-	return 0;
-}
-
-static inline struct l2cap_chan *a2mp_channel_create(struct l2cap_conn *conn,
-						     struct sk_buff *skb)
-{
-	return NULL;
-}
-
-static inline void a2mp_discover_amp(struct l2cap_chan *chan)
-{
-}
-#endif
-
-void a2mp_send_getinfo_rsp(struct hci_dev *hdev);
-void a2mp_send_getampassoc_rsp(struct hci_dev *hdev, u8 status);
-void a2mp_send_create_phy_link_req(struct hci_dev *hdev, u8 status);
-void a2mp_send_create_phy_link_rsp(struct hci_dev *hdev, u8 status);
-
-#endif /* __A2MP_H */
diff --git a/net/bluetooth/amp.c b/net/bluetooth/amp.c
deleted file mode 100644
index 5d698f19868c..000000000000
--- a/net/bluetooth/amp.c
+++ /dev/null
@@ -1,590 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
-   Copyright (c) 2011,2012 Intel Corp.
-
-*/
-
-#include <net/bluetooth/bluetooth.h>
-#include <net/bluetooth/hci.h>
-#include <net/bluetooth/hci_core.h>
-#include <crypto/hash.h>
-
-#include "hci_request.h"
-#include "a2mp.h"
-#include "amp.h"
-
-/* Remote AMP Controllers interface */
-void amp_ctrl_get(struct amp_ctrl *ctrl)
-{
-	BT_DBG("ctrl %p orig refcnt %d", ctrl,
-	       kref_read(&ctrl->kref));
-
-	kref_get(&ctrl->kref);
-}
-
-static void amp_ctrl_destroy(struct kref *kref)
-{
-	struct amp_ctrl *ctrl = container_of(kref, struct amp_ctrl, kref);
-
-	BT_DBG("ctrl %p", ctrl);
-
-	kfree(ctrl->assoc);
-	kfree(ctrl);
-}
-
-int amp_ctrl_put(struct amp_ctrl *ctrl)
-{
-	BT_DBG("ctrl %p orig refcnt %d", ctrl,
-	       kref_read(&ctrl->kref));
-
-	return kref_put(&ctrl->kref, &amp_ctrl_destroy);
-}
-
-struct amp_ctrl *amp_ctrl_add(struct amp_mgr *mgr, u8 id)
-{
-	struct amp_ctrl *ctrl;
-
-	ctrl = kzalloc(sizeof(*ctrl), GFP_KERNEL);
-	if (!ctrl)
-		return NULL;
-
-	kref_init(&ctrl->kref);
-	ctrl->id = id;
-
-	mutex_lock(&mgr->amp_ctrls_lock);
-	list_add(&ctrl->list, &mgr->amp_ctrls);
-	mutex_unlock(&mgr->amp_ctrls_lock);
-
-	BT_DBG("mgr %p ctrl %p", mgr, ctrl);
-
-	return ctrl;
-}
-
-void amp_ctrl_list_flush(struct amp_mgr *mgr)
-{
-	struct amp_ctrl *ctrl, *n;
-
-	BT_DBG("mgr %p", mgr);
-
-	mutex_lock(&mgr->amp_ctrls_lock);
-	list_for_each_entry_safe(ctrl, n, &mgr->amp_ctrls, list) {
-		list_del(&ctrl->list);
-		amp_ctrl_put(ctrl);
-	}
-	mutex_unlock(&mgr->amp_ctrls_lock);
-}
-
-struct amp_ctrl *amp_ctrl_lookup(struct amp_mgr *mgr, u8 id)
-{
-	struct amp_ctrl *ctrl;
-
-	BT_DBG("mgr %p id %u", mgr, id);
-
-	mutex_lock(&mgr->amp_ctrls_lock);
-	list_for_each_entry(ctrl, &mgr->amp_ctrls, list) {
-		if (ctrl->id == id) {
-			amp_ctrl_get(ctrl);
-			mutex_unlock(&mgr->amp_ctrls_lock);
-			return ctrl;
-		}
-	}
-	mutex_unlock(&mgr->amp_ctrls_lock);
-
-	return NULL;
-}
-
-/* Physical Link interface */
-static u8 __next_handle(struct amp_mgr *mgr)
-{
-	if (++mgr->handle == 0)
-		mgr->handle = 1;
-
-	return mgr->handle;
-}
-
-struct hci_conn *phylink_add(struct hci_dev *hdev, struct amp_mgr *mgr,
-			     u8 remote_id, bool out)
-{
-	bdaddr_t *dst = &mgr->l2cap_conn->hcon->dst;
-	struct hci_conn *hcon;
-	u8 role = out ? HCI_ROLE_MASTER : HCI_ROLE_SLAVE;
-
-	hcon = hci_conn_add(hdev, AMP_LINK, dst, role, __next_handle(mgr));
-	if (!hcon)
-		return NULL;
-
-	BT_DBG("hcon %p dst %pMR", hcon, dst);
-
-	hcon->state = BT_CONNECT;
-	hcon->attempt++;
-	hcon->remote_id = remote_id;
-	hcon->amp_mgr = amp_mgr_get(mgr);
-
-	return hcon;
-}
-
-/* AMP crypto key generation interface */
-static int hmac_sha256(u8 *key, u8 ksize, char *plaintext, u8 psize, u8 *output)
-{
-	struct crypto_shash *tfm;
-	struct shash_desc *shash;
-	int ret;
-
-	if (!ksize)
-		return -EINVAL;
-
-	tfm = crypto_alloc_shash("hmac(sha256)", 0, 0);
-	if (IS_ERR(tfm)) {
-		BT_DBG("crypto_alloc_ahash failed: err %ld", PTR_ERR(tfm));
-		return PTR_ERR(tfm);
-	}
-
-	ret = crypto_shash_setkey(tfm, key, ksize);
-	if (ret) {
-		BT_DBG("crypto_ahash_setkey failed: err %d", ret);
-		goto failed;
-	}
-
-	shash = kzalloc(sizeof(*shash) + crypto_shash_descsize(tfm),
-			GFP_KERNEL);
-	if (!shash) {
-		ret = -ENOMEM;
-		goto failed;
-	}
-
-	shash->tfm = tfm;
-
-	ret = crypto_shash_digest(shash, plaintext, psize, output);
-
-	kfree(shash);
-
-failed:
-	crypto_free_shash(tfm);
-	return ret;
-}
-
-int phylink_gen_key(struct hci_conn *conn, u8 *data, u8 *len, u8 *type)
-{
-	struct hci_dev *hdev = conn->hdev;
-	struct link_key *key;
-	u8 keybuf[HCI_AMP_LINK_KEY_SIZE];
-	u8 gamp_key[HCI_AMP_LINK_KEY_SIZE];
-	int err;
-
-	if (!hci_conn_check_link_mode(conn))
-		return -EACCES;
-
-	BT_DBG("conn %p key_type %d", conn, conn->key_type);
-
-	/* Legacy key */
-	if (conn->key_type < 3) {
-		bt_dev_err(hdev, "legacy key type %u", conn->key_type);
-		return -EACCES;
-	}
-
-	*type = conn->key_type;
-	*len = HCI_AMP_LINK_KEY_SIZE;
-
-	key = hci_find_link_key(hdev, &conn->dst);
-	if (!key) {
-		BT_DBG("No Link key for conn %p dst %pMR", conn, &conn->dst);
-		return -EACCES;
-	}
-
-	/* BR/EDR Link Key concatenated together with itself */
-	memcpy(&keybuf[0], key->val, HCI_LINK_KEY_SIZE);
-	memcpy(&keybuf[HCI_LINK_KEY_SIZE], key->val, HCI_LINK_KEY_SIZE);
-
-	/* Derive Generic AMP Link Key (gamp) */
-	err = hmac_sha256(keybuf, HCI_AMP_LINK_KEY_SIZE, "gamp", 4, gamp_key);
-	if (err) {
-		bt_dev_err(hdev, "could not derive Generic AMP Key: err %d", err);
-		return err;
-	}
-
-	if (conn->key_type == HCI_LK_DEBUG_COMBINATION) {
-		BT_DBG("Use Generic AMP Key (gamp)");
-		memcpy(data, gamp_key, HCI_AMP_LINK_KEY_SIZE);
-		return err;
-	}
-
-	/* Derive Dedicated AMP Link Key: "802b" is 802.11 PAL keyID */
-	return hmac_sha256(gamp_key, HCI_AMP_LINK_KEY_SIZE, "802b", 4, data);
-}
-
-static void read_local_amp_assoc_complete(struct hci_dev *hdev, u8 status,
-					  u16 opcode, struct sk_buff *skb)
-{
-	struct hci_rp_read_local_amp_assoc *rp = (void *)skb->data;
-	struct amp_assoc *assoc = &hdev->loc_assoc;
-	size_t rem_len, frag_len;
-
-	BT_DBG("%s status 0x%2.2x", hdev->name, rp->status);
-
-	if (rp->status)
-		goto send_rsp;
-
-	frag_len = skb->len - sizeof(*rp);
-	rem_len = __le16_to_cpu(rp->rem_len);
-
-	if (rem_len > frag_len) {
-		BT_DBG("frag_len %zu rem_len %zu", frag_len, rem_len);
-
-		memcpy(assoc->data + assoc->offset, rp->frag, frag_len);
-		assoc->offset += frag_len;
-
-		/* Read other fragments */
-		amp_read_loc_assoc_frag(hdev, rp->phy_handle);
-
-		return;
-	}
-
-	memcpy(assoc->data + assoc->offset, rp->frag, rem_len);
-	assoc->len = assoc->offset + rem_len;
-	assoc->offset = 0;
-
-send_rsp:
-	/* Send A2MP Rsp when all fragments are received */
-	a2mp_send_getampassoc_rsp(hdev, rp->status);
-	a2mp_send_create_phy_link_req(hdev, rp->status);
-}
-
-void amp_read_loc_assoc_frag(struct hci_dev *hdev, u8 phy_handle)
-{
-	struct hci_cp_read_local_amp_assoc cp;
-	struct amp_assoc *loc_assoc = &hdev->loc_assoc;
-	struct hci_request req;
-	int err;
-
-	BT_DBG("%s handle %u", hdev->name, phy_handle);
-
-	cp.phy_handle = phy_handle;
-	cp.max_len = cpu_to_le16(hdev->amp_assoc_size);
-	cp.len_so_far = cpu_to_le16(loc_assoc->offset);
-
-	hci_req_init(&req, hdev);
-	hci_req_add(&req, HCI_OP_READ_LOCAL_AMP_ASSOC, sizeof(cp), &cp);
-	err = hci_req_run_skb(&req, read_local_amp_assoc_complete);
-	if (err < 0)
-		a2mp_send_getampassoc_rsp(hdev, A2MP_STATUS_INVALID_CTRL_ID);
-}
-
-void amp_read_loc_assoc(struct hci_dev *hdev, struct amp_mgr *mgr)
-{
-	struct hci_cp_read_local_amp_assoc cp;
-	struct hci_request req;
-	int err;
-
-	memset(&hdev->loc_assoc, 0, sizeof(struct amp_assoc));
-	memset(&cp, 0, sizeof(cp));
-
-	cp.max_len = cpu_to_le16(hdev->amp_assoc_size);
-
-	set_bit(READ_LOC_AMP_ASSOC, &mgr->state);
-	hci_req_init(&req, hdev);
-	hci_req_add(&req, HCI_OP_READ_LOCAL_AMP_ASSOC, sizeof(cp), &cp);
-	err = hci_req_run_skb(&req, read_local_amp_assoc_complete);
-	if (err < 0)
-		a2mp_send_getampassoc_rsp(hdev, A2MP_STATUS_INVALID_CTRL_ID);
-}
-
-void amp_read_loc_assoc_final_data(struct hci_dev *hdev,
-				   struct hci_conn *hcon)
-{
-	struct hci_cp_read_local_amp_assoc cp;
-	struct amp_mgr *mgr = hcon->amp_mgr;
-	struct hci_request req;
-	int err;
-
-	if (!mgr)
-		return;
-
-	cp.phy_handle = hcon->handle;
-	cp.len_so_far = cpu_to_le16(0);
-	cp.max_len = cpu_to_le16(hdev->amp_assoc_size);
-
-	set_bit(READ_LOC_AMP_ASSOC_FINAL, &mgr->state);
-
-	/* Read Local AMP Assoc final link information data */
-	hci_req_init(&req, hdev);
-	hci_req_add(&req, HCI_OP_READ_LOCAL_AMP_ASSOC, sizeof(cp), &cp);
-	err = hci_req_run_skb(&req, read_local_amp_assoc_complete);
-	if (err < 0)
-		a2mp_send_getampassoc_rsp(hdev, A2MP_STATUS_INVALID_CTRL_ID);
-}
-
-static void write_remote_amp_assoc_complete(struct hci_dev *hdev, u8 status,
-					    u16 opcode, struct sk_buff *skb)
-{
-	struct hci_rp_write_remote_amp_assoc *rp = (void *)skb->data;
-
-	BT_DBG("%s status 0x%2.2x phy_handle 0x%2.2x",
-	       hdev->name, rp->status, rp->phy_handle);
-
-	if (rp->status)
-		return;
-
-	amp_write_rem_assoc_continue(hdev, rp->phy_handle);
-}
-
-/* Write AMP Assoc data fragments, returns true with last fragment written*/
-static bool amp_write_rem_assoc_frag(struct hci_dev *hdev,
-				     struct hci_conn *hcon)
-{
-	struct hci_cp_write_remote_amp_assoc *cp;
-	struct amp_mgr *mgr = hcon->amp_mgr;
-	struct amp_ctrl *ctrl;
-	struct hci_request req;
-	u16 frag_len, len;
-
-	ctrl = amp_ctrl_lookup(mgr, hcon->remote_id);
-	if (!ctrl)
-		return false;
-
-	if (!ctrl->assoc_rem_len) {
-		BT_DBG("all fragments are written");
-		ctrl->assoc_rem_len = ctrl->assoc_len;
-		ctrl->assoc_len_so_far = 0;
-
-		amp_ctrl_put(ctrl);
-		return true;
-	}
-
-	frag_len = min_t(u16, 248, ctrl->assoc_rem_len);
-	len = frag_len + sizeof(*cp);
-
-	cp = kzalloc(len, GFP_KERNEL);
-	if (!cp) {
-		amp_ctrl_put(ctrl);
-		return false;
-	}
-
-	BT_DBG("hcon %p ctrl %p frag_len %u assoc_len %u rem_len %u",
-	       hcon, ctrl, frag_len, ctrl->assoc_len, ctrl->assoc_rem_len);
-
-	cp->phy_handle = hcon->handle;
-	cp->len_so_far = cpu_to_le16(ctrl->assoc_len_so_far);
-	cp->rem_len = cpu_to_le16(ctrl->assoc_rem_len);
-	memcpy(cp->frag, ctrl->assoc, frag_len);
-
-	ctrl->assoc_len_so_far += frag_len;
-	ctrl->assoc_rem_len -= frag_len;
-
-	amp_ctrl_put(ctrl);
-
-	hci_req_init(&req, hdev);
-	hci_req_add(&req, HCI_OP_WRITE_REMOTE_AMP_ASSOC, len, cp);
-	hci_req_run_skb(&req, write_remote_amp_assoc_complete);
-
-	kfree(cp);
-
-	return false;
-}
-
-void amp_write_rem_assoc_continue(struct hci_dev *hdev, u8 handle)
-{
-	struct hci_conn *hcon;
-
-	BT_DBG("%s phy handle 0x%2.2x", hdev->name, handle);
-
-	hcon = hci_conn_hash_lookup_handle(hdev, handle);
-	if (!hcon)
-		return;
-
-	/* Send A2MP create phylink rsp when all fragments are written */
-	if (amp_write_rem_assoc_frag(hdev, hcon))
-		a2mp_send_create_phy_link_rsp(hdev, 0);
-}
-
-void amp_write_remote_assoc(struct hci_dev *hdev, u8 handle)
-{
-	struct hci_conn *hcon;
-
-	BT_DBG("%s phy handle 0x%2.2x", hdev->name, handle);
-
-	hcon = hci_conn_hash_lookup_handle(hdev, handle);
-	if (!hcon)
-		return;
-
-	BT_DBG("%s phy handle 0x%2.2x hcon %p", hdev->name, handle, hcon);
-
-	amp_write_rem_assoc_frag(hdev, hcon);
-}
-
-static void create_phylink_complete(struct hci_dev *hdev, u8 status,
-				    u16 opcode)
-{
-	struct hci_cp_create_phy_link *cp;
-
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
-
-	cp = hci_sent_cmd_data(hdev, HCI_OP_CREATE_PHY_LINK);
-	if (!cp)
-		return;
-
-	hci_dev_lock(hdev);
-
-	if (status) {
-		struct hci_conn *hcon;
-
-		hcon = hci_conn_hash_lookup_handle(hdev, cp->phy_handle);
-		if (hcon)
-			hci_conn_del(hcon);
-	} else {
-		amp_write_remote_assoc(hdev, cp->phy_handle);
-	}
-
-	hci_dev_unlock(hdev);
-}
-
-void amp_create_phylink(struct hci_dev *hdev, struct amp_mgr *mgr,
-			struct hci_conn *hcon)
-{
-	struct hci_cp_create_phy_link cp;
-	struct hci_request req;
-
-	cp.phy_handle = hcon->handle;
-
-	BT_DBG("%s hcon %p phy handle 0x%2.2x", hdev->name, hcon,
-	       hcon->handle);
-
-	if (phylink_gen_key(mgr->l2cap_conn->hcon, cp.key, &cp.key_len,
-			    &cp.key_type)) {
-		BT_DBG("Cannot create link key");
-		return;
-	}
-
-	hci_req_init(&req, hdev);
-	hci_req_add(&req, HCI_OP_CREATE_PHY_LINK, sizeof(cp), &cp);
-	hci_req_run(&req, create_phylink_complete);
-}
-
-static void accept_phylink_complete(struct hci_dev *hdev, u8 status,
-				    u16 opcode)
-{
-	struct hci_cp_accept_phy_link *cp;
-
-	BT_DBG("%s status 0x%2.2x", hdev->name, status);
-
-	if (status)
-		return;
-
-	cp = hci_sent_cmd_data(hdev, HCI_OP_ACCEPT_PHY_LINK);
-	if (!cp)
-		return;
-
-	amp_write_remote_assoc(hdev, cp->phy_handle);
-}
-
-void amp_accept_phylink(struct hci_dev *hdev, struct amp_mgr *mgr,
-			struct hci_conn *hcon)
-{
-	struct hci_cp_accept_phy_link cp;
-	struct hci_request req;
-
-	cp.phy_handle = hcon->handle;
-
-	BT_DBG("%s hcon %p phy handle 0x%2.2x", hdev->name, hcon,
-	       hcon->handle);
-
-	if (phylink_gen_key(mgr->l2cap_conn->hcon, cp.key, &cp.key_len,
-			    &cp.key_type)) {
-		BT_DBG("Cannot create link key");
-		return;
-	}
-
-	hci_req_init(&req, hdev);
-	hci_req_add(&req, HCI_OP_ACCEPT_PHY_LINK, sizeof(cp), &cp);
-	hci_req_run(&req, accept_phylink_complete);
-}
-
-void amp_physical_cfm(struct hci_conn *bredr_hcon, struct hci_conn *hs_hcon)
-{
-	struct hci_dev *bredr_hdev = hci_dev_hold(bredr_hcon->hdev);
-	struct amp_mgr *mgr = hs_hcon->amp_mgr;
-	struct l2cap_chan *bredr_chan;
-
-	BT_DBG("bredr_hcon %p hs_hcon %p mgr %p", bredr_hcon, hs_hcon, mgr);
-
-	if (!bredr_hdev || !mgr || !mgr->bredr_chan)
-		return;
-
-	bredr_chan = mgr->bredr_chan;
-
-	l2cap_chan_lock(bredr_chan);
-
-	set_bit(FLAG_EFS_ENABLE, &bredr_chan->flags);
-	bredr_chan->remote_amp_id = hs_hcon->remote_id;
-	bredr_chan->local_amp_id = hs_hcon->hdev->id;
-	bredr_chan->hs_hcon = hs_hcon;
-	bredr_chan->conn->mtu = hs_hcon->hdev->block_mtu;
-
-	__l2cap_physical_cfm(bredr_chan, 0);
-
-	l2cap_chan_unlock(bredr_chan);
-
-	hci_dev_put(bredr_hdev);
-}
-
-void amp_create_logical_link(struct l2cap_chan *chan)
-{
-	struct hci_conn *hs_hcon = chan->hs_hcon;
-	struct hci_cp_create_accept_logical_link cp;
-	struct hci_dev *hdev;
-
-	BT_DBG("chan %p hs_hcon %p dst %pMR", chan, hs_hcon,
-	       &chan->conn->hcon->dst);
-
-	if (!hs_hcon)
-		return;
-
-	hdev = hci_dev_hold(chan->hs_hcon->hdev);
-	if (!hdev)
-		return;
-
-	cp.phy_handle = hs_hcon->handle;
-
-	cp.tx_flow_spec.id = chan->local_id;
-	cp.tx_flow_spec.stype = chan->local_stype;
-	cp.tx_flow_spec.msdu = cpu_to_le16(chan->local_msdu);
-	cp.tx_flow_spec.sdu_itime = cpu_to_le32(chan->local_sdu_itime);
-	cp.tx_flow_spec.acc_lat = cpu_to_le32(chan->local_acc_lat);
-	cp.tx_flow_spec.flush_to = cpu_to_le32(chan->local_flush_to);
-
-	cp.rx_flow_spec.id = chan->remote_id;
-	cp.rx_flow_spec.stype = chan->remote_stype;
-	cp.rx_flow_spec.msdu = cpu_to_le16(chan->remote_msdu);
-	cp.rx_flow_spec.sdu_itime = cpu_to_le32(chan->remote_sdu_itime);
-	cp.rx_flow_spec.acc_lat = cpu_to_le32(chan->remote_acc_lat);
-	cp.rx_flow_spec.flush_to = cpu_to_le32(chan->remote_flush_to);
-
-	if (hs_hcon->out)
-		hci_send_cmd(hdev, HCI_OP_CREATE_LOGICAL_LINK, sizeof(cp),
-			     &cp);
-	else
-		hci_send_cmd(hdev, HCI_OP_ACCEPT_LOGICAL_LINK, sizeof(cp),
-			     &cp);
-
-	hci_dev_put(hdev);
-}
-
-void amp_disconnect_logical_link(struct hci_chan *hchan)
-{
-	struct hci_conn *hcon = hchan->conn;
-	struct hci_cp_disconn_logical_link cp;
-
-	if (hcon->state != BT_CONNECTED) {
-		BT_DBG("hchan %p not connected", hchan);
-		return;
-	}
-
-	cp.log_handle = cpu_to_le16(hchan->handle);
-	hci_send_cmd(hcon->hdev, HCI_OP_DISCONN_LOGICAL_LINK, sizeof(cp), &cp);
-}
-
-void amp_destroy_logical_link(struct hci_chan *hchan, u8 reason)
-{
-	BT_DBG("hchan %p", hchan);
-
-	hci_chan_del(hchan);
-}
diff --git a/net/bluetooth/amp.h b/net/bluetooth/amp.h
deleted file mode 100644
index 97c87abd129f..000000000000
--- a/net/bluetooth/amp.h
+++ /dev/null
@@ -1,60 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
-   Copyright (c) 2011,2012 Intel Corp.
-
-*/
-
-#ifndef __AMP_H
-#define __AMP_H
-
-struct amp_ctrl {
-	struct list_head	list;
-	struct kref		kref;
-	__u8			id;
-	__u16			assoc_len_so_far;
-	__u16			assoc_rem_len;
-	__u16			assoc_len;
-	__u8			*assoc;
-};
-
-int amp_ctrl_put(struct amp_ctrl *ctrl);
-void amp_ctrl_get(struct amp_ctrl *ctrl);
-struct amp_ctrl *amp_ctrl_add(struct amp_mgr *mgr, u8 id);
-struct amp_ctrl *amp_ctrl_lookup(struct amp_mgr *mgr, u8 id);
-void amp_ctrl_list_flush(struct amp_mgr *mgr);
-
-struct hci_conn *phylink_add(struct hci_dev *hdev, struct amp_mgr *mgr,
-			     u8 remote_id, bool out);
-
-int phylink_gen_key(struct hci_conn *hcon, u8 *data, u8 *len, u8 *type);
-
-void amp_read_loc_assoc_frag(struct hci_dev *hdev, u8 phy_handle);
-void amp_read_loc_assoc(struct hci_dev *hdev, struct amp_mgr *mgr);
-void amp_read_loc_assoc_final_data(struct hci_dev *hdev,
-				   struct hci_conn *hcon);
-void amp_create_phylink(struct hci_dev *hdev, struct amp_mgr *mgr,
-			struct hci_conn *hcon);
-void amp_accept_phylink(struct hci_dev *hdev, struct amp_mgr *mgr,
-			struct hci_conn *hcon);
-
-#if IS_ENABLED(CONFIG_BT_HS)
-void amp_create_logical_link(struct l2cap_chan *chan);
-void amp_disconnect_logical_link(struct hci_chan *hchan);
-#else
-static inline void amp_create_logical_link(struct l2cap_chan *chan)
-{
-}
-
-static inline void amp_disconnect_logical_link(struct hci_chan *hchan)
-{
-}
-#endif
-
-void amp_write_remote_assoc(struct hci_dev *hdev, u8 handle);
-void amp_write_rem_assoc_continue(struct hci_dev *hdev, u8 handle);
-void amp_physical_cfm(struct hci_conn *bredr_hcon, struct hci_conn *hs_hcon);
-void amp_create_logical_link(struct l2cap_chan *chan);
-void amp_disconnect_logical_link(struct hci_chan *hchan);
-void amp_destroy_logical_link(struct hci_chan *hchan, u8 reason);
-
-#endif /* __AMP_H */
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index a41d2693f4d8..fc4d72f83ac2 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -36,7 +36,6 @@
 
 #include "hci_request.h"
 #include "smp.h"
-#include "a2mp.h"
 #include "eir.h"
 
 struct sco_param {
@@ -1175,9 +1174,6 @@ void hci_conn_del(struct hci_conn *conn)
 		}
 	}
 
-	if (conn->amp_mgr)
-		amp_mgr_put(conn->amp_mgr);
-
 	skb_queue_purge(&conn->data_q);
 
 	/* Remove the connection from the list and cleanup its remaining
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 48ba9f9e0b74..db16c3aff397 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -36,8 +36,6 @@
 #include "hci_request.h"
 #include "hci_debugfs.h"
 #include "hci_codec.h"
-#include "a2mp.h"
-#include "amp.h"
 #include "smp.h"
 #include "msft.h"
 #include "eir.h"
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 656f49b299d2..644e933c4275 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -39,8 +39,6 @@
 #include <net/bluetooth/l2cap.h>
 
 #include "smp.h"
-#include "a2mp.h"
-#include "amp.h"
 
 #define LE_FLOWCTL_MAX_CREDITS 65535
 
@@ -651,7 +649,6 @@ void l2cap_chan_del(struct l2cap_chan *chan, int err)
 	chan->ops->teardown(chan, err);
 
 	if (conn) {
-		struct amp_mgr *mgr = conn->hcon->amp_mgr;
 		/* Delete from channel list */
 		list_del(&chan->list);
 
@@ -666,16 +663,6 @@ void l2cap_chan_del(struct l2cap_chan *chan, int err)
 		if (chan->chan_type != L2CAP_CHAN_FIXED ||
 		    test_bit(FLAG_HOLD_HCI_CONN, &chan->flags))
 			hci_conn_drop(conn->hcon);
-
-		if (mgr && mgr->bredr_chan == chan)
-			mgr->bredr_chan = NULL;
-	}
-
-	if (chan->hs_hchan) {
-		struct hci_chan *hs_hchan = chan->hs_hchan;
-
-		BT_DBG("chan %p disconnect hs_hchan %p", chan, hs_hchan);
-		amp_disconnect_logical_link(hs_hchan);
 	}
 
 	if (test_bit(CONF_NOT_COMPLETE, &chan->conf_state))
@@ -977,12 +964,6 @@ static void l2cap_send_cmd(struct l2cap_conn *conn, u8 ident, u8 code, u16 len,
 	hci_send_acl(conn->hchan, skb, flags);
 }
 
-static bool __chan_is_moving(struct l2cap_chan *chan)
-{
-	return chan->move_state != L2CAP_MOVE_STABLE &&
-	       chan->move_state != L2CAP_MOVE_WAIT_PREPARE;
-}
-
 static void l2cap_do_send(struct l2cap_chan *chan, struct sk_buff *skb)
 {
 	struct hci_conn *hcon = chan->conn->hcon;
@@ -991,15 +972,6 @@ static void l2cap_do_send(struct l2cap_chan *chan, struct sk_buff *skb)
 	BT_DBG("chan %p, skb %p len %d priority %u", chan, skb, skb->len,
 	       skb->priority);
 
-	if (chan->hs_hcon && !__chan_is_moving(chan)) {
-		if (chan->hs_hchan)
-			hci_send_acl(chan->hs_hchan, skb, ACL_COMPLETE);
-		else
-			kfree_skb(skb);
-
-		return;
-	}
-
 	/* Use NO_FLUSH for LE links (where this is the only option) or
 	 * if the BR/EDR link supports it and flushing has not been
 	 * explicitly requested (through FLAG_FLUSHABLE).
@@ -1180,9 +1152,6 @@ static void l2cap_send_sframe(struct l2cap_chan *chan,
 	if (!control->sframe)
 		return;
 
-	if (__chan_is_moving(chan))
-		return;
-
 	if (test_and_clear_bit(CONN_SEND_FBIT, &chan->conn_state) &&
 	    !control->poll)
 		control->final = 1;
@@ -1237,40 +1206,6 @@ static inline int __l2cap_no_conn_pending(struct l2cap_chan *chan)
 	return !test_bit(CONF_CONNECT_PEND, &chan->conf_state);
 }
 
-static bool __amp_capable(struct l2cap_chan *chan)
-{
-	struct l2cap_conn *conn = chan->conn;
-	struct hci_dev *hdev;
-	bool amp_available = false;
-
-	if (!(conn->local_fixed_chan & L2CAP_FC_A2MP))
-		return false;
-
-	if (!(conn->remote_fixed_chan & L2CAP_FC_A2MP))
-		return false;
-
-	read_lock(&hci_dev_list_lock);
-	list_for_each_entry(hdev, &hci_dev_list, list) {
-		if (hdev->amp_type != AMP_TYPE_BREDR &&
-		    test_bit(HCI_UP, &hdev->flags)) {
-			amp_available = true;
-			break;
-		}
-	}
-	read_unlock(&hci_dev_list_lock);
-
-	if (chan->chan_policy == BT_CHANNEL_POLICY_AMP_PREFERRED)
-		return amp_available;
-
-	return false;
-}
-
-static bool l2cap_check_efs(struct l2cap_chan *chan)
-{
-	/* Check EFS parameters */
-	return true;
-}
-
 void l2cap_send_conn_req(struct l2cap_chan *chan)
 {
 	struct l2cap_conn *conn = chan->conn;
@@ -1286,19 +1221,6 @@ void l2cap_send_conn_req(struct l2cap_chan *chan)
 	l2cap_send_cmd(conn, chan->ident, L2CAP_CONN_REQ, sizeof(req), &req);
 }
 
-static void l2cap_send_create_chan_req(struct l2cap_chan *chan, u8 amp_id)
-{
-	struct l2cap_create_chan_req req;
-	req.scid = cpu_to_le16(chan->scid);
-	req.psm  = chan->psm;
-	req.amp_id = amp_id;
-
-	chan->ident = l2cap_get_ident(chan->conn);
-
-	l2cap_send_cmd(chan->conn, chan->ident, L2CAP_CREATE_CHAN_REQ,
-		       sizeof(req), &req);
-}
-
 static void l2cap_move_setup(struct l2cap_chan *chan)
 {
 	struct sk_buff *skb;
@@ -1334,28 +1256,6 @@ static void l2cap_move_setup(struct l2cap_chan *chan)
 	set_bit(CONN_REMOTE_BUSY, &chan->conn_state);
 }
 
-static void l2cap_move_done(struct l2cap_chan *chan)
-{
-	u8 move_role = chan->move_role;
-	BT_DBG("chan %p", chan);
-
-	chan->move_state = L2CAP_MOVE_STABLE;
-	chan->move_role = L2CAP_MOVE_ROLE_NONE;
-
-	if (chan->mode != L2CAP_MODE_ERTM)
-		return;
-
-	switch (move_role) {
-	case L2CAP_MOVE_ROLE_INITIATOR:
-		l2cap_tx(chan, NULL, NULL, L2CAP_EV_EXPLICIT_POLL);
-		chan->rx_state = L2CAP_RX_STATE_WAIT_F;
-		break;
-	case L2CAP_MOVE_ROLE_RESPONDER:
-		chan->rx_state = L2CAP_RX_STATE_WAIT_P;
-		break;
-	}
-}
-
 static void l2cap_chan_ready(struct l2cap_chan *chan)
 {
 	/* The channel may have already been flagged as connected in
@@ -1505,10 +1405,7 @@ static void l2cap_le_start(struct l2cap_chan *chan)
 
 static void l2cap_start_connection(struct l2cap_chan *chan)
 {
-	if (__amp_capable(chan)) {
-		BT_DBG("chan %p AMP capable: discover AMPs", chan);
-		a2mp_discover_amp(chan);
-	} else if (chan->conn->hcon->type == LE_LINK) {
+	if (chan->conn->hcon->type == LE_LINK) {
 		l2cap_le_start(chan);
 	} else {
 		l2cap_send_conn_req(chan);
@@ -1611,11 +1508,6 @@ static void l2cap_send_disconn_req(struct l2cap_chan *chan, int err)
 		__clear_ack_timer(chan);
 	}
 
-	if (chan->scid == L2CAP_CID_A2MP) {
-		l2cap_state_change(chan, BT_DISCONN);
-		return;
-	}
-
 	req.dcid = cpu_to_le16(chan->dcid);
 	req.scid = cpu_to_le16(chan->scid);
 	l2cap_send_cmd(conn, l2cap_get_ident(conn), L2CAP_DISCONN_REQ,
@@ -1754,11 +1646,6 @@ static void l2cap_conn_ready(struct l2cap_conn *conn)
 
 		l2cap_chan_lock(chan);
 
-		if (chan->scid == L2CAP_CID_A2MP) {
-			l2cap_chan_unlock(chan);
-			continue;
-		}
-
 		if (hcon->type == LE_LINK) {
 			l2cap_le_start(chan);
 		} else if (chan->chan_type != L2CAP_CHAN_CONN_ORIENTED) {
@@ -2067,9 +1954,6 @@ static void l2cap_streaming_send(struct l2cap_chan *chan,
 
 	BT_DBG("chan %p, skbs %p", chan, skbs);
 
-	if (__chan_is_moving(chan))
-		return;
-
 	skb_queue_splice_tail_init(skbs, &chan->tx_q);
 
 	while (!skb_queue_empty(&chan->tx_q)) {
@@ -2112,9 +1996,6 @@ static int l2cap_ertm_send(struct l2cap_chan *chan)
 	if (test_bit(CONN_REMOTE_BUSY, &chan->conn_state))
 		return 0;
 
-	if (__chan_is_moving(chan))
-		return 0;
-
 	while (chan->tx_send_head &&
 	       chan->unacked_frames < chan->remote_tx_win &&
 	       chan->tx_state == L2CAP_TX_STATE_XMIT) {
@@ -2180,9 +2061,6 @@ static void l2cap_ertm_resend(struct l2cap_chan *chan)
 	if (test_bit(CONN_REMOTE_BUSY, &chan->conn_state))
 		return;
 
-	if (__chan_is_moving(chan))
-		return;
-
 	while (chan->retrans_list.head != L2CAP_SEQ_LIST_CLEAR) {
 		seq = l2cap_seq_list_pop(&chan->retrans_list);
 
@@ -2522,8 +2400,7 @@ static int l2cap_segment_sdu(struct l2cap_chan *chan,
 	pdu_len = chan->conn->mtu;
 
 	/* Constrain PDU size for BR/EDR connections */
-	if (!chan->hs_hcon)
-		pdu_len = min_t(size_t, pdu_len, L2CAP_BREDR_MAX_PAYLOAD);
+	pdu_len = min_t(size_t, pdu_len, L2CAP_BREDR_MAX_PAYLOAD);
 
 	/* Adjust for largest possible L2CAP overhead. */
 	if (chan->fcs)
@@ -3287,11 +3164,6 @@ int l2cap_ertm_init(struct l2cap_chan *chan)
 
 	skb_queue_head_init(&chan->tx_q);
 
-	chan->local_amp_id = AMP_ID_BREDR;
-	chan->move_id = AMP_ID_BREDR;
-	chan->move_state = L2CAP_MOVE_STABLE;
-	chan->move_role = L2CAP_MOVE_ROLE_NONE;
-
 	if (chan->mode != L2CAP_MODE_ERTM)
 		return 0;
 
@@ -3326,52 +3198,19 @@ static inline __u8 l2cap_select_mode(__u8 mode, __u16 remote_feat_mask)
 
 static inline bool __l2cap_ews_supported(struct l2cap_conn *conn)
 {
-	return ((conn->local_fixed_chan & L2CAP_FC_A2MP) &&
-		(conn->feat_mask & L2CAP_FEAT_EXT_WINDOW));
+	return (conn->feat_mask & L2CAP_FEAT_EXT_WINDOW);
 }
 
 static inline bool __l2cap_efs_supported(struct l2cap_conn *conn)
 {
-	return ((conn->local_fixed_chan & L2CAP_FC_A2MP) &&
-		(conn->feat_mask & L2CAP_FEAT_EXT_FLOW));
+	return (conn->feat_mask & L2CAP_FEAT_EXT_FLOW);
 }
 
 static void __l2cap_set_ertm_timeouts(struct l2cap_chan *chan,
 				      struct l2cap_conf_rfc *rfc)
 {
-	if (chan->local_amp_id != AMP_ID_BREDR && chan->hs_hcon) {
-		u64 ertm_to = chan->hs_hcon->hdev->amp_be_flush_to;
-
-		/* Class 1 devices have must have ERTM timeouts
-		 * exceeding the Link Supervision Timeout.  The
-		 * default Link Supervision Timeout for AMP
-		 * controllers is 10 seconds.
-		 *
-		 * Class 1 devices use 0xffffffff for their
-		 * best-effort flush timeout, so the clamping logic
-		 * will result in a timeout that meets the above
-		 * requirement.  ERTM timeouts are 16-bit values, so
-		 * the maximum timeout is 65.535 seconds.
-		 */
-
-		/* Convert timeout to milliseconds and round */
-		ertm_to = DIV_ROUND_UP_ULL(ertm_to, 1000);
-
-		/* This is the recommended formula for class 2 devices
-		 * that start ERTM timers when packets are sent to the
-		 * controller.
-		 */
-		ertm_to = 3 * ertm_to + 500;
-
-		if (ertm_to > 0xffff)
-			ertm_to = 0xffff;
-
-		rfc->retrans_timeout = cpu_to_le16((u16) ertm_to);
-		rfc->monitor_timeout = rfc->retrans_timeout;
-	} else {
-		rfc->retrans_timeout = cpu_to_le16(L2CAP_DEFAULT_RETRANS_TO);
-		rfc->monitor_timeout = cpu_to_le16(L2CAP_DEFAULT_MONITOR_TO);
-	}
+	rfc->retrans_timeout = cpu_to_le16(L2CAP_DEFAULT_RETRANS_TO);
+	rfc->monitor_timeout = cpu_to_le16(L2CAP_DEFAULT_MONITOR_TO);
 }
 
 static inline void l2cap_txwin_setup(struct l2cap_chan *chan)
@@ -3623,13 +3462,7 @@ static int l2cap_parse_conf_req(struct l2cap_chan *chan, void *data, size_t data
 		case L2CAP_CONF_EWS:
 			if (olen != 2)
 				break;
-			if (!(chan->conn->local_fixed_chan & L2CAP_FC_A2MP))
-				return -ECONNREFUSED;
-			set_bit(FLAG_EXT_CTRL, &chan->flags);
-			set_bit(CONF_EWS_RECV, &chan->conf_state);
-			chan->tx_win_max = L2CAP_DEFAULT_EXT_WINDOW;
-			chan->remote_tx_win = val;
-			break;
+			return -ECONNREFUSED;
 
 		default:
 			if (hint)
@@ -4027,11 +3860,7 @@ void __l2cap_connect_rsp_defer(struct l2cap_chan *chan)
 	rsp.dcid   = cpu_to_le16(chan->scid);
 	rsp.result = cpu_to_le16(L2CAP_CR_SUCCESS);
 	rsp.status = cpu_to_le16(L2CAP_CS_NO_INFO);
-
-	if (chan->hs_hcon)
-		rsp_code = L2CAP_CREATE_CHAN_RSP;
-	else
-		rsp_code = L2CAP_CONN_RSP;
+	rsp_code = L2CAP_CONN_RSP;
 
 	BT_DBG("chan %p rsp_code %u", chan, rsp_code);
 
@@ -4190,7 +4019,6 @@ static struct l2cap_chan *l2cap_connect(struct l2cap_conn *conn,
 	chan->dst_type = bdaddr_dst_type(conn->hcon);
 	chan->psm  = psm;
 	chan->dcid = scid;
-	chan->local_amp_id = amp_id;
 
 	__l2cap_chan_add(conn, chan);
 
@@ -4516,10 +4344,7 @@ static inline int l2cap_config_req(struct l2cap_conn *conn,
 		/* check compatibility */
 
 		/* Send rsp for BR/EDR channel */
-		if (!chan->hs_hcon)
-			l2cap_send_efs_conf_rsp(chan, rsp, cmd->ident, flags);
-		else
-			chan->ident = cmd->ident;
+		l2cap_send_efs_conf_rsp(chan, rsp, cmd->ident, flags);
 	}
 
 unlock:
@@ -4571,15 +4396,7 @@ static inline int l2cap_config_rsp(struct l2cap_conn *conn,
 				goto done;
 			}
 
-			if (!chan->hs_hcon) {
-				l2cap_send_efs_conf_rsp(chan, buf, cmd->ident,
-							0);
-			} else {
-				if (l2cap_check_efs(chan)) {
-					amp_create_logical_link(chan);
-					chan->ident = cmd->ident;
-				}
-			}
+			l2cap_send_efs_conf_rsp(chan, buf, cmd->ident, 0);
 		}
 		goto done;
 
@@ -4750,9 +4567,6 @@ static inline int l2cap_information_req(struct l2cap_conn *conn,
 		if (!disable_ertm)
 			feat_mask |= L2CAP_FEAT_ERTM | L2CAP_FEAT_STREAMING
 				| L2CAP_FEAT_FCS;
-		if (conn->local_fixed_chan & L2CAP_FC_A2MP)
-			feat_mask |= L2CAP_FEAT_EXT_FLOW
-				| L2CAP_FEAT_EXT_WINDOW;
 
 		put_unaligned_le32(feat_mask, rsp->data);
 		l2cap_send_cmd(conn, cmd->ident, L2CAP_INFO_RSP, sizeof(buf),
@@ -4841,751 +4655,6 @@ static inline int l2cap_information_rsp(struct l2cap_conn *conn,
 	return 0;
 }
 
-static int l2cap_create_channel_req(struct l2cap_conn *conn,
-				    struct l2cap_cmd_hdr *cmd,
-				    u16 cmd_len, void *data)
-{
-	struct l2cap_create_chan_req *req = data;
-	struct l2cap_create_chan_rsp rsp;
-	struct l2cap_chan *chan;
-	struct hci_dev *hdev;
-	u16 psm, scid;
-
-	if (cmd_len != sizeof(*req))
-		return -EPROTO;
-
-	if (!(conn->local_fixed_chan & L2CAP_FC_A2MP))
-		return -EINVAL;
-
-	psm = le16_to_cpu(req->psm);
-	scid = le16_to_cpu(req->scid);
-
-	BT_DBG("psm 0x%2.2x, scid 0x%4.4x, amp_id %d", psm, scid, req->amp_id);
-
-	/* For controller id 0 make BR/EDR connection */
-	if (req->amp_id == AMP_ID_BREDR) {
-		l2cap_connect(conn, cmd, data, L2CAP_CREATE_CHAN_RSP,
-			      req->amp_id);
-		return 0;
-	}
-
-	/* Validate AMP controller id */
-	hdev = hci_dev_get(req->amp_id);
-	if (!hdev)
-		goto error;
-
-	if (hdev->dev_type != HCI_AMP || !test_bit(HCI_UP, &hdev->flags)) {
-		hci_dev_put(hdev);
-		goto error;
-	}
-
-	chan = l2cap_connect(conn, cmd, data, L2CAP_CREATE_CHAN_RSP,
-			     req->amp_id);
-	if (chan) {
-		struct amp_mgr *mgr = conn->hcon->amp_mgr;
-		struct hci_conn *hs_hcon;
-
-		hs_hcon = hci_conn_hash_lookup_ba(hdev, AMP_LINK,
-						  &conn->hcon->dst);
-		if (!hs_hcon) {
-			hci_dev_put(hdev);
-			cmd_reject_invalid_cid(conn, cmd->ident, chan->scid,
-					       chan->dcid);
-			return 0;
-		}
-
-		BT_DBG("mgr %p bredr_chan %p hs_hcon %p", mgr, chan, hs_hcon);
-
-		mgr->bredr_chan = chan;
-		chan->hs_hcon = hs_hcon;
-		chan->fcs = L2CAP_FCS_NONE;
-		conn->mtu = hdev->block_mtu;
-	}
-
-	hci_dev_put(hdev);
-
-	return 0;
-
-error:
-	rsp.dcid = 0;
-	rsp.scid = cpu_to_le16(scid);
-	rsp.result = cpu_to_le16(L2CAP_CR_BAD_AMP);
-	rsp.status = cpu_to_le16(L2CAP_CS_NO_INFO);
-
-	l2cap_send_cmd(conn, cmd->ident, L2CAP_CREATE_CHAN_RSP,
-		       sizeof(rsp), &rsp);
-
-	return 0;
-}
-
-static void l2cap_send_move_chan_req(struct l2cap_chan *chan, u8 dest_amp_id)
-{
-	struct l2cap_move_chan_req req;
-	u8 ident;
-
-	BT_DBG("chan %p, dest_amp_id %d", chan, dest_amp_id);
-
-	ident = l2cap_get_ident(chan->conn);
-	chan->ident = ident;
-
-	req.icid = cpu_to_le16(chan->scid);
-	req.dest_amp_id = dest_amp_id;
-
-	l2cap_send_cmd(chan->conn, ident, L2CAP_MOVE_CHAN_REQ, sizeof(req),
-		       &req);
-
-	__set_chan_timer(chan, L2CAP_MOVE_TIMEOUT);
-}
-
-static void l2cap_send_move_chan_rsp(struct l2cap_chan *chan, u16 result)
-{
-	struct l2cap_move_chan_rsp rsp;
-
-	BT_DBG("chan %p, result 0x%4.4x", chan, result);
-
-	rsp.icid = cpu_to_le16(chan->dcid);
-	rsp.result = cpu_to_le16(result);
-
-	l2cap_send_cmd(chan->conn, chan->ident, L2CAP_MOVE_CHAN_RSP,
-		       sizeof(rsp), &rsp);
-}
-
-static void l2cap_send_move_chan_cfm(struct l2cap_chan *chan, u16 result)
-{
-	struct l2cap_move_chan_cfm cfm;
-
-	BT_DBG("chan %p, result 0x%4.4x", chan, result);
-
-	chan->ident = l2cap_get_ident(chan->conn);
-
-	cfm.icid = cpu_to_le16(chan->scid);
-	cfm.result = cpu_to_le16(result);
-
-	l2cap_send_cmd(chan->conn, chan->ident, L2CAP_MOVE_CHAN_CFM,
-		       sizeof(cfm), &cfm);
-
-	__set_chan_timer(chan, L2CAP_MOVE_TIMEOUT);
-}
-
-static void l2cap_send_move_chan_cfm_icid(struct l2cap_conn *conn, u16 icid)
-{
-	struct l2cap_move_chan_cfm cfm;
-
-	BT_DBG("conn %p, icid 0x%4.4x", conn, icid);
-
-	cfm.icid = cpu_to_le16(icid);
-	cfm.result = cpu_to_le16(L2CAP_MC_UNCONFIRMED);
-
-	l2cap_send_cmd(conn, l2cap_get_ident(conn), L2CAP_MOVE_CHAN_CFM,
-		       sizeof(cfm), &cfm);
-}
-
-static void l2cap_send_move_chan_cfm_rsp(struct l2cap_conn *conn, u8 ident,
-					 u16 icid)
-{
-	struct l2cap_move_chan_cfm_rsp rsp;
-
-	BT_DBG("icid 0x%4.4x", icid);
-
-	rsp.icid = cpu_to_le16(icid);
-	l2cap_send_cmd(conn, ident, L2CAP_MOVE_CHAN_CFM_RSP, sizeof(rsp), &rsp);
-}
-
-static void __release_logical_link(struct l2cap_chan *chan)
-{
-	chan->hs_hchan = NULL;
-	chan->hs_hcon = NULL;
-
-	/* Placeholder - release the logical link */
-}
-
-static void l2cap_logical_fail(struct l2cap_chan *chan)
-{
-	/* Logical link setup failed */
-	if (chan->state != BT_CONNECTED) {
-		/* Create channel failure, disconnect */
-		l2cap_send_disconn_req(chan, ECONNRESET);
-		return;
-	}
-
-	switch (chan->move_role) {
-	case L2CAP_MOVE_ROLE_RESPONDER:
-		l2cap_move_done(chan);
-		l2cap_send_move_chan_rsp(chan, L2CAP_MR_NOT_SUPP);
-		break;
-	case L2CAP_MOVE_ROLE_INITIATOR:
-		if (chan->move_state == L2CAP_MOVE_WAIT_LOGICAL_COMP ||
-		    chan->move_state == L2CAP_MOVE_WAIT_LOGICAL_CFM) {
-			/* Remote has only sent pending or
-			 * success responses, clean up
-			 */
-			l2cap_move_done(chan);
-		}
-
-		/* Other amp move states imply that the move
-		 * has already aborted
-		 */
-		l2cap_send_move_chan_cfm(chan, L2CAP_MC_UNCONFIRMED);
-		break;
-	}
-}
-
-static void l2cap_logical_finish_create(struct l2cap_chan *chan,
-					struct hci_chan *hchan)
-{
-	struct l2cap_conf_rsp rsp;
-
-	chan->hs_hchan = hchan;
-	chan->hs_hcon->l2cap_data = chan->conn;
-
-	l2cap_send_efs_conf_rsp(chan, &rsp, chan->ident, 0);
-
-	if (test_bit(CONF_INPUT_DONE, &chan->conf_state)) {
-		int err;
-
-		set_default_fcs(chan);
-
-		err = l2cap_ertm_init(chan);
-		if (err < 0)
-			l2cap_send_disconn_req(chan, -err);
-		else
-			l2cap_chan_ready(chan);
-	}
-}
-
-static void l2cap_logical_finish_move(struct l2cap_chan *chan,
-				      struct hci_chan *hchan)
-{
-	chan->hs_hcon = hchan->conn;
-	chan->hs_hcon->l2cap_data = chan->conn;
-
-	BT_DBG("move_state %d", chan->move_state);
-
-	switch (chan->move_state) {
-	case L2CAP_MOVE_WAIT_LOGICAL_COMP:
-		/* Move confirm will be sent after a success
-		 * response is received
-		 */
-		chan->move_state = L2CAP_MOVE_WAIT_RSP_SUCCESS;
-		break;
-	case L2CAP_MOVE_WAIT_LOGICAL_CFM:
-		if (test_bit(CONN_LOCAL_BUSY, &chan->conn_state)) {
-			chan->move_state = L2CAP_MOVE_WAIT_LOCAL_BUSY;
-		} else if (chan->move_role == L2CAP_MOVE_ROLE_INITIATOR) {
-			chan->move_state = L2CAP_MOVE_WAIT_CONFIRM_RSP;
-			l2cap_send_move_chan_cfm(chan, L2CAP_MC_CONFIRMED);
-		} else if (chan->move_role == L2CAP_MOVE_ROLE_RESPONDER) {
-			chan->move_state = L2CAP_MOVE_WAIT_CONFIRM;
-			l2cap_send_move_chan_rsp(chan, L2CAP_MR_SUCCESS);
-		}
-		break;
-	default:
-		/* Move was not in expected state, free the channel */
-		__release_logical_link(chan);
-
-		chan->move_state = L2CAP_MOVE_STABLE;
-	}
-}
-
-/* Call with chan locked */
-void l2cap_logical_cfm(struct l2cap_chan *chan, struct hci_chan *hchan,
-		       u8 status)
-{
-	BT_DBG("chan %p, hchan %p, status %d", chan, hchan, status);
-
-	if (status) {
-		l2cap_logical_fail(chan);
-		__release_logical_link(chan);
-		return;
-	}
-
-	if (chan->state != BT_CONNECTED) {
-		/* Ignore logical link if channel is on BR/EDR */
-		if (chan->local_amp_id != AMP_ID_BREDR)
-			l2cap_logical_finish_create(chan, hchan);
-	} else {
-		l2cap_logical_finish_move(chan, hchan);
-	}
-}
-
-void l2cap_move_start(struct l2cap_chan *chan)
-{
-	BT_DBG("chan %p", chan);
-
-	if (chan->local_amp_id == AMP_ID_BREDR) {
-		if (chan->chan_policy != BT_CHANNEL_POLICY_AMP_PREFERRED)
-			return;
-		chan->move_role = L2CAP_MOVE_ROLE_INITIATOR;
-		chan->move_state = L2CAP_MOVE_WAIT_PREPARE;
-		/* Placeholder - start physical link setup */
-	} else {
-		chan->move_role = L2CAP_MOVE_ROLE_INITIATOR;
-		chan->move_state = L2CAP_MOVE_WAIT_RSP_SUCCESS;
-		chan->move_id = 0;
-		l2cap_move_setup(chan);
-		l2cap_send_move_chan_req(chan, 0);
-	}
-}
-
-static void l2cap_do_create(struct l2cap_chan *chan, int result,
-			    u8 local_amp_id, u8 remote_amp_id)
-{
-	BT_DBG("chan %p state %s %u -> %u", chan, state_to_string(chan->state),
-	       local_amp_id, remote_amp_id);
-
-	chan->fcs = L2CAP_FCS_NONE;
-
-	/* Outgoing channel on AMP */
-	if (chan->state == BT_CONNECT) {
-		if (result == L2CAP_CR_SUCCESS) {
-			chan->local_amp_id = local_amp_id;
-			l2cap_send_create_chan_req(chan, remote_amp_id);
-		} else {
-			/* Revert to BR/EDR connect */
-			l2cap_send_conn_req(chan);
-		}
-
-		return;
-	}
-
-	/* Incoming channel on AMP */
-	if (__l2cap_no_conn_pending(chan)) {
-		struct l2cap_conn_rsp rsp;
-		char buf[128];
-		rsp.scid = cpu_to_le16(chan->dcid);
-		rsp.dcid = cpu_to_le16(chan->scid);
-
-		if (result == L2CAP_CR_SUCCESS) {
-			/* Send successful response */
-			rsp.result = cpu_to_le16(L2CAP_CR_SUCCESS);
-			rsp.status = cpu_to_le16(L2CAP_CS_NO_INFO);
-		} else {
-			/* Send negative response */
-			rsp.result = cpu_to_le16(L2CAP_CR_NO_MEM);
-			rsp.status = cpu_to_le16(L2CAP_CS_NO_INFO);
-		}
-
-		l2cap_send_cmd(chan->conn, chan->ident, L2CAP_CREATE_CHAN_RSP,
-			       sizeof(rsp), &rsp);
-
-		if (result == L2CAP_CR_SUCCESS) {
-			l2cap_state_change(chan, BT_CONFIG);
-			set_bit(CONF_REQ_SENT, &chan->conf_state);
-			l2cap_send_cmd(chan->conn, l2cap_get_ident(chan->conn),
-				       L2CAP_CONF_REQ,
-				       l2cap_build_conf_req(chan, buf, sizeof(buf)), buf);
-			chan->num_conf_req++;
-		}
-	}
-}
-
-static void l2cap_do_move_initiate(struct l2cap_chan *chan, u8 local_amp_id,
-				   u8 remote_amp_id)
-{
-	l2cap_move_setup(chan);
-	chan->move_id = local_amp_id;
-	chan->move_state = L2CAP_MOVE_WAIT_RSP;
-
-	l2cap_send_move_chan_req(chan, remote_amp_id);
-}
-
-static void l2cap_do_move_respond(struct l2cap_chan *chan, int result)
-{
-	struct hci_chan *hchan = NULL;
-
-	/* Placeholder - get hci_chan for logical link */
-
-	if (hchan) {
-		if (hchan->state == BT_CONNECTED) {
-			/* Logical link is ready to go */
-			chan->hs_hcon = hchan->conn;
-			chan->hs_hcon->l2cap_data = chan->conn;
-			chan->move_state = L2CAP_MOVE_WAIT_CONFIRM;
-			l2cap_send_move_chan_rsp(chan, L2CAP_MR_SUCCESS);
-
-			l2cap_logical_cfm(chan, hchan, L2CAP_MR_SUCCESS);
-		} else {
-			/* Wait for logical link to be ready */
-			chan->move_state = L2CAP_MOVE_WAIT_LOGICAL_CFM;
-		}
-	} else {
-		/* Logical link not available */
-		l2cap_send_move_chan_rsp(chan, L2CAP_MR_NOT_ALLOWED);
-	}
-}
-
-static void l2cap_do_move_cancel(struct l2cap_chan *chan, int result)
-{
-	if (chan->move_role == L2CAP_MOVE_ROLE_RESPONDER) {
-		u8 rsp_result;
-		if (result == -EINVAL)
-			rsp_result = L2CAP_MR_BAD_ID;
-		else
-			rsp_result = L2CAP_MR_NOT_ALLOWED;
-
-		l2cap_send_move_chan_rsp(chan, rsp_result);
-	}
-
-	chan->move_role = L2CAP_MOVE_ROLE_NONE;
-	chan->move_state = L2CAP_MOVE_STABLE;
-
-	/* Restart data transmission */
-	l2cap_ertm_send(chan);
-}
-
-/* Invoke with locked chan */
-void __l2cap_physical_cfm(struct l2cap_chan *chan, int result)
-{
-	u8 local_amp_id = chan->local_amp_id;
-	u8 remote_amp_id = chan->remote_amp_id;
-
-	BT_DBG("chan %p, result %d, local_amp_id %d, remote_amp_id %d",
-	       chan, result, local_amp_id, remote_amp_id);
-
-	if (chan->state == BT_DISCONN || chan->state == BT_CLOSED)
-		return;
-
-	if (chan->state != BT_CONNECTED) {
-		l2cap_do_create(chan, result, local_amp_id, remote_amp_id);
-	} else if (result != L2CAP_MR_SUCCESS) {
-		l2cap_do_move_cancel(chan, result);
-	} else {
-		switch (chan->move_role) {
-		case L2CAP_MOVE_ROLE_INITIATOR:
-			l2cap_do_move_initiate(chan, local_amp_id,
-					       remote_amp_id);
-			break;
-		case L2CAP_MOVE_ROLE_RESPONDER:
-			l2cap_do_move_respond(chan, result);
-			break;
-		default:
-			l2cap_do_move_cancel(chan, result);
-			break;
-		}
-	}
-}
-
-static inline int l2cap_move_channel_req(struct l2cap_conn *conn,
-					 struct l2cap_cmd_hdr *cmd,
-					 u16 cmd_len, void *data)
-{
-	struct l2cap_move_chan_req *req = data;
-	struct l2cap_move_chan_rsp rsp;
-	struct l2cap_chan *chan;
-	u16 icid = 0;
-	u16 result = L2CAP_MR_NOT_ALLOWED;
-
-	if (cmd_len != sizeof(*req))
-		return -EPROTO;
-
-	icid = le16_to_cpu(req->icid);
-
-	BT_DBG("icid 0x%4.4x, dest_amp_id %d", icid, req->dest_amp_id);
-
-	if (!(conn->local_fixed_chan & L2CAP_FC_A2MP))
-		return -EINVAL;
-
-	chan = l2cap_get_chan_by_dcid(conn, icid);
-	if (!chan) {
-		rsp.icid = cpu_to_le16(icid);
-		rsp.result = cpu_to_le16(L2CAP_MR_NOT_ALLOWED);
-		l2cap_send_cmd(conn, cmd->ident, L2CAP_MOVE_CHAN_RSP,
-			       sizeof(rsp), &rsp);
-		return 0;
-	}
-
-	chan->ident = cmd->ident;
-
-	if (chan->scid < L2CAP_CID_DYN_START ||
-	    chan->chan_policy == BT_CHANNEL_POLICY_BREDR_ONLY ||
-	    (chan->mode != L2CAP_MODE_ERTM &&
-	     chan->mode != L2CAP_MODE_STREAMING)) {
-		result = L2CAP_MR_NOT_ALLOWED;
-		goto send_move_response;
-	}
-
-	if (chan->local_amp_id == req->dest_amp_id) {
-		result = L2CAP_MR_SAME_ID;
-		goto send_move_response;
-	}
-
-	if (req->dest_amp_id != AMP_ID_BREDR) {
-		struct hci_dev *hdev;
-		hdev = hci_dev_get(req->dest_amp_id);
-		if (!hdev || hdev->dev_type != HCI_AMP ||
-		    !test_bit(HCI_UP, &hdev->flags)) {
-			if (hdev)
-				hci_dev_put(hdev);
-
-			result = L2CAP_MR_BAD_ID;
-			goto send_move_response;
-		}
-		hci_dev_put(hdev);
-	}
-
-	/* Detect a move collision.  Only send a collision response
-	 * if this side has "lost", otherwise proceed with the move.
-	 * The winner has the larger bd_addr.
-	 */
-	if ((__chan_is_moving(chan) ||
-	     chan->move_role != L2CAP_MOVE_ROLE_NONE) &&
-	    bacmp(&conn->hcon->src, &conn->hcon->dst) > 0) {
-		result = L2CAP_MR_COLLISION;
-		goto send_move_response;
-	}
-
-	chan->move_role = L2CAP_MOVE_ROLE_RESPONDER;
-	l2cap_move_setup(chan);
-	chan->move_id = req->dest_amp_id;
-
-	if (req->dest_amp_id == AMP_ID_BREDR) {
-		/* Moving to BR/EDR */
-		if (test_bit(CONN_LOCAL_BUSY, &chan->conn_state)) {
-			chan->move_state = L2CAP_MOVE_WAIT_LOCAL_BUSY;
-			result = L2CAP_MR_PEND;
-		} else {
-			chan->move_state = L2CAP_MOVE_WAIT_CONFIRM;
-			result = L2CAP_MR_SUCCESS;
-		}
-	} else {
-		chan->move_state = L2CAP_MOVE_WAIT_PREPARE;
-		/* Placeholder - uncomment when amp functions are available */
-		/*amp_accept_physical(chan, req->dest_amp_id);*/
-		result = L2CAP_MR_PEND;
-	}
-
-send_move_response:
-	l2cap_send_move_chan_rsp(chan, result);
-
-	l2cap_chan_unlock(chan);
-	l2cap_chan_put(chan);
-
-	return 0;
-}
-
-static void l2cap_move_continue(struct l2cap_conn *conn, u16 icid, u16 result)
-{
-	struct l2cap_chan *chan;
-	struct hci_chan *hchan = NULL;
-
-	chan = l2cap_get_chan_by_scid(conn, icid);
-	if (!chan) {
-		l2cap_send_move_chan_cfm_icid(conn, icid);
-		return;
-	}
-
-	__clear_chan_timer(chan);
-	if (result == L2CAP_MR_PEND)
-		__set_chan_timer(chan, L2CAP_MOVE_ERTX_TIMEOUT);
-
-	switch (chan->move_state) {
-	case L2CAP_MOVE_WAIT_LOGICAL_COMP:
-		/* Move confirm will be sent when logical link
-		 * is complete.
-		 */
-		chan->move_state = L2CAP_MOVE_WAIT_LOGICAL_CFM;
-		break;
-	case L2CAP_MOVE_WAIT_RSP_SUCCESS:
-		if (result == L2CAP_MR_PEND) {
-			break;
-		} else if (test_bit(CONN_LOCAL_BUSY,
-				    &chan->conn_state)) {
-			chan->move_state = L2CAP_MOVE_WAIT_LOCAL_BUSY;
-		} else {
-			/* Logical link is up or moving to BR/EDR,
-			 * proceed with move
-			 */
-			chan->move_state = L2CAP_MOVE_WAIT_CONFIRM_RSP;
-			l2cap_send_move_chan_cfm(chan, L2CAP_MC_CONFIRMED);
-		}
-		break;
-	case L2CAP_MOVE_WAIT_RSP:
-		/* Moving to AMP */
-		if (result == L2CAP_MR_SUCCESS) {
-			/* Remote is ready, send confirm immediately
-			 * after logical link is ready
-			 */
-			chan->move_state = L2CAP_MOVE_WAIT_LOGICAL_CFM;
-		} else {
-			/* Both logical link and move success
-			 * are required to confirm
-			 */
-			chan->move_state = L2CAP_MOVE_WAIT_LOGICAL_COMP;
-		}
-
-		/* Placeholder - get hci_chan for logical link */
-		if (!hchan) {
-			/* Logical link not available */
-			l2cap_send_move_chan_cfm(chan, L2CAP_MC_UNCONFIRMED);
-			break;
-		}
-
-		/* If the logical link is not yet connected, do not
-		 * send confirmation.
-		 */
-		if (hchan->state != BT_CONNECTED)
-			break;
-
-		/* Logical link is already ready to go */
-
-		chan->hs_hcon = hchan->conn;
-		chan->hs_hcon->l2cap_data = chan->conn;
-
-		if (result == L2CAP_MR_SUCCESS) {
-			/* Can confirm now */
-			l2cap_send_move_chan_cfm(chan, L2CAP_MC_CONFIRMED);
-		} else {
-			/* Now only need move success
-			 * to confirm
-			 */
-			chan->move_state = L2CAP_MOVE_WAIT_RSP_SUCCESS;
-		}
-
-		l2cap_logical_cfm(chan, hchan, L2CAP_MR_SUCCESS);
-		break;
-	default:
-		/* Any other amp move state means the move failed. */
-		chan->move_id = chan->local_amp_id;
-		l2cap_move_done(chan);
-		l2cap_send_move_chan_cfm(chan, L2CAP_MC_UNCONFIRMED);
-	}
-
-	l2cap_chan_unlock(chan);
-	l2cap_chan_put(chan);
-}
-
-static void l2cap_move_fail(struct l2cap_conn *conn, u8 ident, u16 icid,
-			    u16 result)
-{
-	struct l2cap_chan *chan;
-
-	chan = l2cap_get_chan_by_ident(conn, ident);
-	if (!chan) {
-		/* Could not locate channel, icid is best guess */
-		l2cap_send_move_chan_cfm_icid(conn, icid);
-		return;
-	}
-
-	__clear_chan_timer(chan);
-
-	if (chan->move_role == L2CAP_MOVE_ROLE_INITIATOR) {
-		if (result == L2CAP_MR_COLLISION) {
-			chan->move_role = L2CAP_MOVE_ROLE_RESPONDER;
-		} else {
-			/* Cleanup - cancel move */
-			chan->move_id = chan->local_amp_id;
-			l2cap_move_done(chan);
-		}
-	}
-
-	l2cap_send_move_chan_cfm(chan, L2CAP_MC_UNCONFIRMED);
-
-	l2cap_chan_unlock(chan);
-	l2cap_chan_put(chan);
-}
-
-static int l2cap_move_channel_rsp(struct l2cap_conn *conn,
-				  struct l2cap_cmd_hdr *cmd,
-				  u16 cmd_len, void *data)
-{
-	struct l2cap_move_chan_rsp *rsp = data;
-	u16 icid, result;
-
-	if (cmd_len != sizeof(*rsp))
-		return -EPROTO;
-
-	icid = le16_to_cpu(rsp->icid);
-	result = le16_to_cpu(rsp->result);
-
-	BT_DBG("icid 0x%4.4x, result 0x%4.4x", icid, result);
-
-	if (result == L2CAP_MR_SUCCESS || result == L2CAP_MR_PEND)
-		l2cap_move_continue(conn, icid, result);
-	else
-		l2cap_move_fail(conn, cmd->ident, icid, result);
-
-	return 0;
-}
-
-static int l2cap_move_channel_confirm(struct l2cap_conn *conn,
-				      struct l2cap_cmd_hdr *cmd,
-				      u16 cmd_len, void *data)
-{
-	struct l2cap_move_chan_cfm *cfm = data;
-	struct l2cap_chan *chan;
-	u16 icid, result;
-
-	if (cmd_len != sizeof(*cfm))
-		return -EPROTO;
-
-	icid = le16_to_cpu(cfm->icid);
-	result = le16_to_cpu(cfm->result);
-
-	BT_DBG("icid 0x%4.4x, result 0x%4.4x", icid, result);
-
-	chan = l2cap_get_chan_by_dcid(conn, icid);
-	if (!chan) {
-		/* Spec requires a response even if the icid was not found */
-		l2cap_send_move_chan_cfm_rsp(conn, cmd->ident, icid);
-		return 0;
-	}
-
-	if (chan->move_state == L2CAP_MOVE_WAIT_CONFIRM) {
-		if (result == L2CAP_MC_CONFIRMED) {
-			chan->local_amp_id = chan->move_id;
-			if (chan->local_amp_id == AMP_ID_BREDR)
-				__release_logical_link(chan);
-		} else {
-			chan->move_id = chan->local_amp_id;
-		}
-
-		l2cap_move_done(chan);
-	}
-
-	l2cap_send_move_chan_cfm_rsp(conn, cmd->ident, icid);
-
-	l2cap_chan_unlock(chan);
-	l2cap_chan_put(chan);
-
-	return 0;
-}
-
-static inline int l2cap_move_channel_confirm_rsp(struct l2cap_conn *conn,
-						 struct l2cap_cmd_hdr *cmd,
-						 u16 cmd_len, void *data)
-{
-	struct l2cap_move_chan_cfm_rsp *rsp = data;
-	struct l2cap_chan *chan;
-	u16 icid;
-
-	if (cmd_len != sizeof(*rsp))
-		return -EPROTO;
-
-	icid = le16_to_cpu(rsp->icid);
-
-	BT_DBG("icid 0x%4.4x", icid);
-
-	chan = l2cap_get_chan_by_scid(conn, icid);
-	if (!chan)
-		return 0;
-
-	__clear_chan_timer(chan);
-
-	if (chan->move_state == L2CAP_MOVE_WAIT_CONFIRM_RSP) {
-		chan->local_amp_id = chan->move_id;
-
-		if (chan->local_amp_id == AMP_ID_BREDR && chan->hs_hchan)
-			__release_logical_link(chan);
-
-		l2cap_move_done(chan);
-	}
-
-	l2cap_chan_unlock(chan);
-	l2cap_chan_put(chan);
-
-	return 0;
-}
-
 static inline int l2cap_conn_param_update_req(struct l2cap_conn *conn,
 					      struct l2cap_cmd_hdr *cmd,
 					      u16 cmd_len, u8 *data)
@@ -5745,7 +4814,6 @@ static inline int l2cap_bredr_sig_cmd(struct l2cap_conn *conn,
 		break;
 
 	case L2CAP_CONN_RSP:
-	case L2CAP_CREATE_CHAN_RSP:
 		l2cap_connect_create_rsp(conn, cmd, cmd_len, data);
 		break;
 
@@ -5780,26 +4848,6 @@ static inline int l2cap_bredr_sig_cmd(struct l2cap_conn *conn,
 		l2cap_information_rsp(conn, cmd, cmd_len, data);
 		break;
 
-	case L2CAP_CREATE_CHAN_REQ:
-		err = l2cap_create_channel_req(conn, cmd, cmd_len, data);
-		break;
-
-	case L2CAP_MOVE_CHAN_REQ:
-		err = l2cap_move_channel_req(conn, cmd, cmd_len, data);
-		break;
-
-	case L2CAP_MOVE_CHAN_RSP:
-		l2cap_move_channel_rsp(conn, cmd, cmd_len, data);
-		break;
-
-	case L2CAP_MOVE_CHAN_CFM:
-		err = l2cap_move_channel_confirm(conn, cmd, cmd_len, data);
-		break;
-
-	case L2CAP_MOVE_CHAN_CFM_RSP:
-		l2cap_move_channel_confirm_rsp(conn, cmd, cmd_len, data);
-		break;
-
 	default:
 		BT_ERR("Unknown BR/EDR signaling command 0x%2.2x", cmd->code);
 		err = -EINVAL;
@@ -7051,8 +6099,8 @@ static int l2cap_rx_state_recv(struct l2cap_chan *chan,
 		if (control->final) {
 			clear_bit(CONN_REMOTE_BUSY, &chan->conn_state);
 
-			if (!test_and_clear_bit(CONN_REJ_ACT, &chan->conn_state) &&
-			    !__chan_is_moving(chan)) {
+			if (!test_and_clear_bit(CONN_REJ_ACT,
+						&chan->conn_state)) {
 				control->final = 0;
 				l2cap_retransmit_all(chan, control);
 			}
@@ -7245,11 +6293,7 @@ static int l2cap_finish_move(struct l2cap_chan *chan)
 	BT_DBG("chan %p", chan);
 
 	chan->rx_state = L2CAP_RX_STATE_RECV;
-
-	if (chan->hs_hcon)
-		chan->conn->mtu = chan->hs_hcon->hdev->block_mtu;
-	else
-		chan->conn->mtu = chan->conn->hcon->hdev->acl_mtu;
+	chan->conn->mtu = chan->conn->hcon->hdev->acl_mtu;
 
 	return l2cap_resegment(chan);
 }
@@ -7316,11 +6360,7 @@ static int l2cap_rx_state_wait_f(struct l2cap_chan *chan,
 	 */
 	chan->next_tx_seq = control->reqseq;
 	chan->unacked_frames = 0;
-
-	if (chan->hs_hcon)
-		chan->conn->mtu = chan->hs_hcon->hdev->block_mtu;
-	else
-		chan->conn->mtu = chan->conn->hcon->hdev->acl_mtu;
+	chan->conn->mtu = chan->conn->hcon->hdev->acl_mtu;
 
 	err = l2cap_resegment(chan);
 
@@ -7672,21 +6712,10 @@ static void l2cap_data_channel(struct l2cap_conn *conn, u16 cid,
 
 	chan = l2cap_get_chan_by_scid(conn, cid);
 	if (!chan) {
-		if (cid == L2CAP_CID_A2MP) {
-			chan = a2mp_channel_create(conn, skb);
-			if (!chan) {
-				kfree_skb(skb);
-				return;
-			}
-
-			l2cap_chan_hold(chan);
-			l2cap_chan_lock(chan);
-		} else {
-			BT_DBG("unknown cid 0x%4.4x", cid);
-			/* Drop packet and return */
-			kfree_skb(skb);
-			return;
-		}
+		BT_DBG("unknown cid 0x%4.4x", cid);
+		/* Drop packet and return */
+		kfree_skb(skb);
+		return;
 	}
 
 	BT_DBG("chan %p, len %d", chan, skb->len);
@@ -7887,10 +6916,6 @@ static struct l2cap_conn *l2cap_conn_add(struct hci_conn *hcon)
 
 	conn->local_fixed_chan = L2CAP_FC_SIG_BREDR | L2CAP_FC_CONNLESS;
 
-	if (hcon->type == ACL_LINK &&
-	    hci_dev_test_flag(hcon->hdev, HCI_HS_ENABLED))
-		conn->local_fixed_chan |= L2CAP_FC_A2MP;
-
 	if (hci_dev_test_flag(hcon->hdev, HCI_LE_ENABLED) &&
 	    (bredr_sc_enabled(hcon->hdev) ||
 	     hci_dev_test_flag(hcon->hdev, HCI_FORCE_BREDR_SMP)))
@@ -8355,11 +7380,6 @@ static void l2cap_security_cfm(struct hci_conn *hcon, u8 status, u8 encrypt)
 		BT_DBG("chan %p scid 0x%4.4x state %s", chan, chan->scid,
 		       state_to_string(chan->state));
 
-		if (chan->scid == L2CAP_CID_A2MP) {
-			l2cap_chan_unlock(chan);
-			continue;
-		}
-
 		if (!status && encrypt)
 			chan->sec_level = hcon->sec_level;
 
diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index e50d3d102078..ee7a41d6994f 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1027,23 +1027,7 @@ static int l2cap_sock_setsockopt(struct socket *sock, int level, int optname,
 			break;
 		}
 
-		if (opt > BT_CHANNEL_POLICY_AMP_PREFERRED) {
-			err = -EINVAL;
-			break;
-		}
-
-		if (chan->mode != L2CAP_MODE_ERTM &&
-		    chan->mode != L2CAP_MODE_STREAMING) {
-			err = -EOPNOTSUPP;
-			break;
-		}
-
-		chan->chan_policy = (u8) opt;
-
-		if (sk->sk_state == BT_CONNECTED &&
-		    chan->move_role == L2CAP_MOVE_ROLE_NONE)
-			l2cap_move_start(chan);
-
+		err = -EOPNOTSUPP;
 		break;
 
 	case BT_SNDMTU:
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 211da120ff12..5d3f5e9c74f2 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -835,8 +835,6 @@ static u32 get_supported_settings(struct hci_dev *hdev)
 
 		if (lmp_ssp_capable(hdev)) {
 			settings |= MGMT_SETTING_SSP;
-			if (IS_ENABLED(CONFIG_BT_HS))
-				settings |= MGMT_SETTING_HS;
 		}
 
 		if (lmp_sc_capable(hdev))
@@ -901,9 +899,6 @@ static u32 get_current_settings(struct hci_dev *hdev)
 	if (hci_dev_test_flag(hdev, HCI_SSP_ENABLED))
 		settings |= MGMT_SETTING_SSP;
 
-	if (hci_dev_test_flag(hdev, HCI_HS_ENABLED))
-		settings |= MGMT_SETTING_HS;
-
 	if (hci_dev_test_flag(hdev, HCI_ADVERTISING))
 		settings |= MGMT_SETTING_ADVERTISING;
 
@@ -1938,7 +1933,6 @@ static void set_ssp_complete(struct hci_dev *hdev, void *data, int err)
 
 		if (enable && hci_dev_test_and_clear_flag(hdev,
 							  HCI_SSP_ENABLED)) {
-			hci_dev_clear_flag(hdev, HCI_HS_ENABLED);
 			new_settings(hdev, NULL);
 		}
 
@@ -1951,12 +1945,6 @@ static void set_ssp_complete(struct hci_dev *hdev, void *data, int err)
 		changed = !hci_dev_test_and_set_flag(hdev, HCI_SSP_ENABLED);
 	} else {
 		changed = hci_dev_test_and_clear_flag(hdev, HCI_SSP_ENABLED);
-
-		if (!changed)
-			changed = hci_dev_test_and_clear_flag(hdev,
-							      HCI_HS_ENABLED);
-		else
-			hci_dev_clear_flag(hdev, HCI_HS_ENABLED);
 	}
 
 	mgmt_pending_foreach(MGMT_OP_SET_SSP, hdev, settings_rsp, &match);
@@ -2020,11 +2008,6 @@ static int set_ssp(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 		} else {
 			changed = hci_dev_test_and_clear_flag(hdev,
 							      HCI_SSP_ENABLED);
-			if (!changed)
-				changed = hci_dev_test_and_clear_flag(hdev,
-								      HCI_HS_ENABLED);
-			else
-				hci_dev_clear_flag(hdev, HCI_HS_ENABLED);
 		}
 
 		err = send_settings_rsp(sk, MGMT_OP_SET_SSP, hdev);
@@ -2070,63 +2053,10 @@ static int set_ssp(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 
 static int set_hs(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 {
-	struct mgmt_mode *cp = data;
-	bool changed;
-	u8 status;
-	int err;
-
 	bt_dev_dbg(hdev, "sock %p", sk);
 
-	if (!IS_ENABLED(CONFIG_BT_HS))
-		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_HS,
+	return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_HS,
 				       MGMT_STATUS_NOT_SUPPORTED);
-
-	status = mgmt_bredr_support(hdev);
-	if (status)
-		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_HS, status);
-
-	if (!lmp_ssp_capable(hdev))
-		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_HS,
-				       MGMT_STATUS_NOT_SUPPORTED);
-
-	if (!hci_dev_test_flag(hdev, HCI_SSP_ENABLED))
-		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_HS,
-				       MGMT_STATUS_REJECTED);
-
-	if (cp->val != 0x00 && cp->val != 0x01)
-		return mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_HS,
-				       MGMT_STATUS_INVALID_PARAMS);
-
-	hci_dev_lock(hdev);
-
-	if (pending_find(MGMT_OP_SET_SSP, hdev)) {
-		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_HS,
-				      MGMT_STATUS_BUSY);
-		goto unlock;
-	}
-
-	if (cp->val) {
-		changed = !hci_dev_test_and_set_flag(hdev, HCI_HS_ENABLED);
-	} else {
-		if (hdev_is_powered(hdev)) {
-			err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_SET_HS,
-					      MGMT_STATUS_REJECTED);
-			goto unlock;
-		}
-
-		changed = hci_dev_test_and_clear_flag(hdev, HCI_HS_ENABLED);
-	}
-
-	err = send_settings_rsp(sk, MGMT_OP_SET_HS, hdev);
-	if (err < 0)
-		goto unlock;
-
-	if (changed)
-		err = new_settings(hdev, sk);
-
-unlock:
-	hci_dev_unlock(hdev);
-	return err;
 }
 
 static void set_le_complete(struct hci_dev *hdev, void *data, int err)
@@ -6774,7 +6704,6 @@ static int set_bredr(struct sock *sk, struct hci_dev *hdev, void *data, u16 len)
 			hci_dev_clear_flag(hdev, HCI_SSP_ENABLED);
 			hci_dev_clear_flag(hdev, HCI_LINK_SECURITY);
 			hci_dev_clear_flag(hdev, HCI_FAST_CONNECTABLE);
-			hci_dev_clear_flag(hdev, HCI_HS_ENABLED);
 		}
 
 		hci_dev_change_flag(hdev, HCI_BREDR_ENABLED);
-- 
2.43.0


