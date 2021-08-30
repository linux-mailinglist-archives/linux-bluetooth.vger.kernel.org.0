Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D303FBE03
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Aug 2021 23:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236451AbhH3VSX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Aug 2021 17:18:23 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:41005 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234509AbhH3VSV (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Aug 2021 17:18:21 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id 2B034CECC7;
        Mon, 30 Aug 2021 23:17:22 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 1/2] Bluetooth: Fix using address type from events
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210830205537.118960-1-luiz.dentz@gmail.com>
Date:   Mon, 30 Aug 2021 23:17:21 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3E32D78A-2184-4CFA-91FA-945014D8A794@holtmann.org>
References: <20210830205537.118960-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> Address types ADDR_LE_DEV_PUBLIC_RESOLVED and
> ADDR_LE_DEV_RANDOM_RESOLVED shall be converted to ADDR_LE_PUBLIC and
> ADDR_LE_RANDOM repectively since they are not safe to be used beyond
> the scope of the events themselves.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_core.c  |  9 -------
> net/bluetooth/hci_event.c | 53 ++++++++++++++++-----------------------
> 2 files changed, 22 insertions(+), 40 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

