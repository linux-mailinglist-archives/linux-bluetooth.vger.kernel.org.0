Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF6138956B
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 May 2021 20:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhESScG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 19 May 2021 14:32:06 -0400
Received: from mga05.intel.com ([192.55.52.43]:63133 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230429AbhESScF (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 19 May 2021 14:32:05 -0400
IronPort-SDR: VtCRChp2oGvc/TdYB4BPuEW8+GBKwT4YwWmbpKcDl6blkhofgrUr7Zg5hlsEezR6ZiiW4cXdzL
 UZAcko104ZFA==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="286577001"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="286577001"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 11:30:45 -0700
IronPort-SDR: LWJoMuhyIaVjxauJG/K42plzCvW4V7b2tfJnOehYgh4zLuVy513jHXyrduoyUU48y68pP6iUMO
 1/M55rgnU7Ow==
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208";a="411842060"
Received: from cprasad-mobl.amr.corp.intel.com ([10.209.98.227])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2021 11:30:45 -0700
Message-ID: <d09fc978849b33606d169a24f7405b31e334b066.camel@linux.intel.com>
Subject: Re: [PATCH BlueZ v2 1/5] mesh: Fix delivery of PB-ACK to acceptors
From:   Tedd Ho-Jeong An <tedd.an@linux.intel.com>
To:     Brian Gix <brian.gix@intel.com>, linux-bluetooth@vger.kernel.org
Cc:     inga.stotland@intel.com
Date:   Wed, 19 May 2021 11:30:44 -0700
In-Reply-To: <20210519182150.1680987-2-brian.gix@intel.com>
References: <20210519182150.1680987-1-brian.gix@intel.com>
         <20210519182150.1680987-2-brian.gix@intel.com>
Organization: Intel Corporation
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Brian,

On Wed, 2021-05-19 at 11:21 -0700, Brian Gix wrote:
> Rwmove unneeded initialization that prevented the Acceptor roll of ever

Normally checkpatch.pl is good at catching a typo but it couldn't catch "Rwmove".

> recognizing a valid PB-ACK.
> ---
>  mesh/pb-adv.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/mesh/pb-adv.c b/mesh/pb-adv.c
> index c74dae79f..83f922aa8 100644
> --- a/mesh/pb-adv.c
> +++ b/mesh/pb-adv.c
> @@ -358,7 +358,6 @@ static void pb_adv_packet(void *user_data, const uint8_t *pkt, uint16_t len)
>  		first = !session->link_id;
>  		session->link_id = link_id;
>  		session->last_peer_trans_num = 0xFF;
> -		session->local_acked = 0xFF;
>  		session->peer_trans_num = 0x00;
>  		session->local_trans_num = 0x7F;
>  		session->opened = true;

Regards,
Tedd

