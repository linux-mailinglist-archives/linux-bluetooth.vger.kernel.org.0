Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D158101C06
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 Nov 2019 09:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbfKSIRO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 19 Nov 2019 03:17:14 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:38385 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbfKSIRJ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 19 Nov 2019 03:17:09 -0500
Received: from marcel-macbook.holtmann.net (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id EB545CECEF;
        Tue, 19 Nov 2019 09:26:14 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH] Bluetooth: delete a stray unlock
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191119053710.eflgllzyoyglrrj7@kili.mountain>
Date:   Tue, 19 Nov 2019 09:17:08 +0100
Cc:     Andrei Emeltchenko <andrei.emeltchenko@intel.com>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Gustavo Padovan <gustavo.padovan@collabora.co.uk>,
        linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <FD103E14-D634-48A6-9C31-9A70A54EE0BC@holtmann.org>
References: <20191119053710.eflgllzyoyglrrj7@kili.mountain>
To:     Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Dan,

> We used to take a lock in amp_physical_cfm() but then we moved it to
> the caller function.  Unfortunately the unlock on this error path was
> overlooked so it leads to a double unlock.
> 
> Fixes: a514b17fab51 ("Bluetooth: Refactor locking in amp_physical_cfm")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> net/bluetooth/l2cap_core.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

