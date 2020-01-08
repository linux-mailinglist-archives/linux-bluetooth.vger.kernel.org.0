Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF07133800
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Jan 2020 01:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgAHAdz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Jan 2020 19:33:55 -0500
Received: from mail-pf1-f176.google.com ([209.85.210.176]:45428 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgAHAdy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Jan 2020 19:33:54 -0500
Received: by mail-pf1-f176.google.com with SMTP id 2so678593pfg.12
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 Jan 2020 16:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C6q7Uoy4L6seve9JxrGC2y6+N89DlsK/InAUWD5Hc8c=;
        b=Lr+JHvOahsJ0zqe8pbutMxk1w25mLaK1jpCdfgpjyMgFK56o2zx17fyicyD8Odv135
         Ict6jP/Tj3a9Dl3onHkm9h7+sipJoqkLZ9+y1WHJxOh8RnhyDOnZSgvu8iAs2WNjq6uw
         Mwu1e6CebpE1/3eFF3zM43vxaO5GnRfeHlDCkjpVuCFBKa5ZmJNErWHn31JOtf5N/sB2
         /z3JMmZ3w2ZK62NBECCrFdTzWh41rKqJ7aLuO4SiCJB5/TYHHi7Zf7/aMzrqZlz1JibN
         y+ADRSsg4EMhfgZBCEmpuYiwx3htTFKmj6tgiw0ov0WUJcKZ2MNgqi4YZs/62GRky6lk
         6rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C6q7Uoy4L6seve9JxrGC2y6+N89DlsK/InAUWD5Hc8c=;
        b=b+IOIFDnfut68KxB0uon5LxDQeFBaiNFNVYWE2uDFkmAuUUMM2epHmWyB9lkKZCRCJ
         0kFbMct2iB3ZoEaKrIU153Vz5jGul0ktYD5wi2tl5ZE5FNhuLfKFz80IGTq7czSjdUFR
         ixWoU2aUXGRj3ZvO1SXiWhkUkYXjfWmigiHoNj7FMfvEbAFCRx3GYWWbLy7LzzTO/j2+
         NkDq2o3gC0jfKN+//oJbHz/3C6edKTMALRZUsfqH+jHS0o6qfhOXzvkqizf8M5zMJxO2
         UNEpqYiiP6/5bBUxeUXSJE9KmlFdq8WErOtfGt0YNYWpoB7XGbeDGJnQJdphmwVyPu4o
         R/Ug==
X-Gm-Message-State: APjAAAUJnL8oacTLMan3/n0KTV1zGlPG0bqL0tS893U3792KYopapqCj
        h7EtrV/+6QsS4Jyi73iSeLMK5xRX4to=
X-Google-Smtp-Source: APXvYqyv2Ap7TV46UoJaa2sJ4j+k/yHLsTPdrSlUN9hWwAbtnr8/eKUeeyw0enps9SR3rs5IdBLLkQ==
X-Received: by 2002:a63:4465:: with SMTP id t37mr2382246pgk.256.1578443633236;
        Tue, 07 Jan 2020 16:33:53 -0800 (PST)
Received: from localhost.localdomain ([192.102.209.43])
        by smtp.gmail.com with ESMTPSA id u10sm925805pgg.41.2020.01.07.16.33.52
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 16:33:52 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 10/22] lib: Add definitions for Enhanced Credits Based Mode
Date:   Tue,  7 Jan 2020 16:33:30 -0800
Message-Id: <20200108003342.15458-11-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200108003342.15458-1-luiz.dentz@gmail.com>
References: <20200108003342.15458-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

---
 lib/l2cap.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/l2cap.h b/lib/l2cap.h
index 5ce94c4ee..bc9d7ed13 100644
--- a/lib/l2cap.h
+++ b/lib/l2cap.h
@@ -197,6 +197,7 @@ typedef struct {
 #define L2CAP_MODE_FLOWCTL	0x02
 #define L2CAP_MODE_ERTM		0x03
 #define L2CAP_MODE_STREAMING	0x04
+#define L2CAP_MODE_ECRED	0x81
 
 #define L2CAP_SERVTYPE_NOTRAFFIC	0x00
 #define L2CAP_SERVTYPE_BESTEFFORT	0x01
-- 
2.21.0

