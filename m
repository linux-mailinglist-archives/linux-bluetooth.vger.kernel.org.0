Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307203146D9
	for <lists+linux-bluetooth@lfdr.de>; Tue,  9 Feb 2021 04:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhBIDNP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 8 Feb 2021 22:13:15 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:52531 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhBIDMe (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 8 Feb 2021 22:12:34 -0500
Received: from marcel-macbook.holtmann.net (p4ff9f72d.dip0.t-ipconnect.de [79.249.247.45])
        by mail.holtmann.org (Postfix) with ESMTPSA id 20CC1CED14;
        Tue,  9 Feb 2021 04:18:43 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2] Bluetooth: btintel: Check firmware version before
 download
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210204213414.1417675-1-luiz.dentz@gmail.com>
Date:   Tue, 9 Feb 2021 04:11:14 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <229D4827-CB04-421D-8F10-032CAFB92F7C@holtmann.org>
References: <20210204213414.1417675-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This checks the firmware build number, week and year matches with
> repective version loaded and then skip the download process.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> 
> 
> drivers/bluetooth/btintel.c   | 94 +++++++++++++++++++++++++++--------
> drivers/bluetooth/btintel.h   |  5 +-
> drivers/bluetooth/btusb.c     | 16 +++++-
> drivers/bluetooth/hci_intel.c |  7 ++-
> 4 files changed, 96 insertions(+), 26 deletions(-)

Looks good to me. It would be however good to have some Tested-by and Reviewed-by tags added here to ensure that it doesn’t break any other assumptions.

Regards

Marcel

