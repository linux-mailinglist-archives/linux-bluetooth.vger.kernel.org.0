Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4ACF134464
	for <lists+linux-bluetooth@lfdr.de>; Wed,  8 Jan 2020 14:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgAHN5c (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 8 Jan 2020 08:57:32 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34462 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgAHN5b (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 8 Jan 2020 08:57:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id t2so3523434wrr.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 08 Jan 2020 05:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Tjibdcrm0F2gBrVSaGaYRxNAqKq2VCoLQH5KirTsjuc=;
        b=m/kaMwLbBcSL4lPor8Mo+VgfcRizesHQjejcmUNPWa7XkwV5ZIn7hrCEOLYXHV9/T8
         AaorCkeLtPS27njH+cQJo1u7AjgxISd32W4iSFFzARbEBSavlQnGrJCL1+RmIuxT1/V9
         EYPiqhCCxh3giok7xWROLKif3J9WBqOWxHUSYERvNjIB4pLaQOVgoAWB1wgDn7N/cp8Q
         HrcG/pYdnG8SQgS4r0w4ZaOZ+aZ4otAmnLWRyQCl4LOoZrfCY4PUhSiPeeKtzqoBKh+r
         dxN7riv+TNU9KNrl55J3szBIMR2vXJqksOoHTGffMk69SAmPkAk7inrwmVnwG/M5ps9W
         UZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Tjibdcrm0F2gBrVSaGaYRxNAqKq2VCoLQH5KirTsjuc=;
        b=mbX9WBGKAmSIx9/jWtRtosVEIeTqgon9vWoTtzjtvNtAG1R1kyMf0Mes5cFtSH4WbV
         +XuNjSjqyPDmLB42WjNXyXFtgV6eOj0dUpwpKjQ6j232xXmWIbXtSwCxdjaXUkUa8p7a
         nODrBEiJc60FDA3OOCUMrY0lUdZVol5eVmQffJPlz0G/MilNssaD+4jtmdzKoRMtiqdW
         WoS5+s71pI2JyoElsGv0t0+sy/puA7WiQZhnRPkRCgAwhh73MaicwsLCBtgPwl/RLi6o
         VDta6FFim/EIMZ5m7OS+ji/qUI0E8xS54yqyK6ffb7QTo5Y4YTZRMs/lCjtTuQtuPQI7
         G1vw==
X-Gm-Message-State: APjAAAWvS+9fph9osZGnI2XjuH0r9g64hBJl1nrv+S4JkHByske1pLTx
        2Lo75x2q2HLIrubzisjDoDuEFQ==
X-Google-Smtp-Source: APXvYqx0hay0UMpM7/Vwis+yM8OlqmCCEDSkMJxGOVcZg7bXXpcCn/9V1E3VQGokgXSL6zJJcnAMOA==
X-Received: by 2002:a5d:404b:: with SMTP id w11mr4973101wrp.171.1578491850026;
        Wed, 08 Jan 2020 05:57:30 -0800 (PST)
Received: from netronome.com ([2001:982:756:703:d63d:7eff:fe99:ac9d])
        by smtp.gmail.com with ESMTPSA id p15sm3678288wma.40.2020.01.08.05.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 05:57:29 -0800 (PST)
Date:   Wed, 8 Jan 2020 14:57:28 +0100
From:   Simon Horman <simon.horman@netronome.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: remove redundant assignment to variable icid
Message-ID: <20200108135728.GA19220@netronome.com>
References: <20200107180013.124501-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107180013.124501-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tue, Jan 07, 2020 at 06:00:13PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable icid is being rc is assigned with a value that is never
> read. The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Simon Horman <simon.horman@netronome.com>

> ---
>  net/bluetooth/l2cap_core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 1bca608e0170..195459a1e53e 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -5081,7 +5081,6 @@ static inline int l2cap_move_channel_req(struct l2cap_conn *conn,
>  	chan->move_role = L2CAP_MOVE_ROLE_RESPONDER;
>  	l2cap_move_setup(chan);
>  	chan->move_id = req->dest_amp_id;
> -	icid = chan->dcid;
>  
>  	if (req->dest_amp_id == AMP_ID_BREDR) {
>  		/* Moving to BR/EDR */
> -- 
> 2.24.0
> 
