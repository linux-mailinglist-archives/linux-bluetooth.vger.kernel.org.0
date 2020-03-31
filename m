Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 030E0198A70
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 Mar 2020 05:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbgCaDQx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Mar 2020 23:16:53 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:35347 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727464AbgCaDQw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Mar 2020 23:16:52 -0400
Received: by mail-pf1-f201.google.com with SMTP id c82so17331391pfc.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Mar 2020 20:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=B+pFhislTERSJ+sPrY15wXajnJWO66yhO+DU6Mi065w=;
        b=URbDavb2+tyHpxGAWUAYn9DjsWnwIPvEfQdOk3e+bt7aCgKaTzU0uJWgGPdoyix5aU
         xfZ9zcaJ3kRoADMX+kuEWnPT67I4j+9gM3BAVMd0Mn+zgn4pgWwQDRXrvwX8TAR1/FNv
         GRHM1zw8HRcTwjxYp+T253DC6fNV5SRLmA22yM/CGd4gVp/Hr75jXYZZCZPijyL+nKiE
         rNH/Nic+PiDEi+YJvO2CUTnFTreUWM/rt0Ow5BmOQ7AeXOjZRWIb5sAe4zC4TK4XHYhF
         LjzeZxmkqY5qnk0GIAgfLNOK3679QzaFoJ8LGKeWBRyKmR8q1izAslkx5bKRDXYSVdoh
         k4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=B+pFhislTERSJ+sPrY15wXajnJWO66yhO+DU6Mi065w=;
        b=aBFl11woOaB+vu8brre7JCYpDVAtNVJmZiRpkckP2xWCuB+p7vTCiMXvZW9KgsFZon
         DIgofiZ4UJMAivbj1CgZ0jBTGv0j1RUAnnuXdvCnePmkWg4crPFxQwB0RScJC3cpmkNR
         TawNgqBxtk1i7emUc4VslvCOMfqJkV7cLB7ihZxfULeb+5hrwP4R6yPCREcZ8/GvtJOP
         Pw4CY31m/c19dZzvTDxtv8js/sc2T1hPAoebipLuwTuXbYjcLuMAnxMNcLB/psIqqyGk
         S0e1REuls0Nqse2XmiXVZnjib7hbbkXshO21i6Qf+BrQJx/fOmPv2nf7kGUWDC+ha4Bo
         wtJA==
X-Gm-Message-State: AGi0PuaqorE6j+Xs7TnNfnBPls+gAXWodEUqFIF+PPDXxCaFJCOHkcBR
        nh5/ZsErN//ms0xHM7tKIDgdAIA6e7fwNZOa10GyFKA9MI3PEJicZo0GRsajpSCRC1EeQaSo36Q
        0RnZDh6XTtYHxIm/+S6Ak/GhtYVpgVG3/FGDMRA+Dx47X9aACQU1+ni9wGDxZEE+QsueWjAowvb
        PQd29FtL6J0aM=
X-Google-Smtp-Source: APiQypIlO4lEq29C1h4jR8ue1NC2n+RtU9iXYEwJOuKBWof9gUpEPYEuWzmUt2m9MHWT8ZLBJYOJmXDdJFY73js84Q==
X-Received: by 2002:a17:90a:82:: with SMTP id a2mr1469821pja.47.1585624610042;
 Mon, 30 Mar 2020 20:16:50 -0700 (PDT)
Date:   Tue, 31 Mar 2020 11:16:43 +0800
Message-Id: <20200331111631.Bluez.v2.1.I3621733fcf428d49c82b09bfc2bdc7d3b2f7894a@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [Bluez PATCH v2] monitor: Fix missing setting string
From:   Howard Chung <howardchung@google.com>
To:     linux-bluetooth@vger.kernel.org, luiz.von.dentz@intel.com
Cc:     chromeos-bluetooth-upstreaming@chromium.org,
        Howard Chung <howardchung@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add wideband speech to setting string
---

Changes in v2:
- resolve conflicts with Alain's change (aa2a5814)

 monitor/packet.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/monitor/packet.c b/monitor/packet.c
index 994ae6341..3d32563e6 100644
--- a/monitor/packet.c
+++ b/monitor/packet.c
@@ -11668,6 +11668,7 @@ static const struct bitfield_data mgmt_settings_table[] = {
 	{ 14, "Controller Configuration"},
 	{ 15, "Static Address"		},
 	{ 16, "PHY Configuration"	},
+	{ 17, "Wideband Speech"		},
 	{ }
 };
 
-- 
2.26.0.rc2.310.g2932bb562d-goog

