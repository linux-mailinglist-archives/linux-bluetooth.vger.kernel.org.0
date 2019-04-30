Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4E6FC28
	for <lists+linux-bluetooth@lfdr.de>; Tue, 30 Apr 2019 17:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbfD3PGQ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 30 Apr 2019 11:06:16 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:54219 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfD3PGQ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 30 Apr 2019 11:06:16 -0400
Received: from marcel-macpro.fritz.box (p4FF9FD9B.dip0.t-ipconnect.de [79.249.253.155])
        by mail.holtmann.org (Postfix) with ESMTPSA id 58FCCCF184;
        Tue, 30 Apr 2019 17:14:27 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH 2/2] Bluetooth: btbcm: Add default address for BCM2076B1
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190430150456.GA50466@gerhold.net>
Date:   Tue, 30 Apr 2019 17:06:14 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <863F9BB0-25C7-4A9B-8D91-2A2D2690D13D@holtmann.org>
References: <20190305130901.56660-1-stephan@gerhold.net>
 <20190305130901.56660-2-stephan@gerhold.net>
 <20190430150456.GA50466@gerhold.net>
To:     Stephan Gerhold <stephan@gerhold.net>
X-Mailer: Apple Mail (2.3445.104.8)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Stephan,

>> BCM2076B1 appears to use 20:76:A0:00:56:79 as default address.
>> This address is used by at least 5 devices with the AMPAK AP6476
>> module and is also suspicious because it starts with the chip name
>> 2076 (followed by a different revision A0 for some reason).
>> 
>> Add it to the list of default addresses and leave it up to the
>> user to configure a valid one.
>> 
>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>> ---
>> drivers/bluetooth/btbcm.c | 5 +++++
>> 1 file changed, 5 insertions(+)
>> 
> 
> As far as I can tell, you have applied the first patch of this series,
> but forgot about this one. :)
> 
> It does not apply as-is anymore since you applied the patch from
> Ferry Toth first, but it still applies cleanly with with 
> "git am --3way".
> 
> Is that fine for you or should I re-send it on top of latest
> bluetooth-next?

just re-send it against bluetooth-next.

Regards

Marcel

