Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED3F53401C6
	for <lists+linux-bluetooth@lfdr.de>; Thu, 18 Mar 2021 10:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhCRJS1 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 18 Mar 2021 05:18:27 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:42979 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbhCRJSJ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 18 Mar 2021 05:18:09 -0400
Received: from marcel-macbook.holtmann.net (p4fefce19.dip0.t-ipconnect.de [79.239.206.25])
        by mail.holtmann.org (Postfix) with ESMTPSA id 3432DCED2A;
        Thu, 18 Mar 2021 10:25:46 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH 2/2] Bluetooth: btbcm: Add BCM4330 and BCM4334 compatibles
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210318084309.401951-2-linus.walleij@linaro.org>
Date:   Thu, 18 Mar 2021 10:18:08 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D732A5AC-48B6-439D-A797-B992E41988F6@holtmann.org>
References: <20210318084309.401951-1-linus.walleij@linaro.org>
 <20210318084309.401951-2-linus.walleij@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Linus,

> Add the missing brcm,bcm4330-bt and brcm,bcm4334-bt to the
> match table so device trees can use this compatible as well
> and not need to use the fallback brcm,bcm4329-bt.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> drivers/bluetooth/hci_bcm.c | 2 ++
> 1 file changed, 2 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

