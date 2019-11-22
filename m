Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4131910723E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Nov 2019 13:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbfKVMf5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 Nov 2019 07:35:57 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:49585 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKVMf5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 Nov 2019 07:35:57 -0500
Received: from marcel-macbook.holtmann.net (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 21838CED20;
        Fri, 22 Nov 2019 13:45:03 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v4] bluetooth: bcm: Use the BDADDR_PROPERTY quirk
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191122123142.2152298-1-a.heider@gmail.com>
Date:   Fri, 22 Nov 2019 13:35:55 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Ondrej Jirman <megous@megous.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Content-Transfer-Encoding: 7bit
Message-Id: <FEB2FF9F-A85A-4AA1-A4BA-1B8CFC125B6B@holtmann.org>
References: <20191122123142.2152298-1-a.heider@gmail.com>
To:     Andre Heider <a.heider@gmail.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Andre,

> Some devices ship with the controller default address, like the
> Orange Pi 3 (BCM4345C5).
> 
> Allow the bootloader to set a valid address through the device tree.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>
> ---
> drivers/bluetooth/btbcm.c | 5 +++++
> 1 file changed, 5 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

