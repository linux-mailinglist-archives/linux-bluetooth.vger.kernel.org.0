Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8A0F7DC3
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Nov 2019 19:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730360AbfKKS4C (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 11 Nov 2019 13:56:02 -0500
Received: from hall.aurel32.net ([195.154.113.88]:57786 "EHLO hall.aurel32.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730179AbfKKS4A (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 11 Nov 2019 13:56:00 -0500
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
        by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <aurelien@aurel32.net>)
        id 1iUEr1-00006R-9U
        for linux-bluetooth@vger.kernel.org; Mon, 11 Nov 2019 19:55:59 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.92.3)
        (envelope-from <aurelien@aurel32.net>)
        id 1iUEr0-0000KP-Nv
        for linux-bluetooth@vger.kernel.org; Mon, 11 Nov 2019 19:55:58 +0100
Date:   Mon, 11 Nov 2019 19:55:58 +0100
From:   Aurelien Jarno <aurelien@aurel32.net>
To:     linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH BlueZ] tools/mesh-cfgclient: add network transmit get/set
 commands
Message-ID: <20191111185558.GA30589@aurel32.net>
References: <20191111130043.5247-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191111130043.5247-1-aurelien@aurel32.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On 2019-11-11 14:00, Aurelien Jarno wrote:
> Add network-transmit-get and network-transmit-set commands as per
> Mesh Profile 4.3.2.69, 4.3.2.70 and 4.3.2.71.
> ---
>  tools/mesh/cfgcli.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/tools/mesh/cfgcli.c b/tools/mesh/cfgcli.c
> index a4de42943..adc35f5a7 100644
> --- a/tools/mesh/cfgcli.c
> +++ b/tools/mesh/cfgcli.c
> @@ -621,6 +621,15 @@ static bool msg_recvd(uint16_t src, uint16_t idx, uint8_t *data,
>  				src, mesh_status_str(data[0]));
>  
>  		break;
> +
> +	/* Per Mesh Profile 4.3.2.71 */
> +	case OP_CONFIG_NETWORK_TRANSMIT_STATUS:
> +		if (len != 1)
> +			return true;
> +
> +		bt_shell_printf("Node %4.4x: Network transmit cnt %d, steps %d\n",
> +				src, data[0]>>5, data[0] & 0x1f);

Replying to myself, this is wrong as the Foundation Model Layer uses
little endian ordering. I'll send a v2 and fixes for the existing code.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
