Return-Path: <linux-bluetooth+bounces-3556-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD28A4230
	for <lists+linux-bluetooth@lfdr.de>; Sun, 14 Apr 2024 14:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EB771C20BC0
	for <lists+linux-bluetooth@lfdr.de>; Sun, 14 Apr 2024 12:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B1F3D0D9;
	Sun, 14 Apr 2024 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IcSTXzAE"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C436124
	for <linux-bluetooth@vger.kernel.org>; Sun, 14 Apr 2024 12:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713096312; cv=none; b=Zzb1qjL6+3dnHLObuv73CCNFp6ZcW05T7+gIce/3TYAF+4lJzaIHqoUU98Z9dy5SaJViYAmlWa1Dv0u+uMbd/QXMKhwBUtlQ8DXBMBsayS+gM6ZKnuDw3Wet5Zm9hEo5CT0uWTNXLGlsKC1ZvP4HV7+/E5RHKF0VpGTLlVdn/1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713096312; c=relaxed/simple;
	bh=p69N4Zoq1Yb6i/SKUWND/R7IHLdXzROlOreeLY+xvXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P+vozN8GjW12gvkPyjk+EQVp3OFDAoxYzpQ6Y8RMAqM7iREUpxFS0t9kBrqpPU5W/RuqfHp9G4wI07ApLbXgh1oWvoqux3Lzb3oU3Ygf0It/So8dIzEHuuhhHRspyahaJJghYissYKPdqR0X+NenIM23y2NGaoucA3wkQaJo/+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IcSTXzAE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43EC0SWg018425;
	Sun, 14 Apr 2024 12:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=22lJYmNRgpFbq2bFedNSAgv/pgGV+77TD5kep9FmAJ4=; b=Ic
	STXzAELaJDyXSRsESVfiiNudZ+vGo/l/W9QX/Pbs1R77ijlXMijBSStsYTLbleGL
	hDnfD4WcavNDu5CXRzJCIjENrNHWrnHUeKhTsUNLd+XQz6pgUOXbXNdU1uf3MgWS
	14+it0vqFJN9+V97jVPxyyZy+pX1qSudmvRTN8ybg83fG5crOJWdRgoe4zQcUT4J
	LNBIv1RyAcIPZ7ARZ9/QCoixvI4nnT7oRmp3umvHx37y+PX2TadI07JQm3agAHcq
	/8hVX04gG5T4U1GwDT4L114TTeQIModJRctmN9ErkfOkKr2GWoAv9IFr6brV5eYN
	iBIUGUqRCZvdR+wQXOvQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xfhn41tgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Apr 2024 12:04:51 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43EC4ocZ026502
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Apr 2024 12:04:50 GMT
Received: from [10.253.37.186] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 14 Apr
 2024 05:04:48 -0700
Message-ID: <391980b0-8f44-4b87-83cd-66e46f041c8e@quicinc.com>
Date: Sun, 14 Apr 2024 20:04:46 +0800
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA6390 bluetooth doesn't work after warm boot or
 disable/reenable
To: Wren Turkal <wt@penguintechs.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg
	<johan.hedberg@gmail.com>
CC: <ath11k@lists.infradead.org>, <linux-bluetooth@vger.kernel.org>,
        Kalle
 Valo <kvalo@kernel.org>
References: <a03dace1-ca0f-41d6-8e2c-636e3b053a3a@penguintechs.org>
 <31bb6e18-ecee-49b3-87d7-50ab53e07447@penguintechs.org>
 <1b3d3937-6679-491e-a5c6-818ae8ac639a@penguintechs.org>
 <b592d037-41ed-42e8-8c3c-286eb1a68ceb@penguintechs.org>
 <68a31d6a-8eb8-4d78-819b-fb67367cc41d@penguintechs.org>
 <CABBYNZJQUy37fxWuCXV1OgM+DNnOr7V0h_rkgcSdw-5hF7iauQ@mail.gmail.com>
 <fca46585-c1ed-4a60-91b5-6da39a5bbdec@penguintechs.org>
 <02400664-2d23-42d3-b49b-0c59f606d298@penguintechs.org>
 <8162d6c7-d968-465e-bb8f-3c939eb8d783@penguintechs.org>
 <f7a24b54-9a1f-41f4-8706-d7199a4a84e8@penguintechs.org>
 <b999d783-4912-471e-a978-6c7f0cbcd1e6@penguintechs.org>
Content-Language: en-US
From: quic_zijuhu <quic_zijuhu@quicinc.com>
In-Reply-To: <b999d783-4912-471e-a978-6c7f0cbcd1e6@penguintechs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VGz8ruTTnaKwNdm7kb8iTowp5EdqXLKg
X-Proofpoint-GUID: VGz8ruTTnaKwNdm7kb8iTowp5EdqXLKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-14_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404140087

