Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0116E11CC51
	for <lists+linux-bluetooth@lfdr.de>; Thu, 12 Dec 2019 12:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729039AbfLLLfC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 12 Dec 2019 06:35:02 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:51822 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728871AbfLLLfB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 12 Dec 2019 06:35:01 -0500
Received: by mail-io1-f72.google.com with SMTP id t18so1296910iob.18
        for <linux-bluetooth@vger.kernel.org>; Thu, 12 Dec 2019 03:35:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=zFl6E7DmT67W68XqVzR2aCsqjcFpWexNUq+6/CXmVUk=;
        b=JCMjJjA/JAumZbRLqva1G3akEutiRJoo8pwrqw1l8Lp5FdQdACQBf1qH2n9s1nmGzi
         0ttrnnKU+GGrNVUbJUmVmOW6JEuKtYgaSNCpBMc06Bt7Scq2OTiiDKiQaQT+wyfOmrzf
         Wiel8+6K5J0JnGGDee9LnPTMcKams4KqKDHFv4wN+Xm8wzsck4ZdPQHuYnKEQ3PZxRIy
         zzkbswFBYUEC082rTfho8nA7ZuJriU0Q/1H/Xz3qCi5Foajl6xxaB33ezKmLzsJY/DZk
         +Ebz72MIzdxNFbHpvJAcbAxClZLvLytg8p+XSW3MvD47dvl0KhfDiml4SNzqAYpq4xyW
         si6g==
X-Gm-Message-State: APjAAAWu+P4AsHRccyOVuElwlNcLHhQ+TYwZ2ROSv9G+G7j0lohN6xsr
        qjtaj2YXvH+GU5kehPHA+rcbwp6wwIoksYQPARV9mnFi2RE7
X-Google-Smtp-Source: APXvYqx7tAF42179GqyQGzxmn7mnoZxL7LgtxR3PNlsI/lOpd2FmYULEa+vakNib69tHnoQvSF7+iHISpB+uiby7hAsvBYRTiqDc
MIME-Version: 1.0
X-Received: by 2002:a92:3b19:: with SMTP id i25mr7844146ila.85.1576150500982;
 Thu, 12 Dec 2019 03:35:00 -0800 (PST)
Date:   Thu, 12 Dec 2019 03:35:00 -0800
In-Reply-To: <000000000000b6b03205997b71cf@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b949ee0599802274@google.com>
Subject: Re: BUG: corrupted list in __dentry_kill (2)
From:   syzbot <syzbot+31043da7725b6ec210f1@syzkaller.appspotmail.com>
To:     a@unstable.cc, alex.aring@gmail.com, allison@lohutok.net,
        andrew@lunn.ch, andy@greyhouse.net, ap420073@gmail.com,
        ast@domdv.de, ast@kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
        bpf@vger.kernel.org, bridge@lists.linux-foundation.org,
        cleech@redhat.com, daniel@iogearbox.net, davem@davemloft.net,
        dsa@cumulusnetworks.com, dsahern@gmail.com, dvyukov@google.com,
        f.fainelli@gmail.com, fw@strlen.de, gregkh@linuxfoundation.org,
        haiyangz@microsoft.com, hawk@kernel.org, hdanton@sina.com,
        idosch@mellanox.com, info@metux.net, j.vosburgh@gmail.com, j@w1.fi,
        jakub.kicinski@netronome.com, jhs@mojatatu.com, jiri@mellanox.com,
        jiri@resnulli.us, johan.hedberg@gmail.com, johannes.berg@intel.com,
        john.fastabend@gmail.com, john.hurley@netronome.com,
        jwi@linux.ibm.com, kafai@fb.com, kstewart@linuxfoundation.org,
        kvalo@codeaurora.org, kys@microsoft.com,
        linux-bluetooth@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-hams@vger.kernel.org, linux-hyperv@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-wpan@vger.kernel.org,
        liuhangbin@gmail.com, marcel@holtmann.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

syzbot has bisected this bug to:

commit ab92d68fc22f9afab480153bd82a20f6e2533769
Author: Taehee Yoo <ap420073@gmail.com>
Date:   Mon Oct 21 18:47:51 2019 +0000

     net: core: add generic lockdep keys

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12d37cb6e00000
start commit:   938f49c8 Add linux-next specific files for 20191211
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=11d37cb6e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=16d37cb6e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=96834c884ba7bb81
dashboard link: https://syzkaller.appspot.com/bug?extid=31043da7725b6ec210f1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12dc83dae00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ac8396e00000

Reported-by: syzbot+31043da7725b6ec210f1@syzkaller.appspotmail.com
Fixes: ab92d68fc22f ("net: core: add generic lockdep keys")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
