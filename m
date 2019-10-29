Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 709EFE84B3
	for <lists+linux-bluetooth@lfdr.de>; Tue, 29 Oct 2019 10:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbfJ2JwF (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 29 Oct 2019 05:52:05 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:41812 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbfJ2JwF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 29 Oct 2019 05:52:05 -0400
Received: by mail-io1-f69.google.com with SMTP id s19so10637440ioe.8
        for <linux-bluetooth@vger.kernel.org>; Tue, 29 Oct 2019 02:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=KhTni5i4fWNYOrXXdKRZL7n4/+Q2oXySWZR+SGDk+1M=;
        b=b8XzWv2HineKdEFo5W9i6mxL+r4ADX+yAQpoH8+XresVzFZvFYMFw93wt/NzfZsqXZ
         ChR/I+PRw86PzSBAHhPfE6o91ATz68777kBUH1TtihlW5V8iqBYDL2CU2cxrA7nAQySz
         fFZHHBmh88waE1AUlZmAS1UVlP3TbKl9O1hMgnKK+B0S+WspsVfHfsoBmvR+M3dGg72B
         nri4HR18SDE3iazL3Q3JOrPtu8rZZWKv3d11QKAW6tVklLaBh0iYiOpbgpH4vYhNB4vU
         ZLNHYlrwMkgKQ8E+IaV3irdjYJhxlzmgRMmakZEAhMKmmvPi22t24pl/7txvuyJXcub1
         gO3Q==
X-Gm-Message-State: APjAAAU4j/80E+L39J/BONt+67gnpqFzl4S8HaHRm79UKwRJwbHPNm5B
        6musfmFdiyyj8kA1WeSWrCIjHIsv/DlzLXiykKIK8TtyvAt8
X-Google-Smtp-Source: APXvYqxJ9xrCQYDM3zjASN2O14TUYOL1Vq099EpzYllPSctTMS5wHjd4pXl9VmehlTUaytj82L6S0Af4Z1CPJkWAD5Rc60MY47Nk
MIME-Version: 1.0
X-Received: by 2002:a92:8dd9:: with SMTP id w86mr25132844ill.93.1572342721346;
 Tue, 29 Oct 2019 02:52:01 -0700 (PDT)
Date:   Tue, 29 Oct 2019 02:52:00 -0700
In-Reply-To: <000000000000044a7f0595fbaf2c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006db1370596099128@google.com>
Subject: Re: INFO: trying to register non-static key in bond_3ad_update_ad_actor_settings
From:   syzbot <syzbot+8da67f407bcba2c72e6e@syzkaller.appspotmail.com>
To:     a@unstable.cc, alex.aring@gmail.com, allison@lohutok.net,
        andrew@lunn.ch, andy@greyhouse.net, ap420073@gmail.com,
        aroulin@cumulusnetworks.com, ast@domdv.de,
        b.a.t.m.a.n@lists.open-mesh.org, bridge@lists.linux-foundation.org,
        cleech@redhat.com, daniel@iogearbox.net, davem@davemloft.net,
        dcaratti@redhat.com, dsa@cumulusnetworks.com, edumazet@google.com,
        f.fainelli@gmail.com, fw@strlen.de, gbastien@versatic.net,
        gregkh@linuxfoundation.org, gustavo@embeddedor.com,
        haiyangz@microsoft.com, idosch@mellanox.com, info@metux.net,
        ivan.khoronzhuk@linaro.org, j.vosburgh@gmail.com, j@w1.fi,
        jakub.kicinski@netronome.com, jhs@mojatatu.com, jiri@mellanox.com,
        jiri@resnulli.us, johan.hedberg@gmail.com, johannes.berg@intel.com,
        john.hurley@netronome.com, jwi@linux.ibm.com,
        kstewart@linuxfoundation.org, kvalo@codeaurora.org,
        kys@microsoft.com, linmiaohe@huawei.com,
        linux-bluetooth@vger.kernel.org, linux-hams@vger.kernel.org,
        linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ppp@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-wpan@vger.kernel.org, liuhangbin@gmail.com,
        marcel@holtmann.org, mareklindner@neomailbox.ch, mcroce@redhat.com
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12b54d70e00000
start commit:   60c1769a Add linux-next specific files for 20191028
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=11b54d70e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=16b54d70e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb86688f30db053d
dashboard link: https://syzkaller.appspot.com/bug?extid=8da67f407bcba2c72e6e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14d43a04e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16be3b9ce00000

Reported-by: syzbot+8da67f407bcba2c72e6e@syzkaller.appspotmail.com
Fixes: ab92d68fc22f ("net: core: add generic lockdep keys")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
