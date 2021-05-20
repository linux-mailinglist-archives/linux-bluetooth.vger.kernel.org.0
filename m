Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3797838B33F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 20 May 2021 17:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232965AbhETP3U (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 20 May 2021 11:29:20 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:55595 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232955AbhETP3S (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 20 May 2021 11:29:18 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id E7BF3CECEB;
        Thu, 20 May 2021 17:35:49 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [PATCH] Bluetooth: Translate additional address type during
 le_conn_comp
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210520114201.32157-1-sathish.narasimman@intel.com>
Date:   Thu, 20 May 2021 17:27:55 +0200
Cc:     "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        ravishankar.srivatsa@intel.com
Content-Transfer-Encoding: 7bit
Message-Id: <5A31C2E4-D87A-4890-B86A-F1F9BB790E67@holtmann.org>
References: <20210520114201.32157-1-sathish.narasimman@intel.com>
To:     Sathish Narasimman <sathish.narasimman@intel.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sathish,

> When using controller based address resolution, then the destination
> address type during le_conn_complete uses 0x02 & 0x03 if controller
> resolves the destination address(RPA).
> These address types need to be converted back into either 0x00 0r 0x01
> 
> Signed-off-by: Sathish Narasimman <sathish.narasimman@intel.com>
> ---
> net/bluetooth/hci_event.c | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

