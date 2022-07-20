Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58D9C57BC50
	for <lists+linux-bluetooth@lfdr.de>; Wed, 20 Jul 2022 19:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236459AbiGTRG7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 20 Jul 2022 13:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiGTRG6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 20 Jul 2022 13:06:58 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A9C69F32
        for <linux-bluetooth@vger.kernel.org>; Wed, 20 Jul 2022 10:06:57 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id c24so8607183qkm.4
        for <linux-bluetooth@vger.kernel.org>; Wed, 20 Jul 2022 10:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AErzE9OF9z39zO5mN48CozXFv9hHNozaOzkRnv5BT4Y=;
        b=cqm0juBPsQ8geYdQOjevsS3uId/YvjNxs4mQy/fS07dtsmiyxHkd/fUZvu6Uwswn81
         OP+uUOaj6Rcn91WEelLUOi5bbOrrkwwRdvEcSNYOFlrv4xQmUdUFP+WxCLpcIlPo25sr
         SWv5HexV/o63d5o7dY09Mt7JEu/4t8LPAsAQKotsYfZIIm8blNuP8jzVDj0RHjNFz4Ec
         EWJujdWp/6bhOj6ozZWp6uDhATEB9YXT/PSusA6H+U4yVPsMUwtOVvS9ezxXGGQVFEpx
         0wblai9Tq0R6ZUEshQWtu3j/XjGGJkFJ/hnv8OyYUrBFf5GPAKroCrn/mneV2Z63O9Q3
         /1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AErzE9OF9z39zO5mN48CozXFv9hHNozaOzkRnv5BT4Y=;
        b=6ojRBv/gkp+Cc3FFuO9zpFGICwaXqewfeXPrPk2DrvjrSFk6epOBnAewYYqD7GD74V
         HyOTH3TTxng47Tid7umCYt6Wv2qkEXEriOUQ52U3tvj/rLr5i0XAZuToPH+BMAketuP8
         7NawtdsaVYHvXMTOZ91jVOWu7C7JmwhmQ6ay1s5rP67DCZDhy/3QR8hwjJQjOxYaPTd2
         TMvFpe/cLLtFAdaYnssl5WUg3pVECdCocF3DFQMizT+OwpiHYXPWEKiFnMiSMILRdcUw
         mhyonH8jCkGvNBKqnwYJy/nLhb1jhVx35fUxQ/CIs24APkX/TYyk5TEcZvdWc/JH3mPX
         qMBw==
X-Gm-Message-State: AJIora8L3XQXcGIheuJHk2kUQj9rTxSXeCkOUHmyY/pgvHhI78t928gK
        kzl0uHBDlC8NaRmv2+jpS/M6qSj8Z/4=
X-Google-Smtp-Source: AGRyM1u1ict360En/dngsP2cBaTcnkLmydf5bcZ8bsez0yQB1LacMC58lsI+HznEytmisl+5yWNvlg==
X-Received: by 2002:a05:620a:2a0e:b0:6b3:583a:1031 with SMTP id o14-20020a05620a2a0e00b006b3583a1031mr25135552qkp.710.1658336815800;
        Wed, 20 Jul 2022 10:06:55 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id q13-20020a05620a2a4d00b006b5763bffebsm16085923qkp.34.2022.07.20.10.06.54
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 10:06:55 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: L2CAP: Fix use-after-free caused by l2cap_chan_put
Date:   Wed, 20 Jul 2022 10:06:48 -0700
Message-Id: <20220720170648.148219-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This fixes the following trace which is caused by hci_rx_work starting up
*after* the final channel reference has been put() during sock_close() but
*before* the references to the channel have been destroyed, so instead
the code now rely on kref_get_unless_zero/l2cap_chan_hold_unless_zero to
prevent referencing a channel that is about to be destroyed.

  refcount_t: increment on 0; use-after-free.
  BUG: KASAN: use-after-free in refcount_dec_and_test+0x20/0xd0
  Read of size 4 at addr ffffffc114f5bf18 by task kworker/u17:14/705

  CPU: 4 PID: 705 Comm: kworker/u17:14 Tainted: G S      W
  4.14.234-00003-g1fb6d0bd49a4-dirty #28
  Hardware name: Qualcomm Technologies, Inc. SM8150 V2 PM8150
  Google Inc. MSM sm8150 Flame DVT (DT)
  Workqueue: hci0 hci_rx_work
  Call trace:
   dump_backtrace+0x0/0x378
   show_stack+0x20/0x2c
   dump_stack+0x124/0x148
   print_address_description+0x80/0x2e8
   __kasan_report+0x168/0x188
   kasan_report+0x10/0x18
   __asan_load4+0x84/0x8c
   refcount_dec_and_test+0x20/0xd0
   l2cap_chan_put+0x48/0x12c
   l2cap_recv_frame+0x4770/0x6550
   l2cap_recv_acldata+0x44c/0x7a4
   hci_acldata_packet+0x100/0x188
   hci_rx_work+0x178/0x23c
   process_one_work+0x35c/0x95c
   worker_thread+0x4cc/0x960
   kthread+0x1a8/0x1c4
   ret_from_fork+0x10/0x18

