Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC114138414
	for <lists+linux-bluetooth@lfdr.de>; Sun, 12 Jan 2020 00:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731741AbgAKXik (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 11 Jan 2020 18:38:40 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:52423 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731701AbgAKXic (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 11 Jan 2020 18:38:32 -0500
Received: by mail-il1-f199.google.com with SMTP id n9so4757852ilm.19
        for <linux-bluetooth@vger.kernel.org>; Sat, 11 Jan 2020 15:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=HG8PSEk+Nu2G0yzQ1sauBjh8yX4UWlbofl1tNDseMog=;
        b=MgH/VQMc1Q/OsafPfjJZoEF2lXaQBYrKJCXUNWvuqUv5dvvJivrKenMDI6wprALuYf
         eRvoBhma+GMmSJNIB5zFLu3otaM+iPWCK91t06oe5iy2pPJIipp39ThMTJkbH+IlFjoQ
         RAstH07NVnCTf0kKyd2XyrR+gVI01zgdVFPngl1R2R5qIT3YiEQs/+VS0E0QfEzBc/r1
         9wcPImHQtOh6sL0JxiAhZR2OrTucuROHsM6lSVwp8AeCzf7S/IEv8JS8636DHcapkejF
         8gTZovdgarcMTa8QGMuuwYD0ltptJqVTYqy9V+U6lzSZe5GRAoxbwLFCHOY2Gu8pjEmo
         4QrA==
X-Gm-Message-State: APjAAAVIIbg4eKT/WgErofC6W15SgBADfVjoyujwFX/8HRsljdepnmEB
        8YhVCzjJUYQjRGW+R8Q3nu2FiVFLtUdkOJc/9KPedklIjy5o
X-Google-Smtp-Source: APXvYqzY3G/r7L2fdqmCj2j/h1C1sHPcBcM4PyU4coxfrfPzxUmQUqHGDBOKiBTJVPd2Dc1kvuMmxK6iFOuHlz4BJK9Zg+ciJv/g
MIME-Version: 1.0
X-Received: by 2002:a6b:c804:: with SMTP id y4mr7776396iof.210.1578785911931;
 Sat, 11 Jan 2020 15:38:31 -0800 (PST)
Date:   Sat, 11 Jan 2020 15:38:31 -0800
In-Reply-To: <CAM_iQpWN-SKjjrG_7EQ-x+7UMiu6foaNWMJuwQuwN0BGmayB+A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000751268059be5bdfc@google.com>
Subject: Re: Re: WARNING: bad unlock balance in __dev_queue_xmit
From:   syzbot <syzbot+ad4ea1dd5d26131a58a6@syzkaller.appspotmail.com>
To:     Cong Wang <xiyou.wangcong@gmail.com>
Cc:     a@unstable.cc, alex.aring@gmail.com, allison@lohutok.net,
        andrew@lunn.ch, andy@greyhouse.net, ap420073@gmail.com,
        ast@domdv.de, b.a.t.m.a.n@lists.open-mesh.org,
        bridge@lists.linux-foundation.org, cleech@redhat.com,
        daniel@iogearbox.net, davem@davemloft.net, dsa@cumulusnetworks.com,
        f.fainelli@gmail.com, fw@strlen.de, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, haiyangz@microsoft.com, info@metux.net,
        j.vosburgh@gmail.com, j@w1.fi, jakub.kicinski@netronome.com,
        jhs@mojatatu.com, jiri@resnulli.us, johan.hedberg@gmail.com,
        johannes.berg@intel.com, john.hurley@netronome.com,
        jwi@linux.ibm.com, kstewart@linuxfoundation.org,
        kuznet@ms2.inr.ac.ru, kvalo@codeaurora.org, kys@microsoft.com,
        linmiaohe@huawei.com, linux-bluetooth@vger.kernel.org,
        linux-hams@vger.kernel.org, linux-hyperv@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ppp@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-wpan@vger.kernel.org,
        liuhangbin@gmail.com, marcel@holtmann.org,
        mareklindner@neomailbox.ch, mkubecek@suse.cz,
        mmanning@vyatta.att-mail.com, netdev@vger.kernel.org,
        nikolay@cumulusnetworks.com, oss-drivers@netronome.com,
        pabeni@redhat.com, paulus@samba.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

> #syz dup: WARNING: bad unlock balance in sch_direct_xmit

Your 'dup:' command is accepted, but please keep  
syzkaller-bugs@googlegroups.com mailing list in CC next time. It serves as  
a history of what happened with each bug report. Thank you.

