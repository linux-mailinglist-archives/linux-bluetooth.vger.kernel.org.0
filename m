Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C772E1F21B3
	for <lists+linux-bluetooth@lfdr.de>; Tue,  9 Jun 2020 00:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgFHWB6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 8 Jun 2020 18:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbgFHWBz (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 8 Jun 2020 18:01:55 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A769FC08C5C2
        for <linux-bluetooth@vger.kernel.org>; Mon,  8 Jun 2020 15:01:55 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id bh7so7183641plb.11
        for <linux-bluetooth@vger.kernel.org>; Mon, 08 Jun 2020 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SFwhvWeQNH04wTs4J/45GqFN3ZOCDGWRHJk/tXLr8Zc=;
        b=Y9/RbQYT32Rk+paK8iTo4VbBeTT63RlWaFTYFJyrhBys3cuwjSurgCaY44uLPsjNBJ
         WUyGmwsG2VRVVGpbvLJhCg+c3iAzdJB7WFiV52dUD2MP+YmuYO4RQnBODAeHJnH40jm+
         js0r+AZ06bL1dll+TcI/hYc7OlT7kCSAC2PrxiFexnvFUgzUuPfv+dIInpD5bTDq6dJN
         NC+U//2ZVjRpgFtF8C4ETwO52AkOZZSRlnCK+27YBKUkjIiUw4rFG+igi7N+Id9leHlO
         HW4YS54UCSKmCq9RYdZleIKal0QrT3RxdOyLYnKQd3m8kwhqi6Z3va+UPN/Jljq3+tSb
         r1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SFwhvWeQNH04wTs4J/45GqFN3ZOCDGWRHJk/tXLr8Zc=;
        b=SrAS8hKDR6uLFfguZtHHTSxS6H9fdCP906+rPrLsYbLQHL+P0oFu47U3jl9/zgUtwj
         zWcraa8gUGnTN0+QflD6dbRqFuPEwilUHzE2H3qLuD1UdbGOguxMuaLwLLDOb5IqEeyA
         up8PH03Akgkt9Zuzg8s7j3UspvEcFZF6Ck5khHHWlUawxp3qXMoyFFDAlSJI8ICjkjDN
         MMduBRrOeCdgRyfKbzB6x2kWgdhlVO29Y+eGbiJ7mN0uLfcPOHUYzYZx6HjglJMoj/oS
         cCXRaNJH4NCzFbpNBmhy0BEoLONyAp5t2S8a0cV1f/kJmh9lp6KzrHj9oCiVQKHPDYbC
         6rYg==
X-Gm-Message-State: AOAM533O1l5UuBxP3UyNtmjb/I8XPIcLEe1RV2zvxqehyJ3A+GJDw/SW
        nbaHXuBGSqAyFUb4cxJJhjfhw76/
X-Google-Smtp-Source: ABdhPJxD+MhwfhFioNyzqZI8MGzht6QR7OvkL9Hx53UzJuuXmssvKJjlbdbAxOBuQntqdv9qu/umfQ==
X-Received: by 2002:a17:902:b110:: with SMTP id q16mr666307plr.221.1591653714689;
        Mon, 08 Jun 2020 15:01:54 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id b140sm7870172pfb.119.2020.06.08.15.01.53
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 15:01:53 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 1/3] adapter: Do not remove client watch directly if discovery fails
Date:   Mon,  8 Jun 2020 15:01:51 -0700
Message-Id: <20200608220153.880790-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Client watch is used for both discovery and it filters so in case the
client has set the later the watch shall be perserved.
---
 src/adapter.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/src/adapter.c b/src/adapter.c
index 76acfea70..bf51b120b 100644
--- a/src/adapter.c
+++ b/src/adapter.c
@@ -1651,7 +1651,6 @@ fail:
 	if (client->msg) {
 		reply = btd_error_busy(client->msg);
 		g_dbus_send_message(dbus_conn, reply);
-		g_dbus_remove_watch(dbus_conn, client->watch);
 		discovery_remove(client, false);
 		return;
 	}
-- 
2.25.3

