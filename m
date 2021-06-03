Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 132B339A31A
	for <lists+linux-bluetooth@lfdr.de>; Thu,  3 Jun 2021 16:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhFCO2M convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 3 Jun 2021 10:28:12 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:56696 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbhFCO2L (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 3 Jun 2021 10:28:11 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6C268CED1F;
        Thu,  3 Jun 2021 16:34:23 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v8 3/9] Bluetooth: btintel: Add a quirk for hfp offload
 usecase
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210518104232.5431-3-kiran.k@intel.com>
Date:   Thu, 3 Jun 2021 16:26:25 +0200
Cc:     linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com,
        chethan.tumkur.narayan@intel.com
Content-Transfer-Encoding: 8BIT
Message-Id: <FB1425D3-4FA4-4915-B099-DE52C80202E6@holtmann.org>
References: <20210518104232.5431-1-kiran.k@intel.com>
 <20210518104232.5431-3-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> Define a quirk to identify if intel controllers supports offload for
> HFP. In *setup* function, driver sends vendor specific command to
> check if controller supports offload. If offload is supports then
> quirk flag is set
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
> ---
> drivers/bluetooth/btintel.c | 28 ++++++++++++++++++++++++++++
> drivers/bluetooth/btintel.h |  5 +++++
> drivers/bluetooth/btusb.c   |  2 ++
> include/net/bluetooth/hci.h |  7 +++++++
> 4 files changed, 42 insertions(+)

I dislike mixing driver changes with core changes. So first please introduce a core feature or a quirk and then use it in the driver in a separate patch.

Regards

Marcel

