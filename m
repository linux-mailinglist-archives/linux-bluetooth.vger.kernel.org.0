Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0D9419F52E
	for <lists+linux-bluetooth@lfdr.de>; Mon,  6 Apr 2020 13:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbgDFLwD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 6 Apr 2020 07:52:03 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:52327 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbgDFLwC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 6 Apr 2020 07:52:02 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id AF7E2CECC4;
        Mon,  6 Apr 2020 14:01:34 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v7 2/2] bluetooth:btusb: handle msbc audio over USB
 Endpoints
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CAOVXEJJRvzsWjTL4Z7eLyqfjFPb7rMXmHnqp_Ux7ZvnyXMMEGg@mail.gmail.com>
Date:   Mon, 6 Apr 2020 13:51:59 +0200
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Sathish Narasimman <sathish.narasimman@intel.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Hsin-Yu Chao <hychao@chromium.org>,
        Amit K Bag <amit.k.bag@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <65A96C2C-C2A7-4B93-B015-EACB623A0B18@holtmann.org>
References: <20200402152758.10363-1-sathish.narasimman@intel.com>
 <20200402152758.10363-2-sathish.narasimman@intel.com>
 <59EE263D-87B2-42E0-A5EA-9F261BAC29BC@holtmann.org>
 <CAOVXEJJRvzsWjTL4Z7eLyqfjFPb7rMXmHnqp_Ux7ZvnyXMMEGg@mail.gmail.com>
To:     Sathish Narasimman <nsathish41@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sathish,

>>> For msbc encoded audio stream over usb transport, btusb driver
>>> to be set to alternate settings 6 as per BT core spec 5.0. The
>>> type of air mode is used to differenting which alt setting to be
>>> used.
>>> The changes are made considering some discussion over the similar
>>> patch submitted earlier from Kuba Pawlak(link below)
>>> https://www.spinics.net/lists/linux-bluetooth/msg64577.html
>>> 
>>> Reported-by: kbuild test robot <lkp@intel.com>
>>> Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
>>> Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
>>> Signed-off-by: Hsin-Yu Chao <hychao@chromium.org>
>>> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
>>> ---
>>> drivers/bluetooth/btusb.c | 155 +++++++++++++++++++++++++++++---------
>>> 1 file changed, 118 insertions(+), 37 deletions(-)
>> 
>> I decided to look at these to patches and fix up a few things.
>> 
>> 1) Use conn->setting & SCO_AIRMODE_MASK to select the option and with that also ensure that we don’t send this for ulaw and alaw air modes if they ever get established (even if unlikely).
>> 
>> 2) Fix a bunch of coding style violation
>> 
>> Please test these two patches if they still work according and then I can apply them.
>> 
>> Regards
>> 
>> Marcel
>> 
> Tested these 2 patches and they are working fine

good since Johan already applied them to bluetooth-next tree.

Regards

Marcel

