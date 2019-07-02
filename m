Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8B75D1CD
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 Jul 2019 16:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbfGBOfn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 2 Jul 2019 10:35:43 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:39438 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfGBOfn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 2 Jul 2019 10:35:43 -0400
Received: from marcel-macpro.fritz.box (p4FEFC3D2.dip0.t-ipconnect.de [79.239.195.210])
        by mail.holtmann.org (Postfix) with ESMTPSA id 4D2FFCF182;
        Tue,  2 Jul 2019 16:44:13 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] Bluetooth: Fix minimum encryption key size check
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190701111324.GA3906@ubuntu-18-04-beta2>
Date:   Tue, 2 Jul 2019 16:35:42 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <46032330-EF82-4AD7-86D2-E4C84EB0B8C1@holtmann.org>
References: <20190701111324.GA3906@ubuntu-18-04-beta2>
To:     Matias Karhumaa <matias.karhumaa@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Matias,

> Fixes minimum encryption key size check so that HCI_MIN_ENC_KEY_SIZE
> is also allowed as stated in comment.
> 
> This bug caused connection problems with devices having min
> encryption key size of 7.
> 
> This patch has been prepared against Linus' tree because previous
> regression fix that introduced this bug is not in Bluetooth tree yet.
> 
> Fixes: 693cd8ce3f88 ("Bluetooth: Fix regression with minimum encryption key size alignment")
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=203997
> Signed-off-by: Matias Karhumaa <matias.karhumaa@gmail.com>
> Cc: stable@vger.kernel.org
> ---
> net/bluetooth/l2cap_core.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been forwarded to Linus.

Regards

Marcel

