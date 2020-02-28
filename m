Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5E5F1731E4
	for <lists+linux-bluetooth@lfdr.de>; Fri, 28 Feb 2020 08:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgB1Hiw (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 28 Feb 2020 02:38:52 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:46364 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgB1Hiw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 28 Feb 2020 02:38:52 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 55D2ECECF7;
        Fri, 28 Feb 2020 08:48:17 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v2] Bluetooth: Fix - Remove adv set for directed
 advertising
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200224053224.9349-1-sathish.narasimman@intel.com>
Date:   Fri, 28 Feb 2020 08:38:50 +0100
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Sathish Narsimman <sathish.narasimman@intel.com>
Content-Transfer-Encoding: 7bit
Message-Id: <956F6F65-63F6-465B-B5C4-A295CB53E823@holtmann.org>
References: <20200224053224.9349-1-sathish.narasimman@intel.com>
To:     Sathish Narsimman <nsathish41@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sathish,

> Extended advertising Data is set during bluetooth initialization
> by default which causes InvalidHCICommandParameters when setting
> Extended advertising parameters.
> 
> As per Core Spec 5.2 Vol 2, PART E, Sec 7.8.53, for
> advertising_event_property LE_LEGACY_ADV_DIRECT_IND does not
> supports advertising data when the advertising set already
> contains some, the controller shall return erroc code
> 'InvalidHCICommandParameters(0x12).
> 
> So it is required to remove adv set for handle 0x00. since we use
> instance 0 for directed adv.
> 
> Signed-off-by: Sathish Narsimman <sathish.narasimman@intel.com>
> ---
> include/net/bluetooth/hci.h |  2 ++
> net/bluetooth/hci_conn.c    | 10 ++++++++++
> 2 files changed, 12 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

