Return-Path: <linux-bluetooth+bounces-126-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 495B17F0CFD
	for <lists+linux-bluetooth@lfdr.de>; Mon, 20 Nov 2023 08:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79B7E1C210F9
	for <lists+linux-bluetooth@lfdr.de>; Mon, 20 Nov 2023 07:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2BD27496;
	Mon, 20 Nov 2023 07:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94FB8B5;
	Sun, 19 Nov 2023 23:46:13 -0800 (PST)
Received: from [192.168.0.183] (ip5f5af683.dynamic.kabel-deutschland.de [95.90.246.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0F43B61E5FE01;
	Mon, 20 Nov 2023 08:45:10 +0100 (CET)
Message-ID: <06e1b728-64f8-400b-8a2d-212d67992227@molgen.mpg.de>
Date: Mon, 20 Nov 2023 08:45:08 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-firmware: update firmware for mediatek bluetooth
 chip (MT7921)
To: Chris Lu <chris.lu@mediatek.com>
Cc: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Deren Wu <deren.Wu@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
 Steve Lee <steve.lee@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-firmware@kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20231116081430.28211-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20231116081430.28211-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Chris,


Thank you for the patch.

Am 16.11.23 um 09:14 schrieb Chris Lu:
> Update binary firmware for MT7921 BT devices.
> 
> File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
> Version: 20231109191416

It’d be great if you added the version in the git commit message 
summary/title too. The `linux-firmware` prefix is probably redundant. No 
idea if a tag exists for it. So, maybe:

mediatek: Update BT MT7921 fw from 20230526131214 to 20231109191416

or

Update Mediatek BT MT7921 fw to 20231109191416


Also, it would be great if you added the change-log to the commit 
message, so people have an idea, what improved.

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   WHENCE                                  |   2 +-
>   mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin | Bin 532846 -> 532206 bytes
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/WHENCE b/WHENCE
> index 571308be..eb6b21e9 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5526,7 +5526,7 @@ Licence: Redistributable. See LICENCE.mediatek for details.
>   Driver: mt7921 - MediaTek MT7921 bluetooth chipset
>   
>   File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
> -Version: 20230526131214
> +Version: 20231109191416
>   
>   Licence: Redistributable. See LICENCE.mediatek for details.
>   
> diff --git a/mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin b/mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
> index 4b637d5156f2893ebed13d55e58c1e30e9eb1195..c7a96755b122ef7aa601eb40fbd7abb9ca85a545 100644
> GIT binary patch
> literal 532206

[…]


Kind regards,

Paul

