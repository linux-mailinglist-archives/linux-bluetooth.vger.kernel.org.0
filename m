Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73A0913CEE0
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Jan 2020 22:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729351AbgAOVZr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Jan 2020 16:25:47 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:41996 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726501AbgAOVZr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Jan 2020 16:25:47 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id DC4BDCECF2;
        Wed, 15 Jan 2020 22:35:03 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v5 09/11] Bluetooth: hci_h4: Add support for ISO packets
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200115210221.13096-10-luiz.dentz@gmail.com>
Date:   Wed, 15 Jan 2020 22:25:45 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <7441AE7D-C296-4DCF-8A11-561360B46B68@holtmann.org>
References: <20200115210221.13096-1-luiz.dentz@gmail.com>
 <20200115210221.13096-10-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This enables H4 driver to properly handle ISO packets.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> drivers/bluetooth/hci_h4.c   | 1 +
> drivers/bluetooth/hci_uart.h | 7 +++++++
> 2 files changed, 8 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

