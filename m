Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC772C04AD
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Nov 2020 12:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728895AbgKWLhe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 23 Nov 2020 06:37:34 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:54536 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728305AbgKWLhe (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 23 Nov 2020 06:37:34 -0500
Received: from marcel-macbook.holtmann.net (unknown [37.83.193.87])
        by mail.holtmann.org (Postfix) with ESMTPSA id DA3E6CECCF;
        Mon, 23 Nov 2020 12:44:43 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: Updated fw versions ignored for Intel devices?
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <0011e099-4ab0-4705-de1e-cb03953f11ef@gmail.com>
Date:   Mon, 23 Nov 2020 12:37:31 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        BlueZ development <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <17CC90CE-CA5F-40B8-8C07-8313A35E944F@holtmann.org>
References: <0011e099-4ab0-4705-de1e-cb03953f11ef@gmail.com>
To:     Heiner Kallweit <hkallweit1@gmail.com>
X-Mailer: Apple Mail (2.3654.20.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Heiner,

> In btusb.c we have the following code. I interpret this in a way
> that once firmware was loaded the driver will never check for
> updated firmware.
> Shouldn't the driver always read the firmware file available on
> the system and check its version against the firmware version
> the device has (and apply it if it's newer)?
> But maybe I miss something ..
> 
> bt_dev_info(hdev, "read Intel version: %02x%02x%02x%02x%02x%02x%02x%02x%02x",
> 	    ver.hw_platform, ver.hw_variant, ver.hw_revision,
> 	    ver.fw_variant,  ver.fw_revision, ver.fw_build_num,
> 	    ver.fw_build_ww, ver.fw_build_yy, ver.fw_patch_num);
> 
> /* fw_patch_num indicates the version of patch the device currently
> * have. If there is no patch data in the device, it is always 0x00.
> * So, if it is other than 0x00, no need to patch the device again.
> */
> if (ver.fw_patch_num) {
> 	bt_dev_info(hdev, "Intel device is already patched. "
> 		    "patch num: %02x", ver.fw_patch_num);
> 	goto complete;
> }

if you reboot it looses its firmware and things start over again.

Regards

Marcel

