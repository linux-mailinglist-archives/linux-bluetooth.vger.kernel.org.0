Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B0A302729
	for <lists+linux-bluetooth@lfdr.de>; Mon, 25 Jan 2021 16:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730418AbhAYPrP (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 25 Jan 2021 10:47:15 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:45332 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730378AbhAYPqi (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 25 Jan 2021 10:46:38 -0500
Received: from marcel-macbook.holtmann.net (p4ff9f11c.dip0.t-ipconnect.de [79.249.241.28])
        by mail.holtmann.org (Postfix) with ESMTPSA id 65228CECCC;
        Mon, 25 Jan 2021 16:22:59 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Bluetooth: Put HCI device if inquiry procedure interrupts
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210121081045.38121-1-bianpan2016@163.com>
Date:   Mon, 25 Jan 2021 16:15:34 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Andre Guedes <andre.guedes@openbossa.org>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C0743D93-F6A7-49E5-B31D-B47D04D457FF@holtmann.org>
References: <20210121081045.38121-1-bianpan2016@163.com>
To:     Pan Bian <bianpan2016@163.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Pan,

> Jump to the label done to decrement the reference count of HCI device
> hdev on path that the Inquiry procedure is interrupted.
> 
> Fixes: 3e13fa1e1fab ("Bluetooth: Fix hci_inquiry ioctl usage")
> Signed-off-by: Pan Bian <bianpan2016@163.com>
> ---
> net/bluetooth/hci_core.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

