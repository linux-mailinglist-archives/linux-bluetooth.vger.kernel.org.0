Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E404E35284B
	for <lists+linux-bluetooth@lfdr.de>; Fri,  2 Apr 2021 11:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbhDBJMA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 2 Apr 2021 05:12:00 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:42903 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234275AbhDBJL7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 2 Apr 2021 05:11:59 -0400
Received: from marcel-macbook.holtmann.net (p5b3d2269.dip0.t-ipconnect.de [91.61.34.105])
        by mail.holtmann.org (Postfix) with ESMTPSA id 7E105CED23;
        Fri,  2 Apr 2021 11:19:39 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] Bluetooth: SMP: Fix variable dereferenced before check
 'conn'
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210329172704.117731-1-luiz.dentz@gmail.com>
Date:   Fri, 2 Apr 2021 11:11:57 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <E7D78D48-D59F-4810-AB09-467E6829C5A5@holtmann.org>
References: <20210329172704.117731-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This fixes kbuild findings:
> 
> smatch warnings:
> net/bluetooth/smp.c:1633 smp_user_confirm_reply() warn: variable
> dereferenced before check 'conn' (see line 1631)
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> net/bluetooth/smp.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

