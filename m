Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42383DF6E7
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Aug 2021 23:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbhHCVcY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 3 Aug 2021 17:32:24 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:33679 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbhHCVcY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 3 Aug 2021 17:32:24 -0400
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
        by mail.holtmann.org (Postfix) with ESMTPSA id BD753CED2F;
        Tue,  3 Aug 2021 23:32:11 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [RESEND 2/2] Bluetooth: Fix not generating RPA when required
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210802235619.238065-2-luiz.dentz@gmail.com>
Date:   Tue, 3 Aug 2021 23:32:11 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <5B336B85-2F7B-4B68-99A3-F0F4B56F8FDB@holtmann.org>
References: <20210802235619.238065-1-luiz.dentz@gmail.com>
 <20210802235619.238065-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> Code was checking if random_addr and hdev->rpa match without first
> checking if the RPA has not been set (BDADDR_ANY), furthermore it was
> clearing HCI_RPA_EXPIRED before the command completes and the RPA is
> actually programmed which in case of failure would leave the expired
> RPA still set.
> 
> Since advertising instance have a similar problem the clearing of
> HCI_RPA_EXPIRED has been moved to hci_event.c after checking the random
> address is in fact the hdev->rap and then proceed to set the expire
> timeout.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/hci_core.h |  4 ++
> net/bluetooth/hci_event.c        | 32 +++++++++----
> net/bluetooth/hci_request.c      | 81 ++++++++++++++------------------
> 3 files changed, 61 insertions(+), 56 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

