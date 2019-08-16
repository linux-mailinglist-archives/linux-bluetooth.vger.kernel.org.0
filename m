Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8648FCA8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 16 Aug 2019 09:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbfHPHor (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 16 Aug 2019 03:44:47 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:32867 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfHPHoq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 16 Aug 2019 03:44:46 -0400
Received: by mail-pg1-f196.google.com with SMTP id n190so2551523pgn.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 16 Aug 2019 00:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UbAGClTM4OjINkw+2Q91ZXw2vkDsf3HaQidalB3K5l8=;
        b=I/474fKDUgOJ8ZeMaTnzMJBhv6P0OTTyVwVtFpqDDgnzjzjYn4oH0zd/Woa54MCt2C
         7V5IkVxPyOPAkYLV60xe0N+nOWSCriZz6D76riZKfivTSAua9r9D4zSHVHygMKk8caVl
         ooK02fe8uF60wVetoPbZQkDSPR96BdgxBX6Ngclidh3HCD0F/5lZdtYqjbCToRBjKZiB
         32rrIfJ5kEFAswNpptxKAJGu9rxuFRrU+KYng22yl38imlpvmzbaqFv0dkJSJkuDCTGP
         waYsXcECu2KDmkRLJFHA8egS0xhWsNlqdfZFJ0ZRWn4OwAjc7KBvgycmRxIXxPQC984D
         6V0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UbAGClTM4OjINkw+2Q91ZXw2vkDsf3HaQidalB3K5l8=;
        b=hn2jQzRrsF1kKo4LLEASMk09nMyyIbOR/4wUyfTxRRiBnSzi4/KV5OmPTipYAFE4dM
         Q1rOVfS9HFrykgCMDcxZpxhl1AfSknKlQSUmSFljUkHHlnRRGPawotuHd8HGrYNmQdfB
         rNDMrbBnVRO9nJjpyFFujD1tEddeaWaoU5mAVa3uOeD0XMiJSb8AYdI2ZtCLszgHAzRi
         9jW0WgMrujfNx4OYMSK1JrOIL/x1nOZoExtLthicAaSe2Dohhe7KDb2Do8hj4kvJI65Q
         5jf5CSFuAPMrVcA92vu86uDPWIjfMhDHvfiYoTkab5HtMW82WR7xAOJxyX79+ISaCfvv
         +wzQ==
X-Gm-Message-State: APjAAAWp+rAkvDoyv5rbixC9En2DlaXGrcSfKE5RA30YiIbhDxbhRE+A
        md+l0hQiqrG5NUthzeNnLS82RwQ=
X-Google-Smtp-Source: APXvYqw5vksS7xOEZq0FxUZF7hCDL0bU2twtNC8Ox+Fm8tYvv1cYIrhHcZPHBRpK0QCSBTW7Mmv/Gg==
X-Received: by 2002:a17:90a:a013:: with SMTP id q19mr5871419pjp.64.1565941485866;
        Fri, 16 Aug 2019 00:44:45 -0700 (PDT)
Received: from rxps.home ([2600:8800:1e00:242:71a0:9ddd:9d48:afb])
        by smtp.gmail.com with ESMTPSA id v184sm4186679pgd.34.2019.08.16.00.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 00:44:45 -0700 (PDT)
From:   Ronan Pigott <rpigott314@gmail.com>
X-Google-Original-From: Ronan Pigott
To:     linux-bluetooth@vger.kernel.org
Cc:     Ronan Pigott <rpigott@berkeley.edu>
Subject: [PATCH BlueZ 1/3] client/main: add help option for available args
Date:   Fri, 16 Aug 2019 00:43:31 -0700
Message-Id: <20190816074333.24673-2-rpigott@berkeley.edu>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190816074333.24673-1-rpigott@berkeley.edu>
References: <20190816074333.24673-1-rpigott@berkeley.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Ronan Pigott <rpigott@berkeley.edu>

---
 client/main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/client/main.c b/client/main.c
index 578b3c7c3..0f810901a 100644
--- a/client/main.c
+++ b/client/main.c
@@ -800,6 +800,14 @@ static gboolean parse_argument(int argc, char *argv[], const char **arg_table,
 {
 	const char **opt;
 
+	if (!strcmp(argv[1], "help")) {
+		for (opt = arg_table; opt && *opt; opt++) {
+			bt_shell_printf("%s\n", *opt);
+		}
+		bt_shell_noninteractive_quit(EXIT_SUCCESS);
+		return FALSE;
+	}
+
 	if (!strcmp(argv[1], "on") || !strcmp(argv[1], "yes")) {
 		*value = TRUE;
 		if (option)
-- 
2.22.1

