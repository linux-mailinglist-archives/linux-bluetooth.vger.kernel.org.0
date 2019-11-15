Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49718FD7AB
	for <lists+linux-bluetooth@lfdr.de>; Fri, 15 Nov 2019 09:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfKOIHe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 15 Nov 2019 03:07:34 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:44001 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbfKOIHe (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 15 Nov 2019 03:07:34 -0500
Received: from marcel-macbook.fritz.box (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 3395DCED16;
        Fri, 15 Nov 2019 09:16:39 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH] btusb: fix PM leak in error case of setup
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191114150118.5237-1-oneukum@suse.com>
Date:   Fri, 15 Nov 2019 09:07:33 +0100
Cc:     ytkim@qca.qualcomm.com, Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <F5BB5814-4B00-4DD8-BF33-7996CA7E1518@holtmann.org>
References: <20191114150118.5237-1-oneukum@suse.com>
To:     Oliver Neukum <oneukum@suse.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Oliver,

> If setup() fails a reference for runtime PM has already
> been taken. Proper use of the error handling in btusb_open()is needed.
> You cannot just return.
> 
> Fixes: ace31982585a3 ("Bluetooth: btusb: Add setup callback for chip
> init on USB")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
> drivers/bluetooth/btusb.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

