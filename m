Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF097393A30
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 May 2021 02:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234391AbhE1ASs (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 May 2021 20:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235763AbhE1ASj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 May 2021 20:18:39 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16FEC061760
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 May 2021 17:17:05 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id ne24-20020a17090b3758b029015f2dafecb0so1494999pjb.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 May 2021 17:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BDm5/hal/hrRRjdoMamCU9x+64nAi00IwZD7W+03ZPo=;
        b=T4en8SxgQvAui0hnFzxBgcSBPYfdBhROKPQAQNkHpSncvLVzCvoCdG1/QAuBZ9H+96
         I+VXJt2yZJgy+pnPC16XMAZmV/snokDl8pvFoOKvAq8IrODCQMpIyNWb/lj+1b3Y7izO
         a/uLfEaudefzD6JRgO8Y5AYWFLNujOwzodtOHPxU4JzXUuteEqFZo0hhzhNQ6Cv6S+4M
         AxkX2gufbfMSDpowxLcpMhgPeUaEoFpvkb8LwOgpDtSaxUshy6dSHwkQNoViunfOQ/6w
         RukzSey3g5ndJ1LTsh7pO3PzJEncBTCnFGOPhOOIg1HKYtY5HNjo/xjewTyu4qWezvEC
         kWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BDm5/hal/hrRRjdoMamCU9x+64nAi00IwZD7W+03ZPo=;
        b=NjPCnK+wXW4q8bXXy66KzuYFsvdWiDO/hc5q1ND+BcLv1SoGvSuk9q+j9eOoUcVSYc
         3QFdvrpeL4nEDpdtjjILIUOq6ASyOj21yq6tL/zMg1e+BHHxzHbZ0BiN0wQwse1ywWKD
         JvEObzzLkQOvaHZaA5McERo6pKU4J4bRiG6DAJur/uUpS0CjJw89w/U5bIOrr9uFG1bq
         UD4vjBCoSEaHSGEtNxGHjp8KoQUGM5LEiJdEwoTiw2/VeJLH5REU/cEip2/bznU+ilMK
         ZW7SOgJVJtZdHtqpWzRD0pBn/MY1Fib2ATE6oYB9hPFyDWS4kuRrpck6WrDt1NoeSMJ6
         U5aQ==
X-Gm-Message-State: AOAM5319czh5ddRII7fzJfy6fSPjkEdjVrtPZgh8WmjoHSIdXDK0eEXm
        E2arfEO4HlIONittG56eZtisAyKRvhs=
X-Google-Smtp-Source: ABdhPJzY9w2WorfeDcCIIUleInB+qUESaZWZGQpMu/M/ArG4yxuMT82FRggCi87XjeKH6Y+y6MrEKg==
X-Received: by 2002:a17:902:6904:b029:fb:42b6:e952 with SMTP id j4-20020a1709026904b02900fb42b6e952mr5699233plk.16.1622161025107;
        Thu, 27 May 2021 17:17:05 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id 125sm2634983pfg.52.2021.05.27.17.17.04
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 17:17:04 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: MGTM: Fix slab-out-of-bounds in tlv_data_is_valid
Date:   Thu, 27 May 2021 17:17:02 -0700
Message-Id: <20210528001702.69323-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Found with:

tools/mgmt-tester -s "Add Advertising - Success (ScRsp only)"

Add Advertising - Success (ScRsp only) - run
  Sending Add Advertising (0x003e)
  Test condition added, total 1
[   11.004577] ==================================================================
[   11.005292] BUG: KASAN: slab-out-of-bounds in tlv_data_is_valid+0x87/0xe0
[   11.005984] Read of size 1 at addr ffff888002c695b0 by task mgmt-tester/87
[   11.006711]
[   11.007176]
[   11.007429] Allocated by task 87:
[   11.008151]
[   11.008438] The buggy address belongs to the object at ffff888002c69580
[   11.008438]  which belongs to the cache kmalloc-64 of size 64
[   11.010526] The buggy address is located 48 bytes inside of
[   11.010526]  64-byte region [ffff888002c69580, ffff888002c695c0)
[   11.012423] The buggy address belongs to the page:
[   11.013291]
[   11.013544] Memory state around the buggy address:
[   11.014359]  ffff888002c69480: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[   11.015453]  ffff888002c69500: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[   11.016232] >ffff888002c69580: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
[   11.017010]                                      ^
[   11.017547]  ffff888002c69600: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
[   11.018296]  ffff888002c69680: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
[   11.019116] ==================================================================

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 net/bluetooth/mgmt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 91d36c3bf23e..b52e39fe0285 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -7590,6 +7590,9 @@ static bool tlv_data_is_valid(struct hci_dev *hdev, u32 adv_flags, u8 *data,
 	for (i = 0, cur_len = 0; i < len; i += (cur_len + 1)) {
 		cur_len = data[i];
 
+		if (!cur_len)
+			continue;
+
 		if (data[i + 1] == EIR_FLAGS &&
 		    (!is_adv_data || flags_managed(adv_flags)))
 			return false;
-- 
2.31.1

