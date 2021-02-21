Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F234532099E
	for <lists+linux-bluetooth@lfdr.de>; Sun, 21 Feb 2021 11:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhBUKc7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 21 Feb 2021 05:32:59 -0500
Received: from somewhere-in-the-space.org ([109.190.28.168]:50257 "EHLO
        shorea3.somewhere-in-the-space.org" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229502AbhBUKc6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 21 Feb 2021 05:32:58 -0500
Received: from bomberx.somewhere-in-the-space.org (unknown [192.168.1.66])
        by shorea3.somewhere-in-the-space.org (Postfix) with ESMTPSA id 568D91407F
        for <linux-bluetooth@vger.kernel.org>; Sun, 21 Feb 2021 11:22:23 +0100 (CET)
Message-ID: <cb794fdce48fdfb2fd18ae2d47378d7bc1fa71ba.camel@oscopy.org>
Subject: Message Access Protocol using DBus bluez ConnectProfile()
From:   Arnaud Gardelein <arnaud@oscopy.org>
To:     linux-bluetooth@vger.kernel.org
Date:   Sun, 21 Feb 2021 11:22:22 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

How to connect to a phone using Message Access Protocol (MAP) using
DBus ?

Currently I'm using a call to sdptool to browse the device, find the
relevant port by mean of xml output analysis, and then call session bus
org.bluez.obex / org.bluez.obex.Client1 / CreateSession(), see [1]. I
found relevant documentation for this here [2].

Using system bus org.bluez / org.freedesktop.DBus.ObjectManager
GetManagedObject() , a list of UUID is returned, including a 128-bits
UUID for MAP '00001132-0000-1000-8000-00805f9b34fb', in here the 16-
bits value 0x1132 is for MAP if I'm not mistaken. When using
org.bluez.Device1 / ConnectProfile(UUID) on device's path, I tried to
find a change on system bus and session bus without success using D-
Feet.

For the sake of clarify I tried also Connect(), and in this case are
appearing paths related to media play. I searched over the Internet,
found some pages related to GATT but not completely in line with my
question it seems.

What is the correct usage of ConnectProfile(UUID) ? Can this be used to
access phone's MAP ? I this the correct place to ask this question ?

Arnaud.

[1] https://github.com/agardelein/textoter
[2]
https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/doc/obex-api.txt?h=5.50
and neighbor files

