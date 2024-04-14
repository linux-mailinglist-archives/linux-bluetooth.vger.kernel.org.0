Return-Path: <linux-bluetooth+bounces-3316-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8B989ACE1
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Apr 2024 22:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A7251C21D0E
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Apr 2024 20:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F6B4D9F3;
	Sat,  6 Apr 2024 20:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="hQS1weFz"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A69B1DFFD
	for <linux-bluetooth@vger.kernel.org>; Sat,  6 Apr 2024 20:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712435281; cv=none; b=P3XLb0Wp6t9getj6kYf+VUGyxgtnVQCmtIIX1ArzjK/LTTlLSif1azskgaPlFBbhF2LwBYpTlC3f5zoex+88X1On0yhL6r2lQYh4Al8+bPPyg58GgtmQFqZqAjdA03gbBC9uPx10FASOR+9/MwK0WIN8ocJ8jI7Yin1NrBqNO2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712435281; c=relaxed/simple;
	bh=HhZRUgwmnAjmi1glSyCQEhhAFBIHkfryjeliSxTRZ9E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Z+YW/YSZokw6QXmAm/k7/znm9sHn1bh6m3m06Hh92obX+vFQzxL8th3y5Iu3u6eC/671Xj769lkzkVORqJBtdkFVpqZEWe0L91jNoevZO0LvEbA8zB18xPvKXfpWQkgoXRRQm8xlakBDNHK1T7Por6uec7iPqfXNz/xek1wEPIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=hQS1weFz; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-22eccfeee22so1128155fac.2
        for <linux-bluetooth@vger.kernel.org>; Sat, 06 Apr 2024 13:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1712435278; x=1713040078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fofRSYfEkpuWKxHS85vk5x3j/+Rl0Y9Qjs8v5qhLDmQ=;
        b=hQS1weFzz8OnJ3JACRIL2ra1qDcELYOE65ZPpkNxoT2jvx/7rNTw3OVDSz2hIIgPI3
         JYFBd2T/FKCeIwQkIp32VMX7YEcByN8VvfzgraGZk3wzbRri4Ah0UrNx1blqaE86DhOf
         LwSxC7Inxh1zXqAeuIArWufeQ29jDvwnOSf5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712435278; x=1713040078;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fofRSYfEkpuWKxHS85vk5x3j/+Rl0Y9Qjs8v5qhLDmQ=;
        b=nVGYN24k6udYqX7K7KEEAbXM9i4UBMycqXrMMk7sFRu55hBPhDy6xQwl+HT5s+u8wI
         1BfjFrnFxvyxUkD/JENrTFjquTpDTF1FAYehaq3l2RoC27mj7aF8/7j+Bmip53XKw08Q
         9Wq8Wfr1lFXGm66wJXNXxR2NykZ2humbbYmTCp1cdn7WfVmdHiF9qp7A9Tl3CEzRc5ku
         RQrE4ckKhxmOqFd4EaLV6zEL0+OYKAaKhFxOYbXjHzK1yBVvDW3FyEF9mqNxHSmOoz1p
         H5UEoUA7E6EBChIN2UIh4cZ+w43UkMBYGn5ZWAkouaCjlZZYTyU2BwKR9D0Skgzc8l3+
         1NLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT1zpophg7u6m2/6l9CY6w1DoaP5Uwh/v3vEypAaoVcaO4wKtML5Y2z14H6j8cNsZKN3eduj+udRE1ezIbnzC6IsNEB8PiI8GAePMUW8NU
X-Gm-Message-State: AOJu0YwS58zWLizvTcfPQqpfsX+RlPIHb8MYfQHkES6VWP5fH7z7dbqE
	vI/yd9JG4eCst2dtsf8KFlMmQlkCZXmricvTnNiNjvSB4xJgHkg4yiK4rw7nDu/eWSPKszvO4EW
	Xuw==
X-Google-Smtp-Source: AGHT+IE+ZpfrLGGq1lZrvg/bM9CvpZVevgAEBO+DKbm7S4oWk3xZ6c3yT9l1OvzlRJ5//g4ym+No8Q==
X-Received: by 2002:a05:6870:c10d:b0:22e:d7be:54cf with SMTP id f13-20020a056870c10d00b0022ed7be54cfmr5613264oad.37.1712435277901;
        Sat, 06 Apr 2024 13:27:57 -0700 (PDT)
Received: from [172.16.102.235] (c-98-45-34-39.hsd1.ca.comcast.net. [98.45.34.39])
        by smtp.gmail.com with ESMTPSA id fa12-20020a056a002d0c00b006e694719fa0sm1684541pfb.147.2024.04.06.13.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Apr 2024 13:27:57 -0700 (PDT)
Message-ID: <1b3d3937-6679-491e-a5c6-818ae8ac639a@penguintechs.org>
Date: Sat, 6 Apr 2024 13:27:56 -0700
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6390 bluetooth doesn't work after warm boot or
 disable/reenable
