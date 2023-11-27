Return-Path: <linux-bluetooth+bounces-238-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AC67FA41E
	for <lists+linux-bluetooth@lfdr.de>; Mon, 27 Nov 2023 16:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87FB01C20B77
	for <lists+linux-bluetooth@lfdr.de>; Mon, 27 Nov 2023 15:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FCF31A64;
	Mon, 27 Nov 2023 15:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C53A5C6;
	Mon, 27 Nov 2023 07:09:49 -0800 (PST)
Received: from [141.14.220.40] (g40.guest.molgen.mpg.de [141.14.220.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A356D61E5FE01;
	Mon, 27 Nov 2023 16:08:58 +0100 (CET)
Message-ID: <207e13bb-e0d9-49b6-824f-99a8d0944dff@molgen.mpg.de>
Date: Mon, 27 Nov 2023 16:08:58 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: hci_sync: fix BR/EDR wakeup bug
To: 15013537245@163.com
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 Clancy Shang <clancy.shang@quectel.com>
References: <20231127090545.117162-1-15013537245@163.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20231127090545.117162-1-15013537245@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Clancy,


Thank you for the patch.

Am 27.11.23 um 10:05 schrieb 15013537245@163.com:
> From: "clancy.shang" <clancy.shang@quectel.com>

It’d be great, if you spelled your name “Clancy Shang”.

     $ git config --global user.name "Clancy Shang"
     $ git commit -s --amend --author="Clancy Shang 
<clancy.shang@quectel.com>"

> Steam deck in suspending state, but bt controller send hci
> mode change event to host. cause Steam Deck can't into sleep.

Could you please elaborate on the fix little more, for example, mention 
the mode change (0xf7).

> Signed-off-by: clancy.shang <clancy.shang@quectel.com>
> ---
>   net/bluetooth/hci_sync.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index a15ab0b874a9..a26a58cb2c38 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -3800,12 +3800,14 @@ static int hci_set_event_mask_sync(struct hci_dev *hdev)
>   	if (lmp_bredr_capable(hdev)) {
>   		events[4] |= 0x01; /* Flow Specification Complete */
>   
> -		/* Don't set Disconnect Complete when suspended as that
> -		 * would wakeup the host when disconnecting due to
> -		 * suspend.
> +		/* Don't set Disconnect Complete and mode change when
> +		 * suspended as that would wakeup the host when disconnecting
> +		 * due to suspend.
>   		 */
> -		if (hdev->suspended)
> +		if (hdev->suspended) {
>   			events[0] &= 0xef;
> +			events[2] &= 0xf7;
> +		}
>   	} else {
>   		/* Use a different default for LE-only devices */
>   		memset(events, 0, sizeof(events));


Kind regards,

Paul Menzel

