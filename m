Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962D21F4FEE
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jun 2020 10:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgFJIHw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Jun 2020 04:07:52 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:52496 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbgFJIHw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Jun 2020 04:07:52 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 9A421CECE1;
        Wed, 10 Jun 2020 10:17:40 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 2/2] Bluetooth : Config debug feature based on
 available support
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200608122747.10714-2-kiran.k@intel.com>
Date:   Wed, 10 Jun 2020 10:07:50 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        ravishankar.srivatsa@intel.com, kiraank@gmail.com,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Ps AyappadasX <AyappadasX.Ps@intel.com>
Content-Transfer-Encoding: 7bit
Message-Id: <E14396C9-30FF-4ADA-A43B-38F87BFBFECC@holtmann.org>
References: <20200608122747.10714-1-kiran.k@intel.com>
 <20200608122747.10714-2-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> This patch shall enable the Intel telemetry exception format
> based on the supported features
> 
> Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> Signed-off-by: Ps AyappadasX <AyappadasX.Ps@intel.com>
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
> drivers/bluetooth/btintel.c | 27 +++++++++++++++++++++++++++
> drivers/bluetooth/btintel.h |  9 +++++++--
> drivers/bluetooth/btusb.c   |  2 ++
> 3 files changed, 36 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

