Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE8F514172
	for <lists+linux-bluetooth@lfdr.de>; Sun,  5 May 2019 19:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbfEER3w (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 5 May 2019 13:29:52 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:57368 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbfEER3w (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 5 May 2019 13:29:52 -0400
Received: from marcel-macpro.fritz.box (p4FF9FD9B.dip0.t-ipconnect.de [79.249.253.155])
        by mail.holtmann.org (Postfix) with ESMTPSA id 40D77CEE02;
        Sun,  5 May 2019 19:38:04 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH RESEND] Bluetooth: btbcm: Add default address for
 BCM2076B1
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190501071820.6404-1-stephan@gerhold.net>
Date:   Sun, 5 May 2019 19:29:49 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <33CCCE49-ADC6-4A24-9EAC-07D11671F67E@holtmann.org>
References: <863F9BB0-25C7-4A9B-8D91-2A2D2690D13D@holtmann.org>
 <20190501071820.6404-1-stephan@gerhold.net>
To:     Stephan Gerhold <stephan@gerhold.net>
X-Mailer: Apple Mail (2.3445.104.8)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Stephan,

> BCM2076B1 appears to use 20:76:A0:00:56:79 as default address.
> This address is used by at least 5 devices with the AMPAK AP6476
> module and is also suspicious because it starts with the chip name
> 2076 (followed by a different revision A0 for some reason).
> 
> Add it to the list of default addresses and leave it up to the
> user to configure a valid one.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
> (rebased on latest bluetooth-next)
> 
> drivers/bluetooth/btbcm.c | 5 +++++
> 1 file changed, 5 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