Content-Language: en-US
From: Wren Turkal <wt@penguintechs.org>
To: ath11k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>
References: <a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org>
 <31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
In-Reply-To: <31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+Kalle Valo since you have the same laptop

On 4/6/24 1:16 PM, Wren Turkal wrote:
> Sorry for the double send on the original message. I am still hoping to 
> get some help. I have added additional info below.
> 
> On 4/4/24 12:14 PM, Wren Turkal wrote:
>> Hey there ath11k/bluetooth folks,
>>
>> I am having a pretty major problem with QCA6930 for some time (maybe a 
>> year or two). I have this bluetooth device:
>>
>> 72:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc QCA6390 
>> Wireless Network Adapter
>>
>> This device appears to be driven by the ath11k module and others. I 
>> hope I am pinging the right lists.
>>
>> I am using Fedora Rawhide. Fully updated yesterday. My uname reports 
>> this:
>>
>> Linux braindead.localdomain 
>> 6.9.0-0.rc2.20240402git026e680b0a08.24.fc41.x86_64 #1 SMP 
>> PREEMPT_DYNAMIC Tue Apr  2 17:51:18 UTC 2024 x86_64 GNU/Linux
> 
> Updated today. Here's the new uname:
> 
> Linux braindead.localdomain 
> 6.9.0-0.rc2.20240405git8cb4a9a82b21.27.fc41.x86_64 #1 SMP 
> PREEMPT_DYNAMIC Fri Apr  5 16:48:07 UTC 2024 x86_64 GNU/Linux
> 
> I also noticed a new version of bluez. Here is the RPM package version: 
> bluez-5.73-3.fc41.x86_64
> 
>> My main bluetooth device is  a Logitech MX 3 Mac mouse that uses 
>> bluetooth. When bluetooth fails, so does the mouse. I have power cycle 
>> my laptop when that happens. I'd love to help find a fix for this.
>>
>> The problem is that I cannot disable and re-enable the bluetooth on my 
>> system. Bluetooth also doesn't work after a warm boot. I have to power 
>> cycle my laptop to recover bluetooth funcitonality. I have tried the 
>> following:
>>
>> * logging into KDE Plasma (bluetooth stops working)
>> * logging into GNOME (works on cold boot, fails on warm boot)
> 
> I did notice that the mouse seems to work in Plasma until a few sec 
> after I see the background image appears. I suspect that Plasma is 
> disabling and reenabling the bluetooth where Gnome does not do that.
> 
>> After logging into GNOME during a cold boot, I have also done 
>> "systemctl restart bluetooth.service". I get these journal logs during 
>> the stop;
>>
>> ➜  bt_kernel_bug cat journal-stop-bluetooth-service.log
>> Apr 04 10:14:41 braindead.localdomain NetworkManager[1120]: <info> 
>> [1712250881.7060] device (F0:5C:77:F2:60:FC): state change: 
>> disconnected -> unmanaged (reason 'removed', sys-iface-state: 'removed')
>> Apr 04 10:14:41 braindead.localdomain systemd[1]: Starting 
>> systemd-rfkill.service - Load/Save RF Kill Switch Status...
>> Apr 04 10:14:41 braindead.localdomain systemd[1]: Started 
>> systemd-rfkill.service - Load/Save RF Kill Switch Status.
>> Apr 04 10:14:41 braindead.localdomain audit[1]: SERVICE_START pid=1 
>> uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
>> msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" 
>> hostname=? addr=? terminal=? res=success'
>> Apr 04 10:14:46 braindead.localdomain systemd[1]: 
>> systemd-rfkill.service: Deactivated successfully.
>> Apr 04 10:14:46 braindead.localdomain audit[1]: SERVICE_STOP pid=1 
>> uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
>> msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" 
>> hostname=? addr=? terminal=? res=success'
>>
>> I get these journal logs during start:
>>
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: setting 
>> up ROME/QCA6390
>> Apr 04 10:15:05 braindead.localdomain systemd[1]: Starting 
>> systemd-rfkill.service - Load/Save RF Kill Switch Status...
>> Apr 04 10:15:05 braindead.localdomain systemd[1]: Started 
>> systemd-rfkill.service - Load/Save RF Kill Switch Status.
>> Apr 04 10:15:05 braindead.localdomain audit[1]: SERVICE_START pid=1 
>> uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
>> msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" 
>> hostname=? addr=? terminal=? res=success'
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Product ID   :0x00000010
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA SOC 
>> Version  :0x400a0200
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA ROM 
>> Version  :0x00000200
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Patch Version:0x00003ac0
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> controller version 0x02000200
>> Apr 04 10:15:05 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Downloading qca/htbtfw20.tlv
>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Failed to send TLV segment (-110)
>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Failed to download patch (-110)
>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: Retry 
>> BT power ON:0
>> Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: command 
>> 0xfc00 tx timeout
>> Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: Reading 
>> QCA version information failed (-110)
>> Apr 04 10:15:08 braindead.localdomain kernel: Bluetooth: hci0: Retry 
>> BT power ON:1
>> Apr 04 10:15:10 braindead.localdomain systemd[1]: 
>> systemd-rfkill.service: Deactivated successfully.
>> Apr 04 10:15:10 braindead.localdomain audit[1]: SERVICE_STOP pid=1 
>> uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
>> msg='unit=systemd-rfkill comm="systemd" exe="/usr/lib/systemd/systemd" 
>> hostname=? addr=? terminal=? res=success'
>> Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: command 
>> 0xfc00 tx timeout
>> Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: Reading 
>> QCA version information failed (-110)
>> Apr 04 10:15:10 braindead.localdomain kernel: Bluetooth: hci0: Retry 
>> BT power ON:2
>> Apr 04 10:15:13 braindead.localdomain bluetoothd[986]: Failed to set 
>> mode: Authentication Failed (0x05)
>> Apr 04 10:15:13 braindead.localdomain kernel: Bluetooth: hci0: command 
>> 0xfc00 tx timeout
>> Apr 04 10:15:13 braindead.localdomain kernel: Bluetooth: hci0: Reading 
>> QCA version information failed (-110)
>> Apr 04 10:15:15 braindead.localdomain chronyd[1065]: Selected source 
>> 204.17.205.8 (2.fedora.pool.ntp.org)
>> Apr 04 10:15:22 braindead.localdomain systemd[1687]: Created slice 
>> background.slice - User Background Tasks Slice.
>> Apr 04 10:15:22 braindead.localdomain systemd[1687]: Starting 
>> systemd-tmpfiles-clean.service - Cleanup of User's Temporary Files and 
>> Directories...
>> Apr 04 10:15:22 braindead.localdomain systemd[1687]: Finished 
>> systemd-tmpfiles-clean.service - Cleanup of User's Temporary Files and 
>> Directories.
>> Apr 04 10:15:38 braindead.localdomain audit: BPF prog-id=86 op=LOAD
>> Apr 04 10:15:38 braindead.localdomain systemd[1]: Starting 
>> plocate-updatedb.service - Update the plocate database...
>> Apr 04 10:15:41 braindead.localdomain systemd[1687]: Started 
>> vte-spawn-21527424-cb2d-479f-af17-22251e2b37a0.scope - VTE child 
>> process 5144 launched by gnome-terminal-server process 4668.
>> Apr 04 10:15:53 braindead.localdomain systemd[1]: 
>> plocate-updatedb.service: Deactivated successfully.
>> Apr 04 10:15:53 braindead.localdomain systemd[1]: Finished 
>> plocate-updatedb.service - Update the plocate database.
>> Apr 04 10:15:53 braindead.localdomain systemd[1]: 
>> plocate-updatedb.service: Consumed 6.802s CPU time.
>> Apr 04 10:15:53 braindead.localdomain audit[1]: SERVICE_START pid=1 
>> uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
>> msg='unit=plocate-updatedb comm="systemd" 
>> exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
>> Apr 04 10:15:53 braindead.localdomain audit[1]: SERVICE_STOP pid=1 
>> uid=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:init_t:s0 
>> msg='unit=plocate-updatedb comm="systemd" 
>> exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
>> Apr 04 10:15:54 braindead.localdomain audit: BPF prog-id=86 op=UNLOAD
>> Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]: 
>> kf.idletime: Could not find any system poller plugin
>> Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]: 
>> qt.core.qobject.connect: QObject::connect(KAbstractIdleTimePoller, 
>> KIdleTime): invalid nullptr parameter
>> Apr 04 10:16:13 braindead.localdomain baloo_file_extractor[5251]: 
>> qt.core.qobject.connect: QObject::connect(KAbstractIdleTimePoller, 
>> KIdleTime): invalid nullptr parameter
>>
>> There's a bunch of errors in those logs starting with these two 
>> seemingly important lines:
>>
>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Failed to send TLV segment (-110)
>> Apr 04 10:15:06 braindead.localdomain kernel: Bluetooth: hci0: QCA 
>> Failed to download patch (-110)
> 
> Logs are mostly unchanges when restarting the bluetooth service after a 
> cold boot with the bluetooth originally working.
> 
>> FWIW, I get similar logs after logging into KDE Plasma. I also get 
>> similar logs after a warm boot.
>>
>> This appears to be some kind of bug in the initialization of the 
>> hardware. Is there any additional information I can provide to help 
>> troubleshoot this problem.
> 
> I will also say that the bluetooth appears to work throught a 
> suspend/resume cycle as long as I don't restart the bluetooth service.
> 
> Oh, and my laptop is a Dell 9310 if that helps.

Kalle, I noticed that you reported having a Dell 9310 in 2021 in a 
message on this very mailing list. Do you happen to still have that 
laptop? If so, so you still test on that laptop at all? I am curious if 
it is having the same issue I am experiencing?

> Is there any other info I could collect that might be useful?
> 
> I'm pretty new to troubleshooting a problem like this and would be happy 
> to have any advice anyone might want to share.
> 
> Thanks,
> wt
> 

-- 
You're more amazing than you think!

