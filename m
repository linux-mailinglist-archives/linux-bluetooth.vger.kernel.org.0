Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286B53401C1
	for <lists+linux-bluetooth@lfdr.de>; Thu, 18 Mar 2021 10:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhCRJRx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 18 Mar 2021 05:17:53 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:39972 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhCRJRr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 18 Mar 2021 05:17:47 -0400
Received: from marcel-macbook.holtmann.net (p4fefce19.dip0.t-ipconnect.de [79.239.206.25])
        by mail.holtmann.org (Postfix) with ESMTPSA id 889ABCED2A;
        Thu, 18 Mar 2021 10:25:23 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH 1/2] Bluetooth: btbcm: Add BCM4334 DT binding
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210318084309.401951-1-linus.walleij@linaro.org>
Date:   Thu, 18 Mar 2021 10:17:45 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Bluetooth Kernel Mailing List 
        <linux-bluetooth@vger.kernel.org>, devicetree@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <860A14B4-1615-46BD-884B-5C728A19DC97@holtmann.org>
References: <20210318084309.401951-1-linus.walleij@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Linus,

> BCM4334 was missing from the binding.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Documentation/devicetree/bindings/net/broadcom-bluetooth.yaml | 1 +
> 1 file changed, 1 insertion(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

