Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA93279799
	for <lists+linux-bluetooth@lfdr.de>; Sat, 26 Sep 2020 09:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729104AbgIZHn2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 26 Sep 2020 03:43:28 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:60879 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZHn2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 26 Sep 2020 03:43:28 -0400
Received: from [172.20.10.2] (dynamic-046-114-136-219.46.114.pool.telefonica.de [46.114.136.219])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6204ECECE9;
        Sat, 26 Sep 2020 09:50:25 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH 2/4] Bluetooth: L2CAP: Fix calling sk_filter on non-socket
 based channel
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200806181714.3216076-2-luiz.dentz@gmail.com>
Date:   Sat, 26 Sep 2020 09:43:26 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <5EFA0356-5F86-4313-BFF4-2CECE3A72486@holtmann.org>
References: <20200806181714.3216076-1-luiz.dentz@gmail.com>
 <20200806181714.3216076-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> Only sockets will have the chan->data set to an actual sk, channels
> like A2MP would have its own data which would likely cause a crash when
> calling sk_filter, in order to fix this a new callback has been
> introduced so channels can implement their own filtering if necessary.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/l2cap.h |  2 ++
> net/bluetooth/l2cap_core.c    |  7 ++++---
> net/bluetooth/l2cap_sock.c    | 14 ++++++++++++++
> 3 files changed, 20 insertions(+), 3 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

