Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6FC330C19
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Mar 2021 12:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbhCHLSa (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 8 Mar 2021 06:18:30 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:53398 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231684AbhCHLSS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 8 Mar 2021 06:18:18 -0500
Received: from marcel-macbook.holtmann.net (p4fefc126.dip0.t-ipconnect.de [79.239.193.38])
        by mail.holtmann.org (Postfix) with ESMTPSA id E356CCED15;
        Mon,  8 Mar 2021 12:25:51 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v1] btusb: btintel: print firmware file name on error
 loading firmware
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210308111454.31765-1-kiran.k@intel.com>
Date:   Mon, 8 Mar 2021 12:18:16 +0100
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        "Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>,
        chethan.tumkur.narayan@intel.com
Content-Transfer-Encoding: 7bit
Message-Id: <DDA50BAC-7A09-46E5-A3B5-529025B93477@holtmann.org>
References: <20210308111454.31765-1-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> print the firmware file name on error loading from fie system
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
> drivers/bluetooth/btusb.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

