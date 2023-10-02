Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A93E7B535B
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Oct 2023 14:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237145AbjJBMjN (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 2 Oct 2023 08:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237123AbjJBMjL (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 2 Oct 2023 08:39:11 -0400
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23FCA6
        for <linux-bluetooth@vger.kernel.org>; Mon,  2 Oct 2023 05:39:07 -0700 (PDT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1e170528d43so2751833fac.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 02 Oct 2023 05:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696250347; x=1696855147;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ax/0ygFzmEqUVWv3uJMMzAPJF12ibxcuXFM4uIaqUFw=;
        b=Ia2+Uo06OVIxEORPf8CvP3uMfnNR1M3Ka8mQCo+jZnfJW+a2wT5Dr3BBxL2k204SKB
         0fVT92yihIpsk/J6j+Jn+ZR6dwYQIuUXRYX7xPV9RpoxQVicqCRd0d95OpRyL5n8NWA2
         V8cdVRmTuif1aeAZ5610UzAaoKwj2Z+L+tyawaY84yak2w+GNHq4IYC866RIELkeYbs+
         DgZfopT9rZ5Yls/eSRe2vH81BtiF2DSHzmU2Ua3qdjTB237TmD35P5aWUZMqbpkhC7Yn
         zsItni5lz8utuowy8fMaY7dsDRNbbGBfQmtQwM/61nfwtZISWU+xwOSpgufEHs6hS6oj
         u/jQ==
X-Gm-Message-State: AOJu0YzOkkCfNbTu0FGiijDEs/sspP5m3eOY4sm/u8Xiqf7AZOFZq90b
        Z8tNp5W9wCMqkD5TdipdLPeb2D6tscBoNGdSdKHmc6RsQdYl
X-Google-Smtp-Source: AGHT+IF8XXxAY6Zf2/JNj7NyaHcF14gbkoORTR8LAWNDcM70k+4lh/5ZhWzl2tSKfISeAP/V3vEI0v3o87ujhTbDKwL8o/iuUO72
MIME-Version: 1.0
X-Received: by 2002:a05:6871:6a8a:b0:1dc:709b:4d3a with SMTP id
 zf10-20020a0568716a8a00b001dc709b4d3amr4302493oab.11.1696250347335; Mon, 02
 Oct 2023 05:39:07 -0700 (PDT)
Date:   Mon, 02 Oct 2023 05:39:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006737750606bb0fbf@google.com>
Subject: [syzbot] Monthly bluetooth report (Oct 2023)
From:   syzbot <syzbot+list3df6e46edc66c4def70a@syzkaller.appspotmail.com>
To:     johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, luiz.dentz@gmail.com,
        marcel@holtmann.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello bluetooth maintainers/developers,

This is a 31-day syzbot report for the bluetooth subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/bluetooth

During the period, 5 new issues were detected and 0 were fixed.
In total, 25 issues are still open and 57 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  9857    Yes   possible deadlock in rfcomm_sk_state_change
                   https://syzkaller.appspot.com/bug?extid=d7ce59b06b3eb14fd218
<2>  4764    Yes   WARNING in hci_conn_timeout
                   https://syzkaller.appspot.com/bug?extid=2446dd3cb07277388db6
<3>  3667    Yes   possible deadlock in rfcomm_dlc_exists
                   https://syzkaller.appspot.com/bug?extid=b69a625d06e8ece26415
<4>  3091    Yes   BUG: sleeping function called from invalid context in hci_cmd_sync_submit
                   https://syzkaller.appspot.com/bug?extid=e7be5be00de0c3c2d782
<5>  740     Yes   KASAN: slab-use-after-free Read in hci_send_acl
                   https://syzkaller.appspot.com/bug?extid=a0c80b06ae2cb8895bc4
<6>  247     Yes   WARNING in call_timer_fn
                   https://syzkaller.appspot.com/bug?extid=6fb78d577e89e69602f9
<7>  145     Yes   possible deadlock in hci_dev_do_close
                   https://syzkaller.appspot.com/bug?extid=4e3a76c5c505a3f49083
<8>  119     No    possible deadlock in hci_unregister_dev
                   https://syzkaller.appspot.com/bug?extid=c933391d8e4089f1f53e
<9>  69      No    possible deadlock in discov_off
                   https://syzkaller.appspot.com/bug?extid=f047480b1e906b46a3f4
<10> 40      Yes   KASAN: slab-use-after-free Write in __sco_sock_close
                   https://syzkaller.appspot.com/bug?extid=dec4d528fb7a7c5d8ce3

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
