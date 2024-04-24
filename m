Return-Path: <linux-bluetooth+bounces-4028-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DCE8B0E14
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Apr 2024 17:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31A761C2511D
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Apr 2024 15:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA6E15FA6A;
	Wed, 24 Apr 2024 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EKu8xCiE"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A067815ECFA;
	Wed, 24 Apr 2024 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972254; cv=none; b=i3dOLfMgZps/9GHPXtwH9JJrn5M0sngTzRGSgocT0+Mg1AU4Uc6VnjKvO+HBLOxaTsXnfyaEW5+GKs82s+Zl9sBfeEnEmVudXBFsmvFERvVwJAQfYUhnIaiExyTkn2v/Me9uCB4z6t+HtVMoOwaGp6FDVN21BVKcqrZTOrppQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972254; c=relaxed/simple;
	bh=83ac671TJ5C3w8/YTTwK5TvUabe8Q/e9+Zt2/J33mLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZFvULv1om3swLTPeHmKWpgxIMGEVRZ5vatFHmBITDAr3vO+JVYjgWfqazNdS0vil6DFRADBXH1D1fZYLhh4+etzYQQymgKi48Wj0U2gn6Gi5nIZDmQnJhWN9Pq/YjlkkTakYk5Rz2bpEUoa/ppi6W8rYQzvCpahgdVYKKtcVZco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EKu8xCiE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O7cEEF025344;
	Wed, 24 Apr 2024 15:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ODq72kPb9i7MhF+ey4vjvHEqQGg1s8vUIXQbWS97qqo=; b=EK
	u8xCiE5CuO1YP1Sfy+9MvmUosFzw8TGsagBro6l4IZSx5Hh9dj+ffrl0fLtUTyFQ
	WxZBlAFY5w1xc4sGCk/K00uA/lM6Lh6DhVjwQ9Qtgnwacdh5FBu4JDVHRIo7bFEn
	Ecjk30K5GKWfs18R1SieXf0sI7XGRo29lIXN0stgthad6SJiEa1vFMrQv46uo+Nr
	Yjd4s9/ayrW0x4lzaH9ajYMnserxxh2OLah5NaUxiXa9UoHSc4EQI9APnYWn+s+o
	KeAAEUbmVdjcBCobqxlS8ynkzfV/nkBNKR3uvDmrduza93DMcmBnfvZ7aSZZxjBZ
	FbyKFV8uDq6kRaxfNA+Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xpv9fh87x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 15:24:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43OFO6v8009100
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 15:24:06 GMT
Received: from [10.253.14.221] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 24 Apr
 2024 08:24:03 -0700
Message-ID: <d82c2e39-d2b8-4de0-a11a-6ab2420f8f95@quicinc.com>
Date: Wed, 24 Apr 2024 23:24:01 +0800
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Bluetooth: qca: set power_ctrl_enabled on NULL
 returned by gpiod_get_optional()
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Wren
 Turkal <wt@penguintechs.org>
References: <20240424122932.79120-1-brgl@bgdev.pl>
 <0f8ba1b5-490e-4961-80e2-7942f66730ec@linaro.org>
 <CACMJSeuBCkNyaD60qGVpAq91DqD_OA=tCVEY0t+JNK2vcWBc+Q@mail.gmail.com>
Content-Language: en-US
From: quic_zijuhu <quic_zijuhu@quicinc.com>
In-Reply-To: <CACMJSeuBCkNyaD60qGVpAq91DqD_OA=tCVEY0t+JNK2vcWBc+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kZy9dvY7hiai_BfZPYSRhAcGdv9HQ2dW
X-Proofpoint-GUID: kZy9dvY7hiai_BfZPYSRhAcGdv9HQ2dW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_12,2024-04-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 mlxlogscore=818 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404240060

On 4/24/2024 10:52 PM, Bartosz Golaszewski wrote:
> On Wed, 24 Apr 2024 at 16:46, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 24/04/2024 14:29, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>
>>>               qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
>>>               if (IS_ERR(qcadev->susclk)) {
>>> @@ -2355,10 +2360,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>>               qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
>>>                                              GPIOD_OUT_LOW);
>>>               if (IS_ERR(qcadev->bt_en)) {
>>> -                     dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
>>> -                     power_ctrl_enabled = false;
>>> +                     dev_err(&serdev->dev, "failed to acquire enable gpio\n");
>>> +                     return PTR_ERR(qcadev->bt_en);
please think about for QCA2066. if it is returned from here.  BT will
not working at all.  if you don't return here. i will be working fine
for every BT functionality.
NAK again by me.

>>>               }
>>>
>>> +             if (!qcadev->bt_en)
>>> +                     power_ctrl_enabled = false;
>>
>> This looks duplicated - you already have such check earlier.
>>
> 
> It's under a different switch case!
> 
> Bartosz


