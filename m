Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2651575E8D5
	for <lists+linux-bluetooth@lfdr.de>; Mon, 24 Jul 2023 03:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232433AbjGXBop (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 23 Jul 2023 21:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232561AbjGXBn0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 23 Jul 2023 21:43:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B4442689;
        Sun, 23 Jul 2023 18:38:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C26286100C;
        Mon, 24 Jul 2023 01:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C730C433C7;
        Mon, 24 Jul 2023 01:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690162426;
        bh=2YoCrwXNn5L2KW+P/U6cPT1N9UXv0/k5KP4tTfnqIfg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JM/J+1LVpRaOrUdMGarC0ubqgpezVmR68QNrpgNWDEuutWst7j+8J+ZyYz3xw1cmo
         YDcSu5s8N3zOlK9WNjAW8ucU8Og6zwsyH4rsEpW1j6TotIOumM/bJP+hFaqKa2/IyW
         BuTf209Vyuu/yBJMby0mcMWZTSoTQhKWMNuywsHqdJMy6g4oRwpxBshycPcvbvckTC
         eRmIIJ40yOhWWuIvuts0yoNsT4ad3pu/F6p+qeEwn5XpF36H10AfhtDMiiiea+03YW
         1QeGEe+Kr5xbpLcvFjBd/0VOcSW5Itk5+qmp9gXkLPXOvDcHKOuvC3yAfX+Buli1XA
         OPHsIkz6InnlA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Zhengping Jiang <jiangzp@google.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Sasha Levin <sashal@kernel.org>, marcel@holtmann.org,
        gustavo@padovan.org, johan.hedberg@gmail.com, davem@davemloft.net,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 14/24] Bluetooth: L2CAP: Fix use-after-free
Date:   Sun, 23 Jul 2023 21:33:15 -0400
Message-Id: <20230724013325.2332084-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724013325.2332084-1-sashal@kernel.org>
References: <20230724013325.2332084-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.121
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Zhengping Jiang <jiangzp@google.com>

[ Upstream commit f752a0b334bb95fe9b42ecb511e0864e2768046f ]

Fix potential use-after-free in l2cap_le_command_rej.

Signed-off-by: Zhengping Jiang <jiangzp@google.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/bluetooth/l2cap_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 9dd54247029a8..0770286ecf0bc 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -6375,9 +6375,14 @@ static inline int l2cap_le_command_rej(struct l2cap_conn *conn,
 	if (!chan)
 		goto done;
 
+	chan = l2cap_chan_hold_unless_zero(chan);
+	if (!chan)
+		goto done;
+
 	l2cap_chan_lock(chan);
 	l2cap_chan_del(chan, ECONNREFUSED);
 	l2cap_chan_unlock(chan);
+	l2cap_chan_put(chan);
 
 done:
 	mutex_unlock(&conn->chan_lock);
-- 
2.39.2