On 4/13/2024 3:46 AM, Wren Turkal wrote:
> On 4/11/24 1:30 PM, Wren Turkal wrote:
>> On 4/10/24 3:40 PM, Wren Turkal wrote:
>>> On 4/10/24 3:00 PM, Wren Turkal wrote:
>>>> +Johan since he's a former BT drivers maintainer.
>>>>
>>>> On 4/9/24 1:11 PM, Wren Turkal wrote:
>>>>> On 4/9/24 1:03 PM, Luiz Augusto von Dentz wrote:
>>>>>> 5.19 seems a little too old, imo, or has it been broken for that long,
>>>>>> did you at least tried with bluetooth-next? Try contacting the people
>>>>>> who actually wrote the driver.
>>>>>
>>>>> Sorry, I didn't answer your question. Yes, I do think it's been broken for longer than that, but I wanted to confirm.
>>>>
>>>> Okay, so I tried 6.9-rc3 and every main release 5.19-6.8.
>>>>
>>>> I have found the following:
>>>>
>>>> * older kernels (6.3 and before) seem to be far less likely to kill on a cycling the bluetooth service.
>>>> * 6.8/6.9-rcs consistently destroy bluetooth when stopping and restarting the service
>>>> * If I destroy the bluetooth service with a BT service restart in 6.9-rc3 and warm reboot into any release back to 5.19, bluetooth does not work
>>>> * cold boot works in all cases assuming I give the laptop about 5s between power off/on
>>>
>>> I just did another experiment on 6.9-rc3. I blacklisted relevant bluetooth modules and then warm booted without the blacklist. I did this for both the "bluetooth" and "btqca" modules. In both cases, I cold booted with and appropriate "module_blacklist" kernel arg. After the boot, I verified the module was not loaded. I then warm booted without the blacklist, and the bluetooth works, so bluetooth only seems to fail when the linux module code for closing the device is run before a warm boot.
>>
>> And another experiment. I disabled the bluetooth.service and bluetooth.target with systemctl. I then shutdown and cold booted. After logging into GNOME, starting the service. Similar failures show up in the kernel logs as after the failure during a warm boot:
>>
>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Bluetooth management interface 1.22 initialized
>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: src/adapter.c:reset_adv_monitors_complete() Failed to reset Adv Monitors: Failed (0x03)
>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Battery Provider Manager created
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: MGMT ver 1.22
>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: src/device.c:device_set_wake_support() Unable to set wake_support without RPA resolution
>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Failed to clear UUIDs: Failed (0x03)
>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>> Apr 11 13:17:54 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>> Apr 11 13:17:54 braindead.localdomain wireplumber[2139]: org.bluez.GattManager1.RegisterApplication() failed: GDBus.Error:org.freedesktop.DBus.Error.UnknownMethod: Invalid method call
>> Apr 11 13:17:54 braindead.localdomain wireplumber[2139]: org.bluez.GattManager1.RegisterApplication() failed: GDBus.Error:org.freedesktop.DBus.Error.UnknownMethod: Invalid method call
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: setting up ROME/QCA6390
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: RFCOMM TTY layer initialized
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: RFCOMM socket layer initialized
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: RFCOMM ver 1.11
>>
>> ... skip some logs about registering modules in the bluetoothd ...
>>
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA Product ID   :0x00000010
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA SOC Version  :0x400a0200
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA ROM Version  :0x00000200
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA Patch Version:0x00003ac0
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA controller version 0x02000200
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA Downloading qca/htbtfw20.tlv
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA Failed to send TLV segment (-110)
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: QCA Failed to download patch (-110)
>> Apr 11 13:17:54 braindead.localdomain kernel: Bluetooth: hci0: Retry BT power ON:0
>> Apr 11 13:17:57 braindead.localdomain kernel: Bluetooth: hci0: command 0xfc00 tx timeout
>> Apr 11 13:17:57 braindead.localdomain kernel: Bluetooth: hci0: Reading QCA version information failed (-110)
>> Apr 11 13:17:57 braindead.localdomain kernel: Bluetooth: hci0: Retry BT power ON:1
>> Apr 11 13:17:59 braindead.localdomain kernel: Bluetooth: hci0: command 0xfc00 tx timeout
>> Apr 11 13:17:59 braindead.localdomain kernel: Bluetooth: hci0: Reading QCA version information failed (-110)
>> Apr 11 13:17:59 braindead.localdomain kernel: Bluetooth: hci0: Retry BT power ON:2
>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to set mode: Authentication Failed (0x05)
>> Apr 11 13:18:01 braindead.localdomain kernel: Bluetooth: hci0: command 0xfc00 tx timeout
>> Apr 11 13:18:01 braindead.localdomain kernel: Bluetooth: hci0: Reading QCA version information failed (-110)
>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Too small Add Device complete event
>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
>> Apr 11 13:18:01 braindead.localdomain bluetoothd[4408]: Failed to add UUID: Failed (0x03)
> 
> I have captured a full log of my system since boot including debug messages for the hci_hca.c file. Should I attach that log to a message here? In general, I am not totally certain of how I should track the troubleshooting for this problem. Do y'all want it on the mailing list?
> 
>>
>> It looks like the firmware is failing to load. Is there some kind of time limit on loading the firmware after the module is loaded?
>>
>> Why would this work if I allow the service to be started on boot, but not if I wait until after logging into GNOME?
>>
>>>> So, I suspsect that the process of closing out the hardware may be leaving it in a state that the reset cannot handle (and probably never could handle).
>>>>
>>>> I also found that qualcomm has docs here: https://www.qualcomm.com/products/technology/wi-fi/fastconnect/fastconnect-6800#Documentation
>>>>
>>>> However, I am not a member of a Qualcomm verified company (mentioned in the doc links). Luiz, Marcel, or Johan, do you have any contacts that might be able to help me in getting info about the technical docs for this hardware? I would love to see if I can find any issues in how the hardware is being reset.
>>>>
>>>> As an independent dev, I don't even know what it takes to get that kind of access. I would welcome any help here. Hey Qualcomm, are you hiring? :P
>>>>
>>>> wt
>>>
>>
> 
Hi Wren,

1) Apply below patch series
https://patchwork.kernel.org/project/bluetooth/list/?series=844357

2) Disable BT

3) Power off

4) Power on

5) enable more logs
echo "module hci_uart  +pft" > /sys/kernel/debug/dynamic_debug/control
echo "module btqca  +pft" > /sys/kernel/debug/dynamic_debug/control

6) enable BT

7) then check this issue again. several disable/enable or reboot cycles.

