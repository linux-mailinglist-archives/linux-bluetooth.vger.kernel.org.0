Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C846FD05
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Apr 2019 17:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfD3PiO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Apr 2019 11:38:14 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39969 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfD3PiN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Apr 2019 11:38:13 -0400
Received: by mail-pf1-f196.google.com with SMTP id u17so3278630pfn.7
        for <linux-bluetooth@vger.kernel.org>; Tue, 30 Apr 2019 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wPaz7sqrWKUrAtzAW5vMHcrXvc4YTXq+0idwbiux/gM=;
        b=C4rmJC+XSY4dbiYlCJ9sE0hN+VEOgE8eclZCOX5S/it0Lxv0FKZ+0ZwUHzFvGPITPM
         ALgP1FKitRss2z9qwuanmIaLFveIosysjk1wk/Rfo0ZJ0+M95gHnLyKTsnvwSB7/kpDO
         U+FU8nkAPAPjjNHAgyiNmlx2uYi9lG/daXEFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wPaz7sqrWKUrAtzAW5vMHcrXvc4YTXq+0idwbiux/gM=;
        b=pf8eF+XonvSgVcDXz6ttbVW2KbEoIapcSwrRwXJLw3OmY3oaEmh7bKgSXJ9195nGo6
         2RxLFEaGWc14Dwx27DDfuTxYaZNrfq1o7CbLTCsfFOvrkcxzxNAd29fN0Q4RHZEPjR/u
         nnVipCLfm6Q91aJ9BVJNgAgz8gft5hxz9kk+SMaaD+g6Wa5IWuFLxIDOaq92Yk9UZRiK
         5ZcgYAdQaNCL64kIbtTxRDHZa+qYHoRc3gWuBzOzI92sE+yetlKRWGMXDFlLC8H8kPOy
         y+idQl1RP2Ttu8TFWpAXqr02Lfk2WapP1qF9lV7s+KQkz5GYJTYrOjRwvw7RCYNPfy+S
         0wew==
X-Gm-Message-State: APjAAAWJzndBIujkRfcaF88iMnUknpYGS1GX7CkjP85wY+eWS6icBzkC
        G6PQcjhzcwApqt+YkwxXHHPOqg==
X-Google-Smtp-Source: APXvYqzo8CUIafc4ViWksQdqXju1j8i5Z4JiKxGkUqzM/8ztPOvg4GMF59dfYlIKdYxG321+3bvr0w==
X-Received: by 2002:a62:27c2:: with SMTP id n185mr23839241pfn.51.1556638693191;
        Tue, 30 Apr 2019 08:38:13 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id z16sm4572022pfa.42.2019.04.30.08.38.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 08:38:12 -0700 (PDT)
Date:   Tue, 30 Apr 2019 08:38:11 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Harish Bandi <c-hbandi@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>
Subject: Re: [PATCH v8] Bluetooth: btqca: inject command complete event
 during fw download
Message-ID: <20190430153811.GK112750@google.com>
References: <20190430001024.209688-1-mka@chromium.org>
 <201904301409.dhHyM2xm%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <201904301409.dhHyM2xm%lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tue, Apr 30, 2019 at 02:27:33PM +0800, kbuild test robot wrote:
> Hi Matthias,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on bluetooth-next/master]
> [also build test ERROR on next-20190429]
> [cannot apply to v5.1-rc7]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Matthias-Kaehlcke/Bluetooth-btqca-inject-command-complete-event-during-fw-download/20190430-125407
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
> config: xtensa-allyesconfig (attached as .config)
> compiler: xtensa-linux-gcc (GCC) 8.1.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=8.1.0 make.cross ARCH=xtensa 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/bluetooth/btqca.c: In function 'qca_inject_cmd_complete_event':
> >> drivers/bluetooth/btqca.c:286:18: error: 'QCA_HCI_CC_SUCCESS' undeclared (first use in this function); did you mean 'QCA_HCI_CC_OPCODE'?
>      skb_put_u8(skb, QCA_HCI_CC_SUCCESS);
>                      ^~~~~~~~~~~~~~~~~~
>                      QCA_HCI_CC_OPCODE
>    drivers/bluetooth/btqca.c:286:18: note: each undeclared identifier is reported only once for each function it appears in
> 
> vim +286 drivers/bluetooth/btqca.c
> 
>    267	
>    268	static int qca_inject_cmd_complete_event(struct hci_dev *hdev)
>    269	{
>    270		struct hci_event_hdr *hdr;
>    271		struct hci_ev_cmd_complete *evt;
>    272		struct sk_buff *skb;
>    273	
>    274		skb = bt_skb_alloc(sizeof(*hdr) + sizeof(*evt) + 1, GFP_KERNEL);
>    275		if (!skb)
>    276			return -ENOMEM;
>    277	
>    278		hdr = skb_put(skb, sizeof(*hdr));
>    279		hdr->evt = HCI_EV_CMD_COMPLETE;
>    280		hdr->plen = sizeof(*evt) + 1;
>    281	
>    282		evt = skb_put(skb, sizeof(*evt));
>    283		evt->ncmd = 1;
>    284		evt->opcode = HCI_OP_NOP;
>    285	
>  > 286		skb_put_u8(skb, QCA_HCI_CC_SUCCESS);

Oh, I changed it in my tree, but somehow missed to include this file
in the commit ...

I'll fix it in the next version. Since I expect the change to remain
controversial I'll wait a bit for other comments before sending out
v9.

Thanks

Matthias
