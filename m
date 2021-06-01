Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C80A393CB9
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 May 2021 07:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbhE1FiX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 May 2021 01:38:23 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:55662 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbhE1FiX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 May 2021 01:38:23 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 9A3E4CECD3;
        Fri, 28 May 2021 07:44:43 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH] Bluetooth: MGTM: Fix slab-out-of-bounds in
 tlv_data_is_valid
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210528001702.69323-1-luiz.dentz@gmail.com>
Date:   Fri, 28 May 2021 07:36:47 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <5C8F114D-B1CF-40E2-9649-5C85CE6C5C4B@holtmann.org>
References: <20210528001702.69323-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> Found with:
> 
> tools/mgmt-tester -s "Add Advertising - Success (ScRsp only)"
> 
> Add Advertising - Success (ScRsp only) - run
>  Sending Add Advertising (0x003e)
>  Test condition added, total 1
> [   11.004577] ==================================================================
> [   11.005292] BUG: KASAN: slab-out-of-bounds in tlv_data_is_valid+0x87/0xe0
> [   11.005984] Read of size 1 at addr ffff888002c695b0 by task mgmt-tester/87
> [   11.006711]
> [   11.007176]
> [   11.007429] Allocated by task 87:
> [   11.008151]
> [   11.008438] The buggy address belongs to the object at ffff888002c69580
> [   11.008438]  which belongs to the cache kmalloc-64 of size 64
> [   11.010526] The buggy address is located 48 bytes inside of
> [   11.010526]  64-byte region [ffff888002c69580, ffff888002c695c0)
> [   11.012423] The buggy address belongs to the page:
> [   11.013291]
> [   11.013544] Memory state around the buggy address:
> [   11.014359]  ffff888002c69480: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> [   11.015453]  ffff888002c69500: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> [   11.016232] >ffff888002c69580: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
> [   11.017010]                                      ^
> [   11.017547]  ffff888002c69600: 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc
> [   11.018296]  ffff888002c69680: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> [   11.019116] ==================================================================
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/mgmt.c | 3 +++
> 1 file changed, 3 insertions(+)

please git blame this and add a Fixes: tag.

Regards

Marcel

