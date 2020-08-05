Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5533F23D161
	for <lists+linux-bluetooth@lfdr.de>; Wed,  5 Aug 2020 22:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729831AbgHET77 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 5 Aug 2020 15:59:59 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:57626 "EHLO
        zm-mta-out-3.u-ga.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727902AbgHEQmA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 5 Aug 2020 12:42:00 -0400
X-Greylist: delayed 3753 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Aug 2020 12:41:59 EDT
Received: from zm-mta-out.u-ga.fr (zm-mta-out.u-ga.fr [152.77.200.53])
        by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D656D4114A;
        Wed,  5 Aug 2020 16:15:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=univ-grenoble-alpes.fr; s=2020; t=1596636921;
        bh=Zt1T/CpzCqJIEWzrAeePDreLWGu5RL2i6Ub8umsFiPs=;
        h=Date:From:To:Cc:Subject:From;
        b=lWdtGM9HMpn8NvxxxiZit6owszSOtY5AESaxgQ5odSyyvjYypkqt5kzdAajsqVYaB
         eKU29nH6xULoKEtLqrEac9acgH3fz6lPrGpZ8PZVu7aSpyhcj8DlUwujN8PonGvwUt
         jSq+6uhD2yOXG8mFWY31cghzCRAFUaRrXzSyNBymawYhwPk1G4pFmYAwVIaKDZc2ai
         v6bI8CcCwHvKtkALw0+Dn38s0AgkP1PSzaKswN9V3loj8w0HpvF9lhbk9KBlQorE7h
         xXm5ka5cFq9Oi+4WIKC8N76WNKQ0gjqPBoM5qXY/hbc+ccDcH5fdgLUT0Bw7flcvul
         IzA3R/2sYCOrw==
Received: from smtps.univ-grenoble-alpes.fr (smtps1.u-ga.fr [152.77.1.30])
        by zm-mta-out.u-ga.fr (Postfix) with ESMTP id CF7BB80831;
        Wed,  5 Aug 2020 16:15:21 +0200 (CEST)
Received: from ifmail.u-ga.fr (ifmail.u-ga.fr [152.77.212.13])
        by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTP id 61FA0187E12;
        Wed,  5 Aug 2020 16:15:21 +0200 (CEST)
Received: by ifmail.u-ga.fr (Postfix, from userid 33)
        id 9DC454059F; Wed,  5 Aug 2020 16:15:21 +0200 (CEST)
Received: from lfbn-lyo-1-473-99.w2-7.abo.wanadoo.fr
 (lfbn-lyo-1-473-99.w2-7.abo.wanadoo.fr [2.7.63.99]) by
 ifmail.univ-grenoble-alpes.fr (Horde Framework) with HTTP; Wed, 05 Aug 2020
 14:15:21 +0000
Date:   Wed, 05 Aug 2020 14:15:21 +0000
Message-ID: <20200805141521.Horde.OY2o_GjmTsW1aKqSHDZjf1V@ifmail.univ-grenoble-alpes.fr>
From:   demailly <Jean-Pierre.Demailly@univ-grenoble-alpes.fr>
To:     linux-bluetooth@vger.kernel.org
Cc:     tina@vson.com.cn,
        Jean-Pierre Demailly 
        <jean-pierre.demailly@univ-grenoble-alpes.fr>
Subject: Reading data from bluetooth LCD tablet
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 152.77.212.13
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

I recently bought a NewYes LCD tablet that is advertized with  
Android/Windows/MacOS software only, but can still act as an excellent  
(and cheap) graphics tablet under Linux, check
     
https://www.banggood.com/NEWYES-10inch-Bluetooth-Archive-Synchronize-Writing-Tablet-Save-Drawing-LCD-Office-Family-Graffiti-Toy-Gift-p-1446888.html?cur_warehouse=CN

I succeeded in writing a rather simple user space driver for the  
tablet connected with the USB cable, using libusb.
The code is available as newyes_tablet_driver.tar.bz2 on
     https://sourceforge.net/projects/sf-xpaint/files/deskwrite/

However, the constructor does not provide any technical information  
about the bluetooth settings (just proprietary binary code, see  
http://9612.myvsoncloud.com/). The device is seen as

bd-address: FF:FF:05:00:1C:02
name: VSON#WP9612#000000
[CHG] Device FF:FF:05:00:1C:02 UUIDs: 00001800-0000-1000-8000-00805f9b34fb
[CHG] Device FF:FF:05:00:1C:02 UUIDs: 00001801-0000-1000-8000-00805f9b34fb
[CHG] Device FF:FF:05:00:1C:02 UUIDs: 0000fff0-0000-1000-8000-00805f9b34fb

Pairing in a standard way does not work, neither under Linux nor  
Windows, although the Android "e-Draw" app provided by the constructor  
(http://www.vson.com.cn/English/html/9571303320.html) seems to provide  
such a pairing - pairing from the Android bluetooth stack itself does  
not work either.

Is there any reasonable way to reverse-engineer this stuff in the  
absence of response from VSON at this date ? I would content myself  
with the USB connection, but it seems that the data recorded by the  
tablet are available only under bluetooth - they are not obviously  
visible via the usb connection. Worse, the vector data input do not  
seem to be accessible by bluetooth via e-Draw, just png images, which  
is really not a very smart idea.

Being locked by such proprietary policies would be really shameful ...

Many thanks in advance,
Jean-Pierre Demailly

