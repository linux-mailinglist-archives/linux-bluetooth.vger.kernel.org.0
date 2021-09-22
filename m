Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21F4414BA2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Sep 2021 16:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236093AbhIVOTS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Sep 2021 10:19:18 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:51821 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233911AbhIVOTS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Sep 2021 10:19:18 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id 3F9E2CED35;
        Wed, 22 Sep 2021 16:17:47 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] Bluetooth: hci_core: Move all debugfs handling to
 hci_debugfs.c
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210921182504.1308610-1-luiz.dentz@gmail.com>
Date:   Wed, 22 Sep 2021 16:17:46 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3D26D926-3B80-4697-8A9B-92888FE7BA7B@holtmann.org>
References: <20210921182504.1308610-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This moves hci_debugfs_create_basic to hci_debugfs.c which is where all
> the others debugfs entries are handled.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_core.c    | 124 ------------------------------------
> net/bluetooth/hci_debugfs.c | 123 +++++++++++++++++++++++++++++++++++
> net/bluetooth/hci_debugfs.h |   5 ++
> 3 files changed, 128 insertions(+), 124 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

