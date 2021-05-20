Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D14238B2E4
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 May 2021 17:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243764AbhETPUr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 20 May 2021 11:20:47 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:54299 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243775AbhETPUr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 20 May 2021 11:20:47 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 13069CECEA;
        Thu, 20 May 2021 17:27:18 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH 2/2] Bluetooth: L2CAP: Fix invalid access on ECRED
 Connection response
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210519204151.1087613-2-luiz.dentz@gmail.com>
Date:   Thu, 20 May 2021 17:19:23 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <AA952499-DE19-4EC3-B148-D37662062EF1@holtmann.org>
References: <20210519204151.1087613-1-luiz.dentz@gmail.com>
 <20210519204151.1087613-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> The use of l2cap_chan_del is not safe under a loop using
> list_for_each_entry.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/l2cap_core.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

