Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76D3F17D2CA
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Mar 2020 10:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgCHJEg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 8 Mar 2020 05:04:36 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:54974 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgCHJEf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 8 Mar 2020 05:04:35 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 4F8C1CED15;
        Sun,  8 Mar 2020 10:14:02 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v3 2/5] Bluetooth: L2CAP: Add initial code for Enhanced
 Credit Based Mode
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200303005623.18917-2-luiz.dentz@gmail.com>
Date:   Sun, 8 Mar 2020 10:04:34 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <E6A1A07C-AF63-4610-9794-201F2E5C478D@holtmann.org>
References: <20200303005623.18917-1-luiz.dentz@gmail.com>
 <20200303005623.18917-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This adds the initial code for Enhanced Credit Based Mode which
> introduces a new socket mode called L2CAP_MODE_EXT_FLOWCTL, which for
> the most part work the same as L2CAP_MODE_LE_FLOWCTL but uses different
> PDUs to setup the connections and also works over BR/EDR.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/l2cap.h |   4 +
> net/bluetooth/l2cap_core.c    | 545 +++++++++++++++++++++++++++++++++-
> net/bluetooth/l2cap_sock.c    |  23 +-
> 3 files changed, 552 insertions(+), 20 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

