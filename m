Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D70B2589E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 May 2019 22:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727684AbfEUUDc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 21 May 2019 16:03:32 -0400
Received: from atl4mhob02.registeredsite.com ([209.17.115.40]:40886 "EHLO
        atl4mhob02.registeredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726907AbfEUUDc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 21 May 2019 16:03:32 -0400
Received: from mailpod.hostingplatform.com (atl4qobmail02pod5.registeredsite.com [10.30.71.85])
        by atl4mhob02.registeredsite.com (8.14.4/8.14.4) with ESMTP id x4LK3Usp002712
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 May 2019 16:03:30 -0400
Received: (qmail 42215 invoked by uid 0); 21 May 2019 20:03:30 -0000
X-TCPREMOTEIP: 65.41.18.216
X-Authenticated-UID: sbrown@opensat.com
Received: from unknown (HELO 155-15-85-208.altiusbb.net) (sbrown@opensat.com@65.41.18.216)
  by 0 with ESMTPA; 21 May 2019 20:03:30 -0000
Received: from localhost (localhost [127.0.0.1])
        by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id 030B215403A0;
        Tue, 21 May 2019 16:03:29 -0400 (EDT)
X-Virus-Scanned: Debian amavisd-new at ewol.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=6.31
        tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from 155-15-85-208.altiusbb.net ([127.0.0.1])
        by localhost (fl-server.ewol.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LegwosvAcgi7; Tue, 21 May 2019 16:03:27 -0400 (EDT)
Received: from fl-ws.lan (w7.lan [192.168.1.9])
        by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id 0EA1F154038C;
        Tue, 21 May 2019 16:03:27 -0400 (EDT)
Received: by fl-ws.lan (Postfix, from userid 1000)
        id 0A6A211E041E; Tue, 21 May 2019 16:03:27 -0400 (EDT)
From:   Steve Brown <sbrown@ewol.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Steve Brown <sbrown@ewol.com>
Subject: [PATCH v2] meshctl: Retry recvmsg if data is not ready
Date:   Tue, 21 May 2019 16:03:13 -0400
Message-Id: <20190521200313.11487-1-sbrown@ewol.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Commit d6eec1b67d6d ("meshctl: Switch from write to sendmsg for Acquire*")
causes a regression by returning an error if recvmsg has no data available.
Fix it by retrying until data is received.
---
Changes in v2:
  * Reword commit message
 tools/mesh/gatt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/mesh/gatt.c b/tools/mesh/gatt.c
index 2269a20cf..0a942d4eb 100644
--- a/tools/mesh/gatt.c
+++ b/tools/mesh/gatt.c
@@ -415,8 +415,11 @@ static bool sock_read(struct io *io, bool prov, void *user_data)
 	msg.msg_iovlen = 1;
 
 	while ((len = recvmsg(fd, &msg, MSG_DONTWAIT))) {
-		if (len <= 0)
+		if (len <= 0) {
+			if (errno == EAGAIN)
+				break;
 			return false;
+		}
 
 		res = buf;
 		len_sar = mesh_gatt_sar(&res, len);
-- 
2.20.1

