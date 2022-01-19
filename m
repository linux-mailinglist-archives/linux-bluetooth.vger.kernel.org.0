Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D745C494107
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 Jan 2022 20:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357005AbiASTi3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 19 Jan 2022 14:38:29 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:51686 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242035AbiASTi1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 19 Jan 2022 14:38:27 -0500
Received: from smtpclient.apple (p4fefca45.dip0.t-ipconnect.de [79.239.202.69])
        by mail.holtmann.org (Postfix) with ESMTPSA id A9FB9CECE1;
        Wed, 19 Jan 2022 20:38:25 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: Pass through USB Bluetooth wireless interface to QEMU
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <331ae35c-7d48-46fc-c4ae-1e60cb0f3378@molgen.mpg.de>
Date:   Wed, 19 Jan 2022 20:38:25 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <EA45836E-E5C8-4B6A-8329-7793692546DA@holtmann.org>
References: <331ae35c-7d48-46fc-c4ae-1e60cb0f3378@molgen.mpg.de>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Paul,

> To debug the issue with file transfers to the Nokia N9 [1], I would like to pass through the USB Bluetooth wireless to QEMU.
> 
>    $ lsusb
>    Bus 001 Device 004: ID 1bcf:28ae Sunplus Innovation Technology Inc. Laptop Integrated Webcam HD
>    Bus 001 Device 003: ID 8087:0a2a Intel Corp. Bluetooth wireless interface
>    Bus 001 Device 002: ID 8087:8001 Intel Corp. Integrated Hub
>    Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>    Bus 003 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>    Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>    $ ls -ld /dev/bus/usb/001/003
>    crw-rw-rw- 1 root root 189, 2 13. Jan 23:05 /dev/bus/usb/001/003
> 
> Then following Leif’s article *QEMU USB host device pass-through* [1], I run
> 
>    $ qemu-system-x86_64 -version
>    QEMU emulator version 6.2.0 (Debian 1:6.2+dfsg-1)
>    Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
>    $ sudo qemu-system-x86_64 -cpu host -m 2G -enable-kvm -usb -device usb-host,vendorid=0x8087,productid=0x0a2a -hda /dev/shm/debian-64.img -net nic -net user,hostfwd=tcp::22223-:22
> 
> (`-device usb-host,hostbus=1,hostport=3` did *not* work for me.)
> 
> In QEMU with *linux-image-5.15.0-2-amd64* 5.15.5-2 and *bluez* 5.62-2 the device is now detected, but bluetoothctl does not detect the controller. (Starting QEMU as root does not make a difference.)
> 
>    # lsusb
>    Bus 001 Device 002: ID 8087:0a2a Intel Corp. Bluetooth wireless interface
>    Bus 001 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
>    # lsusb -t
>    /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
>        |__ Port 1: Dev 2, If 0, Class=Wireless, Driver=btusb, 12M
>        |__ Port 1: Dev 2, If 1, Class=Wireless, Driver=btusb, 12M
> 
>    # bluetoothctl
>    Agent registered
>    [bluetooth]# list
>    [bluetooth]#
> 
>    # systemctl status bluetooth
>    ● bluetooth.service - Bluetooth service
>         Loaded: loaded (/lib/systemd/system/bluetooth.service; enabled; vendor preset: enabled)
>         Active: active (running) since Thu 2022-01-13 23:05:25 CET; 6min ago
>           Docs: man:bluetoothd(8)
>       Main PID: 400 (bluetoothd)
>         Status: "Running"
>          Tasks: 1 (limit: 2326)
>         Memory: 4.4M
>            CPU: 24ms
>         CGroup: /system.slice/bluetooth.service
>                 └─400 /usr/libexec/bluetooth/bluetoothd
> 
>    Jan 13 23:05:25 qemu systemd[1]: Starting Bluetooth service...
>    Jan 13 23:05:25 qemu bluetoothd[400]: Bluetooth daemon 5.62
>    Jan 13 23:05:25 qemu systemd[1]: Started Bluetooth service.
>    Jan 13 23:05:25 qemu bluetoothd[400]: Starting SDP server
>    Jan 13 23:05:25 qemu bluetoothd[400]: Bluetooth management interface 1.21 initialized
> 
> Linux in QEMU logs:
> 
> 
>    # dmesg | grep -e Bluetooth -e hci0
>    [    4.385414] Bluetooth: Core ver 2.22
>    [    4.385453] Bluetooth: HCI device and connection manager initialized
>    [    4.385741] Bluetooth: HCI socket layer initialized
>    [    4.385744] Bluetooth: L2CAP socket layer initialized
>    [    4.385751] Bluetooth: SCO socket layer initialized
>    [    4.593802] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
>    [    4.593806] Bluetooth: BNEP filters: protocol multicast
>    [    4.593809] Bluetooth: BNEP socket layer initialized
>    [    6.544261] Bluetooth: hci0: Reading Intel version command failed (-110)
>    [    6.544310] Bluetooth: hci0: command tx timeout
> 
> The firmware is installed:
> 
>    # ls /lib/firmware/intel/ibt-hw-37.8.10-fw-1.10.3.11.e.bseq
>    /lib/firmware/intel/ibt-hw-37.8.10-fw-1.10.3.11.e.bseq
> 
> Do you have an idea, how to get it working?

actually I never bothered with passing through USB directly. I let the host keep the hci0 and then use something like btproxy or alike to forward the HCI device into the guest as virtio_bt. Qemu is missing support for virtio_bt device and most of the code I am using is not public, but something someone can work on inside Qemu.

Regards

Marcel

