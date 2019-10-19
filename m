Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42DEADD704
	for <lists+linux-bluetooth@lfdr.de>; Sat, 19 Oct 2019 08:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfJSGyB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 19 Oct 2019 02:54:01 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40686 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbfJSGyB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 19 Oct 2019 02:54:01 -0400
Received: by mail-pg1-f195.google.com with SMTP id e13so4565240pga.7
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Oct 2019 23:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j/xrTW3Vtfy8sVm4S9uCW0R8KyIbpsPtDUTj2Kq91s8=;
        b=dSeoTUJXkJKDcNN2wGAtJilCARbHqPF/azju6wMegCFJwEWLiANMoib9YYdfcHW4sL
         3FVWKjISNmu+Y1d4mqGsr7yIo3rjkQTbdToAlLkYcFtZK+k/bEDqNRapfZ1lRw4m5H4G
         pMRmgfm8YBJm50kwH2JPuaJs4Jl3IacOmttWnP/9v6GMbbQ+nfUTvip9d6lp/fm539Q1
         +8fmqCspu9BXNmJHHdU9YVusbeu5Yh2D+InoHSDDmRmELD8Y5eTw7kErVF2QmJGkkCJg
         98T2CYcbrcKEnqppzE615/2OKTX8+h6hhi7KsU6ffVKGaiPxmUaF0qrMyVs5etuMGN9H
         itag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j/xrTW3Vtfy8sVm4S9uCW0R8KyIbpsPtDUTj2Kq91s8=;
        b=rKQdQkgI28eqGt5FdOJr92E9aoTkdlSgm+tmnoy930lRQh/um6iGyQfFtEq0ox4vxL
         OI8sJ7yb6OqiT9ZauaFDuMh+QzAT28TXfLktsfR1nTCpsYZ8f84EOnbYlyMokqaN9zF4
         TxtWYs+XpVXb6I/5OylrhxQVCMF0MHbHa6lCI28UJ685fi5hkQeKSqU7R/adEp/WGcfo
         s+R4N+/6TQR70C415dvNvbv6j6nZbdnE6N9h44QHJ9dghkWxoiNX5jTxhPvxdl5Aeazb
         N3LQ2XqwTplH6LWNSPsF6kyqgupAcqFPjyvLMT9EA7RWH7/oEBq/Uq/ND31eucC2OaNV
         GA4Q==
X-Gm-Message-State: APjAAAXj8T5gH8eoZMVtCXWDzC04zJAK6S+6qM4bT68gQUlbS64bQgYx
        ly710o81lwQjEmsuIepyocup9lN8bRg=
X-Google-Smtp-Source: APXvYqwASprbQzmk0qrYKaPXnA3ANBnQHtpiHjahQN3elbE+NmAPFOAil8Vw15Bi/ycqC4xt6bmIXQ==
X-Received: by 2002:a17:90a:cd03:: with SMTP id d3mr15582968pju.137.1571468039786;
        Fri, 18 Oct 2019 23:53:59 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id x19sm11835494pgc.59.2019.10.18.23.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 23:53:59 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Subject: [RFC Bluez] lib/sdb: Don't include NULL terminator in string's unitSize
Date:   Fri, 18 Oct 2019 23:53:44 -0700
Message-Id: <20191019065344.26795-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

HID report descriptors are 8-bit unsigned arrays (Data Element Type =
Text String (4), Data Element Size = array (5, 6, or 7)), so they are
parsed by extract_str(). Setting unitSize to "n + 1" in that case
results in NULL terminator of the string being passed as a part of a
HID report descriptor to the kernel. This causes harmless but
confusing "unknown main item tag 0x0" warning in dmesg. Change
unitSize to be "n" to avoid the problem.

The warning has been observed on the following hardware:

   - PowerA Wireless GameCube Style Controller for Nintendo

   - Sony DualShock 4 Controller connected via BT (works fine via USB)
---

Not sure if this is a right place to fix this or if I missed
something, hence the RFC tag. Maybe modifying extract_hid_desc_data()
would be more appropriate? Please let me know.

Thanks,
Andrey Smirnov

 lib/sdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sdp.c b/lib/sdp.c
index 84311eda1..6c0db825e 100644
--- a/lib/sdp.c
+++ b/lib/sdp.c
@@ -1211,7 +1211,7 @@ static sdp_data_t *extract_str(const void *p, int bufsize, int *len)
 	SDPDBG("Str : %s", s);
 
 	d->val.str = s;
-	d->unitSize = n + sizeof(uint8_t);
+	d->unitSize = n;
 	return d;
 }
 
-- 
2.21.0

