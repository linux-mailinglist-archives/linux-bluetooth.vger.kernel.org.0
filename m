Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DEA239D1D
	for <lists+linux-bluetooth@lfdr.de>; Mon,  3 Aug 2020 02:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgHCAtG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 2 Aug 2020 20:49:06 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:40748 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727087AbgHCAtF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 2 Aug 2020 20:49:05 -0400
Received: by mail-io1-f71.google.com with SMTP id t22so16249872iob.7
        for <linux-bluetooth@vger.kernel.org>; Sun, 02 Aug 2020 17:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=zjMjCpZHpZC9oX4mSp6lGsDleX+rgZUM4Hc+zQq53tE=;
        b=HvSx+YC+FJ6MkO7/aIP1b1m5IdfpPvf61McOYUIUj1pVsEVz7lFuIZNJJqGm7ScFap
         Ts19JkeyBCxVMXWWpiA2bx1w6LxQpaBrgGGcmS9k3an8JGzgqL0G5e72QMPgEyIbJn+K
         +/rby+M2QUD2XGJsxHOmfYgJkZlefcfn7LUIgJy2PfUu14XSQmj8kmPRIFgCe/nRFInL
         rhS9umkJZJip+v/X1Ic/9nFotrvZ+brJHqALQOTplZUJH0yJN/80NvHujcuYz4ubZ334
         nzIP11N8NnxtNalYn/fSCP733MEg/jJss+FcQQTOIYhxGQX80rgxzoyUlW8m9tmL7M7S
         02fw==
X-Gm-Message-State: AOAM532vYDXdJ0Be3UsTYseBLZQQRdrBXeVPxmtFEJbtbHk4yuOOTfYm
        5hINBb/h4FK9i+K59cgs+hstpJTV0LqxJypRR6ochcNOGmBJ
X-Google-Smtp-Source: ABdhPJx51fMhfJaafxHzZAN2jjWSIrSl/b5CFIul4+GGQOi4s1mKok/hTo4u9c3s4cBgSHZ/wcwXjrq3H3VFwrd210mpw03EVfqe
MIME-Version: 1.0
X-Received: by 2002:a05:6602:15d0:: with SMTP id f16mr168098iow.45.1596415744953;
 Sun, 02 Aug 2020 17:49:04 -0700 (PDT)
Date:   Sun, 02 Aug 2020 17:49:04 -0700
In-Reply-To: <000000000000ab11c505abeb19f5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000064571305abee81ea@google.com>
Subject: Re: KASAN: use-after-free Write in __sco_sock_close
From:   syzbot <syzbot+077eca30d3cb7c02b273@syzkaller.appspotmail.com>
To:     coreteam@netfilter.org, davem@davemloft.net,
        devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
        johan.hedberg@gmail.com, kaber@trash.net, kadlec@blackhole.kfki.hu,
        kuba@kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        marcel@holtmann.org, mchehab@kernel.org, mchehab@s-opensource.com,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
        pablo@netfilter.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

syzbot has bisected this issue to:

commit 43ea43b9d8b27b7acd443ec59319faa3cdb8a616
Author: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Date:   Wed Oct 12 11:21:43 2016 +0000

    [media] radio-bcm2048: don't ignore errors

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1036e6a4900000
start commit:   ac3a0c84 Merge git://git.kernel.org/pub/scm/linux/kernel/g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1236e6a4900000
console output: https://syzkaller.appspot.com/x/log.txt?x=1436e6a4900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e59ee776d5aa8d55
dashboard link: https://syzkaller.appspot.com/bug?extid=077eca30d3cb7c02b273
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12cf1904900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d52e14900000

Reported-by: syzbot+077eca30d3cb7c02b273@syzkaller.appspotmail.com
Fixes: 43ea43b9d8b2 ("[media] radio-bcm2048: don't ignore errors")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