Cc: stable@kernel.org
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 include/net/bluetooth/l2cap.h |  1 +
 net/bluetooth/l2cap_core.c    | 61 +++++++++++++++++++++++++++--------
 2 files changed, 49 insertions(+), 13 deletions(-)

diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index 3c4f550e5a8b..2f766e3437ce 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -847,6 +847,7 @@ enum {
 };
 
 void l2cap_chan_hold(struct l2cap_chan *c);
+struct l2cap_chan *l2cap_chan_hold_unless_zero(struct l2cap_chan *c);
 void l2cap_chan_put(struct l2cap_chan *c);
 
 static inline void l2cap_chan_lock(struct l2cap_chan *chan)
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 09ecaf556de5..77c0aac14539 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -111,7 +111,8 @@ static struct l2cap_chan *__l2cap_get_chan_by_scid(struct l2cap_conn *conn,
 }
 
 /* Find channel with given SCID.
- * Returns locked channel. */
+ * Returns a reference locked channel.
+ */
 static struct l2cap_chan *l2cap_get_chan_by_scid(struct l2cap_conn *conn,
 						 u16 cid)
 {
@@ -119,15 +120,19 @@ static struct l2cap_chan *l2cap_get_chan_by_scid(struct l2cap_conn *conn,
 
 	mutex_lock(&conn->chan_lock);
 	c = __l2cap_get_chan_by_scid(conn, cid);
-	if (c)
-		l2cap_chan_lock(c);
+	if (c) {
+		/* Only lock if chan reference is not 0 */
+		c = l2cap_chan_hold_unless_zero(c);
+		if (c)
+			l2cap_chan_lock(c);
+	}
 	mutex_unlock(&conn->chan_lock);
 
 	return c;
 }
 
 /* Find channel with given DCID.
- * Returns locked channel.
+ * Returns a reference locked channel.
  */
 static struct l2cap_chan *l2cap_get_chan_by_dcid(struct l2cap_conn *conn,
 						 u16 cid)
@@ -136,8 +141,12 @@ static struct l2cap_chan *l2cap_get_chan_by_dcid(struct l2cap_conn *conn,
 
 	mutex_lock(&conn->chan_lock);
 	c = __l2cap_get_chan_by_dcid(conn, cid);
-	if (c)
-		l2cap_chan_lock(c);
+	if (c) {
+		/* Only lock if chan reference is not 0 */
+		c = l2cap_chan_hold_unless_zero(c);
+		if (c)
+			l2cap_chan_lock(c);
+	}
 	mutex_unlock(&conn->chan_lock);
 
 	return c;
@@ -162,8 +171,12 @@ static struct l2cap_chan *l2cap_get_chan_by_ident(struct l2cap_conn *conn,
 
 	mutex_lock(&conn->chan_lock);
 	c = __l2cap_get_chan_by_ident(conn, ident);
-	if (c)
-		l2cap_chan_lock(c);
+	if (c) {
+		/* Only lock if chan reference is not 0 */
+		c = l2cap_chan_hold_unless_zero(c);
+		if (c)
+			l2cap_chan_lock(c);
+	}
 	mutex_unlock(&conn->chan_lock);
 
 	return c;
@@ -497,6 +510,16 @@ void l2cap_chan_hold(struct l2cap_chan *c)
 	kref_get(&c->kref);
 }
 
+struct l2cap_chan *l2cap_chan_hold_unless_zero(struct l2cap_chan *c)
+{
+	BT_DBG("chan %p orig refcnt %u", c, kref_read(&c->kref));
+
+	if (!kref_get_unless_zero(&c->kref))
+		return NULL;
+
+	return c;
+}
+
 void l2cap_chan_put(struct l2cap_chan *c)
 {
 	BT_DBG("chan %p orig refcnt %u", c, kref_read(&c->kref));
@@ -1969,7 +1992,10 @@ static struct l2cap_chan *l2cap_global_chan_by_psm(int state, __le16 psm,
 			src_match = !bacmp(&c->src, src);
 			dst_match = !bacmp(&c->dst, dst);
 			if (src_match && dst_match) {
-				l2cap_chan_hold(c);
+				c = l2cap_chan_hold_unless_zero(c);
+				if (!c)
+					continue;
+
 				read_unlock(&chan_list_lock);
 				return c;
 			}
@@ -1984,7 +2010,7 @@ static struct l2cap_chan *l2cap_global_chan_by_psm(int state, __le16 psm,
 	}
 
 	if (c1)
-		l2cap_chan_hold(c1);
+		c1 = l2cap_chan_hold_unless_zero(c1);
 
 	read_unlock(&chan_list_lock);
 
@@ -4464,6 +4490,7 @@ static inline int l2cap_config_req(struct l2cap_conn *conn,
 
 unlock:
 	l2cap_chan_unlock(chan);
+	l2cap_chan_put(chan);
 	return err;
 }
 
@@ -4578,6 +4605,7 @@ static inline int l2cap_config_rsp(struct l2cap_conn *conn,
 
 done:
 	l2cap_chan_unlock(chan);
+	l2cap_chan_put(chan);
 	return err;
 }
 
@@ -5305,6 +5333,7 @@ static inline int l2cap_move_channel_req(struct l2cap_conn *conn,
 	l2cap_send_move_chan_rsp(chan, result);
 
 	l2cap_chan_unlock(chan);
+	l2cap_chan_put(chan);
 
 	return 0;
 }
@@ -5397,6 +5426,7 @@ static void l2cap_move_continue(struct l2cap_conn *conn, u16 icid, u16 result)
 	}
 
 	l2cap_chan_unlock(chan);
+	l2cap_chan_put(chan);
 }
 
 static void l2cap_move_fail(struct l2cap_conn *conn, u8 ident, u16 icid,
@@ -5426,6 +5456,7 @@ static void l2cap_move_fail(struct l2cap_conn *conn, u8 ident, u16 icid,
 	l2cap_send_move_chan_cfm(chan, L2CAP_MC_UNCONFIRMED);
 
 	l2cap_chan_unlock(chan);
+	l2cap_chan_put(chan);
 }
 
 static int l2cap_move_channel_rsp(struct l2cap_conn *conn,
@@ -5489,6 +5520,7 @@ static int l2cap_move_channel_confirm(struct l2cap_conn *conn,
 	l2cap_send_move_chan_cfm_rsp(conn, cmd->ident, icid);
 
 	l2cap_chan_unlock(chan);
+	l2cap_chan_put(chan);
 
 	return 0;
 }
@@ -5524,6 +5556,7 @@ static inline int l2cap_move_channel_confirm_rsp(struct l2cap_conn *conn,
 	}
 
 	l2cap_chan_unlock(chan);
+	l2cap_chan_put(chan);
 
 	return 0;
 }
@@ -5896,12 +5929,11 @@ static inline int l2cap_le_credits(struct l2cap_conn *conn,
 	if (credits > max_credits) {
 		BT_ERR("LE credits overflow");
 		l2cap_send_disconn_req(chan, ECONNRESET);
-		l2cap_chan_unlock(chan);
 
 		/* Return 0 so that we don't trigger an unnecessary
 		 * command reject packet.
 		 */
-		return 0;
+		goto unlock;
 	}
 
 	chan->tx_credits += credits;
@@ -5912,7 +5944,9 @@ static inline int l2cap_le_credits(struct l2cap_conn *conn,
 	if (chan->tx_credits)
 		chan->ops->resume(chan);
 
+unlock:
 	l2cap_chan_unlock(chan);
+	l2cap_chan_put(chan);
 
 	return 0;
 }
@@ -7598,6 +7632,7 @@ static void l2cap_data_channel(struct l2cap_conn *conn, u16 cid,
 
 done:
 	l2cap_chan_unlock(chan);
+	l2cap_chan_put(chan);
 }
 
 static void l2cap_conless_channel(struct l2cap_conn *conn, __le16 psm,
@@ -8086,7 +8121,7 @@ static struct l2cap_chan *l2cap_global_fixed_chan(struct l2cap_chan *c,
 		if (src_type != c->src_type)
 			continue;
 
-		l2cap_chan_hold(c);
+		c = l2cap_chan_hold_unless_zero(c);
 		read_unlock(&chan_list_lock);
 		return c;
 	}
-- 
2.36.1

