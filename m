Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE1C947CE50
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Dec 2021 09:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239497AbhLVIbJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Dec 2021 03:31:09 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:44157 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhLVIbI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Dec 2021 03:31:08 -0500
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
        by mail.holtmann.org (Postfix) with ESMTPSA id 47CA6CED09;
        Wed, 22 Dec 2021 09:31:07 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH v4 1/4] Bluetooth: hci_sync: Wait for proper events when
 connecting LE
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20211221223357.742863-1-luiz.dentz@gmail.com>
Date:   Wed, 22 Dec 2021 09:31:06 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <35B33B8C-9F50-41DA-8E78-35E79274816E@holtmann.org>
References: <20211221223357.742863-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> When using HCI_OP_LE_CREATE_CONN wait for HCI_EV_LE_CONN_COMPLETE before
> completing it and for HCI_OP_LE_EXT_CREATE_CONN wait for
> HCI_EV_LE_ENHANCED_CONN_COMPLETE before resuming advertising.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> v2: Remove setting of direct_rpa as random address and add a patch checking
> hdev->le_states if simultaneous roles are supported.
> v3: Fix checkpatch warnings.
> v4: Add patch fixing LE simultaneous roles supported vs enabled.
> 
> net/bluetooth/hci_sync.c | 11 +++++++----
> 1 file changed, 7 insertions(+), 4 deletions(-)

it tells me that these patches no longer apply cleanly to bluetooth-next.

Regards

Marcel

