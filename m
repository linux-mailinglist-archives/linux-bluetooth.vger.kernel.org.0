Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB8E4E33BE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Oct 2019 15:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502438AbfJXNPt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 24 Oct 2019 09:15:49 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37737 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502409AbfJXNPt (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 24 Oct 2019 09:15:49 -0400
Received: by mail-wm1-f66.google.com with SMTP id q130so2401182wme.2
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Oct 2019 06:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DnOlPL5LbaA9EY6MGdFUHhRpPt6rJRFA9rxzFZEDOp0=;
        b=YFISxEK4tyhGugCT4CBECnNTuRy+QHELKdRBchx1ylUZ3ysoR5SzfxWmng1EcWHZkh
         2fOJKwyILWNRTlkEOJLpqeGj7BF+UMOB2KCW6U1NTpobNyz51crRPwecO8FakIaNZ5t0
         UOj5wpsi1e8BUoMZyIfGYY3EM/Vr+xeFhAFSNWAjvWPdCyHspcUpYRgITiEsOsuQ1aSl
         EMr5g/8JBtA1KUb0Ei9jtk5kFnbvqG4PJSzUeCwEWD7NXbY3n+bUcBnSVcS5Ou2YZoiF
         dlGFXywe+9KP44Av7eVPunDc0PWt9QmX9iplevMvOm8p1Z5OVQkQzjVSKDuUD3jF1OXo
         NlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DnOlPL5LbaA9EY6MGdFUHhRpPt6rJRFA9rxzFZEDOp0=;
        b=gnC9+t2Q5ofmS+3jOKXL9mdbytvjVFFL1jxhMYcj7/wjk11ia4PjZDxAIB2OzuLW56
         tUg/TvytDyT8sNNheNOzq4A3Eo0AkPUcN6ilDqwehmmQoxt2Boh4WaTMjXh9EYVbEfpZ
         JfZ6LI48czYSKBQ98wLLaa7YhStXvTBRjTVlYasQumrkyKSEzIbOVsa/YwTluoIjGeBo
         se38483zFDcY5GS2hLbirgZk78IueBYqMFQMNdiIj79lwvbUMSS2VYKNNYn0QfJDmpaF
         wfhVqHjCSBR1Hfy+PXpl8w4JH1Zjm1Jlomtxkw9RQZSI2yQo6PqVXRiQDz5S5H4gMAuH
         WOXA==
X-Gm-Message-State: APjAAAXyWlSVbfgK9JybT9YPfOWoBTMsqvE+SIoTGHfvYSyJvb9sKUcH
        iSLa71gkiagtpyG/mrGgMd4HuVpu73M=
X-Google-Smtp-Source: APXvYqw/sVsTpYsufAmpmetvHk9HDlV/SBcIVF9JhumYfU4GAs3nvAHbl0PQegUklWlMcTY6T0yLNA==
X-Received: by 2002:a1c:4e15:: with SMTP id g21mr4564580wmh.148.1571922946610;
        Thu, 24 Oct 2019 06:15:46 -0700 (PDT)
Received: from localhost.localdomain ([192.198.151.61])
        by smtp.gmail.com with ESMTPSA id d8sm11891334wrr.71.2019.10.24.06.15.45
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 06:15:45 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 1/2] Bluetooth: Fix using advertising instance duration as timeout
Date:   Thu, 24 Oct 2019 16:15:42 +0300
Message-Id: <20191024131543.10794-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

When using LE Set Extended Advertising Enable command the duration
refers to the lifetime of instance not the length which is actually
controlled by the interval_min and interval_max when setting the
parameters.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/hci_request.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index 7f6a581b5b7e..3a2ec34c2999 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -1690,7 +1690,7 @@ int __hci_req_enable_ext_advertising(struct hci_request *req, u8 instance)
 	 * scheduling it.
 	 */
 	if (adv_instance && adv_instance->duration) {
-		u16 duration = adv_instance->duration * MSEC_PER_SEC;
+		u16 duration = adv_instance->timeout * MSEC_PER_SEC;
 
 		/* Time = N * 10 ms */
 		adv_set->duration = cpu_to_le16(duration / 10);
-- 
2.21.0

