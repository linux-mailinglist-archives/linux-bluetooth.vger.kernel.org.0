Return-Path: <linux-bluetooth+bounces-7821-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD7499B692
	for <lists+linux-bluetooth@lfdr.de>; Sat, 12 Oct 2024 20:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E9772834E5
	for <lists+linux-bluetooth@lfdr.de>; Sat, 12 Oct 2024 18:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5381865E9;
	Sat, 12 Oct 2024 18:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="OAw3re6u"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8950A1552FA
	for <linux-bluetooth@vger.kernel.org>; Sat, 12 Oct 2024 18:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728756898; cv=none; b=fJd0onB1GKZpiObzjdodZ1S07LITjU4/UaRGlzgPvTOCMBOfTpWZArgvJBnIkx00FEK9XBoADfX9NjZGGbjipLN0gszgiWffzSSO/Tb0NgZNQjAuFzS/1KkEDTk3F4GsncURnEkyZcf1zzBfC3tEfkkoLq2mVoucNplGAXdaApE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728756898; c=relaxed/simple;
	bh=OhKxUwP02wVHMJcMOaPvnNhAW34yYdKlScpyrawA+i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0Vb0mcuibHPmFFIvqBzCjX5L2WrzlMEUEd0ipzGdMBQ9K+i2UQzx+1sVPGTVDz30sTRk65F7hAeelIp8OLiRqA/3R0eoswaB5d2zjNmRP1RE5CiXEqlfskU6zJsXJeeLJEebHxJU1rXN76sjCnFPeuT45pvXqSrLyhZ9Nd+Smw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=OAw3re6u; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.80.133] (unknown [207.7.121.250])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4XQs8t5XmCz4QGF;
	Sat, 12 Oct 2024 14:14:54 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1728756895; bh=OhKxUwP02wVHMJcMOaPvnNhAW34yYdKlScpyrawA+i0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=OAw3re6uT8h7zURW4OT0vLfAxlnAMxyof2Dji/vk1uXqAABqb+HmENMjk6QtBO2yd
	 QYSTtNP/goxrQb7WOkw9PHESVya+Ul9xSE7u7FQhdy81kEYOUihojtpbMB15vvfC3L
	 W/2E4KlfobVl/Sfc51Z9ZfHJ8ZKWmJnH4/qbjgvc=
Message-ID: <a34d2761-dad4-4ae7-8787-6bbf05538318@panix.com>
Date: Sat, 12 Oct 2024 11:14:53 -0700
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Commit 610712298b11 ("btusb: Don't fail external suspend
 requests") breaks BT upon resume on my laptop
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Me <kenny@panix.com>
Cc: luiz.von.dentz@intel.com, linux-bluetooth@vger.kernel.org
References: <6c599d9b-a000-48d8-ae88-ff424bf5ec38@panix.com>
 <CABBYNZJoUJCowqdPHyajKfV420bWGpOqqUO34Ooh67onZGQy1A@mail.gmail.com>
 <e158d058-1c94-48b9-ad4f-dd6fa54dece9@panix.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <e158d058-1c94-48b9-ad4f-dd6fa54dece9@panix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Without the PM calls the commit works OK.

-Kenny

On 10/11/24 20:01, Kenneth Crudup wrote:
> 
> I'll try it without the PM calls and let you know (unless you get to it 
> before I do).
> 
> -K
> 
> On 10/11/24 19:57, Luiz Augusto von Dentz wrote:
>> Hi Kenneth,
>>
>> On Fri, Oct 11, 2024 at 9:58 PM Kenneth Crudup <kenny@panix.com> wrote:
>>>
>>>
>>> I'm running Linus' master (as of 09f6b0c890); resuming leaves me with a
>>> somewhat-broken BT, but rmmod/modprobe "btusb" usually fixes it, at
>>> least once.
>>>
>>> Reverting the above commit returns BT suspend/resume back to normal,
>>> however.
>>>
>>> If you need any further info, please let me know.
>>
>> Thanks for the report, looks like this is related to Fixes:
>> 81b3e33bb054 ("Bluetooth: btusb: Don't fail external suspend
>> requests"), we most likely gonna need to revert it or change it to not
>> call hci_suspend_dev/hci_resume_dev since those are tuned for
>> system-suspend/system-resume.
>>
>>> -K
>>>
>>> -- 
>>> Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange
>>> County CA
>>>
>>>
>>
>>
> 

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


