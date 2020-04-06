Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F54E1A0133
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Apr 2020 00:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgDFWn0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 6 Apr 2020 18:43:26 -0400
Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149]:34809 "EHLO
        2.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgDFWn0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 6 Apr 2020 18:43:26 -0400
X-Greylist: delayed 4201 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Apr 2020 18:43:25 EDT
Received: from player694.ha.ovh.net (unknown [10.108.35.223])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id 7F6B31D12AA
        for <linux-bluetooth@vger.kernel.org>; Mon,  6 Apr 2020 22:14:13 +0200 (CEST)
Received: from labapart.com (i577BCB24.versanet.de [87.123.203.36])
        (Authenticated sender: olivier@labapart.com)
        by player694.ha.ovh.net (Postfix) with ESMTPSA id 1F0EA11165BFB;
        Mon,  6 Apr 2020 20:14:12 +0000 (UTC)
From:   Olivier Martin <olivier@labapart.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Olivier Martin <olivier@labapart.com>
Subject: [PATCH BlueZ] emulator: Fix command line parameters with optional argument
Date:   Mon,  6 Apr 2020 22:14:10 +0200
Message-Id: <20200406201410.11803-1-olivier@labapart.com>
X-Mailer: git-send-email 2.17.1
X-Ovh-Tracer-Id: 10202060534162615884
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudefgddugedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofestddtredtredttdenucfhrhhomhepqfhlihhvihgvrhcuofgrrhhtihhnuceoohhlihhvihgvrheslhgrsggrphgrrhhtrdgtohhmqeenucfkpheptddrtddrtddrtddpkeejrdduvdefrddvtdefrdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheileegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepohhlihhvihgvrheslhgrsggrphgrrhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Some parameters were missing the indication that additional
argument could be expected.
---
 emulator/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/emulator/main.c b/emulator/main.c
index 68c53488e..3e32bf95d 100644
--- a/emulator/main.c
+++ b/emulator/main.c
@@ -58,8 +58,10 @@ static void usage(void)
 		"\t-s                    Create local server sockets\n"
 		"\t-l [num]              Number of local controllers\n"
 		"\t-L                    Create LE only controller\n"
+		"\t-U [num]              Number of test LE controllers\n"
 		"\t-B                    Create BR/EDR only controller\n"
 		"\t-A                    Create AMP controller\n"
+		"\t-T [num]              Number of test AMP controllers\n"
 		"\t-h, --help            Show help options\n");
 }
 
@@ -97,7 +99,7 @@ int main(int argc, char *argv[])
 	for (;;) {
 		int opt;
 
-		opt = getopt_long(argc, argv, "Ssl::LBAUTvh",
+		opt = getopt_long(argc, argv, "Ssl::LBAU::T::vh",
 						main_options, NULL);
 		if (opt < 0)
 			break;
-- 
2.17.1

