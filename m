Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A770257E15
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 Aug 2020 17:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbgHaP7C (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 Aug 2020 11:59:02 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:55544 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgHaP7B (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 Aug 2020 11:59:01 -0400
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id 12AE3CECCD;
        Mon, 31 Aug 2020 18:09:09 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] Bluetooth: btusb: Update boot parameter specific to SKU
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200826095432.18825-1-kiran.k@intel.com>
Date:   Mon, 31 Aug 2020 17:58:58 +0200
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        "Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>,
        Kiran K <kiran.k@intel.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>
Content-Transfer-Encoding: 7bit
Message-Id: <67D8B90A-27CF-46EB-9C3D-9947F6B1A8B8@holtmann.org>
References: <20200826095432.18825-1-kiran.k@intel.com>
To:     Kiran K <kiraank@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> boot parameter gets updated during firmware download process. Use the
> updated boot parameter while doing soft reset of controller. This patch
> fixes updating of boot parameter.
> 
> Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
> drivers/bluetooth/btusb.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

