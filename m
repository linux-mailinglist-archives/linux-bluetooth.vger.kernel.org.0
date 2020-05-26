Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 356BE1A164F
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Apr 2020 21:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgDGT4w (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 7 Apr 2020 15:56:52 -0400
Received: from 18.mo5.mail-out.ovh.net ([178.33.45.10]:45934 "EHLO
        18.mo5.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgDGT4w (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 7 Apr 2020 15:56:52 -0400
X-Greylist: delayed 82854 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Apr 2020 15:56:51 EDT
Received: from player159.ha.ovh.net (unknown [10.108.57.245])
        by mo5.mail-out.ovh.net (Postfix) with ESMTP id 563D427810F
        for <linux-bluetooth@vger.kernel.org>; Tue,  7 Apr 2020 21:41:06 +0200 (CEST)
Received: from labapart.com (mue-88-130-59-209.dsl.tropolys.de [88.130.59.209])
        (Authenticated sender: olivier@labapart.com)
        by player159.ha.ovh.net (Postfix) with ESMTPSA id B99891130FCBE;
        Tue,  7 Apr 2020 19:41:04 +0000 (UTC)
From:   Olivier Martin <olivier@labapart.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Olivier Martin <olivier@labapart.com>
Subject: [PATCH BlueZ v2] emulator: Fix command line parameters with optional argument
Date:   Tue,  7 Apr 2020 21:40:59 +0200
Message-Id: <20200407194059.5734-1-olivier@labapart.com>
X-Mailer: git-send-email 2.17.1
X-Ovh-Tracer-Id: 15515463669956177484
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudehgddufeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvffufffkofestddtredtredttdenucfhrhhomhepqfhlihhvihgvrhcuofgrrhhtihhnuceoohhlihhvihgvrheslhgrsggrphgrrhhtrdgtohhmqeenucfkpheptddrtddrtddrtddpkeekrddufedtrdehledrvddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepohhlihhvihgvrheslhgrsggrphgrrhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqsghluhgvthhoohhthhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Some parameters were missing the indication that additional
argument could be expected.
---
 btio/btio.c     | 8 ++++++--
 emulator/main.c | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/btio/btio.c b/btio/btio.c
index e7b4db16b..56c59f84e 100644
--- a/btio/btio.c
+++ b/btio/btio.c
@@ -1676,12 +1676,16 @@ GIOChannel *bt_io_connect(BtIOConnect connect, gpointer user_data,
 	ret = parse_set_opts(&opts, gerr, opt1, args);
 	va_end(args);
 
-	if (ret == FALSE)
+	if (ret == FALSE) {
+		fprintf(stderr, "bt_io_connect(type:%d) err1\n", opts.type);
 		return NULL;
+	}
 
 	io = create_io(FALSE, &opts, gerr);
-	if (io == NULL)
+	if (io == NULL) {
+		fprintf(stderr, "bt_io_connect(type:%d) err2\n", opts.type);
 		return NULL;
+	}
 
 	sock = g_io_channel_unix_get_fd(io);
 
diff --git a/emulator/main.c b/emulator/main.c
index 68c53488e..75cb79c7b 100644
--- a/emulator/main.c
+++ b/emulator/main.c
@@ -56,10 +56,12 @@ static void usage(void)
 	printf("options:\n"
 		"\t-S                    Create local serial port\n"
 		"\t-s                    Create local server sockets\n"
-		"\t-l [num]              Number of local controllers\n"
+		"\t-l[num]               Number of local controllers\n"
 		"\t-L                    Create LE only controller\n"
+		"\t-U[num]               Number of test LE controllers\n"
 		"\t-B                    Create BR/EDR only controller\n"
 		"\t-A                    Create AMP controller\n"
+		"\t-T[num]               Number of test AMP controllers\n"
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

