Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79EAEE7F57
	for <lists+linux-bluetooth@lfdr.de>; Tue, 29 Oct 2019 05:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbfJ2EqC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 29 Oct 2019 00:46:02 -0400
Received: from mail-il1-f198.google.com ([209.85.166.198]:37942 "EHLO
        mail-il1-f198.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbfJ2EqC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 29 Oct 2019 00:46:02 -0400
Received: by mail-il1-f198.google.com with SMTP id f6so11855416ilg.5
        for <linux-bluetooth@vger.kernel.org>; Mon, 28 Oct 2019 21:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=YLV8f9ZsfAXyIIZYYq3+IarNtK/1IHU/hb3TF47qpcU=;
        b=AjKa9aNQaZfPDmQNGBIfDoa9OfuH+tAfc2ICCFiNE5lr+gDLs5f9RSZAVfWmkvqCe/
         raPx6YUXK3m26QJgMqlskx+2Cns1MwH4FCk8UVHGCEOlURJZefg4kwWGbB1RJZ1zk9sp
         T6+9kzZdp7mQh0D5IE+E3apV2ZOR7Du2ZoOYqN+bnurCqkXONgY5knwaBgGA35de0zaE
         f5KwpNjPKQrdVghkvXx4BbvVfEByoMP2W6GH2CuPIaamz61M9ouQ9t7jet5UZSxYAiDr
         jADL/py9vu1fTGLzleLkkM8OkQOmGn/9JM0y4kidtNd1mVyS5htk7CfG27U+lq2JRG71
         2nqw==
X-Gm-Message-State: APjAAAU+p5X3EHTutlpJJgnttXBuFCEe0HlFwiTUkGkkmyj98kqDFAnE
        gaw/FSXlNBtBuOn/NT7jjNOyAYHa29xkAe9/ZsQFk8ZcIkRE
X-Google-Smtp-Source: APXvYqy8A5HcqCyEPL5dtBElWBUVccfpfDJnoTHkuyLyMyzE3tC2AL+v78u811xV2KkRr1yWR23ZU1ZAqiGqqPS8jMwtkIRFFbuv
MIME-Version: 1.0
X-Received: by 2002:a5e:d90c:: with SMTP id n12mr1656385iop.140.1572324361470;
 Mon, 28 Oct 2019 21:46:01 -0700 (PDT)
Date:   Mon, 28 Oct 2019 21:46:01 -0700
In-Reply-To: <000000000000fc25a1059602460a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000987900596054b0f@google.com>
Subject: Re: INFO: trying to register non-static key in bond_3ad_update_lacp_rate
From:   syzbot <syzbot+0d083911ab18b710da71@syzkaller.appspotmail.com>
To:     a@unstable.cc, alex.aring@gmail.com, allison@lohutok.net,
        andrew@lunn.ch, andy@greyhouse.net, ap420073@gmail.com,
        aroulin@cumulusnetworks.com, ast@domdv.de,
        b.a.t.m.a.n@lists.open-mesh.org, bridge@lists.linux-foundation.org,
        cleech@redhat.com, daniel@iogearbox.net, davem@davemloft.net,
        dcaratti@redhat.com, dsa@cumulusnetworks.com, edumazet@google.com,
        f.fainelli@gmail.com, fw@strlen.de, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, gvaradar@cisco.com, haiyangz@microsoft.com,
        idosch@mellanox.com, info@metux.net, ivan.khoronzhuk@linaro.org,
        j.vosburgh@gmail.com, j@w1.fi, jakub.kicinski@netronome.com,
        jhs@mojatatu.com, jiri@mellanox.com, jiri@resnulli.us,
        johan.hedberg@gmail.com, johannes.berg@intel.com,
        john.hurley@netronome.com, jwi@linux.ibm.com,
        kstewart@linuxfoundation.org, kvalo@codeaurora.org,
        kys@microsoft.com, lariel@mellanox.com, linmiaohe@huawei.com,
        linux-bluetooth@vger.kernel.org, linux-hams@vger.kernel.org,
        linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ppp@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-wpan@vger.kernel.org, liuhangbin@gmail.com,
        marcel@holtmann.org, mareklindner@neomailbox.ch
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1467f674e00000
start commit:   60c1769a Add linux-next specific files for 20191028
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1667f674e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1267f674e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb86688f30db053d
dashboard link: https://syzkaller.appspot.com/bug?extid=0d083911ab18b710da71
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15381ee0e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11571570e00000

Reported-by: syzbot+0d083911ab18b710da71@syzkaller.appspotmail.com
Fixes: ab92d68fc22f ("net: core: add generic lockdep keys")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
