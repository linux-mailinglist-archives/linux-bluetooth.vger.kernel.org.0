Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C214478F248
	for <lists+linux-bluetooth@lfdr.de>; Thu, 31 Aug 2023 20:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346863AbjHaSH3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 31 Aug 2023 14:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245202AbjHaSH2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 31 Aug 2023 14:07:28 -0400
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BEEBE61
        for <linux-bluetooth@vger.kernel.org>; Thu, 31 Aug 2023 11:07:26 -0700 (PDT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-68a3b41fa66so1202767b3a.2
        for <linux-bluetooth@vger.kernel.org>; Thu, 31 Aug 2023 11:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693505245; x=1694110045;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=njfYBBE85fdBpuB5EzpnYY/diSr1FYw5dCw1nUvq2Vk=;
        b=QphZmvqh3yxK7Z2KSHeo0kBDAibTNJo2BVsoe8NWz200LkVT87LtR/nVZZdnEij/6P
         ZndAiOtB9B7qCySstyr9/qTuArJxVzKyA0QQ+P860eCKFShC25+AqALNRYa+4vKBPc22
         2985kAKXPHwHTznGjXQC4qaq3aZyD5pUO4F8q6+OZ7SY/0ROpbywdHiIB7tS0/hBlf8y
         B+uV0QQz0TfzfX9qxhvn46JFJtaloYe+Fnqo+7rpkFsi7z60A3lhd/SNjS7WueZ7g7qB
         73j/P11In7gvjL5G8Ik7RM+vAstxKgf8S1S/LGODdelqr+PU6oxrK4dJ4QGcwQCq6fOJ
         VudQ==
X-Gm-Message-State: AOJu0YyaZEN3Gx3KJ0bnrDuE0KH4oL5UF1m+JN/rGo84RbEX4QyPUOux
        UB9BNfd4PYKKZOnVDCMlYGDBqRw0p0GZWh7GscgUvuwu1xQS
X-Google-Smtp-Source: AGHT+IH8JEjKbyJOwR1AlsPkocQN5FnvA4GhXUZ7IAxgSPkZ0enwK1JVxfvdTuJyfySOUsuV1deb5dA+CsZkb7VxauvFD9EKxUhZ
MIME-Version: 1.0
X-Received: by 2002:a05:6a00:3997:b0:68a:58e1:ebf5 with SMTP id
 fi23-20020a056a00399700b0068a58e1ebf5mr176877pfb.2.1693505245662; Thu, 31 Aug
 2023 11:07:25 -0700 (PDT)
Date:   Thu, 31 Aug 2023 11:07:25 -0700
In-Reply-To: <0000000000005ab984060371583e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000097e45506043beaeb@google.com>
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in hci_send_acl
From:   syzbot <syzbot+a0c80b06ae2cb8895bc4@syzkaller.appspotmail.com>
To:     hdanton@sina.com, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        luiz.dentz@gmail.com, luiz.von.dentz@intel.com,
        marcel@holtmann.org, pav@iki.fi, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

syzbot has bisected this issue to:

commit 45c37c4e9c9aab5bb1cf5778d8e5ebd9f9ad820a
Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Date:   Wed Aug 9 23:49:33 2023 +0000

    Bluetooth: hci_sync: Fix UAF in hci_disconnect_all_sync

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1042c5ffa80000
start commit:   7271b2a53042 Add linux-next specific files for 20230818
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1242c5ffa80000
console output: https://syzkaller.appspot.com/x/log.txt?x=1442c5ffa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1936af09cdef7dd6
dashboard link: https://syzkaller.appspot.com/bug?extid=a0c80b06ae2cb8895bc4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13506923a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=147569efa80000

Reported-by: syzbot+a0c80b06ae2cb8895bc4@syzkaller.appspotmail.com
Fixes: 45c37c4e9c9a ("Bluetooth: hci_sync: Fix UAF in hci_disconnect_all_sync")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
