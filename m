Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4271F209B78
	for <lists+linux-bluetooth@lfdr.de>; Thu, 25 Jun 2020 10:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390726AbgFYIoX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 25 Jun 2020 04:44:23 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58269 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390025AbgFYIoX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 25 Jun 2020 04:44:23 -0400
Received: from marcel-macpro.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id F256ECECE9;
        Thu, 25 Jun 2020 10:54:14 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 0/1] Refactor btusb_setup_intel_new
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200624183432.1356-1-kiran.k@intel.com>
Date:   Thu, 25 Jun 2020 10:44:21 +0200
Cc:     BlueZ <linux-bluetooth@vger.kernel.org>,
        "Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>,
        kiraank@gmail.com
Content-Transfer-Encoding: 7bit
Message-Id: <FA89D220-E060-4087-8420-66931293F366@holtmann.org>
References: <20200624183432.1356-1-kiran.k@intel.com>
To:     Kiran K <kiran.k@intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Kiran,

> Firmware download code is moved out of btusb_setup_intel_new into 
> a new function to enhance readability and have scalability to plugin
> new firmware download sequence 
> 
> Kiran K (1):
>  Bluetooth: btusb: Refactor of firmware download flow for Intel
>    conrollers
> 
> drivers/bluetooth/btusb.c | 146 +++++++++++++++++++++-----------------
> 1 file changed, 80 insertions(+), 66 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

