Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF7726599E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 11 Sep 2020 08:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgIKGvR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 11 Sep 2020 02:51:17 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:57501 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbgIKGvN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 11 Sep 2020 02:51:13 -0400
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id 024E7CED19;
        Fri, 11 Sep 2020 08:58:06 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v1 3/4] Bluetooth: hci_intel: switch to
 list_for_each_entry()
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200903184850.53055-3-andriy.shevchenko@linux.intel.com>
Date:   Fri, 11 Sep 2020 08:51:11 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C4F05E7F-B874-4D36-A6CD-0B691DCF27D6@holtmann.org>
References: <20200903184850.53055-1-andriy.shevchenko@linux.intel.com>
 <20200903184850.53055-3-andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Andy,

> There is no need to have list_for_each() followed by list_entry()
> when we simply may use list_for_each_entry() directly.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> drivers/bluetooth/hci_intel.c | 31 ++++++++++---------------------
> 1 file changed, 10 insertions(+), 21 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

