Return-Path: <linux-bluetooth+bounces-148-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAA97F3394
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Nov 2023 17:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A09B81C21C72
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 Nov 2023 16:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0665A10A;
	Tue, 21 Nov 2023 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 24155199
	for <linux-bluetooth@vger.kernel.org>; Tue, 21 Nov 2023 08:23:09 -0800 (PST)
Received: (qmail 1493358 invoked by uid 1000); 21 Nov 2023 11:23:08 -0500
Date: Tue, 21 Nov 2023 11:23:07 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Marcel Holtmann <marcel@holtmann.org>,
  Johan Hedberg <johan.hedberg@gmail.com>,
  Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
  linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
  Hans de Goede <hdegoede@redhat.com>, Mike Jones <mike@mjones.io>,
  Rocky Liao <quic_rjliao@quicinc.com>
Subject: Re: Qualcomm Atheros QCA61x4 keeps drawing 0.85 W despite Bluetooth
 being disable in GNOME
Message-ID: <fd84c14a-1866-4643-8ce9-0d6da5c4b82e@rowland.harvard.edu>
References: <d994bd71-8d8b-4b6a-855e-8ea5bfede3ca@molgen.mpg.de>
 <22494842-a785-4151-915d-6f3a677d96cb@molgen.mpg.de>
 <1f3cb0cc-4bb0-471f-a785-a5d237cd46a3@rowland.harvard.edu>
 <d63ebc5f-9b72-4457-949b-3e90883bd3c0@molgen.mpg.de>
 <d61ae9a8-2228-4af1-a5f0-912e7763fbd1@rowland.harvard.edu>
 <de236c7d-e265-452a-a60e-b10293a5b944@molgen.mpg.de>
 <41253614-764e-4e95-b052-a46bf5587c29@rowland.harvard.edu>
 <3489df64-0f8f-43e1-a05f-ccb145ff6d59@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3489df64-0f8f-43e1-a05f-ccb145ff6d59@molgen.mpg.de>

On Mon, Nov 20, 2023 at 11:05:04PM +0100, Paul Menzel wrote:
> [Cc: +Rocky Liao as Qualcomm developer]

> Am 20.11.23 um 19:10 schrieb Alan Stern:
> > Again, nothing out of the ordinary.  Maybe dynamic debugging will give
> > us a clue.  Try doing this:
> > 
> > 	Unload the btusb module.
> > 
> > 	echo module usbcore +p >/sys/kernel/debug/dynamic_debug/control
> > 
> > 	Load the btusb module
> > 
> > 	Make sure that Bluetooth is turned off in Gnome
> > 
> > 	Wait a few seconds
> > 
> > 	echo module usbcore -p >/sys/kernel/debug/dynamic_debug/control
> > 
> > Then let's see what the dmesg log contains for that time period.
> 
> 
> ```
> $ sudo modprobe -r btusb
> $ sudo dmesg | tail -1
> [340309.272439] usbcore: deregistering interface driver btusb
> $ echo module usbcore +p | sudo tee /sys/kernel/debug/dynamic_debug/control
> module usbcore +p
> $ sudo modprobe btusb
> $ /sbin/rfkill
> ID TYPE      DEVICE      SOFT      HARD
>  1 wlan      phy0   unblocked unblocked
> 36 bluetooth hci0     blocked unblocked
> $ echo module usbcore -p | sudo tee /sys/kernel/debug/dynamic_debug/control
> module usbcore -p
> $ sudo modprobe -r btusb
> $ sudo dmesg | tail -1
> [340608.761313] usbcore: deregistering interface driver btusb
> $ sudo dmesg
> […]
> [340309.272439] usbcore: deregistering interface driver btusb
> [340560.326182] xhci_hcd 0000:00:14.0: hcd_pci_runtime_resume: 0
> [340560.326214] usb usb1: usb auto-resume
> [340560.326258] hub 1-0:1.0: hub_resume
> [340560.326381] usb usb1-port3: status 0107 change 0000
> [340560.326418] usb usb1-port4: status 0107 change 0000
> [340560.326451] usb usb1-port5: status 0507 change 0000
> [340560.326650] hub 1-0:1.0: state 7 ports 12 chg 0000 evt 0000
> [340560.326807] hub 1-0:1.0: state 7 ports 12 chg 0000 evt 0000
> [340560.373988] usb 1-3: usb auto-resume
> [340560.373998] hub 1-0:1.0: state 7 ports 12 chg 0000 evt 0008
> [340560.441936] usb 1-3: Waited 0ms for CONNECT
> [340560.441957] usb 1-3: finish reset-resume
> [340560.570940] usb 1-3: reset full-speed USB device number 2 using xhci_hcd

Those two lines are unexpected.  Why does the device need to be reset?
While the btusb module is loaded, does anything show up in
/sys/bus/usb/devices/1-3/quirks?

> > Also, please post the output from "lsusb -v" for the Bluetooth device.
> 
> ```
> $ sudo lsusb -d 0cf3:e300 -v
> 
> Bus 001 Device 002: ID 0cf3:e300 Qualcomm Atheros Communications QCA61x4
> Bluetooth 4.0
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.01
>   bDeviceClass          224 Wireless
>   bDeviceSubClass         1 Radio Frequency
>   bDeviceProtocol         1 Bluetooth
>   bMaxPacketSize0        64
>   idVendor           0x0cf3 Qualcomm Atheros Communications
>   idProduct          0xe300 QCA61x4 Bluetooth 4.0
>   bcdDevice            0.01
>   iManufacturer           0
>   iProduct                0
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x00b1
>     bNumInterfaces          2
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0xe0
>       Self Powered
>       Remote Wakeup

That's what I was interested in.  The device does support remote wakeup.

> PPS: Looking through the commit log/history for `drivers/bluetooth/btusb.c`,
> I found commit 7ecacafc2406 (Bluetooth: btusb: Disable runtime suspend on
> Realtek devices) [1] authored on December 5th, 2019. This is for Realtek
> devices though, and not Qualcomm.

Furthermore the driver has changed considerably since 2019.  See
commits 8274db0776d1, 895915226a59, 7bd9fb058d77, and 34ec58b9fd1c.

Alan Stern

