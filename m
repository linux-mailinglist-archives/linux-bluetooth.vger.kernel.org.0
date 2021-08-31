Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBF53FC85F
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 Aug 2021 15:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235961AbhHaNjL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 31 Aug 2021 09:39:11 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:46513 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236590AbhHaNjK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 31 Aug 2021 09:39:10 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id C1669CECDB;
        Tue, 31 Aug 2021 15:38:13 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 2/2] Bluetooth: btintel: Read boot address irrespective
 of controller mode
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210831130005.4920-2-kiran.k@intel.com>
Date:   Tue, 31 Aug 2021 15:38:13 +0200
Cc:     "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
        ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        tedd.an@intel.com,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Content-Transfer-Encoding: 7bit
Message-Id: <A4F30CCC-E9B6-4910-81ED-FE4E919F0C0C@holtmann.org>
References: <20210831130005.4920-1-kiran.k@intel.com>
 <20210831130005.4920-2-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> Boot address was not getting updated when controller is present
> in boot mode which is required to move the controller from boot mode
> to operation mode after firmware download. This patch reads boot address
> even if controller is present in boot mode.
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
> 
> Notes:
>    changes in v2 (new patch):
>     - Read boot address irrespective of controller mode
> 
> drivers/bluetooth/btintel.c | 26 ++++++++++----------------
> 1 file changed, 10 insertions(+), 16 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

