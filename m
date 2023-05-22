Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38C0D70CF15
	for <lists+linux-bluetooth@lfdr.de>; Tue, 23 May 2023 02:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbjEWAYt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 22 May 2023 20:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232594AbjEWACk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 22 May 2023 20:02:40 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1848C115
        for <linux-bluetooth@vger.kernel.org>; Mon, 22 May 2023 16:42:04 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64d2c865e4eso3414611b3a.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 22 May 2023 16:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684798923; x=1687390923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+rx+S7nPaUlZgKRhY0AE4p+8EOHdzzNMhcLSf0Z/iU=;
        b=oY65iFTHyfg8S/4N8iu/Putyt/v/zxPnz4B4sp8nZMDXWYuMDwoM0UQZ36AS7qs1Hl
         jju60n3XwzLzDtOJG7OdfQNK5KLBNWTpD5hdPIT5uXgh0CAagpyiXyWKl3vhNUGlnRb2
         0+k722ujeuXuAzItAYOcEXWHIsCN2rY/o0WUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684798923; x=1687390923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+rx+S7nPaUlZgKRhY0AE4p+8EOHdzzNMhcLSf0Z/iU=;
        b=A/lyg/bCsGPh4b0PWrwnfxystHL6cWmg7osKVs/ZlqItzpPScCnXXTt7XE1qevPHcx
         7l1hHujOkjOZriuZs3o8sSE6RTAYLMXk8m0Q8TZbJDWQ+0Q20MyR3sPYj8WfLVHLXGR1
         9Gbrb0OuvyXRDS8sXDK2okwx5nNVTO/NyCtQ4N1IzmQif418+ltIL9B9O3OGpL5rAivW
         ddE3/IyLnqAMSDsEX3+tvVxsO/shqLRPGZAVM8wMlRm9dBXEKrS9+7jy/KhFnawWn7am
         lyNEvHuId+1asBWZ1nt05U2TulvosoABnrAE4SVSFRbWBGzZUU/gn+1cUFZa99b9VKfo
         SIxg==
X-Gm-Message-State: AC+VfDxXFRh3s+rAVb6rPEuT86OkYM+jXzFt2x+/ivli6oMQ5SNt80ky
        kmhXE3CVyySsHipQ2o2TBmDZ8vTwaE2FoMQzNNk=
X-Google-Smtp-Source: ACHHUZ75unrkOLJtSpyBDre9dWo7sQ7v1j8uCj4EtwTXwq+bpn1P2qESbwf/vacSMKYJ8Uah6kBgAQ==
X-Received: by 2002:a05:6a21:329a:b0:10b:4f58:3fef with SMTP id yt26-20020a056a21329a00b0010b4f583fefmr6701973pzb.2.1684798923123;
        Mon, 22 May 2023 16:42:03 -0700 (PDT)
Received: from localhost (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
        by smtp.gmail.com with UTF8SMTPSA id q26-20020a62e11a000000b0063b675f01a5sm4132014pfh.11.2023.05.22.16.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 16:42:02 -0700 (PDT)
From:   Ying Hsu <yinghsu@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        Ying Hsu <yinghsu@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH v2] Bluetooth: Fix l2cap_disconnect_req deadlock
Date:   Mon, 22 May 2023 23:41:51 +0000
Message-ID: <20230522234154.2924052-1-yinghsu@chromium.org>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

L2CAP assumes that the locks conn->chan_lock and chan->lock are
acquired in the order conn->chan_lock, chan->lock to avoid
potential deadlock.
For example, l2sock_shutdown acquires these locks in the order:
  mutex_lock(&conn->chan_lock)
  l2cap_chan_lock(chan)

However, l2cap_disconnect_req acquires chan->lock in
l2cap_get_chan_by_scid first and then acquires conn->chan_lock
before calling l2cap_chan_del. This means that these locks are
acquired in unexpected order, which leads to potential deadlock:
  l2cap_chan_lock(c)
  mutex_lock(&conn->chan_lock)

This patch uses __l2cap_get_chan_by_scid to replace
l2cap_get_chan_by_scid and adjusts the locking order to avoid the
potential deadlock.

Signed-off-by: Ying Hsu <yinghsu@chromium.org>
---
This commit has been tested on a Chromebook device.

Changes in v2:
- Adding the prefix "Bluetooth:" to subject line.

 net/bluetooth/l2cap_core.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 376b523c7b26..8f08192b8fb1 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -4651,8 +4651,16 @@ static inline int l2cap_disconnect_req(struct l2cap_conn *conn,
 
 	BT_DBG("scid 0x%4.4x dcid 0x%4.4x", scid, dcid);
 
-	chan = l2cap_get_chan_by_scid(conn, dcid);
+	mutex_lock(&conn->chan_lock);
+	chan = __l2cap_get_chan_by_scid(conn, dcid);
+	if (chan) {
+		chan = l2cap_chan_hold_unless_zero(chan);
+		if (chan)
+			l2cap_chan_lock(chan);
+	}
+
 	if (!chan) {
+		mutex_unlock(&conn->chan_lock);
 		cmd_reject_invalid_cid(conn, cmd->ident, dcid, scid);
 		return 0;
 	}
@@ -4663,14 +4671,13 @@ static inline int l2cap_disconnect_req(struct l2cap_conn *conn,
 
 	chan->ops->set_shutdown(chan);
 
-	mutex_lock(&conn->chan_lock);
 	l2cap_chan_del(chan, ECONNRESET);
-	mutex_unlock(&conn->chan_lock);
 
 	chan->ops->close(chan);
 
 	l2cap_chan_unlock(chan);
 	l2cap_chan_put(chan);
+	mutex_unlock(&conn->chan_lock);
 
 	return 0;
 }
@@ -4691,25 +4698,32 @@ static inline int l2cap_disconnect_rsp(struct l2cap_conn *conn,
 
 	BT_DBG("dcid 0x%4.4x scid 0x%4.4x", dcid, scid);
 
-	chan = l2cap_get_chan_by_scid(conn, scid);
+	mutex_lock(&conn->chan_lock);
+	chan = __l2cap_get_chan_by_scid(conn, scid);
+	if (chan) {
+		chan = l2cap_chan_hold_unless_zero(chan);
+		if (chan)
+			l2cap_chan_lock(chan);
+	}
 	if (!chan) {
+		mutex_unlock(&conn->chan_lock);
 		return 0;
 	}
 
 	if (chan->state != BT_DISCONN) {
 		l2cap_chan_unlock(chan);
 		l2cap_chan_put(chan);
+		mutex_unlock(&conn->chan_lock);
 		return 0;
 	}
 
-	mutex_lock(&conn->chan_lock);
 	l2cap_chan_del(chan, 0);
-	mutex_unlock(&conn->chan_lock);
 
 	chan->ops->close(chan);
 
 	l2cap_chan_unlock(chan);
 	l2cap_chan_put(chan);
+	mutex_unlock(&conn->chan_lock);
 
 	return 0;
 }
-- 
2.40.1.698.g37aff9b760-goog

