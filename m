Return-Path: <linux-bluetooth+bounces-4093-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0E38B31B8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Apr 2024 09:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98A1A281EA1
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Apr 2024 07:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0398113C8EF;
	Fri, 26 Apr 2024 07:55:31 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AE413B298;
	Fri, 26 Apr 2024 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714118130; cv=none; b=OzaFjzxdeN6DTZtnB2DtHxy4OGBFnKYF+PS8lM+sUDJnY4nsz3TfxtUKiY04T3VARsQlpcKPIYT1Qgtoqrc1NZ/WUnHaqpv1vvfhT4mvVT64cq3oN95QqKjiNKqFY3lZxpvJoBrQ4mHbS5esryqksuawRmvdwzMEw9Me3pNkswA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714118130; c=relaxed/simple;
	bh=Rm3DpWjzaOSI5jpO9QOE4lLk4IsUne5anO/l6tOeE0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTxeYRH/gjBp9OUFLPkyIq3UDIyfUWQQrRK3w8iLQk2ZH0XopxkfQMGm2R0xqZqRXfDn0RB/5s8YinxpG6/2oTQVRJAnVhivIF7d8GM/Q1Yb1z01vJIZwNVBs6aTsvzocndYoD5bdpfJZ8dZo2e8LUw4La8zzc8QPV3X2bPr6RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.224] (ip5f5aeb7e.dynamic.kabel-deutschland.de [95.90.235.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id C0C0061E5FE06;
	Fri, 26 Apr 2024 09:55:04 +0200 (CEST)
Message-ID: <a062a503-4dc9-43b1-8ccf-e2c91c3e27df@molgen.mpg.de>
Date: Fri, 26 Apr 2024 09:55:01 +0200
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: L2CAP: Fix slab-use-after-free in
 l2cap_send_cmd
To: Sungwoo Kim <iam@sung-woo.kim>
Cc: daveti@purdue.edu, johan.hedberg@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 luiz.dentz@gmail.com, marcel@holtmann.org
References: <20240426072006.358802-1-iam@sung-woo.kim>
 <20240426073142.363876-1-iam@sung-woo.kim>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240426073142.363876-1-iam@sung-woo.kim>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Sungwoo,


Am 26.04.24 um 09:31 schrieb Sungwoo Kim:
> Wrong call trace was attached. The correct one is below.
> Sorry!

No problem, thank you for noticing. Please send a v2, so people using 
automatic tools can just use those.


Kind regards,

Paul

