Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67B8373342
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Jul 2019 18:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfGXQBB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 24 Jul 2019 12:01:01 -0400
Received: from 8.mo3.mail-out.ovh.net ([87.98.172.249]:37423 "EHLO
        8.mo3.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbfGXQBB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 24 Jul 2019 12:01:01 -0400
X-Greylist: delayed 2314 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Jul 2019 12:01:00 EDT
Received: from player728.ha.ovh.net (unknown [10.109.160.62])
        by mo3.mail-out.ovh.net (Postfix) with ESMTP id 6AD34220263
        for <linux-bluetooth@vger.kernel.org>; Wed, 24 Jul 2019 17:22:25 +0200 (CEST)
Received: from brouillet.org (bed84-1-78-229-93-161.fbx.proxad.net [78.229.93.161])
        (Authenticated sender: postmaster@brouillet.org)
        by player728.ha.ovh.net (Postfix) with ESMTPSA id DF02F83196C8
        for <linux-bluetooth@vger.kernel.org>; Wed, 24 Jul 2019 15:22:24 +0000 (UTC)
To:     linux-bluetooth@vger.kernel.org
From:   Marcel Brouillet <marcel@brouillet.org>
Subject: A2DP sound in ALSA vs PulseAudio
Message-ID: <3babfac8-767d-5249-f6df-67bf60892d7b@brouillet.org>
Date:   Wed, 24 Jul 2019 17:22:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: fr-classic
X-Ovh-Tracer-Id: 8624674762922441804
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrkedtgdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,

I have enabled A2DP sinking on my Ubuntu 18.03 computer, and I am able 
to stream sound from my phone to my PC. Pavucontrol sees a new device in 
"Configuration", a new input in the "Input Devices" tab and a new item 
in the "Playback" tab : "Loopback from xyz".

BUT there are no new devices shown in ALSA (result of aplay -l is 
unchanged). It seems this is intentional by design, to only register the 
new devices in Pulse Audio. I use Mixxx which lists ALSA devices.

Question : What is the best current way to get A2DP sound at ALSA level ?

I found relevant discussions :

- https://stackoverflow.com/questions/12338621/a2dp-sink-without-pulseaudio

- 
https://forum.armbian.com/topic/6480-bluealsa-bluetooth-audio-using-alsa-not-pulseaudio/ 
referencing a BluezAlsa project.

Has any of the above been integrated in the core bluez (should I 
recompile bluez with a config parameter) ?

Is there any advocacy against listing the devices in ALSA ? or any 
incompatibilities ?

Thank you.

