Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25C9279797
	for <lists+linux-bluetooth@lfdr.de>; Sat, 26 Sep 2020 09:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbgIZHnY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 26 Sep 2020 03:43:24 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:48372 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZHnX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 26 Sep 2020 03:43:23 -0400
Received: from [172.20.10.2] (dynamic-046-114-136-219.46.114.pool.telefonica.de [46.114.136.219])
        by mail.holtmann.org (Postfix) with ESMTPSA id 38A0CCECE8;
        Sat, 26 Sep 2020 09:50:21 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH 1/4] Bluetooth: A2MP: Fix not initializing all members
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200806181714.3216076-1-luiz.dentz@gmail.com>
Date:   Sat, 26 Sep 2020 09:43:20 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <CC33E7FA-7AC0-49A1-BEB1-70A51A9DE19F@holtmann.org>
References: <20200806181714.3216076-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This fixes various places where a stack variable is used uninitialized.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/a2mp.c | 22 +++++++++++++++++++++-
> 1 file changed, 21 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

