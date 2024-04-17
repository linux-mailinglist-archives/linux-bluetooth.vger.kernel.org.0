Return-Path: <linux-bluetooth+bounces-3666-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5E88A7FF8
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Apr 2024 11:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35AA62819BF
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Apr 2024 09:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6746113C688;
	Wed, 17 Apr 2024 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hDTGxLAe"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6BE13C3EA
	for <linux-bluetooth@vger.kernel.org>; Wed, 17 Apr 2024 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713346751; cv=none; b=aBrCHN059hf1m5x5B0kJm5bVM6nOW9UZUZxK2ewKd8WrlggJHcp9b3K9lRTHUMG/K6uzIFCv18uNI3RmjXlHiu+vq6EIrxHNyDQApWFcy+V2cVhAZgk3XZTf4JSCMFj9u3zOT15UwpJAdYEr9BYSF+vIVaWa3kodtE6o2a6DZIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713346751; c=relaxed/simple;
	bh=wcho9fj0eyfK4kmysvJFmqL4fJ5qnd0ytBlOblVddJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nW+6y4gmar72uvkamV1Z87z3sgAEXMs+vMjN933M+HvNDVvG2RYDZ6gIMyCoQwnxdi0pZfADyap4C7brLKPd1uusNm8/Zvkf5xhT+1EBt6tAjkaE8QACpWhFYgFNFpdLTQ4Y/agCzIrxoaxh4YvUCNrLBVSKHIz5tl72P8puTNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hDTGxLAe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43H8FYN9013274;
	Wed, 17 Apr 2024 09:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=WNraPd0/H3Vjzig9yF9quPNcioedHhPHPGsYz4xdei0=; b=hD
	TGxLAeV0HYnNZLZ8cXaSOeAeimh48dVYK5ix8CqVXwkatTqREaSVE7/G//bEPxvp
	9FGYFFkKtK83nn8F2PK2FoxjXXSfbJCkGRCxUpAWrj0DPZKL3da72lDxaHgF4moL
	CIE4I0Cwp5cpYVaUzvFf6NNmC0Mb92hzzJbuQ4BGWriSbLN8+tiOs7xOxh5r75Qi
	dT7+1G4be81WAftK9JBE9+g1aX7jKgDhTVQsT17g0XZkSF5gxRd3nh2wuNNWDASU
	2MCH1IsmYii3HarJ/MZd5CiKEKl+x+FbJDwZA8c1pepxC7q4RBXBasta4K8RtiUB
	73cclN5D+7GhvIP+QSJA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xjarpg5xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 09:39:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43H9d4K6031704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 09:39:04 GMT
Received: from [10.253.9.153] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Apr
 2024 02:39:02 -0700
Message-ID: <4313bcc9-8fbf-477d-90f2-013681cdebb9@quicinc.com>
Date: Wed, 17 Apr 2024 17:38:59 +0800
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: qca: Fix nullptr dereference for non-serdev
 devices
To: Johan Hovold <johan@kernel.org>
CC: <luiz.dentz@gmail.com>, <marcel@holtmann.org>,
        <linux-bluetooth@vger.kernel.org>, <johan+linaro@kernel.org>
References: <1713325792-17181-1-git-send-email-quic_zijuhu@quicinc.com>
 <Zh9saGbOl-fXP6SD@hovoldconsulting.com>
 <5e4e62c8-d17f-45fd-9212-088eb026dc7b@quicinc.com>
 <Zh91zq13nZvH3-Yj@hovoldconsulting.com>
 <4dac0caa-629d-4b4d-ad54-f6ab15268524@quicinc.com>
 <Zh-JNzlskY6ZvsSm@hovoldconsulting.com>
Content-Language: en-US
From: quic_zijuhu <quic_zijuhu@quicinc.com>
In-Reply-To: <Zh-JNzlskY6ZvsSm@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -9fH_gA0jpwuwaLhVE8Ms9TI_F6U-PAd
X-Proofpoint-ORIG-GUID: -9fH_gA0jpwuwaLhVE8Ms9TI_F6U-PAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404170066

On 4/17/2024 4:32 PM, Johan Hovold wrote:
> Again, make sure wrap you replies at 72 cols and trim unnecessary
> context:
> 
>   https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions
> 
> On Wed, Apr 17, 2024 at 03:32:51PM +0800, quic_zijuhu wrote:
>> On 4/17/2024 3:10 PM, Johan Hovold wrote:
>>> On Wed, Apr 17, 2024 at 02:51:38PM +0800, quic_zijuhu wrote:
> 
>>>> i have submitted below patches to add supports for all other
>>>> non-serdev controllers.
>>>
>>>> https://patchwork.kernel.org/project/bluetooth/list/?series=844120
>>>
>>> Ok, you need it for some future changes, but I'm afraid that adding new
>>> random vendor specific ioctls like you do in that is series is a no-go.
> 
>> it is a generic ioctl, for QCA, it is used to specific soc_type. it
>> maybe be used by other vendor driver to set user specified info.
> 
> In it's current form it's a vendor specific hack that is never going to
> make it upstream.
>
no, i don't think so.

1)
ioctl()'s designed purpose is to complete such non-standard config.

2) present ioctl HCIUARTGETPROTO which is not exported is used to specify which vendor protocol is used
 is it a a vendor specific hack?

3)
hci_ldisc driver don't touch user specified settings and pass it into vendor driver directly
does it has any problem?

4)
for tool btattach. it does NOT get any board config info from DT|ACPI compared with
formal BT driver. so i introduce a new ioctl to supplement such info when possible
to make btattach work.

 
> For a start, you don't even make sure that the types becomes part of the
> ABI, which means that passing, say, type 5 can mean different things
> depending on the kernel version.
>it is specified by user and ONLY be parsed by vendor device driver.
it is user's responsibility to specify the right value. 
so i also don't check and care about its value and it don't need to change any code
for further added any new soc_types.

moreover, tool attach is mainly used before the final product phase. namely, its is mainly used
by developer and customer's evaluation.
 
> Can't you just retrieve the device type from the device itself? If it's
> already powered, you should not need to know this beforehand1) it is the simplest and lowest risk fix
2) different soc_types have different responses when read its IDS as shown by qca_read_soc_version().
3) the way you mentioned will involve many changes and it also means high risks for many current soc types.
> Johan


