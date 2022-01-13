Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02A548D8D3
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 Jan 2022 14:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235126AbiAMN1P (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 13 Jan 2022 08:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiAMN1P (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 13 Jan 2022 08:27:15 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC88EC06173F;
        Thu, 13 Jan 2022 05:27:14 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id x22so19361461lfd.10;
        Thu, 13 Jan 2022 05:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G72ZDsNgZpbxHJadsjYOpB+FuUHajnp+ihIWoz3Zf7k=;
        b=fsF2iaPxk6cXPdIJJNtjHoUWgG22LpQspTstEjGJSoo/KxQwWNLpIFYiTsGi24gmFk
         Wjx2JxC/zQZ1tit5p0pPr1dhn3otpuuqCavM0C/KVvgQAZNVTOZOyoJ2D7NcSz9ejXnk
         UrbqB1XBObkBYX0kxwF1W8JdKN6HoHicXOPt6IHNuKEmHNo7v2hVO5UOLr4r7gsxCLvV
         JlKgh3t9bZ4wnNLIsTGC3LIUNS0F40KH/O3etUT7azgI0hX/9aHf9KSIoRN7VGcy0+x8
         jn9LJ5+04A2CelKckZGIHmwjiqhOgJC1Uilcu4Tvz9v3lgf45nUszw1HxbfdxmKJz9PG
         AFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G72ZDsNgZpbxHJadsjYOpB+FuUHajnp+ihIWoz3Zf7k=;
        b=Rss5aUUASV4XwQXo6kojNU5fUnwb6eq1YQz7Wt/HiyePsHl3mkhuJwg9NKcLpgLpTz
         h3HvgsJo0Q5sTBH1exC2kKKyyNpD5T+uI23miWq4KKoJgZsrdolDQ6QuPNdKce+CPM4m
         e3PHQxlWUZ11J8H3dZCRrj0sDyWOtrarzgSicVjqqJDyvrD0FOxNehpqFNJJgk8l9+Ee
         wdl9ffUhgm1M4Krlxfc9IuwaCKvWi+YVLM4VhQdTJAYgvBhp3HrPGj/YHEX2NsazwWyO
         EPm5CYDZRkAbpOG/lhx2c8qMDJyNEPDyX23JtWfK0zw1maC/5SzDN4RK4RbiacK+ex9H
         5wag==
X-Gm-Message-State: AOAM531ki9P3OmnGgOd03CfgwNHu+/LpjZV2u8dKs6gUBwCsDzMDE9LV
        fxmRL7vDanjZoiM/4tgr5s8=
X-Google-Smtp-Source: ABdhPJy62I8/4CY0JCMHFdEmot2tO5odHLO82mfhXJ5VDMK3ffOrqBI7GKkTXmTzSayP+nyE+lPHog==
X-Received: by 2002:a05:651c:2059:: with SMTP id t25mr3001801ljo.427.1642080433041;
        Thu, 13 Jan 2022 05:27:13 -0800 (PST)
Received: from localhost.localdomain ([217.117.245.67])
        by smtp.gmail.com with ESMTPSA id e4sm267609ljj.97.2022.01.13.05.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 05:27:12 -0800 (PST)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        lukas@wunner.de
Cc:     linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        Yiru Xu <xyru1999@gmail.com>
Subject: [PATCH] Bluetooth: hci_serdev: call init_rwsem() before p->open()
Date:   Thu, 13 Jan 2022 16:27:04 +0300
Message-Id: <20220113132704.4354-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

kvartet reported, that hci_uart_tx_wakeup() uses uninitialized rwsem.
The problem was in wrong place for percpu_init_rwsem() call.

hci_uart_proto::open() may register a timer whose callback may call
hci_uart_tx_wakeup(). There is a chance, that hci_uart_register_device()
thread won't be fast enough to call percpu_init_rwsem().

Fix it my moving percpu_init_rwsem() call before p->open().

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 2 PID: 18524 Comm: syz-executor.5 Not tainted 5.16.0-rc6 #9
...
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 assign_lock_key kernel/locking/lockdep.c:951 [inline]
 register_lock_class+0x148d/0x1950 kernel/locking/lockdep.c:1263
 __lock_acquire+0x106/0x57e0 kernel/locking/lockdep.c:4906
 lock_acquire kernel/locking/lockdep.c:5637 [inline]
 lock_acquire+0x1ab/0x520 kernel/locking/lockdep.c:5602
 percpu_down_read_trylock include/linux/percpu-rwsem.h:92 [inline]
 hci_uart_tx_wakeup+0x12e/0x490 drivers/bluetooth/hci_ldisc.c:124
 h5_timed_event+0x32f/0x6a0 drivers/bluetooth/hci_h5.c:188
 call_timer_fn+0x1a5/0x6b0 kernel/time/timer.c:1421

Fixes: d73e17281665 ("Bluetooth: hci_serdev: Init hci_uart proto_lock to avoid oops")
Reported-by: Yiru Xu <xyru1999@gmail.com>
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/bluetooth/hci_serdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index 9e03402ef1b3..e9a44ab3812d 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -305,6 +305,8 @@ int hci_uart_register_device(struct hci_uart *hu,
 	if (err)
 		return err;
 
+	percpu_init_rwsem(&hu->proto_lock);
+
 	err = p->open(hu);
 	if (err)
 		goto err_open;
@@ -327,7 +329,6 @@ int hci_uart_register_device(struct hci_uart *hu,
 
 	INIT_WORK(&hu->init_ready, hci_uart_init_work);
 	INIT_WORK(&hu->write_work, hci_uart_write_work);
-	percpu_init_rwsem(&hu->proto_lock);
 
 	/* Only when vendor specific setup callback is provided, consider
 	 * the manufacturer information valid. This avoids filling in the
-- 
2.34.1

