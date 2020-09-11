Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856092659EE
	for <lists+linux-bluetooth@lfdr.de>; Fri, 11 Sep 2020 09:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgIKHEd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 11 Sep 2020 03:04:33 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:41326 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgIKHE3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 11 Sep 2020 03:04:29 -0400
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id EAC5BCED19;
        Fri, 11 Sep 2020 09:11:23 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v1 1/4] Bluetooth: hci_intel: enable on new platform
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200903184850.53055-1-andriy.shevchenko@linux.intel.com>
Date:   Fri, 11 Sep 2020 09:04:28 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <BB2D5D56-F018-4FF7-8DF8-198B3C8CE025@holtmann.org>
References: <20200903184850.53055-1-andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Andy,

> On new Intel platform the device is provided with INT33E3 ID.
> Append it to the list.
> 
> This will require ACPI_GPIO_QUIRK_ONLY_GPIOIO to be enabled because
> the relevant ASL looks like:
> 
> 	UartSerialBusV2 ( ... )
> 	GpioInt ( ... ) { ... }
> 	GpioIo ( ... ) { ... }
> 
> which means that first GPIO resource is an interrupt, while we are expecting it
> to be reset one (output). Do the same for host-wake because in case of
> GpioInt() the platform_get_irq() will do the job and should return correct
> Linux IRQ number. That said, host-wake GPIO can only be GpioIo() resource.
> 
> While here, drop commas in terminator lines.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> drivers/bluetooth/hci_intel.c | 9 +++++----
> 1 file changed, 5 insertions(+), 4 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

