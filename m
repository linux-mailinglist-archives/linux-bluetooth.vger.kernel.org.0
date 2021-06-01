Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33C7439543D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 May 2021 05:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhEaDpS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 30 May 2021 23:45:18 -0400
Received: from mailbackend.panix.com ([166.84.1.89]:60898 "EHLO
        mailbackend.panix.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhEaDpQ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 30 May 2021 23:45:16 -0400
Received: from xps-7390 (ip70-164-222-119.oc.oc.cox.net [70.164.222.119])
        by mailbackend.panix.com (Postfix) with ESMTPSA id 4Fth3D151fz4D5N;
        Sun, 30 May 2021 23:43:36 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
        t=1622432616; bh=KxHI67tRBI6NVKTW8xxHJiIZXlRcWaWvnTiFugRIOtI=;
        h=Date:From:Reply-To:To:cc:Subject:In-Reply-To:References;
        b=gFrXCYhrNcV6wouzCf1sVJuT/FwYzKvKPj1FhzG71Mc1o2m5RCVuDxyaHjk1P2TpB
         AekE9VVFMtLeT3Sxr77KM90OASF0dyfMCbP8hI8ZNHFXjgCC9KAWgXGCAVpWQgeS6J
         8OK2VB8NkAEnp4m1dHN5XRUS3IRPdVY/Xt8e6u0o=
Date:   Sun, 30 May 2021 20:43:35 -0700 (PDT)
From:   "Kenneth R. Crudup" <kenny@panix.com>
Reply-To: "Kenneth R. Crudup" <kenny@panix.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
cc:     Luiz Augusto Von Dentz <luiz.von.dentz@intel.com>,
        "An, Tedd" <tedd.an@intel.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Re: Commit 9b16bfbf41 ("Bluetooth: btintel: Move operational checks
 after version check") causing BT FW loading problems
In-Reply-To: <CABBYNZKqK6wEyrAL9y7+mPSWKr5CG=NnSEJK67Tt9ogimYA-zw@mail.gmail.com>
Message-ID: <388538-11df-ce26-8737-9c611e69498a@panix.com>
References: <42d9c52a-bcc9-13e6-9b1d-d9a94ff2889f@panix.com> <CABBYNZKqK6wEyrAL9y7+mPSWKr5CG=NnSEJK67Tt9ogimYA-zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Sun, 30 May 2021, Luiz Augusto von Dentz wrote:

> What exact kernel version are you testing this?

I grab Linus' master branch every few days.

> In case of the former you will probably need the following commit:

> https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/commit/?id=183dce5a7fd3040ced6a220b0aa536c926f10cd9

OK, I'll apply that and try again. Thanks!

	-Kenny

-- 
Kenneth R. Crudup  Sr. SW Engineer, Scott County Consulting, Orange County CA
