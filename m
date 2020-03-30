Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02DC19865D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Mar 2020 23:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728407AbgC3VWO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Mar 2020 17:22:14 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:52889 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbgC3VWO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Mar 2020 17:22:14 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 66C08CECA3;
        Mon, 30 Mar 2020 23:31:46 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2 1/2] Bluetooth: L2CAP: Fix handling LE modes by
 L2CAP_OPTIONS
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200327183215.27201-1-luiz.dentz@gmail.com>
Date:   Mon, 30 Mar 2020 23:22:13 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <056FA881-0EAA-41A2-A486-342BD7D112F2@holtmann.org>
References: <20200327183215.27201-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> L2CAP_OPTIONS shall only be used with BR/EDR modes.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/l2cap_sock.c | 25 +++++++++++++++++++++----
> 1 file changed, 21 insertions(+), 4 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

