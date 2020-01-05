Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE2C130A9C
	for <lists+linux-bluetooth@lfdr.de>; Sun,  5 Jan 2020 23:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbgAEW6B (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 5 Jan 2020 17:58:01 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:35686 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgAEW6B (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 5 Jan 2020 17:58:01 -0500
Received: by mail-io1-f70.google.com with SMTP id x10so5915159iob.2
        for <linux-bluetooth@vger.kernel.org>; Sun, 05 Jan 2020 14:58:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=MybccZLowdSuY610EZVsc1I89suuz7NXH7uvIv0mFvY=;
        b=BGjqf2pUZNS6rj9fw34i4lASihFX0w3vSAqXkJ+Azez3khaAPPBtg5Y+xdiWlfYaue
         47zsgA6Ur03DyEA7hGunpWCqzV3/Z6sS/Nozu5vCTNxsxgN9PkC2972s7JOcK3CEVhrm
         BGRrdy+VzxcVVu6M7nErlh0gwlfyEMs9i56Mj1aOYoD1CWlfSbpH79wWI/zZZNLugVcu
         VvkAnXg18ClCn1Spwrtmnc7BU1UmzBFtiwBXjAtITlU1IdkIzfu+rgTiVCEyk6KJ9HFZ
         Y85qr0G7WKenbp8j1pUcG1XtxQGzBOZwVAdta1YPO31Y4KKVfNnwulHidCXFk9Iq+Sga
         0RGg==
X-Gm-Message-State: APjAAAVWCipbbqSRY28O/b+lRZ9X9Cy/GWGFOQ/bNG5SAUGdDheyhVln
        la9PmfNoTuIx45V07FR62PheRad79Fe0A/3L+48tWURBfFGP
X-Google-Smtp-Source: APXvYqwI1kaOaU+6OhN9mHkSBgJLPiiG9E2oMRL3MMauj8xdpOQ/nYJTOKJNppAbqi17MDpHQfb0GrThss7Ve4NxONRpCk4GrB8O
MIME-Version: 1.0
X-Received: by 2002:a92:3996:: with SMTP id h22mr81182568ilf.129.1578265080765;
 Sun, 05 Jan 2020 14:58:00 -0800 (PST)
Date:   Sun, 05 Jan 2020 14:58:00 -0800
In-Reply-To: <000000000000ab3f800598cec624@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000802598059b6c7989@google.com>
Subject: Re: WARNING: bad unlock balance in sch_direct_xmit
From:   syzbot <syzbot+4ec99438ed7450da6272@syzkaller.appspotmail.com>
To:     a@unstable.cc, alex.aring@gmail.com, allison@lohutok.net,
        andrew@lunn.ch, andy@greyhouse.net, ap420073@gmail.com,
        ast@domdv.de, b.a.t.m.a.n@lists.open-mesh.org,
        bridge@lists.linux-foundation.org, cleech@redhat.com,
        daniel@iogearbox.net, davem@davemloft.net, dsa@cumulusnetworks.com,
        f.fainelli@gmail.com, fw@strlen.de, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, haiyangz@microsoft.com, info@metux.net,
        j.vosburgh@gmail.com, j@w1.fi, jakub.kicinski@netronome.com,
        jhs@mojatatu.com, jiri@resnulli.us, johan.hedberg@gmail.com,
        johannes.berg@intel.com, jwi@linux.ibm.com,
        kstewart@linuxfoundation.org, kvalo@codeaurora.org,
        kys@microsoft.com, linmiaohe@huawei.com,
        linux-bluetooth@vger.kernel.org, linux-hams@vger.kernel.org,
        linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ppp@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-wpan@vger.kernel.org, liuhangbin@gmail.com,
        marcel@holtmann.org, mareklindner@neomailbox.ch, mkubecek@suse.cz,
        mmanning@vyatta.att-mail.com, netdev@vger.kernel.org,
        nikolay@cumulusnetworks.com, oss-drivers@netronome.com,
        paulus@samba.org, ralf@linux-mips.org, roopa@cumulusnetworks.com,
        sashal@kernel.org
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15e88ec6e00000
start commit:   36487907 Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=17e88ec6e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=13e88ec6e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f2f3ef188b7e16cf
dashboard link: https://syzkaller.appspot.com/bug?extid=4ec99438ed7450da6272
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1722c5c1e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=167aee3ee00000

Reported-by: syzbot+4ec99438ed7450da6272@syzkaller.appspotmail.com
Fixes: ab92d68fc22f ("net: core: add generic lockdep keys")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
