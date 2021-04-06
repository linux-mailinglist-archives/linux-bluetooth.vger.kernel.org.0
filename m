Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD369354F00
	for <lists+linux-bluetooth@lfdr.de>; Tue,  6 Apr 2021 10:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244595AbhDFIud (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Apr 2021 04:50:33 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:48543 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232593AbhDFIu3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Apr 2021 04:50:29 -0400
Received: from marcel-macbook.holtmann.net (p4ff9fed5.dip0.t-ipconnect.de [79.249.254.213])
        by mail.holtmann.org (Postfix) with ESMTPSA id 89761CED1D;
        Tue,  6 Apr 2021 10:58:03 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH 1/2] Bluetooth: FIX: Own address type change with
 HCI_ENABLE_LL_PRIVACY
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210405143023.16120-1-sathish.narasimman@intel.com>
Date:   Tue, 6 Apr 2021 10:50:20 +0200
Cc:     linux-bluetooth@vger.kernel.org, chethan.tumkur.narayan@intel.com,
        ravishankar.srivatsa@intel.com
Content-Transfer-Encoding: 7bit
Message-Id: <C8E8AD70-2901-441E-AC1C-39D25B239BDB@holtmann.org>
References: <20210405143023.16120-1-sathish.narasimman@intel.com>
To:     Sathish Narasimman <sathish.narasimman@intel.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sathish,

> own_address_type has to changed to 0x02 and 0x03 only when
> HCI_ENABLE_LL_PRIVACY flag is set.
> 
> Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
> ---
> net/bluetooth/hci_request.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

