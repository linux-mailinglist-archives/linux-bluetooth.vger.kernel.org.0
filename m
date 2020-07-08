Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FADE21861C
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Jul 2020 13:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728762AbgGHL3c (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 Jul 2020 07:29:32 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:55527 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgGHL3c (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 Jul 2020 07:29:32 -0400
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0657B240011;
        Wed,  8 Jul 2020 11:29:29 +0000 (UTC)
Message-ID: <d9eca20059088ad8bdaac70d7d98811166839b27.camel@hadess.net>
Subject: Re: Temporary device removal during discovery
From:   Bastien Nocera <hadess@hadess.net>
To:     Andrey Batyiev <batyiev@gmail.com>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>
Date:   Wed, 08 Jul 2020 13:29:29 +0200
In-Reply-To: <CAEQQxWxKs7ewwVyq4mnsyLbRhErQe9vZc5joNK6zfGSO3wN5bg@mail.gmail.com>
References: <CAEQQxWxKs7ewwVyq4mnsyLbRhErQe9vZc5joNK6zfGSO3wN5bg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hey Andrey,

On Wed, 2020-07-08 at 13:24 +0300, Andrey Batyiev wrote:
> Hello everyone,
> 
> I've found the following issue:
> 1. in bluetoothctl run "power on", "scan on"
> 2. discovery is now permanent
> 3. make one device discoverable for a moment (e.g. turn bluetooth on
> on your phone)
> 4. bluez would detect new device
> 5. turn bluetooth off on your phone
> 6. now wait
> 
> Expected result:
> 7. your phone should disappear from discovered set after some time
> 
> Actual result:
> 7. phone would stay there until discovery is off (i.e. "scan off" in
> bluetoothctl)
> 
> 
> It seems like there is a code in src/adapter.c responsible for purge
> stale entries
> (remove_temp_devices), however it only triggers when discovery is off
> (and after 3 mins).
> 
> 
> My use case is to continuously monitor the bluetooth environment. Is
> it bluez responsibility to
> remove stale entries during discovery or should my own app repeatedly
> stop discovery?

It's been a problem for a while. I sent one of those mails as well:
https://www.spinics.net/lists/linux-bluetooth/msg75947.html
https://www.spinics.net/lists/linux-bluetooth/msg74397.html

Can you please file a bug at https://github.com/bluez/bluez/issues ?

I'll CC: myself on it too.

Cheers

