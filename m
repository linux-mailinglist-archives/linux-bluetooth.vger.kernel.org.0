Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7CE6F0C94
	for <lists+linux-bluetooth@lfdr.de>; Thu, 27 Apr 2023 21:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244281AbjD0TdG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 Apr 2023 15:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245514AbjD0Tcy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 Apr 2023 15:32:54 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E3E10CF
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 Apr 2023 12:32:53 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-329518648ebso68973435ab.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 27 Apr 2023 12:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682623972; x=1685215972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/6BjiB3CztTfLUdP27sBZNVOKuIvJqXf2EZ0PwMXGE=;
        b=XaKz/mw9Y2g0L8T4QZtLPLHZv+bk7NMwidoFU/ZmMh1K+AhwAEMBuy1xnJimPikhcG
         Wg50N2SMQlR9ipJ/Oj2V3syIsCPxE/kyylyVZbyO5V217M5odXacrBxy9eHViV9UFcTA
         oyAR19TPxJ8HlLjMut9u/tQjxrmiuRgn0D1kA078GYt8lqpHDgkdYUdrKEpprBDdIdvP
         xMFbj+X0bWAA+MZWY2cPVp3WUYNejbMPSfbiNNFfBrwpm3DM+QErjm9kanMLqk64RxrN
         tAQdbVrgtLdw7Lds5RQ3cueqDnSpQVVJZog5CTEE7YKZS9MhScEem1FFEUZaiHRq+nea
         v0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682623972; x=1685215972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/6BjiB3CztTfLUdP27sBZNVOKuIvJqXf2EZ0PwMXGE=;
        b=LCe9ngwnyFZx/Du3726HlOcJxIHP3ySQ/eOrdO0hmBfj7al9M5HlpcP3Q0jSE6I1IQ
         QnZwVqV3eoZGE+ymjQCbKwi3ynjJ39QlydTdn/j+zzi0I3BKrdzoiviUl1giNJMGssq9
         nhV4Zp1LjtMmi8m6yzW5mP9agwu9cnb0N3/vhrmt8jm9WniJQV7QMG0l8ix3NneAhhCk
         DfVkLZ+ocV+FEPQj0MO9/N8TDvDjhDZ7Dw9NhJswXjmuL5OO3svvtp8Yr3tRRXG3xAvC
         B4Cts2MOhzlvKPHJmCwZPNQ9nwICxIOzVLtjjHbWcyjLSkdjorwDxA+K8hoxnoW45egK
         +q4Q==
X-Gm-Message-State: AC+VfDykRTq6XLtSdxHD6bOvy3/XfJ3DIUB7okdmFYVqRzLIZkMUg6q2
        DFF0edFM9EDgg0CRzApZADE7/DvLjNI=
X-Google-Smtp-Source: ACHHUZ5uef4hOkJhXRN/QlW1zX+SUE8pc4DiZwVY2eU2MZt0VnEFVPkMcaK33BqK0PeRLNDbNtGgAg==
X-Received: by 2002:a92:2a0c:0:b0:323:1869:15a1 with SMTP id r12-20020a922a0c000000b00323186915a1mr1874873ile.25.1682623972162;
        Thu, 27 Apr 2023 12:32:52 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-59-129-171.hsd1.or.comcast.net. [71.59.129.171])
        by smtp.gmail.com with ESMTPSA id n12-20020a056638264c00b00411baa5ec5asm3349898jat.154.2023.04.27.12.32.50
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 12:32:51 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [BlueZ PATCH v2 3/9] share/bap: Fix not removing timeout on bap_free
Date:   Thu, 27 Apr 2023 12:32:39 -0700
Message-Id: <20230427193245.323502-3-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427193245.323502-1-luiz.dentz@gmail.com>
References: <20230427193245.323502-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This fixes not removing the process_id timeout when freeing the session
which can cause the following crash:

Invalid read of size 8
  at 0x18EB39: bap_debug (bap.c:553)
  by 0x1913A8: bap_process_queue (bap.c:3542)
  by 0x1A8630: timeout_callback (timeout-glib.c:25)
Address 0x55e0650 is 128 bytes inside a block of size 160 free'd
  at 0x48480E4: free (vg_replace_malloc.c:872)
---
 src/shared/bap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/shared/bap.c b/src/shared/bap.c
index bc6177a5ba90..6131c312865a 100644
--- a/src/shared/bap.c
+++ b/src/shared/bap.c
@@ -2600,6 +2600,8 @@ static void bap_free(void *data)
 {
 	struct bt_bap *bap = data;
 
+	timeout_remove(bap->process_id);
+
 	bt_bap_detach(bap);
 
 	bap_db_free(bap->rdb);
-- 
2.40.0

