Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDAE060FF7
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Jul 2019 12:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfGFKve (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Jul 2019 06:51:34 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:38817 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfGFKvc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Jul 2019 06:51:32 -0400
Received: from [192.168.0.113] (CMPC-089-239-107-172.CNet.Gawex.PL [89.239.107.172])
        by mail.holtmann.org (Postfix) with ESMTPSA id 409D1CF165;
        Sat,  6 Jul 2019 13:00:03 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] Bluetooth: btsdio: Do not bind to non-removable BCM4356
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190630221408.8509-1-pbrobinson@gmail.com>
Date:   Sat, 6 Jul 2019 12:51:31 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Transfer-Encoding: 7bit
Message-Id: <984E204F-216E-48FC-8066-9111F7388171@holtmann.org>
References: <20190630221408.8509-1-pbrobinson@gmail.com>
To:     Peter Robinson <pbrobinson@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Peter,

> BCM4356 devices soldered onto the PCB (non-removable) use an UART
> connection for bluetooth, such as the Rock960, but it also advertise
> btsdio support as a sdio function.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> drivers/bluetooth/btsdio.c | 1 +
> 1 file changed, 1 insertion(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

