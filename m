Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F268387BBA
	for <lists+linux-bluetooth@lfdr.de>; Tue, 18 May 2021 16:54:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244245AbhERO4H (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 18 May 2021 10:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240593AbhERO4F (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 18 May 2021 10:56:05 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 870C3C061756
        for <linux-bluetooth@vger.kernel.org>; Tue, 18 May 2021 07:54:46 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id m11so14607094lfg.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 18 May 2021 07:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codecoup-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ph0XmSSI/oRzmF3YyObORn/j1oThgDBs46q4R6Eam2Q=;
        b=whVzvxWzqpoxJx5/4EO2U9yCUxvWlkvjD/7ZjF2E6y1Eqhj6CqxuZrDW4Z5kBG+sM7
         rC1WYIxx/tT8iZhb0f4qVA9+tJtvof5YtdTcvEdfHHLRfbncStTgZtuCYHWih5m3xRon
         1u3oD8r0o1kF+jaHST0oxgtZeool0x1790SnwMo3LKMWIV0mCulNyaNchCceu+ewSYel
         HdzmeE713ouqPiZuAhzXazUr2txjMjFQGWggCt5EiDUpvwFqfK/BmKctlh1yvaosNIM1
         L6Qg+jxTVJCJte56uhMpH+hJFZ30bu9FyBNm+LjrkRd1FX3we//gcOrhEYzCw/VVI35M
         dyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ph0XmSSI/oRzmF3YyObORn/j1oThgDBs46q4R6Eam2Q=;
        b=TfVL8lkE26fSPed7wT6Sy3PecMYThAwTx60A+WOjTiFQMl8Y+CH21+2tdLTdUixnbI
         5cFeRLhy0fHVN/jwAMrJCNR99MMRxVZVnusnSG0XLQiiumt15ew3aSi8n8zTw6CRUa76
         446IBN7iAqzyRU3LEglt1wlRDBylDm7fkrlRUBhcSYcdwNTS96sj9raTd68l2uYVdk9C
         CR3JR+mrethObPnlJNzdIfVCcuJ7EIUfGYQ5z67AGhMy0cSnPVdJQTpDnS1fW0Gz+HrO
         92qat2dmPrxy9AtiGg8jHS/vAaXMUuK3gaDlY1wsOXmwJXG1cFcfpxtdlJWPSSsCWzvJ
         TCag==
X-Gm-Message-State: AOAM53048t+SmXVzEViDX7Z410PcBU2K40SzyXgwtFwXUnhvGDmJhHRJ
        rcY7JPDp1bLTShNHyK3FWiTtgLJYanZhXg==
X-Google-Smtp-Source: ABdhPJwUjxpd/FSFJK4FYOiEEZIfBBwmMyLdrObQJtG8kDexpKfVOv9Pr2eiQHXNXhUHRjmtf9jdDQ==
X-Received: by 2002:a05:6512:3487:: with SMTP id v7mr4639735lfr.467.1621349684974;
        Tue, 18 May 2021 07:54:44 -0700 (PDT)
Received: from ix.cc.local ([95.143.243.62])
        by smtp.gmail.com with ESMTPSA id b17sm1294499lfb.275.2021.05.18.07.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 07:54:44 -0700 (PDT)
From:   Szymon Janc <szymon.janc@codecoup.pl>
To:     linux-bluetooth@vger.kernel.org
Cc:     Szymon Janc <szymon.janc@codecoup.pl>, stable@vger.kernel.org
Subject: [PATCH v2] Bluetooth: Remove spurious error message
Date:   Tue, 18 May 2021 16:54:36 +0200
Message-Id: <20210518145436.156997-1-szymon.janc@codecoup.pl>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Even with rate limited reporting this is very spammy and since
it is remote device that is providing bogus data there is no
need to report this as error.

Since real_len variable was used only to allow conditional error
message it is now also removed.

[72454.143336] bt_err_ratelimited: 10 callbacks suppressed
[72454.143337] Bluetooth: hci0: advertising data len corrected
[72454.296314] Bluetooth: hci0: advertising data len corrected
[72454.892329] Bluetooth: hci0: advertising data len corrected
[72455.051319] Bluetooth: hci0: advertising data len corrected
[72455.357326] Bluetooth: hci0: advertising data len corrected
[72455.663295] Bluetooth: hci0: advertising data len corrected
[72455.787278] Bluetooth: hci0: advertising data len corrected
[72455.942278] Bluetooth: hci0: advertising data len corrected
[72456.094276] Bluetooth: hci0: advertising data len corrected
[72456.249137] Bluetooth: hci0: advertising data len corrected
[72459.416333] bt_err_ratelimited: 13 callbacks suppressed
[72459.416334] Bluetooth: hci0: advertising data len corrected
[72459.721334] Bluetooth: hci0: advertising data len corrected
[72460.011317] Bluetooth: hci0: advertising data len corrected
[72460.327171] Bluetooth: hci0: advertising data len corrected
[72460.638294] Bluetooth: hci0: advertising data len corrected
[72460.946350] Bluetooth: hci0: advertising data len corrected
[72461.225320] Bluetooth: hci0: advertising data len corrected
[72461.690322] Bluetooth: hci0: advertising data len corrected
[72462.118318] Bluetooth: hci0: advertising data len corrected
[72462.427319] Bluetooth: hci0: advertising data len corrected
[72464.546319] bt_err_ratelimited: 7 callbacks suppressed
[72464.546319] Bluetooth: hci0: advertising data len corrected
[72464.857318] Bluetooth: hci0: advertising data len corrected
[72465.163332] Bluetooth: hci0: advertising data len corrected
[72465.278331] Bluetooth: hci0: advertising data len corrected
[72465.432323] Bluetooth: hci0: advertising data len corrected
[72465.891334] Bluetooth: hci0: advertising data len corrected
[72466.045334] Bluetooth: hci0: advertising data len corrected
[72466.197321] Bluetooth: hci0: advertising data len corrected
[72466.340318] Bluetooth: hci0: advertising data len corrected
[72466.498335] Bluetooth: hci0: advertising data len corrected
[72469.803299] bt_err_ratelimited: 10 callbacks suppressed

Signed-off-by: Szymon Janc <szymon.janc@codecoup.pl>
Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=203753
Cc: stable@vger.kernel.org
---
 net/bluetooth/hci_event.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 5e99968939ce..f15d8b85571a 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5441,7 +5441,7 @@ static void process_adv_report(struct hci_dev *hdev, u8 type, bdaddr_t *bdaddr,
 	struct hci_conn *conn;
 	bool match;
 	u32 flags;
-	u8 *ptr, real_len;
+	u8 *ptr;
 
 	switch (type) {
 	case LE_ADV_IND:
@@ -5472,14 +5472,10 @@ static void process_adv_report(struct hci_dev *hdev, u8 type, bdaddr_t *bdaddr,
 			break;
 	}
 
-	real_len = ptr - data;
-
-	/* Adjust for actual length */
-	if (len != real_len) {
-		bt_dev_err_ratelimited(hdev, "advertising data len corrected %u -> %u",
-				       len, real_len);
-		len = real_len;
-	}
+	/* Adjust for actual length. This handles the case when remote
+	 * device is advertising with incorrect data length.
+	 */
+	len = ptr - data;
 
 	/* If the direct address is present, then this report is from
 	 * a LE Direct Advertising Report event. In that case it is
-- 
2.31.1

