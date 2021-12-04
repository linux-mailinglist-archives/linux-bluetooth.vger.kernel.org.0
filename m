Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7106346846C
	for <lists+linux-bluetooth@lfdr.de>; Sat,  4 Dec 2021 12:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350453AbhLDLXo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 4 Dec 2021 06:23:44 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:58114 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238982AbhLDLXn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 4 Dec 2021 06:23:43 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 983B22112B;
        Sat,  4 Dec 2021 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1638616817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EYTsifhkZfK+otHneIi+GPdYkHQyYWIVjNDq+7hrUtA=;
        b=KoSMpFybb2V4rh1ShRJQEUpK5f29KE7oh10b+e9+37Awj/KxznFh+Wr5cT8kYHEZD2j47F
        gTUqfckkKeD8BKQbrle4jsGe9n18FKGLCL4eenEpTfTMU1v/sOQCXlQCiVUpAaAQg1/U+A
        tvdc6I9mr+NyDc2bPAKv3ea5et6PwNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1638616817;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EYTsifhkZfK+otHneIi+GPdYkHQyYWIVjNDq+7hrUtA=;
        b=YtJPSt8cWyNKqlfdZnscIDG+9RMfsxw+EUi4gm2McMNk3J5Phh6ipz0Z0+zvNsNYUfeV9Y
        ZJ3mNzooqUs8ymDA==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 72F6BA3B81;
        Sat,  4 Dec 2021 11:20:17 +0000 (UTC)
Date:   Sat, 04 Dec 2021 12:20:17 +0100
Message-ID: <s5h5ys4sjke.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Takashi Iwai <tiwai@suse.de>, Paul Menzel <pmenzel@molgen.mpg.de>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Tedd Ho-Jeong An <tedd.an@intel.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: Apply initial command workaround for more Intel chips
In-Reply-To: <9C896BDF-FBB1-4C3D-B98E-79D818191DBC@holtmann.org>
References: <20211202162256.31837-1-tiwai@suse.de>
        <acc7b5b4-72cc-9f3b-90a6-6fbf6c3a71e7@molgen.mpg.de>
        <s5h7dcnt0lp.wl-tiwai@suse.de>
        <6191d067-4eae-4776-5840-1d826113a6d5@molgen.mpg.de>
        <s5h4k7qtakt.wl-tiwai@suse.de>
        <9C896BDF-FBB1-4C3D-B98E-79D818191DBC@holtmann.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Fri, 03 Dec 2021 22:18:06 +0100,
Marcel Holtmann wrote:
> 
> Hi Takashi,
> 
> >>>>> It seems that a few more Intel chips require the workaround for the
> >>>>> broken initial command.  At least, per openSUSE Bugzilla reports,
> >>>>> 8087:0a2a and 8087:0026 need BTUSB_INTEL_BROKEN_INITIAL_NCMD flag.
> >>>>> 
> >>>>> Fixes: 83f2dafe2a62 ("Bluetooth: btintel: Refactoring setup routine for legacy ROM sku")
> >>>>> Buglink: https://bugzilla.opensuse.org/show_bug.cgi?id=1193124
> >>>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> >>>>> 
> >>>> 
> >>>> […]
> >>>> 
> >>>> I have a Dell Latitude E7250 with
> >>>> 
> >>>>     Bus 001 Device 003: ID 8087:0a2a Intel Corp. Bluetooth wireless interface
> >>>> 
> >>>> and Bluetooth seems to work fine minus some Linux warnings [1] and a
> >>>> problem transferring greater than some bytes files with the Nokia N9
> >>>> [2].
> >>>> 
> >>>> Linux 5.16-rc3, Dell Inc. Latitude E7250/0TVD2T, BIOS A19 01/23/2018:
> >>>> 
> >>>> ```
> >>>> $ sudo dmesg | grep -i bluet
> >>>> [    8.173417] calling  bt_init+0x0/0xb3 [bluetooth] @ 301
> >>>> [    8.173439] Bluetooth: Core ver 2.22
> >>>> [    8.173463] NET: Registered PF_BLUETOOTH protocol family
> >>>> [    8.173464] Bluetooth: HCI device and connection manager initialized
> >>>> [    8.173467] Bluetooth: HCI socket layer initialized
> >>>> [    8.173470] Bluetooth: L2CAP socket layer initialized
> >>>> [    8.173473] Bluetooth: SCO socket layer initialized
> >>>> [    8.173475] initcall bt_init+0x0/0xb3 [bluetooth] returned 0 after 35 usecs
> >>>> [    8.216875] Bluetooth: hci0: Legacy ROM 2.5 revision 1.0 build 3 week 17 2014
> >>>> [    8.233515] bluetooth hci0: firmware: direct-loading firmware intel/ibt-hw-37.8.10-fw-1.10.3.11.e.bseq
> >>>> [    8.233520] Bluetooth: hci0: Intel Bluetooth firmware file: intel/ibt-hw-37.8.10-fw-1.10.3.11.e.bseq
> >>>> [    8.540884] Bluetooth: hci0: unexpected event for opcode 0xfc2f
> >>>> [    8.558942] Bluetooth: hci0: Intel BT fw patch 0x32 completed & activated
> >>>> ```
> >>> 
> >>> Thanks, so this seems depending on the hardware, maybe a subtle
> >>> difference matters.  As far as I read the code changes, the workaround
> >>> was applied in the past unconditionally, so it must be fairly safe
> >>> even if the chip works as is.
> >> 
> >> Maybe add that to the commit message?
> > 
> > Maybe, if the upstream agrees with that.  More comments needed from
> > Intel, as it's a kind of black magic.
> > 
> >>> Or, for avoiding the unnecessarily application of the workaround,
> >>> should it be changed as a fallback after the failure at the first
> >>> try...?
> >> 
> >> Reading through the openSUSE Bugzilla issue, the failure is:
> >> 
> >>    Bluetooth: hci0: Reading Intel version command failed (-110)
> >>    Bluetooth: hci0: command 0xfc05 tx timeout
> >> 
> >> I couldn’t find the report for 8087:0a2a in the issue.
> > 
> > There two different machines in the report.
> > 
> >> Can you check,
> >> what firmware is used?
> > 
> > It's the place before loading the firmware, so the firmware version
> > doesn't matter.
> 
> I want to apply this quirk to as little devices as possible. It is one of these quirks we have to hardcode per USB VID:PID since we can’t auto-detect which boot loader is faulty.
> 
> So before I blacklist them, we better get a good understand of which they are. Can you include a btmon trace for that part. You most likely have to blacklist btusb.ko, start btmon and then load btusb.ko manually. One with and one without the quirk. And add that to the commit message.

One of the reporters uploaded the logs to the kernel.org bugzilla
  https://bugzilla.kernel.org/show_bug.cgi?id=215167

(I forgot to add this URL to the patch description, although this
 could be reached from openSUSE Bugzila entry.)

Let me know (or better to access to bugzilla above by yourself) if
anything else is required.


thanks,

Takashi
