Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49196406A6F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 Sep 2021 13:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbhIJLBM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Sep 2021 07:01:12 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:56128 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbhIJLBL (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Sep 2021 07:01:11 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 3159A20056;
        Fri, 10 Sep 2021 11:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1631271600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type;
        bh=Sk1SCgfDCJj3LVmk+eafuzinH59hJe5duv85IFR8KBQ=;
        b=PqHfE+CiKwkyIAgyn2rT7fLJrAQY30pKz++5elz07Ugt3xLUA6YZAtHkt5mN8us1zFJHky
        t+V3rIB4UvTxuXe4gU+4JRdC5WhwSHyjSTVb7iDN7J71mOL+6R1YVPr9PgwLom9Khd9Wi6
        aVLT5RXFBvPv66IMP7mNSnlLbb1cnH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1631271600;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type;
        bh=Sk1SCgfDCJj3LVmk+eafuzinH59hJe5duv85IFR8KBQ=;
        b=AbGfvhRG97ZYaDVQaw96r4oXYtjnot68bfn0BnMW90JxZYP/u5GBAosufvdcQA/81d/TTH
        pceG2cEhBLEFfIBg==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 29E98A3B8A;
        Fri, 10 Sep 2021 11:00:00 +0000 (UTC)
Date:   Fri, 10 Sep 2021 13:00:00 +0200
Message-ID: <s5hilz8n1an.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-bluetooth@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Nicolai Stange <nstange@suse.de>
Subject: Possible sleep-in-atomic in BT SCO code
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

while investigation of the recent BT fixes, Nicolai found out that the
change in the commit 27c24fda62b6 ("Bluetooth: switch to lock_sock in
SCO") may cause a sleep-in-atomic.

The commit replaced bh_lock_sock() with lock_sock(), which can sleep.
Meanwhile, in sco_conn_ready(), this is called after sco_conn_lock(),
and sco_conn_lock() is a simple spinlock.  So this may lead to a
sleep-in-atomic.

I can imagine a fix like the below, but this also made us wonder
whether the sco_conn_lock() would be needed at all.  In the code path,
conn->hcon won't be changed, right?


thanks,

Takashi

--- a/net/bluetooth/sco.c
+++ b/net/bluetooth/sco.c
@@ -1118,18 +1118,22 @@ static void sco_conn_ready(struct sco_conn *conn)
 			return;
 		}
 
+		sock_hold(parent);
+		sco_conn_unlock(conn);
+
 		lock_sock(parent);
 
 		sk = sco_sock_alloc(sock_net(parent), NULL,
 				    BTPROTO_SCO, GFP_ATOMIC, 0);
 		if (!sk) {
 			release_sock(parent);
-			sco_conn_unlock(conn);
+			sock_put(parent);
 			return;
 		}
 
 		sco_sock_init(sk, parent);
 
+		sco_conn_lock(conn);
 		bacpy(&sco_pi(sk)->src, &conn->hcon->src);
 		bacpy(&sco_pi(sk)->dst, &conn->hcon->dst);
 
@@ -1143,10 +1147,10 @@ static void sco_conn_ready(struct sco_conn *conn)
 
 		/* Wake up parent */
 		parent->sk_data_ready(parent);
+		sco_conn_unlock(conn);
 
 		release_sock(parent);
-
-		sco_conn_unlock(conn);
+		sock_put(parent);
 	}
 }
 

