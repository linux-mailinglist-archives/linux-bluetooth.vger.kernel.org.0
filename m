Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC2ED3E03D7
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Aug 2021 17:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238794AbhHDPCI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 4 Aug 2021 11:02:08 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:36817 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238862AbhHDPAw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 4 Aug 2021 11:00:52 -0400
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
        by mail.holtmann.org (Postfix) with ESMTPSA id D8023CECD5;
        Wed,  4 Aug 2021 17:00:38 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v6 00/12] Bluetooth: btintel: Refactoring setup routines
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210804044032.59729-1-hj.tedd.an@gmail.com>
Date:   Wed, 4 Aug 2021 17:00:38 +0200
Cc:     BlueZ <linux-bluetooth@vger.kernel.org>,
        Tedd Ho-Jeong An <tedd.an@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <E4C1739A-8F01-4771-9A86-EF2F48110798@holtmann.org>
References: <20210804044032.59729-1-hj.tedd.an@gmail.com>
To:     Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Tedd,

> This patch set refactors the multiple setup routines for various Intel devices
> to a combined single entry. Here are the highlight of the changes:
> 
> 1. Updated hci_alloc_dev() to allocate the hdev object with an extra buffer
>   for the private data. btintel introduces the btintel_data struct and
>   store it to the private data in hdev object.
> 
> 2. Added a single entry for setup and shutdown and uses the
>   HCI_Intel_Read_Version command to identify the device, instead of
>   relying on the USB VID and PID. The new HCI_Intel_Read_Version command
>   is used for both legacy ROM, legacy Bootloader and TLV based bootloader.
> 
>   Also, btintel_configure_setup() is added to setup the most of hdev
>   callbacks, unless it is a transport specific functions.
> 
>   After identifying the device, it calls the corresponding setup routines.
>   These routines were copied from btusb to btintel and changes are none or
>   very minimal.
> 
> 3. Keep the state of bootloader in btintel object. The bootloader state
>   is agnostic to the transport type, so btintel uses the btintel_data
>   to keep track of the state in the private data section in hdev.
> 
>   Also, added macros to set/clear/test flags to simplify the code.
> 
> 5. Cleaned up the exported functions and make it static as much as possible
>   if not necessary.
> 
> 6. From the JfP/ThP, the operational firmware support the new TLV based
>   HCI_Intel_Read_Version command, which confues the usage during the
>   setup routine. So, the check for firmware variant of those legacy
>   bootloader sku is added to use the legacy bootloader setup call.
> 
> 7. All of HCI quirks for Intel devices are moved in the setup routines.
>   There are several HCI quirks for Intel devices and some of them are
>   for all Intel devices and some of them are for a specific devices.
> 
>   The flag for HCI quirks are removed from the .driver_info, and applying
>   HCI quirks are done in combined setup routine depends on the hw_variant.
> 
> 8. Combined the setting the MSFT extension support in the combined setup
>   routine now depends on the hw_variant.
> 
> Tedd Ho-Jeong An (12):
>  Bluetooth: Add support hdev to allocate private data
>  Bluetooth: btintel: Add combined setup and shutdown functions
>  Bluetooth: btintel: Refactoring setup routine for legacy ROM sku
>  Bluetooth: btintel: Add btintel data struct
>  Bluetooth: btintel: Fix the first HCI command not work with ROM device
>  Bluetooth: btintel: Fix the LED is not turning off immediately
>  Bluetooth: btintel: Add combined set_diag functions
>  Bluetooth: btintel: Refactoring setup routine for bootloader devices
>  Bluetooth: btintel: Move hci quirks to setup routine
>  Bluetooth: btintel: Clean the exported function to static
>  Bluetooth: btintel: Fix the legacy bootloader returns tlv based
>    version
>  Bluetooth: btintel: Combine setting MSFT extension
> 
> drivers/bluetooth/btintel.c      | 1307 ++++++++++++++++++++++++++++--
> drivers/bluetooth/btintel.h      |  119 ++-
> drivers/bluetooth/btusb.c        | 1128 +-------------------------
> include/net/bluetooth/hci_core.h |   13 +-
> net/bluetooth/hci_core.c         |   13 +-
> 5 files changed, 1358 insertions(+), 1222 deletions(-)

I have no further comments, but the patch set needs to be rebased against latest bluetooth-next tree.

Regards

Marcel

