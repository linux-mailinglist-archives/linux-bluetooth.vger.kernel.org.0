Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1851BBA0C
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 Apr 2020 11:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgD1Jjm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 Apr 2020 05:39:42 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:33098 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgD1Jjm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 Apr 2020 05:39:42 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 7F6FDCECEA;
        Tue, 28 Apr 2020 11:49:19 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] Bluetooth: btbcm: Do not free IRQ on close if we did not
 request it
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200427145414.121700-1-hdegoede@redhat.com>
Date:   Tue, 28 Apr 2020 11:39:39 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <F764A836-9722-4192-AEB8-551DE080F175@holtmann.org>
References: <20200427145414.121700-1-hdegoede@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Hans,

> When the patch-ram is missing the hci_bcm code does not request the
> IRQ, in this case we should not try to free it from bcm_close()
> 
> This fixes the following WARN statements + backtraces:
> [  332.670662] WARNING: CPU: 3 PID: 4743 at kernel/irq/devres.c:143 devm_free_irq+0x45/0x50
> [  332.670882] Trying to free already-free IRQ 44
> [  332.670891] WARNING: CPU: 3 PID: 4743 at kernel/irq/manage.c:1718 free_irq+0x1f4/0x390
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> drivers/bluetooth/hci_bcm.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)

the patch doesn’t apply cleanly against bluetooth-next tree. Can you send a revised one. Thanks.

Regards

Marcel

