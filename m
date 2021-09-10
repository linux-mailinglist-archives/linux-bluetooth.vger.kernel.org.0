Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD994067A9
	for <lists+linux-bluetooth@lfdr.de>; Fri, 10 Sep 2021 09:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbhIJHaR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 10 Sep 2021 03:30:17 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:36830 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbhIJHaQ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 10 Sep 2021 03:30:16 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id 714A2CED3D;
        Fri, 10 Sep 2021 09:29:04 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] Bluetooth: btintel: Fix incorrect out of memory check
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210909123541.34779-1-colin.king@canonical.com>
Date:   Fri, 10 Sep 2021 09:29:04 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Kiran K <kiran.k@intel.com>,
        Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <0826C6D5-F275-4E25-A3EE-D397C9BC9691@holtmann.org>
References: <20210909123541.34779-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Colin,

> Currently *ven_data is being assigned the return from a kmalloc call but
> the out-of-memory check is checking ven_data and not *ven_data. Fix this
> by adding the missing dereference * operator,
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: 70dd978952bc ("Bluetooth: btintel: Define a callback to fetch codec config data")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> drivers/bluetooth/btintel.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

