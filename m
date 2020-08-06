Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0F123E097
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Aug 2020 20:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbgHFSgL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 6 Aug 2020 14:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbgHFSfZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 6 Aug 2020 14:35:25 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F73C061757
        for <linux-bluetooth@vger.kernel.org>; Thu,  6 Aug 2020 11:17:16 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ep8so7108330pjb.3
        for <linux-bluetooth@vger.kernel.org>; Thu, 06 Aug 2020 11:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=a5pUTcsTuja48kdMdKoSv+A/cIC8t1yvGUP8/DdcotE=;
        b=MMjlIBVWWTQQ3RIngn7E6idE5SPekvRCXvV2xLkYOgLBUFLR61s6w824aVaSrmTeK4
         9F6sB/q8sdR6KZySkYJuzbBs+x9bhbRJF9LnPJlM4lyL+Rgr+t400nCUDriLPLD+mDXP
         gIn/wKHVIZk+7mvDuMTaViwk4zNj5LjssTmKzaOgR2ivVpntjf46rgwGV/6bc0s/xjle
         9RP5oGi10oywctt8zz+uuk2Y2j39ANj6rinS6A/ney3On0DUiszg8lCaUWLrkukdmY9J
         KPU1MG/NRWNAIvCsrC9y2pzntAU6y6Yj1Fd7VKrPxIa5gHaoAWKv5sMPstiPvbVupD5C
         QQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a5pUTcsTuja48kdMdKoSv+A/cIC8t1yvGUP8/DdcotE=;
        b=eRSMSv+c50xpChmb5mYR32q1kaOodLrOkBDdvcyc47ctx1eN8IxILutjV1FL0M3Em9
         C53Z7Kqu90nWk4XoiW9+3m/dD/2GGwVYWOKdPGYH5/nsd7KQiRrILMeETI2fbiatpqn/
         sqxmTOROpt2Aq6rKooynvjWO9ViES81TjH/4XE/0Zy/IrRnkMgpuWDjR37XsGkBIK7Hz
         B0+tsbko24XisPuaHrtDfpoOsQgYeRwtNLKDTfaMNaWIGWJ3i7DBTNbu8sXbm4cTcYxo
         NxhIlmlh5c7iVXbM5fLP3ohCFbbMjE3HrwRgfv5iqATP3Nk/qAgy6pn+yCqQblbSoS1g
         N7lw==
X-Gm-Message-State: AOAM5332DWk1ZYJ7SEHOoREQFftLb3qYYdzVmx3Ie6K6vRjteb1V22Fa
        pzpsifT+lSiZM3M9Oj0F3UeVfPRq
X-Google-Smtp-Source: ABdhPJwxIapyQC4EdrIjwo22RpaSdy2Q0wlWXsZydn7RF+sxTwHcXR3pvSoF37DeGFxFVt1+sfr7tA==
X-Received: by 2002:a17:902:8643:: with SMTP id y3mr8974426plt.199.1596737835197;
        Thu, 06 Aug 2020 11:17:15 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id o16sm10341078pfu.188.2020.08.06.11.17.14
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 11:17:14 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 2/4] Bluetooth: L2CAP: Fix calling sk_filter on non-socket based channel
Date:   Thu,  6 Aug 2020 11:17:12 -0700
Message-Id: <20200806181714.3216076-2-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200806181714.3216076-1-luiz.dentz@gmail.com>
References: <20200806181714.3216076-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Only sockets will have the chan->data set to an actual sk, channels
like A2MP would have its own data which would likely cause a crash when
calling sk_filter, in order to fix this a new callback has been
introduced so channels can implement their own filtering if necessary.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/l2cap.h |  2 ++
 net/bluetooth/l2cap_core.c    |  7 ++++---
 net/bluetooth/l2cap_sock.c    | 14 ++++++++++++++
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index bc5e9fbc3853..61800a7b6192 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -666,6 +666,8 @@ struct l2cap_ops {
 	struct sk_buff		*(*alloc_skb) (struct l2cap_chan *chan,
 					       unsigned long hdr_len,
 					       unsigned long len, int nb);
+	int			(*filter) (struct l2cap_chan * chan,
+					   struct sk_buff *skb);
 };
 
 struct l2cap_conn {
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index a4458c07b5e5..4a6b5e40e5e4 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -7301,9 +7301,10 @@ static int l2cap_data_rcv(struct l2cap_chan *chan, struct sk_buff *skb)
 		goto drop;
 	}
 
-	if ((chan->mode == L2CAP_MODE_ERTM ||
-	     chan->mode == L2CAP_MODE_STREAMING) && sk_filter(chan->data, skb))
-		goto drop;
+	if (chan->ops->filter) {
+		if (chan->ops->filter(chan, skb))
+			goto drop;
+	}
 
 	if (!control->sframe) {
 		int err;
diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index e1a3e66b1754..79b4c01c515b 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1663,6 +1663,19 @@ static void l2cap_sock_suspend_cb(struct l2cap_chan *chan)
 	sk->sk_state_change(sk);
 }
 
+static int l2cap_sock_filter(struct l2cap_chan *chan, struct sk_buff *skb)
+{
+	struct sock *sk = chan->data;
+
+	switch (chan->mode) {
+	case L2CAP_MODE_ERTM:
+	case L2CAP_MODE_STREAMING:
+		return sk_filter(sk, skb);
+	}
+
+	return 0;
+}
+
 static const struct l2cap_ops l2cap_chan_ops = {
 	.name			= "L2CAP Socket Interface",
 	.new_connection		= l2cap_sock_new_connection_cb,
@@ -1678,6 +1691,7 @@ static const struct l2cap_ops l2cap_chan_ops = {
 	.get_sndtimeo		= l2cap_sock_get_sndtimeo_cb,
 	.get_peer_pid		= l2cap_sock_get_peer_pid_cb,
 	.alloc_skb		= l2cap_sock_alloc_skb_cb,
+	.filter			= l2cap_sock_filter,
 };
 
 static void l2cap_sock_destruct(struct sock *sk)
-- 
2.26.2

