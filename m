Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C873F3FC862
	for <lists+linux-bluetooth@lfdr.de>; Tue, 31 Aug 2021 15:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236876AbhHaNjM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 31 Aug 2021 09:39:12 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:44100 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236590AbhHaNjM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 31 Aug 2021 09:39:12 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id ECF8ECECDC;
        Tue, 31 Aug 2021 15:38:15 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 1/2] Bluetooth: btintel: Fix boot address
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210831130005.4920-1-kiran.k@intel.com>
Date:   Tue, 31 Aug 2021 15:38:15 +0200
Cc:     "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
        "Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Tedd Ho-Jeong An <tedd.an@intel.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Content-Transfer-Encoding: 7bit
Message-Id: <E132AB5B-DCA1-477B-A9DA-A433A74245A9@holtmann.org>
References: <20210831130005.4920-1-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> Cache Boot address present in firmware file which
> is later used in Intel_Soft_Reset command to bring
> controller from boot mode to operational mode.
> 
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
> 
> Notes:
>    * changes in v2:
>     - move reading of boot address to seprate patch
> 
>    * changes in v1:
>     - cache boot address
>     - read boot address irrespective of mode
> 
> drivers/bluetooth/btintel.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

