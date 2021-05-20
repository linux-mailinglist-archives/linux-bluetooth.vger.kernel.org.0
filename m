Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A3538B318
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 May 2021 17:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbhETPYr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 20 May 2021 11:24:47 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:44605 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243866AbhETPYC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 20 May 2021 11:24:02 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id AC48ACECEB;
        Thu, 20 May 2021 17:30:31 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH] Bluetooth: btusb: Use firmware_request_nowarn
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210513230422.2991704-1-luiz.dentz@gmail.com>
Date:   Thu, 20 May 2021 17:22:37 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <61B7DDCB-5A1C-4F85-BB46-91BD93E7C4FE@holtmann.org>
References: <20210513230422.2991704-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This replaces the use of request_firmware to firmware_request_nowarn
> when firmware is optional (firmware is already operational).
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> drivers/bluetooth/btusb.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

