Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9EA3993E9
	for <lists+linux-bluetooth@lfdr.de>; Wed,  2 Jun 2021 21:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhFBTwO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 2 Jun 2021 15:52:14 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:49714 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbhFBTwN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 2 Jun 2021 15:52:13 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id 7B3C4CED09;
        Wed,  2 Jun 2021 21:58:26 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 1/2] Bluetooth: btrtl: rename USB fw for RTL8761
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210528152645.25577-1-joakim.tjernlund@infinera.com>
Date:   Wed, 2 Jun 2021 21:50:28 +0200
Cc:     linux-bluetooth@vger.kernel.org, stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <9E3769E8-4C02-474C-A125-5C07DEE0537F@holtmann.org>
References: <20210528152645.25577-1-joakim.tjernlund@infinera.com>
To:     Joakim Tjernlund <joakim.tjernlund@infinera.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Joakim,

> According Realteks own BT drivers firmware RTL8761B is for UART
> and RTL8761BU is for USB.
> 
> Change existing 8761B to UART and add an 8761BU entry for USB
> 
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> ---
> drivers/bluetooth/btrtl.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

