Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC9C36921F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Apr 2021 14:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhDWMbE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 23 Apr 2021 08:31:04 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:48464 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhDWMbD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 23 Apr 2021 08:31:03 -0400
Received: from marcel-macbook.holtmann.net (p4fefc624.dip0.t-ipconnect.de [79.239.198.36])
        by mail.holtmann.org (Postfix) with ESMTPSA id 4B483CED00;
        Fri, 23 Apr 2021 14:38:13 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] Load Broadcom firmware for Dell Bluetooth device
 413c:8197.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210423122732.30657-1-imackinnon@gmail.com>
Date:   Fri, 23 Apr 2021 14:30:25 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <AC9EA0E8-2285-4154-9BF5-B4C7ACEE28ED@holtmann.org>
References: <20210423122732.30657-1-imackinnon@gmail.com>
To:     Ian Mackinnon <imackinnon@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Ian,

> Remove the btusb_table entry for 413c:8197 so the device is handled
> by the later Dell vendor entry, which specifies patchram loading.

please record the content of /sys/kernel/debug/usb/devices for this device here.

> ---
> drivers/bluetooth/btusb.c | 3 ---
> 1 file changed, 3 deletions(-)

Regards

Marcel

