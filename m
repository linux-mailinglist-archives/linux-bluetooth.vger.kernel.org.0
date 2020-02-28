Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87E5A1732B9
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Feb 2020 09:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgB1IUr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 Feb 2020 03:20:47 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:39634 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbgB1IUq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 Feb 2020 03:20:46 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id AD57DCECF6;
        Fri, 28 Feb 2020 09:30:11 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [RFC 1/5] Bluetooth: Add BT_MODE socket option
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200225073437.11212-1-luiz.dentz@gmail.com>
Date:   Fri, 28 Feb 2020 09:20:45 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <6F27945C-88B1-4F11-BE40-57125E0A8DAC@holtmann.org>
References: <20200225073437.11212-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This adds BT_MODE socket option which can be used to set L2CAP modes,
> including modes only supported over LE which were not supported using
> the L2CAP_OPTIONS.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/bluetooth.h |  2 +
> net/bluetooth/l2cap_sock.c        | 64 ++++++++++++++++++++++++-------
> 2 files changed, 53 insertions(+), 13 deletions(-)
> 
> diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
> index 1576353a2773..c361ec7b06aa 100644
> --- a/include/net/bluetooth/bluetooth.h
> +++ b/include/net/bluetooth/bluetooth.h
> @@ -139,6 +139,8 @@ struct bt_voice {
> #define BT_PHY_LE_CODED_TX	0x00002000
> #define BT_PHY_LE_CODED_RX	0x00004000
> 
> +#define BT_MODE			15
> +

can we postpone this change. I like to get your patches 2, 3 and 4 merged first. That way we can do some initial testing here.

Regards

Marcel

