Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB313B4CE6
	for <lists+linux-bluetooth@lfdr.de>; Sat, 26 Jun 2021 07:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhFZFzo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 26 Jun 2021 01:55:44 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:54067 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhFZFzn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 26 Jun 2021 01:55:43 -0400
Received: from smtpclient.apple (p5b3d2eb8.dip0.t-ipconnect.de [91.61.46.184])
        by mail.holtmann.org (Postfix) with ESMTPSA id 741C2CED1E;
        Sat, 26 Jun 2021 07:53:20 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH] Bluetooth: hci_uart: Remove redundant assignment to
 fw_ptr
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <YMpUvvOUKGOKZWuH@fedora>
Date:   Sat, 26 Jun 2021 07:53:19 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bluetooth Kernel Mailing List 
        <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <BDA2F12E-1D8F-48DC-9D1A-78FC2623B598@holtmann.org>
References: <YMpUvvOUKGOKZWuH@fedora>
To:     Nigel Christian <nigel.l.christian@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Nigel,

> The variable fw_ptr is assigned a value that is not read and the same value
> is assigned in the patch goto. The assignment is redundant and can be
> removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> ---
> drivers/bluetooth/hci_ag6xx.c | 1 -
> 1 file changed, 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

