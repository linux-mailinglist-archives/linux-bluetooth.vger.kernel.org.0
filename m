Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04022CD84A
	for <lists+linux-bluetooth@lfdr.de>; Thu,  3 Dec 2020 14:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728006AbgLCNz2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 3 Dec 2020 08:55:28 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:48032 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgLCNz0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 3 Dec 2020 08:55:26 -0500
Received: from marcel-macbook.holtmann.net (unknown [37.83.193.87])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1B749CECFD;
        Thu,  3 Dec 2020 15:01:59 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH v8 5/5] Bluetooth: btusb: Map Typhoon peak controller to
 BTUSB_INTEL_NEWGEN
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201119113943.13839-5-kiran.k@intel.com>
Date:   Thu, 3 Dec 2020 14:54:44 +0100
Cc:     linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com,
        chethan.tumkur.narayan@intel.com, sathish.narasimman@intel.com
Content-Transfer-Encoding: 7bit
Message-Id: <5AE67BB1-19C3-4C84-9F0E-A1D8F67605BB@holtmann.org>
References: <20201119113943.13839-1-kiran.k@intel.com>
 <20201119113943.13839-5-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> Map Typhoon peak Intel controller to BTUSB_INTEL_NEWGEN
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
> drivers/bluetooth/btusb.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

