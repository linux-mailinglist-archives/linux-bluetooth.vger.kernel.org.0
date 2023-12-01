Return-Path: <linux-bluetooth+bounces-324-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B44800586
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Dec 2023 09:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BF65B212A2
	for <lists+linux-bluetooth@lfdr.de>; Fri,  1 Dec 2023 08:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB481A59A;
	Fri,  1 Dec 2023 08:28:29 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48451717;
	Fri,  1 Dec 2023 00:28:23 -0800 (PST)
Received: from [192.168.0.183] (ip5f5af6e9.dynamic.kabel-deutschland.de [95.90.246.233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7DC3461E5FE01;
	Fri,  1 Dec 2023 09:27:48 +0100 (CET)
Message-ID: <d095bcbe-af0c-4eb3-99c8-32371136dd2c@molgen.mpg.de>
Date: Fri, 1 Dec 2023 09:27:47 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: Inoperative bluetooth, Intel chipset, mainline kernel
 6.6.2+
Content-Language: en-US
To: "Kris Karas (Bug Reporting)" <bugs-a21@moonlit-rail.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-bluetooth@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Zach <zacheryvig@outlook.com>
References: <ee109942-ef8e-45b9-8cb9-a98a787fe094@moonlit-rail.com>
 <ZWl82n695TIC7nUO@archie.me>
 <115e819b-0271-403c-b034-ef3aebbb85cd@moonlit-rail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <115e819b-0271-403c-b034-ef3aebbb85cd@moonlit-rail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Kris,


Am 01.12.23 um 09:19 schrieb Kris Karas (Bug Reporting):
> Bagas Sanjaya wrote:
>> Kris Karas (Bug Reporting) wrote:
>>> I have a regression going from mainline kernel 6.1.62 to 6.1.63, and 
>>> also
>>> from kernel 6.6.1 to 6.6.2; I can bisect if patch authors can't 
>>> locate the
>>> relevant commit.  In the most recent kernels mentioned, bluetooth won't
>>> function.
>>
>> Then please do bisection; without it, nobody will look into this 
>> properly.
> 
> As only a few people are reporting this, it must be pretty 
> hardware-specific (or perhaps Kconfig/firmware specific).  I'll do a 
> bisect.  A bit too late here in Boston (03:00), and kiddo's birthday 
> "later today", so will probably get to this on the weekend.
> 
>> You may also want to check current mainline (v6.7-rc3) to see if this
>> regression have already been fixed.
> 
> Just tried 6.7.0-rc3, and it is also affected.
> 
> I hadn't git-pulled my linux-stable since May, so that gave me a good 
> chance to test the very latest.  :-)  And conveniently I'm now set for 
> the bisect.

Nice, that is often the fastest way to fix something.

To avoid the time rebooting the system, you could try to expose the 
drive to a virtual machine [1].


Kind regards,

Paul


[1]: 
https://lore.kernel.org/all/331ae35c-7d48-46fc-c4ae-1e60cb0f3378@molgen.mpg.de/
      (The failure in the VM was due to another regression in the Linux 
kernel, so the how-to actually worked for me.)

