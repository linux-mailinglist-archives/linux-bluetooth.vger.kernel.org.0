Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93EDC3FC064
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 Aug 2021 03:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239107AbhHaBQZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Aug 2021 21:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbhHaBQZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Aug 2021 21:16:25 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF18C061575
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Aug 2021 18:15:30 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id fs6so10686523pjb.4
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Aug 2021 18:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yg0aRgylqvn/1WUvSJj8/yxUgsUVExjig/H8FJcRaNI=;
        b=ARnJZGk16UQF611ByWmYVhfpgLR5IKpq6GcvvJhYJ/Wh1R68ybIZ1lDOGc1voWWR+t
         w610U7UQXb7BE5+VfXFh6SortkA12Mru50y5jl6dzXNh6mwXWN1kEVgtMGyc02Bi0OMK
         xzigtR+iu6g67Aq8DBxfy8HGcmO7V1ddhoOg2XdFoSXM1gUgM8gwQL2qs5nsJx1wbfM7
         pyLqDffOiX9vK7w/Rige19qFX8xFFEUGMnE2PzembNYHJE+l83KASylcrKpQEqugTVCV
         EHwcGFhTe8Etvy73OjetysoLxb1w5x+MGvfUC10WW0z43xeJJ6OQ7YmUzuwVIyqWeHDi
         qEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yg0aRgylqvn/1WUvSJj8/yxUgsUVExjig/H8FJcRaNI=;
        b=Q1cNiG+7uG9Kx994y8DNIntaFw6ue9HGBFQ/C03a9XxaVeHfxSP3RhfNNm0DCnEcfS
         +eWm9u4++AWllhYwcDq9eCi7bv5cSJpp95wqc13pz/QotBGNL4J8NnLeXDA6DFa5H0/T
         q+UKp2QYpj4v3SXAJW0T9dRZTccE95Mg78FzDqFivBozaz/Kr5nDRmTopoJxDdARKp9K
         uvA19kdtd9RQMfXdRBd56d8hZfRU+GlXhUQFz31Qv5ywNzL2EXZIzdmSlshJfHiJtJ+N
         taDb2savqzeaIUR9k6FMji4vdAL5EU8hi37/dqgQK4MVUW+uD3uq3/kwQhlHBA6ipUoU
         ajnQ==
X-Gm-Message-State: AOAM531iACiNHMhUwckNMM4fOua/aHshv4fg/Wu7Azeiz90lbulomdqD
        YADvZlxo969H+n04dZx4aYj5F2XI3UU=
X-Google-Smtp-Source: ABdhPJzEIqOjL6V8C8JjZwHt4GqVsQAkxfqDwpW6t95vla4Zb2T13i7szDAOzljXAvsTxbFJy+exMA==
X-Received: by 2002:a17:90a:5147:: with SMTP id k7mr2178122pjm.204.1630372529960;
        Mon, 30 Aug 2021 18:15:29 -0700 (PDT)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id g18sm5020750pge.33.2021.08.30.18.15.29
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 18:15:29 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [RFC 1/4] Bluetooth: Add bt_skb_sendmsg helper
Date:   Mon, 30 Aug 2021 18:15:25 -0700
Message-Id: <20210831011528.225877-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

bt_skb_sendmsg helps takes care of allocation the skb and copying the
the contents of msg over to the skb while checking for possible errors
so it should be safe to call it without holding lock_sock.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/bluetooth.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
index 9125effbf448..1bfb5d3d24dd 100644
--- a/include/net/bluetooth/bluetooth.h
+++ b/include/net/bluetooth/bluetooth.h
@@ -420,6 +420,29 @@ static inline struct sk_buff *bt_skb_send_alloc(struct sock *sk,
 	return NULL;
 }
 
+/* Shall not be called with lock_sock held */
+static inline struct sk_buff *bt_skb_sendmsg(struct sock *sk,
+					     struct msghdr *msg,
+					     size_t len, int reserve)
+{
+	struct sk_buff *skb;
+	int err;
+
+	skb = bt_skb_send_alloc(sk, len, msg->msg_flags & MSG_DONTWAIT, &err);
+	if (!skb)
+		return ERR_PTR(err);
+
+	if (memcpy_from_msg(skb_put(skb, len), msg, len)) {
+		kfree_skb(skb);
+		return ERR_PTR(-EFAULT);
+	}
+
+	skb_reserve(skb, reserve);
+	skb->priority = sk->sk_priority;
+
+	return skb;
+}
+
 int bt_to_errno(u16 code);
 
 void hci_sock_set_flag(struct sock *sk, int nr);
-- 
2.31.1

