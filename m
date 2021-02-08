Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3733F3133D9
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Feb 2021 14:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231697AbhBHNyL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 8 Feb 2021 08:54:11 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:56845 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbhBHNxw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 8 Feb 2021 08:53:52 -0500
Received: from marcel-macbook.holtmann.net (p4ff9f5d2.dip0.t-ipconnect.de [79.249.245.210])
        by mail.holtmann.org (Postfix) with ESMTPSA id 2DAA5CED06;
        Mon,  8 Feb 2021 15:00:36 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] Bluetooth: btusb: Some Qualcomm Bluetooth adapters stop
 working
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210208050237.42179-1-hui.wang@canonical.com>
Date:   Mon, 8 Feb 2021 14:53:07 +0100
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        rjliao@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <CA2C8796-11CA-4E6F-A603-AE764516C850@holtmann.org>
References: <20210208050237.42179-1-hui.wang@canonical.com>
To:     Hui Wang <hui.wang@canonical.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Hui,

> This issue starts from linux-5.10-rc1, I reproduced this issue on my
> Dell Inspiron 7447 with BT adapter 0cf3:e005, the kernel will print
> out: "Bluetooth: hci0: don't support firmware rome 0x31010000", and
> someone else also reported the similar issue to bugzilla #211571.
> 
> I found this is a regression introduced by 'commit b40f58b97386
> ("Bluetooth: btusb: Add Qualcomm Bluetooth SoC WCN6855 support"), the
> patch assumed that if high ROM version is not zero, it is an adapter
> on WCN6855, but many old adapters don't need to load rampatch or nvm,
> and they have non-zero high ROM version.
> 
> To fix it, let the driver match the rom_version in the
> qca_devices_table first, if there is no entry matched, check the
> high ROM version, if it is not zero, we assume this adapter is ready
> to work and no need to load rampatch and nvm like previously.
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=211571
> Fixes: b40f58b97386 ("Bluetooth: btusb: Add Qualcomm Bluetooth SoC WCN6855 support")
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
> drivers/bluetooth/btusb.c | 7 +++++++
> 1 file changed, 7 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

