Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 015B41301B2
	for <lists+linux-bluetooth@lfdr.de>; Sat,  4 Jan 2020 10:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgADJ6E convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 4 Jan 2020 04:58:04 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:37866 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbgADJ6E (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 4 Jan 2020 04:58:04 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 99ECFCED12;
        Sat,  4 Jan 2020 11:07:18 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v6 2/2] bluetooth:btusb: handle msbc audio over USB
 Endpoints
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191205083229.29890-1-sathish.narasimman@intel.com>
Date:   Sat, 4 Jan 2020 10:58:02 +0100
Cc:     BlueZ devel list <linux-bluetooth@vger.kernel.org>,
        Sathish Narasimman <sathish.narasimman@intel.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Hsin-Yu Chao <hychao@chromium.org>,
        Amit K Bag <amit.k.bag@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <F7B49142-FD11-4512-B2D4-0840556FC0D3@holtmann.org>
References: <20191205083229.29890-1-sathish.narasimman@intel.com>
To:     Sathish Narsimman <nsathish41@gmail.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sathish,

> For msbc encoded audio stream over usb transport, btusb driver
> to be set to alternate settings 6 as per BT core spec 5.0. The
> type of air mode is used to differenting which alt setting to be
> used.
> The changes are made considering some discussion over the similar
> patch submitted earlier from Kuba Pawlak(link below)
> https://www.spinics.net/lists/linux-bluetooth/msg64577.html
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
> Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
> Signed-off-by: Hsin-Yu Chao <hychao@chromium.org>
> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> ---
> drivers/bluetooth/btusb.c | 157 +++++++++++++++++++++++++++++---------
> 1 file changed, 121 insertions(+), 36 deletions(-)

I would really prefer to have some Tested-by lines from people that can verify that this patch works.

Luiz, do we. Need to address further details for mSBC support?

Regards

Marcel

