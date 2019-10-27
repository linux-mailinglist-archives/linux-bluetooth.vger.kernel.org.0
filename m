Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAA8EE650A
	for <lists+linux-bluetooth@lfdr.de>; Sun, 27 Oct 2019 20:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbfJ0TRX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 27 Oct 2019 15:17:23 -0400
Received: from ec2-52-19-174-175.eu-west-1.compute.amazonaws.com ([52.19.174.175]:39754
        "EHLO rdmp.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726985AbfJ0TRX (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 27 Oct 2019 15:17:23 -0400
X-Greylist: delayed 966 seconds by postgrey-1.27 at vger.kernel.org; Sun, 27 Oct 2019 15:17:22 EDT
Received: from [127.0.0.1] (helo=localhost)
        by rdmp.org with esmtp (Exim 4.92)
        (envelope-from <bluez-2hxy5d@rdmp.org>)
        id 1iOnmt-0001wT-Bb
        for linux-bluetooth@vger.kernel.org; Sun, 27 Oct 2019 19:01:15 +0000
Message-ID: <37e50a80d823b267508893db9573a1903c87d0c6.camel@rdmp.org>
Subject: Audio out to phone
From:   Dale Mellor <bluez-2hxy5d@rdmp.org>
To:     linux-bluetooth@vger.kernel.org
Date:   Sun, 27 Oct 2019 19:01:15 +0000
Organization: DM Bespoke Computer Solutions Ltd
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Does anybody know of any tricks needed to get audio to go out through
an ongoing phone call?  Everything in my setup looks good, with all the
right devices and settings in bluetoothctl, pavucontrol (including
correct headset/handsfree profiles) and I can hear the caller, but they
are only getting silence from my end.  I am using the pulseaudio
asynchronous API, which works well enough playing through speakers but
I can't get sound through the telephone (an Android device, which works
perfectly well with my car's headset).

bluez5: 5.51
ofono:  1.30
pulseaudio: 13.0
debian: 10 (stable)
linux: 5.3.0

I'm quite desperate to get this sorted, so if it is an unsolved problem
perhaps some pointers to where the issue might be will help me to help
you debug the situation?  As you see from the updatedness of the
packages, I have built them all from source and can dig if necessary.

Thanks in advance for any help,
Dale


