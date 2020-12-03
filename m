Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A95B52CD84C
	for <lists+linux-bluetooth@lfdr.de>; Thu,  3 Dec 2020 14:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbgLCN4N (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 3 Dec 2020 08:56:13 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:35556 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgLCN4M (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 3 Dec 2020 08:56:12 -0500
Received: from marcel-macbook.holtmann.net (unknown [37.83.193.87])
        by mail.holtmann.org (Postfix) with ESMTPSA id DD0A5CECFD;
        Thu,  3 Dec 2020 15:02:44 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH v8 3/5] Bluetooth: btusb: Define a function to construct
 firmware filename
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201119113943.13839-3-kiran.k@intel.com>
Date:   Thu, 3 Dec 2020 14:55:30 +0100
Cc:     linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com,
        chethan.tumkur.narayan@intel.com, sathish.narasimman@intel.com
Content-Transfer-Encoding: 7bit
Message-Id: <9FF26E53-3284-42BA-BF34-D274EC53CDED@holtmann.org>
References: <20201119113943.13839-1-kiran.k@intel.com>
 <20201119113943.13839-3-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> Define a new function to construct firmware/ddc filename for new
> generation Intel controllers
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
> drivers/bluetooth/btintel.h |  6 ++++++
> drivers/bluetooth/btusb.c   | 17 +++++++++++++++++
> 2 files changed, 23 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

