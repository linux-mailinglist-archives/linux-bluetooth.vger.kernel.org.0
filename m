Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A0D6DBC32
	for <lists+linux-bluetooth@lfdr.de>; Sat,  8 Apr 2023 18:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjDHQrx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 8 Apr 2023 12:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjDHQrv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 8 Apr 2023 12:47:51 -0400
Received: from hust.edu.cn (unknown [202.114.0.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CC7630E0;
        Sat,  8 Apr 2023 09:47:49 -0700 (PDT)
Received: from markli-virtual-machine.localdomain ([10.21.34.114])
        (user=u202212060@hust.edu.cn mech=LOGIN bits=0)
        by mx1.hust.edu.cn  with ESMTP id 338Gjk9D026876-338Gjk9E026876
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Sun, 9 Apr 2023 00:46:00 +0800
From:   Lanzhe Li <u202212060@hust.edu.cn>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     markli <u202212060@hust.edu.cn>, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] net: bluetooth: hci_debugfs: fix inconsistent indenting
Date:   Sun,  9 Apr 2023 00:45:42 +0800
Message-Id: <20230408164542.2316-1-u202212060@hust.edu.cn>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: u202212060@hust.edu.cn
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: markli <u202212060@hust.edu.cn>

Fixed a wrong indentation before "return".This line uses a 7 space
indent instead of a tab.

Signed-off-by: Lanzhe Li <u202212060@hust.edu.cn>
---
 net/bluetooth/hci_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_debugfs.c b/net/bluetooth/hci_debugfs.c
index b7f682922a16..ec0df2f9188e 100644
--- a/net/bluetooth/hci_debugfs.c
+++ b/net/bluetooth/hci_debugfs.c
@@ -189,7 +189,7 @@ static int uuids_show(struct seq_file *f, void *p)
 	}
 	hci_dev_unlock(hdev);
 
-       return 0;
+	return 0;
 }
 
 DEFINE_SHOW_ATTRIBUTE(uuids);
-- 
2.37.2

