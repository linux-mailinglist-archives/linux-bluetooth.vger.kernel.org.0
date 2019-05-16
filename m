Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A184A2026C
	for <lists+linux-bluetooth@lfdr.de>; Thu, 16 May 2019 11:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfEPJVd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 16 May 2019 05:21:33 -0400
Received: from atl4mhob11.registeredsite.com ([209.17.115.49]:37734 "EHLO
        atl4mhob11.registeredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726336AbfEPJVd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 16 May 2019 05:21:33 -0400
Received: from mailpod.hostingplatform.com (atl4qobmail02pod5.registeredsite.com [10.30.71.85])
        by atl4mhob11.registeredsite.com (8.14.4/8.14.4) with ESMTP id x4G9LVjs014802
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-bluetooth@vger.kernel.org>; Thu, 16 May 2019 05:21:31 -0400
Received: (qmail 31770 invoked by uid 0); 16 May 2019 09:21:31 -0000
X-TCPREMOTEIP: 208.85.15.155
X-Authenticated-UID: sbrown@opensat.com
Received: from unknown (HELO 155-15-85-208.altiusbb.net) (sbrown@opensat.com@208.85.15.155)
  by 0 with ESMTPA; 16 May 2019 09:21:31 -0000
Received: from localhost (localhost [127.0.0.1])
        by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id 2CA0A1541093;
        Thu, 16 May 2019 05:21:30 -0400 (EDT)
X-Virus-Scanned: Debian amavisd-new at ewol.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=6.31
        tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from 155-15-85-208.altiusbb.net ([127.0.0.1])
        by localhost (fl-server.ewol.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dycpzWWeIuxH; Thu, 16 May 2019 05:21:28 -0400 (EDT)
Received: from z230 (z230.lan [192.168.1.3])
        by 155-15-85-208.altiusbb.net (Postfix) with ESMTP id 4FC1D154107F;
        Thu, 16 May 2019 05:21:28 -0400 (EDT)
Received: by z230 (Postfix, from userid 1000)
        id 3E520454013B; Thu, 16 May 2019 05:21:28 -0400 (EDT)
From:   Steve Brown <sbrown@ewol.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     luiz.dentz@gmail.com, Steve Brown <sbrown@ewol.com>
Subject: [PATCH] meshctl: Retry recvmsg if data is not ready, else return error
Date:   Thu, 16 May 2019 05:20:39 -0400
Message-Id: <20190516092039.8655-1-sbrown@ewol.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

---
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

