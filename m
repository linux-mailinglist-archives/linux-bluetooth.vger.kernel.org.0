Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0E8C15B14F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 12 Feb 2020 20:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgBLTtU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 12 Feb 2020 14:49:20 -0500
Received: from gateway36.websitewelcome.com ([192.185.188.18]:40248 "EHLO
        gateway36.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727439AbgBLTtU (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 12 Feb 2020 14:49:20 -0500
X-Greylist: delayed 1233 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 14:49:19 EST
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway36.websitewelcome.com (Postfix) with ESMTP id 168F140955E0A
        for <linux-bluetooth@vger.kernel.org>; Wed, 12 Feb 2020 12:42:49 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 1xgjj0ha9RP4z1xgjjSKhS; Wed, 12 Feb 2020 13:28:45 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GLQRqO9qBiBgvx5iIVYH7SAy6igUj4/Se4YJcTpd4Uc=; b=djvwU+RtA4hzE8ETixJL+QtaCH
        DPmZeGdoGlryypEb/bZCGw85EkV5aOI+Up5JbbulEpxubacWLqiFETsw/YNFcVRYLqQbU5IhyHsqo
        kqNxXDv9fpX9wCISf9bryT4alB2hy2cSFa3wMR71d1NFIxqAhB+J6iriahyU2E78HGQNpY03FbTDY
        SaR6BOe8aQ4aQcdXNFgGz+L0eRwxTre5U8iPSDK6K4RvPoj5Zczt+XfiKvaXrDxhxJsZ5n0HaX4Nk
        HgmoAioHcPEO+HJv7rugmZWVCw0D2zgYafZ10TRCRDCEf94Y95j3/1n+T4DopDWUu4dl+2mcxz/zY
        i+/Sqqkw==;
Received: from [201.144.174.25] (port=14408 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j1xgi-0016Mw-Gn; Wed, 12 Feb 2020 13:28:44 -0600
Date:   Wed, 12 Feb 2020 13:31:19 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] Bluetooth: hci_intel: Replace zero-length array with
 flexible-array member
Message-ID: <20200212193119.GA27048@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.144.174.25
X-Source-L: No
X-Exim-ID: 1j1xgi-0016Mw-Gn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.144.174.25]:14408
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 15
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertenly introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/bluetooth/hci_intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_intel.c b/drivers/bluetooth/hci_intel.c
index 31f25153087d..f1299da6eed8 100644
--- a/drivers/bluetooth/hci_intel.c
+++ b/drivers/bluetooth/hci_intel.c
@@ -49,7 +49,7 @@
 struct hci_lpm_pkt {
 	__u8 opcode;
 	__u8 dlen;
-	__u8 data[0];
+	__u8 data[];
 } __packed;
 
 struct intel_device {
-- 
2.25.0

