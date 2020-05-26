Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 128021A1BD8
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Apr 2020 08:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgDHGRc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 Apr 2020 02:17:32 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:49573 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgDHGRc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 Apr 2020 02:17:32 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 76B97CECE0;
        Wed,  8 Apr 2020 08:27:05 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] bluetooth: btusb: check for NULL in
 btusb_find_altsetting()
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200408052703.7351-1-sathish.narasimman@intel.com>
Date:   Wed, 8 Apr 2020 08:17:30 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Sathish Narasimman <sathish.narasimman@intel.com>
Content-Transfer-Encoding: 7bit
Message-Id: <59D55FAA-CC46-4B13-AD18-D70E9C6C4998@holtmann.org>
References: <20200408052703.7351-1-sathish.narasimman@intel.com>
To:     Sathish Narasimman <nsathish41@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Satish,

> The new btusb_find_altsetting() dereferences it without checking
> the check is added in this patch
> 
> Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
> ---
> drivers/bluetooth/btusb.c | 3 +++
> 1 file changed, 3 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

