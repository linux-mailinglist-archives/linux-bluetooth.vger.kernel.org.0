Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FC456662E
	for <lists+linux-bluetooth@lfdr.de>; Tue,  5 Jul 2022 11:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbiGEJai (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Jul 2022 05:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiGEJaR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Jul 2022 05:30:17 -0400
Received: from smtpbg156.qq.com (smtpbg156.qq.com [15.184.82.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507DFE009
        for <linux-bluetooth@vger.kernel.org>; Tue,  5 Jul 2022 02:30:11 -0700 (PDT)
X-QQ-mid: bizesmtp91t1657013404tpx19yz4
Received: from localhost.localdomain ( [113.57.152.160])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Tue, 05 Jul 2022 17:29:55 +0800 (CST)
X-QQ-SSF: 01400000002000C0E000B00A0000000
X-QQ-FEAT: ZKIyA7viXp0m1EQ4TqpDjXHYBuY+KzRZKm8zc/0Z20q51xVvAUFHpTZZLL1v7
        atj8Kf2dhtYvV4cEsx7arbJthR7ehTQBtzgf+8AoiMq2e+J0tkSDCbKuwmeCeaDiF/l1CUR
        0AKA8m31PL0wqxIvSILOuNR9AZoKaVj69F4Pr6WN2SoyHRI7rTVc8rH/5t2UbiW9rPvW2Ga
        hz+MsYroCKP4xEHEl9owdmow0t72I9l4NKvgRPrfQNFmYO37I4A7991g4AH8NjAh3Uvt3So
        p7y80UruFp9cVj56OmrZvA0SWcVsdVw49Nf2CixROiVKbiNimHYS1Sx7TG8qdBqTrc8ufHo
        gMoeYTOFeX4iKMYwlk=
X-QQ-GoodBg: 2
From:   Youwan Wang <wangyouwan@uniontech.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Youwan Wang <wangyouwan@uniontech.com>
Subject: [PATCH] obexd: Fix the code style
Date:   Tue,  5 Jul 2022 17:29:52 +0800
Message-Id: <20220705092952.11868-1-wangyouwan@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign9
X-QQ-Bgrelay: 1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
 obexd/client/session.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/obexd/client/session.c b/obexd/client/session.c
index 6955a8089..7d8ebb04e 100644
--- a/obexd/client/session.c
+++ b/obexd/client/session.c
@@ -950,7 +950,7 @@ static void transfer_complete(struct obc_transfer *transfer,
 {
 	struct obc_session *session = user_data;
 
-	if (err != 0)
+	if (err)
 		goto fail;
 
 	session_notify_complete(session, transfer);
-- 
2.20.1



