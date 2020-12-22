Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40542E0F96
	for <lists+linux-bluetooth@lfdr.de>; Tue, 22 Dec 2020 22:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727895AbgLVVCE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 22 Dec 2020 16:02:04 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:46805 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbgLVVCD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 22 Dec 2020 16:02:03 -0500
Received: from marcel-macbook.holtmann.net (p4ff9fbc9.dip0.t-ipconnect.de [79.249.251.201])
        by mail.holtmann.org (Postfix) with ESMTPSA id E8C05CECC3;
        Tue, 22 Dec 2020 22:08:39 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Bluetooth: btrtl: Enable central-peripheral role
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201222101603.1.I94935e7936550207ae745d3670890541c792c35e@changeid>
Date:   Tue, 22 Dec 2020 22:01:21 +0100
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Daniel Winkler <danielwinkler@google.com>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <B557BF24-E782-4E2F-BFC1-E8D1680E204D@holtmann.org>
References: <20201222101603.1.I94935e7936550207ae745d3670890541c792c35e@changeid>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Abhishek,

> Enable the central-peripheral role on RTL8822CE. This enables creating
> connections while there is an existing connection in the slave role.
> 
> This change can be confirmed in userspace via `bluetoothctl show` which
> will now show "Roles: central-peripheral".
> 
> Reviewed-by: Daniel Winkler <danielwinkler@google.com>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> 
> drivers/bluetooth/btrtl.c | 15 +++++++++++++--
> 1 file changed, 13 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

