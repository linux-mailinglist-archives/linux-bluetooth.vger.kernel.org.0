Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E6E1B4C13
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Apr 2020 19:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgDVRpj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Apr 2020 13:45:39 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:55651 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbgDVRpj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Apr 2020 13:45:39 -0400
Received: from [192.168.1.91] (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 2FC1ECECFD;
        Wed, 22 Apr 2020 19:55:16 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 1/2] Bluetooth: btusb: Add support for Intel Bluetooth
 Device Typhoon Peak (8087:0032)
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200417095012.8443-1-amit.k.bag@intel.com>
Date:   Wed, 22 Apr 2020 19:45:38 +0200
Cc:     linux-firmware@kernel.org,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        "Srivatsa, Ravishankar" <ravishankar.srivatsa@intel.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        "Hegde, Raghuram" <raghuram.hegde@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <E5A033B8-8422-48BD-AC02-AB97574B57E4@holtmann.org>
References: <20200417095012.8443-1-amit.k.bag@intel.com>
To:     Amit K Bag <amit.k.bag@intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Amit,

> 
> Signed-off-by: Amit K Bag <amit.k.bag@intel.com>
> ---
> drivers/bluetooth/btusb.c | 2 ++
> 1 file changed, 2 insertions(+)

please include the content of /sys/kernel/debug/usb/devices for this hardware.

Regards

Marcel

