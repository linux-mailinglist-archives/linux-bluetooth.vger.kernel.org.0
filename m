Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFC641CD94
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 Sep 2021 22:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346792AbhI2Uvc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 29 Sep 2021 16:51:32 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:50948 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346777AbhI2Uva (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 29 Sep 2021 16:51:30 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id 925D8CED00;
        Wed, 29 Sep 2021 22:49:48 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 2/2] Bluetooth: hci_vhci: Add force_prevent_wake entry
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210929203855.3290899-2-luiz.dentz@gmail.com>
Date:   Wed, 29 Sep 2021 22:49:48 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <BCF80D07-0E23-45B1-8C63-3EFD6346CFA9@holtmann.org>
References: <20210929203855.3290899-1-luiz.dentz@gmail.com>
 <20210929203855.3290899-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This adds force_prevent_wake which can be used to force a certain state
> while interacting with force_suspend.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> drivers/bluetooth/hci_vhci.c | 49 ++++++++++++++++++++++++++++++++++++
> 1 file changed, 49 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

