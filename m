Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F7D2A33BF
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Nov 2020 20:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgKBTMp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 2 Nov 2020 14:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgKBTMp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 2 Nov 2020 14:12:45 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD29C0617A6
        for <linux-bluetooth@vger.kernel.org>; Mon,  2 Nov 2020 11:12:45 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id k9so9923746pgt.9
        for <linux-bluetooth@vger.kernel.org>; Mon, 02 Nov 2020 11:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WGRil8ABN5YSJ0xudApipfKKb7KRCUPpKNOrW5HAdfg=;
        b=ptJ7ix4FRnUFQlnAcBkZXGtFCEm6m5jgmcdtQKOPgQ7MI8fZFss5OVqEjBfM5fzmZ4
         tWBrxxKSsYW0DbGq2oBp6ujh+/ENJcTbH/CQMiVjrUSQh17Mr3gA4rZjpAL2IyN8uD0X
         7paHm+JroetsYUrI63jSQVXN428SwcvoUEvUDcST0+3TR+N6JdEOmXBpqga68o/DsK93
         i0SNmcIvXTIys8+8LeUU3PbkjiBiSKBkfCsBdz+VHpi7mFl0tzx2ryeXjaTbnNFinRXh
         VfFe5x2Ko5yEriKIPWoBUP+4RO1a4NzgT1fxVv66AuNIlvNVNba/CxfaBBYOzSEb9nWH
         jRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WGRil8ABN5YSJ0xudApipfKKb7KRCUPpKNOrW5HAdfg=;
        b=NH0RjeA23wMYpgngL0p4r4S9UxTBqYm4TydF537zr6lZTJFOD9fSsTTUPXgO7er+30
         Ip/xd1hzSeaBldHlvwFAaI/bz2ka438655N/DmwLwh+KhyVHe1HxeNEhkCffeceEiDRh
         nrHZyG+aGjsSoitzflk578LG5UnAViQTasY0CkWe95sLNr3slRp+lVo5IIefoBDa4NWJ
         v+zPoyQCvtFAE1CBDfJW9MX3YQo1SuRUT+wk77kDNwTxXKp5nwzfpBYI/OBozz452O38
         oyHKgU7E6CKh60MlOSmrRkqGW/fv/gF13dji0MgVWgB8t/dRf2s5EPHPIJ+2Y/20JhSr
         /7Bw==
X-Gm-Message-State: AOAM533tr5060HqnTrEw1Dbj78PYWvP9hQxfg5qzHjS6p7FhUBzx1R0X
        9VXe1CyfIewlyGQFFNxY9yjulvnoFuPgtA==
X-Google-Smtp-Source: ABdhPJyiiMAWGEi+X+HLvHsp/CCyuBE7HmEgEtUkRL2JCFA/wsIeN3sefT2ovb6eMhblZ1TPtnmblg==
X-Received: by 2002:a62:dd56:0:b029:155:8165:c6c2 with SMTP id w83-20020a62dd560000b02901558165c6c2mr22368354pff.3.1604344364658;
        Mon, 02 Nov 2020 11:12:44 -0800 (PST)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id z10sm14589716pff.218.2020.11.02.11.12.43
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 11:12:44 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 11/11] tools/smp-tester: Enable hciemu debug
Date:   Mon,  2 Nov 2020 11:12:32 -0800
Message-Id: <20201102191232.1848737-11-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102191232.1848737-1-luiz.dentz@gmail.com>
References: <20201102191232.1848737-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This enable hciemu debug when debug is enabled.
---
 tools/smp-tester.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/smp-tester.c b/tools/smp-tester.c
index f64c1ab63..7823b6b17 100644
--- a/tools/smp-tester.c
+++ b/tools/smp-tester.c
@@ -82,7 +82,7 @@ struct smp_data {
 	bool sc;
 };
 
-static void mgmt_debug(const char *str, void *user_data)
+static void print_debug(const char *str, void *user_data)
 {
 	const char *prefix = user_data;
 
@@ -187,6 +187,9 @@ static void read_index_list_callback(uint8_t status, uint16_t length,
 		tester_pre_setup_failed();
 	}
 
+	if (tester_use_debug())
+		hciemu_set_debug(data->hciemu, print_debug, "hciemu: ", NULL);
+
 	tester_print("New hciemu instance created");
 }
 
@@ -210,7 +213,7 @@ static void test_pre_setup(const void *test_data)
 	}
 
 	if (tester_use_debug())
-		mgmt_set_debug(data->mgmt, mgmt_debug, "mgmt: ", NULL);
+		mgmt_set_debug(data->mgmt, print_debug, "mgmt: ", NULL);
 
 	mgmt_send(data->mgmt, MGMT_OP_READ_INDEX_LIST, MGMT_INDEX_NONE, 0, NULL,
 					read_index_list_callback, NULL, NULL);
-- 
2.26.2

