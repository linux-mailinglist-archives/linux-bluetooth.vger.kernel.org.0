Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC3FE38B2E6
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 May 2021 17:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243733AbhETPVJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 20 May 2021 11:21:09 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:50372 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243723AbhETPVH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 20 May 2021 11:21:07 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 30BF4CECEA;
        Thu, 20 May 2021 17:27:39 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH 1/2] Bluetooth: L2CAP: Fix invalid access if ECRED
 Reconfigure fails
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210519204151.1087613-1-luiz.dentz@gmail.com>
Date:   Thu, 20 May 2021 17:19:45 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <6F450C79-6C73-4763-9F90-EE906BF5CD5D@holtmann.org>
References: <20210519204151.1087613-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> The use of l2cap_chan_del is not safe under a loop using
> list_for_each_entry.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/l2cap_core.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

