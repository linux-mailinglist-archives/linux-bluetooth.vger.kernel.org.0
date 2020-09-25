Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 414FD278F9B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 25 Sep 2020 19:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727749AbgIYR2q (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 25 Sep 2020 13:28:46 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:40063 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgIYR2q (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 25 Sep 2020 13:28:46 -0400
Received: from [172.20.10.2] (dynamic-046-114-136-219.46.114.pool.telefonica.de [46.114.136.219])
        by mail.holtmann.org (Postfix) with ESMTPSA id D3573CECDF;
        Fri, 25 Sep 2020 19:35:41 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] Bluetooth: Fix - update own_addr_type if ll_privacy
 supported
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200925123215.15569-1-sathish.narasimman@intel.com>
Date:   Fri, 25 Sep 2020 19:28:40 +0200
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        ravishankar.srivatsa@intel.com, kiran.k@intel.com,
        Sathish Narasimman <sathish.narasimman@intel.com>
Content-Transfer-Encoding: 7bit
Message-Id: <41DF9440-73B5-45FA-A12F-876F40B55B8C@holtmann.org>
References: <20200925123215.15569-1-sathish.narasimman@intel.com>
To:     Sathish Narasimman <nsathish41@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Satish,

> During system powercycle when trying to get the random address
> hci_get_random_address set own_addr_type as 0x01. In which if we enable
> ll_privacy it is supposed to be 0x03.
> 
> Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
> ---
> net/bluetooth/hci_request.c | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

