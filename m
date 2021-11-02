Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFB544280F
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Nov 2021 08:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhKBHSh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 2 Nov 2021 03:18:37 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:45448 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhKBHSg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 2 Nov 2021 03:18:36 -0400
Received: from smtpclient.apple (p4fefc15c.dip0.t-ipconnect.de [79.239.193.92])
        by mail.holtmann.org (Postfix) with ESMTPSA id 0D2FACECE9;
        Tue,  2 Nov 2021 08:16:01 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH] Bluetooth: hci_sync: Fix not setting adv set duration
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20211101221441.2764255-1-luiz.dentz@gmail.com>
Date:   Tue, 2 Nov 2021 08:16:00 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <E5754ADB-7BBA-44A0-8E00-3FE12C8BF64A@holtmann.org>
References: <20211101221441.2764255-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> 10bbffa3e88e attempted to fix the use of rotation duration as
> advertising duration but it didn't change the if condition which still
> uses the duration instead of the timeout.
> 
> Fixes: 10bbffa3e88e ("Bluetooth: Fix using advertising instance duration as timeout")
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_sync.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

