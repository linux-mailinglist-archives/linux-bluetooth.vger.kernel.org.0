Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127783CF6DB
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jul 2021 11:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235277AbhGTIvh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 20 Jul 2021 04:51:37 -0400
Received: from fgw22-4.mail.saunalahti.fi ([62.142.5.109]:39581 "EHLO
        fgw22-4.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234987AbhGTIv0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 20 Jul 2021 04:51:26 -0400
X-Greylist: delayed 967 seconds by postgrey-1.27 at vger.kernel.org; Tue, 20 Jul 2021 04:51:25 EDT
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
        by fgw22.mail.saunalahti.fi (Halon) with ESMTP
        id 15521c28-e93b-11eb-88cb-005056bdf889;
        Tue, 20 Jul 2021 12:15:53 +0300 (EEST)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
        id 6C6CF20089; Tue, 20 Jul 2021 12:15:53 +0300 (EEST)
Date:   Tue, 20 Jul 2021 12:15:53 +0300
From:   Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To:     Pauli Virtanen <pav@iki.fi>
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Hilda Wu <hildawu@realtek.com>
Subject: Re: [PATCH] Bluetooth: btusb: check SCO MTU before enabling USB ALT
 3 for WBS
Message-ID: <20210720091553.GI10625@reaktio.net>
References: <d43dffdc43a40782ec6d5d6c24b1638005992a8f.camel@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d43dffdc43a40782ec6d5d6c24b1638005992a8f.camel@iki.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Pauli,

On Fri, Jul 16, 2021 at 08:58:17PM +0300, Pauli Virtanen wrote:
> Some USB BT adapters don't satisfy the MTU requirement mentioned in
> commit e848dbd364ac ("Bluetooth: btusb: Add support USB ALT 3 for WBS")
> and have ALT 3 setting that produces no/garbled audio. Check that the MTU
> condition is satisfied, and fall back to ALT 1 if not.
> 
> Tested with USB adapters (mtu<72, produce sound only with ALT1)
> BCM20702A1 0b05:17cb, CSR8510A10 0a12:0001, and (mtu>=72, ALT3)
> RTL8761BU 0bda:8771, Intel AX200 8087:0029 (after disabling ALT6).
> 
> Signed-off-by: Pauli Virtanen <pav@iki.fi>
> ---
>

Maybe add a Fixes: tag ?


Thanks,

-- Pasi

>  drivers/bluetooth/btusb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index a9855a2dd561..3ee66e415c4d 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -1763,9 +1763,11 @@ static void btusb_work(struct work_struct *work)
>  			/* Because mSBC frames do not need to be aligned to the
>  			 * SCO packet boundary. If support the Alt 3, use the
>  			 * Alt 3 for HCI payload >= 60 Bytes let air packet
> -			 * data satisfy 60 bytes.
> +			 * data satisfy 60 bytes. USB Alt 3 support also needs
> +			 * HFP transparent MTU >= 72 Bytes.
>  			 */
> -			if (new_alts == 1 && btusb_find_altsetting(data, 3))
> +			if (new_alts == 1 && hdev->sco_mtu >= 72 &&
> +			    btusb_find_altsetting(data, 3))
>  				new_alts = 3;
>  		}
>  
> -- 
> 2.31.1
> 
> 
