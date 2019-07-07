Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDC0610DA
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Jul 2019 15:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfGFNjb (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Jul 2019 09:39:31 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:59064 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfGFNjb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Jul 2019 09:39:31 -0400
Received: from [192.168.0.171] (188.146.228.97.nat.umts.dynamic.t-mobile.pl [188.146.228.97])
        by mail.holtmann.org (Postfix) with ESMTPSA id B0941CF163;
        Sat,  6 Jul 2019 15:48:01 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [RFC 2/2] Bluetooth: L2CAP: Check bearer type on
 __l2cap_global_chan_by_addr
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190603104843.26848-2-luiz.dentz@gmail.com>
Date:   Sat, 6 Jul 2019 15:39:29 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C14EA2CF-71F8-4324-B3E1-5EE895573A7B@holtmann.org>
References: <20190603104843.26848-1-luiz.dentz@gmail.com>
 <20190603104843.26848-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> The spec defines PSM and LE_PSM as different domains so a listen on the
> same PSM is valid if the address type points to a different bearer.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/l2cap_core.c | 14 +++++++++++---
> 1 file changed, 11 insertions(+), 3 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

