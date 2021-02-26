Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFBAF3268F7
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Feb 2021 21:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhBZUxX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 26 Feb 2021 15:53:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbhBZUxS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 26 Feb 2021 15:53:18 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FEB9C061574
        for <linux-bluetooth@vger.kernel.org>; Fri, 26 Feb 2021 12:52:38 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id t11so6927449pgu.8
        for <linux-bluetooth@vger.kernel.org>; Fri, 26 Feb 2021 12:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xSA8OC8xYp6WIWKkjeFv+Svg0SNCpp8lH8yyiIZksys=;
        b=cYghSY/99J8Y/nStwxBxfmHl71o2y6CCqIjSzq/XFhEvuhPxBqGbJaTxnWidfahMpO
         f0zEkJRi/2ODHAVk8WT3s7F6OCmjctvyuW0PoCjYLXat9GYdZ8whBMXPzXWzkRroj7c/
         pxn461Oh1g/x32wTb641CIpl183mlcgMW7bRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xSA8OC8xYp6WIWKkjeFv+Svg0SNCpp8lH8yyiIZksys=;
        b=l9rDRwUz1aQEq26Dlvzv8ckEpwmROJNPvt5ni+xRlrDZ9x3uvAcTLhYKF3df0rgU9O
         3c+LPb4W8cNlwpwr+XhGJKtCq0+IFl3lXH6Oc4e7jpgcIHkSCQSJ4ZsGdc9fECzq3Opd
         fad50cwe4aSNsHnKgTZNJzFcB2E9LHn351Nxq4LI1ilmj4NtmqwV7R8KMidIr99SvqmQ
         BO7TRmPu/iXqgtPKL/JN/1+TRIK1Dp2nU9GcbJV3/owxXpvHYM+JCZL7DUNTNscOvdV8
         yG422vR5SKuY63H1FD1OAo8iRkIZFiSqbI7pnmhZmkDcaPZqhkXSoO2ZOf28wuEgU+TP
         6vqw==
X-Gm-Message-State: AOAM532Mmx68ZALn4iOtUib40O2unIm52r8cZ2UaYA7dyy4T0EsVOB0S
        EIquKxJDcnVhljtUrxLBHbJzkMLYlPN08A==
X-Google-Smtp-Source: ABdhPJwHdAT1V4ul/gcEFco3/aj8qkBvRllE7EiDh0uOTH9vtv/L29O6wNjT61uBoTZS0plXFPJGgQ==
X-Received: by 2002:a62:ae18:0:b029:1ed:ac95:d8cb with SMTP id q24-20020a62ae180000b02901edac95d8cbmr5025965pff.69.1614372757700;
        Fri, 26 Feb 2021 12:52:37 -0800 (PST)
Received: from sonnysasaka-chrome.mtv.corp.google.com ([2620:15c:202:201:4f:7f05:ff8f:aee5])
        by smtp.gmail.com with ESMTPSA id q13sm10324551pfs.183.2021.02.26.12.52.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2021 12:52:37 -0800 (PST)
From:   Sonny Sasaka <sonnysasaka@chromium.org>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sonny Sasaka <sonnysasaka@chromium.org>,
        Daniel Winkler <danielwinkler@google.com>
Subject: [PATCH BlueZ v3] monitor: Add option to set fallback width
Date:   Fri, 26 Feb 2021 12:52:32 -0800
Message-Id: <20210226205232.6844-1-sonnysasaka@chromium.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Sometimes we want to be able to pipe the output of btmon to a
non-terminal device. The current fallback width is usually not long
enough so this patch adds an option to specify the column width. This is
especially needed for text logs from bluetoothd.

Reviewed-by: Daniel Winkler <danielwinkler@google.com>

---
 monitor/control.c |  4 ++--
 monitor/control.h |  2 +-
 monitor/display.c |  8 ++++++--
 monitor/display.h |  2 +-
 monitor/main.c    | 10 ++++++++--
 5 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/monitor/control.c b/monitor/control.c
index d1ba97d37..2fab87320 100644
--- a/monitor/control.c
+++ b/monitor/control.c
@@ -1474,7 +1474,7 @@ bool control_writer(const char *path)
 	return !!btsnoop_file;
 }
 
-void control_reader(const char *path, bool pager)
+void control_reader(const char *path, bool pager, int num_columns)
 {
 	unsigned char buf[BTSNOOP_MAX_PACKET_SIZE];
 	uint16_t pktlen;
@@ -1500,7 +1500,7 @@ void control_reader(const char *path, bool pager)
 	}
 
 	if (pager)
