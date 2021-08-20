Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCAB33F2B80
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Aug 2021 13:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239233AbhHTLrQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 Aug 2021 07:47:16 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:51044 "EHLO
        mail.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238496AbhHTLrP (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 Aug 2021 07:47:15 -0400
Received: from localhost (unknown [149.11.102.75])
        by mail.monkeyblade.net (Postfix) with ESMTPSA id 839684D0F197C;
        Fri, 20 Aug 2021 04:46:34 -0700 (PDT)
Date:   Fri, 20 Aug 2021 12:46:29 +0100 (BST)
Message-Id: <20210820.124629.2213659775230733647.davem@davemloft.net>
To:     luiz.dentz@gmail.com
Cc:     kuba@kernel.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: pull request: bluetooth 2021-08-19
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20210819222307.242695-1-luiz.dentz@gmail.com>
References: <20210819222307.242695-1-luiz.dentz@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (mail.monkeyblade.net [0.0.0.0]); Fri, 20 Aug 2021 04:46:35 -0700 (PDT)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 19 Aug 2021 15:23:07 -0700

> The following changes since commit 4431531c482a2c05126caaa9fcc5053a4a5c495b:
> 
>   nfp: fix return statement in nfp_net_parse_meta() (2021-07-22 05:46:03 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git tags/for-net-next-2021-08-19
> 

There was a major merge conflict with the deferred hci cleanup fix that came in via
'net'.  Please double check my conflict resolution.

Thanks.

