Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9459576B536
	for <lists+linux-bluetooth@lfdr.de>; Tue,  1 Aug 2023 14:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbjHAMx6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 1 Aug 2023 08:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbjHAMx5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 1 Aug 2023 08:53:57 -0400
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46181FE8
        for <linux-bluetooth@vger.kernel.org>; Tue,  1 Aug 2023 05:53:54 -0700 (PDT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3a5ad0720d4so11717117b6e.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 01 Aug 2023 05:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690894434; x=1691499234;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kl63Gzb61Dydiu/7gl5BZvq7Fhlv/XlBdavmlXqdJ5s=;
        b=OJu/GjIV/nERLX4UTnxzGGB5eXUEYrYSR4BS/w+jL9oO+gOaN06CrCRod/lFEkc5XS
         aWNKP2hHPtLErQ6hatDzenwxfs2V8Z1lNb/f9GkUgP0L04i0gdPeVvcFZYbpFz/84a1X
         D5srMqNH3yTMblomlAMonelR3b96t/lUfnxlcLxGtEcSOp9Cf/0F/A1XmXjBB1Rf2iqM
         7Z1nGUnzHLxK7Z053+e1dXKGzcViWbslELMw+c9yYfmJKBuGhUTXWsehriSZL5VqE9u0
         R9BD2XxVdyOAXK1a++TP6VJTOAZ4HTi0hKQax9MrAyLFSvYzTr3NnqSawP7dhV4QAfQR
         gj3A==
X-Gm-Message-State: ABy/qLY4rxIHtDDtSL+N7usPqDgGSnucb4p5Xp1SWXRWk2UuKzjOy9+O
        o7+8DfwnFOq5HtcjL+OW+Jj/ghT3sFpQQx2roIHSF9xQU75U
X-Google-Smtp-Source: APBJJlF3HUFaj3eoA8O4FcQaoYxY1IIGdKgTFUPzZiN4aLgBhuTBtJFeHII4iY1B9an2OEVtt28SEhCWcQZ+/lN8AJK3D0iBdNF3
MIME-Version: 1.0
X-Received: by 2002:a05:6808:19a3:b0:3a4:2943:8f7 with SMTP id
 bj35-20020a05680819a300b003a4294308f7mr23752541oib.5.1690894434138; Tue, 01
 Aug 2023 05:53:54 -0700 (PDT)
Date:   Tue, 01 Aug 2023 05:53:54 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001981210601dc0aa5@google.com>
Subject: [syzbot] Monthly bluetooth report (Aug 2023)
From:   syzbot <syzbot+list513be271df212c03ceba@syzkaller.appspotmail.com>
To:     johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, luiz.dentz@gmail.com,
        marcel@holtmann.org, netdev@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello bluetooth maintainers/developers,

This is a 31-day syzbot report for the bluetooth subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/bluetooth

During the period, 1 new issues were detected and 1 were fixed.
In total, 23 issues are still open and 54 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 8070    Yes   possible deadlock in rfcomm_sk_state_change
                  https://syzkaller.appspot.com/bug?extid=d7ce59b06b3eb14fd218
<2> 4315    Yes   WARNING in hci_conn_timeout
                  https://syzkaller.appspot.com/bug?extid=2446dd3cb07277388db6
<3> 1974    Yes   possible deadlock in rfcomm_dlc_exists
                  https://syzkaller.appspot.com/bug?extid=b69a625d06e8ece26415
<4> 875     Yes   BUG: sleeping function called from invalid context in hci_cmd_sync_submit
                  https://syzkaller.appspot.com/bug?extid=e7be5be00de0c3c2d782
<5> 151     Yes   WARNING in call_timer_fn
                  https://syzkaller.appspot.com/bug?extid=6fb78d577e89e69602f9
<6> 84      No    possible deadlock in hci_unregister_dev
                  https://syzkaller.appspot.com/bug?extid=c933391d8e4089f1f53e
<7> 51      No    possible deadlock in discov_off
                  https://syzkaller.appspot.com/bug?extid=f047480b1e906b46a3f4
<8> 4       No    KASAN: slab-use-after-free Write in sco_conn_del
                  https://syzkaller.appspot.com/bug?extid=6b9277cad941daf126a2

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