-		open_pager();
+		open_pager(num_columns);
 
 	switch (format) {
 	case BTSNOOP_FORMAT_HCI:
diff --git a/monitor/control.h b/monitor/control.h
index 29616c4f1..b96c542fc 100644
--- a/monitor/control.h
+++ b/monitor/control.h
@@ -12,7 +12,7 @@
 #include <stdint.h>
 
 bool control_writer(const char *path);
-void control_reader(const char *path, bool pager);
+void control_reader(const char *path, bool pager, int num_columns);
 void control_server(const char *path);
 int control_tty(const char *path, unsigned int speed);
 int control_rtt(char *jlink, char *rtt);
diff --git a/monitor/display.c b/monitor/display.c
index b11b71d5d..08db18147 100644
--- a/monitor/display.c
+++ b/monitor/display.c
@@ -28,6 +28,7 @@
 #include "display.h"
 
 static pid_t pager_pid = 0;
+static int n_columns = FALLBACK_TERMINAL_WIDTH;
 
 bool use_color(void)
 {
@@ -48,7 +49,8 @@ int num_columns(void)
 
 		if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &ws) < 0 ||
 								ws.ws_col == 0)
-			cached_num_columns = FALLBACK_TERMINAL_WIDTH;
+			cached_num_columns = n_columns > 0 ?
+				n_columns : FALLBACK_TERMINAL_WIDTH;
 		else
 			cached_num_columns = ws.ws_col;
 	}
@@ -81,12 +83,14 @@ static void wait_for_terminate(pid_t pid)
 	}
 }
 
-void open_pager(void)
+void open_pager(int columns)
 {
 	const char *pager;
 	pid_t parent_pid;
 	int fd[2];
 
+	n_columns = columns;
+
 	if (pager_pid > 0)
 		return;
 
diff --git a/monitor/display.h b/monitor/display.h
index f3a614b81..97aac8f7a 100644
--- a/monitor/display.h
+++ b/monitor/display.h
@@ -75,5 +75,5 @@ static inline uint64_t print_bitfield(int indent, uint64_t val,
 
 int num_columns(void);
 
-void open_pager(void);
+void open_pager(int);
 void close_pager(void);
diff --git a/monitor/main.c b/monitor/main.c
index 0f5eb4a3b..23a16660f 100644
--- a/monitor/main.c
+++ b/monitor/main.c
@@ -67,6 +67,7 @@ static void usage(void)
 		"\t                       Read data from RTT\n"
 		"\t-R  --rtt [<address>],[<area>],[<name>]\n"
 		"\t                       RTT control block parameters\n"
+		"\t-C, --column [width]   Output width if not a terminal\n"
 		"\t-h, --help             Show help options\n");
 }
 
@@ -90,6 +91,7 @@ static const struct option main_options[] = {
 	{ "no-pager",  no_argument,       NULL, 'P' },
 	{ "jlink",     required_argument, NULL, 'J' },
 	{ "rtt",       required_argument, NULL, 'R' },
+	{ "column",    required_argument, NULL, 'C' },
 	{ "todo",      no_argument,       NULL, '#' },
 	{ "version",   no_argument,       NULL, 'v' },
 	{ "help",      no_argument,       NULL, 'h' },
@@ -110,6 +112,7 @@ int main(int argc, char *argv[])
 	const char *str;
 	char *jlink = NULL;
 	char *rtt = NULL;
+	int num_columns = 0;
 	int exit_status;
 
 	mainloop_init();
@@ -121,7 +124,7 @@ int main(int argc, char *argv[])
 		struct sockaddr_un addr;
 
 		opt = getopt_long(argc, argv,
-					"r:w:a:s:p:i:d:B:V:MNtTSAE:PJ:R:vh",
+					"r:w:a:s:p:i:d:B:V:MNtTSAE:PJ:R:C:vh",
 					main_options, NULL);
 		if (opt < 0)
 			break;
@@ -205,6 +208,9 @@ int main(int argc, char *argv[])
 		case 'R':
 			rtt = optarg;
 			break;
+		case 'C':
+			num_columns = atoi(optarg);
+			break;
 		case '#':
 			packet_todo();
 			lmp_todo();
@@ -245,7 +251,7 @@ int main(int argc, char *argv[])
 		if (ellisys_server)
 			ellisys_enable(ellisys_server, ellisys_port);
 
-		control_reader(reader_path, use_pager);
+		control_reader(reader_path, use_pager, num_columns);
 		return EXIT_SUCCESS;
 	}
 
-- 
2.29.2

