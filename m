Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA6B1C6488
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 May 2020 01:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbgEEXeI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 May 2020 19:34:08 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:42326 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728642AbgEEXeH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 May 2020 19:34:07 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 28035CECFC;
        Wed,  6 May 2020 01:43:47 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] Bluetooth: L2CAP: Fix errors during
 L2CAP_CREDIT_BASED_CONNECTION_REQ (0x17)
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <5e44176345684a8cb83adacf1a845e86@peiker-cee.de>
Date:   Wed, 6 May 2020 01:34:05 +0200
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <46CE5231-EDCE-4717-B479-0D92E42D01E0@holtmann.org>
References: <5e44176345684a8cb83adacf1a845e86@peiker-cee.de>
To:     "CEE Forostyan, Konstantin" <Konstantin.Forostyan@peiker-cee.de>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Konstantin,

> Fix 2 typos in L2CAP_CREDIT_BASED_CONNECTION_REQ (0x17) handling function, that
> cause BlueZ answer with L2CAP_CR_LE_INVALID_PARAMS or L2CAP_CR_LE_INVALID_SCID
> error on a correct ECRED connection request.
> 
> Enchanced Credit Based Mode support was recently introduced with the commit
> 15f02b91056253e8cdc592888f431da0731337b8 ("Bluetooth: L2CAP: Add initial code
> for Enhanced Credit Based Mode").
> 
> Signed-off-by: Konstantin Forostyan <konstantin.forostyan@peiker-cee.de>
> ---

patch has been applied to bluetooth-next tree.

Regards

Marcel

