Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B6C40D044
	for <lists+linux-bluetooth@lfdr.de>; Thu, 16 Sep 2021 01:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbhIOXh0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Sep 2021 19:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbhIOXhY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Sep 2021 19:37:24 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701DCC061574
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Sep 2021 16:36:05 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id il14-20020a17090b164e00b0019c7a7c362dso416464pjb.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Sep 2021 16:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L0h86E9j0CfNSSJWMBPeikGzGgwSYkBSG+0Bm1Cw7vc=;
        b=Il/3T4HPLaw5S/9RzzXx2rqOWXy0VEqbF77gAuV2Y8Tq/cgahoQTrw8IO9HYI4Je1k
         0IZtPQ+Z16tPRY9KMlFBkhlorcmUcqPD1+LCVi/CpVsC15nriwSraiIBMTtMTyyeUdOv
         nuG197JAwQmc9w0OxAz0p8kSCAWQ8VnLvkZAU0ope2dXOp2tbywQYEgWdbv25jEJqGaq
         gLXIQI6f/j7t4QKbdGVhTHWkMSGObiTjSztHKlUfyrl3SHwdMqfL01dGbKIo/04fqKgB
         qUeFN2jc5ingRyDwW9nPNQ5FHyQQiVawYpSmsRPspvFog4G+NAysPwlpXJF0NwnnLVob
         gmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L0h86E9j0CfNSSJWMBPeikGzGgwSYkBSG+0Bm1Cw7vc=;
        b=UXyt2QEczsRREoVzItCUluKIuRGVPlJrriMOnU+BS759aHCLtgxZy15RANt6/dJK8Y
         RJG+SugNHYWobyhoqx/OT8HSiv77wa2f41r7SK/Wuvf3n8RSkfgDzg0Od+J/Q1Axn/of
         NEUKCswANmWs1WSTDwOdcKZz+O3QdMrSD6wHbltNOlEUK16b0BOHmr7xbSj/zMh15Qea
         /yp2m+Ib8PBEk93o2eYL10lol3HQcnD4AG7xZUNHhG9vY5SNaEXLoUmzmJRSaiC/54tj
         mD9zLVQAeSq1XTy16EKqHqIwpU/cO0bMRbz7oQ6VXfrCY6fNps8r+RujNSBMNH0XnDCp
         ZbKw==
X-Gm-Message-State: AOAM531hlXhuK7k1c7KD4rIhXuNLfMcv06k7jo/pePIKhMUKPSwBF50r
        OZ+yT8IXuTFkzSw6gwBEsQKSxxXXI40=
X-Google-Smtp-Source: ABdhPJx6ZyPy3sGk1qcmmXYMXW2CSP5mZIgjXaPdGnimEaOtmmgm1SQLRJVrGj+GO1m7+BTPgPDyWg==
X-Received: by 2002:a17:902:650b:b0:13a:123a:4ef9 with SMTP id b11-20020a170902650b00b0013a123a4ef9mr1862458plk.49.1631748964694;
        Wed, 15 Sep 2021 16:36:04 -0700 (PDT)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id x13sm890980pff.70.2021.09.15.16.36.04
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 16:36:04 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v4 4/4] Bluetooth: SCO: Fix sco_send_frame returning skb->len
Date:   Wed, 15 Sep 2021 16:36:00 -0700
Message-Id: <20210915233600.4129808-4-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915233600.4129808-1-luiz.dentz@gmail.com>
References: <20210915233600.4129808-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

The skb in modified by hci_send_sco which pushes SCO headers thus
changing skb->len causing sco_sock_sendmsg to fail.

Fixes: 0771cbb3b97d ("Bluetooth: SCO: Replace use of memcpy_from_msg with bt_skb_sendmsg")
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/sco.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/sco.c b/net/bluetooth/sco.c
index f51399d1b9cb..8eabf41b2993 100644
--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -284,16 +284,17 @@ static int sco_connect(struct hci_dev *hdev, struct sock *sk)
 static int sco_send_frame(struct sock *sk, struct sk_buff *skb)
 {
 	struct sco_conn *conn = sco_pi(sk)->conn;
+	int len = skb->len;
 
 	/* Check outgoing MTU */
-	if (skb->len > conn->mtu)
+	if (len > conn->mtu)
 		return -EINVAL;
 
-	BT_DBG("sk %p len %d", sk, skb->len);
+	BT_DBG("sk %p len %d", sk, len);
 
 	hci_send_sco(conn->hcon, skb);
 
-	return skb->len;
+	return len;
 }
 
 static void sco_recv_frame(struct sco_conn *conn, struct sk_buff *skb)
@@ -744,7 +745,8 @@ static int sco_sock_sendmsg(struct socket *sock, struct msghdr *msg,
 		err = -ENOTCONN;
 
 	release_sock(sk);
-	if (err)
+
+	if (err < 0)
 		kfree_skb(skb);
 	return err;
 }
-- 
2.31.1

